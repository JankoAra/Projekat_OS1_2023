
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00006117          	auipc	sp,0x6
    80000004:	99813103          	ld	sp,-1640(sp) # 80005998 <_GLOBAL_OFFSET_TABLE_+0x10>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	621010ef          	jal	ra,80001e3c <start>

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
.extern interruptRoutine  #deklaracija imena interruptRoutine definisanog negde drugde
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
    80001188:	6b8000ef          	jal	ra,80001840 <interruptRoutine>

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

0000000080001220 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>:
.global _ZN3TCB13contextSwitchEPNS_7ContextES1_
.type _ZN3TCB13contextSwitchEPNS_7ContextES1_, @function
_ZN3TCB13contextSwitchEPNS_7ContextES1_:
	# a0 = adresa od oldContext
	# a1 = adresa od newContext
	sd ra, 0 * 8(a0)
    80001220:	00153023          	sd	ra,0(a0) # 1000 <_entry-0x7ffff000>
	sd sp, 1 * 8(a0)
    80001224:	00253423          	sd	sp,8(a0)

	ld ra, 0 * 8(a1)
    80001228:	0005b083          	ld	ra,0(a1)
    ld sp, 1 * 8(a1)
    8000122c:	0085b103          	ld	sp,8(a1)

    80001230:	00008067          	ret

0000000080001234 <_Z9mem_allocm>:

inline void scall() {
	__asm__ volatile("ecall");
}

void* mem_alloc(size_t size) {
    80001234:	ff010113          	addi	sp,sp,-16
    80001238:	00813423          	sd	s0,8(sp)
    8000123c:	01010413          	addi	s0,sp,16
	//size je u bajtovima, pretvara se u blokove
	size = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
    80001240:	00655793          	srli	a5,a0,0x6
    80001244:	03f57513          	andi	a0,a0,63
    80001248:	00050463          	beqz	a0,80001250 <_Z9mem_allocm+0x1c>
    8000124c:	00100513          	li	a0,1
    80001250:	00a78533          	add	a0,a5,a0
	__asm__ volatile("mv a1, %[size]": :[size] "r"(size));
    80001254:	00050593          	mv	a1,a0
inline void Riscv::w_sstatus(uint64 sstatus) {
	__asm__ volatile("csrw sstatus, %[sstatus]": :[sstatus] "r"(sstatus));
}

inline void Riscv::loadOpCode(uint64 opCode) {
	__asm__ volatile("mv a0, %[code]": :[code] "r"(opCode));
    80001258:	00100793          	li	a5,1
    8000125c:	00078513          	mv	a0,a5
	__asm__ volatile("ecall");
    80001260:	00000073          	ecall
	Riscv::loadOpCode(0x01);

	scall();

	void* ret;
	__asm__ volatile("mv %[ptr], a0":[ptr] "=r"(ret));
    80001264:	00050513          	mv	a0,a0
	return ret;
}
    80001268:	00813403          	ld	s0,8(sp)
    8000126c:	01010113          	addi	sp,sp,16
    80001270:	00008067          	ret

0000000080001274 <_Z8mem_freePv>:

int mem_free(void* ptr) {
    80001274:	ff010113          	addi	sp,sp,-16
    80001278:	00813423          	sd	s0,8(sp)
    8000127c:	01010413          	addi	s0,sp,16
	__asm__ volatile("mv a1, %[ptr]": :[ptr] "r"(ptr));
    80001280:	00050593          	mv	a1,a0
    80001284:	00200793          	li	a5,2
    80001288:	00078513          	mv	a0,a5
	__asm__ volatile("ecall");
    8000128c:	00000073          	ecall
	Riscv::loadOpCode(0x02);

	scall();

	int status;
	__asm__ volatile("mv %[status], a0":[status] "=r"(status));
    80001290:	00050513          	mv	a0,a0
	return status;
}
    80001294:	0005051b          	sext.w	a0,a0
    80001298:	00813403          	ld	s0,8(sp)
    8000129c:	01010113          	addi	sp,sp,16
    800012a0:	00008067          	ret

00000000800012a4 <_Z13thread_createPP3TCBPFvPvES2_>:

int thread_create(thread_t* handle, void (* start_routine)(void*), void* arg) {
    800012a4:	fd010113          	addi	sp,sp,-48
    800012a8:	02113423          	sd	ra,40(sp)
    800012ac:	02813023          	sd	s0,32(sp)
    800012b0:	00913c23          	sd	s1,24(sp)
    800012b4:	01213823          	sd	s2,16(sp)
    800012b8:	01313423          	sd	s3,8(sp)
    800012bc:	03010413          	addi	s0,sp,48
    800012c0:	00050993          	mv	s3,a0
    800012c4:	00058913          	mv	s2,a1
    800012c8:	00060493          	mv	s1,a2
	uint64* stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    800012cc:	00001537          	lui	a0,0x1
    800012d0:	00000097          	auipc	ra,0x0
    800012d4:	f64080e7          	jalr	-156(ra) # 80001234 <_Z9mem_allocm>
	__asm__ volatile("mv a1, %[handle]": :[handle] "r"(handle));
    800012d8:	00098593          	mv	a1,s3
	__asm__ volatile("mv a2, %[function]": :[function] "r"(start_routine));
    800012dc:	00090613          	mv	a2,s2
	__asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg));
    800012e0:	00048693          	mv	a3,s1
	__asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack));
    800012e4:	00050713          	mv	a4,a0
    800012e8:	01100793          	li	a5,17
    800012ec:	00078513          	mv	a0,a5
	__asm__ volatile("ecall");
    800012f0:	00000073          	ecall
	Riscv::loadOpCode(0x11);

	scall();

	int status;
	__asm__ volatile("mv %[status], a0":[status] "=r"(status));
    800012f4:	00050513          	mv	a0,a0
	return status;
}
    800012f8:	0005051b          	sext.w	a0,a0
    800012fc:	02813083          	ld	ra,40(sp)
    80001300:	02013403          	ld	s0,32(sp)
    80001304:	01813483          	ld	s1,24(sp)
    80001308:	01013903          	ld	s2,16(sp)
    8000130c:	00813983          	ld	s3,8(sp)
    80001310:	03010113          	addi	sp,sp,48
    80001314:	00008067          	ret

0000000080001318 <_Z11thread_exitv>:

int thread_exit() {
    80001318:	ff010113          	addi	sp,sp,-16
    8000131c:	00813423          	sd	s0,8(sp)
    80001320:	01010413          	addi	s0,sp,16
	return 0;
}
    80001324:	00000513          	li	a0,0
    80001328:	00813403          	ld	s0,8(sp)
    8000132c:	01010113          	addi	sp,sp,16
    80001330:	00008067          	ret

0000000080001334 <_Z15thread_dispatchv>:

void thread_dispatch() {
    80001334:	ff010113          	addi	sp,sp,-16
    80001338:	00813423          	sd	s0,8(sp)
    8000133c:	01010413          	addi	s0,sp,16

}
    80001340:	00813403          	ld	s0,8(sp)
    80001344:	01010113          	addi	sp,sp,16
    80001348:	00008067          	ret

000000008000134c <_Z11thread_joinP3TCB>:

void thread_join(thread_t handle) {
    8000134c:	ff010113          	addi	sp,sp,-16
    80001350:	00813423          	sd	s0,8(sp)
    80001354:	01010413          	addi	s0,sp,16

}
    80001358:	00813403          	ld	s0,8(sp)
    8000135c:	01010113          	addi	sp,sp,16
    80001360:	00008067          	ret

0000000080001364 <_Z10time_sleepm>:

int time_sleep(time_t) {
    80001364:	ff010113          	addi	sp,sp,-16
    80001368:	00813423          	sd	s0,8(sp)
    8000136c:	01010413          	addi	s0,sp,16
	return 0;
}
    80001370:	00000513          	li	a0,0
    80001374:	00813403          	ld	s0,8(sp)
    80001378:	01010113          	addi	sp,sp,16
    8000137c:	00008067          	ret

0000000080001380 <_Z8sem_openPP4_semj>:

int sem_open(sem_t* handle, unsigned int init) {
    80001380:	ff010113          	addi	sp,sp,-16
    80001384:	00813423          	sd	s0,8(sp)
    80001388:	01010413          	addi	s0,sp,16
	return 0;
}
    8000138c:	00000513          	li	a0,0
    80001390:	00813403          	ld	s0,8(sp)
    80001394:	01010113          	addi	sp,sp,16
    80001398:	00008067          	ret

000000008000139c <_Z9sem_closeP4_sem>:

int sem_close(sem_t handle) {
    8000139c:	ff010113          	addi	sp,sp,-16
    800013a0:	00813423          	sd	s0,8(sp)
    800013a4:	01010413          	addi	s0,sp,16
	return 0;
}
    800013a8:	00000513          	li	a0,0
    800013ac:	00813403          	ld	s0,8(sp)
    800013b0:	01010113          	addi	sp,sp,16
    800013b4:	00008067          	ret

00000000800013b8 <_Z8sem_waitP4_sem>:

int sem_wait(sem_t id) {
    800013b8:	ff010113          	addi	sp,sp,-16
    800013bc:	00813423          	sd	s0,8(sp)
    800013c0:	01010413          	addi	s0,sp,16
	return 0;
}
    800013c4:	00000513          	li	a0,0
    800013c8:	00813403          	ld	s0,8(sp)
    800013cc:	01010113          	addi	sp,sp,16
    800013d0:	00008067          	ret

00000000800013d4 <_Z10sem_signalP4_sem>:

int sem_signal(sem_t id) {
    800013d4:	ff010113          	addi	sp,sp,-16
    800013d8:	00813423          	sd	s0,8(sp)
    800013dc:	01010413          	addi	s0,sp,16
	return 0;
}
    800013e0:	00000513          	li	a0,0
    800013e4:	00813403          	ld	s0,8(sp)
    800013e8:	01010113          	addi	sp,sp,16
    800013ec:	00008067          	ret

00000000800013f0 <_Z4getcv>:

char getc() {
    800013f0:	ff010113          	addi	sp,sp,-16
    800013f4:	00813423          	sd	s0,8(sp)
    800013f8:	01010413          	addi	s0,sp,16
	return 0;
}
    800013fc:	00000513          	li	a0,0
    80001400:	00813403          	ld	s0,8(sp)
    80001404:	01010113          	addi	sp,sp,16
    80001408:	00008067          	ret

000000008000140c <_Z4putcc>:

void putc(char) {
    8000140c:	ff010113          	addi	sp,sp,-16
    80001410:	00813423          	sd	s0,8(sp)
    80001414:	01010413          	addi	s0,sp,16

}
    80001418:	00813403          	ld	s0,8(sp)
    8000141c:	01010113          	addi	sp,sp,16
    80001420:	00008067          	ret

0000000080001424 <_Z11printStringPKc>:
#include "../h/helper.hpp"
#include "../lib/console.h"
#include "../h/Riscv.hpp"

void printString(char const *string) {
    80001424:	fd010113          	addi	sp,sp,-48
    80001428:	02113423          	sd	ra,40(sp)
    8000142c:	02813023          	sd	s0,32(sp)
    80001430:	00913c23          	sd	s1,24(sp)
    80001434:	01213823          	sd	s2,16(sp)
    80001438:	03010413          	addi	s0,sp,48
    8000143c:	00050493          	mv	s1,a0
	__asm__ volatile("csrr %[sstatus], sstatus": [sstatus] "=r"(sstatus));
    80001440:	100027f3          	csrr	a5,sstatus
    80001444:	fcf43c23          	sd	a5,-40(s0)
	return sstatus;
    80001448:	fd843903          	ld	s2,-40(s0)
    uint64 oldMask = Riscv::r_sstatus() & Riscv::SSTATUS_SIE;
    8000144c:	00297913          	andi	s2,s2,2
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80001450:	00200793          	li	a5,2
    80001454:	1007b073          	csrc	sstatus,a5
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    while (*string != '\0') {
    80001458:	0004c503          	lbu	a0,0(s1)
    8000145c:	00050a63          	beqz	a0,80001470 <_Z11printStringPKc+0x4c>
        __putc(*string);
    80001460:	00003097          	auipc	ra,0x3
    80001464:	a9c080e7          	jalr	-1380(ra) # 80003efc <__putc>
        string++;
    80001468:	00148493          	addi	s1,s1,1
    while (*string != '\0') {
    8000146c:	fedff06f          	j	80001458 <_Z11printStringPKc+0x34>
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80001470:	10092073          	csrs	sstatus,s2
    }
    Riscv::ms_sstatus(oldMask);
}
    80001474:	02813083          	ld	ra,40(sp)
    80001478:	02013403          	ld	s0,32(sp)
    8000147c:	01813483          	ld	s1,24(sp)
    80001480:	01013903          	ld	s2,16(sp)
    80001484:	03010113          	addi	sp,sp,48
    80001488:	00008067          	ret

000000008000148c <_Z7printlnPKc>:

void println(char const *string) {
    8000148c:	fd010113          	addi	sp,sp,-48
    80001490:	02113423          	sd	ra,40(sp)
    80001494:	02813023          	sd	s0,32(sp)
    80001498:	00913c23          	sd	s1,24(sp)
    8000149c:	03010413          	addi	s0,sp,48
	__asm__ volatile("csrr %[sstatus], sstatus": [sstatus] "=r"(sstatus));
    800014a0:	100027f3          	csrr	a5,sstatus
    800014a4:	fcf43c23          	sd	a5,-40(s0)
	return sstatus;
    800014a8:	fd843483          	ld	s1,-40(s0)
    uint64 oldMask = Riscv::r_sstatus() & Riscv::SSTATUS_SIE;
    800014ac:	0024f493          	andi	s1,s1,2
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    800014b0:	00200793          	li	a5,2
    800014b4:	1007b073          	csrc	sstatus,a5
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    printString(string);
    800014b8:	00000097          	auipc	ra,0x0
    800014bc:	f6c080e7          	jalr	-148(ra) # 80001424 <_Z11printStringPKc>
    __putc('\n');
    800014c0:	00a00513          	li	a0,10
    800014c4:	00003097          	auipc	ra,0x3
    800014c8:	a38080e7          	jalr	-1480(ra) # 80003efc <__putc>
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    800014cc:	1004a073          	csrs	sstatus,s1
    Riscv::ms_sstatus(oldMask);
}
    800014d0:	02813083          	ld	ra,40(sp)
    800014d4:	02013403          	ld	s0,32(sp)
    800014d8:	01813483          	ld	s1,24(sp)
    800014dc:	03010113          	addi	sp,sp,48
    800014e0:	00008067          	ret

00000000800014e4 <_Z12printIntegerm>:

void printInteger(uint64 integer) {
    800014e4:	fc010113          	addi	sp,sp,-64
    800014e8:	02113c23          	sd	ra,56(sp)
    800014ec:	02813823          	sd	s0,48(sp)
    800014f0:	02913423          	sd	s1,40(sp)
    800014f4:	03213023          	sd	s2,32(sp)
    800014f8:	04010413          	addi	s0,sp,64
	__asm__ volatile("csrr %[sstatus], sstatus": [sstatus] "=r"(sstatus));
    800014fc:	100027f3          	csrr	a5,sstatus
    80001500:	fcf43423          	sd	a5,-56(s0)
	return sstatus;
    80001504:	fc843903          	ld	s2,-56(s0)
    uint64 oldMask = Riscv::r_sstatus() & Riscv::SSTATUS_SIE;
    80001508:	00297913          	andi	s2,s2,2
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    8000150c:	00200793          	li	a5,2
    80001510:	1007b073          	csrc	sstatus,a5
    neg = 0;
    if (integer < 0) {
        neg = 1;
        x = -integer;
    } else {
        x = integer;
    80001514:	0005051b          	sext.w	a0,a0
    }

    i = 0;
    80001518:	00000493          	li	s1,0
    do {
        buf[i++] = digits[x % 10];
    8000151c:	00a00613          	li	a2,10
    80001520:	02c5773b          	remuw	a4,a0,a2
    80001524:	02071693          	slli	a3,a4,0x20
    80001528:	0206d693          	srli	a3,a3,0x20
    8000152c:	00004717          	auipc	a4,0x4
    80001530:	af470713          	addi	a4,a4,-1292 # 80005020 <_ZZ12printIntegermE6digits>
    80001534:	00d70733          	add	a4,a4,a3
    80001538:	00074703          	lbu	a4,0(a4)
    8000153c:	fe040693          	addi	a3,s0,-32
    80001540:	009687b3          	add	a5,a3,s1
    80001544:	0014849b          	addiw	s1,s1,1
    80001548:	fee78823          	sb	a4,-16(a5)
    } while ((x /= 10) != 0);
    8000154c:	0005071b          	sext.w	a4,a0
    80001550:	02c5553b          	divuw	a0,a0,a2
    80001554:	00900793          	li	a5,9
    80001558:	fce7e2e3          	bltu	a5,a4,8000151c <_Z12printIntegerm+0x38>
    if (neg) buf[i++] = '-';

    while (--i >= 0) {
    8000155c:	fff4849b          	addiw	s1,s1,-1
    80001560:	0004ce63          	bltz	s1,8000157c <_Z12printIntegerm+0x98>
        __putc(buf[i]);
    80001564:	fe040793          	addi	a5,s0,-32
    80001568:	009787b3          	add	a5,a5,s1
    8000156c:	ff07c503          	lbu	a0,-16(a5)
    80001570:	00003097          	auipc	ra,0x3
    80001574:	98c080e7          	jalr	-1652(ra) # 80003efc <__putc>
    80001578:	fe5ff06f          	j	8000155c <_Z12printIntegerm+0x78>
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    8000157c:	10092073          	csrs	sstatus,s2
    }
    Riscv::ms_sstatus(oldMask);
}
    80001580:	03813083          	ld	ra,56(sp)
    80001584:	03013403          	ld	s0,48(sp)
    80001588:	02813483          	ld	s1,40(sp)
    8000158c:	02013903          	ld	s2,32(sp)
    80001590:	04010113          	addi	sp,sp,64
    80001594:	00008067          	ret

0000000080001598 <_Z41__static_initialization_and_destruction_0ii>:
	readyThreads.addLast(thread);
}

TCB* Scheduler::get() {
	return readyThreads.removeFirst();
}
    80001598:	ff010113          	addi	sp,sp,-16
    8000159c:	00813423          	sd	s0,8(sp)
    800015a0:	01010413          	addi	s0,sp,16
    800015a4:	00100793          	li	a5,1
    800015a8:	00f50863          	beq	a0,a5,800015b8 <_Z41__static_initialization_and_destruction_0ii+0x20>
    800015ac:	00813403          	ld	s0,8(sp)
    800015b0:	01010113          	addi	sp,sp,16
    800015b4:	00008067          	ret
    800015b8:	000107b7          	lui	a5,0x10
    800015bc:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    800015c0:	fef596e3          	bne	a1,a5,800015ac <_Z41__static_initialization_and_destruction_0ii+0x14>
	};

	Elem* head, * tail;
	uint64 numOfElements;
public:
	List() : head(nullptr), tail(nullptr), numOfElements(0) {}
    800015c4:	00004797          	auipc	a5,0x4
    800015c8:	43c78793          	addi	a5,a5,1084 # 80005a00 <_ZN9Scheduler12readyThreadsE>
    800015cc:	0007b023          	sd	zero,0(a5)
    800015d0:	0007b423          	sd	zero,8(a5)
    800015d4:	0007b823          	sd	zero,16(a5)
    800015d8:	fd5ff06f          	j	800015ac <_Z41__static_initialization_and_destruction_0ii+0x14>

00000000800015dc <_ZN9Scheduler3putEP3TCB>:
void Scheduler::put(TCB* thread) {
    800015dc:	fe010113          	addi	sp,sp,-32
    800015e0:	00113c23          	sd	ra,24(sp)
    800015e4:	00813823          	sd	s0,16(sp)
    800015e8:	00913423          	sd	s1,8(sp)
    800015ec:	02010413          	addi	s0,sp,32
    800015f0:	00050493          	mv	s1,a0
		if (!tail) { tail = head; }
		numOfElements++;
	}

	void addLast(T* data) {
		Elem* elem = new Elem(data, nullptr);
    800015f4:	01000513          	li	a0,16
    800015f8:	00000097          	auipc	ra,0x0
    800015fc:	114080e7          	jalr	276(ra) # 8000170c <_Znwm>
		Elem(T* data, Elem* next) : data(data), next(next) {}
    80001600:	00953023          	sd	s1,0(a0) # 1000 <_entry-0x7ffff000>
    80001604:	00053423          	sd	zero,8(a0)
		if (tail) {
    80001608:	00004797          	auipc	a5,0x4
    8000160c:	4007b783          	ld	a5,1024(a5) # 80005a08 <_ZN9Scheduler12readyThreadsE+0x8>
    80001610:	02078c63          	beqz	a5,80001648 <_ZN9Scheduler3putEP3TCB+0x6c>
			tail->next = elem;
    80001614:	00a7b423          	sd	a0,8(a5)
			tail = elem;
    80001618:	00004797          	auipc	a5,0x4
    8000161c:	3ea7b823          	sd	a0,1008(a5) # 80005a08 <_ZN9Scheduler12readyThreadsE+0x8>
		} else {
			head = tail = elem;
		}
		numOfElements++;
    80001620:	00004717          	auipc	a4,0x4
    80001624:	3e070713          	addi	a4,a4,992 # 80005a00 <_ZN9Scheduler12readyThreadsE>
    80001628:	01073783          	ld	a5,16(a4)
    8000162c:	00178793          	addi	a5,a5,1
    80001630:	00f73823          	sd	a5,16(a4)
}
    80001634:	01813083          	ld	ra,24(sp)
    80001638:	01013403          	ld	s0,16(sp)
    8000163c:	00813483          	ld	s1,8(sp)
    80001640:	02010113          	addi	sp,sp,32
    80001644:	00008067          	ret
			head = tail = elem;
    80001648:	00004797          	auipc	a5,0x4
    8000164c:	3b878793          	addi	a5,a5,952 # 80005a00 <_ZN9Scheduler12readyThreadsE>
    80001650:	00a7b423          	sd	a0,8(a5)
    80001654:	00a7b023          	sd	a0,0(a5)
    80001658:	fc9ff06f          	j	80001620 <_ZN9Scheduler3putEP3TCB+0x44>

000000008000165c <_ZN9Scheduler3getEv>:
TCB* Scheduler::get() {
    8000165c:	fe010113          	addi	sp,sp,-32
    80001660:	00113c23          	sd	ra,24(sp)
    80001664:	00813823          	sd	s0,16(sp)
    80001668:	00913423          	sd	s1,8(sp)
    8000166c:	02010413          	addi	s0,sp,32
	}

	T* removeFirst() {
		if (!head) { return nullptr; }
    80001670:	00004517          	auipc	a0,0x4
    80001674:	39053503          	ld	a0,912(a0) # 80005a00 <_ZN9Scheduler12readyThreadsE>
    80001678:	04050c63          	beqz	a0,800016d0 <_ZN9Scheduler3getEv+0x74>

		Elem* elem = head;
		head = head->next;
    8000167c:	00853783          	ld	a5,8(a0)
    80001680:	00004717          	auipc	a4,0x4
    80001684:	38f73023          	sd	a5,896(a4) # 80005a00 <_ZN9Scheduler12readyThreadsE>
		if (!head) { tail = nullptr; }
    80001688:	02078e63          	beqz	a5,800016c4 <_ZN9Scheduler3getEv+0x68>

		T* ret = elem->data;
    8000168c:	00053483          	ld	s1,0(a0)
		delete elem;
    80001690:	00000097          	auipc	ra,0x0
    80001694:	0cc080e7          	jalr	204(ra) # 8000175c <_ZdlPv>
		numOfElements--;
    80001698:	00004717          	auipc	a4,0x4
    8000169c:	36870713          	addi	a4,a4,872 # 80005a00 <_ZN9Scheduler12readyThreadsE>
    800016a0:	01073783          	ld	a5,16(a4)
    800016a4:	fff78793          	addi	a5,a5,-1
    800016a8:	00f73823          	sd	a5,16(a4)
}
    800016ac:	00048513          	mv	a0,s1
    800016b0:	01813083          	ld	ra,24(sp)
    800016b4:	01013403          	ld	s0,16(sp)
    800016b8:	00813483          	ld	s1,8(sp)
    800016bc:	02010113          	addi	sp,sp,32
    800016c0:	00008067          	ret
		if (!head) { tail = nullptr; }
    800016c4:	00004797          	auipc	a5,0x4
    800016c8:	3407b223          	sd	zero,836(a5) # 80005a08 <_ZN9Scheduler12readyThreadsE+0x8>
    800016cc:	fc1ff06f          	j	8000168c <_ZN9Scheduler3getEv+0x30>
		if (!head) { return nullptr; }
    800016d0:	00050493          	mv	s1,a0
	return readyThreads.removeFirst();
    800016d4:	fd9ff06f          	j	800016ac <_ZN9Scheduler3getEv+0x50>

00000000800016d8 <_GLOBAL__sub_I__ZN9Scheduler12readyThreadsE>:
}
    800016d8:	ff010113          	addi	sp,sp,-16
    800016dc:	00113423          	sd	ra,8(sp)
    800016e0:	00813023          	sd	s0,0(sp)
    800016e4:	01010413          	addi	s0,sp,16
    800016e8:	000105b7          	lui	a1,0x10
    800016ec:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    800016f0:	00100513          	li	a0,1
    800016f4:	00000097          	auipc	ra,0x0
    800016f8:	ea4080e7          	jalr	-348(ra) # 80001598 <_Z41__static_initialization_and_destruction_0ii>
    800016fc:	00813083          	ld	ra,8(sp)
    80001700:	00013403          	ld	s0,0(sp)
    80001704:	01010113          	addi	sp,sp,16
    80001708:	00008067          	ret

000000008000170c <_Znwm>:
//#include "../h/MemoryAllocator.hpp"

extern "C" void interruptHandler();

//override globalnog new
void* operator new(size_t size) {
    8000170c:	ff010113          	addi	sp,sp,-16
    80001710:	00113423          	sd	ra,8(sp)
    80001714:	00813023          	sd	s0,0(sp)
    80001718:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    8000171c:	00000097          	auipc	ra,0x0
    80001720:	b18080e7          	jalr	-1256(ra) # 80001234 <_Z9mem_allocm>
}
    80001724:	00813083          	ld	ra,8(sp)
    80001728:	00013403          	ld	s0,0(sp)
    8000172c:	01010113          	addi	sp,sp,16
    80001730:	00008067          	ret

0000000080001734 <_Znam>:

void* operator new[](size_t size) {
    80001734:	ff010113          	addi	sp,sp,-16
    80001738:	00113423          	sd	ra,8(sp)
    8000173c:	00813023          	sd	s0,0(sp)
    80001740:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    80001744:	00000097          	auipc	ra,0x0
    80001748:	af0080e7          	jalr	-1296(ra) # 80001234 <_Z9mem_allocm>
}
    8000174c:	00813083          	ld	ra,8(sp)
    80001750:	00013403          	ld	s0,0(sp)
    80001754:	01010113          	addi	sp,sp,16
    80001758:	00008067          	ret

000000008000175c <_ZdlPv>:

void operator delete(void* ptr)noexcept {
    8000175c:	ff010113          	addi	sp,sp,-16
    80001760:	00113423          	sd	ra,8(sp)
    80001764:	00813023          	sd	s0,0(sp)
    80001768:	01010413          	addi	s0,sp,16
mem_free(ptr);
    8000176c:	00000097          	auipc	ra,0x0
    80001770:	b08080e7          	jalr	-1272(ra) # 80001274 <_Z8mem_freePv>
}
    80001774:	00813083          	ld	ra,8(sp)
    80001778:	00013403          	ld	s0,0(sp)
    8000177c:	01010113          	addi	sp,sp,16
    80001780:	00008067          	ret

0000000080001784 <_ZdaPv>:

void operator delete[](void* ptr)noexcept {
    80001784:	ff010113          	addi	sp,sp,-16
    80001788:	00113423          	sd	ra,8(sp)
    8000178c:	00813023          	sd	s0,0(sp)
    80001790:	01010413          	addi	s0,sp,16
mem_free(ptr);
    80001794:	00000097          	auipc	ra,0x0
    80001798:	ae0080e7          	jalr	-1312(ra) # 80001274 <_Z8mem_freePv>
}
    8000179c:	00813083          	ld	ra,8(sp)
    800017a0:	00013403          	ld	s0,0(sp)
    800017a4:	01010113          	addi	sp,sp,16
    800017a8:	00008067          	ret

00000000800017ac <main>:
//void dispatch() {
//	__asm__ volatile ("mv %[savedPC], ra":[savedPC] "=r"(temp));
//	__asm__ volatile("mv ra, %[fAddress]": : [fAddress] "r"(&f));
//}

int main() {
    800017ac:	fe010113          	addi	sp,sp,-32
    800017b0:	00113c23          	sd	ra,24(sp)
    800017b4:	00813823          	sd	s0,16(sp)
    800017b8:	00913423          	sd	s1,8(sp)
    800017bc:	02010413          	addi	s0,sp,32
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    800017c0:	00200793          	li	a5,2
    800017c4:	1007b073          	csrc	sstatus,a5
	//zabrani prekide
	Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
	//postavi adresu prekidne rutine u stvec
	Riscv::w_stvec((uint64)&interruptHandler);
    800017c8:	00004797          	auipc	a5,0x4
    800017cc:	1e07b783          	ld	a5,480(a5) # 800059a8 <_GLOBAL_OFFSET_TABLE_+0x20>
	__asm__ volatile("csrw stvec, %[stvec]": :[stvec] "r"(stvec));
    800017d0:	10579073          	csrw	stvec,a5
	//omoguci prekide
	//Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
	uint64 i = 0;
    800017d4:	00000493          	li	s1,0
    800017d8:	0080006f          	j	800017e0 <main+0x34>
	for (; i < 10000; i++) {
    800017dc:	00148493          	addi	s1,s1,1
    800017e0:	000027b7          	lui	a5,0x2
    800017e4:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800017e8:	0297ea63          	bltu	a5,s1,8000181c <main+0x70>
		void* ptr = mem_alloc(0xffff);
    800017ec:	00010537          	lui	a0,0x10
    800017f0:	fff50513          	addi	a0,a0,-1 # ffff <_entry-0x7fff0001>
    800017f4:	00000097          	auipc	ra,0x0
    800017f8:	a40080e7          	jalr	-1472(ra) # 80001234 <_Z9mem_allocm>
		if (ptr == nullptr) break;
    800017fc:	02050063          	beqz	a0,8000181c <main+0x70>
		if (mem_free(ptr) == -1) {
    80001800:	00000097          	auipc	ra,0x0
    80001804:	a74080e7          	jalr	-1420(ra) # 80001274 <_Z8mem_freePv>
    80001808:	fff00793          	li	a5,-1
    8000180c:	fcf518e3          	bne	a0,a5,800017dc <main+0x30>
			i = 11111111;
    80001810:	00a994b7          	lui	s1,0xa99
    80001814:	ac748493          	addi	s1,s1,-1337 # a98ac7 <_entry-0x7f567539>
    80001818:	fc5ff06f          	j	800017dc <main+0x30>
		}
	}
	printInteger(i);
    8000181c:	00048513          	mv	a0,s1
    80001820:	00000097          	auipc	ra,0x0
    80001824:	cc4080e7          	jalr	-828(ra) # 800014e4 <_Z12printIntegerm>

    //maskiraj prekide
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    */
	return 0;
    80001828:	00000513          	li	a0,0
    8000182c:	01813083          	ld	ra,24(sp)
    80001830:	01013403          	ld	s0,16(sp)
    80001834:	00813483          	ld	s1,8(sp)
    80001838:	02010113          	addi	sp,sp,32
    8000183c:	00008067          	ret

0000000080001840 <interruptRoutine>:
#include "../h/helper.hpp"
#include "../h/Riscv.hpp"
#include "../h/syscall_c.hpp"
#include "../h/TCB.hpp"

extern "C" void interruptRoutine() {
    80001840:	fc010113          	addi	sp,sp,-64
    80001844:	02113c23          	sd	ra,56(sp)
    80001848:	02813823          	sd	s0,48(sp)
    8000184c:	02913423          	sd	s1,40(sp)
    80001850:	03213023          	sd	s2,32(sp)
    80001854:	01313c23          	sd	s3,24(sp)
    80001858:	04010413          	addi	s0,sp,64
	__asm__ volatile("csrr %[scause], scause": [scause] "=r"(scause));
    8000185c:	142027f3          	csrr	a5,scause
    80001860:	fcf43423          	sd	a5,-56(s0)
	return scause;
    80001864:	fc843483          	ld	s1,-56(s0)
	__asm__ volatile("csrr %[sepc], sepc": [sepc] "=r"(sepc));
    80001868:	141027f3          	csrr	a5,sepc
    8000186c:	fcf43023          	sd	a5,-64(s0)
	return sepc;
    80001870:	fc043903          	ld	s2,-64(s0)
	uint64 scause = Riscv::r_scause();
	uint64 sepc = Riscv::r_sepc();

	if (scause == 0x09 || scause == 0x08) {
    80001874:	ff848713          	addi	a4,s1,-8
    80001878:	00100793          	li	a5,1
    8000187c:	02e7f863          	bgeu	a5,a4,800018ac <interruptRoutine+0x6c>
				printInteger(sepc);
				break;
		}
		//sepc pokazuje na ecall instrukciju, treba preci na sledecu instrukciju
		Riscv::w_sepc(sepc + 4);
	} else if (scause == (1UL << 63 | 9)) {
    80001880:	fff00793          	li	a5,-1
    80001884:	03f79793          	slli	a5,a5,0x3f
    80001888:	00978793          	addi	a5,a5,9
    8000188c:	10f48a63          	beq	s1,a5,800019a0 <interruptRoutine+0x160>
		//spoljasnji hardverski prekid
		console_handler();
	} else if (scause == (1UL << 63 | 1)) {
    80001890:	fff00793          	li	a5,-1
    80001894:	03f79793          	slli	a5,a5,0x3f
    80001898:	00178793          	addi	a5,a5,1
    8000189c:	10f49863          	bne	s1,a5,800019ac <interruptRoutine+0x16c>
	__asm__ volatile("csrc sip, %[mask]": :[mask] "r"(mask));
    800018a0:	00200793          	li	a5,2
    800018a4:	1447b073          	csrc	sip,a5
}
    800018a8:	0440006f          	j	800018ec <interruptRoutine+0xac>
		__asm__ volatile("mv %[op], a0":[op] "=r"(opCode));
    800018ac:	00050993          	mv	s3,a0
		switch (opCode) {
    800018b0:	04200793          	li	a5,66
    800018b4:	0937ea63          	bltu	a5,s3,80001948 <interruptRoutine+0x108>
    800018b8:	00299713          	slli	a4,s3,0x2
    800018bc:	00003697          	auipc	a3,0x3
    800018c0:	7d068693          	addi	a3,a3,2000 # 8000508c <_ZZ12printIntegermE6digits+0x6c>
    800018c4:	00d70733          	add	a4,a4,a3
    800018c8:	00072783          	lw	a5,0(a4)
    800018cc:	00d787b3          	add	a5,a5,a3
    800018d0:	00078067          	jr	a5
				__asm__ volatile("mv %[size], a1":[size] "=r"(size));
    800018d4:	00058513          	mv	a0,a1
				MemoryAllocator::kmalloc(size);
    800018d8:	00651513          	slli	a0,a0,0x6
    800018dc:	00000097          	auipc	ra,0x0
    800018e0:	298080e7          	jalr	664(ra) # 80001b74 <_ZN15MemoryAllocator7kmallocEm>
		Riscv::w_sepc(sepc + 4);
    800018e4:	00490913          	addi	s2,s2,4
	__asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    800018e8:	14191073          	csrw	sepc,s2
		printString("scause: ");
		printInteger(scause);
		printString("\nsepc: ");
		printInteger(sepc);
	}
}
    800018ec:	03813083          	ld	ra,56(sp)
    800018f0:	03013403          	ld	s0,48(sp)
    800018f4:	02813483          	ld	s1,40(sp)
    800018f8:	02013903          	ld	s2,32(sp)
    800018fc:	01813983          	ld	s3,24(sp)
    80001900:	04010113          	addi	sp,sp,64
    80001904:	00008067          	ret
				__asm__ volatile("mv %[ptr], a1" :[ptr]"=r"(ptr));
    80001908:	00058513          	mv	a0,a1
				MemoryAllocator::kfree(ptr);
    8000190c:	00000097          	auipc	ra,0x0
    80001910:	410080e7          	jalr	1040(ra) # 80001d1c <_ZN15MemoryAllocator5kfreeEPv>
				break;
    80001914:	fd1ff06f          	j	800018e4 <interruptRoutine+0xa4>
				__asm__ volatile("mv %[sp], a4":[sp]"=r"(sp));
    80001918:	00070613          	mv	a2,a4
				__asm__ volatile("mv %[args], a3":[args]"=r"(args));
    8000191c:	00068593          	mv	a1,a3
				__asm__ volatile("mv %[f], a2":[f]"=r"(function));
    80001920:	00060513          	mv	a0,a2
				__asm__ volatile("mv %[handle], a1":[handle]"=r"(handle));
    80001924:	00058493          	mv	s1,a1
				*handle = TCB::createThread(function, args, sp);
    80001928:	00000097          	auipc	ra,0x0
    8000192c:	0e8080e7          	jalr	232(ra) # 80001a10 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80001930:	00a4b023          	sd	a0,0(s1)
				if(*handle!=nullptr){
    80001934:	00050663          	beqz	a0,80001940 <interruptRoutine+0x100>
					__asm__ volatile("li a0, 0");
    80001938:	00000513          	li	a0,0
    8000193c:	fa9ff06f          	j	800018e4 <interruptRoutine+0xa4>
					__asm__ volatile("li a0, -1");
    80001940:	fff00513          	li	a0,-1
    80001944:	fa1ff06f          	j	800018e4 <interruptRoutine+0xa4>
				printString("Nepostojeci op code: ");
    80001948:	00003517          	auipc	a0,0x3
    8000194c:	6e850513          	addi	a0,a0,1768 # 80005030 <_ZZ12printIntegermE6digits+0x10>
    80001950:	00000097          	auipc	ra,0x0
    80001954:	ad4080e7          	jalr	-1324(ra) # 80001424 <_Z11printStringPKc>
				printInteger(opCode);
    80001958:	00098513          	mv	a0,s3
    8000195c:	00000097          	auipc	ra,0x0
    80001960:	b88080e7          	jalr	-1144(ra) # 800014e4 <_Z12printIntegerm>
				printString("\nscause: ");
    80001964:	00003517          	auipc	a0,0x3
    80001968:	6e450513          	addi	a0,a0,1764 # 80005048 <_ZZ12printIntegermE6digits+0x28>
    8000196c:	00000097          	auipc	ra,0x0
    80001970:	ab8080e7          	jalr	-1352(ra) # 80001424 <_Z11printStringPKc>
				printInteger(scause);
    80001974:	00048513          	mv	a0,s1
    80001978:	00000097          	auipc	ra,0x0
    8000197c:	b6c080e7          	jalr	-1172(ra) # 800014e4 <_Z12printIntegerm>
				printString("\nsepc: ");
    80001980:	00003517          	auipc	a0,0x3
    80001984:	6d850513          	addi	a0,a0,1752 # 80005058 <_ZZ12printIntegermE6digits+0x38>
    80001988:	00000097          	auipc	ra,0x0
    8000198c:	a9c080e7          	jalr	-1380(ra) # 80001424 <_Z11printStringPKc>
				printInteger(sepc);
    80001990:	00090513          	mv	a0,s2
    80001994:	00000097          	auipc	ra,0x0
    80001998:	b50080e7          	jalr	-1200(ra) # 800014e4 <_Z12printIntegerm>
				break;
    8000199c:	f49ff06f          	j	800018e4 <interruptRoutine+0xa4>
		console_handler();
    800019a0:	00002097          	auipc	ra,0x2
    800019a4:	5d0080e7          	jalr	1488(ra) # 80003f70 <console_handler>
    800019a8:	f45ff06f          	j	800018ec <interruptRoutine+0xac>
		println("Greska u prekidnoj rutini");
    800019ac:	00003517          	auipc	a0,0x3
    800019b0:	6b450513          	addi	a0,a0,1716 # 80005060 <_ZZ12printIntegermE6digits+0x40>
    800019b4:	00000097          	auipc	ra,0x0
    800019b8:	ad8080e7          	jalr	-1320(ra) # 8000148c <_Z7printlnPKc>
		printString("scause: ");
    800019bc:	00003517          	auipc	a0,0x3
    800019c0:	6c450513          	addi	a0,a0,1732 # 80005080 <_ZZ12printIntegermE6digits+0x60>
    800019c4:	00000097          	auipc	ra,0x0
    800019c8:	a60080e7          	jalr	-1440(ra) # 80001424 <_Z11printStringPKc>
		printInteger(scause);
    800019cc:	00048513          	mv	a0,s1
    800019d0:	00000097          	auipc	ra,0x0
    800019d4:	b14080e7          	jalr	-1260(ra) # 800014e4 <_Z12printIntegerm>
		printString("\nsepc: ");
    800019d8:	00003517          	auipc	a0,0x3
    800019dc:	68050513          	addi	a0,a0,1664 # 80005058 <_ZZ12printIntegermE6digits+0x38>
    800019e0:	00000097          	auipc	ra,0x0
    800019e4:	a44080e7          	jalr	-1468(ra) # 80001424 <_Z11printStringPKc>
		printInteger(sepc);
    800019e8:	00090513          	mv	a0,s2
    800019ec:	00000097          	auipc	ra,0x0
    800019f0:	af8080e7          	jalr	-1288(ra) # 800014e4 <_Z12printIntegerm>
}
    800019f4:	ef9ff06f          	j	800018ec <interruptRoutine+0xac>

00000000800019f8 <_ZN3TCB15functionWrapperEPv>:
	Riscv::pushRegisters();
	TCB::dispatch();
	Riscv::popRegisters();
}

void TCB::functionWrapper(void*) {
    800019f8:	ff010113          	addi	sp,sp,-16
    800019fc:	00813423          	sd	s0,8(sp)
    80001a00:	01010413          	addi	s0,sp,16

}
    80001a04:	00813403          	ld	s0,8(sp)
    80001a08:	01010113          	addi	sp,sp,16
    80001a0c:	00008067          	ret

0000000080001a10 <_ZN3TCB12createThreadEPFvPvES0_Pm>:
TCB* TCB::createThread(TCB::Body function, void* args, uint64* stack) {
    80001a10:	fd010113          	addi	sp,sp,-48
    80001a14:	02113423          	sd	ra,40(sp)
    80001a18:	02813023          	sd	s0,32(sp)
    80001a1c:	00913c23          	sd	s1,24(sp)
    80001a20:	01213823          	sd	s2,16(sp)
    80001a24:	01313423          	sd	s3,8(sp)
    80001a28:	01413023          	sd	s4,0(sp)
    80001a2c:	03010413          	addi	s0,sp,48
    80001a30:	00050a13          	mv	s4,a0
    80001a34:	00058993          	mv	s3,a1
    80001a38:	00060913          	mv	s2,a2
	return new TCB(function, args, stack);
    80001a3c:	03800513          	li	a0,56
    80001a40:	00000097          	auipc	ra,0x0
    80001a44:	ccc080e7          	jalr	-820(ra) # 8000170c <_Znwm>
    80001a48:	00050493          	mv	s1,a0
	static void functionWrapper(void*);

	static TCB* running;
	static uint64 runningTimeSlice;

private:
    80001a4c:	01453823          	sd	s4,16(a0)
	TCB(Body function, void* args, uint64* stack) {
    80001a50:	03353023          	sd	s3,32(a0)
		this->threadFunction = function;
    80001a54:	01253c23          	sd	s2,24(a0)
		this->args = args;
    80001a58:	00200793          	li	a5,2
    80001a5c:	02f53423          	sd	a5,40(a0)
		this->stack = stack;
    80001a60:	02050823          	sb	zero,48(a0)
		this->timeSlice = DEFAULT_TIME_SLICE;
    80001a64:	020508a3          	sb	zero,49(a0)
		this->finished = false;
    80001a68:	00000797          	auipc	a5,0x0
    80001a6c:	f9078793          	addi	a5,a5,-112 # 800019f8 <_ZN3TCB15functionWrapperEPv>
    80001a70:	00f53423          	sd	a5,8(a0)
		this->blocked = false;
    80001a74:	00008637          	lui	a2,0x8
    80001a78:	00c90933          	add	s2,s2,a2
    80001a7c:	01253023          	sd	s2,0(a0)
		this->context.ra = (uint64)&functionWrapper;
		this->context.sp = (uint64)&stack[DEFAULT_STACK_SIZE];
    80001a80:	00000097          	auipc	ra,0x0
    80001a84:	b5c080e7          	jalr	-1188(ra) # 800015dc <_ZN9Scheduler3putEP3TCB>
    80001a88:	0200006f          	j	80001aa8 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x98>
    80001a8c:	00050913          	mv	s2,a0
    80001a90:	00048513          	mv	a0,s1
    80001a94:	00000097          	auipc	ra,0x0
    80001a98:	cc8080e7          	jalr	-824(ra) # 8000175c <_ZdlPv>
    80001a9c:	00090513          	mv	a0,s2
    80001aa0:	00005097          	auipc	ra,0x5
    80001aa4:	068080e7          	jalr	104(ra) # 80006b08 <_Unwind_Resume>
}
    80001aa8:	00048513          	mv	a0,s1
    80001aac:	02813083          	ld	ra,40(sp)
    80001ab0:	02013403          	ld	s0,32(sp)
    80001ab4:	01813483          	ld	s1,24(sp)
    80001ab8:	01013903          	ld	s2,16(sp)
    80001abc:	00813983          	ld	s3,8(sp)
    80001ac0:	00013a03          	ld	s4,0(sp)
    80001ac4:	03010113          	addi	sp,sp,48
    80001ac8:	00008067          	ret

0000000080001acc <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    80001acc:	fe010113          	addi	sp,sp,-32
    80001ad0:	00113c23          	sd	ra,24(sp)
    80001ad4:	00813823          	sd	s0,16(sp)
    80001ad8:	00913423          	sd	s1,8(sp)
    80001adc:	02010413          	addi	s0,sp,32
	TCB* old = TCB::running;
    80001ae0:	00004497          	auipc	s1,0x4
    80001ae4:	f384b483          	ld	s1,-200(s1) # 80005a18 <_ZN3TCB7runningE>
	bool isFinished() { return finished; }
    80001ae8:	0304c783          	lbu	a5,48(s1)
	if (!old->isFinished() && !old->isBlocked()) {
    80001aec:	00079663          	bnez	a5,80001af8 <_ZN3TCB8dispatchEv+0x2c>
	bool isBlocked() { return blocked; }
    80001af0:	0314c783          	lbu	a5,49(s1)
    80001af4:	02078c63          	beqz	a5,80001b2c <_ZN3TCB8dispatchEv+0x60>
	TCB::running = Scheduler::get();
    80001af8:	00000097          	auipc	ra,0x0
    80001afc:	b64080e7          	jalr	-1180(ra) # 8000165c <_ZN9Scheduler3getEv>
    80001b00:	00050593          	mv	a1,a0
    80001b04:	00004797          	auipc	a5,0x4
    80001b08:	f0a7ba23          	sd	a0,-236(a5) # 80005a18 <_ZN3TCB7runningE>
	TCB::contextSwitch(&old->context, &running->context);
    80001b0c:	00048513          	mv	a0,s1
    80001b10:	fffff097          	auipc	ra,0xfffff
    80001b14:	710080e7          	jalr	1808(ra) # 80001220 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80001b18:	01813083          	ld	ra,24(sp)
    80001b1c:	01013403          	ld	s0,16(sp)
    80001b20:	00813483          	ld	s1,8(sp)
    80001b24:	02010113          	addi	sp,sp,32
    80001b28:	00008067          	ret
		Scheduler::put(old);
    80001b2c:	00048513          	mv	a0,s1
    80001b30:	00000097          	auipc	ra,0x0
    80001b34:	aac080e7          	jalr	-1364(ra) # 800015dc <_ZN9Scheduler3putEP3TCB>
    80001b38:	fc1ff06f          	j	80001af8 <_ZN3TCB8dispatchEv+0x2c>

0000000080001b3c <_ZN3TCB5yieldEv>:
void TCB::yield() {
    80001b3c:	ff010113          	addi	sp,sp,-16
    80001b40:	00113423          	sd	ra,8(sp)
    80001b44:	00813023          	sd	s0,0(sp)
    80001b48:	01010413          	addi	s0,sp,16
	Riscv::pushRegisters();
    80001b4c:	fffff097          	auipc	ra,0xfffff
    80001b50:	4b4080e7          	jalr	1204(ra) # 80001000 <_ZN5Riscv13pushRegistersEv>
	TCB::dispatch();
    80001b54:	00000097          	auipc	ra,0x0
    80001b58:	f78080e7          	jalr	-136(ra) # 80001acc <_ZN3TCB8dispatchEv>
	Riscv::popRegisters();
    80001b5c:	fffff097          	auipc	ra,0xfffff
    80001b60:	520080e7          	jalr	1312(ra) # 8000107c <_ZN5Riscv12popRegistersEv>
}
    80001b64:	00813083          	ld	ra,8(sp)
    80001b68:	00013403          	ld	s0,0(sp)
    80001b6c:	01010113          	addi	sp,sp,16
    80001b70:	00008067          	ret

0000000080001b74 <_ZN15MemoryAllocator7kmallocEm>:

bool MemoryAllocator::initialized = false;
MemoryAllocator::FreeMemSegment* MemoryAllocator::freeMemHead = nullptr;
MemoryAllocator::UsedMemSegment* MemoryAllocator::usedMemHead = nullptr;

void* MemoryAllocator::kmalloc(size_t size) {
    80001b74:	ff010113          	addi	sp,sp,-16
    80001b78:	00813423          	sd	s0,8(sp)
    80001b7c:	01010413          	addi	s0,sp,16
	if (size <= 0) return nullptr;
    80001b80:	12050663          	beqz	a0,80001cac <_ZN15MemoryAllocator7kmallocEm+0x138>

	//pocetna inicijalizacija
	if (!initialized) {
    80001b84:	00004797          	auipc	a5,0x4
    80001b88:	ea47c783          	lbu	a5,-348(a5) # 80005a28 <_ZN15MemoryAllocator11initializedE>
    80001b8c:	04079663          	bnez	a5,80001bd8 <_ZN15MemoryAllocator7kmallocEm+0x64>
		freeMemHead = (FreeMemSegment*)HEAP_START_ADDR;
    80001b90:	00004617          	auipc	a2,0x4
    80001b94:	e0063603          	ld	a2,-512(a2) # 80005990 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001b98:	00063703          	ld	a4,0(a2)
    80001b9c:	00004797          	auipc	a5,0x4
    80001ba0:	e8c78793          	addi	a5,a5,-372 # 80005a28 <_ZN15MemoryAllocator11initializedE>
    80001ba4:	00e7b423          	sd	a4,8(a5)
		freeMemHead->next = nullptr;
    80001ba8:	00073023          	sd	zero,0(a4)
		freeMemHead->prev = nullptr;
    80001bac:	0087b683          	ld	a3,8(a5)
    80001bb0:	0006b423          	sd	zero,8(a3)
		freeMemHead->size = (char*)HEAP_END_ADDR - (char*)HEAP_START_ADDR;
    80001bb4:	00004717          	auipc	a4,0x4
    80001bb8:	dec73703          	ld	a4,-532(a4) # 800059a0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80001bbc:	00073703          	ld	a4,0(a4)
    80001bc0:	00063603          	ld	a2,0(a2)
    80001bc4:	40c70733          	sub	a4,a4,a2
    80001bc8:	00e6b823          	sd	a4,16(a3)
		usedMemHead = nullptr;
    80001bcc:	0007b823          	sd	zero,16(a5)

		initialized = true;
    80001bd0:	00100713          	li	a4,1
    80001bd4:	00e78023          	sb	a4,0(a5)
	}

	//alokacija uvek zaokruzena na blokove
	size += sizeof(UsedMemSegment);
    80001bd8:	01050513          	addi	a0,a0,16
	size_t blocks = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
    80001bdc:	00655713          	srli	a4,a0,0x6
    80001be0:	03f57793          	andi	a5,a0,63
    80001be4:	00078463          	beqz	a5,80001bec <_ZN15MemoryAllocator7kmallocEm+0x78>
    80001be8:	00100793          	li	a5,1
    80001bec:	00f707b3          	add	a5,a4,a5
	size = blocks * MEM_BLOCK_SIZE;
    80001bf0:	00679793          	slli	a5,a5,0x6

	//trazenje slobodnog segmenta po first-fit algoritmu
	for (FreeMemSegment* current = freeMemHead; current; current = current->next) {
    80001bf4:	00004517          	auipc	a0,0x4
    80001bf8:	e3c53503          	ld	a0,-452(a0) # 80005a30 <_ZN15MemoryAllocator11freeMemHeadE>
    80001bfc:	08050a63          	beqz	a0,80001c90 <_ZN15MemoryAllocator7kmallocEm+0x11c>
		if (current->size < size) continue;
    80001c00:	01053703          	ld	a4,16(a0)
    80001c04:	06f76263          	bltu	a4,a5,80001c68 <_ZN15MemoryAllocator7kmallocEm+0xf4>

		//pravljenje novog slobodnog fragmenta od ostatka fragmenta
		FreeMemSegment* remainderFree = (FreeMemSegment*)((char*)current + size);
    80001c08:	00f506b3          	add	a3,a0,a5
		remainderFree->size = current->size - size;
    80001c0c:	40f70733          	sub	a4,a4,a5
    80001c10:	00e6b823          	sd	a4,16(a3)
		remainderFree->prev = current->prev;
    80001c14:	00853703          	ld	a4,8(a0)
    80001c18:	00e6b423          	sd	a4,8(a3)
		if (current->prev) current->prev->next = remainderFree;
    80001c1c:	00070463          	beqz	a4,80001c24 <_ZN15MemoryAllocator7kmallocEm+0xb0>
    80001c20:	00d73023          	sd	a3,0(a4)
		remainderFree->next = current->next;
    80001c24:	00053703          	ld	a4,0(a0)
    80001c28:	00e6b023          	sd	a4,0(a3)
		if (current->next) current->next->prev = remainderFree;
    80001c2c:	00070463          	beqz	a4,80001c34 <_ZN15MemoryAllocator7kmallocEm+0xc0>
    80001c30:	00d73423          	sd	a3,8(a4)
		if (freeMemHead == current) freeMemHead = remainderFree;
    80001c34:	00004717          	auipc	a4,0x4
    80001c38:	dfc73703          	ld	a4,-516(a4) # 80005a30 <_ZN15MemoryAllocator11freeMemHeadE>
    80001c3c:	02a70a63          	beq	a4,a0,80001c70 <_ZN15MemoryAllocator7kmallocEm+0xfc>

		//ubacivanje novog fragmenta u listu zauzetih fragmenata
		UsedMemSegment* newFragment = (UsedMemSegment*)current;
		newFragment->size = size;
    80001c40:	00f53423          	sd	a5,8(a0)
		UsedMemSegment* prevUsed = nullptr;
		for (UsedMemSegment* cur = usedMemHead; cur && cur < newFragment; prevUsed = cur, cur = cur->next);
    80001c44:	00004697          	auipc	a3,0x4
    80001c48:	df46b683          	ld	a3,-524(a3) # 80005a38 <_ZN15MemoryAllocator11usedMemHeadE>
    80001c4c:	00068793          	mv	a5,a3
		UsedMemSegment* prevUsed = nullptr;
    80001c50:	00000713          	li	a4,0
		for (UsedMemSegment* cur = usedMemHead; cur && cur < newFragment; prevUsed = cur, cur = cur->next);
    80001c54:	02078463          	beqz	a5,80001c7c <_ZN15MemoryAllocator7kmallocEm+0x108>
    80001c58:	02a7f263          	bgeu	a5,a0,80001c7c <_ZN15MemoryAllocator7kmallocEm+0x108>
    80001c5c:	00078713          	mv	a4,a5
    80001c60:	0007b783          	ld	a5,0(a5)
    80001c64:	ff1ff06f          	j	80001c54 <_ZN15MemoryAllocator7kmallocEm+0xe0>
	for (FreeMemSegment* current = freeMemHead; current; current = current->next) {
    80001c68:	00053503          	ld	a0,0(a0)
    80001c6c:	f91ff06f          	j	80001bfc <_ZN15MemoryAllocator7kmallocEm+0x88>
		if (freeMemHead == current) freeMemHead = remainderFree;
    80001c70:	00004717          	auipc	a4,0x4
    80001c74:	dcd73023          	sd	a3,-576(a4) # 80005a30 <_ZN15MemoryAllocator11freeMemHeadE>
    80001c78:	fc9ff06f          	j	80001c40 <_ZN15MemoryAllocator7kmallocEm+0xcc>
		if (!prevUsed) {
    80001c7c:	02070063          	beqz	a4,80001c9c <_ZN15MemoryAllocator7kmallocEm+0x128>
			newFragment->next = usedMemHead;
			usedMemHead = newFragment;
		} else {
			newFragment->next = prevUsed->next;
    80001c80:	00073783          	ld	a5,0(a4)
    80001c84:	00f53023          	sd	a5,0(a0)
			prevUsed->next = newFragment;
    80001c88:	00a73023          	sd	a0,0(a4)
		}
		return (char*)newFragment + sizeof(UsedMemSegment);
    80001c8c:	01050513          	addi	a0,a0,16
	}
	return nullptr;
}
    80001c90:	00813403          	ld	s0,8(sp)
    80001c94:	01010113          	addi	sp,sp,16
    80001c98:	00008067          	ret
			newFragment->next = usedMemHead;
    80001c9c:	00d53023          	sd	a3,0(a0)
			usedMemHead = newFragment;
    80001ca0:	00004797          	auipc	a5,0x4
    80001ca4:	d8a7bc23          	sd	a0,-616(a5) # 80005a38 <_ZN15MemoryAllocator11usedMemHeadE>
    80001ca8:	fe5ff06f          	j	80001c8c <_ZN15MemoryAllocator7kmallocEm+0x118>
	if (size <= 0) return nullptr;
    80001cac:	00000513          	li	a0,0
    80001cb0:	fe1ff06f          	j	80001c90 <_ZN15MemoryAllocator7kmallocEm+0x11c>

0000000080001cb4 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>:
	tryToJoin(newFree);
	tryToJoin(prevFree);
	return 0;
}

int MemoryAllocator::tryToJoin(MemoryAllocator::FreeMemSegment* current) {
    80001cb4:	ff010113          	addi	sp,sp,-16
    80001cb8:	00813423          	sd	s0,8(sp)
    80001cbc:	01010413          	addi	s0,sp,16
	if (!current) return 0;
    80001cc0:	04050663          	beqz	a0,80001d0c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x58>
	if (current->next && (char*)current + current->size == (char*)(current->next)) {
    80001cc4:	00053783          	ld	a5,0(a0)
    80001cc8:	04078663          	beqz	a5,80001d14 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x60>
    80001ccc:	01053703          	ld	a4,16(a0)
    80001cd0:	00e506b3          	add	a3,a0,a4
    80001cd4:	00d78a63          	beq	a5,a3,80001ce8 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x34>
		current->size += current->next->size;
		current->next = current->next->next;
		if (current->next) current->next->prev = current;
		return 1;
	} else return 0;
    80001cd8:	00000513          	li	a0,0
}
    80001cdc:	00813403          	ld	s0,8(sp)
    80001ce0:	01010113          	addi	sp,sp,16
    80001ce4:	00008067          	ret
		current->size += current->next->size;
    80001ce8:	0107b683          	ld	a3,16(a5)
    80001cec:	00d70733          	add	a4,a4,a3
    80001cf0:	00e53823          	sd	a4,16(a0)
		current->next = current->next->next;
    80001cf4:	0007b783          	ld	a5,0(a5)
    80001cf8:	00f53023          	sd	a5,0(a0)
		if (current->next) current->next->prev = current;
    80001cfc:	00078463          	beqz	a5,80001d04 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x50>
    80001d00:	00a7b423          	sd	a0,8(a5)
		return 1;
    80001d04:	00100513          	li	a0,1
    80001d08:	fd5ff06f          	j	80001cdc <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>
	if (!current) return 0;
    80001d0c:	00000513          	li	a0,0
    80001d10:	fcdff06f          	j	80001cdc <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>
	} else return 0;
    80001d14:	00000513          	li	a0,0
    80001d18:	fc5ff06f          	j	80001cdc <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>

0000000080001d1c <_ZN15MemoryAllocator5kfreeEPv>:
	if (!ptr) return 0;
    80001d1c:	10050463          	beqz	a0,80001e24 <_ZN15MemoryAllocator5kfreeEPv+0x108>
    80001d20:	00050693          	mv	a3,a0
	if (!usedMemHead) return -1;
    80001d24:	00004797          	auipc	a5,0x4
    80001d28:	d147b783          	ld	a5,-748(a5) # 80005a38 <_ZN15MemoryAllocator11usedMemHeadE>
    80001d2c:	10078063          	beqz	a5,80001e2c <_ZN15MemoryAllocator5kfreeEPv+0x110>
	ptr = (char*)ptr - sizeof(UsedMemSegment);
    80001d30:	ff050513          	addi	a0,a0,-16
	UsedMemSegment* prevUsed = nullptr;
    80001d34:	00000713          	li	a4,0
	for (; currentUsed && currentUsed != ptr; prevUsed = currentUsed, currentUsed = currentUsed->next);
    80001d38:	00078a63          	beqz	a5,80001d4c <_ZN15MemoryAllocator5kfreeEPv+0x30>
    80001d3c:	00a78863          	beq	a5,a0,80001d4c <_ZN15MemoryAllocator5kfreeEPv+0x30>
    80001d40:	00078713          	mv	a4,a5
    80001d44:	0007b783          	ld	a5,0(a5)
    80001d48:	ff1ff06f          	j	80001d38 <_ZN15MemoryAllocator5kfreeEPv+0x1c>
	if (currentUsed != ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    80001d4c:	0ea79463          	bne	a5,a0,80001e34 <_ZN15MemoryAllocator5kfreeEPv+0x118>
int MemoryAllocator::kfree(void* ptr) {
    80001d50:	fe010113          	addi	sp,sp,-32
    80001d54:	00113c23          	sd	ra,24(sp)
    80001d58:	00813823          	sd	s0,16(sp)
    80001d5c:	00913423          	sd	s1,8(sp)
    80001d60:	02010413          	addi	s0,sp,32
	if (prevUsed) prevUsed->next = currentUsed->next;
    80001d64:	02070863          	beqz	a4,80001d94 <_ZN15MemoryAllocator5kfreeEPv+0x78>
    80001d68:	0007b783          	ld	a5,0(a5)
    80001d6c:	00f73023          	sd	a5,0(a4)
	if (!freeMemHead || ptr < (char*)freeMemHead) {
    80001d70:	00004797          	auipc	a5,0x4
    80001d74:	cc07b783          	ld	a5,-832(a5) # 80005a30 <_ZN15MemoryAllocator11freeMemHeadE>
    80001d78:	02078663          	beqz	a5,80001da4 <_ZN15MemoryAllocator5kfreeEPv+0x88>
    80001d7c:	02f56863          	bltu	a0,a5,80001dac <_ZN15MemoryAllocator5kfreeEPv+0x90>
			 prevFree->next != nullptr && ptr > (char*)(prevFree->next); prevFree = prevFree->next);
    80001d80:	00078493          	mv	s1,a5
    80001d84:	0007b783          	ld	a5,0(a5)
    80001d88:	02078463          	beqz	a5,80001db0 <_ZN15MemoryAllocator5kfreeEPv+0x94>
    80001d8c:	fea7eae3          	bltu	a5,a0,80001d80 <_ZN15MemoryAllocator5kfreeEPv+0x64>
    80001d90:	0200006f          	j	80001db0 <_ZN15MemoryAllocator5kfreeEPv+0x94>
	else usedMemHead = currentUsed->next;
    80001d94:	0007b783          	ld	a5,0(a5)
    80001d98:	00004717          	auipc	a4,0x4
    80001d9c:	caf73023          	sd	a5,-864(a4) # 80005a38 <_ZN15MemoryAllocator11usedMemHeadE>
    80001da0:	fd1ff06f          	j	80001d70 <_ZN15MemoryAllocator5kfreeEPv+0x54>
		prevFree = nullptr;
    80001da4:	00078493          	mv	s1,a5
    80001da8:	0080006f          	j	80001db0 <_ZN15MemoryAllocator5kfreeEPv+0x94>
    80001dac:	00000493          	li	s1,0
	size_t segmentSize = ((UsedMemSegment*)ptr)->size;
    80001db0:	ff86b783          	ld	a5,-8(a3)
	newFree->size = segmentSize;
    80001db4:	00f6b023          	sd	a5,0(a3)
	newFree->prev = prevFree;
    80001db8:	fe96bc23          	sd	s1,-8(a3)
	if (prevFree) newFree->next = prevFree->next;
    80001dbc:	04048663          	beqz	s1,80001e08 <_ZN15MemoryAllocator5kfreeEPv+0xec>
    80001dc0:	0004b783          	ld	a5,0(s1)
    80001dc4:	fef6b823          	sd	a5,-16(a3)
	if (newFree->next) newFree->next->prev = newFree;
    80001dc8:	ff06b783          	ld	a5,-16(a3)
    80001dcc:	00078463          	beqz	a5,80001dd4 <_ZN15MemoryAllocator5kfreeEPv+0xb8>
    80001dd0:	00a7b423          	sd	a0,8(a5)
	if (prevFree) prevFree->next = newFree;
    80001dd4:	04048263          	beqz	s1,80001e18 <_ZN15MemoryAllocator5kfreeEPv+0xfc>
    80001dd8:	00a4b023          	sd	a0,0(s1)
	tryToJoin(newFree);
    80001ddc:	00000097          	auipc	ra,0x0
    80001de0:	ed8080e7          	jalr	-296(ra) # 80001cb4 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
	tryToJoin(prevFree);
    80001de4:	00048513          	mv	a0,s1
    80001de8:	00000097          	auipc	ra,0x0
    80001dec:	ecc080e7          	jalr	-308(ra) # 80001cb4 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
	return 0;
    80001df0:	00000513          	li	a0,0
}
    80001df4:	01813083          	ld	ra,24(sp)
    80001df8:	01013403          	ld	s0,16(sp)
    80001dfc:	00813483          	ld	s1,8(sp)
    80001e00:	02010113          	addi	sp,sp,32
    80001e04:	00008067          	ret
	else newFree->next = freeMemHead;
    80001e08:	00004797          	auipc	a5,0x4
    80001e0c:	c287b783          	ld	a5,-984(a5) # 80005a30 <_ZN15MemoryAllocator11freeMemHeadE>
    80001e10:	fef6b823          	sd	a5,-16(a3)
    80001e14:	fb5ff06f          	j	80001dc8 <_ZN15MemoryAllocator5kfreeEPv+0xac>
	else freeMemHead = newFree;
    80001e18:	00004797          	auipc	a5,0x4
    80001e1c:	c0a7bc23          	sd	a0,-1000(a5) # 80005a30 <_ZN15MemoryAllocator11freeMemHeadE>
    80001e20:	fbdff06f          	j	80001ddc <_ZN15MemoryAllocator5kfreeEPv+0xc0>
	if (!ptr) return 0;
    80001e24:	00000513          	li	a0,0
    80001e28:	00008067          	ret
	if (!usedMemHead) return -1;
    80001e2c:	fff00513          	li	a0,-1
    80001e30:	00008067          	ret
	if (currentUsed != ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    80001e34:	fff00513          	li	a0,-1
}
    80001e38:	00008067          	ret

0000000080001e3c <start>:
    80001e3c:	ff010113          	addi	sp,sp,-16
    80001e40:	00813423          	sd	s0,8(sp)
    80001e44:	01010413          	addi	s0,sp,16
    80001e48:	300027f3          	csrr	a5,mstatus
    80001e4c:	ffffe737          	lui	a4,0xffffe
    80001e50:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff7b5f>
    80001e54:	00e7f7b3          	and	a5,a5,a4
    80001e58:	00001737          	lui	a4,0x1
    80001e5c:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80001e60:	00e7e7b3          	or	a5,a5,a4
    80001e64:	30079073          	csrw	mstatus,a5
    80001e68:	00000797          	auipc	a5,0x0
    80001e6c:	16078793          	addi	a5,a5,352 # 80001fc8 <system_main>
    80001e70:	34179073          	csrw	mepc,a5
    80001e74:	00000793          	li	a5,0
    80001e78:	18079073          	csrw	satp,a5
    80001e7c:	000107b7          	lui	a5,0x10
    80001e80:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80001e84:	30279073          	csrw	medeleg,a5
    80001e88:	30379073          	csrw	mideleg,a5
    80001e8c:	104027f3          	csrr	a5,sie
    80001e90:	2227e793          	ori	a5,a5,546
    80001e94:	10479073          	csrw	sie,a5
    80001e98:	fff00793          	li	a5,-1
    80001e9c:	00a7d793          	srli	a5,a5,0xa
    80001ea0:	3b079073          	csrw	pmpaddr0,a5
    80001ea4:	00f00793          	li	a5,15
    80001ea8:	3a079073          	csrw	pmpcfg0,a5
    80001eac:	f14027f3          	csrr	a5,mhartid
    80001eb0:	0200c737          	lui	a4,0x200c
    80001eb4:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80001eb8:	0007869b          	sext.w	a3,a5
    80001ebc:	00269713          	slli	a4,a3,0x2
    80001ec0:	000f4637          	lui	a2,0xf4
    80001ec4:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80001ec8:	00d70733          	add	a4,a4,a3
    80001ecc:	0037979b          	slliw	a5,a5,0x3
    80001ed0:	020046b7          	lui	a3,0x2004
    80001ed4:	00d787b3          	add	a5,a5,a3
    80001ed8:	00c585b3          	add	a1,a1,a2
    80001edc:	00371693          	slli	a3,a4,0x3
    80001ee0:	00004717          	auipc	a4,0x4
    80001ee4:	b6070713          	addi	a4,a4,-1184 # 80005a40 <timer_scratch>
    80001ee8:	00b7b023          	sd	a1,0(a5)
    80001eec:	00d70733          	add	a4,a4,a3
    80001ef0:	00f73c23          	sd	a5,24(a4)
    80001ef4:	02c73023          	sd	a2,32(a4)
    80001ef8:	34071073          	csrw	mscratch,a4
    80001efc:	00000797          	auipc	a5,0x0
    80001f00:	6e478793          	addi	a5,a5,1764 # 800025e0 <timervec>
    80001f04:	30579073          	csrw	mtvec,a5
    80001f08:	300027f3          	csrr	a5,mstatus
    80001f0c:	0087e793          	ori	a5,a5,8
    80001f10:	30079073          	csrw	mstatus,a5
    80001f14:	304027f3          	csrr	a5,mie
    80001f18:	0807e793          	ori	a5,a5,128
    80001f1c:	30479073          	csrw	mie,a5
    80001f20:	f14027f3          	csrr	a5,mhartid
    80001f24:	0007879b          	sext.w	a5,a5
    80001f28:	00078213          	mv	tp,a5
    80001f2c:	30200073          	mret
    80001f30:	00813403          	ld	s0,8(sp)
    80001f34:	01010113          	addi	sp,sp,16
    80001f38:	00008067          	ret

0000000080001f3c <timerinit>:
    80001f3c:	ff010113          	addi	sp,sp,-16
    80001f40:	00813423          	sd	s0,8(sp)
    80001f44:	01010413          	addi	s0,sp,16
    80001f48:	f14027f3          	csrr	a5,mhartid
    80001f4c:	0200c737          	lui	a4,0x200c
    80001f50:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80001f54:	0007869b          	sext.w	a3,a5
    80001f58:	00269713          	slli	a4,a3,0x2
    80001f5c:	000f4637          	lui	a2,0xf4
    80001f60:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80001f64:	00d70733          	add	a4,a4,a3
    80001f68:	0037979b          	slliw	a5,a5,0x3
    80001f6c:	020046b7          	lui	a3,0x2004
    80001f70:	00d787b3          	add	a5,a5,a3
    80001f74:	00c585b3          	add	a1,a1,a2
    80001f78:	00371693          	slli	a3,a4,0x3
    80001f7c:	00004717          	auipc	a4,0x4
    80001f80:	ac470713          	addi	a4,a4,-1340 # 80005a40 <timer_scratch>
    80001f84:	00b7b023          	sd	a1,0(a5)
    80001f88:	00d70733          	add	a4,a4,a3
    80001f8c:	00f73c23          	sd	a5,24(a4)
    80001f90:	02c73023          	sd	a2,32(a4)
    80001f94:	34071073          	csrw	mscratch,a4
    80001f98:	00000797          	auipc	a5,0x0
    80001f9c:	64878793          	addi	a5,a5,1608 # 800025e0 <timervec>
    80001fa0:	30579073          	csrw	mtvec,a5
    80001fa4:	300027f3          	csrr	a5,mstatus
    80001fa8:	0087e793          	ori	a5,a5,8
    80001fac:	30079073          	csrw	mstatus,a5
    80001fb0:	304027f3          	csrr	a5,mie
    80001fb4:	0807e793          	ori	a5,a5,128
    80001fb8:	30479073          	csrw	mie,a5
    80001fbc:	00813403          	ld	s0,8(sp)
    80001fc0:	01010113          	addi	sp,sp,16
    80001fc4:	00008067          	ret

0000000080001fc8 <system_main>:
    80001fc8:	fe010113          	addi	sp,sp,-32
    80001fcc:	00813823          	sd	s0,16(sp)
    80001fd0:	00913423          	sd	s1,8(sp)
    80001fd4:	00113c23          	sd	ra,24(sp)
    80001fd8:	02010413          	addi	s0,sp,32
    80001fdc:	00000097          	auipc	ra,0x0
    80001fe0:	0c4080e7          	jalr	196(ra) # 800020a0 <cpuid>
    80001fe4:	00004497          	auipc	s1,0x4
    80001fe8:	9ec48493          	addi	s1,s1,-1556 # 800059d0 <started>
    80001fec:	02050263          	beqz	a0,80002010 <system_main+0x48>
    80001ff0:	0004a783          	lw	a5,0(s1)
    80001ff4:	0007879b          	sext.w	a5,a5
    80001ff8:	fe078ce3          	beqz	a5,80001ff0 <system_main+0x28>
    80001ffc:	0ff0000f          	fence
    80002000:	00003517          	auipc	a0,0x3
    80002004:	1c850513          	addi	a0,a0,456 # 800051c8 <_ZZ12printIntegermE6digits+0x1a8>
    80002008:	00001097          	auipc	ra,0x1
    8000200c:	a74080e7          	jalr	-1420(ra) # 80002a7c <panic>
    80002010:	00001097          	auipc	ra,0x1
    80002014:	9c8080e7          	jalr	-1592(ra) # 800029d8 <consoleinit>
    80002018:	00001097          	auipc	ra,0x1
    8000201c:	154080e7          	jalr	340(ra) # 8000316c <printfinit>
    80002020:	00003517          	auipc	a0,0x3
    80002024:	28850513          	addi	a0,a0,648 # 800052a8 <_ZZ12printIntegermE6digits+0x288>
    80002028:	00001097          	auipc	ra,0x1
    8000202c:	ab0080e7          	jalr	-1360(ra) # 80002ad8 <__printf>
    80002030:	00003517          	auipc	a0,0x3
    80002034:	16850513          	addi	a0,a0,360 # 80005198 <_ZZ12printIntegermE6digits+0x178>
    80002038:	00001097          	auipc	ra,0x1
    8000203c:	aa0080e7          	jalr	-1376(ra) # 80002ad8 <__printf>
    80002040:	00003517          	auipc	a0,0x3
    80002044:	26850513          	addi	a0,a0,616 # 800052a8 <_ZZ12printIntegermE6digits+0x288>
    80002048:	00001097          	auipc	ra,0x1
    8000204c:	a90080e7          	jalr	-1392(ra) # 80002ad8 <__printf>
    80002050:	00001097          	auipc	ra,0x1
    80002054:	4a8080e7          	jalr	1192(ra) # 800034f8 <kinit>
    80002058:	00000097          	auipc	ra,0x0
    8000205c:	148080e7          	jalr	328(ra) # 800021a0 <trapinit>
    80002060:	00000097          	auipc	ra,0x0
    80002064:	16c080e7          	jalr	364(ra) # 800021cc <trapinithart>
    80002068:	00000097          	auipc	ra,0x0
    8000206c:	5b8080e7          	jalr	1464(ra) # 80002620 <plicinit>
    80002070:	00000097          	auipc	ra,0x0
    80002074:	5d8080e7          	jalr	1496(ra) # 80002648 <plicinithart>
    80002078:	00000097          	auipc	ra,0x0
    8000207c:	078080e7          	jalr	120(ra) # 800020f0 <userinit>
    80002080:	0ff0000f          	fence
    80002084:	00100793          	li	a5,1
    80002088:	00003517          	auipc	a0,0x3
    8000208c:	12850513          	addi	a0,a0,296 # 800051b0 <_ZZ12printIntegermE6digits+0x190>
    80002090:	00f4a023          	sw	a5,0(s1)
    80002094:	00001097          	auipc	ra,0x1
    80002098:	a44080e7          	jalr	-1468(ra) # 80002ad8 <__printf>
    8000209c:	0000006f          	j	8000209c <system_main+0xd4>

00000000800020a0 <cpuid>:
    800020a0:	ff010113          	addi	sp,sp,-16
    800020a4:	00813423          	sd	s0,8(sp)
    800020a8:	01010413          	addi	s0,sp,16
    800020ac:	00020513          	mv	a0,tp
    800020b0:	00813403          	ld	s0,8(sp)
    800020b4:	0005051b          	sext.w	a0,a0
    800020b8:	01010113          	addi	sp,sp,16
    800020bc:	00008067          	ret

00000000800020c0 <mycpu>:
    800020c0:	ff010113          	addi	sp,sp,-16
    800020c4:	00813423          	sd	s0,8(sp)
    800020c8:	01010413          	addi	s0,sp,16
    800020cc:	00020793          	mv	a5,tp
    800020d0:	00813403          	ld	s0,8(sp)
    800020d4:	0007879b          	sext.w	a5,a5
    800020d8:	00779793          	slli	a5,a5,0x7
    800020dc:	00005517          	auipc	a0,0x5
    800020e0:	99450513          	addi	a0,a0,-1644 # 80006a70 <cpus>
    800020e4:	00f50533          	add	a0,a0,a5
    800020e8:	01010113          	addi	sp,sp,16
    800020ec:	00008067          	ret

00000000800020f0 <userinit>:
    800020f0:	ff010113          	addi	sp,sp,-16
    800020f4:	00813423          	sd	s0,8(sp)
    800020f8:	01010413          	addi	s0,sp,16
    800020fc:	00813403          	ld	s0,8(sp)
    80002100:	01010113          	addi	sp,sp,16
    80002104:	fffff317          	auipc	t1,0xfffff
    80002108:	6a830067          	jr	1704(t1) # 800017ac <main>

000000008000210c <either_copyout>:
    8000210c:	ff010113          	addi	sp,sp,-16
    80002110:	00813023          	sd	s0,0(sp)
    80002114:	00113423          	sd	ra,8(sp)
    80002118:	01010413          	addi	s0,sp,16
    8000211c:	02051663          	bnez	a0,80002148 <either_copyout+0x3c>
    80002120:	00058513          	mv	a0,a1
    80002124:	00060593          	mv	a1,a2
    80002128:	0006861b          	sext.w	a2,a3
    8000212c:	00002097          	auipc	ra,0x2
    80002130:	c58080e7          	jalr	-936(ra) # 80003d84 <__memmove>
    80002134:	00813083          	ld	ra,8(sp)
    80002138:	00013403          	ld	s0,0(sp)
    8000213c:	00000513          	li	a0,0
    80002140:	01010113          	addi	sp,sp,16
    80002144:	00008067          	ret
    80002148:	00003517          	auipc	a0,0x3
    8000214c:	0a850513          	addi	a0,a0,168 # 800051f0 <_ZZ12printIntegermE6digits+0x1d0>
    80002150:	00001097          	auipc	ra,0x1
    80002154:	92c080e7          	jalr	-1748(ra) # 80002a7c <panic>

0000000080002158 <either_copyin>:
    80002158:	ff010113          	addi	sp,sp,-16
    8000215c:	00813023          	sd	s0,0(sp)
    80002160:	00113423          	sd	ra,8(sp)
    80002164:	01010413          	addi	s0,sp,16
    80002168:	02059463          	bnez	a1,80002190 <either_copyin+0x38>
    8000216c:	00060593          	mv	a1,a2
    80002170:	0006861b          	sext.w	a2,a3
    80002174:	00002097          	auipc	ra,0x2
    80002178:	c10080e7          	jalr	-1008(ra) # 80003d84 <__memmove>
    8000217c:	00813083          	ld	ra,8(sp)
    80002180:	00013403          	ld	s0,0(sp)
    80002184:	00000513          	li	a0,0
    80002188:	01010113          	addi	sp,sp,16
    8000218c:	00008067          	ret
    80002190:	00003517          	auipc	a0,0x3
    80002194:	08850513          	addi	a0,a0,136 # 80005218 <_ZZ12printIntegermE6digits+0x1f8>
    80002198:	00001097          	auipc	ra,0x1
    8000219c:	8e4080e7          	jalr	-1820(ra) # 80002a7c <panic>

00000000800021a0 <trapinit>:
    800021a0:	ff010113          	addi	sp,sp,-16
    800021a4:	00813423          	sd	s0,8(sp)
    800021a8:	01010413          	addi	s0,sp,16
    800021ac:	00813403          	ld	s0,8(sp)
    800021b0:	00003597          	auipc	a1,0x3
    800021b4:	09058593          	addi	a1,a1,144 # 80005240 <_ZZ12printIntegermE6digits+0x220>
    800021b8:	00005517          	auipc	a0,0x5
    800021bc:	93850513          	addi	a0,a0,-1736 # 80006af0 <tickslock>
    800021c0:	01010113          	addi	sp,sp,16
    800021c4:	00001317          	auipc	t1,0x1
    800021c8:	5c430067          	jr	1476(t1) # 80003788 <initlock>

00000000800021cc <trapinithart>:
    800021cc:	ff010113          	addi	sp,sp,-16
    800021d0:	00813423          	sd	s0,8(sp)
    800021d4:	01010413          	addi	s0,sp,16
    800021d8:	00000797          	auipc	a5,0x0
    800021dc:	2f878793          	addi	a5,a5,760 # 800024d0 <kernelvec>
    800021e0:	10579073          	csrw	stvec,a5
    800021e4:	00813403          	ld	s0,8(sp)
    800021e8:	01010113          	addi	sp,sp,16
    800021ec:	00008067          	ret

00000000800021f0 <usertrap>:
    800021f0:	ff010113          	addi	sp,sp,-16
    800021f4:	00813423          	sd	s0,8(sp)
    800021f8:	01010413          	addi	s0,sp,16
    800021fc:	00813403          	ld	s0,8(sp)
    80002200:	01010113          	addi	sp,sp,16
    80002204:	00008067          	ret

0000000080002208 <usertrapret>:
    80002208:	ff010113          	addi	sp,sp,-16
    8000220c:	00813423          	sd	s0,8(sp)
    80002210:	01010413          	addi	s0,sp,16
    80002214:	00813403          	ld	s0,8(sp)
    80002218:	01010113          	addi	sp,sp,16
    8000221c:	00008067          	ret

0000000080002220 <kerneltrap>:
    80002220:	fe010113          	addi	sp,sp,-32
    80002224:	00813823          	sd	s0,16(sp)
    80002228:	00113c23          	sd	ra,24(sp)
    8000222c:	00913423          	sd	s1,8(sp)
    80002230:	02010413          	addi	s0,sp,32
    80002234:	142025f3          	csrr	a1,scause
    80002238:	100027f3          	csrr	a5,sstatus
    8000223c:	0027f793          	andi	a5,a5,2
    80002240:	10079c63          	bnez	a5,80002358 <kerneltrap+0x138>
    80002244:	142027f3          	csrr	a5,scause
    80002248:	0207ce63          	bltz	a5,80002284 <kerneltrap+0x64>
    8000224c:	00003517          	auipc	a0,0x3
    80002250:	03c50513          	addi	a0,a0,60 # 80005288 <_ZZ12printIntegermE6digits+0x268>
    80002254:	00001097          	auipc	ra,0x1
    80002258:	884080e7          	jalr	-1916(ra) # 80002ad8 <__printf>
    8000225c:	141025f3          	csrr	a1,sepc
    80002260:	14302673          	csrr	a2,stval
    80002264:	00003517          	auipc	a0,0x3
    80002268:	03450513          	addi	a0,a0,52 # 80005298 <_ZZ12printIntegermE6digits+0x278>
    8000226c:	00001097          	auipc	ra,0x1
    80002270:	86c080e7          	jalr	-1940(ra) # 80002ad8 <__printf>
    80002274:	00003517          	auipc	a0,0x3
    80002278:	03c50513          	addi	a0,a0,60 # 800052b0 <_ZZ12printIntegermE6digits+0x290>
    8000227c:	00001097          	auipc	ra,0x1
    80002280:	800080e7          	jalr	-2048(ra) # 80002a7c <panic>
    80002284:	0ff7f713          	andi	a4,a5,255
    80002288:	00900693          	li	a3,9
    8000228c:	04d70063          	beq	a4,a3,800022cc <kerneltrap+0xac>
    80002290:	fff00713          	li	a4,-1
    80002294:	03f71713          	slli	a4,a4,0x3f
    80002298:	00170713          	addi	a4,a4,1
    8000229c:	fae798e3          	bne	a5,a4,8000224c <kerneltrap+0x2c>
    800022a0:	00000097          	auipc	ra,0x0
    800022a4:	e00080e7          	jalr	-512(ra) # 800020a0 <cpuid>
    800022a8:	06050663          	beqz	a0,80002314 <kerneltrap+0xf4>
    800022ac:	144027f3          	csrr	a5,sip
    800022b0:	ffd7f793          	andi	a5,a5,-3
    800022b4:	14479073          	csrw	sip,a5
    800022b8:	01813083          	ld	ra,24(sp)
    800022bc:	01013403          	ld	s0,16(sp)
    800022c0:	00813483          	ld	s1,8(sp)
    800022c4:	02010113          	addi	sp,sp,32
    800022c8:	00008067          	ret
    800022cc:	00000097          	auipc	ra,0x0
    800022d0:	3c8080e7          	jalr	968(ra) # 80002694 <plic_claim>
    800022d4:	00a00793          	li	a5,10
    800022d8:	00050493          	mv	s1,a0
    800022dc:	06f50863          	beq	a0,a5,8000234c <kerneltrap+0x12c>
    800022e0:	fc050ce3          	beqz	a0,800022b8 <kerneltrap+0x98>
    800022e4:	00050593          	mv	a1,a0
    800022e8:	00003517          	auipc	a0,0x3
    800022ec:	f8050513          	addi	a0,a0,-128 # 80005268 <_ZZ12printIntegermE6digits+0x248>
    800022f0:	00000097          	auipc	ra,0x0
    800022f4:	7e8080e7          	jalr	2024(ra) # 80002ad8 <__printf>
    800022f8:	01013403          	ld	s0,16(sp)
    800022fc:	01813083          	ld	ra,24(sp)
    80002300:	00048513          	mv	a0,s1
    80002304:	00813483          	ld	s1,8(sp)
    80002308:	02010113          	addi	sp,sp,32
    8000230c:	00000317          	auipc	t1,0x0
    80002310:	3c030067          	jr	960(t1) # 800026cc <plic_complete>
    80002314:	00004517          	auipc	a0,0x4
    80002318:	7dc50513          	addi	a0,a0,2012 # 80006af0 <tickslock>
    8000231c:	00001097          	auipc	ra,0x1
    80002320:	490080e7          	jalr	1168(ra) # 800037ac <acquire>
    80002324:	00003717          	auipc	a4,0x3
    80002328:	6b070713          	addi	a4,a4,1712 # 800059d4 <ticks>
    8000232c:	00072783          	lw	a5,0(a4)
    80002330:	00004517          	auipc	a0,0x4
    80002334:	7c050513          	addi	a0,a0,1984 # 80006af0 <tickslock>
    80002338:	0017879b          	addiw	a5,a5,1
    8000233c:	00f72023          	sw	a5,0(a4)
    80002340:	00001097          	auipc	ra,0x1
    80002344:	538080e7          	jalr	1336(ra) # 80003878 <release>
    80002348:	f65ff06f          	j	800022ac <kerneltrap+0x8c>
    8000234c:	00001097          	auipc	ra,0x1
    80002350:	094080e7          	jalr	148(ra) # 800033e0 <uartintr>
    80002354:	fa5ff06f          	j	800022f8 <kerneltrap+0xd8>
    80002358:	00003517          	auipc	a0,0x3
    8000235c:	ef050513          	addi	a0,a0,-272 # 80005248 <_ZZ12printIntegermE6digits+0x228>
    80002360:	00000097          	auipc	ra,0x0
    80002364:	71c080e7          	jalr	1820(ra) # 80002a7c <panic>

0000000080002368 <clockintr>:
    80002368:	fe010113          	addi	sp,sp,-32
    8000236c:	00813823          	sd	s0,16(sp)
    80002370:	00913423          	sd	s1,8(sp)
    80002374:	00113c23          	sd	ra,24(sp)
    80002378:	02010413          	addi	s0,sp,32
    8000237c:	00004497          	auipc	s1,0x4
    80002380:	77448493          	addi	s1,s1,1908 # 80006af0 <tickslock>
    80002384:	00048513          	mv	a0,s1
    80002388:	00001097          	auipc	ra,0x1
    8000238c:	424080e7          	jalr	1060(ra) # 800037ac <acquire>
    80002390:	00003717          	auipc	a4,0x3
    80002394:	64470713          	addi	a4,a4,1604 # 800059d4 <ticks>
    80002398:	00072783          	lw	a5,0(a4)
    8000239c:	01013403          	ld	s0,16(sp)
    800023a0:	01813083          	ld	ra,24(sp)
    800023a4:	00048513          	mv	a0,s1
    800023a8:	0017879b          	addiw	a5,a5,1
    800023ac:	00813483          	ld	s1,8(sp)
    800023b0:	00f72023          	sw	a5,0(a4)
    800023b4:	02010113          	addi	sp,sp,32
    800023b8:	00001317          	auipc	t1,0x1
    800023bc:	4c030067          	jr	1216(t1) # 80003878 <release>

00000000800023c0 <devintr>:
    800023c0:	142027f3          	csrr	a5,scause
    800023c4:	00000513          	li	a0,0
    800023c8:	0007c463          	bltz	a5,800023d0 <devintr+0x10>
    800023cc:	00008067          	ret
    800023d0:	fe010113          	addi	sp,sp,-32
    800023d4:	00813823          	sd	s0,16(sp)
    800023d8:	00113c23          	sd	ra,24(sp)
    800023dc:	00913423          	sd	s1,8(sp)
    800023e0:	02010413          	addi	s0,sp,32
    800023e4:	0ff7f713          	andi	a4,a5,255
    800023e8:	00900693          	li	a3,9
    800023ec:	04d70c63          	beq	a4,a3,80002444 <devintr+0x84>
    800023f0:	fff00713          	li	a4,-1
    800023f4:	03f71713          	slli	a4,a4,0x3f
    800023f8:	00170713          	addi	a4,a4,1
    800023fc:	00e78c63          	beq	a5,a4,80002414 <devintr+0x54>
    80002400:	01813083          	ld	ra,24(sp)
    80002404:	01013403          	ld	s0,16(sp)
    80002408:	00813483          	ld	s1,8(sp)
    8000240c:	02010113          	addi	sp,sp,32
    80002410:	00008067          	ret
    80002414:	00000097          	auipc	ra,0x0
    80002418:	c8c080e7          	jalr	-884(ra) # 800020a0 <cpuid>
    8000241c:	06050663          	beqz	a0,80002488 <devintr+0xc8>
    80002420:	144027f3          	csrr	a5,sip
    80002424:	ffd7f793          	andi	a5,a5,-3
    80002428:	14479073          	csrw	sip,a5
    8000242c:	01813083          	ld	ra,24(sp)
    80002430:	01013403          	ld	s0,16(sp)
    80002434:	00813483          	ld	s1,8(sp)
    80002438:	00200513          	li	a0,2
    8000243c:	02010113          	addi	sp,sp,32
    80002440:	00008067          	ret
    80002444:	00000097          	auipc	ra,0x0
    80002448:	250080e7          	jalr	592(ra) # 80002694 <plic_claim>
    8000244c:	00a00793          	li	a5,10
    80002450:	00050493          	mv	s1,a0
    80002454:	06f50663          	beq	a0,a5,800024c0 <devintr+0x100>
    80002458:	00100513          	li	a0,1
    8000245c:	fa0482e3          	beqz	s1,80002400 <devintr+0x40>
    80002460:	00048593          	mv	a1,s1
    80002464:	00003517          	auipc	a0,0x3
    80002468:	e0450513          	addi	a0,a0,-508 # 80005268 <_ZZ12printIntegermE6digits+0x248>
    8000246c:	00000097          	auipc	ra,0x0
    80002470:	66c080e7          	jalr	1644(ra) # 80002ad8 <__printf>
    80002474:	00048513          	mv	a0,s1
    80002478:	00000097          	auipc	ra,0x0
    8000247c:	254080e7          	jalr	596(ra) # 800026cc <plic_complete>
    80002480:	00100513          	li	a0,1
    80002484:	f7dff06f          	j	80002400 <devintr+0x40>
    80002488:	00004517          	auipc	a0,0x4
    8000248c:	66850513          	addi	a0,a0,1640 # 80006af0 <tickslock>
    80002490:	00001097          	auipc	ra,0x1
    80002494:	31c080e7          	jalr	796(ra) # 800037ac <acquire>
    80002498:	00003717          	auipc	a4,0x3
    8000249c:	53c70713          	addi	a4,a4,1340 # 800059d4 <ticks>
    800024a0:	00072783          	lw	a5,0(a4)
    800024a4:	00004517          	auipc	a0,0x4
    800024a8:	64c50513          	addi	a0,a0,1612 # 80006af0 <tickslock>
    800024ac:	0017879b          	addiw	a5,a5,1
    800024b0:	00f72023          	sw	a5,0(a4)
    800024b4:	00001097          	auipc	ra,0x1
    800024b8:	3c4080e7          	jalr	964(ra) # 80003878 <release>
    800024bc:	f65ff06f          	j	80002420 <devintr+0x60>
    800024c0:	00001097          	auipc	ra,0x1
    800024c4:	f20080e7          	jalr	-224(ra) # 800033e0 <uartintr>
    800024c8:	fadff06f          	j	80002474 <devintr+0xb4>
    800024cc:	0000                	unimp
	...

00000000800024d0 <kernelvec>:
    800024d0:	f0010113          	addi	sp,sp,-256
    800024d4:	00113023          	sd	ra,0(sp)
    800024d8:	00213423          	sd	sp,8(sp)
    800024dc:	00313823          	sd	gp,16(sp)
    800024e0:	00413c23          	sd	tp,24(sp)
    800024e4:	02513023          	sd	t0,32(sp)
    800024e8:	02613423          	sd	t1,40(sp)
    800024ec:	02713823          	sd	t2,48(sp)
    800024f0:	02813c23          	sd	s0,56(sp)
    800024f4:	04913023          	sd	s1,64(sp)
    800024f8:	04a13423          	sd	a0,72(sp)
    800024fc:	04b13823          	sd	a1,80(sp)
    80002500:	04c13c23          	sd	a2,88(sp)
    80002504:	06d13023          	sd	a3,96(sp)
    80002508:	06e13423          	sd	a4,104(sp)
    8000250c:	06f13823          	sd	a5,112(sp)
    80002510:	07013c23          	sd	a6,120(sp)
    80002514:	09113023          	sd	a7,128(sp)
    80002518:	09213423          	sd	s2,136(sp)
    8000251c:	09313823          	sd	s3,144(sp)
    80002520:	09413c23          	sd	s4,152(sp)
    80002524:	0b513023          	sd	s5,160(sp)
    80002528:	0b613423          	sd	s6,168(sp)
    8000252c:	0b713823          	sd	s7,176(sp)
    80002530:	0b813c23          	sd	s8,184(sp)
    80002534:	0d913023          	sd	s9,192(sp)
    80002538:	0da13423          	sd	s10,200(sp)
    8000253c:	0db13823          	sd	s11,208(sp)
    80002540:	0dc13c23          	sd	t3,216(sp)
    80002544:	0fd13023          	sd	t4,224(sp)
    80002548:	0fe13423          	sd	t5,232(sp)
    8000254c:	0ff13823          	sd	t6,240(sp)
    80002550:	cd1ff0ef          	jal	ra,80002220 <kerneltrap>
    80002554:	00013083          	ld	ra,0(sp)
    80002558:	00813103          	ld	sp,8(sp)
    8000255c:	01013183          	ld	gp,16(sp)
    80002560:	02013283          	ld	t0,32(sp)
    80002564:	02813303          	ld	t1,40(sp)
    80002568:	03013383          	ld	t2,48(sp)
    8000256c:	03813403          	ld	s0,56(sp)
    80002570:	04013483          	ld	s1,64(sp)
    80002574:	04813503          	ld	a0,72(sp)
    80002578:	05013583          	ld	a1,80(sp)
    8000257c:	05813603          	ld	a2,88(sp)
    80002580:	06013683          	ld	a3,96(sp)
    80002584:	06813703          	ld	a4,104(sp)
    80002588:	07013783          	ld	a5,112(sp)
    8000258c:	07813803          	ld	a6,120(sp)
    80002590:	08013883          	ld	a7,128(sp)
    80002594:	08813903          	ld	s2,136(sp)
    80002598:	09013983          	ld	s3,144(sp)
    8000259c:	09813a03          	ld	s4,152(sp)
    800025a0:	0a013a83          	ld	s5,160(sp)
    800025a4:	0a813b03          	ld	s6,168(sp)
    800025a8:	0b013b83          	ld	s7,176(sp)
    800025ac:	0b813c03          	ld	s8,184(sp)
    800025b0:	0c013c83          	ld	s9,192(sp)
    800025b4:	0c813d03          	ld	s10,200(sp)
    800025b8:	0d013d83          	ld	s11,208(sp)
    800025bc:	0d813e03          	ld	t3,216(sp)
    800025c0:	0e013e83          	ld	t4,224(sp)
    800025c4:	0e813f03          	ld	t5,232(sp)
    800025c8:	0f013f83          	ld	t6,240(sp)
    800025cc:	10010113          	addi	sp,sp,256
    800025d0:	10200073          	sret
    800025d4:	00000013          	nop
    800025d8:	00000013          	nop
    800025dc:	00000013          	nop

00000000800025e0 <timervec>:
    800025e0:	34051573          	csrrw	a0,mscratch,a0
    800025e4:	00b53023          	sd	a1,0(a0)
    800025e8:	00c53423          	sd	a2,8(a0)
    800025ec:	00d53823          	sd	a3,16(a0)
    800025f0:	01853583          	ld	a1,24(a0)
    800025f4:	02053603          	ld	a2,32(a0)
    800025f8:	0005b683          	ld	a3,0(a1)
    800025fc:	00c686b3          	add	a3,a3,a2
    80002600:	00d5b023          	sd	a3,0(a1)
    80002604:	00200593          	li	a1,2
    80002608:	14459073          	csrw	sip,a1
    8000260c:	01053683          	ld	a3,16(a0)
    80002610:	00853603          	ld	a2,8(a0)
    80002614:	00053583          	ld	a1,0(a0)
    80002618:	34051573          	csrrw	a0,mscratch,a0
    8000261c:	30200073          	mret

0000000080002620 <plicinit>:
    80002620:	ff010113          	addi	sp,sp,-16
    80002624:	00813423          	sd	s0,8(sp)
    80002628:	01010413          	addi	s0,sp,16
    8000262c:	00813403          	ld	s0,8(sp)
    80002630:	0c0007b7          	lui	a5,0xc000
    80002634:	00100713          	li	a4,1
    80002638:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000263c:	00e7a223          	sw	a4,4(a5)
    80002640:	01010113          	addi	sp,sp,16
    80002644:	00008067          	ret

0000000080002648 <plicinithart>:
    80002648:	ff010113          	addi	sp,sp,-16
    8000264c:	00813023          	sd	s0,0(sp)
    80002650:	00113423          	sd	ra,8(sp)
    80002654:	01010413          	addi	s0,sp,16
    80002658:	00000097          	auipc	ra,0x0
    8000265c:	a48080e7          	jalr	-1464(ra) # 800020a0 <cpuid>
    80002660:	0085171b          	slliw	a4,a0,0x8
    80002664:	0c0027b7          	lui	a5,0xc002
    80002668:	00e787b3          	add	a5,a5,a4
    8000266c:	40200713          	li	a4,1026
    80002670:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80002674:	00813083          	ld	ra,8(sp)
    80002678:	00013403          	ld	s0,0(sp)
    8000267c:	00d5151b          	slliw	a0,a0,0xd
    80002680:	0c2017b7          	lui	a5,0xc201
    80002684:	00a78533          	add	a0,a5,a0
    80002688:	00052023          	sw	zero,0(a0)
    8000268c:	01010113          	addi	sp,sp,16
    80002690:	00008067          	ret

0000000080002694 <plic_claim>:
    80002694:	ff010113          	addi	sp,sp,-16
    80002698:	00813023          	sd	s0,0(sp)
    8000269c:	00113423          	sd	ra,8(sp)
    800026a0:	01010413          	addi	s0,sp,16
    800026a4:	00000097          	auipc	ra,0x0
    800026a8:	9fc080e7          	jalr	-1540(ra) # 800020a0 <cpuid>
    800026ac:	00813083          	ld	ra,8(sp)
    800026b0:	00013403          	ld	s0,0(sp)
    800026b4:	00d5151b          	slliw	a0,a0,0xd
    800026b8:	0c2017b7          	lui	a5,0xc201
    800026bc:	00a78533          	add	a0,a5,a0
    800026c0:	00452503          	lw	a0,4(a0)
    800026c4:	01010113          	addi	sp,sp,16
    800026c8:	00008067          	ret

00000000800026cc <plic_complete>:
    800026cc:	fe010113          	addi	sp,sp,-32
    800026d0:	00813823          	sd	s0,16(sp)
    800026d4:	00913423          	sd	s1,8(sp)
    800026d8:	00113c23          	sd	ra,24(sp)
    800026dc:	02010413          	addi	s0,sp,32
    800026e0:	00050493          	mv	s1,a0
    800026e4:	00000097          	auipc	ra,0x0
    800026e8:	9bc080e7          	jalr	-1604(ra) # 800020a0 <cpuid>
    800026ec:	01813083          	ld	ra,24(sp)
    800026f0:	01013403          	ld	s0,16(sp)
    800026f4:	00d5179b          	slliw	a5,a0,0xd
    800026f8:	0c201737          	lui	a4,0xc201
    800026fc:	00f707b3          	add	a5,a4,a5
    80002700:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80002704:	00813483          	ld	s1,8(sp)
    80002708:	02010113          	addi	sp,sp,32
    8000270c:	00008067          	ret

0000000080002710 <consolewrite>:
    80002710:	fb010113          	addi	sp,sp,-80
    80002714:	04813023          	sd	s0,64(sp)
    80002718:	04113423          	sd	ra,72(sp)
    8000271c:	02913c23          	sd	s1,56(sp)
    80002720:	03213823          	sd	s2,48(sp)
    80002724:	03313423          	sd	s3,40(sp)
    80002728:	03413023          	sd	s4,32(sp)
    8000272c:	01513c23          	sd	s5,24(sp)
    80002730:	05010413          	addi	s0,sp,80
    80002734:	06c05c63          	blez	a2,800027ac <consolewrite+0x9c>
    80002738:	00060993          	mv	s3,a2
    8000273c:	00050a13          	mv	s4,a0
    80002740:	00058493          	mv	s1,a1
    80002744:	00000913          	li	s2,0
    80002748:	fff00a93          	li	s5,-1
    8000274c:	01c0006f          	j	80002768 <consolewrite+0x58>
    80002750:	fbf44503          	lbu	a0,-65(s0)
    80002754:	0019091b          	addiw	s2,s2,1
    80002758:	00148493          	addi	s1,s1,1
    8000275c:	00001097          	auipc	ra,0x1
    80002760:	a9c080e7          	jalr	-1380(ra) # 800031f8 <uartputc>
    80002764:	03298063          	beq	s3,s2,80002784 <consolewrite+0x74>
    80002768:	00048613          	mv	a2,s1
    8000276c:	00100693          	li	a3,1
    80002770:	000a0593          	mv	a1,s4
    80002774:	fbf40513          	addi	a0,s0,-65
    80002778:	00000097          	auipc	ra,0x0
    8000277c:	9e0080e7          	jalr	-1568(ra) # 80002158 <either_copyin>
    80002780:	fd5518e3          	bne	a0,s5,80002750 <consolewrite+0x40>
    80002784:	04813083          	ld	ra,72(sp)
    80002788:	04013403          	ld	s0,64(sp)
    8000278c:	03813483          	ld	s1,56(sp)
    80002790:	02813983          	ld	s3,40(sp)
    80002794:	02013a03          	ld	s4,32(sp)
    80002798:	01813a83          	ld	s5,24(sp)
    8000279c:	00090513          	mv	a0,s2
    800027a0:	03013903          	ld	s2,48(sp)
    800027a4:	05010113          	addi	sp,sp,80
    800027a8:	00008067          	ret
    800027ac:	00000913          	li	s2,0
    800027b0:	fd5ff06f          	j	80002784 <consolewrite+0x74>

00000000800027b4 <consoleread>:
    800027b4:	f9010113          	addi	sp,sp,-112
    800027b8:	06813023          	sd	s0,96(sp)
    800027bc:	04913c23          	sd	s1,88(sp)
    800027c0:	05213823          	sd	s2,80(sp)
    800027c4:	05313423          	sd	s3,72(sp)
    800027c8:	05413023          	sd	s4,64(sp)
    800027cc:	03513c23          	sd	s5,56(sp)
    800027d0:	03613823          	sd	s6,48(sp)
    800027d4:	03713423          	sd	s7,40(sp)
    800027d8:	03813023          	sd	s8,32(sp)
    800027dc:	06113423          	sd	ra,104(sp)
    800027e0:	01913c23          	sd	s9,24(sp)
    800027e4:	07010413          	addi	s0,sp,112
    800027e8:	00060b93          	mv	s7,a2
    800027ec:	00050913          	mv	s2,a0
    800027f0:	00058c13          	mv	s8,a1
    800027f4:	00060b1b          	sext.w	s6,a2
    800027f8:	00004497          	auipc	s1,0x4
    800027fc:	32048493          	addi	s1,s1,800 # 80006b18 <cons>
    80002800:	00400993          	li	s3,4
    80002804:	fff00a13          	li	s4,-1
    80002808:	00a00a93          	li	s5,10
    8000280c:	05705e63          	blez	s7,80002868 <consoleread+0xb4>
    80002810:	09c4a703          	lw	a4,156(s1)
    80002814:	0984a783          	lw	a5,152(s1)
    80002818:	0007071b          	sext.w	a4,a4
    8000281c:	08e78463          	beq	a5,a4,800028a4 <consoleread+0xf0>
    80002820:	07f7f713          	andi	a4,a5,127
    80002824:	00e48733          	add	a4,s1,a4
    80002828:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000282c:	0017869b          	addiw	a3,a5,1
    80002830:	08d4ac23          	sw	a3,152(s1)
    80002834:	00070c9b          	sext.w	s9,a4
    80002838:	0b370663          	beq	a4,s3,800028e4 <consoleread+0x130>
    8000283c:	00100693          	li	a3,1
    80002840:	f9f40613          	addi	a2,s0,-97
    80002844:	000c0593          	mv	a1,s8
    80002848:	00090513          	mv	a0,s2
    8000284c:	f8e40fa3          	sb	a4,-97(s0)
    80002850:	00000097          	auipc	ra,0x0
    80002854:	8bc080e7          	jalr	-1860(ra) # 8000210c <either_copyout>
    80002858:	01450863          	beq	a0,s4,80002868 <consoleread+0xb4>
    8000285c:	001c0c13          	addi	s8,s8,1
    80002860:	fffb8b9b          	addiw	s7,s7,-1
    80002864:	fb5c94e3          	bne	s9,s5,8000280c <consoleread+0x58>
    80002868:	000b851b          	sext.w	a0,s7
    8000286c:	06813083          	ld	ra,104(sp)
    80002870:	06013403          	ld	s0,96(sp)
    80002874:	05813483          	ld	s1,88(sp)
    80002878:	05013903          	ld	s2,80(sp)
    8000287c:	04813983          	ld	s3,72(sp)
    80002880:	04013a03          	ld	s4,64(sp)
    80002884:	03813a83          	ld	s5,56(sp)
    80002888:	02813b83          	ld	s7,40(sp)
    8000288c:	02013c03          	ld	s8,32(sp)
    80002890:	01813c83          	ld	s9,24(sp)
    80002894:	40ab053b          	subw	a0,s6,a0
    80002898:	03013b03          	ld	s6,48(sp)
    8000289c:	07010113          	addi	sp,sp,112
    800028a0:	00008067          	ret
    800028a4:	00001097          	auipc	ra,0x1
    800028a8:	1d8080e7          	jalr	472(ra) # 80003a7c <push_on>
    800028ac:	0984a703          	lw	a4,152(s1)
    800028b0:	09c4a783          	lw	a5,156(s1)
    800028b4:	0007879b          	sext.w	a5,a5
    800028b8:	fef70ce3          	beq	a4,a5,800028b0 <consoleread+0xfc>
    800028bc:	00001097          	auipc	ra,0x1
    800028c0:	234080e7          	jalr	564(ra) # 80003af0 <pop_on>
    800028c4:	0984a783          	lw	a5,152(s1)
    800028c8:	07f7f713          	andi	a4,a5,127
    800028cc:	00e48733          	add	a4,s1,a4
    800028d0:	01874703          	lbu	a4,24(a4)
    800028d4:	0017869b          	addiw	a3,a5,1
    800028d8:	08d4ac23          	sw	a3,152(s1)
    800028dc:	00070c9b          	sext.w	s9,a4
    800028e0:	f5371ee3          	bne	a4,s3,8000283c <consoleread+0x88>
    800028e4:	000b851b          	sext.w	a0,s7
    800028e8:	f96bf2e3          	bgeu	s7,s6,8000286c <consoleread+0xb8>
    800028ec:	08f4ac23          	sw	a5,152(s1)
    800028f0:	f7dff06f          	j	8000286c <consoleread+0xb8>

00000000800028f4 <consputc>:
    800028f4:	10000793          	li	a5,256
    800028f8:	00f50663          	beq	a0,a5,80002904 <consputc+0x10>
    800028fc:	00001317          	auipc	t1,0x1
    80002900:	9f430067          	jr	-1548(t1) # 800032f0 <uartputc_sync>
    80002904:	ff010113          	addi	sp,sp,-16
    80002908:	00113423          	sd	ra,8(sp)
    8000290c:	00813023          	sd	s0,0(sp)
    80002910:	01010413          	addi	s0,sp,16
    80002914:	00800513          	li	a0,8
    80002918:	00001097          	auipc	ra,0x1
    8000291c:	9d8080e7          	jalr	-1576(ra) # 800032f0 <uartputc_sync>
    80002920:	02000513          	li	a0,32
    80002924:	00001097          	auipc	ra,0x1
    80002928:	9cc080e7          	jalr	-1588(ra) # 800032f0 <uartputc_sync>
    8000292c:	00013403          	ld	s0,0(sp)
    80002930:	00813083          	ld	ra,8(sp)
    80002934:	00800513          	li	a0,8
    80002938:	01010113          	addi	sp,sp,16
    8000293c:	00001317          	auipc	t1,0x1
    80002940:	9b430067          	jr	-1612(t1) # 800032f0 <uartputc_sync>

0000000080002944 <consoleintr>:
    80002944:	fe010113          	addi	sp,sp,-32
    80002948:	00813823          	sd	s0,16(sp)
    8000294c:	00913423          	sd	s1,8(sp)
    80002950:	01213023          	sd	s2,0(sp)
    80002954:	00113c23          	sd	ra,24(sp)
    80002958:	02010413          	addi	s0,sp,32
    8000295c:	00004917          	auipc	s2,0x4
    80002960:	1bc90913          	addi	s2,s2,444 # 80006b18 <cons>
    80002964:	00050493          	mv	s1,a0
    80002968:	00090513          	mv	a0,s2
    8000296c:	00001097          	auipc	ra,0x1
    80002970:	e40080e7          	jalr	-448(ra) # 800037ac <acquire>
    80002974:	02048c63          	beqz	s1,800029ac <consoleintr+0x68>
    80002978:	0a092783          	lw	a5,160(s2)
    8000297c:	09892703          	lw	a4,152(s2)
    80002980:	07f00693          	li	a3,127
    80002984:	40e7873b          	subw	a4,a5,a4
    80002988:	02e6e263          	bltu	a3,a4,800029ac <consoleintr+0x68>
    8000298c:	00d00713          	li	a4,13
    80002990:	04e48063          	beq	s1,a4,800029d0 <consoleintr+0x8c>
    80002994:	07f7f713          	andi	a4,a5,127
    80002998:	00e90733          	add	a4,s2,a4
    8000299c:	0017879b          	addiw	a5,a5,1
    800029a0:	0af92023          	sw	a5,160(s2)
    800029a4:	00970c23          	sb	s1,24(a4)
    800029a8:	08f92e23          	sw	a5,156(s2)
    800029ac:	01013403          	ld	s0,16(sp)
    800029b0:	01813083          	ld	ra,24(sp)
    800029b4:	00813483          	ld	s1,8(sp)
    800029b8:	00013903          	ld	s2,0(sp)
    800029bc:	00004517          	auipc	a0,0x4
    800029c0:	15c50513          	addi	a0,a0,348 # 80006b18 <cons>
    800029c4:	02010113          	addi	sp,sp,32
    800029c8:	00001317          	auipc	t1,0x1
    800029cc:	eb030067          	jr	-336(t1) # 80003878 <release>
    800029d0:	00a00493          	li	s1,10
    800029d4:	fc1ff06f          	j	80002994 <consoleintr+0x50>

00000000800029d8 <consoleinit>:
    800029d8:	fe010113          	addi	sp,sp,-32
    800029dc:	00113c23          	sd	ra,24(sp)
    800029e0:	00813823          	sd	s0,16(sp)
    800029e4:	00913423          	sd	s1,8(sp)
    800029e8:	02010413          	addi	s0,sp,32
    800029ec:	00004497          	auipc	s1,0x4
    800029f0:	12c48493          	addi	s1,s1,300 # 80006b18 <cons>
    800029f4:	00048513          	mv	a0,s1
    800029f8:	00003597          	auipc	a1,0x3
    800029fc:	8c858593          	addi	a1,a1,-1848 # 800052c0 <_ZZ12printIntegermE6digits+0x2a0>
    80002a00:	00001097          	auipc	ra,0x1
    80002a04:	d88080e7          	jalr	-632(ra) # 80003788 <initlock>
    80002a08:	00000097          	auipc	ra,0x0
    80002a0c:	7ac080e7          	jalr	1964(ra) # 800031b4 <uartinit>
    80002a10:	01813083          	ld	ra,24(sp)
    80002a14:	01013403          	ld	s0,16(sp)
    80002a18:	00000797          	auipc	a5,0x0
    80002a1c:	d9c78793          	addi	a5,a5,-612 # 800027b4 <consoleread>
    80002a20:	0af4bc23          	sd	a5,184(s1)
    80002a24:	00000797          	auipc	a5,0x0
    80002a28:	cec78793          	addi	a5,a5,-788 # 80002710 <consolewrite>
    80002a2c:	0cf4b023          	sd	a5,192(s1)
    80002a30:	00813483          	ld	s1,8(sp)
    80002a34:	02010113          	addi	sp,sp,32
    80002a38:	00008067          	ret

0000000080002a3c <console_read>:
    80002a3c:	ff010113          	addi	sp,sp,-16
    80002a40:	00813423          	sd	s0,8(sp)
    80002a44:	01010413          	addi	s0,sp,16
    80002a48:	00813403          	ld	s0,8(sp)
    80002a4c:	00004317          	auipc	t1,0x4
    80002a50:	18433303          	ld	t1,388(t1) # 80006bd0 <devsw+0x10>
    80002a54:	01010113          	addi	sp,sp,16
    80002a58:	00030067          	jr	t1

0000000080002a5c <console_write>:
    80002a5c:	ff010113          	addi	sp,sp,-16
    80002a60:	00813423          	sd	s0,8(sp)
    80002a64:	01010413          	addi	s0,sp,16
    80002a68:	00813403          	ld	s0,8(sp)
    80002a6c:	00004317          	auipc	t1,0x4
    80002a70:	16c33303          	ld	t1,364(t1) # 80006bd8 <devsw+0x18>
    80002a74:	01010113          	addi	sp,sp,16
    80002a78:	00030067          	jr	t1

0000000080002a7c <panic>:
    80002a7c:	fe010113          	addi	sp,sp,-32
    80002a80:	00113c23          	sd	ra,24(sp)
    80002a84:	00813823          	sd	s0,16(sp)
    80002a88:	00913423          	sd	s1,8(sp)
    80002a8c:	02010413          	addi	s0,sp,32
    80002a90:	00050493          	mv	s1,a0
    80002a94:	00003517          	auipc	a0,0x3
    80002a98:	83450513          	addi	a0,a0,-1996 # 800052c8 <_ZZ12printIntegermE6digits+0x2a8>
    80002a9c:	00004797          	auipc	a5,0x4
    80002aa0:	1c07ae23          	sw	zero,476(a5) # 80006c78 <pr+0x18>
    80002aa4:	00000097          	auipc	ra,0x0
    80002aa8:	034080e7          	jalr	52(ra) # 80002ad8 <__printf>
    80002aac:	00048513          	mv	a0,s1
    80002ab0:	00000097          	auipc	ra,0x0
    80002ab4:	028080e7          	jalr	40(ra) # 80002ad8 <__printf>
    80002ab8:	00002517          	auipc	a0,0x2
    80002abc:	7f050513          	addi	a0,a0,2032 # 800052a8 <_ZZ12printIntegermE6digits+0x288>
    80002ac0:	00000097          	auipc	ra,0x0
    80002ac4:	018080e7          	jalr	24(ra) # 80002ad8 <__printf>
    80002ac8:	00100793          	li	a5,1
    80002acc:	00003717          	auipc	a4,0x3
    80002ad0:	f0f72623          	sw	a5,-244(a4) # 800059d8 <panicked>
    80002ad4:	0000006f          	j	80002ad4 <panic+0x58>

0000000080002ad8 <__printf>:
    80002ad8:	f3010113          	addi	sp,sp,-208
    80002adc:	08813023          	sd	s0,128(sp)
    80002ae0:	07313423          	sd	s3,104(sp)
    80002ae4:	09010413          	addi	s0,sp,144
    80002ae8:	05813023          	sd	s8,64(sp)
    80002aec:	08113423          	sd	ra,136(sp)
    80002af0:	06913c23          	sd	s1,120(sp)
    80002af4:	07213823          	sd	s2,112(sp)
    80002af8:	07413023          	sd	s4,96(sp)
    80002afc:	05513c23          	sd	s5,88(sp)
    80002b00:	05613823          	sd	s6,80(sp)
    80002b04:	05713423          	sd	s7,72(sp)
    80002b08:	03913c23          	sd	s9,56(sp)
    80002b0c:	03a13823          	sd	s10,48(sp)
    80002b10:	03b13423          	sd	s11,40(sp)
    80002b14:	00004317          	auipc	t1,0x4
    80002b18:	14c30313          	addi	t1,t1,332 # 80006c60 <pr>
    80002b1c:	01832c03          	lw	s8,24(t1)
    80002b20:	00b43423          	sd	a1,8(s0)
    80002b24:	00c43823          	sd	a2,16(s0)
    80002b28:	00d43c23          	sd	a3,24(s0)
    80002b2c:	02e43023          	sd	a4,32(s0)
    80002b30:	02f43423          	sd	a5,40(s0)
    80002b34:	03043823          	sd	a6,48(s0)
    80002b38:	03143c23          	sd	a7,56(s0)
    80002b3c:	00050993          	mv	s3,a0
    80002b40:	4a0c1663          	bnez	s8,80002fec <__printf+0x514>
    80002b44:	60098c63          	beqz	s3,8000315c <__printf+0x684>
    80002b48:	0009c503          	lbu	a0,0(s3)
    80002b4c:	00840793          	addi	a5,s0,8
    80002b50:	f6f43c23          	sd	a5,-136(s0)
    80002b54:	00000493          	li	s1,0
    80002b58:	22050063          	beqz	a0,80002d78 <__printf+0x2a0>
    80002b5c:	00002a37          	lui	s4,0x2
    80002b60:	00018ab7          	lui	s5,0x18
    80002b64:	000f4b37          	lui	s6,0xf4
    80002b68:	00989bb7          	lui	s7,0x989
    80002b6c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80002b70:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80002b74:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80002b78:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80002b7c:	00148c9b          	addiw	s9,s1,1
    80002b80:	02500793          	li	a5,37
    80002b84:	01998933          	add	s2,s3,s9
    80002b88:	38f51263          	bne	a0,a5,80002f0c <__printf+0x434>
    80002b8c:	00094783          	lbu	a5,0(s2)
    80002b90:	00078c9b          	sext.w	s9,a5
    80002b94:	1e078263          	beqz	a5,80002d78 <__printf+0x2a0>
    80002b98:	0024849b          	addiw	s1,s1,2
    80002b9c:	07000713          	li	a4,112
    80002ba0:	00998933          	add	s2,s3,s1
    80002ba4:	38e78a63          	beq	a5,a4,80002f38 <__printf+0x460>
    80002ba8:	20f76863          	bltu	a4,a5,80002db8 <__printf+0x2e0>
    80002bac:	42a78863          	beq	a5,a0,80002fdc <__printf+0x504>
    80002bb0:	06400713          	li	a4,100
    80002bb4:	40e79663          	bne	a5,a4,80002fc0 <__printf+0x4e8>
    80002bb8:	f7843783          	ld	a5,-136(s0)
    80002bbc:	0007a603          	lw	a2,0(a5)
    80002bc0:	00878793          	addi	a5,a5,8
    80002bc4:	f6f43c23          	sd	a5,-136(s0)
    80002bc8:	42064a63          	bltz	a2,80002ffc <__printf+0x524>
    80002bcc:	00a00713          	li	a4,10
    80002bd0:	02e677bb          	remuw	a5,a2,a4
    80002bd4:	00002d97          	auipc	s11,0x2
    80002bd8:	71cd8d93          	addi	s11,s11,1820 # 800052f0 <digits>
    80002bdc:	00900593          	li	a1,9
    80002be0:	0006051b          	sext.w	a0,a2
    80002be4:	00000c93          	li	s9,0
    80002be8:	02079793          	slli	a5,a5,0x20
    80002bec:	0207d793          	srli	a5,a5,0x20
    80002bf0:	00fd87b3          	add	a5,s11,a5
    80002bf4:	0007c783          	lbu	a5,0(a5)
    80002bf8:	02e656bb          	divuw	a3,a2,a4
    80002bfc:	f8f40023          	sb	a5,-128(s0)
    80002c00:	14c5d863          	bge	a1,a2,80002d50 <__printf+0x278>
    80002c04:	06300593          	li	a1,99
    80002c08:	00100c93          	li	s9,1
    80002c0c:	02e6f7bb          	remuw	a5,a3,a4
    80002c10:	02079793          	slli	a5,a5,0x20
    80002c14:	0207d793          	srli	a5,a5,0x20
    80002c18:	00fd87b3          	add	a5,s11,a5
    80002c1c:	0007c783          	lbu	a5,0(a5)
    80002c20:	02e6d73b          	divuw	a4,a3,a4
    80002c24:	f8f400a3          	sb	a5,-127(s0)
    80002c28:	12a5f463          	bgeu	a1,a0,80002d50 <__printf+0x278>
    80002c2c:	00a00693          	li	a3,10
    80002c30:	00900593          	li	a1,9
    80002c34:	02d777bb          	remuw	a5,a4,a3
    80002c38:	02079793          	slli	a5,a5,0x20
    80002c3c:	0207d793          	srli	a5,a5,0x20
    80002c40:	00fd87b3          	add	a5,s11,a5
    80002c44:	0007c503          	lbu	a0,0(a5)
    80002c48:	02d757bb          	divuw	a5,a4,a3
    80002c4c:	f8a40123          	sb	a0,-126(s0)
    80002c50:	48e5f263          	bgeu	a1,a4,800030d4 <__printf+0x5fc>
    80002c54:	06300513          	li	a0,99
    80002c58:	02d7f5bb          	remuw	a1,a5,a3
    80002c5c:	02059593          	slli	a1,a1,0x20
    80002c60:	0205d593          	srli	a1,a1,0x20
    80002c64:	00bd85b3          	add	a1,s11,a1
    80002c68:	0005c583          	lbu	a1,0(a1)
    80002c6c:	02d7d7bb          	divuw	a5,a5,a3
    80002c70:	f8b401a3          	sb	a1,-125(s0)
    80002c74:	48e57263          	bgeu	a0,a4,800030f8 <__printf+0x620>
    80002c78:	3e700513          	li	a0,999
    80002c7c:	02d7f5bb          	remuw	a1,a5,a3
    80002c80:	02059593          	slli	a1,a1,0x20
    80002c84:	0205d593          	srli	a1,a1,0x20
    80002c88:	00bd85b3          	add	a1,s11,a1
    80002c8c:	0005c583          	lbu	a1,0(a1)
    80002c90:	02d7d7bb          	divuw	a5,a5,a3
    80002c94:	f8b40223          	sb	a1,-124(s0)
    80002c98:	46e57663          	bgeu	a0,a4,80003104 <__printf+0x62c>
    80002c9c:	02d7f5bb          	remuw	a1,a5,a3
    80002ca0:	02059593          	slli	a1,a1,0x20
    80002ca4:	0205d593          	srli	a1,a1,0x20
    80002ca8:	00bd85b3          	add	a1,s11,a1
    80002cac:	0005c583          	lbu	a1,0(a1)
    80002cb0:	02d7d7bb          	divuw	a5,a5,a3
    80002cb4:	f8b402a3          	sb	a1,-123(s0)
    80002cb8:	46ea7863          	bgeu	s4,a4,80003128 <__printf+0x650>
    80002cbc:	02d7f5bb          	remuw	a1,a5,a3
    80002cc0:	02059593          	slli	a1,a1,0x20
    80002cc4:	0205d593          	srli	a1,a1,0x20
    80002cc8:	00bd85b3          	add	a1,s11,a1
    80002ccc:	0005c583          	lbu	a1,0(a1)
    80002cd0:	02d7d7bb          	divuw	a5,a5,a3
    80002cd4:	f8b40323          	sb	a1,-122(s0)
    80002cd8:	3eeaf863          	bgeu	s5,a4,800030c8 <__printf+0x5f0>
    80002cdc:	02d7f5bb          	remuw	a1,a5,a3
    80002ce0:	02059593          	slli	a1,a1,0x20
    80002ce4:	0205d593          	srli	a1,a1,0x20
    80002ce8:	00bd85b3          	add	a1,s11,a1
    80002cec:	0005c583          	lbu	a1,0(a1)
    80002cf0:	02d7d7bb          	divuw	a5,a5,a3
    80002cf4:	f8b403a3          	sb	a1,-121(s0)
    80002cf8:	42eb7e63          	bgeu	s6,a4,80003134 <__printf+0x65c>
    80002cfc:	02d7f5bb          	remuw	a1,a5,a3
    80002d00:	02059593          	slli	a1,a1,0x20
    80002d04:	0205d593          	srli	a1,a1,0x20
    80002d08:	00bd85b3          	add	a1,s11,a1
    80002d0c:	0005c583          	lbu	a1,0(a1)
    80002d10:	02d7d7bb          	divuw	a5,a5,a3
    80002d14:	f8b40423          	sb	a1,-120(s0)
    80002d18:	42ebfc63          	bgeu	s7,a4,80003150 <__printf+0x678>
    80002d1c:	02079793          	slli	a5,a5,0x20
    80002d20:	0207d793          	srli	a5,a5,0x20
    80002d24:	00fd8db3          	add	s11,s11,a5
    80002d28:	000dc703          	lbu	a4,0(s11)
    80002d2c:	00a00793          	li	a5,10
    80002d30:	00900c93          	li	s9,9
    80002d34:	f8e404a3          	sb	a4,-119(s0)
    80002d38:	00065c63          	bgez	a2,80002d50 <__printf+0x278>
    80002d3c:	f9040713          	addi	a4,s0,-112
    80002d40:	00f70733          	add	a4,a4,a5
    80002d44:	02d00693          	li	a3,45
    80002d48:	fed70823          	sb	a3,-16(a4)
    80002d4c:	00078c93          	mv	s9,a5
    80002d50:	f8040793          	addi	a5,s0,-128
    80002d54:	01978cb3          	add	s9,a5,s9
    80002d58:	f7f40d13          	addi	s10,s0,-129
    80002d5c:	000cc503          	lbu	a0,0(s9)
    80002d60:	fffc8c93          	addi	s9,s9,-1
    80002d64:	00000097          	auipc	ra,0x0
    80002d68:	b90080e7          	jalr	-1136(ra) # 800028f4 <consputc>
    80002d6c:	ffac98e3          	bne	s9,s10,80002d5c <__printf+0x284>
    80002d70:	00094503          	lbu	a0,0(s2)
    80002d74:	e00514e3          	bnez	a0,80002b7c <__printf+0xa4>
    80002d78:	1a0c1663          	bnez	s8,80002f24 <__printf+0x44c>
    80002d7c:	08813083          	ld	ra,136(sp)
    80002d80:	08013403          	ld	s0,128(sp)
    80002d84:	07813483          	ld	s1,120(sp)
    80002d88:	07013903          	ld	s2,112(sp)
    80002d8c:	06813983          	ld	s3,104(sp)
    80002d90:	06013a03          	ld	s4,96(sp)
    80002d94:	05813a83          	ld	s5,88(sp)
    80002d98:	05013b03          	ld	s6,80(sp)
    80002d9c:	04813b83          	ld	s7,72(sp)
    80002da0:	04013c03          	ld	s8,64(sp)
    80002da4:	03813c83          	ld	s9,56(sp)
    80002da8:	03013d03          	ld	s10,48(sp)
    80002dac:	02813d83          	ld	s11,40(sp)
    80002db0:	0d010113          	addi	sp,sp,208
    80002db4:	00008067          	ret
    80002db8:	07300713          	li	a4,115
    80002dbc:	1ce78a63          	beq	a5,a4,80002f90 <__printf+0x4b8>
    80002dc0:	07800713          	li	a4,120
    80002dc4:	1ee79e63          	bne	a5,a4,80002fc0 <__printf+0x4e8>
    80002dc8:	f7843783          	ld	a5,-136(s0)
    80002dcc:	0007a703          	lw	a4,0(a5)
    80002dd0:	00878793          	addi	a5,a5,8
    80002dd4:	f6f43c23          	sd	a5,-136(s0)
    80002dd8:	28074263          	bltz	a4,8000305c <__printf+0x584>
    80002ddc:	00002d97          	auipc	s11,0x2
    80002de0:	514d8d93          	addi	s11,s11,1300 # 800052f0 <digits>
    80002de4:	00f77793          	andi	a5,a4,15
    80002de8:	00fd87b3          	add	a5,s11,a5
    80002dec:	0007c683          	lbu	a3,0(a5)
    80002df0:	00f00613          	li	a2,15
    80002df4:	0007079b          	sext.w	a5,a4
    80002df8:	f8d40023          	sb	a3,-128(s0)
    80002dfc:	0047559b          	srliw	a1,a4,0x4
    80002e00:	0047569b          	srliw	a3,a4,0x4
    80002e04:	00000c93          	li	s9,0
    80002e08:	0ee65063          	bge	a2,a4,80002ee8 <__printf+0x410>
    80002e0c:	00f6f693          	andi	a3,a3,15
    80002e10:	00dd86b3          	add	a3,s11,a3
    80002e14:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80002e18:	0087d79b          	srliw	a5,a5,0x8
    80002e1c:	00100c93          	li	s9,1
    80002e20:	f8d400a3          	sb	a3,-127(s0)
    80002e24:	0cb67263          	bgeu	a2,a1,80002ee8 <__printf+0x410>
    80002e28:	00f7f693          	andi	a3,a5,15
    80002e2c:	00dd86b3          	add	a3,s11,a3
    80002e30:	0006c583          	lbu	a1,0(a3)
    80002e34:	00f00613          	li	a2,15
    80002e38:	0047d69b          	srliw	a3,a5,0x4
    80002e3c:	f8b40123          	sb	a1,-126(s0)
    80002e40:	0047d593          	srli	a1,a5,0x4
    80002e44:	28f67e63          	bgeu	a2,a5,800030e0 <__printf+0x608>
    80002e48:	00f6f693          	andi	a3,a3,15
    80002e4c:	00dd86b3          	add	a3,s11,a3
    80002e50:	0006c503          	lbu	a0,0(a3)
    80002e54:	0087d813          	srli	a6,a5,0x8
    80002e58:	0087d69b          	srliw	a3,a5,0x8
    80002e5c:	f8a401a3          	sb	a0,-125(s0)
    80002e60:	28b67663          	bgeu	a2,a1,800030ec <__printf+0x614>
    80002e64:	00f6f693          	andi	a3,a3,15
    80002e68:	00dd86b3          	add	a3,s11,a3
    80002e6c:	0006c583          	lbu	a1,0(a3)
    80002e70:	00c7d513          	srli	a0,a5,0xc
    80002e74:	00c7d69b          	srliw	a3,a5,0xc
    80002e78:	f8b40223          	sb	a1,-124(s0)
    80002e7c:	29067a63          	bgeu	a2,a6,80003110 <__printf+0x638>
    80002e80:	00f6f693          	andi	a3,a3,15
    80002e84:	00dd86b3          	add	a3,s11,a3
    80002e88:	0006c583          	lbu	a1,0(a3)
    80002e8c:	0107d813          	srli	a6,a5,0x10
    80002e90:	0107d69b          	srliw	a3,a5,0x10
    80002e94:	f8b402a3          	sb	a1,-123(s0)
    80002e98:	28a67263          	bgeu	a2,a0,8000311c <__printf+0x644>
    80002e9c:	00f6f693          	andi	a3,a3,15
    80002ea0:	00dd86b3          	add	a3,s11,a3
    80002ea4:	0006c683          	lbu	a3,0(a3)
    80002ea8:	0147d79b          	srliw	a5,a5,0x14
    80002eac:	f8d40323          	sb	a3,-122(s0)
    80002eb0:	21067663          	bgeu	a2,a6,800030bc <__printf+0x5e4>
    80002eb4:	02079793          	slli	a5,a5,0x20
    80002eb8:	0207d793          	srli	a5,a5,0x20
    80002ebc:	00fd8db3          	add	s11,s11,a5
    80002ec0:	000dc683          	lbu	a3,0(s11)
    80002ec4:	00800793          	li	a5,8
    80002ec8:	00700c93          	li	s9,7
    80002ecc:	f8d403a3          	sb	a3,-121(s0)
    80002ed0:	00075c63          	bgez	a4,80002ee8 <__printf+0x410>
    80002ed4:	f9040713          	addi	a4,s0,-112
    80002ed8:	00f70733          	add	a4,a4,a5
    80002edc:	02d00693          	li	a3,45
    80002ee0:	fed70823          	sb	a3,-16(a4)
    80002ee4:	00078c93          	mv	s9,a5
    80002ee8:	f8040793          	addi	a5,s0,-128
    80002eec:	01978cb3          	add	s9,a5,s9
    80002ef0:	f7f40d13          	addi	s10,s0,-129
    80002ef4:	000cc503          	lbu	a0,0(s9)
    80002ef8:	fffc8c93          	addi	s9,s9,-1
    80002efc:	00000097          	auipc	ra,0x0
    80002f00:	9f8080e7          	jalr	-1544(ra) # 800028f4 <consputc>
    80002f04:	ff9d18e3          	bne	s10,s9,80002ef4 <__printf+0x41c>
    80002f08:	0100006f          	j	80002f18 <__printf+0x440>
    80002f0c:	00000097          	auipc	ra,0x0
    80002f10:	9e8080e7          	jalr	-1560(ra) # 800028f4 <consputc>
    80002f14:	000c8493          	mv	s1,s9
    80002f18:	00094503          	lbu	a0,0(s2)
    80002f1c:	c60510e3          	bnez	a0,80002b7c <__printf+0xa4>
    80002f20:	e40c0ee3          	beqz	s8,80002d7c <__printf+0x2a4>
    80002f24:	00004517          	auipc	a0,0x4
    80002f28:	d3c50513          	addi	a0,a0,-708 # 80006c60 <pr>
    80002f2c:	00001097          	auipc	ra,0x1
    80002f30:	94c080e7          	jalr	-1716(ra) # 80003878 <release>
    80002f34:	e49ff06f          	j	80002d7c <__printf+0x2a4>
    80002f38:	f7843783          	ld	a5,-136(s0)
    80002f3c:	03000513          	li	a0,48
    80002f40:	01000d13          	li	s10,16
    80002f44:	00878713          	addi	a4,a5,8
    80002f48:	0007bc83          	ld	s9,0(a5)
    80002f4c:	f6e43c23          	sd	a4,-136(s0)
    80002f50:	00000097          	auipc	ra,0x0
    80002f54:	9a4080e7          	jalr	-1628(ra) # 800028f4 <consputc>
    80002f58:	07800513          	li	a0,120
    80002f5c:	00000097          	auipc	ra,0x0
    80002f60:	998080e7          	jalr	-1640(ra) # 800028f4 <consputc>
    80002f64:	00002d97          	auipc	s11,0x2
    80002f68:	38cd8d93          	addi	s11,s11,908 # 800052f0 <digits>
    80002f6c:	03ccd793          	srli	a5,s9,0x3c
    80002f70:	00fd87b3          	add	a5,s11,a5
    80002f74:	0007c503          	lbu	a0,0(a5)
    80002f78:	fffd0d1b          	addiw	s10,s10,-1
    80002f7c:	004c9c93          	slli	s9,s9,0x4
    80002f80:	00000097          	auipc	ra,0x0
    80002f84:	974080e7          	jalr	-1676(ra) # 800028f4 <consputc>
    80002f88:	fe0d12e3          	bnez	s10,80002f6c <__printf+0x494>
    80002f8c:	f8dff06f          	j	80002f18 <__printf+0x440>
    80002f90:	f7843783          	ld	a5,-136(s0)
    80002f94:	0007bc83          	ld	s9,0(a5)
    80002f98:	00878793          	addi	a5,a5,8
    80002f9c:	f6f43c23          	sd	a5,-136(s0)
    80002fa0:	000c9a63          	bnez	s9,80002fb4 <__printf+0x4dc>
    80002fa4:	1080006f          	j	800030ac <__printf+0x5d4>
    80002fa8:	001c8c93          	addi	s9,s9,1
    80002fac:	00000097          	auipc	ra,0x0
    80002fb0:	948080e7          	jalr	-1720(ra) # 800028f4 <consputc>
    80002fb4:	000cc503          	lbu	a0,0(s9)
    80002fb8:	fe0518e3          	bnez	a0,80002fa8 <__printf+0x4d0>
    80002fbc:	f5dff06f          	j	80002f18 <__printf+0x440>
    80002fc0:	02500513          	li	a0,37
    80002fc4:	00000097          	auipc	ra,0x0
    80002fc8:	930080e7          	jalr	-1744(ra) # 800028f4 <consputc>
    80002fcc:	000c8513          	mv	a0,s9
    80002fd0:	00000097          	auipc	ra,0x0
    80002fd4:	924080e7          	jalr	-1756(ra) # 800028f4 <consputc>
    80002fd8:	f41ff06f          	j	80002f18 <__printf+0x440>
    80002fdc:	02500513          	li	a0,37
    80002fe0:	00000097          	auipc	ra,0x0
    80002fe4:	914080e7          	jalr	-1772(ra) # 800028f4 <consputc>
    80002fe8:	f31ff06f          	j	80002f18 <__printf+0x440>
    80002fec:	00030513          	mv	a0,t1
    80002ff0:	00000097          	auipc	ra,0x0
    80002ff4:	7bc080e7          	jalr	1980(ra) # 800037ac <acquire>
    80002ff8:	b4dff06f          	j	80002b44 <__printf+0x6c>
    80002ffc:	40c0053b          	negw	a0,a2
    80003000:	00a00713          	li	a4,10
    80003004:	02e576bb          	remuw	a3,a0,a4
    80003008:	00002d97          	auipc	s11,0x2
    8000300c:	2e8d8d93          	addi	s11,s11,744 # 800052f0 <digits>
    80003010:	ff700593          	li	a1,-9
    80003014:	02069693          	slli	a3,a3,0x20
    80003018:	0206d693          	srli	a3,a3,0x20
    8000301c:	00dd86b3          	add	a3,s11,a3
    80003020:	0006c683          	lbu	a3,0(a3)
    80003024:	02e557bb          	divuw	a5,a0,a4
    80003028:	f8d40023          	sb	a3,-128(s0)
    8000302c:	10b65e63          	bge	a2,a1,80003148 <__printf+0x670>
    80003030:	06300593          	li	a1,99
    80003034:	02e7f6bb          	remuw	a3,a5,a4
    80003038:	02069693          	slli	a3,a3,0x20
    8000303c:	0206d693          	srli	a3,a3,0x20
    80003040:	00dd86b3          	add	a3,s11,a3
    80003044:	0006c683          	lbu	a3,0(a3)
    80003048:	02e7d73b          	divuw	a4,a5,a4
    8000304c:	00200793          	li	a5,2
    80003050:	f8d400a3          	sb	a3,-127(s0)
    80003054:	bca5ece3          	bltu	a1,a0,80002c2c <__printf+0x154>
    80003058:	ce5ff06f          	j	80002d3c <__printf+0x264>
    8000305c:	40e007bb          	negw	a5,a4
    80003060:	00002d97          	auipc	s11,0x2
    80003064:	290d8d93          	addi	s11,s11,656 # 800052f0 <digits>
    80003068:	00f7f693          	andi	a3,a5,15
    8000306c:	00dd86b3          	add	a3,s11,a3
    80003070:	0006c583          	lbu	a1,0(a3)
    80003074:	ff100613          	li	a2,-15
    80003078:	0047d69b          	srliw	a3,a5,0x4
    8000307c:	f8b40023          	sb	a1,-128(s0)
    80003080:	0047d59b          	srliw	a1,a5,0x4
    80003084:	0ac75e63          	bge	a4,a2,80003140 <__printf+0x668>
    80003088:	00f6f693          	andi	a3,a3,15
    8000308c:	00dd86b3          	add	a3,s11,a3
    80003090:	0006c603          	lbu	a2,0(a3)
    80003094:	00f00693          	li	a3,15
    80003098:	0087d79b          	srliw	a5,a5,0x8
    8000309c:	f8c400a3          	sb	a2,-127(s0)
    800030a0:	d8b6e4e3          	bltu	a3,a1,80002e28 <__printf+0x350>
    800030a4:	00200793          	li	a5,2
    800030a8:	e2dff06f          	j	80002ed4 <__printf+0x3fc>
    800030ac:	00002c97          	auipc	s9,0x2
    800030b0:	224c8c93          	addi	s9,s9,548 # 800052d0 <_ZZ12printIntegermE6digits+0x2b0>
    800030b4:	02800513          	li	a0,40
    800030b8:	ef1ff06f          	j	80002fa8 <__printf+0x4d0>
    800030bc:	00700793          	li	a5,7
    800030c0:	00600c93          	li	s9,6
    800030c4:	e0dff06f          	j	80002ed0 <__printf+0x3f8>
    800030c8:	00700793          	li	a5,7
    800030cc:	00600c93          	li	s9,6
    800030d0:	c69ff06f          	j	80002d38 <__printf+0x260>
    800030d4:	00300793          	li	a5,3
    800030d8:	00200c93          	li	s9,2
    800030dc:	c5dff06f          	j	80002d38 <__printf+0x260>
    800030e0:	00300793          	li	a5,3
    800030e4:	00200c93          	li	s9,2
    800030e8:	de9ff06f          	j	80002ed0 <__printf+0x3f8>
    800030ec:	00400793          	li	a5,4
    800030f0:	00300c93          	li	s9,3
    800030f4:	dddff06f          	j	80002ed0 <__printf+0x3f8>
    800030f8:	00400793          	li	a5,4
    800030fc:	00300c93          	li	s9,3
    80003100:	c39ff06f          	j	80002d38 <__printf+0x260>
    80003104:	00500793          	li	a5,5
    80003108:	00400c93          	li	s9,4
    8000310c:	c2dff06f          	j	80002d38 <__printf+0x260>
    80003110:	00500793          	li	a5,5
    80003114:	00400c93          	li	s9,4
    80003118:	db9ff06f          	j	80002ed0 <__printf+0x3f8>
    8000311c:	00600793          	li	a5,6
    80003120:	00500c93          	li	s9,5
    80003124:	dadff06f          	j	80002ed0 <__printf+0x3f8>
    80003128:	00600793          	li	a5,6
    8000312c:	00500c93          	li	s9,5
    80003130:	c09ff06f          	j	80002d38 <__printf+0x260>
    80003134:	00800793          	li	a5,8
    80003138:	00700c93          	li	s9,7
    8000313c:	bfdff06f          	j	80002d38 <__printf+0x260>
    80003140:	00100793          	li	a5,1
    80003144:	d91ff06f          	j	80002ed4 <__printf+0x3fc>
    80003148:	00100793          	li	a5,1
    8000314c:	bf1ff06f          	j	80002d3c <__printf+0x264>
    80003150:	00900793          	li	a5,9
    80003154:	00800c93          	li	s9,8
    80003158:	be1ff06f          	j	80002d38 <__printf+0x260>
    8000315c:	00002517          	auipc	a0,0x2
    80003160:	17c50513          	addi	a0,a0,380 # 800052d8 <_ZZ12printIntegermE6digits+0x2b8>
    80003164:	00000097          	auipc	ra,0x0
    80003168:	918080e7          	jalr	-1768(ra) # 80002a7c <panic>

000000008000316c <printfinit>:
    8000316c:	fe010113          	addi	sp,sp,-32
    80003170:	00813823          	sd	s0,16(sp)
    80003174:	00913423          	sd	s1,8(sp)
    80003178:	00113c23          	sd	ra,24(sp)
    8000317c:	02010413          	addi	s0,sp,32
    80003180:	00004497          	auipc	s1,0x4
    80003184:	ae048493          	addi	s1,s1,-1312 # 80006c60 <pr>
    80003188:	00048513          	mv	a0,s1
    8000318c:	00002597          	auipc	a1,0x2
    80003190:	15c58593          	addi	a1,a1,348 # 800052e8 <_ZZ12printIntegermE6digits+0x2c8>
    80003194:	00000097          	auipc	ra,0x0
    80003198:	5f4080e7          	jalr	1524(ra) # 80003788 <initlock>
    8000319c:	01813083          	ld	ra,24(sp)
    800031a0:	01013403          	ld	s0,16(sp)
    800031a4:	0004ac23          	sw	zero,24(s1)
    800031a8:	00813483          	ld	s1,8(sp)
    800031ac:	02010113          	addi	sp,sp,32
    800031b0:	00008067          	ret

00000000800031b4 <uartinit>:
    800031b4:	ff010113          	addi	sp,sp,-16
    800031b8:	00813423          	sd	s0,8(sp)
    800031bc:	01010413          	addi	s0,sp,16
    800031c0:	100007b7          	lui	a5,0x10000
    800031c4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    800031c8:	f8000713          	li	a4,-128
    800031cc:	00e781a3          	sb	a4,3(a5)
    800031d0:	00300713          	li	a4,3
    800031d4:	00e78023          	sb	a4,0(a5)
    800031d8:	000780a3          	sb	zero,1(a5)
    800031dc:	00e781a3          	sb	a4,3(a5)
    800031e0:	00700693          	li	a3,7
    800031e4:	00d78123          	sb	a3,2(a5)
    800031e8:	00e780a3          	sb	a4,1(a5)
    800031ec:	00813403          	ld	s0,8(sp)
    800031f0:	01010113          	addi	sp,sp,16
    800031f4:	00008067          	ret

00000000800031f8 <uartputc>:
    800031f8:	00002797          	auipc	a5,0x2
    800031fc:	7e07a783          	lw	a5,2016(a5) # 800059d8 <panicked>
    80003200:	00078463          	beqz	a5,80003208 <uartputc+0x10>
    80003204:	0000006f          	j	80003204 <uartputc+0xc>
    80003208:	fd010113          	addi	sp,sp,-48
    8000320c:	02813023          	sd	s0,32(sp)
    80003210:	00913c23          	sd	s1,24(sp)
    80003214:	01213823          	sd	s2,16(sp)
    80003218:	01313423          	sd	s3,8(sp)
    8000321c:	02113423          	sd	ra,40(sp)
    80003220:	03010413          	addi	s0,sp,48
    80003224:	00002917          	auipc	s2,0x2
    80003228:	7bc90913          	addi	s2,s2,1980 # 800059e0 <uart_tx_r>
    8000322c:	00093783          	ld	a5,0(s2)
    80003230:	00002497          	auipc	s1,0x2
    80003234:	7b848493          	addi	s1,s1,1976 # 800059e8 <uart_tx_w>
    80003238:	0004b703          	ld	a4,0(s1)
    8000323c:	02078693          	addi	a3,a5,32
    80003240:	00050993          	mv	s3,a0
    80003244:	02e69c63          	bne	a3,a4,8000327c <uartputc+0x84>
    80003248:	00001097          	auipc	ra,0x1
    8000324c:	834080e7          	jalr	-1996(ra) # 80003a7c <push_on>
    80003250:	00093783          	ld	a5,0(s2)
    80003254:	0004b703          	ld	a4,0(s1)
    80003258:	02078793          	addi	a5,a5,32
    8000325c:	00e79463          	bne	a5,a4,80003264 <uartputc+0x6c>
    80003260:	0000006f          	j	80003260 <uartputc+0x68>
    80003264:	00001097          	auipc	ra,0x1
    80003268:	88c080e7          	jalr	-1908(ra) # 80003af0 <pop_on>
    8000326c:	00093783          	ld	a5,0(s2)
    80003270:	0004b703          	ld	a4,0(s1)
    80003274:	02078693          	addi	a3,a5,32
    80003278:	fce688e3          	beq	a3,a4,80003248 <uartputc+0x50>
    8000327c:	01f77693          	andi	a3,a4,31
    80003280:	00004597          	auipc	a1,0x4
    80003284:	a0058593          	addi	a1,a1,-1536 # 80006c80 <uart_tx_buf>
    80003288:	00d586b3          	add	a3,a1,a3
    8000328c:	00170713          	addi	a4,a4,1
    80003290:	01368023          	sb	s3,0(a3)
    80003294:	00e4b023          	sd	a4,0(s1)
    80003298:	10000637          	lui	a2,0x10000
    8000329c:	02f71063          	bne	a4,a5,800032bc <uartputc+0xc4>
    800032a0:	0340006f          	j	800032d4 <uartputc+0xdc>
    800032a4:	00074703          	lbu	a4,0(a4)
    800032a8:	00f93023          	sd	a5,0(s2)
    800032ac:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    800032b0:	00093783          	ld	a5,0(s2)
    800032b4:	0004b703          	ld	a4,0(s1)
    800032b8:	00f70e63          	beq	a4,a5,800032d4 <uartputc+0xdc>
    800032bc:	00564683          	lbu	a3,5(a2)
    800032c0:	01f7f713          	andi	a4,a5,31
    800032c4:	00e58733          	add	a4,a1,a4
    800032c8:	0206f693          	andi	a3,a3,32
    800032cc:	00178793          	addi	a5,a5,1
    800032d0:	fc069ae3          	bnez	a3,800032a4 <uartputc+0xac>
    800032d4:	02813083          	ld	ra,40(sp)
    800032d8:	02013403          	ld	s0,32(sp)
    800032dc:	01813483          	ld	s1,24(sp)
    800032e0:	01013903          	ld	s2,16(sp)
    800032e4:	00813983          	ld	s3,8(sp)
    800032e8:	03010113          	addi	sp,sp,48
    800032ec:	00008067          	ret

00000000800032f0 <uartputc_sync>:
    800032f0:	ff010113          	addi	sp,sp,-16
    800032f4:	00813423          	sd	s0,8(sp)
    800032f8:	01010413          	addi	s0,sp,16
    800032fc:	00002717          	auipc	a4,0x2
    80003300:	6dc72703          	lw	a4,1756(a4) # 800059d8 <panicked>
    80003304:	02071663          	bnez	a4,80003330 <uartputc_sync+0x40>
    80003308:	00050793          	mv	a5,a0
    8000330c:	100006b7          	lui	a3,0x10000
    80003310:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80003314:	02077713          	andi	a4,a4,32
    80003318:	fe070ce3          	beqz	a4,80003310 <uartputc_sync+0x20>
    8000331c:	0ff7f793          	andi	a5,a5,255
    80003320:	00f68023          	sb	a5,0(a3)
    80003324:	00813403          	ld	s0,8(sp)
    80003328:	01010113          	addi	sp,sp,16
    8000332c:	00008067          	ret
    80003330:	0000006f          	j	80003330 <uartputc_sync+0x40>

0000000080003334 <uartstart>:
    80003334:	ff010113          	addi	sp,sp,-16
    80003338:	00813423          	sd	s0,8(sp)
    8000333c:	01010413          	addi	s0,sp,16
    80003340:	00002617          	auipc	a2,0x2
    80003344:	6a060613          	addi	a2,a2,1696 # 800059e0 <uart_tx_r>
    80003348:	00002517          	auipc	a0,0x2
    8000334c:	6a050513          	addi	a0,a0,1696 # 800059e8 <uart_tx_w>
    80003350:	00063783          	ld	a5,0(a2)
    80003354:	00053703          	ld	a4,0(a0)
    80003358:	04f70263          	beq	a4,a5,8000339c <uartstart+0x68>
    8000335c:	100005b7          	lui	a1,0x10000
    80003360:	00004817          	auipc	a6,0x4
    80003364:	92080813          	addi	a6,a6,-1760 # 80006c80 <uart_tx_buf>
    80003368:	01c0006f          	j	80003384 <uartstart+0x50>
    8000336c:	0006c703          	lbu	a4,0(a3)
    80003370:	00f63023          	sd	a5,0(a2)
    80003374:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80003378:	00063783          	ld	a5,0(a2)
    8000337c:	00053703          	ld	a4,0(a0)
    80003380:	00f70e63          	beq	a4,a5,8000339c <uartstart+0x68>
    80003384:	01f7f713          	andi	a4,a5,31
    80003388:	00e806b3          	add	a3,a6,a4
    8000338c:	0055c703          	lbu	a4,5(a1)
    80003390:	00178793          	addi	a5,a5,1
    80003394:	02077713          	andi	a4,a4,32
    80003398:	fc071ae3          	bnez	a4,8000336c <uartstart+0x38>
    8000339c:	00813403          	ld	s0,8(sp)
    800033a0:	01010113          	addi	sp,sp,16
    800033a4:	00008067          	ret

00000000800033a8 <uartgetc>:
    800033a8:	ff010113          	addi	sp,sp,-16
    800033ac:	00813423          	sd	s0,8(sp)
    800033b0:	01010413          	addi	s0,sp,16
    800033b4:	10000737          	lui	a4,0x10000
    800033b8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    800033bc:	0017f793          	andi	a5,a5,1
    800033c0:	00078c63          	beqz	a5,800033d8 <uartgetc+0x30>
    800033c4:	00074503          	lbu	a0,0(a4)
    800033c8:	0ff57513          	andi	a0,a0,255
    800033cc:	00813403          	ld	s0,8(sp)
    800033d0:	01010113          	addi	sp,sp,16
    800033d4:	00008067          	ret
    800033d8:	fff00513          	li	a0,-1
    800033dc:	ff1ff06f          	j	800033cc <uartgetc+0x24>

00000000800033e0 <uartintr>:
    800033e0:	100007b7          	lui	a5,0x10000
    800033e4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    800033e8:	0017f793          	andi	a5,a5,1
    800033ec:	0a078463          	beqz	a5,80003494 <uartintr+0xb4>
    800033f0:	fe010113          	addi	sp,sp,-32
    800033f4:	00813823          	sd	s0,16(sp)
    800033f8:	00913423          	sd	s1,8(sp)
    800033fc:	00113c23          	sd	ra,24(sp)
    80003400:	02010413          	addi	s0,sp,32
    80003404:	100004b7          	lui	s1,0x10000
    80003408:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000340c:	0ff57513          	andi	a0,a0,255
    80003410:	fffff097          	auipc	ra,0xfffff
    80003414:	534080e7          	jalr	1332(ra) # 80002944 <consoleintr>
    80003418:	0054c783          	lbu	a5,5(s1)
    8000341c:	0017f793          	andi	a5,a5,1
    80003420:	fe0794e3          	bnez	a5,80003408 <uartintr+0x28>
    80003424:	00002617          	auipc	a2,0x2
    80003428:	5bc60613          	addi	a2,a2,1468 # 800059e0 <uart_tx_r>
    8000342c:	00002517          	auipc	a0,0x2
    80003430:	5bc50513          	addi	a0,a0,1468 # 800059e8 <uart_tx_w>
    80003434:	00063783          	ld	a5,0(a2)
    80003438:	00053703          	ld	a4,0(a0)
    8000343c:	04f70263          	beq	a4,a5,80003480 <uartintr+0xa0>
    80003440:	100005b7          	lui	a1,0x10000
    80003444:	00004817          	auipc	a6,0x4
    80003448:	83c80813          	addi	a6,a6,-1988 # 80006c80 <uart_tx_buf>
    8000344c:	01c0006f          	j	80003468 <uartintr+0x88>
    80003450:	0006c703          	lbu	a4,0(a3)
    80003454:	00f63023          	sd	a5,0(a2)
    80003458:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000345c:	00063783          	ld	a5,0(a2)
    80003460:	00053703          	ld	a4,0(a0)
    80003464:	00f70e63          	beq	a4,a5,80003480 <uartintr+0xa0>
    80003468:	01f7f713          	andi	a4,a5,31
    8000346c:	00e806b3          	add	a3,a6,a4
    80003470:	0055c703          	lbu	a4,5(a1)
    80003474:	00178793          	addi	a5,a5,1
    80003478:	02077713          	andi	a4,a4,32
    8000347c:	fc071ae3          	bnez	a4,80003450 <uartintr+0x70>
    80003480:	01813083          	ld	ra,24(sp)
    80003484:	01013403          	ld	s0,16(sp)
    80003488:	00813483          	ld	s1,8(sp)
    8000348c:	02010113          	addi	sp,sp,32
    80003490:	00008067          	ret
    80003494:	00002617          	auipc	a2,0x2
    80003498:	54c60613          	addi	a2,a2,1356 # 800059e0 <uart_tx_r>
    8000349c:	00002517          	auipc	a0,0x2
    800034a0:	54c50513          	addi	a0,a0,1356 # 800059e8 <uart_tx_w>
    800034a4:	00063783          	ld	a5,0(a2)
    800034a8:	00053703          	ld	a4,0(a0)
    800034ac:	04f70263          	beq	a4,a5,800034f0 <uartintr+0x110>
    800034b0:	100005b7          	lui	a1,0x10000
    800034b4:	00003817          	auipc	a6,0x3
    800034b8:	7cc80813          	addi	a6,a6,1996 # 80006c80 <uart_tx_buf>
    800034bc:	01c0006f          	j	800034d8 <uartintr+0xf8>
    800034c0:	0006c703          	lbu	a4,0(a3)
    800034c4:	00f63023          	sd	a5,0(a2)
    800034c8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800034cc:	00063783          	ld	a5,0(a2)
    800034d0:	00053703          	ld	a4,0(a0)
    800034d4:	02f70063          	beq	a4,a5,800034f4 <uartintr+0x114>
    800034d8:	01f7f713          	andi	a4,a5,31
    800034dc:	00e806b3          	add	a3,a6,a4
    800034e0:	0055c703          	lbu	a4,5(a1)
    800034e4:	00178793          	addi	a5,a5,1
    800034e8:	02077713          	andi	a4,a4,32
    800034ec:	fc071ae3          	bnez	a4,800034c0 <uartintr+0xe0>
    800034f0:	00008067          	ret
    800034f4:	00008067          	ret

00000000800034f8 <kinit>:
    800034f8:	fc010113          	addi	sp,sp,-64
    800034fc:	02913423          	sd	s1,40(sp)
    80003500:	fffff7b7          	lui	a5,0xfffff
    80003504:	00004497          	auipc	s1,0x4
    80003508:	79b48493          	addi	s1,s1,1947 # 80007c9f <end+0xfff>
    8000350c:	02813823          	sd	s0,48(sp)
    80003510:	01313c23          	sd	s3,24(sp)
    80003514:	00f4f4b3          	and	s1,s1,a5
    80003518:	02113c23          	sd	ra,56(sp)
    8000351c:	03213023          	sd	s2,32(sp)
    80003520:	01413823          	sd	s4,16(sp)
    80003524:	01513423          	sd	s5,8(sp)
    80003528:	04010413          	addi	s0,sp,64
    8000352c:	000017b7          	lui	a5,0x1
    80003530:	01100993          	li	s3,17
    80003534:	00f487b3          	add	a5,s1,a5
    80003538:	01b99993          	slli	s3,s3,0x1b
    8000353c:	06f9e063          	bltu	s3,a5,8000359c <kinit+0xa4>
    80003540:	00003a97          	auipc	s5,0x3
    80003544:	760a8a93          	addi	s5,s5,1888 # 80006ca0 <end>
    80003548:	0754ec63          	bltu	s1,s5,800035c0 <kinit+0xc8>
    8000354c:	0734fa63          	bgeu	s1,s3,800035c0 <kinit+0xc8>
    80003550:	00088a37          	lui	s4,0x88
    80003554:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80003558:	00002917          	auipc	s2,0x2
    8000355c:	49890913          	addi	s2,s2,1176 # 800059f0 <kmem>
    80003560:	00ca1a13          	slli	s4,s4,0xc
    80003564:	0140006f          	j	80003578 <kinit+0x80>
    80003568:	000017b7          	lui	a5,0x1
    8000356c:	00f484b3          	add	s1,s1,a5
    80003570:	0554e863          	bltu	s1,s5,800035c0 <kinit+0xc8>
    80003574:	0534f663          	bgeu	s1,s3,800035c0 <kinit+0xc8>
    80003578:	00001637          	lui	a2,0x1
    8000357c:	00100593          	li	a1,1
    80003580:	00048513          	mv	a0,s1
    80003584:	00000097          	auipc	ra,0x0
    80003588:	5e4080e7          	jalr	1508(ra) # 80003b68 <__memset>
    8000358c:	00093783          	ld	a5,0(s2)
    80003590:	00f4b023          	sd	a5,0(s1)
    80003594:	00993023          	sd	s1,0(s2)
    80003598:	fd4498e3          	bne	s1,s4,80003568 <kinit+0x70>
    8000359c:	03813083          	ld	ra,56(sp)
    800035a0:	03013403          	ld	s0,48(sp)
    800035a4:	02813483          	ld	s1,40(sp)
    800035a8:	02013903          	ld	s2,32(sp)
    800035ac:	01813983          	ld	s3,24(sp)
    800035b0:	01013a03          	ld	s4,16(sp)
    800035b4:	00813a83          	ld	s5,8(sp)
    800035b8:	04010113          	addi	sp,sp,64
    800035bc:	00008067          	ret
    800035c0:	00002517          	auipc	a0,0x2
    800035c4:	d4850513          	addi	a0,a0,-696 # 80005308 <digits+0x18>
    800035c8:	fffff097          	auipc	ra,0xfffff
    800035cc:	4b4080e7          	jalr	1204(ra) # 80002a7c <panic>

00000000800035d0 <freerange>:
    800035d0:	fc010113          	addi	sp,sp,-64
    800035d4:	000017b7          	lui	a5,0x1
    800035d8:	02913423          	sd	s1,40(sp)
    800035dc:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    800035e0:	009504b3          	add	s1,a0,s1
    800035e4:	fffff537          	lui	a0,0xfffff
    800035e8:	02813823          	sd	s0,48(sp)
    800035ec:	02113c23          	sd	ra,56(sp)
    800035f0:	03213023          	sd	s2,32(sp)
    800035f4:	01313c23          	sd	s3,24(sp)
    800035f8:	01413823          	sd	s4,16(sp)
    800035fc:	01513423          	sd	s5,8(sp)
    80003600:	01613023          	sd	s6,0(sp)
    80003604:	04010413          	addi	s0,sp,64
    80003608:	00a4f4b3          	and	s1,s1,a0
    8000360c:	00f487b3          	add	a5,s1,a5
    80003610:	06f5e463          	bltu	a1,a5,80003678 <freerange+0xa8>
    80003614:	00003a97          	auipc	s5,0x3
    80003618:	68ca8a93          	addi	s5,s5,1676 # 80006ca0 <end>
    8000361c:	0954e263          	bltu	s1,s5,800036a0 <freerange+0xd0>
    80003620:	01100993          	li	s3,17
    80003624:	01b99993          	slli	s3,s3,0x1b
    80003628:	0734fc63          	bgeu	s1,s3,800036a0 <freerange+0xd0>
    8000362c:	00058a13          	mv	s4,a1
    80003630:	00002917          	auipc	s2,0x2
    80003634:	3c090913          	addi	s2,s2,960 # 800059f0 <kmem>
    80003638:	00002b37          	lui	s6,0x2
    8000363c:	0140006f          	j	80003650 <freerange+0x80>
    80003640:	000017b7          	lui	a5,0x1
    80003644:	00f484b3          	add	s1,s1,a5
    80003648:	0554ec63          	bltu	s1,s5,800036a0 <freerange+0xd0>
    8000364c:	0534fa63          	bgeu	s1,s3,800036a0 <freerange+0xd0>
    80003650:	00001637          	lui	a2,0x1
    80003654:	00100593          	li	a1,1
    80003658:	00048513          	mv	a0,s1
    8000365c:	00000097          	auipc	ra,0x0
    80003660:	50c080e7          	jalr	1292(ra) # 80003b68 <__memset>
    80003664:	00093703          	ld	a4,0(s2)
    80003668:	016487b3          	add	a5,s1,s6
    8000366c:	00e4b023          	sd	a4,0(s1)
    80003670:	00993023          	sd	s1,0(s2)
    80003674:	fcfa76e3          	bgeu	s4,a5,80003640 <freerange+0x70>
    80003678:	03813083          	ld	ra,56(sp)
    8000367c:	03013403          	ld	s0,48(sp)
    80003680:	02813483          	ld	s1,40(sp)
    80003684:	02013903          	ld	s2,32(sp)
    80003688:	01813983          	ld	s3,24(sp)
    8000368c:	01013a03          	ld	s4,16(sp)
    80003690:	00813a83          	ld	s5,8(sp)
    80003694:	00013b03          	ld	s6,0(sp)
    80003698:	04010113          	addi	sp,sp,64
    8000369c:	00008067          	ret
    800036a0:	00002517          	auipc	a0,0x2
    800036a4:	c6850513          	addi	a0,a0,-920 # 80005308 <digits+0x18>
    800036a8:	fffff097          	auipc	ra,0xfffff
    800036ac:	3d4080e7          	jalr	980(ra) # 80002a7c <panic>

00000000800036b0 <kfree>:
    800036b0:	fe010113          	addi	sp,sp,-32
    800036b4:	00813823          	sd	s0,16(sp)
    800036b8:	00113c23          	sd	ra,24(sp)
    800036bc:	00913423          	sd	s1,8(sp)
    800036c0:	02010413          	addi	s0,sp,32
    800036c4:	03451793          	slli	a5,a0,0x34
    800036c8:	04079c63          	bnez	a5,80003720 <kfree+0x70>
    800036cc:	00003797          	auipc	a5,0x3
    800036d0:	5d478793          	addi	a5,a5,1492 # 80006ca0 <end>
    800036d4:	00050493          	mv	s1,a0
    800036d8:	04f56463          	bltu	a0,a5,80003720 <kfree+0x70>
    800036dc:	01100793          	li	a5,17
    800036e0:	01b79793          	slli	a5,a5,0x1b
    800036e4:	02f57e63          	bgeu	a0,a5,80003720 <kfree+0x70>
    800036e8:	00001637          	lui	a2,0x1
    800036ec:	00100593          	li	a1,1
    800036f0:	00000097          	auipc	ra,0x0
    800036f4:	478080e7          	jalr	1144(ra) # 80003b68 <__memset>
    800036f8:	00002797          	auipc	a5,0x2
    800036fc:	2f878793          	addi	a5,a5,760 # 800059f0 <kmem>
    80003700:	0007b703          	ld	a4,0(a5)
    80003704:	01813083          	ld	ra,24(sp)
    80003708:	01013403          	ld	s0,16(sp)
    8000370c:	00e4b023          	sd	a4,0(s1)
    80003710:	0097b023          	sd	s1,0(a5)
    80003714:	00813483          	ld	s1,8(sp)
    80003718:	02010113          	addi	sp,sp,32
    8000371c:	00008067          	ret
    80003720:	00002517          	auipc	a0,0x2
    80003724:	be850513          	addi	a0,a0,-1048 # 80005308 <digits+0x18>
    80003728:	fffff097          	auipc	ra,0xfffff
    8000372c:	354080e7          	jalr	852(ra) # 80002a7c <panic>

0000000080003730 <kalloc>:
    80003730:	fe010113          	addi	sp,sp,-32
    80003734:	00813823          	sd	s0,16(sp)
    80003738:	00913423          	sd	s1,8(sp)
    8000373c:	00113c23          	sd	ra,24(sp)
    80003740:	02010413          	addi	s0,sp,32
    80003744:	00002797          	auipc	a5,0x2
    80003748:	2ac78793          	addi	a5,a5,684 # 800059f0 <kmem>
    8000374c:	0007b483          	ld	s1,0(a5)
    80003750:	02048063          	beqz	s1,80003770 <kalloc+0x40>
    80003754:	0004b703          	ld	a4,0(s1)
    80003758:	00001637          	lui	a2,0x1
    8000375c:	00500593          	li	a1,5
    80003760:	00048513          	mv	a0,s1
    80003764:	00e7b023          	sd	a4,0(a5)
    80003768:	00000097          	auipc	ra,0x0
    8000376c:	400080e7          	jalr	1024(ra) # 80003b68 <__memset>
    80003770:	01813083          	ld	ra,24(sp)
    80003774:	01013403          	ld	s0,16(sp)
    80003778:	00048513          	mv	a0,s1
    8000377c:	00813483          	ld	s1,8(sp)
    80003780:	02010113          	addi	sp,sp,32
    80003784:	00008067          	ret

0000000080003788 <initlock>:
    80003788:	ff010113          	addi	sp,sp,-16
    8000378c:	00813423          	sd	s0,8(sp)
    80003790:	01010413          	addi	s0,sp,16
    80003794:	00813403          	ld	s0,8(sp)
    80003798:	00b53423          	sd	a1,8(a0)
    8000379c:	00052023          	sw	zero,0(a0)
    800037a0:	00053823          	sd	zero,16(a0)
    800037a4:	01010113          	addi	sp,sp,16
    800037a8:	00008067          	ret

00000000800037ac <acquire>:
    800037ac:	fe010113          	addi	sp,sp,-32
    800037b0:	00813823          	sd	s0,16(sp)
    800037b4:	00913423          	sd	s1,8(sp)
    800037b8:	00113c23          	sd	ra,24(sp)
    800037bc:	01213023          	sd	s2,0(sp)
    800037c0:	02010413          	addi	s0,sp,32
    800037c4:	00050493          	mv	s1,a0
    800037c8:	10002973          	csrr	s2,sstatus
    800037cc:	100027f3          	csrr	a5,sstatus
    800037d0:	ffd7f793          	andi	a5,a5,-3
    800037d4:	10079073          	csrw	sstatus,a5
    800037d8:	fffff097          	auipc	ra,0xfffff
    800037dc:	8e8080e7          	jalr	-1816(ra) # 800020c0 <mycpu>
    800037e0:	07852783          	lw	a5,120(a0)
    800037e4:	06078e63          	beqz	a5,80003860 <acquire+0xb4>
    800037e8:	fffff097          	auipc	ra,0xfffff
    800037ec:	8d8080e7          	jalr	-1832(ra) # 800020c0 <mycpu>
    800037f0:	07852783          	lw	a5,120(a0)
    800037f4:	0004a703          	lw	a4,0(s1)
    800037f8:	0017879b          	addiw	a5,a5,1
    800037fc:	06f52c23          	sw	a5,120(a0)
    80003800:	04071063          	bnez	a4,80003840 <acquire+0x94>
    80003804:	00100713          	li	a4,1
    80003808:	00070793          	mv	a5,a4
    8000380c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80003810:	0007879b          	sext.w	a5,a5
    80003814:	fe079ae3          	bnez	a5,80003808 <acquire+0x5c>
    80003818:	0ff0000f          	fence
    8000381c:	fffff097          	auipc	ra,0xfffff
    80003820:	8a4080e7          	jalr	-1884(ra) # 800020c0 <mycpu>
    80003824:	01813083          	ld	ra,24(sp)
    80003828:	01013403          	ld	s0,16(sp)
    8000382c:	00a4b823          	sd	a0,16(s1)
    80003830:	00013903          	ld	s2,0(sp)
    80003834:	00813483          	ld	s1,8(sp)
    80003838:	02010113          	addi	sp,sp,32
    8000383c:	00008067          	ret
    80003840:	0104b903          	ld	s2,16(s1)
    80003844:	fffff097          	auipc	ra,0xfffff
    80003848:	87c080e7          	jalr	-1924(ra) # 800020c0 <mycpu>
    8000384c:	faa91ce3          	bne	s2,a0,80003804 <acquire+0x58>
    80003850:	00002517          	auipc	a0,0x2
    80003854:	ac050513          	addi	a0,a0,-1344 # 80005310 <digits+0x20>
    80003858:	fffff097          	auipc	ra,0xfffff
    8000385c:	224080e7          	jalr	548(ra) # 80002a7c <panic>
    80003860:	00195913          	srli	s2,s2,0x1
    80003864:	fffff097          	auipc	ra,0xfffff
    80003868:	85c080e7          	jalr	-1956(ra) # 800020c0 <mycpu>
    8000386c:	00197913          	andi	s2,s2,1
    80003870:	07252e23          	sw	s2,124(a0)
    80003874:	f75ff06f          	j	800037e8 <acquire+0x3c>

0000000080003878 <release>:
    80003878:	fe010113          	addi	sp,sp,-32
    8000387c:	00813823          	sd	s0,16(sp)
    80003880:	00113c23          	sd	ra,24(sp)
    80003884:	00913423          	sd	s1,8(sp)
    80003888:	01213023          	sd	s2,0(sp)
    8000388c:	02010413          	addi	s0,sp,32
    80003890:	00052783          	lw	a5,0(a0)
    80003894:	00079a63          	bnez	a5,800038a8 <release+0x30>
    80003898:	00002517          	auipc	a0,0x2
    8000389c:	a8050513          	addi	a0,a0,-1408 # 80005318 <digits+0x28>
    800038a0:	fffff097          	auipc	ra,0xfffff
    800038a4:	1dc080e7          	jalr	476(ra) # 80002a7c <panic>
    800038a8:	01053903          	ld	s2,16(a0)
    800038ac:	00050493          	mv	s1,a0
    800038b0:	fffff097          	auipc	ra,0xfffff
    800038b4:	810080e7          	jalr	-2032(ra) # 800020c0 <mycpu>
    800038b8:	fea910e3          	bne	s2,a0,80003898 <release+0x20>
    800038bc:	0004b823          	sd	zero,16(s1)
    800038c0:	0ff0000f          	fence
    800038c4:	0f50000f          	fence	iorw,ow
    800038c8:	0804a02f          	amoswap.w	zero,zero,(s1)
    800038cc:	ffffe097          	auipc	ra,0xffffe
    800038d0:	7f4080e7          	jalr	2036(ra) # 800020c0 <mycpu>
    800038d4:	100027f3          	csrr	a5,sstatus
    800038d8:	0027f793          	andi	a5,a5,2
    800038dc:	04079a63          	bnez	a5,80003930 <release+0xb8>
    800038e0:	07852783          	lw	a5,120(a0)
    800038e4:	02f05e63          	blez	a5,80003920 <release+0xa8>
    800038e8:	fff7871b          	addiw	a4,a5,-1
    800038ec:	06e52c23          	sw	a4,120(a0)
    800038f0:	00071c63          	bnez	a4,80003908 <release+0x90>
    800038f4:	07c52783          	lw	a5,124(a0)
    800038f8:	00078863          	beqz	a5,80003908 <release+0x90>
    800038fc:	100027f3          	csrr	a5,sstatus
    80003900:	0027e793          	ori	a5,a5,2
    80003904:	10079073          	csrw	sstatus,a5
    80003908:	01813083          	ld	ra,24(sp)
    8000390c:	01013403          	ld	s0,16(sp)
    80003910:	00813483          	ld	s1,8(sp)
    80003914:	00013903          	ld	s2,0(sp)
    80003918:	02010113          	addi	sp,sp,32
    8000391c:	00008067          	ret
    80003920:	00002517          	auipc	a0,0x2
    80003924:	a1850513          	addi	a0,a0,-1512 # 80005338 <digits+0x48>
    80003928:	fffff097          	auipc	ra,0xfffff
    8000392c:	154080e7          	jalr	340(ra) # 80002a7c <panic>
    80003930:	00002517          	auipc	a0,0x2
    80003934:	9f050513          	addi	a0,a0,-1552 # 80005320 <digits+0x30>
    80003938:	fffff097          	auipc	ra,0xfffff
    8000393c:	144080e7          	jalr	324(ra) # 80002a7c <panic>

0000000080003940 <holding>:
    80003940:	00052783          	lw	a5,0(a0)
    80003944:	00079663          	bnez	a5,80003950 <holding+0x10>
    80003948:	00000513          	li	a0,0
    8000394c:	00008067          	ret
    80003950:	fe010113          	addi	sp,sp,-32
    80003954:	00813823          	sd	s0,16(sp)
    80003958:	00913423          	sd	s1,8(sp)
    8000395c:	00113c23          	sd	ra,24(sp)
    80003960:	02010413          	addi	s0,sp,32
    80003964:	01053483          	ld	s1,16(a0)
    80003968:	ffffe097          	auipc	ra,0xffffe
    8000396c:	758080e7          	jalr	1880(ra) # 800020c0 <mycpu>
    80003970:	01813083          	ld	ra,24(sp)
    80003974:	01013403          	ld	s0,16(sp)
    80003978:	40a48533          	sub	a0,s1,a0
    8000397c:	00153513          	seqz	a0,a0
    80003980:	00813483          	ld	s1,8(sp)
    80003984:	02010113          	addi	sp,sp,32
    80003988:	00008067          	ret

000000008000398c <push_off>:
    8000398c:	fe010113          	addi	sp,sp,-32
    80003990:	00813823          	sd	s0,16(sp)
    80003994:	00113c23          	sd	ra,24(sp)
    80003998:	00913423          	sd	s1,8(sp)
    8000399c:	02010413          	addi	s0,sp,32
    800039a0:	100024f3          	csrr	s1,sstatus
    800039a4:	100027f3          	csrr	a5,sstatus
    800039a8:	ffd7f793          	andi	a5,a5,-3
    800039ac:	10079073          	csrw	sstatus,a5
    800039b0:	ffffe097          	auipc	ra,0xffffe
    800039b4:	710080e7          	jalr	1808(ra) # 800020c0 <mycpu>
    800039b8:	07852783          	lw	a5,120(a0)
    800039bc:	02078663          	beqz	a5,800039e8 <push_off+0x5c>
    800039c0:	ffffe097          	auipc	ra,0xffffe
    800039c4:	700080e7          	jalr	1792(ra) # 800020c0 <mycpu>
    800039c8:	07852783          	lw	a5,120(a0)
    800039cc:	01813083          	ld	ra,24(sp)
    800039d0:	01013403          	ld	s0,16(sp)
    800039d4:	0017879b          	addiw	a5,a5,1
    800039d8:	06f52c23          	sw	a5,120(a0)
    800039dc:	00813483          	ld	s1,8(sp)
    800039e0:	02010113          	addi	sp,sp,32
    800039e4:	00008067          	ret
    800039e8:	0014d493          	srli	s1,s1,0x1
    800039ec:	ffffe097          	auipc	ra,0xffffe
    800039f0:	6d4080e7          	jalr	1748(ra) # 800020c0 <mycpu>
    800039f4:	0014f493          	andi	s1,s1,1
    800039f8:	06952e23          	sw	s1,124(a0)
    800039fc:	fc5ff06f          	j	800039c0 <push_off+0x34>

0000000080003a00 <pop_off>:
    80003a00:	ff010113          	addi	sp,sp,-16
    80003a04:	00813023          	sd	s0,0(sp)
    80003a08:	00113423          	sd	ra,8(sp)
    80003a0c:	01010413          	addi	s0,sp,16
    80003a10:	ffffe097          	auipc	ra,0xffffe
    80003a14:	6b0080e7          	jalr	1712(ra) # 800020c0 <mycpu>
    80003a18:	100027f3          	csrr	a5,sstatus
    80003a1c:	0027f793          	andi	a5,a5,2
    80003a20:	04079663          	bnez	a5,80003a6c <pop_off+0x6c>
    80003a24:	07852783          	lw	a5,120(a0)
    80003a28:	02f05a63          	blez	a5,80003a5c <pop_off+0x5c>
    80003a2c:	fff7871b          	addiw	a4,a5,-1
    80003a30:	06e52c23          	sw	a4,120(a0)
    80003a34:	00071c63          	bnez	a4,80003a4c <pop_off+0x4c>
    80003a38:	07c52783          	lw	a5,124(a0)
    80003a3c:	00078863          	beqz	a5,80003a4c <pop_off+0x4c>
    80003a40:	100027f3          	csrr	a5,sstatus
    80003a44:	0027e793          	ori	a5,a5,2
    80003a48:	10079073          	csrw	sstatus,a5
    80003a4c:	00813083          	ld	ra,8(sp)
    80003a50:	00013403          	ld	s0,0(sp)
    80003a54:	01010113          	addi	sp,sp,16
    80003a58:	00008067          	ret
    80003a5c:	00002517          	auipc	a0,0x2
    80003a60:	8dc50513          	addi	a0,a0,-1828 # 80005338 <digits+0x48>
    80003a64:	fffff097          	auipc	ra,0xfffff
    80003a68:	018080e7          	jalr	24(ra) # 80002a7c <panic>
    80003a6c:	00002517          	auipc	a0,0x2
    80003a70:	8b450513          	addi	a0,a0,-1868 # 80005320 <digits+0x30>
    80003a74:	fffff097          	auipc	ra,0xfffff
    80003a78:	008080e7          	jalr	8(ra) # 80002a7c <panic>

0000000080003a7c <push_on>:
    80003a7c:	fe010113          	addi	sp,sp,-32
    80003a80:	00813823          	sd	s0,16(sp)
    80003a84:	00113c23          	sd	ra,24(sp)
    80003a88:	00913423          	sd	s1,8(sp)
    80003a8c:	02010413          	addi	s0,sp,32
    80003a90:	100024f3          	csrr	s1,sstatus
    80003a94:	100027f3          	csrr	a5,sstatus
    80003a98:	0027e793          	ori	a5,a5,2
    80003a9c:	10079073          	csrw	sstatus,a5
    80003aa0:	ffffe097          	auipc	ra,0xffffe
    80003aa4:	620080e7          	jalr	1568(ra) # 800020c0 <mycpu>
    80003aa8:	07852783          	lw	a5,120(a0)
    80003aac:	02078663          	beqz	a5,80003ad8 <push_on+0x5c>
    80003ab0:	ffffe097          	auipc	ra,0xffffe
    80003ab4:	610080e7          	jalr	1552(ra) # 800020c0 <mycpu>
    80003ab8:	07852783          	lw	a5,120(a0)
    80003abc:	01813083          	ld	ra,24(sp)
    80003ac0:	01013403          	ld	s0,16(sp)
    80003ac4:	0017879b          	addiw	a5,a5,1
    80003ac8:	06f52c23          	sw	a5,120(a0)
    80003acc:	00813483          	ld	s1,8(sp)
    80003ad0:	02010113          	addi	sp,sp,32
    80003ad4:	00008067          	ret
    80003ad8:	0014d493          	srli	s1,s1,0x1
    80003adc:	ffffe097          	auipc	ra,0xffffe
    80003ae0:	5e4080e7          	jalr	1508(ra) # 800020c0 <mycpu>
    80003ae4:	0014f493          	andi	s1,s1,1
    80003ae8:	06952e23          	sw	s1,124(a0)
    80003aec:	fc5ff06f          	j	80003ab0 <push_on+0x34>

0000000080003af0 <pop_on>:
    80003af0:	ff010113          	addi	sp,sp,-16
    80003af4:	00813023          	sd	s0,0(sp)
    80003af8:	00113423          	sd	ra,8(sp)
    80003afc:	01010413          	addi	s0,sp,16
    80003b00:	ffffe097          	auipc	ra,0xffffe
    80003b04:	5c0080e7          	jalr	1472(ra) # 800020c0 <mycpu>
    80003b08:	100027f3          	csrr	a5,sstatus
    80003b0c:	0027f793          	andi	a5,a5,2
    80003b10:	04078463          	beqz	a5,80003b58 <pop_on+0x68>
    80003b14:	07852783          	lw	a5,120(a0)
    80003b18:	02f05863          	blez	a5,80003b48 <pop_on+0x58>
    80003b1c:	fff7879b          	addiw	a5,a5,-1
    80003b20:	06f52c23          	sw	a5,120(a0)
    80003b24:	07853783          	ld	a5,120(a0)
    80003b28:	00079863          	bnez	a5,80003b38 <pop_on+0x48>
    80003b2c:	100027f3          	csrr	a5,sstatus
    80003b30:	ffd7f793          	andi	a5,a5,-3
    80003b34:	10079073          	csrw	sstatus,a5
    80003b38:	00813083          	ld	ra,8(sp)
    80003b3c:	00013403          	ld	s0,0(sp)
    80003b40:	01010113          	addi	sp,sp,16
    80003b44:	00008067          	ret
    80003b48:	00002517          	auipc	a0,0x2
    80003b4c:	81850513          	addi	a0,a0,-2024 # 80005360 <digits+0x70>
    80003b50:	fffff097          	auipc	ra,0xfffff
    80003b54:	f2c080e7          	jalr	-212(ra) # 80002a7c <panic>
    80003b58:	00001517          	auipc	a0,0x1
    80003b5c:	7e850513          	addi	a0,a0,2024 # 80005340 <digits+0x50>
    80003b60:	fffff097          	auipc	ra,0xfffff
    80003b64:	f1c080e7          	jalr	-228(ra) # 80002a7c <panic>

0000000080003b68 <__memset>:
    80003b68:	ff010113          	addi	sp,sp,-16
    80003b6c:	00813423          	sd	s0,8(sp)
    80003b70:	01010413          	addi	s0,sp,16
    80003b74:	1a060e63          	beqz	a2,80003d30 <__memset+0x1c8>
    80003b78:	40a007b3          	neg	a5,a0
    80003b7c:	0077f793          	andi	a5,a5,7
    80003b80:	00778693          	addi	a3,a5,7
    80003b84:	00b00813          	li	a6,11
    80003b88:	0ff5f593          	andi	a1,a1,255
    80003b8c:	fff6071b          	addiw	a4,a2,-1
    80003b90:	1b06e663          	bltu	a3,a6,80003d3c <__memset+0x1d4>
    80003b94:	1cd76463          	bltu	a4,a3,80003d5c <__memset+0x1f4>
    80003b98:	1a078e63          	beqz	a5,80003d54 <__memset+0x1ec>
    80003b9c:	00b50023          	sb	a1,0(a0)
    80003ba0:	00100713          	li	a4,1
    80003ba4:	1ae78463          	beq	a5,a4,80003d4c <__memset+0x1e4>
    80003ba8:	00b500a3          	sb	a1,1(a0)
    80003bac:	00200713          	li	a4,2
    80003bb0:	1ae78a63          	beq	a5,a4,80003d64 <__memset+0x1fc>
    80003bb4:	00b50123          	sb	a1,2(a0)
    80003bb8:	00300713          	li	a4,3
    80003bbc:	18e78463          	beq	a5,a4,80003d44 <__memset+0x1dc>
    80003bc0:	00b501a3          	sb	a1,3(a0)
    80003bc4:	00400713          	li	a4,4
    80003bc8:	1ae78263          	beq	a5,a4,80003d6c <__memset+0x204>
    80003bcc:	00b50223          	sb	a1,4(a0)
    80003bd0:	00500713          	li	a4,5
    80003bd4:	1ae78063          	beq	a5,a4,80003d74 <__memset+0x20c>
    80003bd8:	00b502a3          	sb	a1,5(a0)
    80003bdc:	00700713          	li	a4,7
    80003be0:	18e79e63          	bne	a5,a4,80003d7c <__memset+0x214>
    80003be4:	00b50323          	sb	a1,6(a0)
    80003be8:	00700e93          	li	t4,7
    80003bec:	00859713          	slli	a4,a1,0x8
    80003bf0:	00e5e733          	or	a4,a1,a4
    80003bf4:	01059e13          	slli	t3,a1,0x10
    80003bf8:	01c76e33          	or	t3,a4,t3
    80003bfc:	01859313          	slli	t1,a1,0x18
    80003c00:	006e6333          	or	t1,t3,t1
    80003c04:	02059893          	slli	a7,a1,0x20
    80003c08:	40f60e3b          	subw	t3,a2,a5
    80003c0c:	011368b3          	or	a7,t1,a7
    80003c10:	02859813          	slli	a6,a1,0x28
    80003c14:	0108e833          	or	a6,a7,a6
    80003c18:	03059693          	slli	a3,a1,0x30
    80003c1c:	003e589b          	srliw	a7,t3,0x3
    80003c20:	00d866b3          	or	a3,a6,a3
    80003c24:	03859713          	slli	a4,a1,0x38
    80003c28:	00389813          	slli	a6,a7,0x3
    80003c2c:	00f507b3          	add	a5,a0,a5
    80003c30:	00e6e733          	or	a4,a3,a4
    80003c34:	000e089b          	sext.w	a7,t3
    80003c38:	00f806b3          	add	a3,a6,a5
    80003c3c:	00e7b023          	sd	a4,0(a5)
    80003c40:	00878793          	addi	a5,a5,8
    80003c44:	fed79ce3          	bne	a5,a3,80003c3c <__memset+0xd4>
    80003c48:	ff8e7793          	andi	a5,t3,-8
    80003c4c:	0007871b          	sext.w	a4,a5
    80003c50:	01d787bb          	addw	a5,a5,t4
    80003c54:	0ce88e63          	beq	a7,a4,80003d30 <__memset+0x1c8>
    80003c58:	00f50733          	add	a4,a0,a5
    80003c5c:	00b70023          	sb	a1,0(a4)
    80003c60:	0017871b          	addiw	a4,a5,1
    80003c64:	0cc77663          	bgeu	a4,a2,80003d30 <__memset+0x1c8>
    80003c68:	00e50733          	add	a4,a0,a4
    80003c6c:	00b70023          	sb	a1,0(a4)
    80003c70:	0027871b          	addiw	a4,a5,2
    80003c74:	0ac77e63          	bgeu	a4,a2,80003d30 <__memset+0x1c8>
    80003c78:	00e50733          	add	a4,a0,a4
    80003c7c:	00b70023          	sb	a1,0(a4)
    80003c80:	0037871b          	addiw	a4,a5,3
    80003c84:	0ac77663          	bgeu	a4,a2,80003d30 <__memset+0x1c8>
    80003c88:	00e50733          	add	a4,a0,a4
    80003c8c:	00b70023          	sb	a1,0(a4)
    80003c90:	0047871b          	addiw	a4,a5,4
    80003c94:	08c77e63          	bgeu	a4,a2,80003d30 <__memset+0x1c8>
    80003c98:	00e50733          	add	a4,a0,a4
    80003c9c:	00b70023          	sb	a1,0(a4)
    80003ca0:	0057871b          	addiw	a4,a5,5
    80003ca4:	08c77663          	bgeu	a4,a2,80003d30 <__memset+0x1c8>
    80003ca8:	00e50733          	add	a4,a0,a4
    80003cac:	00b70023          	sb	a1,0(a4)
    80003cb0:	0067871b          	addiw	a4,a5,6
    80003cb4:	06c77e63          	bgeu	a4,a2,80003d30 <__memset+0x1c8>
    80003cb8:	00e50733          	add	a4,a0,a4
    80003cbc:	00b70023          	sb	a1,0(a4)
    80003cc0:	0077871b          	addiw	a4,a5,7
    80003cc4:	06c77663          	bgeu	a4,a2,80003d30 <__memset+0x1c8>
    80003cc8:	00e50733          	add	a4,a0,a4
    80003ccc:	00b70023          	sb	a1,0(a4)
    80003cd0:	0087871b          	addiw	a4,a5,8
    80003cd4:	04c77e63          	bgeu	a4,a2,80003d30 <__memset+0x1c8>
    80003cd8:	00e50733          	add	a4,a0,a4
    80003cdc:	00b70023          	sb	a1,0(a4)
    80003ce0:	0097871b          	addiw	a4,a5,9
    80003ce4:	04c77663          	bgeu	a4,a2,80003d30 <__memset+0x1c8>
    80003ce8:	00e50733          	add	a4,a0,a4
    80003cec:	00b70023          	sb	a1,0(a4)
    80003cf0:	00a7871b          	addiw	a4,a5,10
    80003cf4:	02c77e63          	bgeu	a4,a2,80003d30 <__memset+0x1c8>
    80003cf8:	00e50733          	add	a4,a0,a4
    80003cfc:	00b70023          	sb	a1,0(a4)
    80003d00:	00b7871b          	addiw	a4,a5,11
    80003d04:	02c77663          	bgeu	a4,a2,80003d30 <__memset+0x1c8>
    80003d08:	00e50733          	add	a4,a0,a4
    80003d0c:	00b70023          	sb	a1,0(a4)
    80003d10:	00c7871b          	addiw	a4,a5,12
    80003d14:	00c77e63          	bgeu	a4,a2,80003d30 <__memset+0x1c8>
    80003d18:	00e50733          	add	a4,a0,a4
    80003d1c:	00b70023          	sb	a1,0(a4)
    80003d20:	00d7879b          	addiw	a5,a5,13
    80003d24:	00c7f663          	bgeu	a5,a2,80003d30 <__memset+0x1c8>
    80003d28:	00f507b3          	add	a5,a0,a5
    80003d2c:	00b78023          	sb	a1,0(a5)
    80003d30:	00813403          	ld	s0,8(sp)
    80003d34:	01010113          	addi	sp,sp,16
    80003d38:	00008067          	ret
    80003d3c:	00b00693          	li	a3,11
    80003d40:	e55ff06f          	j	80003b94 <__memset+0x2c>
    80003d44:	00300e93          	li	t4,3
    80003d48:	ea5ff06f          	j	80003bec <__memset+0x84>
    80003d4c:	00100e93          	li	t4,1
    80003d50:	e9dff06f          	j	80003bec <__memset+0x84>
    80003d54:	00000e93          	li	t4,0
    80003d58:	e95ff06f          	j	80003bec <__memset+0x84>
    80003d5c:	00000793          	li	a5,0
    80003d60:	ef9ff06f          	j	80003c58 <__memset+0xf0>
    80003d64:	00200e93          	li	t4,2
    80003d68:	e85ff06f          	j	80003bec <__memset+0x84>
    80003d6c:	00400e93          	li	t4,4
    80003d70:	e7dff06f          	j	80003bec <__memset+0x84>
    80003d74:	00500e93          	li	t4,5
    80003d78:	e75ff06f          	j	80003bec <__memset+0x84>
    80003d7c:	00600e93          	li	t4,6
    80003d80:	e6dff06f          	j	80003bec <__memset+0x84>

0000000080003d84 <__memmove>:
    80003d84:	ff010113          	addi	sp,sp,-16
    80003d88:	00813423          	sd	s0,8(sp)
    80003d8c:	01010413          	addi	s0,sp,16
    80003d90:	0e060863          	beqz	a2,80003e80 <__memmove+0xfc>
    80003d94:	fff6069b          	addiw	a3,a2,-1
    80003d98:	0006881b          	sext.w	a6,a3
    80003d9c:	0ea5e863          	bltu	a1,a0,80003e8c <__memmove+0x108>
    80003da0:	00758713          	addi	a4,a1,7
    80003da4:	00a5e7b3          	or	a5,a1,a0
    80003da8:	40a70733          	sub	a4,a4,a0
    80003dac:	0077f793          	andi	a5,a5,7
    80003db0:	00f73713          	sltiu	a4,a4,15
    80003db4:	00174713          	xori	a4,a4,1
    80003db8:	0017b793          	seqz	a5,a5
    80003dbc:	00e7f7b3          	and	a5,a5,a4
    80003dc0:	10078863          	beqz	a5,80003ed0 <__memmove+0x14c>
    80003dc4:	00900793          	li	a5,9
    80003dc8:	1107f463          	bgeu	a5,a6,80003ed0 <__memmove+0x14c>
    80003dcc:	0036581b          	srliw	a6,a2,0x3
    80003dd0:	fff8081b          	addiw	a6,a6,-1
    80003dd4:	02081813          	slli	a6,a6,0x20
    80003dd8:	01d85893          	srli	a7,a6,0x1d
    80003ddc:	00858813          	addi	a6,a1,8
    80003de0:	00058793          	mv	a5,a1
    80003de4:	00050713          	mv	a4,a0
    80003de8:	01088833          	add	a6,a7,a6
    80003dec:	0007b883          	ld	a7,0(a5)
    80003df0:	00878793          	addi	a5,a5,8
    80003df4:	00870713          	addi	a4,a4,8
    80003df8:	ff173c23          	sd	a7,-8(a4)
    80003dfc:	ff0798e3          	bne	a5,a6,80003dec <__memmove+0x68>
    80003e00:	ff867713          	andi	a4,a2,-8
    80003e04:	02071793          	slli	a5,a4,0x20
    80003e08:	0207d793          	srli	a5,a5,0x20
    80003e0c:	00f585b3          	add	a1,a1,a5
    80003e10:	40e686bb          	subw	a3,a3,a4
    80003e14:	00f507b3          	add	a5,a0,a5
    80003e18:	06e60463          	beq	a2,a4,80003e80 <__memmove+0xfc>
    80003e1c:	0005c703          	lbu	a4,0(a1)
    80003e20:	00e78023          	sb	a4,0(a5)
    80003e24:	04068e63          	beqz	a3,80003e80 <__memmove+0xfc>
    80003e28:	0015c603          	lbu	a2,1(a1)
    80003e2c:	00100713          	li	a4,1
    80003e30:	00c780a3          	sb	a2,1(a5)
    80003e34:	04e68663          	beq	a3,a4,80003e80 <__memmove+0xfc>
    80003e38:	0025c603          	lbu	a2,2(a1)
    80003e3c:	00200713          	li	a4,2
    80003e40:	00c78123          	sb	a2,2(a5)
    80003e44:	02e68e63          	beq	a3,a4,80003e80 <__memmove+0xfc>
    80003e48:	0035c603          	lbu	a2,3(a1)
    80003e4c:	00300713          	li	a4,3
    80003e50:	00c781a3          	sb	a2,3(a5)
    80003e54:	02e68663          	beq	a3,a4,80003e80 <__memmove+0xfc>
    80003e58:	0045c603          	lbu	a2,4(a1)
    80003e5c:	00400713          	li	a4,4
    80003e60:	00c78223          	sb	a2,4(a5)
    80003e64:	00e68e63          	beq	a3,a4,80003e80 <__memmove+0xfc>
    80003e68:	0055c603          	lbu	a2,5(a1)
    80003e6c:	00500713          	li	a4,5
    80003e70:	00c782a3          	sb	a2,5(a5)
    80003e74:	00e68663          	beq	a3,a4,80003e80 <__memmove+0xfc>
    80003e78:	0065c703          	lbu	a4,6(a1)
    80003e7c:	00e78323          	sb	a4,6(a5)
    80003e80:	00813403          	ld	s0,8(sp)
    80003e84:	01010113          	addi	sp,sp,16
    80003e88:	00008067          	ret
    80003e8c:	02061713          	slli	a4,a2,0x20
    80003e90:	02075713          	srli	a4,a4,0x20
    80003e94:	00e587b3          	add	a5,a1,a4
    80003e98:	f0f574e3          	bgeu	a0,a5,80003da0 <__memmove+0x1c>
    80003e9c:	02069613          	slli	a2,a3,0x20
    80003ea0:	02065613          	srli	a2,a2,0x20
    80003ea4:	fff64613          	not	a2,a2
    80003ea8:	00e50733          	add	a4,a0,a4
    80003eac:	00c78633          	add	a2,a5,a2
    80003eb0:	fff7c683          	lbu	a3,-1(a5)
    80003eb4:	fff78793          	addi	a5,a5,-1
    80003eb8:	fff70713          	addi	a4,a4,-1
    80003ebc:	00d70023          	sb	a3,0(a4)
    80003ec0:	fec798e3          	bne	a5,a2,80003eb0 <__memmove+0x12c>
    80003ec4:	00813403          	ld	s0,8(sp)
    80003ec8:	01010113          	addi	sp,sp,16
    80003ecc:	00008067          	ret
    80003ed0:	02069713          	slli	a4,a3,0x20
    80003ed4:	02075713          	srli	a4,a4,0x20
    80003ed8:	00170713          	addi	a4,a4,1
    80003edc:	00e50733          	add	a4,a0,a4
    80003ee0:	00050793          	mv	a5,a0
    80003ee4:	0005c683          	lbu	a3,0(a1)
    80003ee8:	00178793          	addi	a5,a5,1
    80003eec:	00158593          	addi	a1,a1,1
    80003ef0:	fed78fa3          	sb	a3,-1(a5)
    80003ef4:	fee798e3          	bne	a5,a4,80003ee4 <__memmove+0x160>
    80003ef8:	f89ff06f          	j	80003e80 <__memmove+0xfc>

0000000080003efc <__putc>:
    80003efc:	fe010113          	addi	sp,sp,-32
    80003f00:	00813823          	sd	s0,16(sp)
    80003f04:	00113c23          	sd	ra,24(sp)
    80003f08:	02010413          	addi	s0,sp,32
    80003f0c:	00050793          	mv	a5,a0
    80003f10:	fef40593          	addi	a1,s0,-17
    80003f14:	00100613          	li	a2,1
    80003f18:	00000513          	li	a0,0
    80003f1c:	fef407a3          	sb	a5,-17(s0)
    80003f20:	fffff097          	auipc	ra,0xfffff
    80003f24:	b3c080e7          	jalr	-1220(ra) # 80002a5c <console_write>
    80003f28:	01813083          	ld	ra,24(sp)
    80003f2c:	01013403          	ld	s0,16(sp)
    80003f30:	02010113          	addi	sp,sp,32
    80003f34:	00008067          	ret

0000000080003f38 <__getc>:
    80003f38:	fe010113          	addi	sp,sp,-32
    80003f3c:	00813823          	sd	s0,16(sp)
    80003f40:	00113c23          	sd	ra,24(sp)
    80003f44:	02010413          	addi	s0,sp,32
    80003f48:	fe840593          	addi	a1,s0,-24
    80003f4c:	00100613          	li	a2,1
    80003f50:	00000513          	li	a0,0
    80003f54:	fffff097          	auipc	ra,0xfffff
    80003f58:	ae8080e7          	jalr	-1304(ra) # 80002a3c <console_read>
    80003f5c:	fe844503          	lbu	a0,-24(s0)
    80003f60:	01813083          	ld	ra,24(sp)
    80003f64:	01013403          	ld	s0,16(sp)
    80003f68:	02010113          	addi	sp,sp,32
    80003f6c:	00008067          	ret

0000000080003f70 <console_handler>:
    80003f70:	fe010113          	addi	sp,sp,-32
    80003f74:	00813823          	sd	s0,16(sp)
    80003f78:	00113c23          	sd	ra,24(sp)
    80003f7c:	00913423          	sd	s1,8(sp)
    80003f80:	02010413          	addi	s0,sp,32
    80003f84:	14202773          	csrr	a4,scause
    80003f88:	100027f3          	csrr	a5,sstatus
    80003f8c:	0027f793          	andi	a5,a5,2
    80003f90:	06079e63          	bnez	a5,8000400c <console_handler+0x9c>
    80003f94:	00074c63          	bltz	a4,80003fac <console_handler+0x3c>
    80003f98:	01813083          	ld	ra,24(sp)
    80003f9c:	01013403          	ld	s0,16(sp)
    80003fa0:	00813483          	ld	s1,8(sp)
    80003fa4:	02010113          	addi	sp,sp,32
    80003fa8:	00008067          	ret
    80003fac:	0ff77713          	andi	a4,a4,255
    80003fb0:	00900793          	li	a5,9
    80003fb4:	fef712e3          	bne	a4,a5,80003f98 <console_handler+0x28>
    80003fb8:	ffffe097          	auipc	ra,0xffffe
    80003fbc:	6dc080e7          	jalr	1756(ra) # 80002694 <plic_claim>
    80003fc0:	00a00793          	li	a5,10
    80003fc4:	00050493          	mv	s1,a0
    80003fc8:	02f50c63          	beq	a0,a5,80004000 <console_handler+0x90>
    80003fcc:	fc0506e3          	beqz	a0,80003f98 <console_handler+0x28>
    80003fd0:	00050593          	mv	a1,a0
    80003fd4:	00001517          	auipc	a0,0x1
    80003fd8:	29450513          	addi	a0,a0,660 # 80005268 <_ZZ12printIntegermE6digits+0x248>
    80003fdc:	fffff097          	auipc	ra,0xfffff
    80003fe0:	afc080e7          	jalr	-1284(ra) # 80002ad8 <__printf>
    80003fe4:	01013403          	ld	s0,16(sp)
    80003fe8:	01813083          	ld	ra,24(sp)
    80003fec:	00048513          	mv	a0,s1
    80003ff0:	00813483          	ld	s1,8(sp)
    80003ff4:	02010113          	addi	sp,sp,32
    80003ff8:	ffffe317          	auipc	t1,0xffffe
    80003ffc:	6d430067          	jr	1748(t1) # 800026cc <plic_complete>
    80004000:	fffff097          	auipc	ra,0xfffff
    80004004:	3e0080e7          	jalr	992(ra) # 800033e0 <uartintr>
    80004008:	fddff06f          	j	80003fe4 <console_handler+0x74>
    8000400c:	00001517          	auipc	a0,0x1
    80004010:	35c50513          	addi	a0,a0,860 # 80005368 <digits+0x78>
    80004014:	fffff097          	auipc	ra,0xfffff
    80004018:	a68080e7          	jalr	-1432(ra) # 80002a7c <panic>
	...
