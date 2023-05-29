
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00006117          	auipc	sp,0x6
    80000004:	a4813103          	ld	sp,-1464(sp) # 80005a48 <_GLOBAL_OFFSET_TABLE_+0x10>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	7c9010ef          	jal	ra,80001fe4 <start>

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
    addi sp, sp, -256
    800010f0:	f0010113          	addi	sp,sp,-256
    800010f4:	00008067          	ret
	...

0000000080001100 <interruptHandler>:
.extern interruptHandleRoutine
.align 4    #poravnanje adrese na 4 bajta, poslednja dva bita adrese su 00
.global interruptHandler #izvozi globalno ime interruptHandler
interruptHandler:
    #cuvanje svih registara
    addi sp, sp, -256
    80001100:	f0010113          	addi	sp,sp,-256
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    # x0 - x31
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

    addi fp, sp, 0 #frame pointer
    80001184:	00010413          	mv	s0,sp

    call interruptRoutine
    80001188:	700000ef          	jal	ra,80001888 <interruptRoutine>
    #call interruptHandleRoutine

    sd x10, 10 * 8(fp) #da se ne pregazi a0
    8000118c:	04a43823          	sd	a0,80(s0)

    #ucitavanje svih registara
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    # x0 - x31
    .endr
    80001190:	00013003          	ld	zero,0(sp)
    80001194:	00813083          	ld	ra,8(sp)
    80001198:	01013103          	ld	sp,16(sp)
    8000119c:	01813183          	ld	gp,24(sp)
    800011a0:	02013203          	ld	tp,32(sp)
    800011a4:	02813283          	ld	t0,40(sp)
    800011a8:	03013303          	ld	t1,48(sp)
    800011ac:	03813383          	ld	t2,56(sp)
    800011b0:	04013403          	ld	s0,64(sp)
    800011b4:	04813483          	ld	s1,72(sp)
    800011b8:	05013503          	ld	a0,80(sp)
    800011bc:	05813583          	ld	a1,88(sp)
    800011c0:	06013603          	ld	a2,96(sp)
    800011c4:	06813683          	ld	a3,104(sp)
    800011c8:	07013703          	ld	a4,112(sp)
    800011cc:	07813783          	ld	a5,120(sp)
    800011d0:	08013803          	ld	a6,128(sp)
    800011d4:	08813883          	ld	a7,136(sp)
    800011d8:	09013903          	ld	s2,144(sp)
    800011dc:	09813983          	ld	s3,152(sp)
    800011e0:	0a013a03          	ld	s4,160(sp)
    800011e4:	0a813a83          	ld	s5,168(sp)
    800011e8:	0b013b03          	ld	s6,176(sp)
    800011ec:	0b813b83          	ld	s7,184(sp)
    800011f0:	0c013c03          	ld	s8,192(sp)
    800011f4:	0c813c83          	ld	s9,200(sp)
    800011f8:	0d013d03          	ld	s10,208(sp)
    800011fc:	0d813d83          	ld	s11,216(sp)
    80001200:	0e013e03          	ld	t3,224(sp)
    80001204:	0e813e83          	ld	t4,232(sp)
    80001208:	0f013f03          	ld	t5,240(sp)
    8000120c:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001210:	10010113          	addi	sp,sp,256

    80001214:	10200073          	sret
	...

0000000080001220 <interruptHandleRoutine>:
.global interruptHandleRoutine
interruptHandleRoutine:

    80001220:	00008067          	ret

0000000080001224 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>:
.global _ZN3TCB13contextSwitchEPNS_7ContextES1_
.type _ZN3TCB13contextSwitchEPNS_7ContextES1_, @function
_ZN3TCB13contextSwitchEPNS_7ContextES1_:
	# a0 = adresa od oldContext
	# a1 = adresa od newContext
	sd ra, 0 * 8(a0)
    80001224:	00153023          	sd	ra,0(a0) # 1000 <_entry-0x7ffff000>
	sd sp, 1 * 8(a0)
    80001228:	00253423          	sd	sp,8(a0)

	ld ra, 0 * 8(a1)
    8000122c:	0005b083          	ld	ra,0(a1)
    ld sp, 1 * 8(a1)
    80001230:	0085b103          	ld	sp,8(a1)

    80001234:	00008067          	ret

0000000080001238 <_Z9mem_allocm>:

inline void scall() {
	__asm__ volatile("ecall");
}

void* mem_alloc(size_t size) {
    80001238:	ff010113          	addi	sp,sp,-16
    8000123c:	00813423          	sd	s0,8(sp)
    80001240:	01010413          	addi	s0,sp,16
	//size je u bajtovima, pretvara se u blokove
	size = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
    80001244:	00655793          	srli	a5,a0,0x6
    80001248:	03f57513          	andi	a0,a0,63
    8000124c:	00050463          	beqz	a0,80001254 <_Z9mem_allocm+0x1c>
    80001250:	00100513          	li	a0,1
    80001254:	00a78533          	add	a0,a5,a0
	__asm__ volatile("mv a1, %[size]": :[size] "r"(size));
    80001258:	00050593          	mv	a1,a0
inline void Riscv::w_sstatus(uint64 sstatus) {
	__asm__ volatile("csrw sstatus, %[sstatus]": :[sstatus] "r"(sstatus));
}

inline void Riscv::loadOpCode(uint64 opCode) {
	__asm__ volatile("mv a0, %[code]": :[code] "r"(opCode));
    8000125c:	00100793          	li	a5,1
    80001260:	00078513          	mv	a0,a5
	__asm__ volatile("ecall");
    80001264:	00000073          	ecall
	Riscv::loadOpCode(0x01);

	scall();

	void* ret;
	__asm__ volatile("mv %[ptr], a0":[ptr] "=r"(ret));
    80001268:	00050513          	mv	a0,a0
	return ret;
}
    8000126c:	00813403          	ld	s0,8(sp)
    80001270:	01010113          	addi	sp,sp,16
    80001274:	00008067          	ret

0000000080001278 <_Z8mem_freePv>:

int mem_free(void* ptr) {
    80001278:	ff010113          	addi	sp,sp,-16
    8000127c:	00813423          	sd	s0,8(sp)
    80001280:	01010413          	addi	s0,sp,16
	__asm__ volatile("mv a1, %[ptr]": :[ptr] "r"(ptr));
    80001284:	00050593          	mv	a1,a0
    80001288:	00200793          	li	a5,2
    8000128c:	00078513          	mv	a0,a5
	__asm__ volatile("ecall");
    80001290:	00000073          	ecall
	Riscv::loadOpCode(0x02);

	scall();

	int status;
	__asm__ volatile("mv %[status], a0":[status] "=r"(status));
    80001294:	00050513          	mv	a0,a0
	return status;
}
    80001298:	0005051b          	sext.w	a0,a0
    8000129c:	00813403          	ld	s0,8(sp)
    800012a0:	01010113          	addi	sp,sp,16
    800012a4:	00008067          	ret

00000000800012a8 <_Z13thread_createPP3TCBPFvPvES2_>:

int thread_create(thread_t* handle, void (* start_routine)(void*), void* arg) {
    800012a8:	fd010113          	addi	sp,sp,-48
    800012ac:	02113423          	sd	ra,40(sp)
    800012b0:	02813023          	sd	s0,32(sp)
    800012b4:	00913c23          	sd	s1,24(sp)
    800012b8:	01213823          	sd	s2,16(sp)
    800012bc:	01313423          	sd	s3,8(sp)
    800012c0:	03010413          	addi	s0,sp,48
    800012c4:	00050913          	mv	s2,a0
    800012c8:	00058493          	mv	s1,a1
    800012cc:	00060993          	mv	s3,a2
//	__asm__ volatile("mv s1, a1");
//	__asm__ volatile("mv s2, a2");
//	__asm__ volatile("mv s3, a3");
	uint64* stack = (start_routine != nullptr ? (uint64*)MemoryAllocator::kmalloc(DEFAULT_STACK_SIZE) : nullptr);
    800012d0:	04058663          	beqz	a1,8000131c <_Z13thread_createPP3TCBPFvPvES2_+0x74>
    800012d4:	00001537          	lui	a0,0x1
    800012d8:	00001097          	auipc	ra,0x1
    800012dc:	a44080e7          	jalr	-1468(ra) # 80001d1c <_ZN15MemoryAllocator7kmallocEm>
	__asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack));
    800012e0:	00050713          	mv	a4,a0
//	__asm__ volatile("mv a3, s3");
//	__asm__ volatile("mv a2, s2");
//	__asm__ volatile("mv a1, s1");
	__asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg));
    800012e4:	00098693          	mv	a3,s3
	__asm__ volatile("mv a2, %[function]": :[function] "r"(start_routine));
    800012e8:	00048613          	mv	a2,s1
	__asm__ volatile("mv a1, %[handle]": :[handle] "r"(handle));
    800012ec:	00090593          	mv	a1,s2

	__asm__ volatile("li a0, 0x11");
    800012f0:	01100513          	li	a0,17
	__asm__ volatile("ecall");
    800012f4:	00000073          	ecall
	//Riscv::loadOpCode(0x11);

	scall();

	int status;
	__asm__ volatile("mv %[status], a0":[status] "=r"(status));
    800012f8:	00050513          	mv	a0,a0
	return status;
}
    800012fc:	0005051b          	sext.w	a0,a0
    80001300:	02813083          	ld	ra,40(sp)
    80001304:	02013403          	ld	s0,32(sp)
    80001308:	01813483          	ld	s1,24(sp)
    8000130c:	01013903          	ld	s2,16(sp)
    80001310:	00813983          	ld	s3,8(sp)
    80001314:	03010113          	addi	sp,sp,48
    80001318:	00008067          	ret
	uint64* stack = (start_routine != nullptr ? (uint64*)MemoryAllocator::kmalloc(DEFAULT_STACK_SIZE) : nullptr);
    8000131c:	00000513          	li	a0,0
    80001320:	fc1ff06f          	j	800012e0 <_Z13thread_createPP3TCBPFvPvES2_+0x38>

0000000080001324 <_Z11thread_exitv>:

int thread_exit() {
    80001324:	ff010113          	addi	sp,sp,-16
    80001328:	00813423          	sd	s0,8(sp)
    8000132c:	01010413          	addi	s0,sp,16
	return 0;
}
    80001330:	00000513          	li	a0,0
    80001334:	00813403          	ld	s0,8(sp)
    80001338:	01010113          	addi	sp,sp,16
    8000133c:	00008067          	ret

0000000080001340 <_Z15thread_dispatchv>:

void thread_dispatch() {
    80001340:	ff010113          	addi	sp,sp,-16
    80001344:	00813423          	sd	s0,8(sp)
    80001348:	01010413          	addi	s0,sp,16

}
    8000134c:	00813403          	ld	s0,8(sp)
    80001350:	01010113          	addi	sp,sp,16
    80001354:	00008067          	ret

0000000080001358 <_Z11thread_joinP3TCB>:

void thread_join(thread_t handle) {
    80001358:	ff010113          	addi	sp,sp,-16
    8000135c:	00813423          	sd	s0,8(sp)
    80001360:	01010413          	addi	s0,sp,16

}
    80001364:	00813403          	ld	s0,8(sp)
    80001368:	01010113          	addi	sp,sp,16
    8000136c:	00008067          	ret

0000000080001370 <_Z10time_sleepm>:

int time_sleep(time_t) {
    80001370:	ff010113          	addi	sp,sp,-16
    80001374:	00813423          	sd	s0,8(sp)
    80001378:	01010413          	addi	s0,sp,16
	return 0;
}
    8000137c:	00000513          	li	a0,0
    80001380:	00813403          	ld	s0,8(sp)
    80001384:	01010113          	addi	sp,sp,16
    80001388:	00008067          	ret

000000008000138c <_Z8sem_openPP4_semj>:

int sem_open(sem_t* handle, unsigned int init) {
    8000138c:	ff010113          	addi	sp,sp,-16
    80001390:	00813423          	sd	s0,8(sp)
    80001394:	01010413          	addi	s0,sp,16
	return 0;
}
    80001398:	00000513          	li	a0,0
    8000139c:	00813403          	ld	s0,8(sp)
    800013a0:	01010113          	addi	sp,sp,16
    800013a4:	00008067          	ret

00000000800013a8 <_Z9sem_closeP4_sem>:

int sem_close(sem_t handle) {
    800013a8:	ff010113          	addi	sp,sp,-16
    800013ac:	00813423          	sd	s0,8(sp)
    800013b0:	01010413          	addi	s0,sp,16
	return 0;
}
    800013b4:	00000513          	li	a0,0
    800013b8:	00813403          	ld	s0,8(sp)
    800013bc:	01010113          	addi	sp,sp,16
    800013c0:	00008067          	ret

00000000800013c4 <_Z8sem_waitP4_sem>:

int sem_wait(sem_t id) {
    800013c4:	ff010113          	addi	sp,sp,-16
    800013c8:	00813423          	sd	s0,8(sp)
    800013cc:	01010413          	addi	s0,sp,16
	return 0;
}
    800013d0:	00000513          	li	a0,0
    800013d4:	00813403          	ld	s0,8(sp)
    800013d8:	01010113          	addi	sp,sp,16
    800013dc:	00008067          	ret

00000000800013e0 <_Z10sem_signalP4_sem>:

int sem_signal(sem_t id) {
    800013e0:	ff010113          	addi	sp,sp,-16
    800013e4:	00813423          	sd	s0,8(sp)
    800013e8:	01010413          	addi	s0,sp,16
	return 0;
}
    800013ec:	00000513          	li	a0,0
    800013f0:	00813403          	ld	s0,8(sp)
    800013f4:	01010113          	addi	sp,sp,16
    800013f8:	00008067          	ret

00000000800013fc <_Z4getcv>:

char getc() {
    800013fc:	ff010113          	addi	sp,sp,-16
    80001400:	00813423          	sd	s0,8(sp)
    80001404:	01010413          	addi	s0,sp,16
	return 0;
}
    80001408:	00000513          	li	a0,0
    8000140c:	00813403          	ld	s0,8(sp)
    80001410:	01010113          	addi	sp,sp,16
    80001414:	00008067          	ret

0000000080001418 <_Z4putcc>:

void putc(char) {
    80001418:	ff010113          	addi	sp,sp,-16
    8000141c:	00813423          	sd	s0,8(sp)
    80001420:	01010413          	addi	s0,sp,16

}
    80001424:	00813403          	ld	s0,8(sp)
    80001428:	01010113          	addi	sp,sp,16
    8000142c:	00008067          	ret

0000000080001430 <_Z11printStringPKc>:
#include "../h/helper.hpp"
#include "../lib/console.h"
#include "../h/Riscv.hpp"

void printString(char const *string) {
    80001430:	fd010113          	addi	sp,sp,-48
    80001434:	02113423          	sd	ra,40(sp)
    80001438:	02813023          	sd	s0,32(sp)
    8000143c:	00913c23          	sd	s1,24(sp)
    80001440:	01213823          	sd	s2,16(sp)
    80001444:	03010413          	addi	s0,sp,48
    80001448:	00050493          	mv	s1,a0
	__asm__ volatile("csrr %[sstatus], sstatus": [sstatus] "=r"(sstatus));
    8000144c:	100027f3          	csrr	a5,sstatus
    80001450:	fcf43c23          	sd	a5,-40(s0)
	return sstatus;
    80001454:	fd843903          	ld	s2,-40(s0)
    uint64 oldMask = Riscv::r_sstatus() & Riscv::SSTATUS_SIE;
    80001458:	00297913          	andi	s2,s2,2
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    8000145c:	00200793          	li	a5,2
    80001460:	1007b073          	csrc	sstatus,a5
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    while (*string != '\0') {
    80001464:	0004c503          	lbu	a0,0(s1)
    80001468:	00050a63          	beqz	a0,8000147c <_Z11printStringPKc+0x4c>
        __putc(*string);
    8000146c:	00003097          	auipc	ra,0x3
    80001470:	c40080e7          	jalr	-960(ra) # 800040ac <__putc>
        string++;
    80001474:	00148493          	addi	s1,s1,1
    while (*string != '\0') {
    80001478:	fedff06f          	j	80001464 <_Z11printStringPKc+0x34>
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    8000147c:	10092073          	csrs	sstatus,s2
    }
    Riscv::ms_sstatus(oldMask);
}
    80001480:	02813083          	ld	ra,40(sp)
    80001484:	02013403          	ld	s0,32(sp)
    80001488:	01813483          	ld	s1,24(sp)
    8000148c:	01013903          	ld	s2,16(sp)
    80001490:	03010113          	addi	sp,sp,48
    80001494:	00008067          	ret

0000000080001498 <_Z7printlnPKc>:

void println(char const *string) {
    80001498:	fd010113          	addi	sp,sp,-48
    8000149c:	02113423          	sd	ra,40(sp)
    800014a0:	02813023          	sd	s0,32(sp)
    800014a4:	00913c23          	sd	s1,24(sp)
    800014a8:	03010413          	addi	s0,sp,48
	__asm__ volatile("csrr %[sstatus], sstatus": [sstatus] "=r"(sstatus));
    800014ac:	100027f3          	csrr	a5,sstatus
    800014b0:	fcf43c23          	sd	a5,-40(s0)
	return sstatus;
    800014b4:	fd843483          	ld	s1,-40(s0)
    uint64 oldMask = Riscv::r_sstatus() & Riscv::SSTATUS_SIE;
    800014b8:	0024f493          	andi	s1,s1,2
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    800014bc:	00200793          	li	a5,2
    800014c0:	1007b073          	csrc	sstatus,a5
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    printString(string);
    800014c4:	00000097          	auipc	ra,0x0
    800014c8:	f6c080e7          	jalr	-148(ra) # 80001430 <_Z11printStringPKc>
    __putc('\n');
    800014cc:	00a00513          	li	a0,10
    800014d0:	00003097          	auipc	ra,0x3
    800014d4:	bdc080e7          	jalr	-1060(ra) # 800040ac <__putc>
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    800014d8:	1004a073          	csrs	sstatus,s1
    Riscv::ms_sstatus(oldMask);
}
    800014dc:	02813083          	ld	ra,40(sp)
    800014e0:	02013403          	ld	s0,32(sp)
    800014e4:	01813483          	ld	s1,24(sp)
    800014e8:	03010113          	addi	sp,sp,48
    800014ec:	00008067          	ret

00000000800014f0 <_Z12printIntegerm>:

void printInteger(uint64 integer) {
    800014f0:	fc010113          	addi	sp,sp,-64
    800014f4:	02113c23          	sd	ra,56(sp)
    800014f8:	02813823          	sd	s0,48(sp)
    800014fc:	02913423          	sd	s1,40(sp)
    80001500:	03213023          	sd	s2,32(sp)
    80001504:	04010413          	addi	s0,sp,64
	__asm__ volatile("csrr %[sstatus], sstatus": [sstatus] "=r"(sstatus));
    80001508:	100027f3          	csrr	a5,sstatus
    8000150c:	fcf43423          	sd	a5,-56(s0)
	return sstatus;
    80001510:	fc843903          	ld	s2,-56(s0)
    uint64 oldMask = Riscv::r_sstatus() & Riscv::SSTATUS_SIE;
    80001514:	00297913          	andi	s2,s2,2
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80001518:	00200793          	li	a5,2
    8000151c:	1007b073          	csrc	sstatus,a5
    neg = 0;
    if (integer < 0) {
        neg = 1;
        x = -integer;
    } else {
        x = integer;
    80001520:	0005051b          	sext.w	a0,a0
    }

    i = 0;
    80001524:	00000493          	li	s1,0
    do {
        buf[i++] = digits[x % 10];
    80001528:	00a00613          	li	a2,10
    8000152c:	02c5773b          	remuw	a4,a0,a2
    80001530:	02071693          	slli	a3,a4,0x20
    80001534:	0206d693          	srli	a3,a3,0x20
    80001538:	00004717          	auipc	a4,0x4
    8000153c:	ae870713          	addi	a4,a4,-1304 # 80005020 <_ZZ12printIntegermE6digits>
    80001540:	00d70733          	add	a4,a4,a3
    80001544:	00074703          	lbu	a4,0(a4)
    80001548:	fe040693          	addi	a3,s0,-32
    8000154c:	009687b3          	add	a5,a3,s1
    80001550:	0014849b          	addiw	s1,s1,1
    80001554:	fee78823          	sb	a4,-16(a5)
    } while ((x /= 10) != 0);
    80001558:	0005071b          	sext.w	a4,a0
    8000155c:	02c5553b          	divuw	a0,a0,a2
    80001560:	00900793          	li	a5,9
    80001564:	fce7e2e3          	bltu	a5,a4,80001528 <_Z12printIntegerm+0x38>
    if (neg) buf[i++] = '-';

    while (--i >= 0) {
    80001568:	fff4849b          	addiw	s1,s1,-1
    8000156c:	0004ce63          	bltz	s1,80001588 <_Z12printIntegerm+0x98>
        __putc(buf[i]);
    80001570:	fe040793          	addi	a5,s0,-32
    80001574:	009787b3          	add	a5,a5,s1
    80001578:	ff07c503          	lbu	a0,-16(a5)
    8000157c:	00003097          	auipc	ra,0x3
    80001580:	b30080e7          	jalr	-1232(ra) # 800040ac <__putc>
    80001584:	fe5ff06f          	j	80001568 <_Z12printIntegerm+0x78>
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80001588:	10092073          	csrs	sstatus,s2
    }
    Riscv::ms_sstatus(oldMask);
}
    8000158c:	03813083          	ld	ra,56(sp)
    80001590:	03013403          	ld	s0,48(sp)
    80001594:	02813483          	ld	s1,40(sp)
    80001598:	02013903          	ld	s2,32(sp)
    8000159c:	04010113          	addi	sp,sp,64
    800015a0:	00008067          	ret

00000000800015a4 <_Z41__static_initialization_and_destruction_0ii>:
	readyThreads.addLast(thread);
}

TCB* Scheduler::get() {
	return readyThreads.removeFirst();
}
    800015a4:	ff010113          	addi	sp,sp,-16
    800015a8:	00813423          	sd	s0,8(sp)
    800015ac:	01010413          	addi	s0,sp,16
    800015b0:	00100793          	li	a5,1
    800015b4:	00f50863          	beq	a0,a5,800015c4 <_Z41__static_initialization_and_destruction_0ii+0x20>
    800015b8:	00813403          	ld	s0,8(sp)
    800015bc:	01010113          	addi	sp,sp,16
    800015c0:	00008067          	ret
    800015c4:	000107b7          	lui	a5,0x10
    800015c8:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    800015cc:	fef596e3          	bne	a1,a5,800015b8 <_Z41__static_initialization_and_destruction_0ii+0x14>
	};

	Elem* head, * tail;
	uint64 numOfElements;
public:
	List() : head(nullptr), tail(nullptr), numOfElements(0) {}
    800015d0:	00004797          	auipc	a5,0x4
    800015d4:	4e078793          	addi	a5,a5,1248 # 80005ab0 <_ZN9Scheduler12readyThreadsE>
    800015d8:	0007b023          	sd	zero,0(a5)
    800015dc:	0007b423          	sd	zero,8(a5)
    800015e0:	0007b823          	sd	zero,16(a5)
    800015e4:	fd5ff06f          	j	800015b8 <_Z41__static_initialization_and_destruction_0ii+0x14>

00000000800015e8 <_ZN9Scheduler3putEP3TCB>:
void Scheduler::put(TCB* thread) {
    800015e8:	fe010113          	addi	sp,sp,-32
    800015ec:	00113c23          	sd	ra,24(sp)
    800015f0:	00813823          	sd	s0,16(sp)
    800015f4:	00913423          	sd	s1,8(sp)
    800015f8:	02010413          	addi	s0,sp,32
    800015fc:	00050493          	mv	s1,a0
		if (!tail) { tail = head; }
		numOfElements++;
	}

	void addLast(T* data) {
		Elem* elem = new Elem(data, nullptr);
    80001600:	01000513          	li	a0,16
    80001604:	00000097          	auipc	ra,0x0
    80001608:	15c080e7          	jalr	348(ra) # 80001760 <_Znwm>
		Elem(T* data, Elem* next) : data(data), next(next) {}
    8000160c:	00953023          	sd	s1,0(a0) # 1000 <_entry-0x7ffff000>
    80001610:	00053423          	sd	zero,8(a0)
		if (tail) {
    80001614:	00004797          	auipc	a5,0x4
    80001618:	4a47b783          	ld	a5,1188(a5) # 80005ab8 <_ZN9Scheduler12readyThreadsE+0x8>
    8000161c:	02078c63          	beqz	a5,80001654 <_ZN9Scheduler3putEP3TCB+0x6c>
			tail->next = elem;
    80001620:	00a7b423          	sd	a0,8(a5)
			tail = elem;
    80001624:	00004797          	auipc	a5,0x4
    80001628:	48a7ba23          	sd	a0,1172(a5) # 80005ab8 <_ZN9Scheduler12readyThreadsE+0x8>
		} else {
			head = tail = elem;
		}
		numOfElements++;
    8000162c:	00004717          	auipc	a4,0x4
    80001630:	48470713          	addi	a4,a4,1156 # 80005ab0 <_ZN9Scheduler12readyThreadsE>
    80001634:	01073783          	ld	a5,16(a4)
    80001638:	00178793          	addi	a5,a5,1
    8000163c:	00f73823          	sd	a5,16(a4)
}
    80001640:	01813083          	ld	ra,24(sp)
    80001644:	01013403          	ld	s0,16(sp)
    80001648:	00813483          	ld	s1,8(sp)
    8000164c:	02010113          	addi	sp,sp,32
    80001650:	00008067          	ret
			head = tail = elem;
    80001654:	00004797          	auipc	a5,0x4
    80001658:	45c78793          	addi	a5,a5,1116 # 80005ab0 <_ZN9Scheduler12readyThreadsE>
    8000165c:	00a7b423          	sd	a0,8(a5)
    80001660:	00a7b023          	sd	a0,0(a5)
    80001664:	fc9ff06f          	j	8000162c <_ZN9Scheduler3putEP3TCB+0x44>

0000000080001668 <_ZN9Scheduler3getEv>:
TCB* Scheduler::get() {
    80001668:	fe010113          	addi	sp,sp,-32
    8000166c:	00113c23          	sd	ra,24(sp)
    80001670:	00813823          	sd	s0,16(sp)
    80001674:	00913423          	sd	s1,8(sp)
    80001678:	02010413          	addi	s0,sp,32
	}

	T* removeFirst() {
		if (!head) { return nullptr; }
    8000167c:	00004517          	auipc	a0,0x4
    80001680:	43453503          	ld	a0,1076(a0) # 80005ab0 <_ZN9Scheduler12readyThreadsE>
    80001684:	04050c63          	beqz	a0,800016dc <_ZN9Scheduler3getEv+0x74>

		Elem* elem = head;
		head = head->next;
    80001688:	00853783          	ld	a5,8(a0)
    8000168c:	00004717          	auipc	a4,0x4
    80001690:	42f73223          	sd	a5,1060(a4) # 80005ab0 <_ZN9Scheduler12readyThreadsE>
		if (!head) { tail = nullptr; }
    80001694:	02078e63          	beqz	a5,800016d0 <_ZN9Scheduler3getEv+0x68>

		T* ret = elem->data;
    80001698:	00053483          	ld	s1,0(a0)
		delete elem;
    8000169c:	00000097          	auipc	ra,0x0
    800016a0:	114080e7          	jalr	276(ra) # 800017b0 <_ZdlPv>
		numOfElements--;
    800016a4:	00004717          	auipc	a4,0x4
    800016a8:	40c70713          	addi	a4,a4,1036 # 80005ab0 <_ZN9Scheduler12readyThreadsE>
    800016ac:	01073783          	ld	a5,16(a4)
    800016b0:	fff78793          	addi	a5,a5,-1
    800016b4:	00f73823          	sd	a5,16(a4)
}
    800016b8:	00048513          	mv	a0,s1
    800016bc:	01813083          	ld	ra,24(sp)
    800016c0:	01013403          	ld	s0,16(sp)
    800016c4:	00813483          	ld	s1,8(sp)
    800016c8:	02010113          	addi	sp,sp,32
    800016cc:	00008067          	ret
		if (!head) { tail = nullptr; }
    800016d0:	00004797          	auipc	a5,0x4
    800016d4:	3e07b423          	sd	zero,1000(a5) # 80005ab8 <_ZN9Scheduler12readyThreadsE+0x8>
    800016d8:	fc1ff06f          	j	80001698 <_ZN9Scheduler3getEv+0x30>
		if (!head) { return nullptr; }
    800016dc:	00050493          	mv	s1,a0
	return readyThreads.removeFirst();
    800016e0:	fd9ff06f          	j	800016b8 <_ZN9Scheduler3getEv+0x50>

00000000800016e4 <_GLOBAL__sub_I__ZN9Scheduler12readyThreadsE>:
}
    800016e4:	ff010113          	addi	sp,sp,-16
    800016e8:	00113423          	sd	ra,8(sp)
    800016ec:	00813023          	sd	s0,0(sp)
    800016f0:	01010413          	addi	s0,sp,16
    800016f4:	000105b7          	lui	a1,0x10
    800016f8:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    800016fc:	00100513          	li	a0,1
    80001700:	00000097          	auipc	ra,0x0
    80001704:	ea4080e7          	jalr	-348(ra) # 800015a4 <_Z41__static_initialization_and_destruction_0ii>
    80001708:	00813083          	ld	ra,8(sp)
    8000170c:	00013403          	ld	s0,0(sp)
    80001710:	01010113          	addi	sp,sp,16
    80001714:	00008067          	ret

0000000080001718 <_Z5nit1fPv>:
//void dispatch() {
//	__asm__ volatile ("mv %[savedPC], ra":[savedPC] "=r"(temp));
//	__asm__ volatile("mv ra, %[fAddress]": : [fAddress] "r"(&f));
//}

void nit1f(void*){
    80001718:	ff010113          	addi	sp,sp,-16
    8000171c:	00113423          	sd	ra,8(sp)
    80001720:	00813023          	sd	s0,0(sp)
    80001724:	01010413          	addi	s0,sp,16
	println("usao u nit 1");
    80001728:	00004517          	auipc	a0,0x4
    8000172c:	90850513          	addi	a0,a0,-1784 # 80005030 <_ZZ12printIntegermE6digits+0x10>
    80001730:	00000097          	auipc	ra,0x0
    80001734:	d68080e7          	jalr	-664(ra) # 80001498 <_Z7printlnPKc>
	TCB::dispatch();
    80001738:	00000097          	auipc	ra,0x0
    8000173c:	4e8080e7          	jalr	1256(ra) # 80001c20 <_ZN3TCB8dispatchEv>
	println("opet u niti 1");
    80001740:	00004517          	auipc	a0,0x4
    80001744:	90050513          	addi	a0,a0,-1792 # 80005040 <_ZZ12printIntegermE6digits+0x20>
    80001748:	00000097          	auipc	ra,0x0
    8000174c:	d50080e7          	jalr	-688(ra) # 80001498 <_Z7printlnPKc>
}
    80001750:	00813083          	ld	ra,8(sp)
    80001754:	00013403          	ld	s0,0(sp)
    80001758:	01010113          	addi	sp,sp,16
    8000175c:	00008067          	ret

0000000080001760 <_Znwm>:
void* operator new(size_t size) {
    80001760:	ff010113          	addi	sp,sp,-16
    80001764:	00113423          	sd	ra,8(sp)
    80001768:	00813023          	sd	s0,0(sp)
    8000176c:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    80001770:	00000097          	auipc	ra,0x0
    80001774:	ac8080e7          	jalr	-1336(ra) # 80001238 <_Z9mem_allocm>
}
    80001778:	00813083          	ld	ra,8(sp)
    8000177c:	00013403          	ld	s0,0(sp)
    80001780:	01010113          	addi	sp,sp,16
    80001784:	00008067          	ret

0000000080001788 <_Znam>:
void* operator new[](size_t size) {
    80001788:	ff010113          	addi	sp,sp,-16
    8000178c:	00113423          	sd	ra,8(sp)
    80001790:	00813023          	sd	s0,0(sp)
    80001794:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    80001798:	00000097          	auipc	ra,0x0
    8000179c:	aa0080e7          	jalr	-1376(ra) # 80001238 <_Z9mem_allocm>
}
    800017a0:	00813083          	ld	ra,8(sp)
    800017a4:	00013403          	ld	s0,0(sp)
    800017a8:	01010113          	addi	sp,sp,16
    800017ac:	00008067          	ret

00000000800017b0 <_ZdlPv>:
void operator delete(void* ptr)noexcept {
    800017b0:	ff010113          	addi	sp,sp,-16
    800017b4:	00113423          	sd	ra,8(sp)
    800017b8:	00813023          	sd	s0,0(sp)
    800017bc:	01010413          	addi	s0,sp,16
mem_free(ptr);
    800017c0:	00000097          	auipc	ra,0x0
    800017c4:	ab8080e7          	jalr	-1352(ra) # 80001278 <_Z8mem_freePv>
}
    800017c8:	00813083          	ld	ra,8(sp)
    800017cc:	00013403          	ld	s0,0(sp)
    800017d0:	01010113          	addi	sp,sp,16
    800017d4:	00008067          	ret

00000000800017d8 <_ZdaPv>:
void operator delete[](void* ptr)noexcept {
    800017d8:	ff010113          	addi	sp,sp,-16
    800017dc:	00113423          	sd	ra,8(sp)
    800017e0:	00813023          	sd	s0,0(sp)
    800017e4:	01010413          	addi	s0,sp,16
mem_free(ptr);
    800017e8:	00000097          	auipc	ra,0x0
    800017ec:	a90080e7          	jalr	-1392(ra) # 80001278 <_Z8mem_freePv>
}
    800017f0:	00813083          	ld	ra,8(sp)
    800017f4:	00013403          	ld	s0,0(sp)
    800017f8:	01010113          	addi	sp,sp,16
    800017fc:	00008067          	ret

0000000080001800 <main>:
int main() {
    80001800:	fe010113          	addi	sp,sp,-32
    80001804:	00113c23          	sd	ra,24(sp)
    80001808:	00813823          	sd	s0,16(sp)
    8000180c:	02010413          	addi	s0,sp,32
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80001810:	00200793          	li	a5,2
    80001814:	1007b073          	csrc	sstatus,a5
	//zabrani prekide
	Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
	//postavi adresu prekidne rutine u stvec
	Riscv::w_stvec((uint64)&interruptHandler);
    80001818:	00004717          	auipc	a4,0x4
    8000181c:	24873703          	ld	a4,584(a4) # 80005a60 <_GLOBAL_OFFSET_TABLE_+0x28>
	__asm__ volatile("csrw stvec, %[stvec]": :[stvec] "r"(stvec));
    80001820:	10571073          	csrw	stvec,a4
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80001824:	1007a073          	csrs	sstatus,a5
//	println("");

	//testiranje kreiranja niti
	thread_t glavnaNit;
	thread_t nit1;
	thread_create(&glavnaNit, nullptr, nullptr);
    80001828:	00000613          	li	a2,0
    8000182c:	00000593          	li	a1,0
    80001830:	fe840513          	addi	a0,s0,-24
    80001834:	00000097          	auipc	ra,0x0
    80001838:	a74080e7          	jalr	-1420(ra) # 800012a8 <_Z13thread_createPP3TCBPFvPvES2_>
	TCB::running = glavnaNit;
    8000183c:	00004797          	auipc	a5,0x4
    80001840:	2147b783          	ld	a5,532(a5) # 80005a50 <_GLOBAL_OFFSET_TABLE_+0x18>
    80001844:	fe843703          	ld	a4,-24(s0)
    80001848:	00e7b023          	sd	a4,0(a5)
	thread_create(&nit1, nit1f, nullptr);
    8000184c:	00000613          	li	a2,0
    80001850:	00000597          	auipc	a1,0x0
    80001854:	ec858593          	addi	a1,a1,-312 # 80001718 <_Z5nit1fPv>
    80001858:	fe040513          	addi	a0,s0,-32
    8000185c:	00000097          	auipc	ra,0x0
    80001860:	a4c080e7          	jalr	-1460(ra) # 800012a8 <_Z13thread_createPP3TCBPFvPvES2_>
	println("");
    80001864:	00004517          	auipc	a0,0x4
    80001868:	97c50513          	addi	a0,a0,-1668 # 800051e0 <_ZZ12printIntegermE6digits+0x1c0>
    8000186c:	00000097          	auipc	ra,0x0
    80001870:	c2c080e7          	jalr	-980(ra) # 80001498 <_Z7printlnPKc>
	return 0;
    80001874:	00000513          	li	a0,0
    80001878:	01813083          	ld	ra,24(sp)
    8000187c:	01013403          	ld	s0,16(sp)
    80001880:	02010113          	addi	sp,sp,32
    80001884:	00008067          	ret

0000000080001888 <interruptRoutine>:
#include "../h/Riscv.hpp"
#include "../h/syscall_c.hpp"
#include "../h/TCB.hpp"
#pragma GCC optimize("O0")

extern "C" void interruptRoutine() {
    80001888:	f7010113          	addi	sp,sp,-144
    8000188c:	08113423          	sd	ra,136(sp)
    80001890:	08813023          	sd	s0,128(sp)
    80001894:	09010413          	addi	s0,sp,144
	uint64 scause = Riscv::r_scause();
    80001898:	00000097          	auipc	ra,0x0
    8000189c:	250080e7          	jalr	592(ra) # 80001ae8 <_ZN5Riscv8r_scauseEv>
    800018a0:	fea43423          	sd	a0,-24(s0)
	uint64 sepc = Riscv::r_sepc();
    800018a4:	00000097          	auipc	ra,0x0
    800018a8:	268080e7          	jalr	616(ra) # 80001b0c <_ZN5Riscv6r_sepcEv>
    800018ac:	fea43023          	sd	a0,-32(s0)
	uint64 a0 ;
	uint64 a1, a2, a3, a4, a5;
	__asm__ volatile("mv %[ax], a0":[ax] "=r"(a0): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800018b0:	00050313          	mv	t1,a0
    800018b4:	fc643c23          	sd	t1,-40(s0)
	__asm__ volatile("mv %[ax], a1":[ax] "=r"(a1): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800018b8:	00058313          	mv	t1,a1
    800018bc:	fc643823          	sd	t1,-48(s0)
	__asm__ volatile("mv %[ax], a2":[ax] "=r"(a2): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800018c0:	00060313          	mv	t1,a2
    800018c4:	fc643423          	sd	t1,-56(s0)
	__asm__ volatile("mv %[ax], a3":[ax] "=r"(a3): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800018c8:	00068313          	mv	t1,a3
    800018cc:	fc643023          	sd	t1,-64(s0)
	__asm__ volatile("mv %[ax], a4":[ax] "=r"(a4): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800018d0:	00070313          	mv	t1,a4
    800018d4:	fa643c23          	sd	t1,-72(s0)
	__asm__ volatile("mv %[ax], a5":[ax] "=r"(a5): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800018d8:	00078313          	mv	t1,a5
    800018dc:	fa643823          	sd	t1,-80(s0)

	if (scause == 0x09 || scause == 0x08) {
    800018e0:	fe843703          	ld	a4,-24(s0)
    800018e4:	00900793          	li	a5,9
    800018e8:	00f70863          	beq	a4,a5,800018f8 <interruptRoutine+0x70>
    800018ec:	fe843703          	ld	a4,-24(s0)
    800018f0:	00800793          	li	a5,8
    800018f4:	14f71a63          	bne	a4,a5,80001a48 <interruptRoutine+0x1c0>
		//prekid zbog poziva ecall
		uint64 opCode = a0;
    800018f8:	fd843783          	ld	a5,-40(s0)
    800018fc:	faf43423          	sd	a5,-88(s0)
		//__asm__ volatile("mv %[op], a0":[op] "=r"(opCode));

		switch (opCode) {
    80001900:	fa843703          	ld	a4,-88(s0)
    80001904:	04200793          	li	a5,66
    80001908:	0ce7e463          	bltu	a5,a4,800019d0 <interruptRoutine+0x148>
    8000190c:	fa843783          	ld	a5,-88(s0)
    80001910:	00279713          	slli	a4,a5,0x2
    80001914:	00003797          	auipc	a5,0x3
    80001918:	79878793          	addi	a5,a5,1944 # 800050ac <_ZZ12printIntegermE6digits+0x8c>
    8000191c:	00f707b3          	add	a5,a4,a5
    80001920:	0007a783          	lw	a5,0(a5)
    80001924:	0007871b          	sext.w	a4,a5
    80001928:	00003797          	auipc	a5,0x3
    8000192c:	78478793          	addi	a5,a5,1924 # 800050ac <_ZZ12printIntegermE6digits+0x8c>
    80001930:	00f707b3          	add	a5,a4,a5
    80001934:	00078067          	jr	a5
			case 0x01:
				//mem_alloc
				size_t size;
				size = (size_t)a1;
    80001938:	fd043783          	ld	a5,-48(s0)
    8000193c:	f6f43c23          	sd	a5,-136(s0)
				//__asm__ volatile("mv %[size], a1":[size] "=r"(size));
				size = size * MEM_BLOCK_SIZE;
    80001940:	f7843783          	ld	a5,-136(s0)
    80001944:	00679793          	slli	a5,a5,0x6
    80001948:	f6f43c23          	sd	a5,-136(s0)
				MemoryAllocator::kmalloc(size);
    8000194c:	f7843503          	ld	a0,-136(s0)
    80001950:	00000097          	auipc	ra,0x0
    80001954:	3cc080e7          	jalr	972(ra) # 80001d1c <_ZN15MemoryAllocator7kmallocEm>
				break;
    80001958:	0d40006f          	j	80001a2c <interruptRoutine+0x1a4>
			case 0x02:
				//mem_free
				void* ptr;
				ptr = (void*)a1;
    8000195c:	fd043783          	ld	a5,-48(s0)
    80001960:	f8f43023          	sd	a5,-128(s0)
				//__asm__ volatile("mv %[ptr], a1" :[ptr]"=r"(ptr));
				MemoryAllocator::kfree(ptr);
    80001964:	f8043503          	ld	a0,-128(s0)
    80001968:	00000097          	auipc	ra,0x0
    8000196c:	55c080e7          	jalr	1372(ra) # 80001ec4 <_ZN15MemoryAllocator5kfreeEPv>
				break;
    80001970:	0bc0006f          	j	80001a2c <interruptRoutine+0x1a4>
			case 0x11:
				//thread_create
				thread_t* handle;
				handle = (thread_t*)a1;
    80001974:	fd043783          	ld	a5,-48(s0)
    80001978:	faf43023          	sd	a5,-96(s0)
				void (* function)(void*);
				function = (void (*)(void*))a2;
    8000197c:	fc843783          	ld	a5,-56(s0)
    80001980:	f8f43c23          	sd	a5,-104(s0)
				void* args;
				args = (void*)a3;
    80001984:	fc043783          	ld	a5,-64(s0)
    80001988:	f8f43823          	sd	a5,-112(s0)
				uint64* sp;
				sp = (uint64*)a4;
    8000198c:	fb843783          	ld	a5,-72(s0)
    80001990:	f8f43423          	sd	a5,-120(s0)
//				__asm__ volatile("mv %[handle], a1":[handle]"=r"(handle));
//				__asm__ volatile("mv %[f], a2":[f]"=r"(function));
//				__asm__ volatile("mv %[args], a3":[args]"=r"(args));
//				__asm__ volatile("mv %[sp], a4":[sp]"=r"(sp));

				*handle = TCB::createThread(function, args, sp);
    80001994:	f8843603          	ld	a2,-120(s0)
    80001998:	f9043583          	ld	a1,-112(s0)
    8000199c:	f9843503          	ld	a0,-104(s0)
    800019a0:	00000097          	auipc	ra,0x0
    800019a4:	1c8080e7          	jalr	456(ra) # 80001b68 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    800019a8:	00050713          	mv	a4,a0
    800019ac:	fa043783          	ld	a5,-96(s0)
    800019b0:	00e7b023          	sd	a4,0(a5)
				if (*handle != nullptr) {
    800019b4:	fa043783          	ld	a5,-96(s0)
    800019b8:	0007b783          	ld	a5,0(a5)
    800019bc:	00078663          	beqz	a5,800019c8 <interruptRoutine+0x140>
					__asm__ volatile("li a0, 0");
    800019c0:	00000513          	li	a0,0
				} else {
					__asm__ volatile("li a0, -1");
				}
				break;
    800019c4:	0680006f          	j	80001a2c <interruptRoutine+0x1a4>
					__asm__ volatile("li a0, -1");
    800019c8:	fff00513          	li	a0,-1
				break;
    800019cc:	0600006f          	j	80001a2c <interruptRoutine+0x1a4>
				break;
			case 0x42:
				//putc
				break;
			default:
				printString("Nepostojeci op code: ");
    800019d0:	00003517          	auipc	a0,0x3
    800019d4:	68050513          	addi	a0,a0,1664 # 80005050 <_ZZ12printIntegermE6digits+0x30>
    800019d8:	00000097          	auipc	ra,0x0
    800019dc:	a58080e7          	jalr	-1448(ra) # 80001430 <_Z11printStringPKc>
				printInteger(opCode);
    800019e0:	fa843503          	ld	a0,-88(s0)
    800019e4:	00000097          	auipc	ra,0x0
    800019e8:	b0c080e7          	jalr	-1268(ra) # 800014f0 <_Z12printIntegerm>
				printString("\nscause: ");
    800019ec:	00003517          	auipc	a0,0x3
    800019f0:	67c50513          	addi	a0,a0,1660 # 80005068 <_ZZ12printIntegermE6digits+0x48>
    800019f4:	00000097          	auipc	ra,0x0
    800019f8:	a3c080e7          	jalr	-1476(ra) # 80001430 <_Z11printStringPKc>
				printInteger(scause);
    800019fc:	fe843503          	ld	a0,-24(s0)
    80001a00:	00000097          	auipc	ra,0x0
    80001a04:	af0080e7          	jalr	-1296(ra) # 800014f0 <_Z12printIntegerm>
				printString("\nsepc: ");
    80001a08:	00003517          	auipc	a0,0x3
    80001a0c:	67050513          	addi	a0,a0,1648 # 80005078 <_ZZ12printIntegermE6digits+0x58>
    80001a10:	00000097          	auipc	ra,0x0
    80001a14:	a20080e7          	jalr	-1504(ra) # 80001430 <_Z11printStringPKc>
				printInteger(sepc);
    80001a18:	fe043503          	ld	a0,-32(s0)
    80001a1c:	00000097          	auipc	ra,0x0
    80001a20:	ad4080e7          	jalr	-1324(ra) # 800014f0 <_Z12printIntegerm>
				break;
    80001a24:	0080006f          	j	80001a2c <interruptRoutine+0x1a4>
				break;
    80001a28:	00000013          	nop
		}
		//sepc pokazuje na ecall instrukciju, treba preci na sledecu instrukciju
		Riscv::w_sepc(sepc + 4);
    80001a2c:	fe043783          	ld	a5,-32(s0)
    80001a30:	00478793          	addi	a5,a5,4
    80001a34:	00078513          	mv	a0,a5
    80001a38:	00000097          	auipc	ra,0x0
    80001a3c:	0f8080e7          	jalr	248(ra) # 80001b30 <_ZN5Riscv6w_sepcEm>
    80001a40:	00000013          	nop
		printString("scause: ");
		printInteger(scause);
		printString("\nsepc: ");
		printInteger(sepc);
	}
}
    80001a44:	0900006f          	j	80001ad4 <interruptRoutine+0x24c>
	} else if (scause == (1UL << 63 | 9)) {
    80001a48:	fe843703          	ld	a4,-24(s0)
    80001a4c:	fff00793          	li	a5,-1
    80001a50:	03f79793          	slli	a5,a5,0x3f
    80001a54:	00978793          	addi	a5,a5,9
    80001a58:	00f71863          	bne	a4,a5,80001a68 <interruptRoutine+0x1e0>
		console_handler();
    80001a5c:	00002097          	auipc	ra,0x2
    80001a60:	6c4080e7          	jalr	1732(ra) # 80004120 <console_handler>
}
    80001a64:	0700006f          	j	80001ad4 <interruptRoutine+0x24c>
	} else if (scause == (1UL << 63 | 1)) {
    80001a68:	fe843703          	ld	a4,-24(s0)
    80001a6c:	fff00793          	li	a5,-1
    80001a70:	03f79793          	slli	a5,a5,0x3f
    80001a74:	00178793          	addi	a5,a5,1
    80001a78:	00f71a63          	bne	a4,a5,80001a8c <interruptRoutine+0x204>
		Riscv::mc_sip(Riscv::SIP_SSIP);
    80001a7c:	00200513          	li	a0,2
    80001a80:	00000097          	auipc	ra,0x0
    80001a84:	0cc080e7          	jalr	204(ra) # 80001b4c <_ZN5Riscv6mc_sipEm>
}
    80001a88:	04c0006f          	j	80001ad4 <interruptRoutine+0x24c>
		println("\nGreska u prekidnoj rutini");
    80001a8c:	00003517          	auipc	a0,0x3
    80001a90:	5f450513          	addi	a0,a0,1524 # 80005080 <_ZZ12printIntegermE6digits+0x60>
    80001a94:	00000097          	auipc	ra,0x0
    80001a98:	a04080e7          	jalr	-1532(ra) # 80001498 <_Z7printlnPKc>
		printString("scause: ");
    80001a9c:	00003517          	auipc	a0,0x3
    80001aa0:	60450513          	addi	a0,a0,1540 # 800050a0 <_ZZ12printIntegermE6digits+0x80>
    80001aa4:	00000097          	auipc	ra,0x0
    80001aa8:	98c080e7          	jalr	-1652(ra) # 80001430 <_Z11printStringPKc>
		printInteger(scause);
    80001aac:	fe843503          	ld	a0,-24(s0)
    80001ab0:	00000097          	auipc	ra,0x0
    80001ab4:	a40080e7          	jalr	-1472(ra) # 800014f0 <_Z12printIntegerm>
		printString("\nsepc: ");
    80001ab8:	00003517          	auipc	a0,0x3
    80001abc:	5c050513          	addi	a0,a0,1472 # 80005078 <_ZZ12printIntegermE6digits+0x58>
    80001ac0:	00000097          	auipc	ra,0x0
    80001ac4:	970080e7          	jalr	-1680(ra) # 80001430 <_Z11printStringPKc>
		printInteger(sepc);
    80001ac8:	fe043503          	ld	a0,-32(s0)
    80001acc:	00000097          	auipc	ra,0x0
    80001ad0:	a24080e7          	jalr	-1500(ra) # 800014f0 <_Z12printIntegerm>
}
    80001ad4:	00000013          	nop
    80001ad8:	08813083          	ld	ra,136(sp)
    80001adc:	08013403          	ld	s0,128(sp)
    80001ae0:	09010113          	addi	sp,sp,144
    80001ae4:	00008067          	ret

0000000080001ae8 <_ZN5Riscv8r_scauseEv>:
inline uint64 Riscv::r_scause() {
    80001ae8:	fe010113          	addi	sp,sp,-32
    80001aec:	00813c23          	sd	s0,24(sp)
    80001af0:	02010413          	addi	s0,sp,32
	__asm__ volatile("csrr %[scause], scause": [scause] "=r"(scause));
    80001af4:	142027f3          	csrr	a5,scause
    80001af8:	fef43423          	sd	a5,-24(s0)
	return scause;
    80001afc:	fe843503          	ld	a0,-24(s0)
}
    80001b00:	01813403          	ld	s0,24(sp)
    80001b04:	02010113          	addi	sp,sp,32
    80001b08:	00008067          	ret

0000000080001b0c <_ZN5Riscv6r_sepcEv>:
inline uint64 Riscv::r_sepc() {
    80001b0c:	fe010113          	addi	sp,sp,-32
    80001b10:	00813c23          	sd	s0,24(sp)
    80001b14:	02010413          	addi	s0,sp,32
	__asm__ volatile("csrr %[sepc], sepc": [sepc] "=r"(sepc));
    80001b18:	141027f3          	csrr	a5,sepc
    80001b1c:	fef43423          	sd	a5,-24(s0)
	return sepc;
    80001b20:	fe843503          	ld	a0,-24(s0)
}
    80001b24:	01813403          	ld	s0,24(sp)
    80001b28:	02010113          	addi	sp,sp,32
    80001b2c:	00008067          	ret

0000000080001b30 <_ZN5Riscv6w_sepcEm>:
inline void Riscv::w_sepc(uint64 sepc) {
    80001b30:	ff010113          	addi	sp,sp,-16
    80001b34:	00813423          	sd	s0,8(sp)
    80001b38:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    80001b3c:	14151073          	csrw	sepc,a0
}
    80001b40:	00813403          	ld	s0,8(sp)
    80001b44:	01010113          	addi	sp,sp,16
    80001b48:	00008067          	ret

0000000080001b4c <_ZN5Riscv6mc_sipEm>:
inline void Riscv::mc_sip(uint64 mask) {
    80001b4c:	ff010113          	addi	sp,sp,-16
    80001b50:	00813423          	sd	s0,8(sp)
    80001b54:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sip, %[mask]": :[mask] "r"(mask));
    80001b58:	14453073          	csrc	sip,a0
}
    80001b5c:	00813403          	ld	s0,8(sp)
    80001b60:	01010113          	addi	sp,sp,16
    80001b64:	00008067          	ret

0000000080001b68 <_ZN3TCB12createThreadEPFvPvES0_Pm>:
#include "../h/Riscv.hpp"

TCB* TCB::running = nullptr;
uint64 TCB::runningTimeSlice = 0;

TCB* TCB::createThread(TCB::Body function, void* args, uint64* stack) {
    80001b68:	fd010113          	addi	sp,sp,-48
    80001b6c:	02113423          	sd	ra,40(sp)
    80001b70:	02813023          	sd	s0,32(sp)
    80001b74:	00913c23          	sd	s1,24(sp)
    80001b78:	01213823          	sd	s2,16(sp)
    80001b7c:	01313423          	sd	s3,8(sp)
    80001b80:	01413023          	sd	s4,0(sp)
    80001b84:	03010413          	addi	s0,sp,48
    80001b88:	00050993          	mv	s3,a0
    80001b8c:	00058a13          	mv	s4,a1
    80001b90:	00060913          	mv	s2,a2
	TCB* newThread = new TCB(function, args, stack);
    80001b94:	03800513          	li	a0,56
    80001b98:	00000097          	auipc	ra,0x0
    80001b9c:	bc8080e7          	jalr	-1080(ra) # 80001760 <_Znwm>
    80001ba0:	00050493          	mv	s1,a0
	uint64 timeSlice;        //vremenski odsecak dodeljen datoj niti
	bool finished;            //da li je nit zavrsila izvrsavanje funkcije
	bool blocked;            //da li je nit blokirana

	TCB(Body function, void* args, uint64* stack) : threadFunction(function), stack(stack), args(args),
													timeSlice(DEFAULT_TIME_SLICE), finished(false), blocked(false) {
    80001ba4:	01353823          	sd	s3,16(a0)
    80001ba8:	01253c23          	sd	s2,24(a0)
    80001bac:	03453023          	sd	s4,32(a0)
    80001bb0:	00200793          	li	a5,2
    80001bb4:	02f53423          	sd	a5,40(a0)
    80001bb8:	02050823          	sb	zero,48(a0)
    80001bbc:	020508a3          	sb	zero,49(a0)
		//formiranje pocetnog konteksta; specijalni uslovi za main funkciju kojoj se pocetni kontekst automatski formira
		uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
    80001bc0:	04098863          	beqz	s3,80001c10 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xa8>
    80001bc4:	00000797          	auipc	a5,0x0
    80001bc8:	10478793          	addi	a5,a5,260 # 80001cc8 <_ZN3TCB7wrapperEv>
		uint64 startSp = stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0;
    80001bcc:	04090663          	beqz	s2,80001c18 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xb0>
    80001bd0:	00008637          	lui	a2,0x8
    80001bd4:	00c90933          	add	s2,s2,a2
		this->context.ra = startRa;
    80001bd8:	00f4b423          	sd	a5,8(s1)
		this->context.sp = startSp;
    80001bdc:	0124b023          	sd	s2,0(s1)
	Scheduler::put(newThread);
    80001be0:	00048513          	mv	a0,s1
    80001be4:	00000097          	auipc	ra,0x0
    80001be8:	a04080e7          	jalr	-1532(ra) # 800015e8 <_ZN9Scheduler3putEP3TCB>
	return newThread;
}
    80001bec:	00048513          	mv	a0,s1
    80001bf0:	02813083          	ld	ra,40(sp)
    80001bf4:	02013403          	ld	s0,32(sp)
    80001bf8:	01813483          	ld	s1,24(sp)
    80001bfc:	01013903          	ld	s2,16(sp)
    80001c00:	00813983          	ld	s3,8(sp)
    80001c04:	00013a03          	ld	s4,0(sp)
    80001c08:	03010113          	addi	sp,sp,48
    80001c0c:	00008067          	ret
		uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
    80001c10:	00000793          	li	a5,0
    80001c14:	fb9ff06f          	j	80001bcc <_ZN3TCB12createThreadEPFvPvES0_Pm+0x64>
		uint64 startSp = stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0;
    80001c18:	00000913          	li	s2,0
    80001c1c:	fbdff06f          	j	80001bd8 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x70>

0000000080001c20 <_ZN3TCB8dispatchEv>:

void TCB::dispatch() {
    80001c20:	fe010113          	addi	sp,sp,-32
    80001c24:	00113c23          	sd	ra,24(sp)
    80001c28:	00813823          	sd	s0,16(sp)
    80001c2c:	00913423          	sd	s1,8(sp)
    80001c30:	02010413          	addi	s0,sp,32
	TCB* old = TCB::running;
    80001c34:	00004497          	auipc	s1,0x4
    80001c38:	e944b483          	ld	s1,-364(s1) # 80005ac8 <_ZN3TCB7runningE>
	bool isFinished() { return finished; }
    80001c3c:	0304c783          	lbu	a5,48(s1)
	if (!old->isFinished() && !old->isBlocked()) {
    80001c40:	00079663          	bnez	a5,80001c4c <_ZN3TCB8dispatchEv+0x2c>
	bool isBlocked() { return blocked; }
    80001c44:	0314c783          	lbu	a5,49(s1)
    80001c48:	02078c63          	beqz	a5,80001c80 <_ZN3TCB8dispatchEv+0x60>
		Scheduler::put(old);
	}
	TCB::running = Scheduler::get();
    80001c4c:	00000097          	auipc	ra,0x0
    80001c50:	a1c080e7          	jalr	-1508(ra) # 80001668 <_ZN9Scheduler3getEv>
    80001c54:	00050593          	mv	a1,a0
    80001c58:	00004797          	auipc	a5,0x4
    80001c5c:	e6a7b823          	sd	a0,-400(a5) # 80005ac8 <_ZN3TCB7runningE>
	TCB::contextSwitch(&old->context, &running->context);
    80001c60:	00048513          	mv	a0,s1
    80001c64:	fffff097          	auipc	ra,0xfffff
    80001c68:	5c0080e7          	jalr	1472(ra) # 80001224 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80001c6c:	01813083          	ld	ra,24(sp)
    80001c70:	01013403          	ld	s0,16(sp)
    80001c74:	00813483          	ld	s1,8(sp)
    80001c78:	02010113          	addi	sp,sp,32
    80001c7c:	00008067          	ret
		Scheduler::put(old);
    80001c80:	00048513          	mv	a0,s1
    80001c84:	00000097          	auipc	ra,0x0
    80001c88:	964080e7          	jalr	-1692(ra) # 800015e8 <_ZN9Scheduler3putEP3TCB>
    80001c8c:	fc1ff06f          	j	80001c4c <_ZN3TCB8dispatchEv+0x2c>

0000000080001c90 <_ZN3TCB5yieldEv>:

void TCB::yield() {
    80001c90:	ff010113          	addi	sp,sp,-16
    80001c94:	00113423          	sd	ra,8(sp)
    80001c98:	00813023          	sd	s0,0(sp)
    80001c9c:	01010413          	addi	s0,sp,16
	Riscv::pushRegisters();
    80001ca0:	fffff097          	auipc	ra,0xfffff
    80001ca4:	360080e7          	jalr	864(ra) # 80001000 <_ZN5Riscv13pushRegistersEv>
	TCB::dispatch();
    80001ca8:	00000097          	auipc	ra,0x0
    80001cac:	f78080e7          	jalr	-136(ra) # 80001c20 <_ZN3TCB8dispatchEv>
	Riscv::popRegisters();
    80001cb0:	fffff097          	auipc	ra,0xfffff
    80001cb4:	3cc080e7          	jalr	972(ra) # 8000107c <_ZN5Riscv12popRegistersEv>
}
    80001cb8:	00813083          	ld	ra,8(sp)
    80001cbc:	00013403          	ld	s0,0(sp)
    80001cc0:	01010113          	addi	sp,sp,16
    80001cc4:	00008067          	ret

0000000080001cc8 <_ZN3TCB7wrapperEv>:

void TCB::wrapper() {
    80001cc8:	fe010113          	addi	sp,sp,-32
    80001ccc:	00113c23          	sd	ra,24(sp)
    80001cd0:	00813823          	sd	s0,16(sp)
    80001cd4:	00913423          	sd	s1,8(sp)
    80001cd8:	02010413          	addi	s0,sp,32
	running->threadFunction(running->args);
    80001cdc:	00004497          	auipc	s1,0x4
    80001ce0:	dec48493          	addi	s1,s1,-532 # 80005ac8 <_ZN3TCB7runningE>
    80001ce4:	0004b783          	ld	a5,0(s1)
    80001ce8:	0107b703          	ld	a4,16(a5)
    80001cec:	0207b503          	ld	a0,32(a5)
    80001cf0:	000700e7          	jalr	a4
	running->finished = true;
    80001cf4:	0004b783          	ld	a5,0(s1)
    80001cf8:	00100713          	li	a4,1
    80001cfc:	02e78823          	sb	a4,48(a5)
	TCB::yield();
    80001d00:	00000097          	auipc	ra,0x0
    80001d04:	f90080e7          	jalr	-112(ra) # 80001c90 <_ZN3TCB5yieldEv>
}
    80001d08:	01813083          	ld	ra,24(sp)
    80001d0c:	01013403          	ld	s0,16(sp)
    80001d10:	00813483          	ld	s1,8(sp)
    80001d14:	02010113          	addi	sp,sp,32
    80001d18:	00008067          	ret

0000000080001d1c <_ZN15MemoryAllocator7kmallocEm>:

bool MemoryAllocator::initialized = false;
MemoryAllocator::FreeMemSegment* MemoryAllocator::freeMemHead = nullptr;
MemoryAllocator::UsedMemSegment* MemoryAllocator::usedMemHead = nullptr;

void* MemoryAllocator::kmalloc(size_t size) {
    80001d1c:	ff010113          	addi	sp,sp,-16
    80001d20:	00813423          	sd	s0,8(sp)
    80001d24:	01010413          	addi	s0,sp,16
	if (size <= 0) return nullptr;
    80001d28:	12050663          	beqz	a0,80001e54 <_ZN15MemoryAllocator7kmallocEm+0x138>

	//pocetna inicijalizacija
	if (!initialized) {
    80001d2c:	00004797          	auipc	a5,0x4
    80001d30:	dac7c783          	lbu	a5,-596(a5) # 80005ad8 <_ZN15MemoryAllocator11initializedE>
    80001d34:	04079663          	bnez	a5,80001d80 <_ZN15MemoryAllocator7kmallocEm+0x64>
		freeMemHead = (FreeMemSegment*)HEAP_START_ADDR;
    80001d38:	00004617          	auipc	a2,0x4
    80001d3c:	d0863603          	ld	a2,-760(a2) # 80005a40 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001d40:	00063703          	ld	a4,0(a2)
    80001d44:	00004797          	auipc	a5,0x4
    80001d48:	d9478793          	addi	a5,a5,-620 # 80005ad8 <_ZN15MemoryAllocator11initializedE>
    80001d4c:	00e7b423          	sd	a4,8(a5)
		freeMemHead->next = nullptr;
    80001d50:	00073023          	sd	zero,0(a4)
		freeMemHead->prev = nullptr;
    80001d54:	0087b683          	ld	a3,8(a5)
    80001d58:	0006b423          	sd	zero,8(a3)
		freeMemHead->size = (char*)HEAP_END_ADDR - (char*)HEAP_START_ADDR;
    80001d5c:	00004717          	auipc	a4,0x4
    80001d60:	cfc73703          	ld	a4,-772(a4) # 80005a58 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001d64:	00073703          	ld	a4,0(a4)
    80001d68:	00063603          	ld	a2,0(a2)
    80001d6c:	40c70733          	sub	a4,a4,a2
    80001d70:	00e6b823          	sd	a4,16(a3)
		usedMemHead = nullptr;
    80001d74:	0007b823          	sd	zero,16(a5)

		initialized = true;
    80001d78:	00100713          	li	a4,1
    80001d7c:	00e78023          	sb	a4,0(a5)
	}

	//alokacija uvek zaokruzena na blokove
	size += sizeof(UsedMemSegment);
    80001d80:	01050513          	addi	a0,a0,16
	size_t blocks = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
    80001d84:	00655713          	srli	a4,a0,0x6
    80001d88:	03f57793          	andi	a5,a0,63
    80001d8c:	00078463          	beqz	a5,80001d94 <_ZN15MemoryAllocator7kmallocEm+0x78>
    80001d90:	00100793          	li	a5,1
    80001d94:	00f707b3          	add	a5,a4,a5
	size = blocks * MEM_BLOCK_SIZE;
    80001d98:	00679793          	slli	a5,a5,0x6

	//trazenje slobodnog segmenta po first-fit algoritmu
	for (FreeMemSegment* current = freeMemHead; current; current = current->next) {
    80001d9c:	00004517          	auipc	a0,0x4
    80001da0:	d4453503          	ld	a0,-700(a0) # 80005ae0 <_ZN15MemoryAllocator11freeMemHeadE>
    80001da4:	08050a63          	beqz	a0,80001e38 <_ZN15MemoryAllocator7kmallocEm+0x11c>
		if (current->size < size) continue;
    80001da8:	01053703          	ld	a4,16(a0)
    80001dac:	06f76263          	bltu	a4,a5,80001e10 <_ZN15MemoryAllocator7kmallocEm+0xf4>

		//pravljenje novog slobodnog fragmenta od ostatka fragmenta
		FreeMemSegment* remainderFree = (FreeMemSegment*)((char*)current + size);
    80001db0:	00f506b3          	add	a3,a0,a5
		remainderFree->size = current->size - size;
    80001db4:	40f70733          	sub	a4,a4,a5
    80001db8:	00e6b823          	sd	a4,16(a3)
		remainderFree->prev = current->prev;
    80001dbc:	00853703          	ld	a4,8(a0)
    80001dc0:	00e6b423          	sd	a4,8(a3)
		if (current->prev) current->prev->next = remainderFree;
    80001dc4:	00070463          	beqz	a4,80001dcc <_ZN15MemoryAllocator7kmallocEm+0xb0>
    80001dc8:	00d73023          	sd	a3,0(a4)
		remainderFree->next = current->next;
    80001dcc:	00053703          	ld	a4,0(a0)
    80001dd0:	00e6b023          	sd	a4,0(a3)
		if (current->next) current->next->prev = remainderFree;
    80001dd4:	00070463          	beqz	a4,80001ddc <_ZN15MemoryAllocator7kmallocEm+0xc0>
    80001dd8:	00d73423          	sd	a3,8(a4)
		if (freeMemHead == current) freeMemHead = remainderFree;
    80001ddc:	00004717          	auipc	a4,0x4
    80001de0:	d0473703          	ld	a4,-764(a4) # 80005ae0 <_ZN15MemoryAllocator11freeMemHeadE>
    80001de4:	02a70a63          	beq	a4,a0,80001e18 <_ZN15MemoryAllocator7kmallocEm+0xfc>

		//ubacivanje novog fragmenta u listu zauzetih fragmenata
		UsedMemSegment* newFragment = (UsedMemSegment*)current;
		newFragment->size = size;
    80001de8:	00f53423          	sd	a5,8(a0)
		UsedMemSegment* prevUsed = nullptr;
		for (UsedMemSegment* cur = usedMemHead; cur && cur < newFragment; prevUsed = cur, cur = cur->next);
    80001dec:	00004697          	auipc	a3,0x4
    80001df0:	cfc6b683          	ld	a3,-772(a3) # 80005ae8 <_ZN15MemoryAllocator11usedMemHeadE>
    80001df4:	00068793          	mv	a5,a3
		UsedMemSegment* prevUsed = nullptr;
    80001df8:	00000713          	li	a4,0
		for (UsedMemSegment* cur = usedMemHead; cur && cur < newFragment; prevUsed = cur, cur = cur->next);
    80001dfc:	02078463          	beqz	a5,80001e24 <_ZN15MemoryAllocator7kmallocEm+0x108>
    80001e00:	02a7f263          	bgeu	a5,a0,80001e24 <_ZN15MemoryAllocator7kmallocEm+0x108>
    80001e04:	00078713          	mv	a4,a5
    80001e08:	0007b783          	ld	a5,0(a5)
    80001e0c:	ff1ff06f          	j	80001dfc <_ZN15MemoryAllocator7kmallocEm+0xe0>
	for (FreeMemSegment* current = freeMemHead; current; current = current->next) {
    80001e10:	00053503          	ld	a0,0(a0)
    80001e14:	f91ff06f          	j	80001da4 <_ZN15MemoryAllocator7kmallocEm+0x88>
		if (freeMemHead == current) freeMemHead = remainderFree;
    80001e18:	00004717          	auipc	a4,0x4
    80001e1c:	ccd73423          	sd	a3,-824(a4) # 80005ae0 <_ZN15MemoryAllocator11freeMemHeadE>
    80001e20:	fc9ff06f          	j	80001de8 <_ZN15MemoryAllocator7kmallocEm+0xcc>
		if (!prevUsed) {
    80001e24:	02070063          	beqz	a4,80001e44 <_ZN15MemoryAllocator7kmallocEm+0x128>
			newFragment->next = usedMemHead;
			usedMemHead = newFragment;
		} else {
			newFragment->next = prevUsed->next;
    80001e28:	00073783          	ld	a5,0(a4)
    80001e2c:	00f53023          	sd	a5,0(a0)
			prevUsed->next = newFragment;
    80001e30:	00a73023          	sd	a0,0(a4)
		}
		return (char*)newFragment + sizeof(UsedMemSegment);
    80001e34:	01050513          	addi	a0,a0,16
	}
	return nullptr;
}
    80001e38:	00813403          	ld	s0,8(sp)
    80001e3c:	01010113          	addi	sp,sp,16
    80001e40:	00008067          	ret
			newFragment->next = usedMemHead;
    80001e44:	00d53023          	sd	a3,0(a0)
			usedMemHead = newFragment;
    80001e48:	00004797          	auipc	a5,0x4
    80001e4c:	caa7b023          	sd	a0,-864(a5) # 80005ae8 <_ZN15MemoryAllocator11usedMemHeadE>
    80001e50:	fe5ff06f          	j	80001e34 <_ZN15MemoryAllocator7kmallocEm+0x118>
	if (size <= 0) return nullptr;
    80001e54:	00000513          	li	a0,0
    80001e58:	fe1ff06f          	j	80001e38 <_ZN15MemoryAllocator7kmallocEm+0x11c>

0000000080001e5c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>:
	tryToJoin(newFree);
	tryToJoin(prevFree);
	return 0;
}

int MemoryAllocator::tryToJoin(MemoryAllocator::FreeMemSegment* current) {
    80001e5c:	ff010113          	addi	sp,sp,-16
    80001e60:	00813423          	sd	s0,8(sp)
    80001e64:	01010413          	addi	s0,sp,16
	if (!current) return 0;
    80001e68:	04050663          	beqz	a0,80001eb4 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x58>
	if (current->next && (char*)current + current->size == (char*)(current->next)) {
    80001e6c:	00053783          	ld	a5,0(a0)
    80001e70:	04078663          	beqz	a5,80001ebc <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x60>
    80001e74:	01053703          	ld	a4,16(a0)
    80001e78:	00e506b3          	add	a3,a0,a4
    80001e7c:	00d78a63          	beq	a5,a3,80001e90 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x34>
		current->size += current->next->size;
		current->next = current->next->next;
		if (current->next) current->next->prev = current;
		return 1;
	} else return 0;
    80001e80:	00000513          	li	a0,0
}
    80001e84:	00813403          	ld	s0,8(sp)
    80001e88:	01010113          	addi	sp,sp,16
    80001e8c:	00008067          	ret
		current->size += current->next->size;
    80001e90:	0107b683          	ld	a3,16(a5)
    80001e94:	00d70733          	add	a4,a4,a3
    80001e98:	00e53823          	sd	a4,16(a0)
		current->next = current->next->next;
    80001e9c:	0007b783          	ld	a5,0(a5)
    80001ea0:	00f53023          	sd	a5,0(a0)
		if (current->next) current->next->prev = current;
    80001ea4:	00078463          	beqz	a5,80001eac <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x50>
    80001ea8:	00a7b423          	sd	a0,8(a5)
		return 1;
    80001eac:	00100513          	li	a0,1
    80001eb0:	fd5ff06f          	j	80001e84 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>
	if (!current) return 0;
    80001eb4:	00000513          	li	a0,0
    80001eb8:	fcdff06f          	j	80001e84 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>
	} else return 0;
    80001ebc:	00000513          	li	a0,0
    80001ec0:	fc5ff06f          	j	80001e84 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>

0000000080001ec4 <_ZN15MemoryAllocator5kfreeEPv>:
	if (!ptr) return 0;
    80001ec4:	10050463          	beqz	a0,80001fcc <_ZN15MemoryAllocator5kfreeEPv+0x108>
    80001ec8:	00050693          	mv	a3,a0
	if (!usedMemHead) return -1;
    80001ecc:	00004797          	auipc	a5,0x4
    80001ed0:	c1c7b783          	ld	a5,-996(a5) # 80005ae8 <_ZN15MemoryAllocator11usedMemHeadE>
    80001ed4:	10078063          	beqz	a5,80001fd4 <_ZN15MemoryAllocator5kfreeEPv+0x110>
	ptr = (char*)ptr - sizeof(UsedMemSegment);
    80001ed8:	ff050513          	addi	a0,a0,-16
	UsedMemSegment* prevUsed = nullptr;
    80001edc:	00000713          	li	a4,0
	for (; currentUsed && currentUsed != ptr; prevUsed = currentUsed, currentUsed = currentUsed->next);
    80001ee0:	00078a63          	beqz	a5,80001ef4 <_ZN15MemoryAllocator5kfreeEPv+0x30>
    80001ee4:	00a78863          	beq	a5,a0,80001ef4 <_ZN15MemoryAllocator5kfreeEPv+0x30>
    80001ee8:	00078713          	mv	a4,a5
    80001eec:	0007b783          	ld	a5,0(a5)
    80001ef0:	ff1ff06f          	j	80001ee0 <_ZN15MemoryAllocator5kfreeEPv+0x1c>
	if (currentUsed != ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    80001ef4:	0ea79463          	bne	a5,a0,80001fdc <_ZN15MemoryAllocator5kfreeEPv+0x118>
int MemoryAllocator::kfree(void* ptr) {
    80001ef8:	fe010113          	addi	sp,sp,-32
    80001efc:	00113c23          	sd	ra,24(sp)
    80001f00:	00813823          	sd	s0,16(sp)
    80001f04:	00913423          	sd	s1,8(sp)
    80001f08:	02010413          	addi	s0,sp,32
	if (prevUsed) prevUsed->next = currentUsed->next;
    80001f0c:	02070863          	beqz	a4,80001f3c <_ZN15MemoryAllocator5kfreeEPv+0x78>
    80001f10:	0007b783          	ld	a5,0(a5)
    80001f14:	00f73023          	sd	a5,0(a4)
	if (!freeMemHead || ptr < (char*)freeMemHead) {
    80001f18:	00004797          	auipc	a5,0x4
    80001f1c:	bc87b783          	ld	a5,-1080(a5) # 80005ae0 <_ZN15MemoryAllocator11freeMemHeadE>
    80001f20:	02078663          	beqz	a5,80001f4c <_ZN15MemoryAllocator5kfreeEPv+0x88>
    80001f24:	02f56863          	bltu	a0,a5,80001f54 <_ZN15MemoryAllocator5kfreeEPv+0x90>
			 prevFree->next != nullptr && ptr > (char*)(prevFree->next); prevFree = prevFree->next);
    80001f28:	00078493          	mv	s1,a5
    80001f2c:	0007b783          	ld	a5,0(a5)
    80001f30:	02078463          	beqz	a5,80001f58 <_ZN15MemoryAllocator5kfreeEPv+0x94>
    80001f34:	fea7eae3          	bltu	a5,a0,80001f28 <_ZN15MemoryAllocator5kfreeEPv+0x64>
    80001f38:	0200006f          	j	80001f58 <_ZN15MemoryAllocator5kfreeEPv+0x94>
	else usedMemHead = currentUsed->next;
    80001f3c:	0007b783          	ld	a5,0(a5)
    80001f40:	00004717          	auipc	a4,0x4
    80001f44:	baf73423          	sd	a5,-1112(a4) # 80005ae8 <_ZN15MemoryAllocator11usedMemHeadE>
    80001f48:	fd1ff06f          	j	80001f18 <_ZN15MemoryAllocator5kfreeEPv+0x54>
		prevFree = nullptr;
    80001f4c:	00078493          	mv	s1,a5
    80001f50:	0080006f          	j	80001f58 <_ZN15MemoryAllocator5kfreeEPv+0x94>
    80001f54:	00000493          	li	s1,0
	size_t segmentSize = ((UsedMemSegment*)ptr)->size;
    80001f58:	ff86b783          	ld	a5,-8(a3)
	newFree->size = segmentSize;
    80001f5c:	00f6b023          	sd	a5,0(a3)
	newFree->prev = prevFree;
    80001f60:	fe96bc23          	sd	s1,-8(a3)
	if (prevFree) newFree->next = prevFree->next;
    80001f64:	04048663          	beqz	s1,80001fb0 <_ZN15MemoryAllocator5kfreeEPv+0xec>
    80001f68:	0004b783          	ld	a5,0(s1)
    80001f6c:	fef6b823          	sd	a5,-16(a3)
	if (newFree->next) newFree->next->prev = newFree;
    80001f70:	ff06b783          	ld	a5,-16(a3)
    80001f74:	00078463          	beqz	a5,80001f7c <_ZN15MemoryAllocator5kfreeEPv+0xb8>
    80001f78:	00a7b423          	sd	a0,8(a5)
	if (prevFree) prevFree->next = newFree;
    80001f7c:	04048263          	beqz	s1,80001fc0 <_ZN15MemoryAllocator5kfreeEPv+0xfc>
    80001f80:	00a4b023          	sd	a0,0(s1)
	tryToJoin(newFree);
    80001f84:	00000097          	auipc	ra,0x0
    80001f88:	ed8080e7          	jalr	-296(ra) # 80001e5c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
	tryToJoin(prevFree);
    80001f8c:	00048513          	mv	a0,s1
    80001f90:	00000097          	auipc	ra,0x0
    80001f94:	ecc080e7          	jalr	-308(ra) # 80001e5c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
	return 0;
    80001f98:	00000513          	li	a0,0
}
    80001f9c:	01813083          	ld	ra,24(sp)
    80001fa0:	01013403          	ld	s0,16(sp)
    80001fa4:	00813483          	ld	s1,8(sp)
    80001fa8:	02010113          	addi	sp,sp,32
    80001fac:	00008067          	ret
	else newFree->next = freeMemHead;
    80001fb0:	00004797          	auipc	a5,0x4
    80001fb4:	b307b783          	ld	a5,-1232(a5) # 80005ae0 <_ZN15MemoryAllocator11freeMemHeadE>
    80001fb8:	fef6b823          	sd	a5,-16(a3)
    80001fbc:	fb5ff06f          	j	80001f70 <_ZN15MemoryAllocator5kfreeEPv+0xac>
	else freeMemHead = newFree;
    80001fc0:	00004797          	auipc	a5,0x4
    80001fc4:	b2a7b023          	sd	a0,-1248(a5) # 80005ae0 <_ZN15MemoryAllocator11freeMemHeadE>
    80001fc8:	fbdff06f          	j	80001f84 <_ZN15MemoryAllocator5kfreeEPv+0xc0>
	if (!ptr) return 0;
    80001fcc:	00000513          	li	a0,0
    80001fd0:	00008067          	ret
	if (!usedMemHead) return -1;
    80001fd4:	fff00513          	li	a0,-1
    80001fd8:	00008067          	ret
	if (currentUsed != ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    80001fdc:	fff00513          	li	a0,-1
}
    80001fe0:	00008067          	ret

0000000080001fe4 <start>:
    80001fe4:	ff010113          	addi	sp,sp,-16
    80001fe8:	00813423          	sd	s0,8(sp)
    80001fec:	01010413          	addi	s0,sp,16
    80001ff0:	300027f3          	csrr	a5,mstatus
    80001ff4:	ffffe737          	lui	a4,0xffffe
    80001ff8:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff7aaf>
    80001ffc:	00e7f7b3          	and	a5,a5,a4
    80002000:	00001737          	lui	a4,0x1
    80002004:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80002008:	00e7e7b3          	or	a5,a5,a4
    8000200c:	30079073          	csrw	mstatus,a5
    80002010:	00000797          	auipc	a5,0x0
    80002014:	16078793          	addi	a5,a5,352 # 80002170 <system_main>
    80002018:	34179073          	csrw	mepc,a5
    8000201c:	00000793          	li	a5,0
    80002020:	18079073          	csrw	satp,a5
    80002024:	000107b7          	lui	a5,0x10
    80002028:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    8000202c:	30279073          	csrw	medeleg,a5
    80002030:	30379073          	csrw	mideleg,a5
    80002034:	104027f3          	csrr	a5,sie
    80002038:	2227e793          	ori	a5,a5,546
    8000203c:	10479073          	csrw	sie,a5
    80002040:	fff00793          	li	a5,-1
    80002044:	00a7d793          	srli	a5,a5,0xa
    80002048:	3b079073          	csrw	pmpaddr0,a5
    8000204c:	00f00793          	li	a5,15
    80002050:	3a079073          	csrw	pmpcfg0,a5
    80002054:	f14027f3          	csrr	a5,mhartid
    80002058:	0200c737          	lui	a4,0x200c
    8000205c:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80002060:	0007869b          	sext.w	a3,a5
    80002064:	00269713          	slli	a4,a3,0x2
    80002068:	000f4637          	lui	a2,0xf4
    8000206c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80002070:	00d70733          	add	a4,a4,a3
    80002074:	0037979b          	slliw	a5,a5,0x3
    80002078:	020046b7          	lui	a3,0x2004
    8000207c:	00d787b3          	add	a5,a5,a3
    80002080:	00c585b3          	add	a1,a1,a2
    80002084:	00371693          	slli	a3,a4,0x3
    80002088:	00004717          	auipc	a4,0x4
    8000208c:	a6870713          	addi	a4,a4,-1432 # 80005af0 <timer_scratch>
    80002090:	00b7b023          	sd	a1,0(a5)
    80002094:	00d70733          	add	a4,a4,a3
    80002098:	00f73c23          	sd	a5,24(a4)
    8000209c:	02c73023          	sd	a2,32(a4)
    800020a0:	34071073          	csrw	mscratch,a4
    800020a4:	00000797          	auipc	a5,0x0
    800020a8:	6ec78793          	addi	a5,a5,1772 # 80002790 <timervec>
    800020ac:	30579073          	csrw	mtvec,a5
    800020b0:	300027f3          	csrr	a5,mstatus
    800020b4:	0087e793          	ori	a5,a5,8
    800020b8:	30079073          	csrw	mstatus,a5
    800020bc:	304027f3          	csrr	a5,mie
    800020c0:	0807e793          	ori	a5,a5,128
    800020c4:	30479073          	csrw	mie,a5
    800020c8:	f14027f3          	csrr	a5,mhartid
    800020cc:	0007879b          	sext.w	a5,a5
    800020d0:	00078213          	mv	tp,a5
    800020d4:	30200073          	mret
    800020d8:	00813403          	ld	s0,8(sp)
    800020dc:	01010113          	addi	sp,sp,16
    800020e0:	00008067          	ret

00000000800020e4 <timerinit>:
    800020e4:	ff010113          	addi	sp,sp,-16
    800020e8:	00813423          	sd	s0,8(sp)
    800020ec:	01010413          	addi	s0,sp,16
    800020f0:	f14027f3          	csrr	a5,mhartid
    800020f4:	0200c737          	lui	a4,0x200c
    800020f8:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800020fc:	0007869b          	sext.w	a3,a5
    80002100:	00269713          	slli	a4,a3,0x2
    80002104:	000f4637          	lui	a2,0xf4
    80002108:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    8000210c:	00d70733          	add	a4,a4,a3
    80002110:	0037979b          	slliw	a5,a5,0x3
    80002114:	020046b7          	lui	a3,0x2004
    80002118:	00d787b3          	add	a5,a5,a3
    8000211c:	00c585b3          	add	a1,a1,a2
    80002120:	00371693          	slli	a3,a4,0x3
    80002124:	00004717          	auipc	a4,0x4
    80002128:	9cc70713          	addi	a4,a4,-1588 # 80005af0 <timer_scratch>
    8000212c:	00b7b023          	sd	a1,0(a5)
    80002130:	00d70733          	add	a4,a4,a3
    80002134:	00f73c23          	sd	a5,24(a4)
    80002138:	02c73023          	sd	a2,32(a4)
    8000213c:	34071073          	csrw	mscratch,a4
    80002140:	00000797          	auipc	a5,0x0
    80002144:	65078793          	addi	a5,a5,1616 # 80002790 <timervec>
    80002148:	30579073          	csrw	mtvec,a5
    8000214c:	300027f3          	csrr	a5,mstatus
    80002150:	0087e793          	ori	a5,a5,8
    80002154:	30079073          	csrw	mstatus,a5
    80002158:	304027f3          	csrr	a5,mie
    8000215c:	0807e793          	ori	a5,a5,128
    80002160:	30479073          	csrw	mie,a5
    80002164:	00813403          	ld	s0,8(sp)
    80002168:	01010113          	addi	sp,sp,16
    8000216c:	00008067          	ret

0000000080002170 <system_main>:
    80002170:	fe010113          	addi	sp,sp,-32
    80002174:	00813823          	sd	s0,16(sp)
    80002178:	00913423          	sd	s1,8(sp)
    8000217c:	00113c23          	sd	ra,24(sp)
    80002180:	02010413          	addi	s0,sp,32
    80002184:	00000097          	auipc	ra,0x0
    80002188:	0c4080e7          	jalr	196(ra) # 80002248 <cpuid>
    8000218c:	00004497          	auipc	s1,0x4
    80002190:	8f448493          	addi	s1,s1,-1804 # 80005a80 <started>
    80002194:	02050263          	beqz	a0,800021b8 <system_main+0x48>
    80002198:	0004a783          	lw	a5,0(s1)
    8000219c:	0007879b          	sext.w	a5,a5
    800021a0:	fe078ce3          	beqz	a5,80002198 <system_main+0x28>
    800021a4:	0ff0000f          	fence
    800021a8:	00003517          	auipc	a0,0x3
    800021ac:	04050513          	addi	a0,a0,64 # 800051e8 <_ZZ12printIntegermE6digits+0x1c8>
    800021b0:	00001097          	auipc	ra,0x1
    800021b4:	a7c080e7          	jalr	-1412(ra) # 80002c2c <panic>
    800021b8:	00001097          	auipc	ra,0x1
    800021bc:	9d0080e7          	jalr	-1584(ra) # 80002b88 <consoleinit>
    800021c0:	00001097          	auipc	ra,0x1
    800021c4:	15c080e7          	jalr	348(ra) # 8000331c <printfinit>
    800021c8:	00003517          	auipc	a0,0x3
    800021cc:	10050513          	addi	a0,a0,256 # 800052c8 <_ZZ12printIntegermE6digits+0x2a8>
    800021d0:	00001097          	auipc	ra,0x1
    800021d4:	ab8080e7          	jalr	-1352(ra) # 80002c88 <__printf>
    800021d8:	00003517          	auipc	a0,0x3
    800021dc:	fe050513          	addi	a0,a0,-32 # 800051b8 <_ZZ12printIntegermE6digits+0x198>
    800021e0:	00001097          	auipc	ra,0x1
    800021e4:	aa8080e7          	jalr	-1368(ra) # 80002c88 <__printf>
    800021e8:	00003517          	auipc	a0,0x3
    800021ec:	0e050513          	addi	a0,a0,224 # 800052c8 <_ZZ12printIntegermE6digits+0x2a8>
    800021f0:	00001097          	auipc	ra,0x1
    800021f4:	a98080e7          	jalr	-1384(ra) # 80002c88 <__printf>
    800021f8:	00001097          	auipc	ra,0x1
    800021fc:	4b0080e7          	jalr	1200(ra) # 800036a8 <kinit>
    80002200:	00000097          	auipc	ra,0x0
    80002204:	148080e7          	jalr	328(ra) # 80002348 <trapinit>
    80002208:	00000097          	auipc	ra,0x0
    8000220c:	16c080e7          	jalr	364(ra) # 80002374 <trapinithart>
    80002210:	00000097          	auipc	ra,0x0
    80002214:	5c0080e7          	jalr	1472(ra) # 800027d0 <plicinit>
    80002218:	00000097          	auipc	ra,0x0
    8000221c:	5e0080e7          	jalr	1504(ra) # 800027f8 <plicinithart>
    80002220:	00000097          	auipc	ra,0x0
    80002224:	078080e7          	jalr	120(ra) # 80002298 <userinit>
    80002228:	0ff0000f          	fence
    8000222c:	00100793          	li	a5,1
    80002230:	00003517          	auipc	a0,0x3
    80002234:	fa050513          	addi	a0,a0,-96 # 800051d0 <_ZZ12printIntegermE6digits+0x1b0>
    80002238:	00f4a023          	sw	a5,0(s1)
    8000223c:	00001097          	auipc	ra,0x1
    80002240:	a4c080e7          	jalr	-1460(ra) # 80002c88 <__printf>
    80002244:	0000006f          	j	80002244 <system_main+0xd4>

0000000080002248 <cpuid>:
    80002248:	ff010113          	addi	sp,sp,-16
    8000224c:	00813423          	sd	s0,8(sp)
    80002250:	01010413          	addi	s0,sp,16
    80002254:	00020513          	mv	a0,tp
    80002258:	00813403          	ld	s0,8(sp)
    8000225c:	0005051b          	sext.w	a0,a0
    80002260:	01010113          	addi	sp,sp,16
    80002264:	00008067          	ret

0000000080002268 <mycpu>:
    80002268:	ff010113          	addi	sp,sp,-16
    8000226c:	00813423          	sd	s0,8(sp)
    80002270:	01010413          	addi	s0,sp,16
    80002274:	00020793          	mv	a5,tp
    80002278:	00813403          	ld	s0,8(sp)
    8000227c:	0007879b          	sext.w	a5,a5
    80002280:	00779793          	slli	a5,a5,0x7
    80002284:	00005517          	auipc	a0,0x5
    80002288:	89c50513          	addi	a0,a0,-1892 # 80006b20 <cpus>
    8000228c:	00f50533          	add	a0,a0,a5
    80002290:	01010113          	addi	sp,sp,16
    80002294:	00008067          	ret

0000000080002298 <userinit>:
    80002298:	ff010113          	addi	sp,sp,-16
    8000229c:	00813423          	sd	s0,8(sp)
    800022a0:	01010413          	addi	s0,sp,16
    800022a4:	00813403          	ld	s0,8(sp)
    800022a8:	01010113          	addi	sp,sp,16
    800022ac:	fffff317          	auipc	t1,0xfffff
    800022b0:	55430067          	jr	1364(t1) # 80001800 <main>

00000000800022b4 <either_copyout>:
    800022b4:	ff010113          	addi	sp,sp,-16
    800022b8:	00813023          	sd	s0,0(sp)
    800022bc:	00113423          	sd	ra,8(sp)
    800022c0:	01010413          	addi	s0,sp,16
    800022c4:	02051663          	bnez	a0,800022f0 <either_copyout+0x3c>
    800022c8:	00058513          	mv	a0,a1
    800022cc:	00060593          	mv	a1,a2
    800022d0:	0006861b          	sext.w	a2,a3
    800022d4:	00002097          	auipc	ra,0x2
    800022d8:	c60080e7          	jalr	-928(ra) # 80003f34 <__memmove>
    800022dc:	00813083          	ld	ra,8(sp)
    800022e0:	00013403          	ld	s0,0(sp)
    800022e4:	00000513          	li	a0,0
    800022e8:	01010113          	addi	sp,sp,16
    800022ec:	00008067          	ret
    800022f0:	00003517          	auipc	a0,0x3
    800022f4:	f2050513          	addi	a0,a0,-224 # 80005210 <_ZZ12printIntegermE6digits+0x1f0>
    800022f8:	00001097          	auipc	ra,0x1
    800022fc:	934080e7          	jalr	-1740(ra) # 80002c2c <panic>

0000000080002300 <either_copyin>:
    80002300:	ff010113          	addi	sp,sp,-16
    80002304:	00813023          	sd	s0,0(sp)
    80002308:	00113423          	sd	ra,8(sp)
    8000230c:	01010413          	addi	s0,sp,16
    80002310:	02059463          	bnez	a1,80002338 <either_copyin+0x38>
    80002314:	00060593          	mv	a1,a2
    80002318:	0006861b          	sext.w	a2,a3
    8000231c:	00002097          	auipc	ra,0x2
    80002320:	c18080e7          	jalr	-1000(ra) # 80003f34 <__memmove>
    80002324:	00813083          	ld	ra,8(sp)
    80002328:	00013403          	ld	s0,0(sp)
    8000232c:	00000513          	li	a0,0
    80002330:	01010113          	addi	sp,sp,16
    80002334:	00008067          	ret
    80002338:	00003517          	auipc	a0,0x3
    8000233c:	f0050513          	addi	a0,a0,-256 # 80005238 <_ZZ12printIntegermE6digits+0x218>
    80002340:	00001097          	auipc	ra,0x1
    80002344:	8ec080e7          	jalr	-1812(ra) # 80002c2c <panic>

0000000080002348 <trapinit>:
    80002348:	ff010113          	addi	sp,sp,-16
    8000234c:	00813423          	sd	s0,8(sp)
    80002350:	01010413          	addi	s0,sp,16
    80002354:	00813403          	ld	s0,8(sp)
    80002358:	00003597          	auipc	a1,0x3
    8000235c:	f0858593          	addi	a1,a1,-248 # 80005260 <_ZZ12printIntegermE6digits+0x240>
    80002360:	00005517          	auipc	a0,0x5
    80002364:	84050513          	addi	a0,a0,-1984 # 80006ba0 <tickslock>
    80002368:	01010113          	addi	sp,sp,16
    8000236c:	00001317          	auipc	t1,0x1
    80002370:	5cc30067          	jr	1484(t1) # 80003938 <initlock>

0000000080002374 <trapinithart>:
    80002374:	ff010113          	addi	sp,sp,-16
    80002378:	00813423          	sd	s0,8(sp)
    8000237c:	01010413          	addi	s0,sp,16
    80002380:	00000797          	auipc	a5,0x0
    80002384:	30078793          	addi	a5,a5,768 # 80002680 <kernelvec>
    80002388:	10579073          	csrw	stvec,a5
    8000238c:	00813403          	ld	s0,8(sp)
    80002390:	01010113          	addi	sp,sp,16
    80002394:	00008067          	ret

0000000080002398 <usertrap>:
    80002398:	ff010113          	addi	sp,sp,-16
    8000239c:	00813423          	sd	s0,8(sp)
    800023a0:	01010413          	addi	s0,sp,16
    800023a4:	00813403          	ld	s0,8(sp)
    800023a8:	01010113          	addi	sp,sp,16
    800023ac:	00008067          	ret

00000000800023b0 <usertrapret>:
    800023b0:	ff010113          	addi	sp,sp,-16
    800023b4:	00813423          	sd	s0,8(sp)
    800023b8:	01010413          	addi	s0,sp,16
    800023bc:	00813403          	ld	s0,8(sp)
    800023c0:	01010113          	addi	sp,sp,16
    800023c4:	00008067          	ret

00000000800023c8 <kerneltrap>:
    800023c8:	fe010113          	addi	sp,sp,-32
    800023cc:	00813823          	sd	s0,16(sp)
    800023d0:	00113c23          	sd	ra,24(sp)
    800023d4:	00913423          	sd	s1,8(sp)
    800023d8:	02010413          	addi	s0,sp,32
    800023dc:	142025f3          	csrr	a1,scause
    800023e0:	100027f3          	csrr	a5,sstatus
    800023e4:	0027f793          	andi	a5,a5,2
    800023e8:	10079c63          	bnez	a5,80002500 <kerneltrap+0x138>
    800023ec:	142027f3          	csrr	a5,scause
    800023f0:	0207ce63          	bltz	a5,8000242c <kerneltrap+0x64>
    800023f4:	00003517          	auipc	a0,0x3
    800023f8:	eb450513          	addi	a0,a0,-332 # 800052a8 <_ZZ12printIntegermE6digits+0x288>
    800023fc:	00001097          	auipc	ra,0x1
    80002400:	88c080e7          	jalr	-1908(ra) # 80002c88 <__printf>
    80002404:	141025f3          	csrr	a1,sepc
    80002408:	14302673          	csrr	a2,stval
    8000240c:	00003517          	auipc	a0,0x3
    80002410:	eac50513          	addi	a0,a0,-340 # 800052b8 <_ZZ12printIntegermE6digits+0x298>
    80002414:	00001097          	auipc	ra,0x1
    80002418:	874080e7          	jalr	-1932(ra) # 80002c88 <__printf>
    8000241c:	00003517          	auipc	a0,0x3
    80002420:	eb450513          	addi	a0,a0,-332 # 800052d0 <_ZZ12printIntegermE6digits+0x2b0>
    80002424:	00001097          	auipc	ra,0x1
    80002428:	808080e7          	jalr	-2040(ra) # 80002c2c <panic>
    8000242c:	0ff7f713          	andi	a4,a5,255
    80002430:	00900693          	li	a3,9
    80002434:	04d70063          	beq	a4,a3,80002474 <kerneltrap+0xac>
    80002438:	fff00713          	li	a4,-1
    8000243c:	03f71713          	slli	a4,a4,0x3f
    80002440:	00170713          	addi	a4,a4,1
    80002444:	fae798e3          	bne	a5,a4,800023f4 <kerneltrap+0x2c>
    80002448:	00000097          	auipc	ra,0x0
    8000244c:	e00080e7          	jalr	-512(ra) # 80002248 <cpuid>
    80002450:	06050663          	beqz	a0,800024bc <kerneltrap+0xf4>
    80002454:	144027f3          	csrr	a5,sip
    80002458:	ffd7f793          	andi	a5,a5,-3
    8000245c:	14479073          	csrw	sip,a5
    80002460:	01813083          	ld	ra,24(sp)
    80002464:	01013403          	ld	s0,16(sp)
    80002468:	00813483          	ld	s1,8(sp)
    8000246c:	02010113          	addi	sp,sp,32
    80002470:	00008067          	ret
    80002474:	00000097          	auipc	ra,0x0
    80002478:	3d0080e7          	jalr	976(ra) # 80002844 <plic_claim>
    8000247c:	00a00793          	li	a5,10
    80002480:	00050493          	mv	s1,a0
    80002484:	06f50863          	beq	a0,a5,800024f4 <kerneltrap+0x12c>
    80002488:	fc050ce3          	beqz	a0,80002460 <kerneltrap+0x98>
    8000248c:	00050593          	mv	a1,a0
    80002490:	00003517          	auipc	a0,0x3
    80002494:	df850513          	addi	a0,a0,-520 # 80005288 <_ZZ12printIntegermE6digits+0x268>
    80002498:	00000097          	auipc	ra,0x0
    8000249c:	7f0080e7          	jalr	2032(ra) # 80002c88 <__printf>
    800024a0:	01013403          	ld	s0,16(sp)
    800024a4:	01813083          	ld	ra,24(sp)
    800024a8:	00048513          	mv	a0,s1
    800024ac:	00813483          	ld	s1,8(sp)
    800024b0:	02010113          	addi	sp,sp,32
    800024b4:	00000317          	auipc	t1,0x0
    800024b8:	3c830067          	jr	968(t1) # 8000287c <plic_complete>
    800024bc:	00004517          	auipc	a0,0x4
    800024c0:	6e450513          	addi	a0,a0,1764 # 80006ba0 <tickslock>
    800024c4:	00001097          	auipc	ra,0x1
    800024c8:	498080e7          	jalr	1176(ra) # 8000395c <acquire>
    800024cc:	00003717          	auipc	a4,0x3
    800024d0:	5b870713          	addi	a4,a4,1464 # 80005a84 <ticks>
    800024d4:	00072783          	lw	a5,0(a4)
    800024d8:	00004517          	auipc	a0,0x4
    800024dc:	6c850513          	addi	a0,a0,1736 # 80006ba0 <tickslock>
    800024e0:	0017879b          	addiw	a5,a5,1
    800024e4:	00f72023          	sw	a5,0(a4)
    800024e8:	00001097          	auipc	ra,0x1
    800024ec:	540080e7          	jalr	1344(ra) # 80003a28 <release>
    800024f0:	f65ff06f          	j	80002454 <kerneltrap+0x8c>
    800024f4:	00001097          	auipc	ra,0x1
    800024f8:	09c080e7          	jalr	156(ra) # 80003590 <uartintr>
    800024fc:	fa5ff06f          	j	800024a0 <kerneltrap+0xd8>
    80002500:	00003517          	auipc	a0,0x3
    80002504:	d6850513          	addi	a0,a0,-664 # 80005268 <_ZZ12printIntegermE6digits+0x248>
    80002508:	00000097          	auipc	ra,0x0
    8000250c:	724080e7          	jalr	1828(ra) # 80002c2c <panic>

0000000080002510 <clockintr>:
    80002510:	fe010113          	addi	sp,sp,-32
    80002514:	00813823          	sd	s0,16(sp)
    80002518:	00913423          	sd	s1,8(sp)
    8000251c:	00113c23          	sd	ra,24(sp)
    80002520:	02010413          	addi	s0,sp,32
    80002524:	00004497          	auipc	s1,0x4
    80002528:	67c48493          	addi	s1,s1,1660 # 80006ba0 <tickslock>
    8000252c:	00048513          	mv	a0,s1
    80002530:	00001097          	auipc	ra,0x1
    80002534:	42c080e7          	jalr	1068(ra) # 8000395c <acquire>
    80002538:	00003717          	auipc	a4,0x3
    8000253c:	54c70713          	addi	a4,a4,1356 # 80005a84 <ticks>
    80002540:	00072783          	lw	a5,0(a4)
    80002544:	01013403          	ld	s0,16(sp)
    80002548:	01813083          	ld	ra,24(sp)
    8000254c:	00048513          	mv	a0,s1
    80002550:	0017879b          	addiw	a5,a5,1
    80002554:	00813483          	ld	s1,8(sp)
    80002558:	00f72023          	sw	a5,0(a4)
    8000255c:	02010113          	addi	sp,sp,32
    80002560:	00001317          	auipc	t1,0x1
    80002564:	4c830067          	jr	1224(t1) # 80003a28 <release>

0000000080002568 <devintr>:
    80002568:	142027f3          	csrr	a5,scause
    8000256c:	00000513          	li	a0,0
    80002570:	0007c463          	bltz	a5,80002578 <devintr+0x10>
    80002574:	00008067          	ret
    80002578:	fe010113          	addi	sp,sp,-32
    8000257c:	00813823          	sd	s0,16(sp)
    80002580:	00113c23          	sd	ra,24(sp)
    80002584:	00913423          	sd	s1,8(sp)
    80002588:	02010413          	addi	s0,sp,32
    8000258c:	0ff7f713          	andi	a4,a5,255
    80002590:	00900693          	li	a3,9
    80002594:	04d70c63          	beq	a4,a3,800025ec <devintr+0x84>
    80002598:	fff00713          	li	a4,-1
    8000259c:	03f71713          	slli	a4,a4,0x3f
    800025a0:	00170713          	addi	a4,a4,1
    800025a4:	00e78c63          	beq	a5,a4,800025bc <devintr+0x54>
    800025a8:	01813083          	ld	ra,24(sp)
    800025ac:	01013403          	ld	s0,16(sp)
    800025b0:	00813483          	ld	s1,8(sp)
    800025b4:	02010113          	addi	sp,sp,32
    800025b8:	00008067          	ret
    800025bc:	00000097          	auipc	ra,0x0
    800025c0:	c8c080e7          	jalr	-884(ra) # 80002248 <cpuid>
    800025c4:	06050663          	beqz	a0,80002630 <devintr+0xc8>
    800025c8:	144027f3          	csrr	a5,sip
    800025cc:	ffd7f793          	andi	a5,a5,-3
    800025d0:	14479073          	csrw	sip,a5
    800025d4:	01813083          	ld	ra,24(sp)
    800025d8:	01013403          	ld	s0,16(sp)
    800025dc:	00813483          	ld	s1,8(sp)
    800025e0:	00200513          	li	a0,2
    800025e4:	02010113          	addi	sp,sp,32
    800025e8:	00008067          	ret
    800025ec:	00000097          	auipc	ra,0x0
    800025f0:	258080e7          	jalr	600(ra) # 80002844 <plic_claim>
    800025f4:	00a00793          	li	a5,10
    800025f8:	00050493          	mv	s1,a0
    800025fc:	06f50663          	beq	a0,a5,80002668 <devintr+0x100>
    80002600:	00100513          	li	a0,1
    80002604:	fa0482e3          	beqz	s1,800025a8 <devintr+0x40>
    80002608:	00048593          	mv	a1,s1
    8000260c:	00003517          	auipc	a0,0x3
    80002610:	c7c50513          	addi	a0,a0,-900 # 80005288 <_ZZ12printIntegermE6digits+0x268>
    80002614:	00000097          	auipc	ra,0x0
    80002618:	674080e7          	jalr	1652(ra) # 80002c88 <__printf>
    8000261c:	00048513          	mv	a0,s1
    80002620:	00000097          	auipc	ra,0x0
    80002624:	25c080e7          	jalr	604(ra) # 8000287c <plic_complete>
    80002628:	00100513          	li	a0,1
    8000262c:	f7dff06f          	j	800025a8 <devintr+0x40>
    80002630:	00004517          	auipc	a0,0x4
    80002634:	57050513          	addi	a0,a0,1392 # 80006ba0 <tickslock>
    80002638:	00001097          	auipc	ra,0x1
    8000263c:	324080e7          	jalr	804(ra) # 8000395c <acquire>
    80002640:	00003717          	auipc	a4,0x3
    80002644:	44470713          	addi	a4,a4,1092 # 80005a84 <ticks>
    80002648:	00072783          	lw	a5,0(a4)
    8000264c:	00004517          	auipc	a0,0x4
    80002650:	55450513          	addi	a0,a0,1364 # 80006ba0 <tickslock>
    80002654:	0017879b          	addiw	a5,a5,1
    80002658:	00f72023          	sw	a5,0(a4)
    8000265c:	00001097          	auipc	ra,0x1
    80002660:	3cc080e7          	jalr	972(ra) # 80003a28 <release>
    80002664:	f65ff06f          	j	800025c8 <devintr+0x60>
    80002668:	00001097          	auipc	ra,0x1
    8000266c:	f28080e7          	jalr	-216(ra) # 80003590 <uartintr>
    80002670:	fadff06f          	j	8000261c <devintr+0xb4>
	...

0000000080002680 <kernelvec>:
    80002680:	f0010113          	addi	sp,sp,-256
    80002684:	00113023          	sd	ra,0(sp)
    80002688:	00213423          	sd	sp,8(sp)
    8000268c:	00313823          	sd	gp,16(sp)
    80002690:	00413c23          	sd	tp,24(sp)
    80002694:	02513023          	sd	t0,32(sp)
    80002698:	02613423          	sd	t1,40(sp)
    8000269c:	02713823          	sd	t2,48(sp)
    800026a0:	02813c23          	sd	s0,56(sp)
    800026a4:	04913023          	sd	s1,64(sp)
    800026a8:	04a13423          	sd	a0,72(sp)
    800026ac:	04b13823          	sd	a1,80(sp)
    800026b0:	04c13c23          	sd	a2,88(sp)
    800026b4:	06d13023          	sd	a3,96(sp)
    800026b8:	06e13423          	sd	a4,104(sp)
    800026bc:	06f13823          	sd	a5,112(sp)
    800026c0:	07013c23          	sd	a6,120(sp)
    800026c4:	09113023          	sd	a7,128(sp)
    800026c8:	09213423          	sd	s2,136(sp)
    800026cc:	09313823          	sd	s3,144(sp)
    800026d0:	09413c23          	sd	s4,152(sp)
    800026d4:	0b513023          	sd	s5,160(sp)
    800026d8:	0b613423          	sd	s6,168(sp)
    800026dc:	0b713823          	sd	s7,176(sp)
    800026e0:	0b813c23          	sd	s8,184(sp)
    800026e4:	0d913023          	sd	s9,192(sp)
    800026e8:	0da13423          	sd	s10,200(sp)
    800026ec:	0db13823          	sd	s11,208(sp)
    800026f0:	0dc13c23          	sd	t3,216(sp)
    800026f4:	0fd13023          	sd	t4,224(sp)
    800026f8:	0fe13423          	sd	t5,232(sp)
    800026fc:	0ff13823          	sd	t6,240(sp)
    80002700:	cc9ff0ef          	jal	ra,800023c8 <kerneltrap>
    80002704:	00013083          	ld	ra,0(sp)
    80002708:	00813103          	ld	sp,8(sp)
    8000270c:	01013183          	ld	gp,16(sp)
    80002710:	02013283          	ld	t0,32(sp)
    80002714:	02813303          	ld	t1,40(sp)
    80002718:	03013383          	ld	t2,48(sp)
    8000271c:	03813403          	ld	s0,56(sp)
    80002720:	04013483          	ld	s1,64(sp)
    80002724:	04813503          	ld	a0,72(sp)
    80002728:	05013583          	ld	a1,80(sp)
    8000272c:	05813603          	ld	a2,88(sp)
    80002730:	06013683          	ld	a3,96(sp)
    80002734:	06813703          	ld	a4,104(sp)
    80002738:	07013783          	ld	a5,112(sp)
    8000273c:	07813803          	ld	a6,120(sp)
    80002740:	08013883          	ld	a7,128(sp)
    80002744:	08813903          	ld	s2,136(sp)
    80002748:	09013983          	ld	s3,144(sp)
    8000274c:	09813a03          	ld	s4,152(sp)
    80002750:	0a013a83          	ld	s5,160(sp)
    80002754:	0a813b03          	ld	s6,168(sp)
    80002758:	0b013b83          	ld	s7,176(sp)
    8000275c:	0b813c03          	ld	s8,184(sp)
    80002760:	0c013c83          	ld	s9,192(sp)
    80002764:	0c813d03          	ld	s10,200(sp)
    80002768:	0d013d83          	ld	s11,208(sp)
    8000276c:	0d813e03          	ld	t3,216(sp)
    80002770:	0e013e83          	ld	t4,224(sp)
    80002774:	0e813f03          	ld	t5,232(sp)
    80002778:	0f013f83          	ld	t6,240(sp)
    8000277c:	10010113          	addi	sp,sp,256
    80002780:	10200073          	sret
    80002784:	00000013          	nop
    80002788:	00000013          	nop
    8000278c:	00000013          	nop

0000000080002790 <timervec>:
    80002790:	34051573          	csrrw	a0,mscratch,a0
    80002794:	00b53023          	sd	a1,0(a0)
    80002798:	00c53423          	sd	a2,8(a0)
    8000279c:	00d53823          	sd	a3,16(a0)
    800027a0:	01853583          	ld	a1,24(a0)
    800027a4:	02053603          	ld	a2,32(a0)
    800027a8:	0005b683          	ld	a3,0(a1)
    800027ac:	00c686b3          	add	a3,a3,a2
    800027b0:	00d5b023          	sd	a3,0(a1)
    800027b4:	00200593          	li	a1,2
    800027b8:	14459073          	csrw	sip,a1
    800027bc:	01053683          	ld	a3,16(a0)
    800027c0:	00853603          	ld	a2,8(a0)
    800027c4:	00053583          	ld	a1,0(a0)
    800027c8:	34051573          	csrrw	a0,mscratch,a0
    800027cc:	30200073          	mret

00000000800027d0 <plicinit>:
    800027d0:	ff010113          	addi	sp,sp,-16
    800027d4:	00813423          	sd	s0,8(sp)
    800027d8:	01010413          	addi	s0,sp,16
    800027dc:	00813403          	ld	s0,8(sp)
    800027e0:	0c0007b7          	lui	a5,0xc000
    800027e4:	00100713          	li	a4,1
    800027e8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    800027ec:	00e7a223          	sw	a4,4(a5)
    800027f0:	01010113          	addi	sp,sp,16
    800027f4:	00008067          	ret

00000000800027f8 <plicinithart>:
    800027f8:	ff010113          	addi	sp,sp,-16
    800027fc:	00813023          	sd	s0,0(sp)
    80002800:	00113423          	sd	ra,8(sp)
    80002804:	01010413          	addi	s0,sp,16
    80002808:	00000097          	auipc	ra,0x0
    8000280c:	a40080e7          	jalr	-1472(ra) # 80002248 <cpuid>
    80002810:	0085171b          	slliw	a4,a0,0x8
    80002814:	0c0027b7          	lui	a5,0xc002
    80002818:	00e787b3          	add	a5,a5,a4
    8000281c:	40200713          	li	a4,1026
    80002820:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80002824:	00813083          	ld	ra,8(sp)
    80002828:	00013403          	ld	s0,0(sp)
    8000282c:	00d5151b          	slliw	a0,a0,0xd
    80002830:	0c2017b7          	lui	a5,0xc201
    80002834:	00a78533          	add	a0,a5,a0
    80002838:	00052023          	sw	zero,0(a0)
    8000283c:	01010113          	addi	sp,sp,16
    80002840:	00008067          	ret

0000000080002844 <plic_claim>:
    80002844:	ff010113          	addi	sp,sp,-16
    80002848:	00813023          	sd	s0,0(sp)
    8000284c:	00113423          	sd	ra,8(sp)
    80002850:	01010413          	addi	s0,sp,16
    80002854:	00000097          	auipc	ra,0x0
    80002858:	9f4080e7          	jalr	-1548(ra) # 80002248 <cpuid>
    8000285c:	00813083          	ld	ra,8(sp)
    80002860:	00013403          	ld	s0,0(sp)
    80002864:	00d5151b          	slliw	a0,a0,0xd
    80002868:	0c2017b7          	lui	a5,0xc201
    8000286c:	00a78533          	add	a0,a5,a0
    80002870:	00452503          	lw	a0,4(a0)
    80002874:	01010113          	addi	sp,sp,16
    80002878:	00008067          	ret

000000008000287c <plic_complete>:
    8000287c:	fe010113          	addi	sp,sp,-32
    80002880:	00813823          	sd	s0,16(sp)
    80002884:	00913423          	sd	s1,8(sp)
    80002888:	00113c23          	sd	ra,24(sp)
    8000288c:	02010413          	addi	s0,sp,32
    80002890:	00050493          	mv	s1,a0
    80002894:	00000097          	auipc	ra,0x0
    80002898:	9b4080e7          	jalr	-1612(ra) # 80002248 <cpuid>
    8000289c:	01813083          	ld	ra,24(sp)
    800028a0:	01013403          	ld	s0,16(sp)
    800028a4:	00d5179b          	slliw	a5,a0,0xd
    800028a8:	0c201737          	lui	a4,0xc201
    800028ac:	00f707b3          	add	a5,a4,a5
    800028b0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    800028b4:	00813483          	ld	s1,8(sp)
    800028b8:	02010113          	addi	sp,sp,32
    800028bc:	00008067          	ret

00000000800028c0 <consolewrite>:
    800028c0:	fb010113          	addi	sp,sp,-80
    800028c4:	04813023          	sd	s0,64(sp)
    800028c8:	04113423          	sd	ra,72(sp)
    800028cc:	02913c23          	sd	s1,56(sp)
    800028d0:	03213823          	sd	s2,48(sp)
    800028d4:	03313423          	sd	s3,40(sp)
    800028d8:	03413023          	sd	s4,32(sp)
    800028dc:	01513c23          	sd	s5,24(sp)
    800028e0:	05010413          	addi	s0,sp,80
    800028e4:	06c05c63          	blez	a2,8000295c <consolewrite+0x9c>
    800028e8:	00060993          	mv	s3,a2
    800028ec:	00050a13          	mv	s4,a0
    800028f0:	00058493          	mv	s1,a1
    800028f4:	00000913          	li	s2,0
    800028f8:	fff00a93          	li	s5,-1
    800028fc:	01c0006f          	j	80002918 <consolewrite+0x58>
    80002900:	fbf44503          	lbu	a0,-65(s0)
    80002904:	0019091b          	addiw	s2,s2,1
    80002908:	00148493          	addi	s1,s1,1
    8000290c:	00001097          	auipc	ra,0x1
    80002910:	a9c080e7          	jalr	-1380(ra) # 800033a8 <uartputc>
    80002914:	03298063          	beq	s3,s2,80002934 <consolewrite+0x74>
    80002918:	00048613          	mv	a2,s1
    8000291c:	00100693          	li	a3,1
    80002920:	000a0593          	mv	a1,s4
    80002924:	fbf40513          	addi	a0,s0,-65
    80002928:	00000097          	auipc	ra,0x0
    8000292c:	9d8080e7          	jalr	-1576(ra) # 80002300 <either_copyin>
    80002930:	fd5518e3          	bne	a0,s5,80002900 <consolewrite+0x40>
    80002934:	04813083          	ld	ra,72(sp)
    80002938:	04013403          	ld	s0,64(sp)
    8000293c:	03813483          	ld	s1,56(sp)
    80002940:	02813983          	ld	s3,40(sp)
    80002944:	02013a03          	ld	s4,32(sp)
    80002948:	01813a83          	ld	s5,24(sp)
    8000294c:	00090513          	mv	a0,s2
    80002950:	03013903          	ld	s2,48(sp)
    80002954:	05010113          	addi	sp,sp,80
    80002958:	00008067          	ret
    8000295c:	00000913          	li	s2,0
    80002960:	fd5ff06f          	j	80002934 <consolewrite+0x74>

0000000080002964 <consoleread>:
    80002964:	f9010113          	addi	sp,sp,-112
    80002968:	06813023          	sd	s0,96(sp)
    8000296c:	04913c23          	sd	s1,88(sp)
    80002970:	05213823          	sd	s2,80(sp)
    80002974:	05313423          	sd	s3,72(sp)
    80002978:	05413023          	sd	s4,64(sp)
    8000297c:	03513c23          	sd	s5,56(sp)
    80002980:	03613823          	sd	s6,48(sp)
    80002984:	03713423          	sd	s7,40(sp)
    80002988:	03813023          	sd	s8,32(sp)
    8000298c:	06113423          	sd	ra,104(sp)
    80002990:	01913c23          	sd	s9,24(sp)
    80002994:	07010413          	addi	s0,sp,112
    80002998:	00060b93          	mv	s7,a2
    8000299c:	00050913          	mv	s2,a0
    800029a0:	00058c13          	mv	s8,a1
    800029a4:	00060b1b          	sext.w	s6,a2
    800029a8:	00004497          	auipc	s1,0x4
    800029ac:	22048493          	addi	s1,s1,544 # 80006bc8 <cons>
    800029b0:	00400993          	li	s3,4
    800029b4:	fff00a13          	li	s4,-1
    800029b8:	00a00a93          	li	s5,10
    800029bc:	05705e63          	blez	s7,80002a18 <consoleread+0xb4>
    800029c0:	09c4a703          	lw	a4,156(s1)
    800029c4:	0984a783          	lw	a5,152(s1)
    800029c8:	0007071b          	sext.w	a4,a4
    800029cc:	08e78463          	beq	a5,a4,80002a54 <consoleread+0xf0>
    800029d0:	07f7f713          	andi	a4,a5,127
    800029d4:	00e48733          	add	a4,s1,a4
    800029d8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    800029dc:	0017869b          	addiw	a3,a5,1
    800029e0:	08d4ac23          	sw	a3,152(s1)
    800029e4:	00070c9b          	sext.w	s9,a4
    800029e8:	0b370663          	beq	a4,s3,80002a94 <consoleread+0x130>
    800029ec:	00100693          	li	a3,1
    800029f0:	f9f40613          	addi	a2,s0,-97
    800029f4:	000c0593          	mv	a1,s8
    800029f8:	00090513          	mv	a0,s2
    800029fc:	f8e40fa3          	sb	a4,-97(s0)
    80002a00:	00000097          	auipc	ra,0x0
    80002a04:	8b4080e7          	jalr	-1868(ra) # 800022b4 <either_copyout>
    80002a08:	01450863          	beq	a0,s4,80002a18 <consoleread+0xb4>
    80002a0c:	001c0c13          	addi	s8,s8,1
    80002a10:	fffb8b9b          	addiw	s7,s7,-1
    80002a14:	fb5c94e3          	bne	s9,s5,800029bc <consoleread+0x58>
    80002a18:	000b851b          	sext.w	a0,s7
    80002a1c:	06813083          	ld	ra,104(sp)
    80002a20:	06013403          	ld	s0,96(sp)
    80002a24:	05813483          	ld	s1,88(sp)
    80002a28:	05013903          	ld	s2,80(sp)
    80002a2c:	04813983          	ld	s3,72(sp)
    80002a30:	04013a03          	ld	s4,64(sp)
    80002a34:	03813a83          	ld	s5,56(sp)
    80002a38:	02813b83          	ld	s7,40(sp)
    80002a3c:	02013c03          	ld	s8,32(sp)
    80002a40:	01813c83          	ld	s9,24(sp)
    80002a44:	40ab053b          	subw	a0,s6,a0
    80002a48:	03013b03          	ld	s6,48(sp)
    80002a4c:	07010113          	addi	sp,sp,112
    80002a50:	00008067          	ret
    80002a54:	00001097          	auipc	ra,0x1
    80002a58:	1d8080e7          	jalr	472(ra) # 80003c2c <push_on>
    80002a5c:	0984a703          	lw	a4,152(s1)
    80002a60:	09c4a783          	lw	a5,156(s1)
    80002a64:	0007879b          	sext.w	a5,a5
    80002a68:	fef70ce3          	beq	a4,a5,80002a60 <consoleread+0xfc>
    80002a6c:	00001097          	auipc	ra,0x1
    80002a70:	234080e7          	jalr	564(ra) # 80003ca0 <pop_on>
    80002a74:	0984a783          	lw	a5,152(s1)
    80002a78:	07f7f713          	andi	a4,a5,127
    80002a7c:	00e48733          	add	a4,s1,a4
    80002a80:	01874703          	lbu	a4,24(a4)
    80002a84:	0017869b          	addiw	a3,a5,1
    80002a88:	08d4ac23          	sw	a3,152(s1)
    80002a8c:	00070c9b          	sext.w	s9,a4
    80002a90:	f5371ee3          	bne	a4,s3,800029ec <consoleread+0x88>
    80002a94:	000b851b          	sext.w	a0,s7
    80002a98:	f96bf2e3          	bgeu	s7,s6,80002a1c <consoleread+0xb8>
    80002a9c:	08f4ac23          	sw	a5,152(s1)
    80002aa0:	f7dff06f          	j	80002a1c <consoleread+0xb8>

0000000080002aa4 <consputc>:
    80002aa4:	10000793          	li	a5,256
    80002aa8:	00f50663          	beq	a0,a5,80002ab4 <consputc+0x10>
    80002aac:	00001317          	auipc	t1,0x1
    80002ab0:	9f430067          	jr	-1548(t1) # 800034a0 <uartputc_sync>
    80002ab4:	ff010113          	addi	sp,sp,-16
    80002ab8:	00113423          	sd	ra,8(sp)
    80002abc:	00813023          	sd	s0,0(sp)
    80002ac0:	01010413          	addi	s0,sp,16
    80002ac4:	00800513          	li	a0,8
    80002ac8:	00001097          	auipc	ra,0x1
    80002acc:	9d8080e7          	jalr	-1576(ra) # 800034a0 <uartputc_sync>
    80002ad0:	02000513          	li	a0,32
    80002ad4:	00001097          	auipc	ra,0x1
    80002ad8:	9cc080e7          	jalr	-1588(ra) # 800034a0 <uartputc_sync>
    80002adc:	00013403          	ld	s0,0(sp)
    80002ae0:	00813083          	ld	ra,8(sp)
    80002ae4:	00800513          	li	a0,8
    80002ae8:	01010113          	addi	sp,sp,16
    80002aec:	00001317          	auipc	t1,0x1
    80002af0:	9b430067          	jr	-1612(t1) # 800034a0 <uartputc_sync>

0000000080002af4 <consoleintr>:
    80002af4:	fe010113          	addi	sp,sp,-32
    80002af8:	00813823          	sd	s0,16(sp)
    80002afc:	00913423          	sd	s1,8(sp)
    80002b00:	01213023          	sd	s2,0(sp)
    80002b04:	00113c23          	sd	ra,24(sp)
    80002b08:	02010413          	addi	s0,sp,32
    80002b0c:	00004917          	auipc	s2,0x4
    80002b10:	0bc90913          	addi	s2,s2,188 # 80006bc8 <cons>
    80002b14:	00050493          	mv	s1,a0
    80002b18:	00090513          	mv	a0,s2
    80002b1c:	00001097          	auipc	ra,0x1
    80002b20:	e40080e7          	jalr	-448(ra) # 8000395c <acquire>
    80002b24:	02048c63          	beqz	s1,80002b5c <consoleintr+0x68>
    80002b28:	0a092783          	lw	a5,160(s2)
    80002b2c:	09892703          	lw	a4,152(s2)
    80002b30:	07f00693          	li	a3,127
    80002b34:	40e7873b          	subw	a4,a5,a4
    80002b38:	02e6e263          	bltu	a3,a4,80002b5c <consoleintr+0x68>
    80002b3c:	00d00713          	li	a4,13
    80002b40:	04e48063          	beq	s1,a4,80002b80 <consoleintr+0x8c>
    80002b44:	07f7f713          	andi	a4,a5,127
    80002b48:	00e90733          	add	a4,s2,a4
    80002b4c:	0017879b          	addiw	a5,a5,1
    80002b50:	0af92023          	sw	a5,160(s2)
    80002b54:	00970c23          	sb	s1,24(a4)
    80002b58:	08f92e23          	sw	a5,156(s2)
    80002b5c:	01013403          	ld	s0,16(sp)
    80002b60:	01813083          	ld	ra,24(sp)
    80002b64:	00813483          	ld	s1,8(sp)
    80002b68:	00013903          	ld	s2,0(sp)
    80002b6c:	00004517          	auipc	a0,0x4
    80002b70:	05c50513          	addi	a0,a0,92 # 80006bc8 <cons>
    80002b74:	02010113          	addi	sp,sp,32
    80002b78:	00001317          	auipc	t1,0x1
    80002b7c:	eb030067          	jr	-336(t1) # 80003a28 <release>
    80002b80:	00a00493          	li	s1,10
    80002b84:	fc1ff06f          	j	80002b44 <consoleintr+0x50>

0000000080002b88 <consoleinit>:
    80002b88:	fe010113          	addi	sp,sp,-32
    80002b8c:	00113c23          	sd	ra,24(sp)
    80002b90:	00813823          	sd	s0,16(sp)
    80002b94:	00913423          	sd	s1,8(sp)
    80002b98:	02010413          	addi	s0,sp,32
    80002b9c:	00004497          	auipc	s1,0x4
    80002ba0:	02c48493          	addi	s1,s1,44 # 80006bc8 <cons>
    80002ba4:	00048513          	mv	a0,s1
    80002ba8:	00002597          	auipc	a1,0x2
    80002bac:	73858593          	addi	a1,a1,1848 # 800052e0 <_ZZ12printIntegermE6digits+0x2c0>
    80002bb0:	00001097          	auipc	ra,0x1
    80002bb4:	d88080e7          	jalr	-632(ra) # 80003938 <initlock>
    80002bb8:	00000097          	auipc	ra,0x0
    80002bbc:	7ac080e7          	jalr	1964(ra) # 80003364 <uartinit>
    80002bc0:	01813083          	ld	ra,24(sp)
    80002bc4:	01013403          	ld	s0,16(sp)
    80002bc8:	00000797          	auipc	a5,0x0
    80002bcc:	d9c78793          	addi	a5,a5,-612 # 80002964 <consoleread>
    80002bd0:	0af4bc23          	sd	a5,184(s1)
    80002bd4:	00000797          	auipc	a5,0x0
    80002bd8:	cec78793          	addi	a5,a5,-788 # 800028c0 <consolewrite>
    80002bdc:	0cf4b023          	sd	a5,192(s1)
    80002be0:	00813483          	ld	s1,8(sp)
    80002be4:	02010113          	addi	sp,sp,32
    80002be8:	00008067          	ret

0000000080002bec <console_read>:
    80002bec:	ff010113          	addi	sp,sp,-16
    80002bf0:	00813423          	sd	s0,8(sp)
    80002bf4:	01010413          	addi	s0,sp,16
    80002bf8:	00813403          	ld	s0,8(sp)
    80002bfc:	00004317          	auipc	t1,0x4
    80002c00:	08433303          	ld	t1,132(t1) # 80006c80 <devsw+0x10>
    80002c04:	01010113          	addi	sp,sp,16
    80002c08:	00030067          	jr	t1

0000000080002c0c <console_write>:
    80002c0c:	ff010113          	addi	sp,sp,-16
    80002c10:	00813423          	sd	s0,8(sp)
    80002c14:	01010413          	addi	s0,sp,16
    80002c18:	00813403          	ld	s0,8(sp)
    80002c1c:	00004317          	auipc	t1,0x4
    80002c20:	06c33303          	ld	t1,108(t1) # 80006c88 <devsw+0x18>
    80002c24:	01010113          	addi	sp,sp,16
    80002c28:	00030067          	jr	t1

0000000080002c2c <panic>:
    80002c2c:	fe010113          	addi	sp,sp,-32
    80002c30:	00113c23          	sd	ra,24(sp)
    80002c34:	00813823          	sd	s0,16(sp)
    80002c38:	00913423          	sd	s1,8(sp)
    80002c3c:	02010413          	addi	s0,sp,32
    80002c40:	00050493          	mv	s1,a0
    80002c44:	00002517          	auipc	a0,0x2
    80002c48:	6a450513          	addi	a0,a0,1700 # 800052e8 <_ZZ12printIntegermE6digits+0x2c8>
    80002c4c:	00004797          	auipc	a5,0x4
    80002c50:	0c07ae23          	sw	zero,220(a5) # 80006d28 <pr+0x18>
    80002c54:	00000097          	auipc	ra,0x0
    80002c58:	034080e7          	jalr	52(ra) # 80002c88 <__printf>
    80002c5c:	00048513          	mv	a0,s1
    80002c60:	00000097          	auipc	ra,0x0
    80002c64:	028080e7          	jalr	40(ra) # 80002c88 <__printf>
    80002c68:	00002517          	auipc	a0,0x2
    80002c6c:	66050513          	addi	a0,a0,1632 # 800052c8 <_ZZ12printIntegermE6digits+0x2a8>
    80002c70:	00000097          	auipc	ra,0x0
    80002c74:	018080e7          	jalr	24(ra) # 80002c88 <__printf>
    80002c78:	00100793          	li	a5,1
    80002c7c:	00003717          	auipc	a4,0x3
    80002c80:	e0f72623          	sw	a5,-500(a4) # 80005a88 <panicked>
    80002c84:	0000006f          	j	80002c84 <panic+0x58>

0000000080002c88 <__printf>:
    80002c88:	f3010113          	addi	sp,sp,-208
    80002c8c:	08813023          	sd	s0,128(sp)
    80002c90:	07313423          	sd	s3,104(sp)
    80002c94:	09010413          	addi	s0,sp,144
    80002c98:	05813023          	sd	s8,64(sp)
    80002c9c:	08113423          	sd	ra,136(sp)
    80002ca0:	06913c23          	sd	s1,120(sp)
    80002ca4:	07213823          	sd	s2,112(sp)
    80002ca8:	07413023          	sd	s4,96(sp)
    80002cac:	05513c23          	sd	s5,88(sp)
    80002cb0:	05613823          	sd	s6,80(sp)
    80002cb4:	05713423          	sd	s7,72(sp)
    80002cb8:	03913c23          	sd	s9,56(sp)
    80002cbc:	03a13823          	sd	s10,48(sp)
    80002cc0:	03b13423          	sd	s11,40(sp)
    80002cc4:	00004317          	auipc	t1,0x4
    80002cc8:	04c30313          	addi	t1,t1,76 # 80006d10 <pr>
    80002ccc:	01832c03          	lw	s8,24(t1)
    80002cd0:	00b43423          	sd	a1,8(s0)
    80002cd4:	00c43823          	sd	a2,16(s0)
    80002cd8:	00d43c23          	sd	a3,24(s0)
    80002cdc:	02e43023          	sd	a4,32(s0)
    80002ce0:	02f43423          	sd	a5,40(s0)
    80002ce4:	03043823          	sd	a6,48(s0)
    80002ce8:	03143c23          	sd	a7,56(s0)
    80002cec:	00050993          	mv	s3,a0
    80002cf0:	4a0c1663          	bnez	s8,8000319c <__printf+0x514>
    80002cf4:	60098c63          	beqz	s3,8000330c <__printf+0x684>
    80002cf8:	0009c503          	lbu	a0,0(s3)
    80002cfc:	00840793          	addi	a5,s0,8
    80002d00:	f6f43c23          	sd	a5,-136(s0)
    80002d04:	00000493          	li	s1,0
    80002d08:	22050063          	beqz	a0,80002f28 <__printf+0x2a0>
    80002d0c:	00002a37          	lui	s4,0x2
    80002d10:	00018ab7          	lui	s5,0x18
    80002d14:	000f4b37          	lui	s6,0xf4
    80002d18:	00989bb7          	lui	s7,0x989
    80002d1c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80002d20:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80002d24:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80002d28:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80002d2c:	00148c9b          	addiw	s9,s1,1
    80002d30:	02500793          	li	a5,37
    80002d34:	01998933          	add	s2,s3,s9
    80002d38:	38f51263          	bne	a0,a5,800030bc <__printf+0x434>
    80002d3c:	00094783          	lbu	a5,0(s2)
    80002d40:	00078c9b          	sext.w	s9,a5
    80002d44:	1e078263          	beqz	a5,80002f28 <__printf+0x2a0>
    80002d48:	0024849b          	addiw	s1,s1,2
    80002d4c:	07000713          	li	a4,112
    80002d50:	00998933          	add	s2,s3,s1
    80002d54:	38e78a63          	beq	a5,a4,800030e8 <__printf+0x460>
    80002d58:	20f76863          	bltu	a4,a5,80002f68 <__printf+0x2e0>
    80002d5c:	42a78863          	beq	a5,a0,8000318c <__printf+0x504>
    80002d60:	06400713          	li	a4,100
    80002d64:	40e79663          	bne	a5,a4,80003170 <__printf+0x4e8>
    80002d68:	f7843783          	ld	a5,-136(s0)
    80002d6c:	0007a603          	lw	a2,0(a5)
    80002d70:	00878793          	addi	a5,a5,8
    80002d74:	f6f43c23          	sd	a5,-136(s0)
    80002d78:	42064a63          	bltz	a2,800031ac <__printf+0x524>
    80002d7c:	00a00713          	li	a4,10
    80002d80:	02e677bb          	remuw	a5,a2,a4
    80002d84:	00002d97          	auipc	s11,0x2
    80002d88:	58cd8d93          	addi	s11,s11,1420 # 80005310 <digits>
    80002d8c:	00900593          	li	a1,9
    80002d90:	0006051b          	sext.w	a0,a2
    80002d94:	00000c93          	li	s9,0
    80002d98:	02079793          	slli	a5,a5,0x20
    80002d9c:	0207d793          	srli	a5,a5,0x20
    80002da0:	00fd87b3          	add	a5,s11,a5
    80002da4:	0007c783          	lbu	a5,0(a5)
    80002da8:	02e656bb          	divuw	a3,a2,a4
    80002dac:	f8f40023          	sb	a5,-128(s0)
    80002db0:	14c5d863          	bge	a1,a2,80002f00 <__printf+0x278>
    80002db4:	06300593          	li	a1,99
    80002db8:	00100c93          	li	s9,1
    80002dbc:	02e6f7bb          	remuw	a5,a3,a4
    80002dc0:	02079793          	slli	a5,a5,0x20
    80002dc4:	0207d793          	srli	a5,a5,0x20
    80002dc8:	00fd87b3          	add	a5,s11,a5
    80002dcc:	0007c783          	lbu	a5,0(a5)
    80002dd0:	02e6d73b          	divuw	a4,a3,a4
    80002dd4:	f8f400a3          	sb	a5,-127(s0)
    80002dd8:	12a5f463          	bgeu	a1,a0,80002f00 <__printf+0x278>
    80002ddc:	00a00693          	li	a3,10
    80002de0:	00900593          	li	a1,9
    80002de4:	02d777bb          	remuw	a5,a4,a3
    80002de8:	02079793          	slli	a5,a5,0x20
    80002dec:	0207d793          	srli	a5,a5,0x20
    80002df0:	00fd87b3          	add	a5,s11,a5
    80002df4:	0007c503          	lbu	a0,0(a5)
    80002df8:	02d757bb          	divuw	a5,a4,a3
    80002dfc:	f8a40123          	sb	a0,-126(s0)
    80002e00:	48e5f263          	bgeu	a1,a4,80003284 <__printf+0x5fc>
    80002e04:	06300513          	li	a0,99
    80002e08:	02d7f5bb          	remuw	a1,a5,a3
    80002e0c:	02059593          	slli	a1,a1,0x20
    80002e10:	0205d593          	srli	a1,a1,0x20
    80002e14:	00bd85b3          	add	a1,s11,a1
    80002e18:	0005c583          	lbu	a1,0(a1)
    80002e1c:	02d7d7bb          	divuw	a5,a5,a3
    80002e20:	f8b401a3          	sb	a1,-125(s0)
    80002e24:	48e57263          	bgeu	a0,a4,800032a8 <__printf+0x620>
    80002e28:	3e700513          	li	a0,999
    80002e2c:	02d7f5bb          	remuw	a1,a5,a3
    80002e30:	02059593          	slli	a1,a1,0x20
    80002e34:	0205d593          	srli	a1,a1,0x20
    80002e38:	00bd85b3          	add	a1,s11,a1
    80002e3c:	0005c583          	lbu	a1,0(a1)
    80002e40:	02d7d7bb          	divuw	a5,a5,a3
    80002e44:	f8b40223          	sb	a1,-124(s0)
    80002e48:	46e57663          	bgeu	a0,a4,800032b4 <__printf+0x62c>
    80002e4c:	02d7f5bb          	remuw	a1,a5,a3
    80002e50:	02059593          	slli	a1,a1,0x20
    80002e54:	0205d593          	srli	a1,a1,0x20
    80002e58:	00bd85b3          	add	a1,s11,a1
    80002e5c:	0005c583          	lbu	a1,0(a1)
    80002e60:	02d7d7bb          	divuw	a5,a5,a3
    80002e64:	f8b402a3          	sb	a1,-123(s0)
    80002e68:	46ea7863          	bgeu	s4,a4,800032d8 <__printf+0x650>
    80002e6c:	02d7f5bb          	remuw	a1,a5,a3
    80002e70:	02059593          	slli	a1,a1,0x20
    80002e74:	0205d593          	srli	a1,a1,0x20
    80002e78:	00bd85b3          	add	a1,s11,a1
    80002e7c:	0005c583          	lbu	a1,0(a1)
    80002e80:	02d7d7bb          	divuw	a5,a5,a3
    80002e84:	f8b40323          	sb	a1,-122(s0)
    80002e88:	3eeaf863          	bgeu	s5,a4,80003278 <__printf+0x5f0>
    80002e8c:	02d7f5bb          	remuw	a1,a5,a3
    80002e90:	02059593          	slli	a1,a1,0x20
    80002e94:	0205d593          	srli	a1,a1,0x20
    80002e98:	00bd85b3          	add	a1,s11,a1
    80002e9c:	0005c583          	lbu	a1,0(a1)
    80002ea0:	02d7d7bb          	divuw	a5,a5,a3
    80002ea4:	f8b403a3          	sb	a1,-121(s0)
    80002ea8:	42eb7e63          	bgeu	s6,a4,800032e4 <__printf+0x65c>
    80002eac:	02d7f5bb          	remuw	a1,a5,a3
    80002eb0:	02059593          	slli	a1,a1,0x20
    80002eb4:	0205d593          	srli	a1,a1,0x20
    80002eb8:	00bd85b3          	add	a1,s11,a1
    80002ebc:	0005c583          	lbu	a1,0(a1)
    80002ec0:	02d7d7bb          	divuw	a5,a5,a3
    80002ec4:	f8b40423          	sb	a1,-120(s0)
    80002ec8:	42ebfc63          	bgeu	s7,a4,80003300 <__printf+0x678>
    80002ecc:	02079793          	slli	a5,a5,0x20
    80002ed0:	0207d793          	srli	a5,a5,0x20
    80002ed4:	00fd8db3          	add	s11,s11,a5
    80002ed8:	000dc703          	lbu	a4,0(s11)
    80002edc:	00a00793          	li	a5,10
    80002ee0:	00900c93          	li	s9,9
    80002ee4:	f8e404a3          	sb	a4,-119(s0)
    80002ee8:	00065c63          	bgez	a2,80002f00 <__printf+0x278>
    80002eec:	f9040713          	addi	a4,s0,-112
    80002ef0:	00f70733          	add	a4,a4,a5
    80002ef4:	02d00693          	li	a3,45
    80002ef8:	fed70823          	sb	a3,-16(a4)
    80002efc:	00078c93          	mv	s9,a5
    80002f00:	f8040793          	addi	a5,s0,-128
    80002f04:	01978cb3          	add	s9,a5,s9
    80002f08:	f7f40d13          	addi	s10,s0,-129
    80002f0c:	000cc503          	lbu	a0,0(s9)
    80002f10:	fffc8c93          	addi	s9,s9,-1
    80002f14:	00000097          	auipc	ra,0x0
    80002f18:	b90080e7          	jalr	-1136(ra) # 80002aa4 <consputc>
    80002f1c:	ffac98e3          	bne	s9,s10,80002f0c <__printf+0x284>
    80002f20:	00094503          	lbu	a0,0(s2)
    80002f24:	e00514e3          	bnez	a0,80002d2c <__printf+0xa4>
    80002f28:	1a0c1663          	bnez	s8,800030d4 <__printf+0x44c>
    80002f2c:	08813083          	ld	ra,136(sp)
    80002f30:	08013403          	ld	s0,128(sp)
    80002f34:	07813483          	ld	s1,120(sp)
    80002f38:	07013903          	ld	s2,112(sp)
    80002f3c:	06813983          	ld	s3,104(sp)
    80002f40:	06013a03          	ld	s4,96(sp)
    80002f44:	05813a83          	ld	s5,88(sp)
    80002f48:	05013b03          	ld	s6,80(sp)
    80002f4c:	04813b83          	ld	s7,72(sp)
    80002f50:	04013c03          	ld	s8,64(sp)
    80002f54:	03813c83          	ld	s9,56(sp)
    80002f58:	03013d03          	ld	s10,48(sp)
    80002f5c:	02813d83          	ld	s11,40(sp)
    80002f60:	0d010113          	addi	sp,sp,208
    80002f64:	00008067          	ret
    80002f68:	07300713          	li	a4,115
    80002f6c:	1ce78a63          	beq	a5,a4,80003140 <__printf+0x4b8>
    80002f70:	07800713          	li	a4,120
    80002f74:	1ee79e63          	bne	a5,a4,80003170 <__printf+0x4e8>
    80002f78:	f7843783          	ld	a5,-136(s0)
    80002f7c:	0007a703          	lw	a4,0(a5)
    80002f80:	00878793          	addi	a5,a5,8
    80002f84:	f6f43c23          	sd	a5,-136(s0)
    80002f88:	28074263          	bltz	a4,8000320c <__printf+0x584>
    80002f8c:	00002d97          	auipc	s11,0x2
    80002f90:	384d8d93          	addi	s11,s11,900 # 80005310 <digits>
    80002f94:	00f77793          	andi	a5,a4,15
    80002f98:	00fd87b3          	add	a5,s11,a5
    80002f9c:	0007c683          	lbu	a3,0(a5)
    80002fa0:	00f00613          	li	a2,15
    80002fa4:	0007079b          	sext.w	a5,a4
    80002fa8:	f8d40023          	sb	a3,-128(s0)
    80002fac:	0047559b          	srliw	a1,a4,0x4
    80002fb0:	0047569b          	srliw	a3,a4,0x4
    80002fb4:	00000c93          	li	s9,0
    80002fb8:	0ee65063          	bge	a2,a4,80003098 <__printf+0x410>
    80002fbc:	00f6f693          	andi	a3,a3,15
    80002fc0:	00dd86b3          	add	a3,s11,a3
    80002fc4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80002fc8:	0087d79b          	srliw	a5,a5,0x8
    80002fcc:	00100c93          	li	s9,1
    80002fd0:	f8d400a3          	sb	a3,-127(s0)
    80002fd4:	0cb67263          	bgeu	a2,a1,80003098 <__printf+0x410>
    80002fd8:	00f7f693          	andi	a3,a5,15
    80002fdc:	00dd86b3          	add	a3,s11,a3
    80002fe0:	0006c583          	lbu	a1,0(a3)
    80002fe4:	00f00613          	li	a2,15
    80002fe8:	0047d69b          	srliw	a3,a5,0x4
    80002fec:	f8b40123          	sb	a1,-126(s0)
    80002ff0:	0047d593          	srli	a1,a5,0x4
    80002ff4:	28f67e63          	bgeu	a2,a5,80003290 <__printf+0x608>
    80002ff8:	00f6f693          	andi	a3,a3,15
    80002ffc:	00dd86b3          	add	a3,s11,a3
    80003000:	0006c503          	lbu	a0,0(a3)
    80003004:	0087d813          	srli	a6,a5,0x8
    80003008:	0087d69b          	srliw	a3,a5,0x8
    8000300c:	f8a401a3          	sb	a0,-125(s0)
    80003010:	28b67663          	bgeu	a2,a1,8000329c <__printf+0x614>
    80003014:	00f6f693          	andi	a3,a3,15
    80003018:	00dd86b3          	add	a3,s11,a3
    8000301c:	0006c583          	lbu	a1,0(a3)
    80003020:	00c7d513          	srli	a0,a5,0xc
    80003024:	00c7d69b          	srliw	a3,a5,0xc
    80003028:	f8b40223          	sb	a1,-124(s0)
    8000302c:	29067a63          	bgeu	a2,a6,800032c0 <__printf+0x638>
    80003030:	00f6f693          	andi	a3,a3,15
    80003034:	00dd86b3          	add	a3,s11,a3
    80003038:	0006c583          	lbu	a1,0(a3)
    8000303c:	0107d813          	srli	a6,a5,0x10
    80003040:	0107d69b          	srliw	a3,a5,0x10
    80003044:	f8b402a3          	sb	a1,-123(s0)
    80003048:	28a67263          	bgeu	a2,a0,800032cc <__printf+0x644>
    8000304c:	00f6f693          	andi	a3,a3,15
    80003050:	00dd86b3          	add	a3,s11,a3
    80003054:	0006c683          	lbu	a3,0(a3)
    80003058:	0147d79b          	srliw	a5,a5,0x14
    8000305c:	f8d40323          	sb	a3,-122(s0)
    80003060:	21067663          	bgeu	a2,a6,8000326c <__printf+0x5e4>
    80003064:	02079793          	slli	a5,a5,0x20
    80003068:	0207d793          	srli	a5,a5,0x20
    8000306c:	00fd8db3          	add	s11,s11,a5
    80003070:	000dc683          	lbu	a3,0(s11)
    80003074:	00800793          	li	a5,8
    80003078:	00700c93          	li	s9,7
    8000307c:	f8d403a3          	sb	a3,-121(s0)
    80003080:	00075c63          	bgez	a4,80003098 <__printf+0x410>
    80003084:	f9040713          	addi	a4,s0,-112
    80003088:	00f70733          	add	a4,a4,a5
    8000308c:	02d00693          	li	a3,45
    80003090:	fed70823          	sb	a3,-16(a4)
    80003094:	00078c93          	mv	s9,a5
    80003098:	f8040793          	addi	a5,s0,-128
    8000309c:	01978cb3          	add	s9,a5,s9
    800030a0:	f7f40d13          	addi	s10,s0,-129
    800030a4:	000cc503          	lbu	a0,0(s9)
    800030a8:	fffc8c93          	addi	s9,s9,-1
    800030ac:	00000097          	auipc	ra,0x0
    800030b0:	9f8080e7          	jalr	-1544(ra) # 80002aa4 <consputc>
    800030b4:	ff9d18e3          	bne	s10,s9,800030a4 <__printf+0x41c>
    800030b8:	0100006f          	j	800030c8 <__printf+0x440>
    800030bc:	00000097          	auipc	ra,0x0
    800030c0:	9e8080e7          	jalr	-1560(ra) # 80002aa4 <consputc>
    800030c4:	000c8493          	mv	s1,s9
    800030c8:	00094503          	lbu	a0,0(s2)
    800030cc:	c60510e3          	bnez	a0,80002d2c <__printf+0xa4>
    800030d0:	e40c0ee3          	beqz	s8,80002f2c <__printf+0x2a4>
    800030d4:	00004517          	auipc	a0,0x4
    800030d8:	c3c50513          	addi	a0,a0,-964 # 80006d10 <pr>
    800030dc:	00001097          	auipc	ra,0x1
    800030e0:	94c080e7          	jalr	-1716(ra) # 80003a28 <release>
    800030e4:	e49ff06f          	j	80002f2c <__printf+0x2a4>
    800030e8:	f7843783          	ld	a5,-136(s0)
    800030ec:	03000513          	li	a0,48
    800030f0:	01000d13          	li	s10,16
    800030f4:	00878713          	addi	a4,a5,8
    800030f8:	0007bc83          	ld	s9,0(a5)
    800030fc:	f6e43c23          	sd	a4,-136(s0)
    80003100:	00000097          	auipc	ra,0x0
    80003104:	9a4080e7          	jalr	-1628(ra) # 80002aa4 <consputc>
    80003108:	07800513          	li	a0,120
    8000310c:	00000097          	auipc	ra,0x0
    80003110:	998080e7          	jalr	-1640(ra) # 80002aa4 <consputc>
    80003114:	00002d97          	auipc	s11,0x2
    80003118:	1fcd8d93          	addi	s11,s11,508 # 80005310 <digits>
    8000311c:	03ccd793          	srli	a5,s9,0x3c
    80003120:	00fd87b3          	add	a5,s11,a5
    80003124:	0007c503          	lbu	a0,0(a5)
    80003128:	fffd0d1b          	addiw	s10,s10,-1
    8000312c:	004c9c93          	slli	s9,s9,0x4
    80003130:	00000097          	auipc	ra,0x0
    80003134:	974080e7          	jalr	-1676(ra) # 80002aa4 <consputc>
    80003138:	fe0d12e3          	bnez	s10,8000311c <__printf+0x494>
    8000313c:	f8dff06f          	j	800030c8 <__printf+0x440>
    80003140:	f7843783          	ld	a5,-136(s0)
    80003144:	0007bc83          	ld	s9,0(a5)
    80003148:	00878793          	addi	a5,a5,8
    8000314c:	f6f43c23          	sd	a5,-136(s0)
    80003150:	000c9a63          	bnez	s9,80003164 <__printf+0x4dc>
    80003154:	1080006f          	j	8000325c <__printf+0x5d4>
    80003158:	001c8c93          	addi	s9,s9,1
    8000315c:	00000097          	auipc	ra,0x0
    80003160:	948080e7          	jalr	-1720(ra) # 80002aa4 <consputc>
    80003164:	000cc503          	lbu	a0,0(s9)
    80003168:	fe0518e3          	bnez	a0,80003158 <__printf+0x4d0>
    8000316c:	f5dff06f          	j	800030c8 <__printf+0x440>
    80003170:	02500513          	li	a0,37
    80003174:	00000097          	auipc	ra,0x0
    80003178:	930080e7          	jalr	-1744(ra) # 80002aa4 <consputc>
    8000317c:	000c8513          	mv	a0,s9
    80003180:	00000097          	auipc	ra,0x0
    80003184:	924080e7          	jalr	-1756(ra) # 80002aa4 <consputc>
    80003188:	f41ff06f          	j	800030c8 <__printf+0x440>
    8000318c:	02500513          	li	a0,37
    80003190:	00000097          	auipc	ra,0x0
    80003194:	914080e7          	jalr	-1772(ra) # 80002aa4 <consputc>
    80003198:	f31ff06f          	j	800030c8 <__printf+0x440>
    8000319c:	00030513          	mv	a0,t1
    800031a0:	00000097          	auipc	ra,0x0
    800031a4:	7bc080e7          	jalr	1980(ra) # 8000395c <acquire>
    800031a8:	b4dff06f          	j	80002cf4 <__printf+0x6c>
    800031ac:	40c0053b          	negw	a0,a2
    800031b0:	00a00713          	li	a4,10
    800031b4:	02e576bb          	remuw	a3,a0,a4
    800031b8:	00002d97          	auipc	s11,0x2
    800031bc:	158d8d93          	addi	s11,s11,344 # 80005310 <digits>
    800031c0:	ff700593          	li	a1,-9
    800031c4:	02069693          	slli	a3,a3,0x20
    800031c8:	0206d693          	srli	a3,a3,0x20
    800031cc:	00dd86b3          	add	a3,s11,a3
    800031d0:	0006c683          	lbu	a3,0(a3)
    800031d4:	02e557bb          	divuw	a5,a0,a4
    800031d8:	f8d40023          	sb	a3,-128(s0)
    800031dc:	10b65e63          	bge	a2,a1,800032f8 <__printf+0x670>
    800031e0:	06300593          	li	a1,99
    800031e4:	02e7f6bb          	remuw	a3,a5,a4
    800031e8:	02069693          	slli	a3,a3,0x20
    800031ec:	0206d693          	srli	a3,a3,0x20
    800031f0:	00dd86b3          	add	a3,s11,a3
    800031f4:	0006c683          	lbu	a3,0(a3)
    800031f8:	02e7d73b          	divuw	a4,a5,a4
    800031fc:	00200793          	li	a5,2
    80003200:	f8d400a3          	sb	a3,-127(s0)
    80003204:	bca5ece3          	bltu	a1,a0,80002ddc <__printf+0x154>
    80003208:	ce5ff06f          	j	80002eec <__printf+0x264>
    8000320c:	40e007bb          	negw	a5,a4
    80003210:	00002d97          	auipc	s11,0x2
    80003214:	100d8d93          	addi	s11,s11,256 # 80005310 <digits>
    80003218:	00f7f693          	andi	a3,a5,15
    8000321c:	00dd86b3          	add	a3,s11,a3
    80003220:	0006c583          	lbu	a1,0(a3)
    80003224:	ff100613          	li	a2,-15
    80003228:	0047d69b          	srliw	a3,a5,0x4
    8000322c:	f8b40023          	sb	a1,-128(s0)
    80003230:	0047d59b          	srliw	a1,a5,0x4
    80003234:	0ac75e63          	bge	a4,a2,800032f0 <__printf+0x668>
    80003238:	00f6f693          	andi	a3,a3,15
    8000323c:	00dd86b3          	add	a3,s11,a3
    80003240:	0006c603          	lbu	a2,0(a3)
    80003244:	00f00693          	li	a3,15
    80003248:	0087d79b          	srliw	a5,a5,0x8
    8000324c:	f8c400a3          	sb	a2,-127(s0)
    80003250:	d8b6e4e3          	bltu	a3,a1,80002fd8 <__printf+0x350>
    80003254:	00200793          	li	a5,2
    80003258:	e2dff06f          	j	80003084 <__printf+0x3fc>
    8000325c:	00002c97          	auipc	s9,0x2
    80003260:	094c8c93          	addi	s9,s9,148 # 800052f0 <_ZZ12printIntegermE6digits+0x2d0>
    80003264:	02800513          	li	a0,40
    80003268:	ef1ff06f          	j	80003158 <__printf+0x4d0>
    8000326c:	00700793          	li	a5,7
    80003270:	00600c93          	li	s9,6
    80003274:	e0dff06f          	j	80003080 <__printf+0x3f8>
    80003278:	00700793          	li	a5,7
    8000327c:	00600c93          	li	s9,6
    80003280:	c69ff06f          	j	80002ee8 <__printf+0x260>
    80003284:	00300793          	li	a5,3
    80003288:	00200c93          	li	s9,2
    8000328c:	c5dff06f          	j	80002ee8 <__printf+0x260>
    80003290:	00300793          	li	a5,3
    80003294:	00200c93          	li	s9,2
    80003298:	de9ff06f          	j	80003080 <__printf+0x3f8>
    8000329c:	00400793          	li	a5,4
    800032a0:	00300c93          	li	s9,3
    800032a4:	dddff06f          	j	80003080 <__printf+0x3f8>
    800032a8:	00400793          	li	a5,4
    800032ac:	00300c93          	li	s9,3
    800032b0:	c39ff06f          	j	80002ee8 <__printf+0x260>
    800032b4:	00500793          	li	a5,5
    800032b8:	00400c93          	li	s9,4
    800032bc:	c2dff06f          	j	80002ee8 <__printf+0x260>
    800032c0:	00500793          	li	a5,5
    800032c4:	00400c93          	li	s9,4
    800032c8:	db9ff06f          	j	80003080 <__printf+0x3f8>
    800032cc:	00600793          	li	a5,6
    800032d0:	00500c93          	li	s9,5
    800032d4:	dadff06f          	j	80003080 <__printf+0x3f8>
    800032d8:	00600793          	li	a5,6
    800032dc:	00500c93          	li	s9,5
    800032e0:	c09ff06f          	j	80002ee8 <__printf+0x260>
    800032e4:	00800793          	li	a5,8
    800032e8:	00700c93          	li	s9,7
    800032ec:	bfdff06f          	j	80002ee8 <__printf+0x260>
    800032f0:	00100793          	li	a5,1
    800032f4:	d91ff06f          	j	80003084 <__printf+0x3fc>
    800032f8:	00100793          	li	a5,1
    800032fc:	bf1ff06f          	j	80002eec <__printf+0x264>
    80003300:	00900793          	li	a5,9
    80003304:	00800c93          	li	s9,8
    80003308:	be1ff06f          	j	80002ee8 <__printf+0x260>
    8000330c:	00002517          	auipc	a0,0x2
    80003310:	fec50513          	addi	a0,a0,-20 # 800052f8 <_ZZ12printIntegermE6digits+0x2d8>
    80003314:	00000097          	auipc	ra,0x0
    80003318:	918080e7          	jalr	-1768(ra) # 80002c2c <panic>

000000008000331c <printfinit>:
    8000331c:	fe010113          	addi	sp,sp,-32
    80003320:	00813823          	sd	s0,16(sp)
    80003324:	00913423          	sd	s1,8(sp)
    80003328:	00113c23          	sd	ra,24(sp)
    8000332c:	02010413          	addi	s0,sp,32
    80003330:	00004497          	auipc	s1,0x4
    80003334:	9e048493          	addi	s1,s1,-1568 # 80006d10 <pr>
    80003338:	00048513          	mv	a0,s1
    8000333c:	00002597          	auipc	a1,0x2
    80003340:	fcc58593          	addi	a1,a1,-52 # 80005308 <_ZZ12printIntegermE6digits+0x2e8>
    80003344:	00000097          	auipc	ra,0x0
    80003348:	5f4080e7          	jalr	1524(ra) # 80003938 <initlock>
    8000334c:	01813083          	ld	ra,24(sp)
    80003350:	01013403          	ld	s0,16(sp)
    80003354:	0004ac23          	sw	zero,24(s1)
    80003358:	00813483          	ld	s1,8(sp)
    8000335c:	02010113          	addi	sp,sp,32
    80003360:	00008067          	ret

0000000080003364 <uartinit>:
    80003364:	ff010113          	addi	sp,sp,-16
    80003368:	00813423          	sd	s0,8(sp)
    8000336c:	01010413          	addi	s0,sp,16
    80003370:	100007b7          	lui	a5,0x10000
    80003374:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80003378:	f8000713          	li	a4,-128
    8000337c:	00e781a3          	sb	a4,3(a5)
    80003380:	00300713          	li	a4,3
    80003384:	00e78023          	sb	a4,0(a5)
    80003388:	000780a3          	sb	zero,1(a5)
    8000338c:	00e781a3          	sb	a4,3(a5)
    80003390:	00700693          	li	a3,7
    80003394:	00d78123          	sb	a3,2(a5)
    80003398:	00e780a3          	sb	a4,1(a5)
    8000339c:	00813403          	ld	s0,8(sp)
    800033a0:	01010113          	addi	sp,sp,16
    800033a4:	00008067          	ret

00000000800033a8 <uartputc>:
    800033a8:	00002797          	auipc	a5,0x2
    800033ac:	6e07a783          	lw	a5,1760(a5) # 80005a88 <panicked>
    800033b0:	00078463          	beqz	a5,800033b8 <uartputc+0x10>
    800033b4:	0000006f          	j	800033b4 <uartputc+0xc>
    800033b8:	fd010113          	addi	sp,sp,-48
    800033bc:	02813023          	sd	s0,32(sp)
    800033c0:	00913c23          	sd	s1,24(sp)
    800033c4:	01213823          	sd	s2,16(sp)
    800033c8:	01313423          	sd	s3,8(sp)
    800033cc:	02113423          	sd	ra,40(sp)
    800033d0:	03010413          	addi	s0,sp,48
    800033d4:	00002917          	auipc	s2,0x2
    800033d8:	6bc90913          	addi	s2,s2,1724 # 80005a90 <uart_tx_r>
    800033dc:	00093783          	ld	a5,0(s2)
    800033e0:	00002497          	auipc	s1,0x2
    800033e4:	6b848493          	addi	s1,s1,1720 # 80005a98 <uart_tx_w>
    800033e8:	0004b703          	ld	a4,0(s1)
    800033ec:	02078693          	addi	a3,a5,32
    800033f0:	00050993          	mv	s3,a0
    800033f4:	02e69c63          	bne	a3,a4,8000342c <uartputc+0x84>
    800033f8:	00001097          	auipc	ra,0x1
    800033fc:	834080e7          	jalr	-1996(ra) # 80003c2c <push_on>
    80003400:	00093783          	ld	a5,0(s2)
    80003404:	0004b703          	ld	a4,0(s1)
    80003408:	02078793          	addi	a5,a5,32
    8000340c:	00e79463          	bne	a5,a4,80003414 <uartputc+0x6c>
    80003410:	0000006f          	j	80003410 <uartputc+0x68>
    80003414:	00001097          	auipc	ra,0x1
    80003418:	88c080e7          	jalr	-1908(ra) # 80003ca0 <pop_on>
    8000341c:	00093783          	ld	a5,0(s2)
    80003420:	0004b703          	ld	a4,0(s1)
    80003424:	02078693          	addi	a3,a5,32
    80003428:	fce688e3          	beq	a3,a4,800033f8 <uartputc+0x50>
    8000342c:	01f77693          	andi	a3,a4,31
    80003430:	00004597          	auipc	a1,0x4
    80003434:	90058593          	addi	a1,a1,-1792 # 80006d30 <uart_tx_buf>
    80003438:	00d586b3          	add	a3,a1,a3
    8000343c:	00170713          	addi	a4,a4,1
    80003440:	01368023          	sb	s3,0(a3)
    80003444:	00e4b023          	sd	a4,0(s1)
    80003448:	10000637          	lui	a2,0x10000
    8000344c:	02f71063          	bne	a4,a5,8000346c <uartputc+0xc4>
    80003450:	0340006f          	j	80003484 <uartputc+0xdc>
    80003454:	00074703          	lbu	a4,0(a4)
    80003458:	00f93023          	sd	a5,0(s2)
    8000345c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80003460:	00093783          	ld	a5,0(s2)
    80003464:	0004b703          	ld	a4,0(s1)
    80003468:	00f70e63          	beq	a4,a5,80003484 <uartputc+0xdc>
    8000346c:	00564683          	lbu	a3,5(a2)
    80003470:	01f7f713          	andi	a4,a5,31
    80003474:	00e58733          	add	a4,a1,a4
    80003478:	0206f693          	andi	a3,a3,32
    8000347c:	00178793          	addi	a5,a5,1
    80003480:	fc069ae3          	bnez	a3,80003454 <uartputc+0xac>
    80003484:	02813083          	ld	ra,40(sp)
    80003488:	02013403          	ld	s0,32(sp)
    8000348c:	01813483          	ld	s1,24(sp)
    80003490:	01013903          	ld	s2,16(sp)
    80003494:	00813983          	ld	s3,8(sp)
    80003498:	03010113          	addi	sp,sp,48
    8000349c:	00008067          	ret

00000000800034a0 <uartputc_sync>:
    800034a0:	ff010113          	addi	sp,sp,-16
    800034a4:	00813423          	sd	s0,8(sp)
    800034a8:	01010413          	addi	s0,sp,16
    800034ac:	00002717          	auipc	a4,0x2
    800034b0:	5dc72703          	lw	a4,1500(a4) # 80005a88 <panicked>
    800034b4:	02071663          	bnez	a4,800034e0 <uartputc_sync+0x40>
    800034b8:	00050793          	mv	a5,a0
    800034bc:	100006b7          	lui	a3,0x10000
    800034c0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    800034c4:	02077713          	andi	a4,a4,32
    800034c8:	fe070ce3          	beqz	a4,800034c0 <uartputc_sync+0x20>
    800034cc:	0ff7f793          	andi	a5,a5,255
    800034d0:	00f68023          	sb	a5,0(a3)
    800034d4:	00813403          	ld	s0,8(sp)
    800034d8:	01010113          	addi	sp,sp,16
    800034dc:	00008067          	ret
    800034e0:	0000006f          	j	800034e0 <uartputc_sync+0x40>

00000000800034e4 <uartstart>:
    800034e4:	ff010113          	addi	sp,sp,-16
    800034e8:	00813423          	sd	s0,8(sp)
    800034ec:	01010413          	addi	s0,sp,16
    800034f0:	00002617          	auipc	a2,0x2
    800034f4:	5a060613          	addi	a2,a2,1440 # 80005a90 <uart_tx_r>
    800034f8:	00002517          	auipc	a0,0x2
    800034fc:	5a050513          	addi	a0,a0,1440 # 80005a98 <uart_tx_w>
    80003500:	00063783          	ld	a5,0(a2)
    80003504:	00053703          	ld	a4,0(a0)
    80003508:	04f70263          	beq	a4,a5,8000354c <uartstart+0x68>
    8000350c:	100005b7          	lui	a1,0x10000
    80003510:	00004817          	auipc	a6,0x4
    80003514:	82080813          	addi	a6,a6,-2016 # 80006d30 <uart_tx_buf>
    80003518:	01c0006f          	j	80003534 <uartstart+0x50>
    8000351c:	0006c703          	lbu	a4,0(a3)
    80003520:	00f63023          	sd	a5,0(a2)
    80003524:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80003528:	00063783          	ld	a5,0(a2)
    8000352c:	00053703          	ld	a4,0(a0)
    80003530:	00f70e63          	beq	a4,a5,8000354c <uartstart+0x68>
    80003534:	01f7f713          	andi	a4,a5,31
    80003538:	00e806b3          	add	a3,a6,a4
    8000353c:	0055c703          	lbu	a4,5(a1)
    80003540:	00178793          	addi	a5,a5,1
    80003544:	02077713          	andi	a4,a4,32
    80003548:	fc071ae3          	bnez	a4,8000351c <uartstart+0x38>
    8000354c:	00813403          	ld	s0,8(sp)
    80003550:	01010113          	addi	sp,sp,16
    80003554:	00008067          	ret

0000000080003558 <uartgetc>:
    80003558:	ff010113          	addi	sp,sp,-16
    8000355c:	00813423          	sd	s0,8(sp)
    80003560:	01010413          	addi	s0,sp,16
    80003564:	10000737          	lui	a4,0x10000
    80003568:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000356c:	0017f793          	andi	a5,a5,1
    80003570:	00078c63          	beqz	a5,80003588 <uartgetc+0x30>
    80003574:	00074503          	lbu	a0,0(a4)
    80003578:	0ff57513          	andi	a0,a0,255
    8000357c:	00813403          	ld	s0,8(sp)
    80003580:	01010113          	addi	sp,sp,16
    80003584:	00008067          	ret
    80003588:	fff00513          	li	a0,-1
    8000358c:	ff1ff06f          	j	8000357c <uartgetc+0x24>

0000000080003590 <uartintr>:
    80003590:	100007b7          	lui	a5,0x10000
    80003594:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80003598:	0017f793          	andi	a5,a5,1
    8000359c:	0a078463          	beqz	a5,80003644 <uartintr+0xb4>
    800035a0:	fe010113          	addi	sp,sp,-32
    800035a4:	00813823          	sd	s0,16(sp)
    800035a8:	00913423          	sd	s1,8(sp)
    800035ac:	00113c23          	sd	ra,24(sp)
    800035b0:	02010413          	addi	s0,sp,32
    800035b4:	100004b7          	lui	s1,0x10000
    800035b8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    800035bc:	0ff57513          	andi	a0,a0,255
    800035c0:	fffff097          	auipc	ra,0xfffff
    800035c4:	534080e7          	jalr	1332(ra) # 80002af4 <consoleintr>
    800035c8:	0054c783          	lbu	a5,5(s1)
    800035cc:	0017f793          	andi	a5,a5,1
    800035d0:	fe0794e3          	bnez	a5,800035b8 <uartintr+0x28>
    800035d4:	00002617          	auipc	a2,0x2
    800035d8:	4bc60613          	addi	a2,a2,1212 # 80005a90 <uart_tx_r>
    800035dc:	00002517          	auipc	a0,0x2
    800035e0:	4bc50513          	addi	a0,a0,1212 # 80005a98 <uart_tx_w>
    800035e4:	00063783          	ld	a5,0(a2)
    800035e8:	00053703          	ld	a4,0(a0)
    800035ec:	04f70263          	beq	a4,a5,80003630 <uartintr+0xa0>
    800035f0:	100005b7          	lui	a1,0x10000
    800035f4:	00003817          	auipc	a6,0x3
    800035f8:	73c80813          	addi	a6,a6,1852 # 80006d30 <uart_tx_buf>
    800035fc:	01c0006f          	j	80003618 <uartintr+0x88>
    80003600:	0006c703          	lbu	a4,0(a3)
    80003604:	00f63023          	sd	a5,0(a2)
    80003608:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000360c:	00063783          	ld	a5,0(a2)
    80003610:	00053703          	ld	a4,0(a0)
    80003614:	00f70e63          	beq	a4,a5,80003630 <uartintr+0xa0>
    80003618:	01f7f713          	andi	a4,a5,31
    8000361c:	00e806b3          	add	a3,a6,a4
    80003620:	0055c703          	lbu	a4,5(a1)
    80003624:	00178793          	addi	a5,a5,1
    80003628:	02077713          	andi	a4,a4,32
    8000362c:	fc071ae3          	bnez	a4,80003600 <uartintr+0x70>
    80003630:	01813083          	ld	ra,24(sp)
    80003634:	01013403          	ld	s0,16(sp)
    80003638:	00813483          	ld	s1,8(sp)
    8000363c:	02010113          	addi	sp,sp,32
    80003640:	00008067          	ret
    80003644:	00002617          	auipc	a2,0x2
    80003648:	44c60613          	addi	a2,a2,1100 # 80005a90 <uart_tx_r>
    8000364c:	00002517          	auipc	a0,0x2
    80003650:	44c50513          	addi	a0,a0,1100 # 80005a98 <uart_tx_w>
    80003654:	00063783          	ld	a5,0(a2)
    80003658:	00053703          	ld	a4,0(a0)
    8000365c:	04f70263          	beq	a4,a5,800036a0 <uartintr+0x110>
    80003660:	100005b7          	lui	a1,0x10000
    80003664:	00003817          	auipc	a6,0x3
    80003668:	6cc80813          	addi	a6,a6,1740 # 80006d30 <uart_tx_buf>
    8000366c:	01c0006f          	j	80003688 <uartintr+0xf8>
    80003670:	0006c703          	lbu	a4,0(a3)
    80003674:	00f63023          	sd	a5,0(a2)
    80003678:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000367c:	00063783          	ld	a5,0(a2)
    80003680:	00053703          	ld	a4,0(a0)
    80003684:	02f70063          	beq	a4,a5,800036a4 <uartintr+0x114>
    80003688:	01f7f713          	andi	a4,a5,31
    8000368c:	00e806b3          	add	a3,a6,a4
    80003690:	0055c703          	lbu	a4,5(a1)
    80003694:	00178793          	addi	a5,a5,1
    80003698:	02077713          	andi	a4,a4,32
    8000369c:	fc071ae3          	bnez	a4,80003670 <uartintr+0xe0>
    800036a0:	00008067          	ret
    800036a4:	00008067          	ret

00000000800036a8 <kinit>:
    800036a8:	fc010113          	addi	sp,sp,-64
    800036ac:	02913423          	sd	s1,40(sp)
    800036b0:	fffff7b7          	lui	a5,0xfffff
    800036b4:	00004497          	auipc	s1,0x4
    800036b8:	69b48493          	addi	s1,s1,1691 # 80007d4f <end+0xfff>
    800036bc:	02813823          	sd	s0,48(sp)
    800036c0:	01313c23          	sd	s3,24(sp)
    800036c4:	00f4f4b3          	and	s1,s1,a5
    800036c8:	02113c23          	sd	ra,56(sp)
    800036cc:	03213023          	sd	s2,32(sp)
    800036d0:	01413823          	sd	s4,16(sp)
    800036d4:	01513423          	sd	s5,8(sp)
    800036d8:	04010413          	addi	s0,sp,64
    800036dc:	000017b7          	lui	a5,0x1
    800036e0:	01100993          	li	s3,17
    800036e4:	00f487b3          	add	a5,s1,a5
    800036e8:	01b99993          	slli	s3,s3,0x1b
    800036ec:	06f9e063          	bltu	s3,a5,8000374c <kinit+0xa4>
    800036f0:	00003a97          	auipc	s5,0x3
    800036f4:	660a8a93          	addi	s5,s5,1632 # 80006d50 <end>
    800036f8:	0754ec63          	bltu	s1,s5,80003770 <kinit+0xc8>
    800036fc:	0734fa63          	bgeu	s1,s3,80003770 <kinit+0xc8>
    80003700:	00088a37          	lui	s4,0x88
    80003704:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80003708:	00002917          	auipc	s2,0x2
    8000370c:	39890913          	addi	s2,s2,920 # 80005aa0 <kmem>
    80003710:	00ca1a13          	slli	s4,s4,0xc
    80003714:	0140006f          	j	80003728 <kinit+0x80>
    80003718:	000017b7          	lui	a5,0x1
    8000371c:	00f484b3          	add	s1,s1,a5
    80003720:	0554e863          	bltu	s1,s5,80003770 <kinit+0xc8>
    80003724:	0534f663          	bgeu	s1,s3,80003770 <kinit+0xc8>
    80003728:	00001637          	lui	a2,0x1
    8000372c:	00100593          	li	a1,1
    80003730:	00048513          	mv	a0,s1
    80003734:	00000097          	auipc	ra,0x0
    80003738:	5e4080e7          	jalr	1508(ra) # 80003d18 <__memset>
    8000373c:	00093783          	ld	a5,0(s2)
    80003740:	00f4b023          	sd	a5,0(s1)
    80003744:	00993023          	sd	s1,0(s2)
    80003748:	fd4498e3          	bne	s1,s4,80003718 <kinit+0x70>
    8000374c:	03813083          	ld	ra,56(sp)
    80003750:	03013403          	ld	s0,48(sp)
    80003754:	02813483          	ld	s1,40(sp)
    80003758:	02013903          	ld	s2,32(sp)
    8000375c:	01813983          	ld	s3,24(sp)
    80003760:	01013a03          	ld	s4,16(sp)
    80003764:	00813a83          	ld	s5,8(sp)
    80003768:	04010113          	addi	sp,sp,64
    8000376c:	00008067          	ret
    80003770:	00002517          	auipc	a0,0x2
    80003774:	bb850513          	addi	a0,a0,-1096 # 80005328 <digits+0x18>
    80003778:	fffff097          	auipc	ra,0xfffff
    8000377c:	4b4080e7          	jalr	1204(ra) # 80002c2c <panic>

0000000080003780 <freerange>:
    80003780:	fc010113          	addi	sp,sp,-64
    80003784:	000017b7          	lui	a5,0x1
    80003788:	02913423          	sd	s1,40(sp)
    8000378c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80003790:	009504b3          	add	s1,a0,s1
    80003794:	fffff537          	lui	a0,0xfffff
    80003798:	02813823          	sd	s0,48(sp)
    8000379c:	02113c23          	sd	ra,56(sp)
    800037a0:	03213023          	sd	s2,32(sp)
    800037a4:	01313c23          	sd	s3,24(sp)
    800037a8:	01413823          	sd	s4,16(sp)
    800037ac:	01513423          	sd	s5,8(sp)
    800037b0:	01613023          	sd	s6,0(sp)
    800037b4:	04010413          	addi	s0,sp,64
    800037b8:	00a4f4b3          	and	s1,s1,a0
    800037bc:	00f487b3          	add	a5,s1,a5
    800037c0:	06f5e463          	bltu	a1,a5,80003828 <freerange+0xa8>
    800037c4:	00003a97          	auipc	s5,0x3
    800037c8:	58ca8a93          	addi	s5,s5,1420 # 80006d50 <end>
    800037cc:	0954e263          	bltu	s1,s5,80003850 <freerange+0xd0>
    800037d0:	01100993          	li	s3,17
    800037d4:	01b99993          	slli	s3,s3,0x1b
    800037d8:	0734fc63          	bgeu	s1,s3,80003850 <freerange+0xd0>
    800037dc:	00058a13          	mv	s4,a1
    800037e0:	00002917          	auipc	s2,0x2
    800037e4:	2c090913          	addi	s2,s2,704 # 80005aa0 <kmem>
    800037e8:	00002b37          	lui	s6,0x2
    800037ec:	0140006f          	j	80003800 <freerange+0x80>
    800037f0:	000017b7          	lui	a5,0x1
    800037f4:	00f484b3          	add	s1,s1,a5
    800037f8:	0554ec63          	bltu	s1,s5,80003850 <freerange+0xd0>
    800037fc:	0534fa63          	bgeu	s1,s3,80003850 <freerange+0xd0>
    80003800:	00001637          	lui	a2,0x1
    80003804:	00100593          	li	a1,1
    80003808:	00048513          	mv	a0,s1
    8000380c:	00000097          	auipc	ra,0x0
    80003810:	50c080e7          	jalr	1292(ra) # 80003d18 <__memset>
    80003814:	00093703          	ld	a4,0(s2)
    80003818:	016487b3          	add	a5,s1,s6
    8000381c:	00e4b023          	sd	a4,0(s1)
    80003820:	00993023          	sd	s1,0(s2)
    80003824:	fcfa76e3          	bgeu	s4,a5,800037f0 <freerange+0x70>
    80003828:	03813083          	ld	ra,56(sp)
    8000382c:	03013403          	ld	s0,48(sp)
    80003830:	02813483          	ld	s1,40(sp)
    80003834:	02013903          	ld	s2,32(sp)
    80003838:	01813983          	ld	s3,24(sp)
    8000383c:	01013a03          	ld	s4,16(sp)
    80003840:	00813a83          	ld	s5,8(sp)
    80003844:	00013b03          	ld	s6,0(sp)
    80003848:	04010113          	addi	sp,sp,64
    8000384c:	00008067          	ret
    80003850:	00002517          	auipc	a0,0x2
    80003854:	ad850513          	addi	a0,a0,-1320 # 80005328 <digits+0x18>
    80003858:	fffff097          	auipc	ra,0xfffff
    8000385c:	3d4080e7          	jalr	980(ra) # 80002c2c <panic>

0000000080003860 <kfree>:
    80003860:	fe010113          	addi	sp,sp,-32
    80003864:	00813823          	sd	s0,16(sp)
    80003868:	00113c23          	sd	ra,24(sp)
    8000386c:	00913423          	sd	s1,8(sp)
    80003870:	02010413          	addi	s0,sp,32
    80003874:	03451793          	slli	a5,a0,0x34
    80003878:	04079c63          	bnez	a5,800038d0 <kfree+0x70>
    8000387c:	00003797          	auipc	a5,0x3
    80003880:	4d478793          	addi	a5,a5,1236 # 80006d50 <end>
    80003884:	00050493          	mv	s1,a0
    80003888:	04f56463          	bltu	a0,a5,800038d0 <kfree+0x70>
    8000388c:	01100793          	li	a5,17
    80003890:	01b79793          	slli	a5,a5,0x1b
    80003894:	02f57e63          	bgeu	a0,a5,800038d0 <kfree+0x70>
    80003898:	00001637          	lui	a2,0x1
    8000389c:	00100593          	li	a1,1
    800038a0:	00000097          	auipc	ra,0x0
    800038a4:	478080e7          	jalr	1144(ra) # 80003d18 <__memset>
    800038a8:	00002797          	auipc	a5,0x2
    800038ac:	1f878793          	addi	a5,a5,504 # 80005aa0 <kmem>
    800038b0:	0007b703          	ld	a4,0(a5)
    800038b4:	01813083          	ld	ra,24(sp)
    800038b8:	01013403          	ld	s0,16(sp)
    800038bc:	00e4b023          	sd	a4,0(s1)
    800038c0:	0097b023          	sd	s1,0(a5)
    800038c4:	00813483          	ld	s1,8(sp)
    800038c8:	02010113          	addi	sp,sp,32
    800038cc:	00008067          	ret
    800038d0:	00002517          	auipc	a0,0x2
    800038d4:	a5850513          	addi	a0,a0,-1448 # 80005328 <digits+0x18>
    800038d8:	fffff097          	auipc	ra,0xfffff
    800038dc:	354080e7          	jalr	852(ra) # 80002c2c <panic>

00000000800038e0 <kalloc>:
    800038e0:	fe010113          	addi	sp,sp,-32
    800038e4:	00813823          	sd	s0,16(sp)
    800038e8:	00913423          	sd	s1,8(sp)
    800038ec:	00113c23          	sd	ra,24(sp)
    800038f0:	02010413          	addi	s0,sp,32
    800038f4:	00002797          	auipc	a5,0x2
    800038f8:	1ac78793          	addi	a5,a5,428 # 80005aa0 <kmem>
    800038fc:	0007b483          	ld	s1,0(a5)
    80003900:	02048063          	beqz	s1,80003920 <kalloc+0x40>
    80003904:	0004b703          	ld	a4,0(s1)
    80003908:	00001637          	lui	a2,0x1
    8000390c:	00500593          	li	a1,5
    80003910:	00048513          	mv	a0,s1
    80003914:	00e7b023          	sd	a4,0(a5)
    80003918:	00000097          	auipc	ra,0x0
    8000391c:	400080e7          	jalr	1024(ra) # 80003d18 <__memset>
    80003920:	01813083          	ld	ra,24(sp)
    80003924:	01013403          	ld	s0,16(sp)
    80003928:	00048513          	mv	a0,s1
    8000392c:	00813483          	ld	s1,8(sp)
    80003930:	02010113          	addi	sp,sp,32
    80003934:	00008067          	ret

0000000080003938 <initlock>:
    80003938:	ff010113          	addi	sp,sp,-16
    8000393c:	00813423          	sd	s0,8(sp)
    80003940:	01010413          	addi	s0,sp,16
    80003944:	00813403          	ld	s0,8(sp)
    80003948:	00b53423          	sd	a1,8(a0)
    8000394c:	00052023          	sw	zero,0(a0)
    80003950:	00053823          	sd	zero,16(a0)
    80003954:	01010113          	addi	sp,sp,16
    80003958:	00008067          	ret

000000008000395c <acquire>:
    8000395c:	fe010113          	addi	sp,sp,-32
    80003960:	00813823          	sd	s0,16(sp)
    80003964:	00913423          	sd	s1,8(sp)
    80003968:	00113c23          	sd	ra,24(sp)
    8000396c:	01213023          	sd	s2,0(sp)
    80003970:	02010413          	addi	s0,sp,32
    80003974:	00050493          	mv	s1,a0
    80003978:	10002973          	csrr	s2,sstatus
    8000397c:	100027f3          	csrr	a5,sstatus
    80003980:	ffd7f793          	andi	a5,a5,-3
    80003984:	10079073          	csrw	sstatus,a5
    80003988:	fffff097          	auipc	ra,0xfffff
    8000398c:	8e0080e7          	jalr	-1824(ra) # 80002268 <mycpu>
    80003990:	07852783          	lw	a5,120(a0)
    80003994:	06078e63          	beqz	a5,80003a10 <acquire+0xb4>
    80003998:	fffff097          	auipc	ra,0xfffff
    8000399c:	8d0080e7          	jalr	-1840(ra) # 80002268 <mycpu>
    800039a0:	07852783          	lw	a5,120(a0)
    800039a4:	0004a703          	lw	a4,0(s1)
    800039a8:	0017879b          	addiw	a5,a5,1
    800039ac:	06f52c23          	sw	a5,120(a0)
    800039b0:	04071063          	bnez	a4,800039f0 <acquire+0x94>
    800039b4:	00100713          	li	a4,1
    800039b8:	00070793          	mv	a5,a4
    800039bc:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    800039c0:	0007879b          	sext.w	a5,a5
    800039c4:	fe079ae3          	bnez	a5,800039b8 <acquire+0x5c>
    800039c8:	0ff0000f          	fence
    800039cc:	fffff097          	auipc	ra,0xfffff
    800039d0:	89c080e7          	jalr	-1892(ra) # 80002268 <mycpu>
    800039d4:	01813083          	ld	ra,24(sp)
    800039d8:	01013403          	ld	s0,16(sp)
    800039dc:	00a4b823          	sd	a0,16(s1)
    800039e0:	00013903          	ld	s2,0(sp)
    800039e4:	00813483          	ld	s1,8(sp)
    800039e8:	02010113          	addi	sp,sp,32
    800039ec:	00008067          	ret
    800039f0:	0104b903          	ld	s2,16(s1)
    800039f4:	fffff097          	auipc	ra,0xfffff
    800039f8:	874080e7          	jalr	-1932(ra) # 80002268 <mycpu>
    800039fc:	faa91ce3          	bne	s2,a0,800039b4 <acquire+0x58>
    80003a00:	00002517          	auipc	a0,0x2
    80003a04:	93050513          	addi	a0,a0,-1744 # 80005330 <digits+0x20>
    80003a08:	fffff097          	auipc	ra,0xfffff
    80003a0c:	224080e7          	jalr	548(ra) # 80002c2c <panic>
    80003a10:	00195913          	srli	s2,s2,0x1
    80003a14:	fffff097          	auipc	ra,0xfffff
    80003a18:	854080e7          	jalr	-1964(ra) # 80002268 <mycpu>
    80003a1c:	00197913          	andi	s2,s2,1
    80003a20:	07252e23          	sw	s2,124(a0)
    80003a24:	f75ff06f          	j	80003998 <acquire+0x3c>

0000000080003a28 <release>:
    80003a28:	fe010113          	addi	sp,sp,-32
    80003a2c:	00813823          	sd	s0,16(sp)
    80003a30:	00113c23          	sd	ra,24(sp)
    80003a34:	00913423          	sd	s1,8(sp)
    80003a38:	01213023          	sd	s2,0(sp)
    80003a3c:	02010413          	addi	s0,sp,32
    80003a40:	00052783          	lw	a5,0(a0)
    80003a44:	00079a63          	bnez	a5,80003a58 <release+0x30>
    80003a48:	00002517          	auipc	a0,0x2
    80003a4c:	8f050513          	addi	a0,a0,-1808 # 80005338 <digits+0x28>
    80003a50:	fffff097          	auipc	ra,0xfffff
    80003a54:	1dc080e7          	jalr	476(ra) # 80002c2c <panic>
    80003a58:	01053903          	ld	s2,16(a0)
    80003a5c:	00050493          	mv	s1,a0
    80003a60:	fffff097          	auipc	ra,0xfffff
    80003a64:	808080e7          	jalr	-2040(ra) # 80002268 <mycpu>
    80003a68:	fea910e3          	bne	s2,a0,80003a48 <release+0x20>
    80003a6c:	0004b823          	sd	zero,16(s1)
    80003a70:	0ff0000f          	fence
    80003a74:	0f50000f          	fence	iorw,ow
    80003a78:	0804a02f          	amoswap.w	zero,zero,(s1)
    80003a7c:	ffffe097          	auipc	ra,0xffffe
    80003a80:	7ec080e7          	jalr	2028(ra) # 80002268 <mycpu>
    80003a84:	100027f3          	csrr	a5,sstatus
    80003a88:	0027f793          	andi	a5,a5,2
    80003a8c:	04079a63          	bnez	a5,80003ae0 <release+0xb8>
    80003a90:	07852783          	lw	a5,120(a0)
    80003a94:	02f05e63          	blez	a5,80003ad0 <release+0xa8>
    80003a98:	fff7871b          	addiw	a4,a5,-1
    80003a9c:	06e52c23          	sw	a4,120(a0)
    80003aa0:	00071c63          	bnez	a4,80003ab8 <release+0x90>
    80003aa4:	07c52783          	lw	a5,124(a0)
    80003aa8:	00078863          	beqz	a5,80003ab8 <release+0x90>
    80003aac:	100027f3          	csrr	a5,sstatus
    80003ab0:	0027e793          	ori	a5,a5,2
    80003ab4:	10079073          	csrw	sstatus,a5
    80003ab8:	01813083          	ld	ra,24(sp)
    80003abc:	01013403          	ld	s0,16(sp)
    80003ac0:	00813483          	ld	s1,8(sp)
    80003ac4:	00013903          	ld	s2,0(sp)
    80003ac8:	02010113          	addi	sp,sp,32
    80003acc:	00008067          	ret
    80003ad0:	00002517          	auipc	a0,0x2
    80003ad4:	88850513          	addi	a0,a0,-1912 # 80005358 <digits+0x48>
    80003ad8:	fffff097          	auipc	ra,0xfffff
    80003adc:	154080e7          	jalr	340(ra) # 80002c2c <panic>
    80003ae0:	00002517          	auipc	a0,0x2
    80003ae4:	86050513          	addi	a0,a0,-1952 # 80005340 <digits+0x30>
    80003ae8:	fffff097          	auipc	ra,0xfffff
    80003aec:	144080e7          	jalr	324(ra) # 80002c2c <panic>

0000000080003af0 <holding>:
    80003af0:	00052783          	lw	a5,0(a0)
    80003af4:	00079663          	bnez	a5,80003b00 <holding+0x10>
    80003af8:	00000513          	li	a0,0
    80003afc:	00008067          	ret
    80003b00:	fe010113          	addi	sp,sp,-32
    80003b04:	00813823          	sd	s0,16(sp)
    80003b08:	00913423          	sd	s1,8(sp)
    80003b0c:	00113c23          	sd	ra,24(sp)
    80003b10:	02010413          	addi	s0,sp,32
    80003b14:	01053483          	ld	s1,16(a0)
    80003b18:	ffffe097          	auipc	ra,0xffffe
    80003b1c:	750080e7          	jalr	1872(ra) # 80002268 <mycpu>
    80003b20:	01813083          	ld	ra,24(sp)
    80003b24:	01013403          	ld	s0,16(sp)
    80003b28:	40a48533          	sub	a0,s1,a0
    80003b2c:	00153513          	seqz	a0,a0
    80003b30:	00813483          	ld	s1,8(sp)
    80003b34:	02010113          	addi	sp,sp,32
    80003b38:	00008067          	ret

0000000080003b3c <push_off>:
    80003b3c:	fe010113          	addi	sp,sp,-32
    80003b40:	00813823          	sd	s0,16(sp)
    80003b44:	00113c23          	sd	ra,24(sp)
    80003b48:	00913423          	sd	s1,8(sp)
    80003b4c:	02010413          	addi	s0,sp,32
    80003b50:	100024f3          	csrr	s1,sstatus
    80003b54:	100027f3          	csrr	a5,sstatus
    80003b58:	ffd7f793          	andi	a5,a5,-3
    80003b5c:	10079073          	csrw	sstatus,a5
    80003b60:	ffffe097          	auipc	ra,0xffffe
    80003b64:	708080e7          	jalr	1800(ra) # 80002268 <mycpu>
    80003b68:	07852783          	lw	a5,120(a0)
    80003b6c:	02078663          	beqz	a5,80003b98 <push_off+0x5c>
    80003b70:	ffffe097          	auipc	ra,0xffffe
    80003b74:	6f8080e7          	jalr	1784(ra) # 80002268 <mycpu>
    80003b78:	07852783          	lw	a5,120(a0)
    80003b7c:	01813083          	ld	ra,24(sp)
    80003b80:	01013403          	ld	s0,16(sp)
    80003b84:	0017879b          	addiw	a5,a5,1
    80003b88:	06f52c23          	sw	a5,120(a0)
    80003b8c:	00813483          	ld	s1,8(sp)
    80003b90:	02010113          	addi	sp,sp,32
    80003b94:	00008067          	ret
    80003b98:	0014d493          	srli	s1,s1,0x1
    80003b9c:	ffffe097          	auipc	ra,0xffffe
    80003ba0:	6cc080e7          	jalr	1740(ra) # 80002268 <mycpu>
    80003ba4:	0014f493          	andi	s1,s1,1
    80003ba8:	06952e23          	sw	s1,124(a0)
    80003bac:	fc5ff06f          	j	80003b70 <push_off+0x34>

0000000080003bb0 <pop_off>:
    80003bb0:	ff010113          	addi	sp,sp,-16
    80003bb4:	00813023          	sd	s0,0(sp)
    80003bb8:	00113423          	sd	ra,8(sp)
    80003bbc:	01010413          	addi	s0,sp,16
    80003bc0:	ffffe097          	auipc	ra,0xffffe
    80003bc4:	6a8080e7          	jalr	1704(ra) # 80002268 <mycpu>
    80003bc8:	100027f3          	csrr	a5,sstatus
    80003bcc:	0027f793          	andi	a5,a5,2
    80003bd0:	04079663          	bnez	a5,80003c1c <pop_off+0x6c>
    80003bd4:	07852783          	lw	a5,120(a0)
    80003bd8:	02f05a63          	blez	a5,80003c0c <pop_off+0x5c>
    80003bdc:	fff7871b          	addiw	a4,a5,-1
    80003be0:	06e52c23          	sw	a4,120(a0)
    80003be4:	00071c63          	bnez	a4,80003bfc <pop_off+0x4c>
    80003be8:	07c52783          	lw	a5,124(a0)
    80003bec:	00078863          	beqz	a5,80003bfc <pop_off+0x4c>
    80003bf0:	100027f3          	csrr	a5,sstatus
    80003bf4:	0027e793          	ori	a5,a5,2
    80003bf8:	10079073          	csrw	sstatus,a5
    80003bfc:	00813083          	ld	ra,8(sp)
    80003c00:	00013403          	ld	s0,0(sp)
    80003c04:	01010113          	addi	sp,sp,16
    80003c08:	00008067          	ret
    80003c0c:	00001517          	auipc	a0,0x1
    80003c10:	74c50513          	addi	a0,a0,1868 # 80005358 <digits+0x48>
    80003c14:	fffff097          	auipc	ra,0xfffff
    80003c18:	018080e7          	jalr	24(ra) # 80002c2c <panic>
    80003c1c:	00001517          	auipc	a0,0x1
    80003c20:	72450513          	addi	a0,a0,1828 # 80005340 <digits+0x30>
    80003c24:	fffff097          	auipc	ra,0xfffff
    80003c28:	008080e7          	jalr	8(ra) # 80002c2c <panic>

0000000080003c2c <push_on>:
    80003c2c:	fe010113          	addi	sp,sp,-32
    80003c30:	00813823          	sd	s0,16(sp)
    80003c34:	00113c23          	sd	ra,24(sp)
    80003c38:	00913423          	sd	s1,8(sp)
    80003c3c:	02010413          	addi	s0,sp,32
    80003c40:	100024f3          	csrr	s1,sstatus
    80003c44:	100027f3          	csrr	a5,sstatus
    80003c48:	0027e793          	ori	a5,a5,2
    80003c4c:	10079073          	csrw	sstatus,a5
    80003c50:	ffffe097          	auipc	ra,0xffffe
    80003c54:	618080e7          	jalr	1560(ra) # 80002268 <mycpu>
    80003c58:	07852783          	lw	a5,120(a0)
    80003c5c:	02078663          	beqz	a5,80003c88 <push_on+0x5c>
    80003c60:	ffffe097          	auipc	ra,0xffffe
    80003c64:	608080e7          	jalr	1544(ra) # 80002268 <mycpu>
    80003c68:	07852783          	lw	a5,120(a0)
    80003c6c:	01813083          	ld	ra,24(sp)
    80003c70:	01013403          	ld	s0,16(sp)
    80003c74:	0017879b          	addiw	a5,a5,1
    80003c78:	06f52c23          	sw	a5,120(a0)
    80003c7c:	00813483          	ld	s1,8(sp)
    80003c80:	02010113          	addi	sp,sp,32
    80003c84:	00008067          	ret
    80003c88:	0014d493          	srli	s1,s1,0x1
    80003c8c:	ffffe097          	auipc	ra,0xffffe
    80003c90:	5dc080e7          	jalr	1500(ra) # 80002268 <mycpu>
    80003c94:	0014f493          	andi	s1,s1,1
    80003c98:	06952e23          	sw	s1,124(a0)
    80003c9c:	fc5ff06f          	j	80003c60 <push_on+0x34>

0000000080003ca0 <pop_on>:
    80003ca0:	ff010113          	addi	sp,sp,-16
    80003ca4:	00813023          	sd	s0,0(sp)
    80003ca8:	00113423          	sd	ra,8(sp)
    80003cac:	01010413          	addi	s0,sp,16
    80003cb0:	ffffe097          	auipc	ra,0xffffe
    80003cb4:	5b8080e7          	jalr	1464(ra) # 80002268 <mycpu>
    80003cb8:	100027f3          	csrr	a5,sstatus
    80003cbc:	0027f793          	andi	a5,a5,2
    80003cc0:	04078463          	beqz	a5,80003d08 <pop_on+0x68>
    80003cc4:	07852783          	lw	a5,120(a0)
    80003cc8:	02f05863          	blez	a5,80003cf8 <pop_on+0x58>
    80003ccc:	fff7879b          	addiw	a5,a5,-1
    80003cd0:	06f52c23          	sw	a5,120(a0)
    80003cd4:	07853783          	ld	a5,120(a0)
    80003cd8:	00079863          	bnez	a5,80003ce8 <pop_on+0x48>
    80003cdc:	100027f3          	csrr	a5,sstatus
    80003ce0:	ffd7f793          	andi	a5,a5,-3
    80003ce4:	10079073          	csrw	sstatus,a5
    80003ce8:	00813083          	ld	ra,8(sp)
    80003cec:	00013403          	ld	s0,0(sp)
    80003cf0:	01010113          	addi	sp,sp,16
    80003cf4:	00008067          	ret
    80003cf8:	00001517          	auipc	a0,0x1
    80003cfc:	68850513          	addi	a0,a0,1672 # 80005380 <digits+0x70>
    80003d00:	fffff097          	auipc	ra,0xfffff
    80003d04:	f2c080e7          	jalr	-212(ra) # 80002c2c <panic>
    80003d08:	00001517          	auipc	a0,0x1
    80003d0c:	65850513          	addi	a0,a0,1624 # 80005360 <digits+0x50>
    80003d10:	fffff097          	auipc	ra,0xfffff
    80003d14:	f1c080e7          	jalr	-228(ra) # 80002c2c <panic>

0000000080003d18 <__memset>:
    80003d18:	ff010113          	addi	sp,sp,-16
    80003d1c:	00813423          	sd	s0,8(sp)
    80003d20:	01010413          	addi	s0,sp,16
    80003d24:	1a060e63          	beqz	a2,80003ee0 <__memset+0x1c8>
    80003d28:	40a007b3          	neg	a5,a0
    80003d2c:	0077f793          	andi	a5,a5,7
    80003d30:	00778693          	addi	a3,a5,7
    80003d34:	00b00813          	li	a6,11
    80003d38:	0ff5f593          	andi	a1,a1,255
    80003d3c:	fff6071b          	addiw	a4,a2,-1
    80003d40:	1b06e663          	bltu	a3,a6,80003eec <__memset+0x1d4>
    80003d44:	1cd76463          	bltu	a4,a3,80003f0c <__memset+0x1f4>
    80003d48:	1a078e63          	beqz	a5,80003f04 <__memset+0x1ec>
    80003d4c:	00b50023          	sb	a1,0(a0)
    80003d50:	00100713          	li	a4,1
    80003d54:	1ae78463          	beq	a5,a4,80003efc <__memset+0x1e4>
    80003d58:	00b500a3          	sb	a1,1(a0)
    80003d5c:	00200713          	li	a4,2
    80003d60:	1ae78a63          	beq	a5,a4,80003f14 <__memset+0x1fc>
    80003d64:	00b50123          	sb	a1,2(a0)
    80003d68:	00300713          	li	a4,3
    80003d6c:	18e78463          	beq	a5,a4,80003ef4 <__memset+0x1dc>
    80003d70:	00b501a3          	sb	a1,3(a0)
    80003d74:	00400713          	li	a4,4
    80003d78:	1ae78263          	beq	a5,a4,80003f1c <__memset+0x204>
    80003d7c:	00b50223          	sb	a1,4(a0)
    80003d80:	00500713          	li	a4,5
    80003d84:	1ae78063          	beq	a5,a4,80003f24 <__memset+0x20c>
    80003d88:	00b502a3          	sb	a1,5(a0)
    80003d8c:	00700713          	li	a4,7
    80003d90:	18e79e63          	bne	a5,a4,80003f2c <__memset+0x214>
    80003d94:	00b50323          	sb	a1,6(a0)
    80003d98:	00700e93          	li	t4,7
    80003d9c:	00859713          	slli	a4,a1,0x8
    80003da0:	00e5e733          	or	a4,a1,a4
    80003da4:	01059e13          	slli	t3,a1,0x10
    80003da8:	01c76e33          	or	t3,a4,t3
    80003dac:	01859313          	slli	t1,a1,0x18
    80003db0:	006e6333          	or	t1,t3,t1
    80003db4:	02059893          	slli	a7,a1,0x20
    80003db8:	40f60e3b          	subw	t3,a2,a5
    80003dbc:	011368b3          	or	a7,t1,a7
    80003dc0:	02859813          	slli	a6,a1,0x28
    80003dc4:	0108e833          	or	a6,a7,a6
    80003dc8:	03059693          	slli	a3,a1,0x30
    80003dcc:	003e589b          	srliw	a7,t3,0x3
    80003dd0:	00d866b3          	or	a3,a6,a3
    80003dd4:	03859713          	slli	a4,a1,0x38
    80003dd8:	00389813          	slli	a6,a7,0x3
    80003ddc:	00f507b3          	add	a5,a0,a5
    80003de0:	00e6e733          	or	a4,a3,a4
    80003de4:	000e089b          	sext.w	a7,t3
    80003de8:	00f806b3          	add	a3,a6,a5
    80003dec:	00e7b023          	sd	a4,0(a5)
    80003df0:	00878793          	addi	a5,a5,8
    80003df4:	fed79ce3          	bne	a5,a3,80003dec <__memset+0xd4>
    80003df8:	ff8e7793          	andi	a5,t3,-8
    80003dfc:	0007871b          	sext.w	a4,a5
    80003e00:	01d787bb          	addw	a5,a5,t4
    80003e04:	0ce88e63          	beq	a7,a4,80003ee0 <__memset+0x1c8>
    80003e08:	00f50733          	add	a4,a0,a5
    80003e0c:	00b70023          	sb	a1,0(a4)
    80003e10:	0017871b          	addiw	a4,a5,1
    80003e14:	0cc77663          	bgeu	a4,a2,80003ee0 <__memset+0x1c8>
    80003e18:	00e50733          	add	a4,a0,a4
    80003e1c:	00b70023          	sb	a1,0(a4)
    80003e20:	0027871b          	addiw	a4,a5,2
    80003e24:	0ac77e63          	bgeu	a4,a2,80003ee0 <__memset+0x1c8>
    80003e28:	00e50733          	add	a4,a0,a4
    80003e2c:	00b70023          	sb	a1,0(a4)
    80003e30:	0037871b          	addiw	a4,a5,3
    80003e34:	0ac77663          	bgeu	a4,a2,80003ee0 <__memset+0x1c8>
    80003e38:	00e50733          	add	a4,a0,a4
    80003e3c:	00b70023          	sb	a1,0(a4)
    80003e40:	0047871b          	addiw	a4,a5,4
    80003e44:	08c77e63          	bgeu	a4,a2,80003ee0 <__memset+0x1c8>
    80003e48:	00e50733          	add	a4,a0,a4
    80003e4c:	00b70023          	sb	a1,0(a4)
    80003e50:	0057871b          	addiw	a4,a5,5
    80003e54:	08c77663          	bgeu	a4,a2,80003ee0 <__memset+0x1c8>
    80003e58:	00e50733          	add	a4,a0,a4
    80003e5c:	00b70023          	sb	a1,0(a4)
    80003e60:	0067871b          	addiw	a4,a5,6
    80003e64:	06c77e63          	bgeu	a4,a2,80003ee0 <__memset+0x1c8>
    80003e68:	00e50733          	add	a4,a0,a4
    80003e6c:	00b70023          	sb	a1,0(a4)
    80003e70:	0077871b          	addiw	a4,a5,7
    80003e74:	06c77663          	bgeu	a4,a2,80003ee0 <__memset+0x1c8>
    80003e78:	00e50733          	add	a4,a0,a4
    80003e7c:	00b70023          	sb	a1,0(a4)
    80003e80:	0087871b          	addiw	a4,a5,8
    80003e84:	04c77e63          	bgeu	a4,a2,80003ee0 <__memset+0x1c8>
    80003e88:	00e50733          	add	a4,a0,a4
    80003e8c:	00b70023          	sb	a1,0(a4)
    80003e90:	0097871b          	addiw	a4,a5,9
    80003e94:	04c77663          	bgeu	a4,a2,80003ee0 <__memset+0x1c8>
    80003e98:	00e50733          	add	a4,a0,a4
    80003e9c:	00b70023          	sb	a1,0(a4)
    80003ea0:	00a7871b          	addiw	a4,a5,10
    80003ea4:	02c77e63          	bgeu	a4,a2,80003ee0 <__memset+0x1c8>
    80003ea8:	00e50733          	add	a4,a0,a4
    80003eac:	00b70023          	sb	a1,0(a4)
    80003eb0:	00b7871b          	addiw	a4,a5,11
    80003eb4:	02c77663          	bgeu	a4,a2,80003ee0 <__memset+0x1c8>
    80003eb8:	00e50733          	add	a4,a0,a4
    80003ebc:	00b70023          	sb	a1,0(a4)
    80003ec0:	00c7871b          	addiw	a4,a5,12
    80003ec4:	00c77e63          	bgeu	a4,a2,80003ee0 <__memset+0x1c8>
    80003ec8:	00e50733          	add	a4,a0,a4
    80003ecc:	00b70023          	sb	a1,0(a4)
    80003ed0:	00d7879b          	addiw	a5,a5,13
    80003ed4:	00c7f663          	bgeu	a5,a2,80003ee0 <__memset+0x1c8>
    80003ed8:	00f507b3          	add	a5,a0,a5
    80003edc:	00b78023          	sb	a1,0(a5)
    80003ee0:	00813403          	ld	s0,8(sp)
    80003ee4:	01010113          	addi	sp,sp,16
    80003ee8:	00008067          	ret
    80003eec:	00b00693          	li	a3,11
    80003ef0:	e55ff06f          	j	80003d44 <__memset+0x2c>
    80003ef4:	00300e93          	li	t4,3
    80003ef8:	ea5ff06f          	j	80003d9c <__memset+0x84>
    80003efc:	00100e93          	li	t4,1
    80003f00:	e9dff06f          	j	80003d9c <__memset+0x84>
    80003f04:	00000e93          	li	t4,0
    80003f08:	e95ff06f          	j	80003d9c <__memset+0x84>
    80003f0c:	00000793          	li	a5,0
    80003f10:	ef9ff06f          	j	80003e08 <__memset+0xf0>
    80003f14:	00200e93          	li	t4,2
    80003f18:	e85ff06f          	j	80003d9c <__memset+0x84>
    80003f1c:	00400e93          	li	t4,4
    80003f20:	e7dff06f          	j	80003d9c <__memset+0x84>
    80003f24:	00500e93          	li	t4,5
    80003f28:	e75ff06f          	j	80003d9c <__memset+0x84>
    80003f2c:	00600e93          	li	t4,6
    80003f30:	e6dff06f          	j	80003d9c <__memset+0x84>

0000000080003f34 <__memmove>:
    80003f34:	ff010113          	addi	sp,sp,-16
    80003f38:	00813423          	sd	s0,8(sp)
    80003f3c:	01010413          	addi	s0,sp,16
    80003f40:	0e060863          	beqz	a2,80004030 <__memmove+0xfc>
    80003f44:	fff6069b          	addiw	a3,a2,-1
    80003f48:	0006881b          	sext.w	a6,a3
    80003f4c:	0ea5e863          	bltu	a1,a0,8000403c <__memmove+0x108>
    80003f50:	00758713          	addi	a4,a1,7
    80003f54:	00a5e7b3          	or	a5,a1,a0
    80003f58:	40a70733          	sub	a4,a4,a0
    80003f5c:	0077f793          	andi	a5,a5,7
    80003f60:	00f73713          	sltiu	a4,a4,15
    80003f64:	00174713          	xori	a4,a4,1
    80003f68:	0017b793          	seqz	a5,a5
    80003f6c:	00e7f7b3          	and	a5,a5,a4
    80003f70:	10078863          	beqz	a5,80004080 <__memmove+0x14c>
    80003f74:	00900793          	li	a5,9
    80003f78:	1107f463          	bgeu	a5,a6,80004080 <__memmove+0x14c>
    80003f7c:	0036581b          	srliw	a6,a2,0x3
    80003f80:	fff8081b          	addiw	a6,a6,-1
    80003f84:	02081813          	slli	a6,a6,0x20
    80003f88:	01d85893          	srli	a7,a6,0x1d
    80003f8c:	00858813          	addi	a6,a1,8
    80003f90:	00058793          	mv	a5,a1
    80003f94:	00050713          	mv	a4,a0
    80003f98:	01088833          	add	a6,a7,a6
    80003f9c:	0007b883          	ld	a7,0(a5)
    80003fa0:	00878793          	addi	a5,a5,8
    80003fa4:	00870713          	addi	a4,a4,8
    80003fa8:	ff173c23          	sd	a7,-8(a4)
    80003fac:	ff0798e3          	bne	a5,a6,80003f9c <__memmove+0x68>
    80003fb0:	ff867713          	andi	a4,a2,-8
    80003fb4:	02071793          	slli	a5,a4,0x20
    80003fb8:	0207d793          	srli	a5,a5,0x20
    80003fbc:	00f585b3          	add	a1,a1,a5
    80003fc0:	40e686bb          	subw	a3,a3,a4
    80003fc4:	00f507b3          	add	a5,a0,a5
    80003fc8:	06e60463          	beq	a2,a4,80004030 <__memmove+0xfc>
    80003fcc:	0005c703          	lbu	a4,0(a1)
    80003fd0:	00e78023          	sb	a4,0(a5)
    80003fd4:	04068e63          	beqz	a3,80004030 <__memmove+0xfc>
    80003fd8:	0015c603          	lbu	a2,1(a1)
    80003fdc:	00100713          	li	a4,1
    80003fe0:	00c780a3          	sb	a2,1(a5)
    80003fe4:	04e68663          	beq	a3,a4,80004030 <__memmove+0xfc>
    80003fe8:	0025c603          	lbu	a2,2(a1)
    80003fec:	00200713          	li	a4,2
    80003ff0:	00c78123          	sb	a2,2(a5)
    80003ff4:	02e68e63          	beq	a3,a4,80004030 <__memmove+0xfc>
    80003ff8:	0035c603          	lbu	a2,3(a1)
    80003ffc:	00300713          	li	a4,3
    80004000:	00c781a3          	sb	a2,3(a5)
    80004004:	02e68663          	beq	a3,a4,80004030 <__memmove+0xfc>
    80004008:	0045c603          	lbu	a2,4(a1)
    8000400c:	00400713          	li	a4,4
    80004010:	00c78223          	sb	a2,4(a5)
    80004014:	00e68e63          	beq	a3,a4,80004030 <__memmove+0xfc>
    80004018:	0055c603          	lbu	a2,5(a1)
    8000401c:	00500713          	li	a4,5
    80004020:	00c782a3          	sb	a2,5(a5)
    80004024:	00e68663          	beq	a3,a4,80004030 <__memmove+0xfc>
    80004028:	0065c703          	lbu	a4,6(a1)
    8000402c:	00e78323          	sb	a4,6(a5)
    80004030:	00813403          	ld	s0,8(sp)
    80004034:	01010113          	addi	sp,sp,16
    80004038:	00008067          	ret
    8000403c:	02061713          	slli	a4,a2,0x20
    80004040:	02075713          	srli	a4,a4,0x20
    80004044:	00e587b3          	add	a5,a1,a4
    80004048:	f0f574e3          	bgeu	a0,a5,80003f50 <__memmove+0x1c>
    8000404c:	02069613          	slli	a2,a3,0x20
    80004050:	02065613          	srli	a2,a2,0x20
    80004054:	fff64613          	not	a2,a2
    80004058:	00e50733          	add	a4,a0,a4
    8000405c:	00c78633          	add	a2,a5,a2
    80004060:	fff7c683          	lbu	a3,-1(a5)
    80004064:	fff78793          	addi	a5,a5,-1
    80004068:	fff70713          	addi	a4,a4,-1
    8000406c:	00d70023          	sb	a3,0(a4)
    80004070:	fec798e3          	bne	a5,a2,80004060 <__memmove+0x12c>
    80004074:	00813403          	ld	s0,8(sp)
    80004078:	01010113          	addi	sp,sp,16
    8000407c:	00008067          	ret
    80004080:	02069713          	slli	a4,a3,0x20
    80004084:	02075713          	srli	a4,a4,0x20
    80004088:	00170713          	addi	a4,a4,1
    8000408c:	00e50733          	add	a4,a0,a4
    80004090:	00050793          	mv	a5,a0
    80004094:	0005c683          	lbu	a3,0(a1)
    80004098:	00178793          	addi	a5,a5,1
    8000409c:	00158593          	addi	a1,a1,1
    800040a0:	fed78fa3          	sb	a3,-1(a5)
    800040a4:	fee798e3          	bne	a5,a4,80004094 <__memmove+0x160>
    800040a8:	f89ff06f          	j	80004030 <__memmove+0xfc>

00000000800040ac <__putc>:
    800040ac:	fe010113          	addi	sp,sp,-32
    800040b0:	00813823          	sd	s0,16(sp)
    800040b4:	00113c23          	sd	ra,24(sp)
    800040b8:	02010413          	addi	s0,sp,32
    800040bc:	00050793          	mv	a5,a0
    800040c0:	fef40593          	addi	a1,s0,-17
    800040c4:	00100613          	li	a2,1
    800040c8:	00000513          	li	a0,0
    800040cc:	fef407a3          	sb	a5,-17(s0)
    800040d0:	fffff097          	auipc	ra,0xfffff
    800040d4:	b3c080e7          	jalr	-1220(ra) # 80002c0c <console_write>
    800040d8:	01813083          	ld	ra,24(sp)
    800040dc:	01013403          	ld	s0,16(sp)
    800040e0:	02010113          	addi	sp,sp,32
    800040e4:	00008067          	ret

00000000800040e8 <__getc>:
    800040e8:	fe010113          	addi	sp,sp,-32
    800040ec:	00813823          	sd	s0,16(sp)
    800040f0:	00113c23          	sd	ra,24(sp)
    800040f4:	02010413          	addi	s0,sp,32
    800040f8:	fe840593          	addi	a1,s0,-24
    800040fc:	00100613          	li	a2,1
    80004100:	00000513          	li	a0,0
    80004104:	fffff097          	auipc	ra,0xfffff
    80004108:	ae8080e7          	jalr	-1304(ra) # 80002bec <console_read>
    8000410c:	fe844503          	lbu	a0,-24(s0)
    80004110:	01813083          	ld	ra,24(sp)
    80004114:	01013403          	ld	s0,16(sp)
    80004118:	02010113          	addi	sp,sp,32
    8000411c:	00008067          	ret

0000000080004120 <console_handler>:
    80004120:	fe010113          	addi	sp,sp,-32
    80004124:	00813823          	sd	s0,16(sp)
    80004128:	00113c23          	sd	ra,24(sp)
    8000412c:	00913423          	sd	s1,8(sp)
    80004130:	02010413          	addi	s0,sp,32
    80004134:	14202773          	csrr	a4,scause
    80004138:	100027f3          	csrr	a5,sstatus
    8000413c:	0027f793          	andi	a5,a5,2
    80004140:	06079e63          	bnez	a5,800041bc <console_handler+0x9c>
    80004144:	00074c63          	bltz	a4,8000415c <console_handler+0x3c>
    80004148:	01813083          	ld	ra,24(sp)
    8000414c:	01013403          	ld	s0,16(sp)
    80004150:	00813483          	ld	s1,8(sp)
    80004154:	02010113          	addi	sp,sp,32
    80004158:	00008067          	ret
    8000415c:	0ff77713          	andi	a4,a4,255
    80004160:	00900793          	li	a5,9
    80004164:	fef712e3          	bne	a4,a5,80004148 <console_handler+0x28>
    80004168:	ffffe097          	auipc	ra,0xffffe
    8000416c:	6dc080e7          	jalr	1756(ra) # 80002844 <plic_claim>
    80004170:	00a00793          	li	a5,10
    80004174:	00050493          	mv	s1,a0
    80004178:	02f50c63          	beq	a0,a5,800041b0 <console_handler+0x90>
    8000417c:	fc0506e3          	beqz	a0,80004148 <console_handler+0x28>
    80004180:	00050593          	mv	a1,a0
    80004184:	00001517          	auipc	a0,0x1
    80004188:	10450513          	addi	a0,a0,260 # 80005288 <_ZZ12printIntegermE6digits+0x268>
    8000418c:	fffff097          	auipc	ra,0xfffff
    80004190:	afc080e7          	jalr	-1284(ra) # 80002c88 <__printf>
    80004194:	01013403          	ld	s0,16(sp)
    80004198:	01813083          	ld	ra,24(sp)
    8000419c:	00048513          	mv	a0,s1
    800041a0:	00813483          	ld	s1,8(sp)
    800041a4:	02010113          	addi	sp,sp,32
    800041a8:	ffffe317          	auipc	t1,0xffffe
    800041ac:	6d430067          	jr	1748(t1) # 8000287c <plic_complete>
    800041b0:	fffff097          	auipc	ra,0xfffff
    800041b4:	3e0080e7          	jalr	992(ra) # 80003590 <uartintr>
    800041b8:	fddff06f          	j	80004194 <console_handler+0x74>
    800041bc:	00001517          	auipc	a0,0x1
    800041c0:	1cc50513          	addi	a0,a0,460 # 80005388 <digits+0x78>
    800041c4:	fffff097          	auipc	ra,0xfffff
    800041c8:	a68080e7          	jalr	-1432(ra) # 80002c2c <panic>
	...
