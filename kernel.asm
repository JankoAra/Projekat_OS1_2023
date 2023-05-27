
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00005117          	auipc	sp,0x5
    80000004:	95813103          	ld	sp,-1704(sp) # 80004958 <_GLOBAL_OFFSET_TABLE_+0x10>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	50d010ef          	jal	ra,80001d28 <start>

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
    80001188:	660000ef          	jal	ra,800017e8 <interruptRoutine>

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
    800012a4:	ff010113          	addi	sp,sp,-16
    800012a8:	00813423          	sd	s0,8(sp)
    800012ac:	01010413          	addi	s0,sp,16
	return 0;
}
    800012b0:	00000513          	li	a0,0
    800012b4:	00813403          	ld	s0,8(sp)
    800012b8:	01010113          	addi	sp,sp,16
    800012bc:	00008067          	ret

00000000800012c0 <_Z11thread_exitv>:

int thread_exit() {
    800012c0:	ff010113          	addi	sp,sp,-16
    800012c4:	00813423          	sd	s0,8(sp)
    800012c8:	01010413          	addi	s0,sp,16
	return 0;
}
    800012cc:	00000513          	li	a0,0
    800012d0:	00813403          	ld	s0,8(sp)
    800012d4:	01010113          	addi	sp,sp,16
    800012d8:	00008067          	ret

00000000800012dc <_Z15thread_dispatchv>:

void thread_dispatch() {
    800012dc:	ff010113          	addi	sp,sp,-16
    800012e0:	00813423          	sd	s0,8(sp)
    800012e4:	01010413          	addi	s0,sp,16

}
    800012e8:	00813403          	ld	s0,8(sp)
    800012ec:	01010113          	addi	sp,sp,16
    800012f0:	00008067          	ret

00000000800012f4 <_Z11thread_joinP3TCB>:

void thread_join(thread_t handle) {
    800012f4:	ff010113          	addi	sp,sp,-16
    800012f8:	00813423          	sd	s0,8(sp)
    800012fc:	01010413          	addi	s0,sp,16

}
    80001300:	00813403          	ld	s0,8(sp)
    80001304:	01010113          	addi	sp,sp,16
    80001308:	00008067          	ret

000000008000130c <_Z10time_sleepm>:

int time_sleep(time_t) {
    8000130c:	ff010113          	addi	sp,sp,-16
    80001310:	00813423          	sd	s0,8(sp)
    80001314:	01010413          	addi	s0,sp,16
	return 0;
}
    80001318:	00000513          	li	a0,0
    8000131c:	00813403          	ld	s0,8(sp)
    80001320:	01010113          	addi	sp,sp,16
    80001324:	00008067          	ret

0000000080001328 <_Z8sem_openPP4_semj>:

int sem_open(sem_t* handle, unsigned int init) {
    80001328:	ff010113          	addi	sp,sp,-16
    8000132c:	00813423          	sd	s0,8(sp)
    80001330:	01010413          	addi	s0,sp,16
	return 0;
}
    80001334:	00000513          	li	a0,0
    80001338:	00813403          	ld	s0,8(sp)
    8000133c:	01010113          	addi	sp,sp,16
    80001340:	00008067          	ret

0000000080001344 <_Z9sem_closeP4_sem>:

int sem_close(sem_t handle) {
    80001344:	ff010113          	addi	sp,sp,-16
    80001348:	00813423          	sd	s0,8(sp)
    8000134c:	01010413          	addi	s0,sp,16
	return 0;
}
    80001350:	00000513          	li	a0,0
    80001354:	00813403          	ld	s0,8(sp)
    80001358:	01010113          	addi	sp,sp,16
    8000135c:	00008067          	ret

0000000080001360 <_Z8sem_waitP4_sem>:

int sem_wait(sem_t id) {
    80001360:	ff010113          	addi	sp,sp,-16
    80001364:	00813423          	sd	s0,8(sp)
    80001368:	01010413          	addi	s0,sp,16
	return 0;
}
    8000136c:	00000513          	li	a0,0
    80001370:	00813403          	ld	s0,8(sp)
    80001374:	01010113          	addi	sp,sp,16
    80001378:	00008067          	ret

000000008000137c <_Z10sem_signalP4_sem>:

int sem_signal(sem_t id) {
    8000137c:	ff010113          	addi	sp,sp,-16
    80001380:	00813423          	sd	s0,8(sp)
    80001384:	01010413          	addi	s0,sp,16
	return 0;
}
    80001388:	00000513          	li	a0,0
    8000138c:	00813403          	ld	s0,8(sp)
    80001390:	01010113          	addi	sp,sp,16
    80001394:	00008067          	ret

0000000080001398 <_Z4getcv>:

char getc() {
    80001398:	ff010113          	addi	sp,sp,-16
    8000139c:	00813423          	sd	s0,8(sp)
    800013a0:	01010413          	addi	s0,sp,16
	return 0;
}
    800013a4:	00000513          	li	a0,0
    800013a8:	00813403          	ld	s0,8(sp)
    800013ac:	01010113          	addi	sp,sp,16
    800013b0:	00008067          	ret

00000000800013b4 <_Z4putcc>:

void putc(char) {
    800013b4:	ff010113          	addi	sp,sp,-16
    800013b8:	00813423          	sd	s0,8(sp)
    800013bc:	01010413          	addi	s0,sp,16

}
    800013c0:	00813403          	ld	s0,8(sp)
    800013c4:	01010113          	addi	sp,sp,16
    800013c8:	00008067          	ret

00000000800013cc <_Z11printStringPKc>:
#include "../h/helper.hpp"
#include "../lib/console.h"
#include "../h/Riscv.hpp"

void printString(char const *string) {
    800013cc:	fd010113          	addi	sp,sp,-48
    800013d0:	02113423          	sd	ra,40(sp)
    800013d4:	02813023          	sd	s0,32(sp)
    800013d8:	00913c23          	sd	s1,24(sp)
    800013dc:	01213823          	sd	s2,16(sp)
    800013e0:	03010413          	addi	s0,sp,48
    800013e4:	00050493          	mv	s1,a0
	__asm__ volatile("csrr %[sstatus], sstatus": [sstatus] "=r"(sstatus));
    800013e8:	100027f3          	csrr	a5,sstatus
    800013ec:	fcf43c23          	sd	a5,-40(s0)
	return sstatus;
    800013f0:	fd843903          	ld	s2,-40(s0)
    uint64 oldMask = Riscv::r_sstatus() & Riscv::SSTATUS_SIE;
    800013f4:	00297913          	andi	s2,s2,2
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    800013f8:	00200793          	li	a5,2
    800013fc:	1007b073          	csrc	sstatus,a5
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    while (*string != '\0') {
    80001400:	0004c503          	lbu	a0,0(s1)
    80001404:	00050a63          	beqz	a0,80001418 <_Z11printStringPKc+0x4c>
        __putc(*string);
    80001408:	00003097          	auipc	ra,0x3
    8000140c:	9e4080e7          	jalr	-1564(ra) # 80003dec <__putc>
        string++;
    80001410:	00148493          	addi	s1,s1,1
    while (*string != '\0') {
    80001414:	fedff06f          	j	80001400 <_Z11printStringPKc+0x34>
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80001418:	10092073          	csrs	sstatus,s2
    }
    Riscv::ms_sstatus(oldMask);
}
    8000141c:	02813083          	ld	ra,40(sp)
    80001420:	02013403          	ld	s0,32(sp)
    80001424:	01813483          	ld	s1,24(sp)
    80001428:	01013903          	ld	s2,16(sp)
    8000142c:	03010113          	addi	sp,sp,48
    80001430:	00008067          	ret

0000000080001434 <_Z7printlnPKc>:

void println(char const *string) {
    80001434:	fd010113          	addi	sp,sp,-48
    80001438:	02113423          	sd	ra,40(sp)
    8000143c:	02813023          	sd	s0,32(sp)
    80001440:	00913c23          	sd	s1,24(sp)
    80001444:	03010413          	addi	s0,sp,48
	__asm__ volatile("csrr %[sstatus], sstatus": [sstatus] "=r"(sstatus));
    80001448:	100027f3          	csrr	a5,sstatus
    8000144c:	fcf43c23          	sd	a5,-40(s0)
	return sstatus;
    80001450:	fd843483          	ld	s1,-40(s0)
    uint64 oldMask = Riscv::r_sstatus() & Riscv::SSTATUS_SIE;
    80001454:	0024f493          	andi	s1,s1,2
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80001458:	00200793          	li	a5,2
    8000145c:	1007b073          	csrc	sstatus,a5
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    printString(string);
    80001460:	00000097          	auipc	ra,0x0
    80001464:	f6c080e7          	jalr	-148(ra) # 800013cc <_Z11printStringPKc>
    __putc('\n');
    80001468:	00a00513          	li	a0,10
    8000146c:	00003097          	auipc	ra,0x3
    80001470:	980080e7          	jalr	-1664(ra) # 80003dec <__putc>
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80001474:	1004a073          	csrs	sstatus,s1
    Riscv::ms_sstatus(oldMask);
}
    80001478:	02813083          	ld	ra,40(sp)
    8000147c:	02013403          	ld	s0,32(sp)
    80001480:	01813483          	ld	s1,24(sp)
    80001484:	03010113          	addi	sp,sp,48
    80001488:	00008067          	ret

000000008000148c <_Z12printIntegerm>:

void printInteger(uint64 integer) {
    8000148c:	fc010113          	addi	sp,sp,-64
    80001490:	02113c23          	sd	ra,56(sp)
    80001494:	02813823          	sd	s0,48(sp)
    80001498:	02913423          	sd	s1,40(sp)
    8000149c:	03213023          	sd	s2,32(sp)
    800014a0:	04010413          	addi	s0,sp,64
	__asm__ volatile("csrr %[sstatus], sstatus": [sstatus] "=r"(sstatus));
    800014a4:	100027f3          	csrr	a5,sstatus
    800014a8:	fcf43423          	sd	a5,-56(s0)
	return sstatus;
    800014ac:	fc843903          	ld	s2,-56(s0)
    uint64 oldMask = Riscv::r_sstatus() & Riscv::SSTATUS_SIE;
    800014b0:	00297913          	andi	s2,s2,2
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    800014b4:	00200793          	li	a5,2
    800014b8:	1007b073          	csrc	sstatus,a5
    neg = 0;
    if (integer < 0) {
        neg = 1;
        x = -integer;
    } else {
        x = integer;
    800014bc:	0005051b          	sext.w	a0,a0
    }

    i = 0;
    800014c0:	00000493          	li	s1,0
    do {
        buf[i++] = digits[x % 10];
    800014c4:	00a00613          	li	a2,10
    800014c8:	02c5773b          	remuw	a4,a0,a2
    800014cc:	02071693          	slli	a3,a4,0x20
    800014d0:	0206d693          	srli	a3,a3,0x20
    800014d4:	00003717          	auipc	a4,0x3
    800014d8:	b4c70713          	addi	a4,a4,-1204 # 80004020 <_ZZ12printIntegermE6digits>
    800014dc:	00d70733          	add	a4,a4,a3
    800014e0:	00074703          	lbu	a4,0(a4)
    800014e4:	fe040693          	addi	a3,s0,-32
    800014e8:	009687b3          	add	a5,a3,s1
    800014ec:	0014849b          	addiw	s1,s1,1
    800014f0:	fee78823          	sb	a4,-16(a5)
    } while ((x /= 10) != 0);
    800014f4:	0005071b          	sext.w	a4,a0
    800014f8:	02c5553b          	divuw	a0,a0,a2
    800014fc:	00900793          	li	a5,9
    80001500:	fce7e2e3          	bltu	a5,a4,800014c4 <_Z12printIntegerm+0x38>
    if (neg) buf[i++] = '-';

    while (--i >= 0) {
    80001504:	fff4849b          	addiw	s1,s1,-1
    80001508:	0004ce63          	bltz	s1,80001524 <_Z12printIntegerm+0x98>
        __putc(buf[i]);
    8000150c:	fe040793          	addi	a5,s0,-32
    80001510:	009787b3          	add	a5,a5,s1
    80001514:	ff07c503          	lbu	a0,-16(a5)
    80001518:	00003097          	auipc	ra,0x3
    8000151c:	8d4080e7          	jalr	-1836(ra) # 80003dec <__putc>
    80001520:	fe5ff06f          	j	80001504 <_Z12printIntegerm+0x78>
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80001524:	10092073          	csrs	sstatus,s2
    }
    Riscv::ms_sstatus(oldMask);
}
    80001528:	03813083          	ld	ra,56(sp)
    8000152c:	03013403          	ld	s0,48(sp)
    80001530:	02813483          	ld	s1,40(sp)
    80001534:	02013903          	ld	s2,32(sp)
    80001538:	04010113          	addi	sp,sp,64
    8000153c:	00008067          	ret

0000000080001540 <_Z41__static_initialization_and_destruction_0ii>:
	readyThreads.addLast(thread);
}

TCB* Scheduler::get() {
	return readyThreads.removeFirst();
}
    80001540:	ff010113          	addi	sp,sp,-16
    80001544:	00813423          	sd	s0,8(sp)
    80001548:	01010413          	addi	s0,sp,16
    8000154c:	00100793          	li	a5,1
    80001550:	00f50863          	beq	a0,a5,80001560 <_Z41__static_initialization_and_destruction_0ii+0x20>
    80001554:	00813403          	ld	s0,8(sp)
    80001558:	01010113          	addi	sp,sp,16
    8000155c:	00008067          	ret
    80001560:	000107b7          	lui	a5,0x10
    80001564:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80001568:	fef596e3          	bne	a1,a5,80001554 <_Z41__static_initialization_and_destruction_0ii+0x14>
	};

	Elem* head, * tail;
	uint64 numOfElements;
public:
	List() : head(nullptr), tail(nullptr), numOfElements(0) {}
    8000156c:	00003797          	auipc	a5,0x3
    80001570:	45478793          	addi	a5,a5,1108 # 800049c0 <_ZN9Scheduler12readyThreadsE>
    80001574:	0007b023          	sd	zero,0(a5)
    80001578:	0007b423          	sd	zero,8(a5)
    8000157c:	0007b823          	sd	zero,16(a5)
    80001580:	fd5ff06f          	j	80001554 <_Z41__static_initialization_and_destruction_0ii+0x14>

0000000080001584 <_ZN9Scheduler3putEP3TCB>:
void Scheduler::put(TCB* thread) {
    80001584:	fe010113          	addi	sp,sp,-32
    80001588:	00113c23          	sd	ra,24(sp)
    8000158c:	00813823          	sd	s0,16(sp)
    80001590:	00913423          	sd	s1,8(sp)
    80001594:	02010413          	addi	s0,sp,32
    80001598:	00050493          	mv	s1,a0
		if (!tail) { tail = head; }
		numOfElements++;
	}

	void addLast(T* data) {
		Elem* elem = new Elem(data, nullptr);
    8000159c:	01000513          	li	a0,16
    800015a0:	00000097          	auipc	ra,0x0
    800015a4:	114080e7          	jalr	276(ra) # 800016b4 <_Znwm>
		Elem(T* data, Elem* next) : data(data), next(next) {}
    800015a8:	00953023          	sd	s1,0(a0)
    800015ac:	00053423          	sd	zero,8(a0)
		if (tail) {
    800015b0:	00003797          	auipc	a5,0x3
    800015b4:	4187b783          	ld	a5,1048(a5) # 800049c8 <_ZN9Scheduler12readyThreadsE+0x8>
    800015b8:	02078c63          	beqz	a5,800015f0 <_ZN9Scheduler3putEP3TCB+0x6c>
			tail->next = elem;
    800015bc:	00a7b423          	sd	a0,8(a5)
			tail = elem;
    800015c0:	00003797          	auipc	a5,0x3
    800015c4:	40a7b423          	sd	a0,1032(a5) # 800049c8 <_ZN9Scheduler12readyThreadsE+0x8>
		} else {
			head = tail = elem;
		}
		numOfElements++;
    800015c8:	00003717          	auipc	a4,0x3
    800015cc:	3f870713          	addi	a4,a4,1016 # 800049c0 <_ZN9Scheduler12readyThreadsE>
    800015d0:	01073783          	ld	a5,16(a4)
    800015d4:	00178793          	addi	a5,a5,1
    800015d8:	00f73823          	sd	a5,16(a4)
}
    800015dc:	01813083          	ld	ra,24(sp)
    800015e0:	01013403          	ld	s0,16(sp)
    800015e4:	00813483          	ld	s1,8(sp)
    800015e8:	02010113          	addi	sp,sp,32
    800015ec:	00008067          	ret
			head = tail = elem;
    800015f0:	00003797          	auipc	a5,0x3
    800015f4:	3d078793          	addi	a5,a5,976 # 800049c0 <_ZN9Scheduler12readyThreadsE>
    800015f8:	00a7b423          	sd	a0,8(a5)
    800015fc:	00a7b023          	sd	a0,0(a5)
    80001600:	fc9ff06f          	j	800015c8 <_ZN9Scheduler3putEP3TCB+0x44>

0000000080001604 <_ZN9Scheduler3getEv>:
TCB* Scheduler::get() {
    80001604:	fe010113          	addi	sp,sp,-32
    80001608:	00113c23          	sd	ra,24(sp)
    8000160c:	00813823          	sd	s0,16(sp)
    80001610:	00913423          	sd	s1,8(sp)
    80001614:	02010413          	addi	s0,sp,32
	}

	T* removeFirst() {
		if (!head) { return nullptr; }
    80001618:	00003517          	auipc	a0,0x3
    8000161c:	3a853503          	ld	a0,936(a0) # 800049c0 <_ZN9Scheduler12readyThreadsE>
    80001620:	04050c63          	beqz	a0,80001678 <_ZN9Scheduler3getEv+0x74>

		Elem* elem = head;
		head = head->next;
    80001624:	00853783          	ld	a5,8(a0)
    80001628:	00003717          	auipc	a4,0x3
    8000162c:	38f73c23          	sd	a5,920(a4) # 800049c0 <_ZN9Scheduler12readyThreadsE>
		if (!head) { tail = nullptr; }
    80001630:	02078e63          	beqz	a5,8000166c <_ZN9Scheduler3getEv+0x68>

		T* ret = elem->data;
    80001634:	00053483          	ld	s1,0(a0)
		delete elem;
    80001638:	00000097          	auipc	ra,0x0
    8000163c:	0cc080e7          	jalr	204(ra) # 80001704 <_ZdlPv>
		numOfElements--;
    80001640:	00003717          	auipc	a4,0x3
    80001644:	38070713          	addi	a4,a4,896 # 800049c0 <_ZN9Scheduler12readyThreadsE>
    80001648:	01073783          	ld	a5,16(a4)
    8000164c:	fff78793          	addi	a5,a5,-1
    80001650:	00f73823          	sd	a5,16(a4)
}
    80001654:	00048513          	mv	a0,s1
    80001658:	01813083          	ld	ra,24(sp)
    8000165c:	01013403          	ld	s0,16(sp)
    80001660:	00813483          	ld	s1,8(sp)
    80001664:	02010113          	addi	sp,sp,32
    80001668:	00008067          	ret
		if (!head) { tail = nullptr; }
    8000166c:	00003797          	auipc	a5,0x3
    80001670:	3407be23          	sd	zero,860(a5) # 800049c8 <_ZN9Scheduler12readyThreadsE+0x8>
    80001674:	fc1ff06f          	j	80001634 <_ZN9Scheduler3getEv+0x30>
		if (!head) { return nullptr; }
    80001678:	00050493          	mv	s1,a0
	return readyThreads.removeFirst();
    8000167c:	fd9ff06f          	j	80001654 <_ZN9Scheduler3getEv+0x50>

0000000080001680 <_GLOBAL__sub_I__ZN9Scheduler12readyThreadsE>:
}
    80001680:	ff010113          	addi	sp,sp,-16
    80001684:	00113423          	sd	ra,8(sp)
    80001688:	00813023          	sd	s0,0(sp)
    8000168c:	01010413          	addi	s0,sp,16
    80001690:	000105b7          	lui	a1,0x10
    80001694:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80001698:	00100513          	li	a0,1
    8000169c:	00000097          	auipc	ra,0x0
    800016a0:	ea4080e7          	jalr	-348(ra) # 80001540 <_Z41__static_initialization_and_destruction_0ii>
    800016a4:	00813083          	ld	ra,8(sp)
    800016a8:	00013403          	ld	s0,0(sp)
    800016ac:	01010113          	addi	sp,sp,16
    800016b0:	00008067          	ret

00000000800016b4 <_Znwm>:
//#include "../h/MemoryAllocator.hpp"

extern "C" void interruptHandler();

//override globalnog new
void* operator new(size_t size) {
    800016b4:	ff010113          	addi	sp,sp,-16
    800016b8:	00113423          	sd	ra,8(sp)
    800016bc:	00813023          	sd	s0,0(sp)
    800016c0:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    800016c4:	00000097          	auipc	ra,0x0
    800016c8:	b70080e7          	jalr	-1168(ra) # 80001234 <_Z9mem_allocm>
}
    800016cc:	00813083          	ld	ra,8(sp)
    800016d0:	00013403          	ld	s0,0(sp)
    800016d4:	01010113          	addi	sp,sp,16
    800016d8:	00008067          	ret

00000000800016dc <_Znam>:

void* operator new[](size_t size) {
    800016dc:	ff010113          	addi	sp,sp,-16
    800016e0:	00113423          	sd	ra,8(sp)
    800016e4:	00813023          	sd	s0,0(sp)
    800016e8:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    800016ec:	00000097          	auipc	ra,0x0
    800016f0:	b48080e7          	jalr	-1208(ra) # 80001234 <_Z9mem_allocm>
}
    800016f4:	00813083          	ld	ra,8(sp)
    800016f8:	00013403          	ld	s0,0(sp)
    800016fc:	01010113          	addi	sp,sp,16
    80001700:	00008067          	ret

0000000080001704 <_ZdlPv>:

void operator delete(void* ptr)noexcept {
    80001704:	ff010113          	addi	sp,sp,-16
    80001708:	00113423          	sd	ra,8(sp)
    8000170c:	00813023          	sd	s0,0(sp)
    80001710:	01010413          	addi	s0,sp,16
mem_free(ptr);
    80001714:	00000097          	auipc	ra,0x0
    80001718:	b60080e7          	jalr	-1184(ra) # 80001274 <_Z8mem_freePv>
}
    8000171c:	00813083          	ld	ra,8(sp)
    80001720:	00013403          	ld	s0,0(sp)
    80001724:	01010113          	addi	sp,sp,16
    80001728:	00008067          	ret

000000008000172c <_ZdaPv>:

void operator delete[](void* ptr)noexcept {
    8000172c:	ff010113          	addi	sp,sp,-16
    80001730:	00113423          	sd	ra,8(sp)
    80001734:	00813023          	sd	s0,0(sp)
    80001738:	01010413          	addi	s0,sp,16
mem_free(ptr);
    8000173c:	00000097          	auipc	ra,0x0
    80001740:	b38080e7          	jalr	-1224(ra) # 80001274 <_Z8mem_freePv>
}
    80001744:	00813083          	ld	ra,8(sp)
    80001748:	00013403          	ld	s0,0(sp)
    8000174c:	01010113          	addi	sp,sp,16
    80001750:	00008067          	ret

0000000080001754 <main>:
//void dispatch() {
//	__asm__ volatile ("mv %[savedPC], ra":[savedPC] "=r"(temp));
//	__asm__ volatile("mv ra, %[fAddress]": : [fAddress] "r"(&f));
//}

int main() {
    80001754:	fe010113          	addi	sp,sp,-32
    80001758:	00113c23          	sd	ra,24(sp)
    8000175c:	00813823          	sd	s0,16(sp)
    80001760:	00913423          	sd	s1,8(sp)
    80001764:	02010413          	addi	s0,sp,32
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80001768:	00200793          	li	a5,2
    8000176c:	1007b073          	csrc	sstatus,a5
	//zabrani prekide
	Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
	//postavi adresu prekidne rutine u stvec
	Riscv::w_stvec((uint64)&interruptHandler);
    80001770:	00003797          	auipc	a5,0x3
    80001774:	1f87b783          	ld	a5,504(a5) # 80004968 <_GLOBAL_OFFSET_TABLE_+0x20>
	__asm__ volatile("csrw stvec, %[stvec]": :[stvec] "r"(stvec));
    80001778:	10579073          	csrw	stvec,a5
	//omoguci prekide
	//Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
	uint64 i = 0;
    8000177c:	00000493          	li	s1,0
    80001780:	0080006f          	j	80001788 <main+0x34>
	for (; i < 10000; i++) {
    80001784:	00148493          	addi	s1,s1,1
    80001788:	000027b7          	lui	a5,0x2
    8000178c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80001790:	0297ea63          	bltu	a5,s1,800017c4 <main+0x70>
		void* ptr = mem_alloc(0xffff);
    80001794:	00010537          	lui	a0,0x10
    80001798:	fff50513          	addi	a0,a0,-1 # ffff <_entry-0x7fff0001>
    8000179c:	00000097          	auipc	ra,0x0
    800017a0:	a98080e7          	jalr	-1384(ra) # 80001234 <_Z9mem_allocm>
		if (ptr == nullptr) break;
    800017a4:	02050063          	beqz	a0,800017c4 <main+0x70>
		if (mem_free(ptr) == -1) {
    800017a8:	00000097          	auipc	ra,0x0
    800017ac:	acc080e7          	jalr	-1332(ra) # 80001274 <_Z8mem_freePv>
    800017b0:	fff00793          	li	a5,-1
    800017b4:	fcf518e3          	bne	a0,a5,80001784 <main+0x30>
			i = 11111111;
    800017b8:	00a994b7          	lui	s1,0xa99
    800017bc:	ac748493          	addi	s1,s1,-1337 # a98ac7 <_entry-0x7f567539>
    800017c0:	fc5ff06f          	j	80001784 <main+0x30>
		}
	}
	printInteger(i);
    800017c4:	00048513          	mv	a0,s1
    800017c8:	00000097          	auipc	ra,0x0
    800017cc:	cc4080e7          	jalr	-828(ra) # 8000148c <_Z12printIntegerm>

    //maskiraj prekide
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    */
	return 0;
    800017d0:	00000513          	li	a0,0
    800017d4:	01813083          	ld	ra,24(sp)
    800017d8:	01013403          	ld	s0,16(sp)
    800017dc:	00813483          	ld	s1,8(sp)
    800017e0:	02010113          	addi	sp,sp,32
    800017e4:	00008067          	ret

00000000800017e8 <interruptRoutine>:
#include "../h/MemoryAllocator.hpp"
#include "../h/helper.hpp"
#include "../h/Riscv.hpp"
#include "../h/syscall_c.hpp"

extern "C" void interruptRoutine() {
    800017e8:	fd010113          	addi	sp,sp,-48
    800017ec:	02113423          	sd	ra,40(sp)
    800017f0:	02813023          	sd	s0,32(sp)
    800017f4:	00913c23          	sd	s1,24(sp)
    800017f8:	03010413          	addi	s0,sp,48
	__asm__ volatile("csrr %[scause], scause": [scause] "=r"(scause));
    800017fc:	142027f3          	csrr	a5,scause
    80001800:	fcf43c23          	sd	a5,-40(s0)
	return scause;
    80001804:	fd843703          	ld	a4,-40(s0)
	__asm__ volatile("csrr %[sepc], sepc": [sepc] "=r"(sepc));
    80001808:	141027f3          	csrr	a5,sepc
    8000180c:	fcf43823          	sd	a5,-48(s0)
	return sepc;
    80001810:	fd043483          	ld	s1,-48(s0)
	uint64 scause = Riscv::r_scause();
	uint64 sepc = Riscv::r_sepc();

	if (scause == 0x09 || scause == 0x08) {
    80001814:	ff870693          	addi	a3,a4,-8
    80001818:	00100793          	li	a5,1
    8000181c:	02d7f863          	bgeu	a5,a3,8000184c <interruptRoutine+0x64>
				println("Nepostojeci op code");
				break;
		}
		//sepc pokazuje na ecall instrukciju, treba preci na sledecu instrukciju
		Riscv::w_sepc(sepc + 4);
	} else if (scause == (1UL << 63 | 9)) {
    80001820:	fff00793          	li	a5,-1
    80001824:	03f79793          	slli	a5,a5,0x3f
    80001828:	00978793          	addi	a5,a5,9
    8000182c:	08f70c63          	beq	a4,a5,800018c4 <interruptRoutine+0xdc>
		//spoljasnji hardverski prekid
		console_handler();
	} else if (scause == (1UL << 63 | 1)) {
    80001830:	fff00793          	li	a5,-1
    80001834:	03f79793          	slli	a5,a5,0x3f
    80001838:	00178793          	addi	a5,a5,1
    8000183c:	08f71a63          	bne	a4,a5,800018d0 <interruptRoutine+0xe8>
	__asm__ volatile("csrc sip, %[mask]": :[mask] "r"(mask));
    80001840:	00200793          	li	a5,2
    80001844:	1447b073          	csrc	sip,a5
}
    80001848:	0440006f          	j	8000188c <interruptRoutine+0xa4>
		__asm__ volatile("mv %[op], a0":[op] "=r"(opCode));
    8000184c:	00050793          	mv	a5,a0
		switch (opCode) {
    80001850:	04200713          	li	a4,66
    80001854:	04f76e63          	bltu	a4,a5,800018b0 <interruptRoutine+0xc8>
    80001858:	00279793          	slli	a5,a5,0x2
    8000185c:	00003717          	auipc	a4,0x3
    80001860:	80870713          	addi	a4,a4,-2040 # 80004064 <_ZZ12printIntegermE6digits+0x44>
    80001864:	00e787b3          	add	a5,a5,a4
    80001868:	0007a783          	lw	a5,0(a5)
    8000186c:	00e787b3          	add	a5,a5,a4
    80001870:	00078067          	jr	a5
				__asm__ volatile("mv %[size], a1":[size] "=r"(size));
    80001874:	00058513          	mv	a0,a1
				MemoryAllocator::kmalloc(size);
    80001878:	00651513          	slli	a0,a0,0x6
    8000187c:	00000097          	auipc	ra,0x0
    80001880:	1e4080e7          	jalr	484(ra) # 80001a60 <_ZN15MemoryAllocator7kmallocEm>
		Riscv::w_sepc(sepc + 4);
    80001884:	00448493          	addi	s1,s1,4
	__asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    80001888:	14149073          	csrw	sepc,s1
		//prekid od tajmera
		Riscv::mc_sip(Riscv::SIP_SSIP);
	} else {
		println("Greska u prekidnoj rutini");
	}
}
    8000188c:	02813083          	ld	ra,40(sp)
    80001890:	02013403          	ld	s0,32(sp)
    80001894:	01813483          	ld	s1,24(sp)
    80001898:	03010113          	addi	sp,sp,48
    8000189c:	00008067          	ret
				__asm__ volatile("mv %[ptr], a1" :[ptr]"=r"(ptr));
    800018a0:	00058513          	mv	a0,a1
				MemoryAllocator::kfree(ptr);
    800018a4:	00000097          	auipc	ra,0x0
    800018a8:	364080e7          	jalr	868(ra) # 80001c08 <_ZN15MemoryAllocator5kfreeEPv>
				break;
    800018ac:	fd9ff06f          	j	80001884 <interruptRoutine+0x9c>
				println("Nepostojeci op code");
    800018b0:	00002517          	auipc	a0,0x2
    800018b4:	78050513          	addi	a0,a0,1920 # 80004030 <_ZZ12printIntegermE6digits+0x10>
    800018b8:	00000097          	auipc	ra,0x0
    800018bc:	b7c080e7          	jalr	-1156(ra) # 80001434 <_Z7printlnPKc>
				break;
    800018c0:	fc5ff06f          	j	80001884 <interruptRoutine+0x9c>
		console_handler();
    800018c4:	00002097          	auipc	ra,0x2
    800018c8:	59c080e7          	jalr	1436(ra) # 80003e60 <console_handler>
    800018cc:	fc1ff06f          	j	8000188c <interruptRoutine+0xa4>
		println("Greska u prekidnoj rutini");
    800018d0:	00002517          	auipc	a0,0x2
    800018d4:	77850513          	addi	a0,a0,1912 # 80004048 <_ZZ12printIntegermE6digits+0x28>
    800018d8:	00000097          	auipc	ra,0x0
    800018dc:	b5c080e7          	jalr	-1188(ra) # 80001434 <_Z7printlnPKc>
}
    800018e0:	fadff06f          	j	8000188c <interruptRoutine+0xa4>

00000000800018e4 <_ZN3TCB15functionWrapperEPv>:
	Riscv::pushRegisters();
	TCB::dispatch();
	Riscv::popRegisters();
}

void TCB::functionWrapper(void*) {
    800018e4:	ff010113          	addi	sp,sp,-16
    800018e8:	00813423          	sd	s0,8(sp)
    800018ec:	01010413          	addi	s0,sp,16

}
    800018f0:	00813403          	ld	s0,8(sp)
    800018f4:	01010113          	addi	sp,sp,16
    800018f8:	00008067          	ret

00000000800018fc <_ZN3TCB12createThreadEPFvPvES0_Pm>:
TCB* TCB::createThread(TCB::Body function, void* args, uint64* stack) {
    800018fc:	fd010113          	addi	sp,sp,-48
    80001900:	02113423          	sd	ra,40(sp)
    80001904:	02813023          	sd	s0,32(sp)
    80001908:	00913c23          	sd	s1,24(sp)
    8000190c:	01213823          	sd	s2,16(sp)
    80001910:	01313423          	sd	s3,8(sp)
    80001914:	01413023          	sd	s4,0(sp)
    80001918:	03010413          	addi	s0,sp,48
    8000191c:	00050a13          	mv	s4,a0
    80001920:	00058993          	mv	s3,a1
    80001924:	00060913          	mv	s2,a2
	return new TCB(function, args, stack);
    80001928:	03800513          	li	a0,56
    8000192c:	00000097          	auipc	ra,0x0
    80001930:	d88080e7          	jalr	-632(ra) # 800016b4 <_Znwm>
    80001934:	00050493          	mv	s1,a0
	static TCB* running;
	static uint64 runningTimeSlice;

private:
	TCB(Body function, void* args, uint64* stack) {
		this->threadFunction = function;
    80001938:	01453823          	sd	s4,16(a0)
		this->args = args;
    8000193c:	03353023          	sd	s3,32(a0)
		this->stack = stack;
    80001940:	01253c23          	sd	s2,24(a0)
		this->timeSlice = DEFAULT_TIME_SLICE;
    80001944:	00200793          	li	a5,2
    80001948:	02f53423          	sd	a5,40(a0)
		this->finished = false;
    8000194c:	02050823          	sb	zero,48(a0)
		this->blocked = false;
    80001950:	020508a3          	sb	zero,49(a0)
		this->context.ra = (uint64)&functionWrapper;
    80001954:	00000797          	auipc	a5,0x0
    80001958:	f9078793          	addi	a5,a5,-112 # 800018e4 <_ZN3TCB15functionWrapperEPv>
    8000195c:	00f53423          	sd	a5,8(a0)
		this->context.sp = (uint64)&stack[DEFAULT_STACK_SIZE];
    80001960:	00008637          	lui	a2,0x8
    80001964:	00c90933          	add	s2,s2,a2
    80001968:	01253023          	sd	s2,0(a0)

		Scheduler::put(this);
    8000196c:	00000097          	auipc	ra,0x0
    80001970:	c18080e7          	jalr	-1000(ra) # 80001584 <_ZN9Scheduler3putEP3TCB>
    80001974:	0200006f          	j	80001994 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x98>
    80001978:	00050913          	mv	s2,a0
    8000197c:	00048513          	mv	a0,s1
    80001980:	00000097          	auipc	ra,0x0
    80001984:	d84080e7          	jalr	-636(ra) # 80001704 <_ZdlPv>
    80001988:	00090513          	mv	a0,s2
    8000198c:	00004097          	auipc	ra,0x4
    80001990:	13c080e7          	jalr	316(ra) # 80005ac8 <_Unwind_Resume>
}
    80001994:	00048513          	mv	a0,s1
    80001998:	02813083          	ld	ra,40(sp)
    8000199c:	02013403          	ld	s0,32(sp)
    800019a0:	01813483          	ld	s1,24(sp)
    800019a4:	01013903          	ld	s2,16(sp)
    800019a8:	00813983          	ld	s3,8(sp)
    800019ac:	00013a03          	ld	s4,0(sp)
    800019b0:	03010113          	addi	sp,sp,48
    800019b4:	00008067          	ret

00000000800019b8 <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    800019b8:	fe010113          	addi	sp,sp,-32
    800019bc:	00113c23          	sd	ra,24(sp)
    800019c0:	00813823          	sd	s0,16(sp)
    800019c4:	00913423          	sd	s1,8(sp)
    800019c8:	02010413          	addi	s0,sp,32
	TCB* old = TCB::running;
    800019cc:	00003497          	auipc	s1,0x3
    800019d0:	00c4b483          	ld	s1,12(s1) # 800049d8 <_ZN3TCB7runningE>
	bool isFinished() { return finished; }
    800019d4:	0304c783          	lbu	a5,48(s1)
	if (!old->isFinished() && !old->isBlocked()) {
    800019d8:	00079663          	bnez	a5,800019e4 <_ZN3TCB8dispatchEv+0x2c>
	bool isBlocked() { return blocked; }
    800019dc:	0314c783          	lbu	a5,49(s1)
    800019e0:	02078c63          	beqz	a5,80001a18 <_ZN3TCB8dispatchEv+0x60>
	TCB::running = Scheduler::get();
    800019e4:	00000097          	auipc	ra,0x0
    800019e8:	c20080e7          	jalr	-992(ra) # 80001604 <_ZN9Scheduler3getEv>
    800019ec:	00050593          	mv	a1,a0
    800019f0:	00003797          	auipc	a5,0x3
    800019f4:	fea7b423          	sd	a0,-24(a5) # 800049d8 <_ZN3TCB7runningE>
	TCB::contextSwitch(&old->context, &running->context);
    800019f8:	00048513          	mv	a0,s1
    800019fc:	00000097          	auipc	ra,0x0
    80001a00:	824080e7          	jalr	-2012(ra) # 80001220 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80001a04:	01813083          	ld	ra,24(sp)
    80001a08:	01013403          	ld	s0,16(sp)
    80001a0c:	00813483          	ld	s1,8(sp)
    80001a10:	02010113          	addi	sp,sp,32
    80001a14:	00008067          	ret
		Scheduler::put(old);
    80001a18:	00048513          	mv	a0,s1
    80001a1c:	00000097          	auipc	ra,0x0
    80001a20:	b68080e7          	jalr	-1176(ra) # 80001584 <_ZN9Scheduler3putEP3TCB>
    80001a24:	fc1ff06f          	j	800019e4 <_ZN3TCB8dispatchEv+0x2c>

0000000080001a28 <_ZN3TCB5yieldEv>:
void TCB::yield() {
    80001a28:	ff010113          	addi	sp,sp,-16
    80001a2c:	00113423          	sd	ra,8(sp)
    80001a30:	00813023          	sd	s0,0(sp)
    80001a34:	01010413          	addi	s0,sp,16
	Riscv::pushRegisters();
    80001a38:	fffff097          	auipc	ra,0xfffff
    80001a3c:	5c8080e7          	jalr	1480(ra) # 80001000 <_ZN5Riscv13pushRegistersEv>
	TCB::dispatch();
    80001a40:	00000097          	auipc	ra,0x0
    80001a44:	f78080e7          	jalr	-136(ra) # 800019b8 <_ZN3TCB8dispatchEv>
	Riscv::popRegisters();
    80001a48:	fffff097          	auipc	ra,0xfffff
    80001a4c:	634080e7          	jalr	1588(ra) # 8000107c <_ZN5Riscv12popRegistersEv>
}
    80001a50:	00813083          	ld	ra,8(sp)
    80001a54:	00013403          	ld	s0,0(sp)
    80001a58:	01010113          	addi	sp,sp,16
    80001a5c:	00008067          	ret

0000000080001a60 <_ZN15MemoryAllocator7kmallocEm>:

bool MemoryAllocator::initialized = false;
MemoryAllocator::FreeMemSegment* MemoryAllocator::freeMemHead = nullptr;
MemoryAllocator::UsedMemSegment* MemoryAllocator::usedMemHead = nullptr;

void* MemoryAllocator::kmalloc(size_t size) {
    80001a60:	ff010113          	addi	sp,sp,-16
    80001a64:	00813423          	sd	s0,8(sp)
    80001a68:	01010413          	addi	s0,sp,16
	if (size <= 0) return nullptr;
    80001a6c:	12050663          	beqz	a0,80001b98 <_ZN15MemoryAllocator7kmallocEm+0x138>

	//pocetna inicijalizacija
	if (!initialized) {
    80001a70:	00003797          	auipc	a5,0x3
    80001a74:	f787c783          	lbu	a5,-136(a5) # 800049e8 <_ZN15MemoryAllocator11initializedE>
    80001a78:	04079663          	bnez	a5,80001ac4 <_ZN15MemoryAllocator7kmallocEm+0x64>
		freeMemHead = (FreeMemSegment*)HEAP_START_ADDR;
    80001a7c:	00003617          	auipc	a2,0x3
    80001a80:	ed463603          	ld	a2,-300(a2) # 80004950 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001a84:	00063703          	ld	a4,0(a2)
    80001a88:	00003797          	auipc	a5,0x3
    80001a8c:	f6078793          	addi	a5,a5,-160 # 800049e8 <_ZN15MemoryAllocator11initializedE>
    80001a90:	00e7b423          	sd	a4,8(a5)
		freeMemHead->next = nullptr;
    80001a94:	00073023          	sd	zero,0(a4)
		freeMemHead->prev = nullptr;
    80001a98:	0087b683          	ld	a3,8(a5)
    80001a9c:	0006b423          	sd	zero,8(a3)
		freeMemHead->size = (char*)HEAP_END_ADDR - (char*)HEAP_START_ADDR;
    80001aa0:	00003717          	auipc	a4,0x3
    80001aa4:	ec073703          	ld	a4,-320(a4) # 80004960 <_GLOBAL_OFFSET_TABLE_+0x18>
    80001aa8:	00073703          	ld	a4,0(a4)
    80001aac:	00063603          	ld	a2,0(a2)
    80001ab0:	40c70733          	sub	a4,a4,a2
    80001ab4:	00e6b823          	sd	a4,16(a3)
		usedMemHead = nullptr;
    80001ab8:	0007b823          	sd	zero,16(a5)

		initialized = true;
    80001abc:	00100713          	li	a4,1
    80001ac0:	00e78023          	sb	a4,0(a5)
	}

	//alokacija uvek zaokruzena na blokove
	size += sizeof(UsedMemSegment);
    80001ac4:	01050513          	addi	a0,a0,16
	size_t blocks = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
    80001ac8:	00655713          	srli	a4,a0,0x6
    80001acc:	03f57793          	andi	a5,a0,63
    80001ad0:	00078463          	beqz	a5,80001ad8 <_ZN15MemoryAllocator7kmallocEm+0x78>
    80001ad4:	00100793          	li	a5,1
    80001ad8:	00f707b3          	add	a5,a4,a5
	size = blocks * MEM_BLOCK_SIZE;
    80001adc:	00679793          	slli	a5,a5,0x6

	//trazenje slobodnog segmenta po first-fit algoritmu
	for (FreeMemSegment* current = freeMemHead; current; current = current->next) {
    80001ae0:	00003517          	auipc	a0,0x3
    80001ae4:	f1053503          	ld	a0,-240(a0) # 800049f0 <_ZN15MemoryAllocator11freeMemHeadE>
    80001ae8:	08050a63          	beqz	a0,80001b7c <_ZN15MemoryAllocator7kmallocEm+0x11c>
		if (current->size < size) continue;
    80001aec:	01053703          	ld	a4,16(a0)
    80001af0:	06f76263          	bltu	a4,a5,80001b54 <_ZN15MemoryAllocator7kmallocEm+0xf4>

		//pravljenje novog slobodnog fragmenta od ostatka fragmenta
		FreeMemSegment* remainderFree = (FreeMemSegment*)((char*)current + size);
    80001af4:	00f506b3          	add	a3,a0,a5
		remainderFree->size = current->size - size;
    80001af8:	40f70733          	sub	a4,a4,a5
    80001afc:	00e6b823          	sd	a4,16(a3)
		remainderFree->prev = current->prev;
    80001b00:	00853703          	ld	a4,8(a0)
    80001b04:	00e6b423          	sd	a4,8(a3)
		if (current->prev) current->prev->next = remainderFree;
    80001b08:	00070463          	beqz	a4,80001b10 <_ZN15MemoryAllocator7kmallocEm+0xb0>
    80001b0c:	00d73023          	sd	a3,0(a4)
		remainderFree->next = current->next;
    80001b10:	00053703          	ld	a4,0(a0)
    80001b14:	00e6b023          	sd	a4,0(a3)
		if (current->next) current->next->prev = remainderFree;
    80001b18:	00070463          	beqz	a4,80001b20 <_ZN15MemoryAllocator7kmallocEm+0xc0>
    80001b1c:	00d73423          	sd	a3,8(a4)
		if (freeMemHead == current) freeMemHead = remainderFree;
    80001b20:	00003717          	auipc	a4,0x3
    80001b24:	ed073703          	ld	a4,-304(a4) # 800049f0 <_ZN15MemoryAllocator11freeMemHeadE>
    80001b28:	02a70a63          	beq	a4,a0,80001b5c <_ZN15MemoryAllocator7kmallocEm+0xfc>

		//ubacivanje novog fragmenta u listu zauzetih fragmenata
		UsedMemSegment* newFragment = (UsedMemSegment*)current;
		newFragment->size = size;
    80001b2c:	00f53423          	sd	a5,8(a0)
		UsedMemSegment* prevUsed = nullptr;
		for (UsedMemSegment* cur = usedMemHead; cur && cur < newFragment; prevUsed = cur, cur = cur->next);
    80001b30:	00003697          	auipc	a3,0x3
    80001b34:	ec86b683          	ld	a3,-312(a3) # 800049f8 <_ZN15MemoryAllocator11usedMemHeadE>
    80001b38:	00068793          	mv	a5,a3
		UsedMemSegment* prevUsed = nullptr;
    80001b3c:	00000713          	li	a4,0
		for (UsedMemSegment* cur = usedMemHead; cur && cur < newFragment; prevUsed = cur, cur = cur->next);
    80001b40:	02078463          	beqz	a5,80001b68 <_ZN15MemoryAllocator7kmallocEm+0x108>
    80001b44:	02a7f263          	bgeu	a5,a0,80001b68 <_ZN15MemoryAllocator7kmallocEm+0x108>
    80001b48:	00078713          	mv	a4,a5
    80001b4c:	0007b783          	ld	a5,0(a5)
    80001b50:	ff1ff06f          	j	80001b40 <_ZN15MemoryAllocator7kmallocEm+0xe0>
	for (FreeMemSegment* current = freeMemHead; current; current = current->next) {
    80001b54:	00053503          	ld	a0,0(a0)
    80001b58:	f91ff06f          	j	80001ae8 <_ZN15MemoryAllocator7kmallocEm+0x88>
		if (freeMemHead == current) freeMemHead = remainderFree;
    80001b5c:	00003717          	auipc	a4,0x3
    80001b60:	e8d73a23          	sd	a3,-364(a4) # 800049f0 <_ZN15MemoryAllocator11freeMemHeadE>
    80001b64:	fc9ff06f          	j	80001b2c <_ZN15MemoryAllocator7kmallocEm+0xcc>
		if (!prevUsed) {
    80001b68:	02070063          	beqz	a4,80001b88 <_ZN15MemoryAllocator7kmallocEm+0x128>
			newFragment->next = usedMemHead;
			usedMemHead = newFragment;
		} else {
			newFragment->next = prevUsed->next;
    80001b6c:	00073783          	ld	a5,0(a4)
    80001b70:	00f53023          	sd	a5,0(a0)
			prevUsed->next = newFragment;
    80001b74:	00a73023          	sd	a0,0(a4)
		}
		return (char*)newFragment + sizeof(UsedMemSegment);
    80001b78:	01050513          	addi	a0,a0,16
	}
	return nullptr;
}
    80001b7c:	00813403          	ld	s0,8(sp)
    80001b80:	01010113          	addi	sp,sp,16
    80001b84:	00008067          	ret
			newFragment->next = usedMemHead;
    80001b88:	00d53023          	sd	a3,0(a0)
			usedMemHead = newFragment;
    80001b8c:	00003797          	auipc	a5,0x3
    80001b90:	e6a7b623          	sd	a0,-404(a5) # 800049f8 <_ZN15MemoryAllocator11usedMemHeadE>
    80001b94:	fe5ff06f          	j	80001b78 <_ZN15MemoryAllocator7kmallocEm+0x118>
	if (size <= 0) return nullptr;
    80001b98:	00000513          	li	a0,0
    80001b9c:	fe1ff06f          	j	80001b7c <_ZN15MemoryAllocator7kmallocEm+0x11c>

0000000080001ba0 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>:
	tryToJoin(newFree);
	tryToJoin(prevFree);
	return 0;
}

int MemoryAllocator::tryToJoin(MemoryAllocator::FreeMemSegment* current) {
    80001ba0:	ff010113          	addi	sp,sp,-16
    80001ba4:	00813423          	sd	s0,8(sp)
    80001ba8:	01010413          	addi	s0,sp,16
	if (!current) return 0;
    80001bac:	04050663          	beqz	a0,80001bf8 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x58>
	if (current->next && (char*)current + current->size == (char*)(current->next)) {
    80001bb0:	00053783          	ld	a5,0(a0)
    80001bb4:	04078663          	beqz	a5,80001c00 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x60>
    80001bb8:	01053703          	ld	a4,16(a0)
    80001bbc:	00e506b3          	add	a3,a0,a4
    80001bc0:	00d78a63          	beq	a5,a3,80001bd4 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x34>
		current->size += current->next->size;
		current->next = current->next->next;
		if (current->next) current->next->prev = current;
		return 1;
	} else return 0;
    80001bc4:	00000513          	li	a0,0
}
    80001bc8:	00813403          	ld	s0,8(sp)
    80001bcc:	01010113          	addi	sp,sp,16
    80001bd0:	00008067          	ret
		current->size += current->next->size;
    80001bd4:	0107b683          	ld	a3,16(a5)
    80001bd8:	00d70733          	add	a4,a4,a3
    80001bdc:	00e53823          	sd	a4,16(a0)
		current->next = current->next->next;
    80001be0:	0007b783          	ld	a5,0(a5)
    80001be4:	00f53023          	sd	a5,0(a0)
		if (current->next) current->next->prev = current;
    80001be8:	00078463          	beqz	a5,80001bf0 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x50>
    80001bec:	00a7b423          	sd	a0,8(a5)
		return 1;
    80001bf0:	00100513          	li	a0,1
    80001bf4:	fd5ff06f          	j	80001bc8 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>
	if (!current) return 0;
    80001bf8:	00000513          	li	a0,0
    80001bfc:	fcdff06f          	j	80001bc8 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>
	} else return 0;
    80001c00:	00000513          	li	a0,0
    80001c04:	fc5ff06f          	j	80001bc8 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>

0000000080001c08 <_ZN15MemoryAllocator5kfreeEPv>:
	if (!ptr) return 0;
    80001c08:	10050463          	beqz	a0,80001d10 <_ZN15MemoryAllocator5kfreeEPv+0x108>
    80001c0c:	00050693          	mv	a3,a0
	if (!usedMemHead) return -1;
    80001c10:	00003797          	auipc	a5,0x3
    80001c14:	de87b783          	ld	a5,-536(a5) # 800049f8 <_ZN15MemoryAllocator11usedMemHeadE>
    80001c18:	10078063          	beqz	a5,80001d18 <_ZN15MemoryAllocator5kfreeEPv+0x110>
	ptr = (char*)ptr - sizeof(UsedMemSegment);
    80001c1c:	ff050513          	addi	a0,a0,-16
	UsedMemSegment* prevUsed = nullptr;
    80001c20:	00000713          	li	a4,0
	for (; currentUsed && currentUsed != ptr; prevUsed = currentUsed, currentUsed = currentUsed->next);
    80001c24:	00078a63          	beqz	a5,80001c38 <_ZN15MemoryAllocator5kfreeEPv+0x30>
    80001c28:	00a78863          	beq	a5,a0,80001c38 <_ZN15MemoryAllocator5kfreeEPv+0x30>
    80001c2c:	00078713          	mv	a4,a5
    80001c30:	0007b783          	ld	a5,0(a5)
    80001c34:	ff1ff06f          	j	80001c24 <_ZN15MemoryAllocator5kfreeEPv+0x1c>
	if (currentUsed != ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    80001c38:	0ea79463          	bne	a5,a0,80001d20 <_ZN15MemoryAllocator5kfreeEPv+0x118>
int MemoryAllocator::kfree(void* ptr) {
    80001c3c:	fe010113          	addi	sp,sp,-32
    80001c40:	00113c23          	sd	ra,24(sp)
    80001c44:	00813823          	sd	s0,16(sp)
    80001c48:	00913423          	sd	s1,8(sp)
    80001c4c:	02010413          	addi	s0,sp,32
	if (prevUsed) prevUsed->next = currentUsed->next;
    80001c50:	02070863          	beqz	a4,80001c80 <_ZN15MemoryAllocator5kfreeEPv+0x78>
    80001c54:	0007b783          	ld	a5,0(a5)
    80001c58:	00f73023          	sd	a5,0(a4)
	if (!freeMemHead || ptr < (char*)freeMemHead) {
    80001c5c:	00003797          	auipc	a5,0x3
    80001c60:	d947b783          	ld	a5,-620(a5) # 800049f0 <_ZN15MemoryAllocator11freeMemHeadE>
    80001c64:	02078663          	beqz	a5,80001c90 <_ZN15MemoryAllocator5kfreeEPv+0x88>
    80001c68:	02f56863          	bltu	a0,a5,80001c98 <_ZN15MemoryAllocator5kfreeEPv+0x90>
			 prevFree->next != nullptr && ptr > (char*)(prevFree->next); prevFree = prevFree->next);
    80001c6c:	00078493          	mv	s1,a5
    80001c70:	0007b783          	ld	a5,0(a5)
    80001c74:	02078463          	beqz	a5,80001c9c <_ZN15MemoryAllocator5kfreeEPv+0x94>
    80001c78:	fea7eae3          	bltu	a5,a0,80001c6c <_ZN15MemoryAllocator5kfreeEPv+0x64>
    80001c7c:	0200006f          	j	80001c9c <_ZN15MemoryAllocator5kfreeEPv+0x94>
	else usedMemHead = currentUsed->next;
    80001c80:	0007b783          	ld	a5,0(a5)
    80001c84:	00003717          	auipc	a4,0x3
    80001c88:	d6f73a23          	sd	a5,-652(a4) # 800049f8 <_ZN15MemoryAllocator11usedMemHeadE>
    80001c8c:	fd1ff06f          	j	80001c5c <_ZN15MemoryAllocator5kfreeEPv+0x54>
		prevFree = nullptr;
    80001c90:	00078493          	mv	s1,a5
    80001c94:	0080006f          	j	80001c9c <_ZN15MemoryAllocator5kfreeEPv+0x94>
    80001c98:	00000493          	li	s1,0
	size_t segmentSize = ((UsedMemSegment*)ptr)->size;
    80001c9c:	ff86b783          	ld	a5,-8(a3)
	newFree->size = segmentSize;
    80001ca0:	00f6b023          	sd	a5,0(a3)
	newFree->prev = prevFree;
    80001ca4:	fe96bc23          	sd	s1,-8(a3)
	if (prevFree) newFree->next = prevFree->next;
    80001ca8:	04048663          	beqz	s1,80001cf4 <_ZN15MemoryAllocator5kfreeEPv+0xec>
    80001cac:	0004b783          	ld	a5,0(s1)
    80001cb0:	fef6b823          	sd	a5,-16(a3)
	if (newFree->next) newFree->next->prev = newFree;
    80001cb4:	ff06b783          	ld	a5,-16(a3)
    80001cb8:	00078463          	beqz	a5,80001cc0 <_ZN15MemoryAllocator5kfreeEPv+0xb8>
    80001cbc:	00a7b423          	sd	a0,8(a5)
	if (prevFree) prevFree->next = newFree;
    80001cc0:	04048263          	beqz	s1,80001d04 <_ZN15MemoryAllocator5kfreeEPv+0xfc>
    80001cc4:	00a4b023          	sd	a0,0(s1)
	tryToJoin(newFree);
    80001cc8:	00000097          	auipc	ra,0x0
    80001ccc:	ed8080e7          	jalr	-296(ra) # 80001ba0 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
	tryToJoin(prevFree);
    80001cd0:	00048513          	mv	a0,s1
    80001cd4:	00000097          	auipc	ra,0x0
    80001cd8:	ecc080e7          	jalr	-308(ra) # 80001ba0 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
	return 0;
    80001cdc:	00000513          	li	a0,0
}
    80001ce0:	01813083          	ld	ra,24(sp)
    80001ce4:	01013403          	ld	s0,16(sp)
    80001ce8:	00813483          	ld	s1,8(sp)
    80001cec:	02010113          	addi	sp,sp,32
    80001cf0:	00008067          	ret
	else newFree->next = freeMemHead;
    80001cf4:	00003797          	auipc	a5,0x3
    80001cf8:	cfc7b783          	ld	a5,-772(a5) # 800049f0 <_ZN15MemoryAllocator11freeMemHeadE>
    80001cfc:	fef6b823          	sd	a5,-16(a3)
    80001d00:	fb5ff06f          	j	80001cb4 <_ZN15MemoryAllocator5kfreeEPv+0xac>
	else freeMemHead = newFree;
    80001d04:	00003797          	auipc	a5,0x3
    80001d08:	cea7b623          	sd	a0,-788(a5) # 800049f0 <_ZN15MemoryAllocator11freeMemHeadE>
    80001d0c:	fbdff06f          	j	80001cc8 <_ZN15MemoryAllocator5kfreeEPv+0xc0>
	if (!ptr) return 0;
    80001d10:	00000513          	li	a0,0
    80001d14:	00008067          	ret
	if (!usedMemHead) return -1;
    80001d18:	fff00513          	li	a0,-1
    80001d1c:	00008067          	ret
	if (currentUsed != ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    80001d20:	fff00513          	li	a0,-1
}
    80001d24:	00008067          	ret

0000000080001d28 <start>:
    80001d28:	ff010113          	addi	sp,sp,-16
    80001d2c:	00813423          	sd	s0,8(sp)
    80001d30:	01010413          	addi	s0,sp,16
    80001d34:	300027f3          	csrr	a5,mstatus
    80001d38:	ffffe737          	lui	a4,0xffffe
    80001d3c:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff8b9f>
    80001d40:	00e7f7b3          	and	a5,a5,a4
    80001d44:	00001737          	lui	a4,0x1
    80001d48:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80001d4c:	00e7e7b3          	or	a5,a5,a4
    80001d50:	30079073          	csrw	mstatus,a5
    80001d54:	00000797          	auipc	a5,0x0
    80001d58:	16078793          	addi	a5,a5,352 # 80001eb4 <system_main>
    80001d5c:	34179073          	csrw	mepc,a5
    80001d60:	00000793          	li	a5,0
    80001d64:	18079073          	csrw	satp,a5
    80001d68:	000107b7          	lui	a5,0x10
    80001d6c:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80001d70:	30279073          	csrw	medeleg,a5
    80001d74:	30379073          	csrw	mideleg,a5
    80001d78:	104027f3          	csrr	a5,sie
    80001d7c:	2227e793          	ori	a5,a5,546
    80001d80:	10479073          	csrw	sie,a5
    80001d84:	fff00793          	li	a5,-1
    80001d88:	00a7d793          	srli	a5,a5,0xa
    80001d8c:	3b079073          	csrw	pmpaddr0,a5
    80001d90:	00f00793          	li	a5,15
    80001d94:	3a079073          	csrw	pmpcfg0,a5
    80001d98:	f14027f3          	csrr	a5,mhartid
    80001d9c:	0200c737          	lui	a4,0x200c
    80001da0:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80001da4:	0007869b          	sext.w	a3,a5
    80001da8:	00269713          	slli	a4,a3,0x2
    80001dac:	000f4637          	lui	a2,0xf4
    80001db0:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80001db4:	00d70733          	add	a4,a4,a3
    80001db8:	0037979b          	slliw	a5,a5,0x3
    80001dbc:	020046b7          	lui	a3,0x2004
    80001dc0:	00d787b3          	add	a5,a5,a3
    80001dc4:	00c585b3          	add	a1,a1,a2
    80001dc8:	00371693          	slli	a3,a4,0x3
    80001dcc:	00003717          	auipc	a4,0x3
    80001dd0:	c3470713          	addi	a4,a4,-972 # 80004a00 <timer_scratch>
    80001dd4:	00b7b023          	sd	a1,0(a5)
    80001dd8:	00d70733          	add	a4,a4,a3
    80001ddc:	00f73c23          	sd	a5,24(a4)
    80001de0:	02c73023          	sd	a2,32(a4)
    80001de4:	34071073          	csrw	mscratch,a4
    80001de8:	00000797          	auipc	a5,0x0
    80001dec:	6e878793          	addi	a5,a5,1768 # 800024d0 <timervec>
    80001df0:	30579073          	csrw	mtvec,a5
    80001df4:	300027f3          	csrr	a5,mstatus
    80001df8:	0087e793          	ori	a5,a5,8
    80001dfc:	30079073          	csrw	mstatus,a5
    80001e00:	304027f3          	csrr	a5,mie
    80001e04:	0807e793          	ori	a5,a5,128
    80001e08:	30479073          	csrw	mie,a5
    80001e0c:	f14027f3          	csrr	a5,mhartid
    80001e10:	0007879b          	sext.w	a5,a5
    80001e14:	00078213          	mv	tp,a5
    80001e18:	30200073          	mret
    80001e1c:	00813403          	ld	s0,8(sp)
    80001e20:	01010113          	addi	sp,sp,16
    80001e24:	00008067          	ret

0000000080001e28 <timerinit>:
    80001e28:	ff010113          	addi	sp,sp,-16
    80001e2c:	00813423          	sd	s0,8(sp)
    80001e30:	01010413          	addi	s0,sp,16
    80001e34:	f14027f3          	csrr	a5,mhartid
    80001e38:	0200c737          	lui	a4,0x200c
    80001e3c:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80001e40:	0007869b          	sext.w	a3,a5
    80001e44:	00269713          	slli	a4,a3,0x2
    80001e48:	000f4637          	lui	a2,0xf4
    80001e4c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80001e50:	00d70733          	add	a4,a4,a3
    80001e54:	0037979b          	slliw	a5,a5,0x3
    80001e58:	020046b7          	lui	a3,0x2004
    80001e5c:	00d787b3          	add	a5,a5,a3
    80001e60:	00c585b3          	add	a1,a1,a2
    80001e64:	00371693          	slli	a3,a4,0x3
    80001e68:	00003717          	auipc	a4,0x3
    80001e6c:	b9870713          	addi	a4,a4,-1128 # 80004a00 <timer_scratch>
    80001e70:	00b7b023          	sd	a1,0(a5)
    80001e74:	00d70733          	add	a4,a4,a3
    80001e78:	00f73c23          	sd	a5,24(a4)
    80001e7c:	02c73023          	sd	a2,32(a4)
    80001e80:	34071073          	csrw	mscratch,a4
    80001e84:	00000797          	auipc	a5,0x0
    80001e88:	64c78793          	addi	a5,a5,1612 # 800024d0 <timervec>
    80001e8c:	30579073          	csrw	mtvec,a5
    80001e90:	300027f3          	csrr	a5,mstatus
    80001e94:	0087e793          	ori	a5,a5,8
    80001e98:	30079073          	csrw	mstatus,a5
    80001e9c:	304027f3          	csrr	a5,mie
    80001ea0:	0807e793          	ori	a5,a5,128
    80001ea4:	30479073          	csrw	mie,a5
    80001ea8:	00813403          	ld	s0,8(sp)
    80001eac:	01010113          	addi	sp,sp,16
    80001eb0:	00008067          	ret

0000000080001eb4 <system_main>:
    80001eb4:	fe010113          	addi	sp,sp,-32
    80001eb8:	00813823          	sd	s0,16(sp)
    80001ebc:	00913423          	sd	s1,8(sp)
    80001ec0:	00113c23          	sd	ra,24(sp)
    80001ec4:	02010413          	addi	s0,sp,32
    80001ec8:	00000097          	auipc	ra,0x0
    80001ecc:	0c4080e7          	jalr	196(ra) # 80001f8c <cpuid>
    80001ed0:	00003497          	auipc	s1,0x3
    80001ed4:	ac048493          	addi	s1,s1,-1344 # 80004990 <started>
    80001ed8:	02050263          	beqz	a0,80001efc <system_main+0x48>
    80001edc:	0004a783          	lw	a5,0(s1)
    80001ee0:	0007879b          	sext.w	a5,a5
    80001ee4:	fe078ce3          	beqz	a5,80001edc <system_main+0x28>
    80001ee8:	0ff0000f          	fence
    80001eec:	00002517          	auipc	a0,0x2
    80001ef0:	2b450513          	addi	a0,a0,692 # 800041a0 <_ZZ12printIntegermE6digits+0x180>
    80001ef4:	00001097          	auipc	ra,0x1
    80001ef8:	a78080e7          	jalr	-1416(ra) # 8000296c <panic>
    80001efc:	00001097          	auipc	ra,0x1
    80001f00:	9cc080e7          	jalr	-1588(ra) # 800028c8 <consoleinit>
    80001f04:	00001097          	auipc	ra,0x1
    80001f08:	158080e7          	jalr	344(ra) # 8000305c <printfinit>
    80001f0c:	00002517          	auipc	a0,0x2
    80001f10:	37450513          	addi	a0,a0,884 # 80004280 <_ZZ12printIntegermE6digits+0x260>
    80001f14:	00001097          	auipc	ra,0x1
    80001f18:	ab4080e7          	jalr	-1356(ra) # 800029c8 <__printf>
    80001f1c:	00002517          	auipc	a0,0x2
    80001f20:	25450513          	addi	a0,a0,596 # 80004170 <_ZZ12printIntegermE6digits+0x150>
    80001f24:	00001097          	auipc	ra,0x1
    80001f28:	aa4080e7          	jalr	-1372(ra) # 800029c8 <__printf>
    80001f2c:	00002517          	auipc	a0,0x2
    80001f30:	35450513          	addi	a0,a0,852 # 80004280 <_ZZ12printIntegermE6digits+0x260>
    80001f34:	00001097          	auipc	ra,0x1
    80001f38:	a94080e7          	jalr	-1388(ra) # 800029c8 <__printf>
    80001f3c:	00001097          	auipc	ra,0x1
    80001f40:	4ac080e7          	jalr	1196(ra) # 800033e8 <kinit>
    80001f44:	00000097          	auipc	ra,0x0
    80001f48:	148080e7          	jalr	328(ra) # 8000208c <trapinit>
    80001f4c:	00000097          	auipc	ra,0x0
    80001f50:	16c080e7          	jalr	364(ra) # 800020b8 <trapinithart>
    80001f54:	00000097          	auipc	ra,0x0
    80001f58:	5bc080e7          	jalr	1468(ra) # 80002510 <plicinit>
    80001f5c:	00000097          	auipc	ra,0x0
    80001f60:	5dc080e7          	jalr	1500(ra) # 80002538 <plicinithart>
    80001f64:	00000097          	auipc	ra,0x0
    80001f68:	078080e7          	jalr	120(ra) # 80001fdc <userinit>
    80001f6c:	0ff0000f          	fence
    80001f70:	00100793          	li	a5,1
    80001f74:	00002517          	auipc	a0,0x2
    80001f78:	21450513          	addi	a0,a0,532 # 80004188 <_ZZ12printIntegermE6digits+0x168>
    80001f7c:	00f4a023          	sw	a5,0(s1)
    80001f80:	00001097          	auipc	ra,0x1
    80001f84:	a48080e7          	jalr	-1464(ra) # 800029c8 <__printf>
    80001f88:	0000006f          	j	80001f88 <system_main+0xd4>

0000000080001f8c <cpuid>:
    80001f8c:	ff010113          	addi	sp,sp,-16
    80001f90:	00813423          	sd	s0,8(sp)
    80001f94:	01010413          	addi	s0,sp,16
    80001f98:	00020513          	mv	a0,tp
    80001f9c:	00813403          	ld	s0,8(sp)
    80001fa0:	0005051b          	sext.w	a0,a0
    80001fa4:	01010113          	addi	sp,sp,16
    80001fa8:	00008067          	ret

0000000080001fac <mycpu>:
    80001fac:	ff010113          	addi	sp,sp,-16
    80001fb0:	00813423          	sd	s0,8(sp)
    80001fb4:	01010413          	addi	s0,sp,16
    80001fb8:	00020793          	mv	a5,tp
    80001fbc:	00813403          	ld	s0,8(sp)
    80001fc0:	0007879b          	sext.w	a5,a5
    80001fc4:	00779793          	slli	a5,a5,0x7
    80001fc8:	00004517          	auipc	a0,0x4
    80001fcc:	a6850513          	addi	a0,a0,-1432 # 80005a30 <cpus>
    80001fd0:	00f50533          	add	a0,a0,a5
    80001fd4:	01010113          	addi	sp,sp,16
    80001fd8:	00008067          	ret

0000000080001fdc <userinit>:
    80001fdc:	ff010113          	addi	sp,sp,-16
    80001fe0:	00813423          	sd	s0,8(sp)
    80001fe4:	01010413          	addi	s0,sp,16
    80001fe8:	00813403          	ld	s0,8(sp)
    80001fec:	01010113          	addi	sp,sp,16
    80001ff0:	fffff317          	auipc	t1,0xfffff
    80001ff4:	76430067          	jr	1892(t1) # 80001754 <main>

0000000080001ff8 <either_copyout>:
    80001ff8:	ff010113          	addi	sp,sp,-16
    80001ffc:	00813023          	sd	s0,0(sp)
    80002000:	00113423          	sd	ra,8(sp)
    80002004:	01010413          	addi	s0,sp,16
    80002008:	02051663          	bnez	a0,80002034 <either_copyout+0x3c>
    8000200c:	00058513          	mv	a0,a1
    80002010:	00060593          	mv	a1,a2
    80002014:	0006861b          	sext.w	a2,a3
    80002018:	00002097          	auipc	ra,0x2
    8000201c:	c5c080e7          	jalr	-932(ra) # 80003c74 <__memmove>
    80002020:	00813083          	ld	ra,8(sp)
    80002024:	00013403          	ld	s0,0(sp)
    80002028:	00000513          	li	a0,0
    8000202c:	01010113          	addi	sp,sp,16
    80002030:	00008067          	ret
    80002034:	00002517          	auipc	a0,0x2
    80002038:	19450513          	addi	a0,a0,404 # 800041c8 <_ZZ12printIntegermE6digits+0x1a8>
    8000203c:	00001097          	auipc	ra,0x1
    80002040:	930080e7          	jalr	-1744(ra) # 8000296c <panic>

0000000080002044 <either_copyin>:
    80002044:	ff010113          	addi	sp,sp,-16
    80002048:	00813023          	sd	s0,0(sp)
    8000204c:	00113423          	sd	ra,8(sp)
    80002050:	01010413          	addi	s0,sp,16
    80002054:	02059463          	bnez	a1,8000207c <either_copyin+0x38>
    80002058:	00060593          	mv	a1,a2
    8000205c:	0006861b          	sext.w	a2,a3
    80002060:	00002097          	auipc	ra,0x2
    80002064:	c14080e7          	jalr	-1004(ra) # 80003c74 <__memmove>
    80002068:	00813083          	ld	ra,8(sp)
    8000206c:	00013403          	ld	s0,0(sp)
    80002070:	00000513          	li	a0,0
    80002074:	01010113          	addi	sp,sp,16
    80002078:	00008067          	ret
    8000207c:	00002517          	auipc	a0,0x2
    80002080:	17450513          	addi	a0,a0,372 # 800041f0 <_ZZ12printIntegermE6digits+0x1d0>
    80002084:	00001097          	auipc	ra,0x1
    80002088:	8e8080e7          	jalr	-1816(ra) # 8000296c <panic>

000000008000208c <trapinit>:
    8000208c:	ff010113          	addi	sp,sp,-16
    80002090:	00813423          	sd	s0,8(sp)
    80002094:	01010413          	addi	s0,sp,16
    80002098:	00813403          	ld	s0,8(sp)
    8000209c:	00002597          	auipc	a1,0x2
    800020a0:	17c58593          	addi	a1,a1,380 # 80004218 <_ZZ12printIntegermE6digits+0x1f8>
    800020a4:	00004517          	auipc	a0,0x4
    800020a8:	a0c50513          	addi	a0,a0,-1524 # 80005ab0 <tickslock>
    800020ac:	01010113          	addi	sp,sp,16
    800020b0:	00001317          	auipc	t1,0x1
    800020b4:	5c830067          	jr	1480(t1) # 80003678 <initlock>

00000000800020b8 <trapinithart>:
    800020b8:	ff010113          	addi	sp,sp,-16
    800020bc:	00813423          	sd	s0,8(sp)
    800020c0:	01010413          	addi	s0,sp,16
    800020c4:	00000797          	auipc	a5,0x0
    800020c8:	2fc78793          	addi	a5,a5,764 # 800023c0 <kernelvec>
    800020cc:	10579073          	csrw	stvec,a5
    800020d0:	00813403          	ld	s0,8(sp)
    800020d4:	01010113          	addi	sp,sp,16
    800020d8:	00008067          	ret

00000000800020dc <usertrap>:
    800020dc:	ff010113          	addi	sp,sp,-16
    800020e0:	00813423          	sd	s0,8(sp)
    800020e4:	01010413          	addi	s0,sp,16
    800020e8:	00813403          	ld	s0,8(sp)
    800020ec:	01010113          	addi	sp,sp,16
    800020f0:	00008067          	ret

00000000800020f4 <usertrapret>:
    800020f4:	ff010113          	addi	sp,sp,-16
    800020f8:	00813423          	sd	s0,8(sp)
    800020fc:	01010413          	addi	s0,sp,16
    80002100:	00813403          	ld	s0,8(sp)
    80002104:	01010113          	addi	sp,sp,16
    80002108:	00008067          	ret

000000008000210c <kerneltrap>:
    8000210c:	fe010113          	addi	sp,sp,-32
    80002110:	00813823          	sd	s0,16(sp)
    80002114:	00113c23          	sd	ra,24(sp)
    80002118:	00913423          	sd	s1,8(sp)
    8000211c:	02010413          	addi	s0,sp,32
    80002120:	142025f3          	csrr	a1,scause
    80002124:	100027f3          	csrr	a5,sstatus
    80002128:	0027f793          	andi	a5,a5,2
    8000212c:	10079c63          	bnez	a5,80002244 <kerneltrap+0x138>
    80002130:	142027f3          	csrr	a5,scause
    80002134:	0207ce63          	bltz	a5,80002170 <kerneltrap+0x64>
    80002138:	00002517          	auipc	a0,0x2
    8000213c:	12850513          	addi	a0,a0,296 # 80004260 <_ZZ12printIntegermE6digits+0x240>
    80002140:	00001097          	auipc	ra,0x1
    80002144:	888080e7          	jalr	-1912(ra) # 800029c8 <__printf>
    80002148:	141025f3          	csrr	a1,sepc
    8000214c:	14302673          	csrr	a2,stval
    80002150:	00002517          	auipc	a0,0x2
    80002154:	12050513          	addi	a0,a0,288 # 80004270 <_ZZ12printIntegermE6digits+0x250>
    80002158:	00001097          	auipc	ra,0x1
    8000215c:	870080e7          	jalr	-1936(ra) # 800029c8 <__printf>
    80002160:	00002517          	auipc	a0,0x2
    80002164:	12850513          	addi	a0,a0,296 # 80004288 <_ZZ12printIntegermE6digits+0x268>
    80002168:	00001097          	auipc	ra,0x1
    8000216c:	804080e7          	jalr	-2044(ra) # 8000296c <panic>
    80002170:	0ff7f713          	andi	a4,a5,255
    80002174:	00900693          	li	a3,9
    80002178:	04d70063          	beq	a4,a3,800021b8 <kerneltrap+0xac>
    8000217c:	fff00713          	li	a4,-1
    80002180:	03f71713          	slli	a4,a4,0x3f
    80002184:	00170713          	addi	a4,a4,1
    80002188:	fae798e3          	bne	a5,a4,80002138 <kerneltrap+0x2c>
    8000218c:	00000097          	auipc	ra,0x0
    80002190:	e00080e7          	jalr	-512(ra) # 80001f8c <cpuid>
    80002194:	06050663          	beqz	a0,80002200 <kerneltrap+0xf4>
    80002198:	144027f3          	csrr	a5,sip
    8000219c:	ffd7f793          	andi	a5,a5,-3
    800021a0:	14479073          	csrw	sip,a5
    800021a4:	01813083          	ld	ra,24(sp)
    800021a8:	01013403          	ld	s0,16(sp)
    800021ac:	00813483          	ld	s1,8(sp)
    800021b0:	02010113          	addi	sp,sp,32
    800021b4:	00008067          	ret
    800021b8:	00000097          	auipc	ra,0x0
    800021bc:	3cc080e7          	jalr	972(ra) # 80002584 <plic_claim>
    800021c0:	00a00793          	li	a5,10
    800021c4:	00050493          	mv	s1,a0
    800021c8:	06f50863          	beq	a0,a5,80002238 <kerneltrap+0x12c>
    800021cc:	fc050ce3          	beqz	a0,800021a4 <kerneltrap+0x98>
    800021d0:	00050593          	mv	a1,a0
    800021d4:	00002517          	auipc	a0,0x2
    800021d8:	06c50513          	addi	a0,a0,108 # 80004240 <_ZZ12printIntegermE6digits+0x220>
    800021dc:	00000097          	auipc	ra,0x0
    800021e0:	7ec080e7          	jalr	2028(ra) # 800029c8 <__printf>
    800021e4:	01013403          	ld	s0,16(sp)
    800021e8:	01813083          	ld	ra,24(sp)
    800021ec:	00048513          	mv	a0,s1
    800021f0:	00813483          	ld	s1,8(sp)
    800021f4:	02010113          	addi	sp,sp,32
    800021f8:	00000317          	auipc	t1,0x0
    800021fc:	3c430067          	jr	964(t1) # 800025bc <plic_complete>
    80002200:	00004517          	auipc	a0,0x4
    80002204:	8b050513          	addi	a0,a0,-1872 # 80005ab0 <tickslock>
    80002208:	00001097          	auipc	ra,0x1
    8000220c:	494080e7          	jalr	1172(ra) # 8000369c <acquire>
    80002210:	00002717          	auipc	a4,0x2
    80002214:	78470713          	addi	a4,a4,1924 # 80004994 <ticks>
    80002218:	00072783          	lw	a5,0(a4)
    8000221c:	00004517          	auipc	a0,0x4
    80002220:	89450513          	addi	a0,a0,-1900 # 80005ab0 <tickslock>
    80002224:	0017879b          	addiw	a5,a5,1
    80002228:	00f72023          	sw	a5,0(a4)
    8000222c:	00001097          	auipc	ra,0x1
    80002230:	53c080e7          	jalr	1340(ra) # 80003768 <release>
    80002234:	f65ff06f          	j	80002198 <kerneltrap+0x8c>
    80002238:	00001097          	auipc	ra,0x1
    8000223c:	098080e7          	jalr	152(ra) # 800032d0 <uartintr>
    80002240:	fa5ff06f          	j	800021e4 <kerneltrap+0xd8>
    80002244:	00002517          	auipc	a0,0x2
    80002248:	fdc50513          	addi	a0,a0,-36 # 80004220 <_ZZ12printIntegermE6digits+0x200>
    8000224c:	00000097          	auipc	ra,0x0
    80002250:	720080e7          	jalr	1824(ra) # 8000296c <panic>

0000000080002254 <clockintr>:
    80002254:	fe010113          	addi	sp,sp,-32
    80002258:	00813823          	sd	s0,16(sp)
    8000225c:	00913423          	sd	s1,8(sp)
    80002260:	00113c23          	sd	ra,24(sp)
    80002264:	02010413          	addi	s0,sp,32
    80002268:	00004497          	auipc	s1,0x4
    8000226c:	84848493          	addi	s1,s1,-1976 # 80005ab0 <tickslock>
    80002270:	00048513          	mv	a0,s1
    80002274:	00001097          	auipc	ra,0x1
    80002278:	428080e7          	jalr	1064(ra) # 8000369c <acquire>
    8000227c:	00002717          	auipc	a4,0x2
    80002280:	71870713          	addi	a4,a4,1816 # 80004994 <ticks>
    80002284:	00072783          	lw	a5,0(a4)
    80002288:	01013403          	ld	s0,16(sp)
    8000228c:	01813083          	ld	ra,24(sp)
    80002290:	00048513          	mv	a0,s1
    80002294:	0017879b          	addiw	a5,a5,1
    80002298:	00813483          	ld	s1,8(sp)
    8000229c:	00f72023          	sw	a5,0(a4)
    800022a0:	02010113          	addi	sp,sp,32
    800022a4:	00001317          	auipc	t1,0x1
    800022a8:	4c430067          	jr	1220(t1) # 80003768 <release>

00000000800022ac <devintr>:
    800022ac:	142027f3          	csrr	a5,scause
    800022b0:	00000513          	li	a0,0
    800022b4:	0007c463          	bltz	a5,800022bc <devintr+0x10>
    800022b8:	00008067          	ret
    800022bc:	fe010113          	addi	sp,sp,-32
    800022c0:	00813823          	sd	s0,16(sp)
    800022c4:	00113c23          	sd	ra,24(sp)
    800022c8:	00913423          	sd	s1,8(sp)
    800022cc:	02010413          	addi	s0,sp,32
    800022d0:	0ff7f713          	andi	a4,a5,255
    800022d4:	00900693          	li	a3,9
    800022d8:	04d70c63          	beq	a4,a3,80002330 <devintr+0x84>
    800022dc:	fff00713          	li	a4,-1
    800022e0:	03f71713          	slli	a4,a4,0x3f
    800022e4:	00170713          	addi	a4,a4,1
    800022e8:	00e78c63          	beq	a5,a4,80002300 <devintr+0x54>
    800022ec:	01813083          	ld	ra,24(sp)
    800022f0:	01013403          	ld	s0,16(sp)
    800022f4:	00813483          	ld	s1,8(sp)
    800022f8:	02010113          	addi	sp,sp,32
    800022fc:	00008067          	ret
    80002300:	00000097          	auipc	ra,0x0
    80002304:	c8c080e7          	jalr	-884(ra) # 80001f8c <cpuid>
    80002308:	06050663          	beqz	a0,80002374 <devintr+0xc8>
    8000230c:	144027f3          	csrr	a5,sip
    80002310:	ffd7f793          	andi	a5,a5,-3
    80002314:	14479073          	csrw	sip,a5
    80002318:	01813083          	ld	ra,24(sp)
    8000231c:	01013403          	ld	s0,16(sp)
    80002320:	00813483          	ld	s1,8(sp)
    80002324:	00200513          	li	a0,2
    80002328:	02010113          	addi	sp,sp,32
    8000232c:	00008067          	ret
    80002330:	00000097          	auipc	ra,0x0
    80002334:	254080e7          	jalr	596(ra) # 80002584 <plic_claim>
    80002338:	00a00793          	li	a5,10
    8000233c:	00050493          	mv	s1,a0
    80002340:	06f50663          	beq	a0,a5,800023ac <devintr+0x100>
    80002344:	00100513          	li	a0,1
    80002348:	fa0482e3          	beqz	s1,800022ec <devintr+0x40>
    8000234c:	00048593          	mv	a1,s1
    80002350:	00002517          	auipc	a0,0x2
    80002354:	ef050513          	addi	a0,a0,-272 # 80004240 <_ZZ12printIntegermE6digits+0x220>
    80002358:	00000097          	auipc	ra,0x0
    8000235c:	670080e7          	jalr	1648(ra) # 800029c8 <__printf>
    80002360:	00048513          	mv	a0,s1
    80002364:	00000097          	auipc	ra,0x0
    80002368:	258080e7          	jalr	600(ra) # 800025bc <plic_complete>
    8000236c:	00100513          	li	a0,1
    80002370:	f7dff06f          	j	800022ec <devintr+0x40>
    80002374:	00003517          	auipc	a0,0x3
    80002378:	73c50513          	addi	a0,a0,1852 # 80005ab0 <tickslock>
    8000237c:	00001097          	auipc	ra,0x1
    80002380:	320080e7          	jalr	800(ra) # 8000369c <acquire>
    80002384:	00002717          	auipc	a4,0x2
    80002388:	61070713          	addi	a4,a4,1552 # 80004994 <ticks>
    8000238c:	00072783          	lw	a5,0(a4)
    80002390:	00003517          	auipc	a0,0x3
    80002394:	72050513          	addi	a0,a0,1824 # 80005ab0 <tickslock>
    80002398:	0017879b          	addiw	a5,a5,1
    8000239c:	00f72023          	sw	a5,0(a4)
    800023a0:	00001097          	auipc	ra,0x1
    800023a4:	3c8080e7          	jalr	968(ra) # 80003768 <release>
    800023a8:	f65ff06f          	j	8000230c <devintr+0x60>
    800023ac:	00001097          	auipc	ra,0x1
    800023b0:	f24080e7          	jalr	-220(ra) # 800032d0 <uartintr>
    800023b4:	fadff06f          	j	80002360 <devintr+0xb4>
	...

00000000800023c0 <kernelvec>:
    800023c0:	f0010113          	addi	sp,sp,-256
    800023c4:	00113023          	sd	ra,0(sp)
    800023c8:	00213423          	sd	sp,8(sp)
    800023cc:	00313823          	sd	gp,16(sp)
    800023d0:	00413c23          	sd	tp,24(sp)
    800023d4:	02513023          	sd	t0,32(sp)
    800023d8:	02613423          	sd	t1,40(sp)
    800023dc:	02713823          	sd	t2,48(sp)
    800023e0:	02813c23          	sd	s0,56(sp)
    800023e4:	04913023          	sd	s1,64(sp)
    800023e8:	04a13423          	sd	a0,72(sp)
    800023ec:	04b13823          	sd	a1,80(sp)
    800023f0:	04c13c23          	sd	a2,88(sp)
    800023f4:	06d13023          	sd	a3,96(sp)
    800023f8:	06e13423          	sd	a4,104(sp)
    800023fc:	06f13823          	sd	a5,112(sp)
    80002400:	07013c23          	sd	a6,120(sp)
    80002404:	09113023          	sd	a7,128(sp)
    80002408:	09213423          	sd	s2,136(sp)
    8000240c:	09313823          	sd	s3,144(sp)
    80002410:	09413c23          	sd	s4,152(sp)
    80002414:	0b513023          	sd	s5,160(sp)
    80002418:	0b613423          	sd	s6,168(sp)
    8000241c:	0b713823          	sd	s7,176(sp)
    80002420:	0b813c23          	sd	s8,184(sp)
    80002424:	0d913023          	sd	s9,192(sp)
    80002428:	0da13423          	sd	s10,200(sp)
    8000242c:	0db13823          	sd	s11,208(sp)
    80002430:	0dc13c23          	sd	t3,216(sp)
    80002434:	0fd13023          	sd	t4,224(sp)
    80002438:	0fe13423          	sd	t5,232(sp)
    8000243c:	0ff13823          	sd	t6,240(sp)
    80002440:	ccdff0ef          	jal	ra,8000210c <kerneltrap>
    80002444:	00013083          	ld	ra,0(sp)
    80002448:	00813103          	ld	sp,8(sp)
    8000244c:	01013183          	ld	gp,16(sp)
    80002450:	02013283          	ld	t0,32(sp)
    80002454:	02813303          	ld	t1,40(sp)
    80002458:	03013383          	ld	t2,48(sp)
    8000245c:	03813403          	ld	s0,56(sp)
    80002460:	04013483          	ld	s1,64(sp)
    80002464:	04813503          	ld	a0,72(sp)
    80002468:	05013583          	ld	a1,80(sp)
    8000246c:	05813603          	ld	a2,88(sp)
    80002470:	06013683          	ld	a3,96(sp)
    80002474:	06813703          	ld	a4,104(sp)
    80002478:	07013783          	ld	a5,112(sp)
    8000247c:	07813803          	ld	a6,120(sp)
    80002480:	08013883          	ld	a7,128(sp)
    80002484:	08813903          	ld	s2,136(sp)
    80002488:	09013983          	ld	s3,144(sp)
    8000248c:	09813a03          	ld	s4,152(sp)
    80002490:	0a013a83          	ld	s5,160(sp)
    80002494:	0a813b03          	ld	s6,168(sp)
    80002498:	0b013b83          	ld	s7,176(sp)
    8000249c:	0b813c03          	ld	s8,184(sp)
    800024a0:	0c013c83          	ld	s9,192(sp)
    800024a4:	0c813d03          	ld	s10,200(sp)
    800024a8:	0d013d83          	ld	s11,208(sp)
    800024ac:	0d813e03          	ld	t3,216(sp)
    800024b0:	0e013e83          	ld	t4,224(sp)
    800024b4:	0e813f03          	ld	t5,232(sp)
    800024b8:	0f013f83          	ld	t6,240(sp)
    800024bc:	10010113          	addi	sp,sp,256
    800024c0:	10200073          	sret
    800024c4:	00000013          	nop
    800024c8:	00000013          	nop
    800024cc:	00000013          	nop

00000000800024d0 <timervec>:
    800024d0:	34051573          	csrrw	a0,mscratch,a0
    800024d4:	00b53023          	sd	a1,0(a0)
    800024d8:	00c53423          	sd	a2,8(a0)
    800024dc:	00d53823          	sd	a3,16(a0)
    800024e0:	01853583          	ld	a1,24(a0)
    800024e4:	02053603          	ld	a2,32(a0)
    800024e8:	0005b683          	ld	a3,0(a1)
    800024ec:	00c686b3          	add	a3,a3,a2
    800024f0:	00d5b023          	sd	a3,0(a1)
    800024f4:	00200593          	li	a1,2
    800024f8:	14459073          	csrw	sip,a1
    800024fc:	01053683          	ld	a3,16(a0)
    80002500:	00853603          	ld	a2,8(a0)
    80002504:	00053583          	ld	a1,0(a0)
    80002508:	34051573          	csrrw	a0,mscratch,a0
    8000250c:	30200073          	mret

0000000080002510 <plicinit>:
    80002510:	ff010113          	addi	sp,sp,-16
    80002514:	00813423          	sd	s0,8(sp)
    80002518:	01010413          	addi	s0,sp,16
    8000251c:	00813403          	ld	s0,8(sp)
    80002520:	0c0007b7          	lui	a5,0xc000
    80002524:	00100713          	li	a4,1
    80002528:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000252c:	00e7a223          	sw	a4,4(a5)
    80002530:	01010113          	addi	sp,sp,16
    80002534:	00008067          	ret

0000000080002538 <plicinithart>:
    80002538:	ff010113          	addi	sp,sp,-16
    8000253c:	00813023          	sd	s0,0(sp)
    80002540:	00113423          	sd	ra,8(sp)
    80002544:	01010413          	addi	s0,sp,16
    80002548:	00000097          	auipc	ra,0x0
    8000254c:	a44080e7          	jalr	-1468(ra) # 80001f8c <cpuid>
    80002550:	0085171b          	slliw	a4,a0,0x8
    80002554:	0c0027b7          	lui	a5,0xc002
    80002558:	00e787b3          	add	a5,a5,a4
    8000255c:	40200713          	li	a4,1026
    80002560:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80002564:	00813083          	ld	ra,8(sp)
    80002568:	00013403          	ld	s0,0(sp)
    8000256c:	00d5151b          	slliw	a0,a0,0xd
    80002570:	0c2017b7          	lui	a5,0xc201
    80002574:	00a78533          	add	a0,a5,a0
    80002578:	00052023          	sw	zero,0(a0)
    8000257c:	01010113          	addi	sp,sp,16
    80002580:	00008067          	ret

0000000080002584 <plic_claim>:
    80002584:	ff010113          	addi	sp,sp,-16
    80002588:	00813023          	sd	s0,0(sp)
    8000258c:	00113423          	sd	ra,8(sp)
    80002590:	01010413          	addi	s0,sp,16
    80002594:	00000097          	auipc	ra,0x0
    80002598:	9f8080e7          	jalr	-1544(ra) # 80001f8c <cpuid>
    8000259c:	00813083          	ld	ra,8(sp)
    800025a0:	00013403          	ld	s0,0(sp)
    800025a4:	00d5151b          	slliw	a0,a0,0xd
    800025a8:	0c2017b7          	lui	a5,0xc201
    800025ac:	00a78533          	add	a0,a5,a0
    800025b0:	00452503          	lw	a0,4(a0)
    800025b4:	01010113          	addi	sp,sp,16
    800025b8:	00008067          	ret

00000000800025bc <plic_complete>:
    800025bc:	fe010113          	addi	sp,sp,-32
    800025c0:	00813823          	sd	s0,16(sp)
    800025c4:	00913423          	sd	s1,8(sp)
    800025c8:	00113c23          	sd	ra,24(sp)
    800025cc:	02010413          	addi	s0,sp,32
    800025d0:	00050493          	mv	s1,a0
    800025d4:	00000097          	auipc	ra,0x0
    800025d8:	9b8080e7          	jalr	-1608(ra) # 80001f8c <cpuid>
    800025dc:	01813083          	ld	ra,24(sp)
    800025e0:	01013403          	ld	s0,16(sp)
    800025e4:	00d5179b          	slliw	a5,a0,0xd
    800025e8:	0c201737          	lui	a4,0xc201
    800025ec:	00f707b3          	add	a5,a4,a5
    800025f0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    800025f4:	00813483          	ld	s1,8(sp)
    800025f8:	02010113          	addi	sp,sp,32
    800025fc:	00008067          	ret

0000000080002600 <consolewrite>:
    80002600:	fb010113          	addi	sp,sp,-80
    80002604:	04813023          	sd	s0,64(sp)
    80002608:	04113423          	sd	ra,72(sp)
    8000260c:	02913c23          	sd	s1,56(sp)
    80002610:	03213823          	sd	s2,48(sp)
    80002614:	03313423          	sd	s3,40(sp)
    80002618:	03413023          	sd	s4,32(sp)
    8000261c:	01513c23          	sd	s5,24(sp)
    80002620:	05010413          	addi	s0,sp,80
    80002624:	06c05c63          	blez	a2,8000269c <consolewrite+0x9c>
    80002628:	00060993          	mv	s3,a2
    8000262c:	00050a13          	mv	s4,a0
    80002630:	00058493          	mv	s1,a1
    80002634:	00000913          	li	s2,0
    80002638:	fff00a93          	li	s5,-1
    8000263c:	01c0006f          	j	80002658 <consolewrite+0x58>
    80002640:	fbf44503          	lbu	a0,-65(s0)
    80002644:	0019091b          	addiw	s2,s2,1
    80002648:	00148493          	addi	s1,s1,1
    8000264c:	00001097          	auipc	ra,0x1
    80002650:	a9c080e7          	jalr	-1380(ra) # 800030e8 <uartputc>
    80002654:	03298063          	beq	s3,s2,80002674 <consolewrite+0x74>
    80002658:	00048613          	mv	a2,s1
    8000265c:	00100693          	li	a3,1
    80002660:	000a0593          	mv	a1,s4
    80002664:	fbf40513          	addi	a0,s0,-65
    80002668:	00000097          	auipc	ra,0x0
    8000266c:	9dc080e7          	jalr	-1572(ra) # 80002044 <either_copyin>
    80002670:	fd5518e3          	bne	a0,s5,80002640 <consolewrite+0x40>
    80002674:	04813083          	ld	ra,72(sp)
    80002678:	04013403          	ld	s0,64(sp)
    8000267c:	03813483          	ld	s1,56(sp)
    80002680:	02813983          	ld	s3,40(sp)
    80002684:	02013a03          	ld	s4,32(sp)
    80002688:	01813a83          	ld	s5,24(sp)
    8000268c:	00090513          	mv	a0,s2
    80002690:	03013903          	ld	s2,48(sp)
    80002694:	05010113          	addi	sp,sp,80
    80002698:	00008067          	ret
    8000269c:	00000913          	li	s2,0
    800026a0:	fd5ff06f          	j	80002674 <consolewrite+0x74>

00000000800026a4 <consoleread>:
    800026a4:	f9010113          	addi	sp,sp,-112
    800026a8:	06813023          	sd	s0,96(sp)
    800026ac:	04913c23          	sd	s1,88(sp)
    800026b0:	05213823          	sd	s2,80(sp)
    800026b4:	05313423          	sd	s3,72(sp)
    800026b8:	05413023          	sd	s4,64(sp)
    800026bc:	03513c23          	sd	s5,56(sp)
    800026c0:	03613823          	sd	s6,48(sp)
    800026c4:	03713423          	sd	s7,40(sp)
    800026c8:	03813023          	sd	s8,32(sp)
    800026cc:	06113423          	sd	ra,104(sp)
    800026d0:	01913c23          	sd	s9,24(sp)
    800026d4:	07010413          	addi	s0,sp,112
    800026d8:	00060b93          	mv	s7,a2
    800026dc:	00050913          	mv	s2,a0
    800026e0:	00058c13          	mv	s8,a1
    800026e4:	00060b1b          	sext.w	s6,a2
    800026e8:	00003497          	auipc	s1,0x3
    800026ec:	3f048493          	addi	s1,s1,1008 # 80005ad8 <cons>
    800026f0:	00400993          	li	s3,4
    800026f4:	fff00a13          	li	s4,-1
    800026f8:	00a00a93          	li	s5,10
    800026fc:	05705e63          	blez	s7,80002758 <consoleread+0xb4>
    80002700:	09c4a703          	lw	a4,156(s1)
    80002704:	0984a783          	lw	a5,152(s1)
    80002708:	0007071b          	sext.w	a4,a4
    8000270c:	08e78463          	beq	a5,a4,80002794 <consoleread+0xf0>
    80002710:	07f7f713          	andi	a4,a5,127
    80002714:	00e48733          	add	a4,s1,a4
    80002718:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000271c:	0017869b          	addiw	a3,a5,1
    80002720:	08d4ac23          	sw	a3,152(s1)
    80002724:	00070c9b          	sext.w	s9,a4
    80002728:	0b370663          	beq	a4,s3,800027d4 <consoleread+0x130>
    8000272c:	00100693          	li	a3,1
    80002730:	f9f40613          	addi	a2,s0,-97
    80002734:	000c0593          	mv	a1,s8
    80002738:	00090513          	mv	a0,s2
    8000273c:	f8e40fa3          	sb	a4,-97(s0)
    80002740:	00000097          	auipc	ra,0x0
    80002744:	8b8080e7          	jalr	-1864(ra) # 80001ff8 <either_copyout>
    80002748:	01450863          	beq	a0,s4,80002758 <consoleread+0xb4>
    8000274c:	001c0c13          	addi	s8,s8,1
    80002750:	fffb8b9b          	addiw	s7,s7,-1
    80002754:	fb5c94e3          	bne	s9,s5,800026fc <consoleread+0x58>
    80002758:	000b851b          	sext.w	a0,s7
    8000275c:	06813083          	ld	ra,104(sp)
    80002760:	06013403          	ld	s0,96(sp)
    80002764:	05813483          	ld	s1,88(sp)
    80002768:	05013903          	ld	s2,80(sp)
    8000276c:	04813983          	ld	s3,72(sp)
    80002770:	04013a03          	ld	s4,64(sp)
    80002774:	03813a83          	ld	s5,56(sp)
    80002778:	02813b83          	ld	s7,40(sp)
    8000277c:	02013c03          	ld	s8,32(sp)
    80002780:	01813c83          	ld	s9,24(sp)
    80002784:	40ab053b          	subw	a0,s6,a0
    80002788:	03013b03          	ld	s6,48(sp)
    8000278c:	07010113          	addi	sp,sp,112
    80002790:	00008067          	ret
    80002794:	00001097          	auipc	ra,0x1
    80002798:	1d8080e7          	jalr	472(ra) # 8000396c <push_on>
    8000279c:	0984a703          	lw	a4,152(s1)
    800027a0:	09c4a783          	lw	a5,156(s1)
    800027a4:	0007879b          	sext.w	a5,a5
    800027a8:	fef70ce3          	beq	a4,a5,800027a0 <consoleread+0xfc>
    800027ac:	00001097          	auipc	ra,0x1
    800027b0:	234080e7          	jalr	564(ra) # 800039e0 <pop_on>
    800027b4:	0984a783          	lw	a5,152(s1)
    800027b8:	07f7f713          	andi	a4,a5,127
    800027bc:	00e48733          	add	a4,s1,a4
    800027c0:	01874703          	lbu	a4,24(a4)
    800027c4:	0017869b          	addiw	a3,a5,1
    800027c8:	08d4ac23          	sw	a3,152(s1)
    800027cc:	00070c9b          	sext.w	s9,a4
    800027d0:	f5371ee3          	bne	a4,s3,8000272c <consoleread+0x88>
    800027d4:	000b851b          	sext.w	a0,s7
    800027d8:	f96bf2e3          	bgeu	s7,s6,8000275c <consoleread+0xb8>
    800027dc:	08f4ac23          	sw	a5,152(s1)
    800027e0:	f7dff06f          	j	8000275c <consoleread+0xb8>

00000000800027e4 <consputc>:
    800027e4:	10000793          	li	a5,256
    800027e8:	00f50663          	beq	a0,a5,800027f4 <consputc+0x10>
    800027ec:	00001317          	auipc	t1,0x1
    800027f0:	9f430067          	jr	-1548(t1) # 800031e0 <uartputc_sync>
    800027f4:	ff010113          	addi	sp,sp,-16
    800027f8:	00113423          	sd	ra,8(sp)
    800027fc:	00813023          	sd	s0,0(sp)
    80002800:	01010413          	addi	s0,sp,16
    80002804:	00800513          	li	a0,8
    80002808:	00001097          	auipc	ra,0x1
    8000280c:	9d8080e7          	jalr	-1576(ra) # 800031e0 <uartputc_sync>
    80002810:	02000513          	li	a0,32
    80002814:	00001097          	auipc	ra,0x1
    80002818:	9cc080e7          	jalr	-1588(ra) # 800031e0 <uartputc_sync>
    8000281c:	00013403          	ld	s0,0(sp)
    80002820:	00813083          	ld	ra,8(sp)
    80002824:	00800513          	li	a0,8
    80002828:	01010113          	addi	sp,sp,16
    8000282c:	00001317          	auipc	t1,0x1
    80002830:	9b430067          	jr	-1612(t1) # 800031e0 <uartputc_sync>

0000000080002834 <consoleintr>:
    80002834:	fe010113          	addi	sp,sp,-32
    80002838:	00813823          	sd	s0,16(sp)
    8000283c:	00913423          	sd	s1,8(sp)
    80002840:	01213023          	sd	s2,0(sp)
    80002844:	00113c23          	sd	ra,24(sp)
    80002848:	02010413          	addi	s0,sp,32
    8000284c:	00003917          	auipc	s2,0x3
    80002850:	28c90913          	addi	s2,s2,652 # 80005ad8 <cons>
    80002854:	00050493          	mv	s1,a0
    80002858:	00090513          	mv	a0,s2
    8000285c:	00001097          	auipc	ra,0x1
    80002860:	e40080e7          	jalr	-448(ra) # 8000369c <acquire>
    80002864:	02048c63          	beqz	s1,8000289c <consoleintr+0x68>
    80002868:	0a092783          	lw	a5,160(s2)
    8000286c:	09892703          	lw	a4,152(s2)
    80002870:	07f00693          	li	a3,127
    80002874:	40e7873b          	subw	a4,a5,a4
    80002878:	02e6e263          	bltu	a3,a4,8000289c <consoleintr+0x68>
    8000287c:	00d00713          	li	a4,13
    80002880:	04e48063          	beq	s1,a4,800028c0 <consoleintr+0x8c>
    80002884:	07f7f713          	andi	a4,a5,127
    80002888:	00e90733          	add	a4,s2,a4
    8000288c:	0017879b          	addiw	a5,a5,1
    80002890:	0af92023          	sw	a5,160(s2)
    80002894:	00970c23          	sb	s1,24(a4)
    80002898:	08f92e23          	sw	a5,156(s2)
    8000289c:	01013403          	ld	s0,16(sp)
    800028a0:	01813083          	ld	ra,24(sp)
    800028a4:	00813483          	ld	s1,8(sp)
    800028a8:	00013903          	ld	s2,0(sp)
    800028ac:	00003517          	auipc	a0,0x3
    800028b0:	22c50513          	addi	a0,a0,556 # 80005ad8 <cons>
    800028b4:	02010113          	addi	sp,sp,32
    800028b8:	00001317          	auipc	t1,0x1
    800028bc:	eb030067          	jr	-336(t1) # 80003768 <release>
    800028c0:	00a00493          	li	s1,10
    800028c4:	fc1ff06f          	j	80002884 <consoleintr+0x50>

00000000800028c8 <consoleinit>:
    800028c8:	fe010113          	addi	sp,sp,-32
    800028cc:	00113c23          	sd	ra,24(sp)
    800028d0:	00813823          	sd	s0,16(sp)
    800028d4:	00913423          	sd	s1,8(sp)
    800028d8:	02010413          	addi	s0,sp,32
    800028dc:	00003497          	auipc	s1,0x3
    800028e0:	1fc48493          	addi	s1,s1,508 # 80005ad8 <cons>
    800028e4:	00048513          	mv	a0,s1
    800028e8:	00002597          	auipc	a1,0x2
    800028ec:	9b058593          	addi	a1,a1,-1616 # 80004298 <_ZZ12printIntegermE6digits+0x278>
    800028f0:	00001097          	auipc	ra,0x1
    800028f4:	d88080e7          	jalr	-632(ra) # 80003678 <initlock>
    800028f8:	00000097          	auipc	ra,0x0
    800028fc:	7ac080e7          	jalr	1964(ra) # 800030a4 <uartinit>
    80002900:	01813083          	ld	ra,24(sp)
    80002904:	01013403          	ld	s0,16(sp)
    80002908:	00000797          	auipc	a5,0x0
    8000290c:	d9c78793          	addi	a5,a5,-612 # 800026a4 <consoleread>
    80002910:	0af4bc23          	sd	a5,184(s1)
    80002914:	00000797          	auipc	a5,0x0
    80002918:	cec78793          	addi	a5,a5,-788 # 80002600 <consolewrite>
    8000291c:	0cf4b023          	sd	a5,192(s1)
    80002920:	00813483          	ld	s1,8(sp)
    80002924:	02010113          	addi	sp,sp,32
    80002928:	00008067          	ret

000000008000292c <console_read>:
    8000292c:	ff010113          	addi	sp,sp,-16
    80002930:	00813423          	sd	s0,8(sp)
    80002934:	01010413          	addi	s0,sp,16
    80002938:	00813403          	ld	s0,8(sp)
    8000293c:	00003317          	auipc	t1,0x3
    80002940:	25433303          	ld	t1,596(t1) # 80005b90 <devsw+0x10>
    80002944:	01010113          	addi	sp,sp,16
    80002948:	00030067          	jr	t1

000000008000294c <console_write>:
    8000294c:	ff010113          	addi	sp,sp,-16
    80002950:	00813423          	sd	s0,8(sp)
    80002954:	01010413          	addi	s0,sp,16
    80002958:	00813403          	ld	s0,8(sp)
    8000295c:	00003317          	auipc	t1,0x3
    80002960:	23c33303          	ld	t1,572(t1) # 80005b98 <devsw+0x18>
    80002964:	01010113          	addi	sp,sp,16
    80002968:	00030067          	jr	t1

000000008000296c <panic>:
    8000296c:	fe010113          	addi	sp,sp,-32
    80002970:	00113c23          	sd	ra,24(sp)
    80002974:	00813823          	sd	s0,16(sp)
    80002978:	00913423          	sd	s1,8(sp)
    8000297c:	02010413          	addi	s0,sp,32
    80002980:	00050493          	mv	s1,a0
    80002984:	00002517          	auipc	a0,0x2
    80002988:	91c50513          	addi	a0,a0,-1764 # 800042a0 <_ZZ12printIntegermE6digits+0x280>
    8000298c:	00003797          	auipc	a5,0x3
    80002990:	2a07a623          	sw	zero,684(a5) # 80005c38 <pr+0x18>
    80002994:	00000097          	auipc	ra,0x0
    80002998:	034080e7          	jalr	52(ra) # 800029c8 <__printf>
    8000299c:	00048513          	mv	a0,s1
    800029a0:	00000097          	auipc	ra,0x0
    800029a4:	028080e7          	jalr	40(ra) # 800029c8 <__printf>
    800029a8:	00002517          	auipc	a0,0x2
    800029ac:	8d850513          	addi	a0,a0,-1832 # 80004280 <_ZZ12printIntegermE6digits+0x260>
    800029b0:	00000097          	auipc	ra,0x0
    800029b4:	018080e7          	jalr	24(ra) # 800029c8 <__printf>
    800029b8:	00100793          	li	a5,1
    800029bc:	00002717          	auipc	a4,0x2
    800029c0:	fcf72e23          	sw	a5,-36(a4) # 80004998 <panicked>
    800029c4:	0000006f          	j	800029c4 <panic+0x58>

00000000800029c8 <__printf>:
    800029c8:	f3010113          	addi	sp,sp,-208
    800029cc:	08813023          	sd	s0,128(sp)
    800029d0:	07313423          	sd	s3,104(sp)
    800029d4:	09010413          	addi	s0,sp,144
    800029d8:	05813023          	sd	s8,64(sp)
    800029dc:	08113423          	sd	ra,136(sp)
    800029e0:	06913c23          	sd	s1,120(sp)
    800029e4:	07213823          	sd	s2,112(sp)
    800029e8:	07413023          	sd	s4,96(sp)
    800029ec:	05513c23          	sd	s5,88(sp)
    800029f0:	05613823          	sd	s6,80(sp)
    800029f4:	05713423          	sd	s7,72(sp)
    800029f8:	03913c23          	sd	s9,56(sp)
    800029fc:	03a13823          	sd	s10,48(sp)
    80002a00:	03b13423          	sd	s11,40(sp)
    80002a04:	00003317          	auipc	t1,0x3
    80002a08:	21c30313          	addi	t1,t1,540 # 80005c20 <pr>
    80002a0c:	01832c03          	lw	s8,24(t1)
    80002a10:	00b43423          	sd	a1,8(s0)
    80002a14:	00c43823          	sd	a2,16(s0)
    80002a18:	00d43c23          	sd	a3,24(s0)
    80002a1c:	02e43023          	sd	a4,32(s0)
    80002a20:	02f43423          	sd	a5,40(s0)
    80002a24:	03043823          	sd	a6,48(s0)
    80002a28:	03143c23          	sd	a7,56(s0)
    80002a2c:	00050993          	mv	s3,a0
    80002a30:	4a0c1663          	bnez	s8,80002edc <__printf+0x514>
    80002a34:	60098c63          	beqz	s3,8000304c <__printf+0x684>
    80002a38:	0009c503          	lbu	a0,0(s3)
    80002a3c:	00840793          	addi	a5,s0,8
    80002a40:	f6f43c23          	sd	a5,-136(s0)
    80002a44:	00000493          	li	s1,0
    80002a48:	22050063          	beqz	a0,80002c68 <__printf+0x2a0>
    80002a4c:	00002a37          	lui	s4,0x2
    80002a50:	00018ab7          	lui	s5,0x18
    80002a54:	000f4b37          	lui	s6,0xf4
    80002a58:	00989bb7          	lui	s7,0x989
    80002a5c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80002a60:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80002a64:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80002a68:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80002a6c:	00148c9b          	addiw	s9,s1,1
    80002a70:	02500793          	li	a5,37
    80002a74:	01998933          	add	s2,s3,s9
    80002a78:	38f51263          	bne	a0,a5,80002dfc <__printf+0x434>
    80002a7c:	00094783          	lbu	a5,0(s2)
    80002a80:	00078c9b          	sext.w	s9,a5
    80002a84:	1e078263          	beqz	a5,80002c68 <__printf+0x2a0>
    80002a88:	0024849b          	addiw	s1,s1,2
    80002a8c:	07000713          	li	a4,112
    80002a90:	00998933          	add	s2,s3,s1
    80002a94:	38e78a63          	beq	a5,a4,80002e28 <__printf+0x460>
    80002a98:	20f76863          	bltu	a4,a5,80002ca8 <__printf+0x2e0>
    80002a9c:	42a78863          	beq	a5,a0,80002ecc <__printf+0x504>
    80002aa0:	06400713          	li	a4,100
    80002aa4:	40e79663          	bne	a5,a4,80002eb0 <__printf+0x4e8>
    80002aa8:	f7843783          	ld	a5,-136(s0)
    80002aac:	0007a603          	lw	a2,0(a5)
    80002ab0:	00878793          	addi	a5,a5,8
    80002ab4:	f6f43c23          	sd	a5,-136(s0)
    80002ab8:	42064a63          	bltz	a2,80002eec <__printf+0x524>
    80002abc:	00a00713          	li	a4,10
    80002ac0:	02e677bb          	remuw	a5,a2,a4
    80002ac4:	00002d97          	auipc	s11,0x2
    80002ac8:	804d8d93          	addi	s11,s11,-2044 # 800042c8 <digits>
    80002acc:	00900593          	li	a1,9
    80002ad0:	0006051b          	sext.w	a0,a2
    80002ad4:	00000c93          	li	s9,0
    80002ad8:	02079793          	slli	a5,a5,0x20
    80002adc:	0207d793          	srli	a5,a5,0x20
    80002ae0:	00fd87b3          	add	a5,s11,a5
    80002ae4:	0007c783          	lbu	a5,0(a5)
    80002ae8:	02e656bb          	divuw	a3,a2,a4
    80002aec:	f8f40023          	sb	a5,-128(s0)
    80002af0:	14c5d863          	bge	a1,a2,80002c40 <__printf+0x278>
    80002af4:	06300593          	li	a1,99
    80002af8:	00100c93          	li	s9,1
    80002afc:	02e6f7bb          	remuw	a5,a3,a4
    80002b00:	02079793          	slli	a5,a5,0x20
    80002b04:	0207d793          	srli	a5,a5,0x20
    80002b08:	00fd87b3          	add	a5,s11,a5
    80002b0c:	0007c783          	lbu	a5,0(a5)
    80002b10:	02e6d73b          	divuw	a4,a3,a4
    80002b14:	f8f400a3          	sb	a5,-127(s0)
    80002b18:	12a5f463          	bgeu	a1,a0,80002c40 <__printf+0x278>
    80002b1c:	00a00693          	li	a3,10
    80002b20:	00900593          	li	a1,9
    80002b24:	02d777bb          	remuw	a5,a4,a3
    80002b28:	02079793          	slli	a5,a5,0x20
    80002b2c:	0207d793          	srli	a5,a5,0x20
    80002b30:	00fd87b3          	add	a5,s11,a5
    80002b34:	0007c503          	lbu	a0,0(a5)
    80002b38:	02d757bb          	divuw	a5,a4,a3
    80002b3c:	f8a40123          	sb	a0,-126(s0)
    80002b40:	48e5f263          	bgeu	a1,a4,80002fc4 <__printf+0x5fc>
    80002b44:	06300513          	li	a0,99
    80002b48:	02d7f5bb          	remuw	a1,a5,a3
    80002b4c:	02059593          	slli	a1,a1,0x20
    80002b50:	0205d593          	srli	a1,a1,0x20
    80002b54:	00bd85b3          	add	a1,s11,a1
    80002b58:	0005c583          	lbu	a1,0(a1)
    80002b5c:	02d7d7bb          	divuw	a5,a5,a3
    80002b60:	f8b401a3          	sb	a1,-125(s0)
    80002b64:	48e57263          	bgeu	a0,a4,80002fe8 <__printf+0x620>
    80002b68:	3e700513          	li	a0,999
    80002b6c:	02d7f5bb          	remuw	a1,a5,a3
    80002b70:	02059593          	slli	a1,a1,0x20
    80002b74:	0205d593          	srli	a1,a1,0x20
    80002b78:	00bd85b3          	add	a1,s11,a1
    80002b7c:	0005c583          	lbu	a1,0(a1)
    80002b80:	02d7d7bb          	divuw	a5,a5,a3
    80002b84:	f8b40223          	sb	a1,-124(s0)
    80002b88:	46e57663          	bgeu	a0,a4,80002ff4 <__printf+0x62c>
    80002b8c:	02d7f5bb          	remuw	a1,a5,a3
    80002b90:	02059593          	slli	a1,a1,0x20
    80002b94:	0205d593          	srli	a1,a1,0x20
    80002b98:	00bd85b3          	add	a1,s11,a1
    80002b9c:	0005c583          	lbu	a1,0(a1)
    80002ba0:	02d7d7bb          	divuw	a5,a5,a3
    80002ba4:	f8b402a3          	sb	a1,-123(s0)
    80002ba8:	46ea7863          	bgeu	s4,a4,80003018 <__printf+0x650>
    80002bac:	02d7f5bb          	remuw	a1,a5,a3
    80002bb0:	02059593          	slli	a1,a1,0x20
    80002bb4:	0205d593          	srli	a1,a1,0x20
    80002bb8:	00bd85b3          	add	a1,s11,a1
    80002bbc:	0005c583          	lbu	a1,0(a1)
    80002bc0:	02d7d7bb          	divuw	a5,a5,a3
    80002bc4:	f8b40323          	sb	a1,-122(s0)
    80002bc8:	3eeaf863          	bgeu	s5,a4,80002fb8 <__printf+0x5f0>
    80002bcc:	02d7f5bb          	remuw	a1,a5,a3
    80002bd0:	02059593          	slli	a1,a1,0x20
    80002bd4:	0205d593          	srli	a1,a1,0x20
    80002bd8:	00bd85b3          	add	a1,s11,a1
    80002bdc:	0005c583          	lbu	a1,0(a1)
    80002be0:	02d7d7bb          	divuw	a5,a5,a3
    80002be4:	f8b403a3          	sb	a1,-121(s0)
    80002be8:	42eb7e63          	bgeu	s6,a4,80003024 <__printf+0x65c>
    80002bec:	02d7f5bb          	remuw	a1,a5,a3
    80002bf0:	02059593          	slli	a1,a1,0x20
    80002bf4:	0205d593          	srli	a1,a1,0x20
    80002bf8:	00bd85b3          	add	a1,s11,a1
    80002bfc:	0005c583          	lbu	a1,0(a1)
    80002c00:	02d7d7bb          	divuw	a5,a5,a3
    80002c04:	f8b40423          	sb	a1,-120(s0)
    80002c08:	42ebfc63          	bgeu	s7,a4,80003040 <__printf+0x678>
    80002c0c:	02079793          	slli	a5,a5,0x20
    80002c10:	0207d793          	srli	a5,a5,0x20
    80002c14:	00fd8db3          	add	s11,s11,a5
    80002c18:	000dc703          	lbu	a4,0(s11)
    80002c1c:	00a00793          	li	a5,10
    80002c20:	00900c93          	li	s9,9
    80002c24:	f8e404a3          	sb	a4,-119(s0)
    80002c28:	00065c63          	bgez	a2,80002c40 <__printf+0x278>
    80002c2c:	f9040713          	addi	a4,s0,-112
    80002c30:	00f70733          	add	a4,a4,a5
    80002c34:	02d00693          	li	a3,45
    80002c38:	fed70823          	sb	a3,-16(a4)
    80002c3c:	00078c93          	mv	s9,a5
    80002c40:	f8040793          	addi	a5,s0,-128
    80002c44:	01978cb3          	add	s9,a5,s9
    80002c48:	f7f40d13          	addi	s10,s0,-129
    80002c4c:	000cc503          	lbu	a0,0(s9)
    80002c50:	fffc8c93          	addi	s9,s9,-1
    80002c54:	00000097          	auipc	ra,0x0
    80002c58:	b90080e7          	jalr	-1136(ra) # 800027e4 <consputc>
    80002c5c:	ffac98e3          	bne	s9,s10,80002c4c <__printf+0x284>
    80002c60:	00094503          	lbu	a0,0(s2)
    80002c64:	e00514e3          	bnez	a0,80002a6c <__printf+0xa4>
    80002c68:	1a0c1663          	bnez	s8,80002e14 <__printf+0x44c>
    80002c6c:	08813083          	ld	ra,136(sp)
    80002c70:	08013403          	ld	s0,128(sp)
    80002c74:	07813483          	ld	s1,120(sp)
    80002c78:	07013903          	ld	s2,112(sp)
    80002c7c:	06813983          	ld	s3,104(sp)
    80002c80:	06013a03          	ld	s4,96(sp)
    80002c84:	05813a83          	ld	s5,88(sp)
    80002c88:	05013b03          	ld	s6,80(sp)
    80002c8c:	04813b83          	ld	s7,72(sp)
    80002c90:	04013c03          	ld	s8,64(sp)
    80002c94:	03813c83          	ld	s9,56(sp)
    80002c98:	03013d03          	ld	s10,48(sp)
    80002c9c:	02813d83          	ld	s11,40(sp)
    80002ca0:	0d010113          	addi	sp,sp,208
    80002ca4:	00008067          	ret
    80002ca8:	07300713          	li	a4,115
    80002cac:	1ce78a63          	beq	a5,a4,80002e80 <__printf+0x4b8>
    80002cb0:	07800713          	li	a4,120
    80002cb4:	1ee79e63          	bne	a5,a4,80002eb0 <__printf+0x4e8>
    80002cb8:	f7843783          	ld	a5,-136(s0)
    80002cbc:	0007a703          	lw	a4,0(a5)
    80002cc0:	00878793          	addi	a5,a5,8
    80002cc4:	f6f43c23          	sd	a5,-136(s0)
    80002cc8:	28074263          	bltz	a4,80002f4c <__printf+0x584>
    80002ccc:	00001d97          	auipc	s11,0x1
    80002cd0:	5fcd8d93          	addi	s11,s11,1532 # 800042c8 <digits>
    80002cd4:	00f77793          	andi	a5,a4,15
    80002cd8:	00fd87b3          	add	a5,s11,a5
    80002cdc:	0007c683          	lbu	a3,0(a5)
    80002ce0:	00f00613          	li	a2,15
    80002ce4:	0007079b          	sext.w	a5,a4
    80002ce8:	f8d40023          	sb	a3,-128(s0)
    80002cec:	0047559b          	srliw	a1,a4,0x4
    80002cf0:	0047569b          	srliw	a3,a4,0x4
    80002cf4:	00000c93          	li	s9,0
    80002cf8:	0ee65063          	bge	a2,a4,80002dd8 <__printf+0x410>
    80002cfc:	00f6f693          	andi	a3,a3,15
    80002d00:	00dd86b3          	add	a3,s11,a3
    80002d04:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80002d08:	0087d79b          	srliw	a5,a5,0x8
    80002d0c:	00100c93          	li	s9,1
    80002d10:	f8d400a3          	sb	a3,-127(s0)
    80002d14:	0cb67263          	bgeu	a2,a1,80002dd8 <__printf+0x410>
    80002d18:	00f7f693          	andi	a3,a5,15
    80002d1c:	00dd86b3          	add	a3,s11,a3
    80002d20:	0006c583          	lbu	a1,0(a3)
    80002d24:	00f00613          	li	a2,15
    80002d28:	0047d69b          	srliw	a3,a5,0x4
    80002d2c:	f8b40123          	sb	a1,-126(s0)
    80002d30:	0047d593          	srli	a1,a5,0x4
    80002d34:	28f67e63          	bgeu	a2,a5,80002fd0 <__printf+0x608>
    80002d38:	00f6f693          	andi	a3,a3,15
    80002d3c:	00dd86b3          	add	a3,s11,a3
    80002d40:	0006c503          	lbu	a0,0(a3)
    80002d44:	0087d813          	srli	a6,a5,0x8
    80002d48:	0087d69b          	srliw	a3,a5,0x8
    80002d4c:	f8a401a3          	sb	a0,-125(s0)
    80002d50:	28b67663          	bgeu	a2,a1,80002fdc <__printf+0x614>
    80002d54:	00f6f693          	andi	a3,a3,15
    80002d58:	00dd86b3          	add	a3,s11,a3
    80002d5c:	0006c583          	lbu	a1,0(a3)
    80002d60:	00c7d513          	srli	a0,a5,0xc
    80002d64:	00c7d69b          	srliw	a3,a5,0xc
    80002d68:	f8b40223          	sb	a1,-124(s0)
    80002d6c:	29067a63          	bgeu	a2,a6,80003000 <__printf+0x638>
    80002d70:	00f6f693          	andi	a3,a3,15
    80002d74:	00dd86b3          	add	a3,s11,a3
    80002d78:	0006c583          	lbu	a1,0(a3)
    80002d7c:	0107d813          	srli	a6,a5,0x10
    80002d80:	0107d69b          	srliw	a3,a5,0x10
    80002d84:	f8b402a3          	sb	a1,-123(s0)
    80002d88:	28a67263          	bgeu	a2,a0,8000300c <__printf+0x644>
    80002d8c:	00f6f693          	andi	a3,a3,15
    80002d90:	00dd86b3          	add	a3,s11,a3
    80002d94:	0006c683          	lbu	a3,0(a3)
    80002d98:	0147d79b          	srliw	a5,a5,0x14
    80002d9c:	f8d40323          	sb	a3,-122(s0)
    80002da0:	21067663          	bgeu	a2,a6,80002fac <__printf+0x5e4>
    80002da4:	02079793          	slli	a5,a5,0x20
    80002da8:	0207d793          	srli	a5,a5,0x20
    80002dac:	00fd8db3          	add	s11,s11,a5
    80002db0:	000dc683          	lbu	a3,0(s11)
    80002db4:	00800793          	li	a5,8
    80002db8:	00700c93          	li	s9,7
    80002dbc:	f8d403a3          	sb	a3,-121(s0)
    80002dc0:	00075c63          	bgez	a4,80002dd8 <__printf+0x410>
    80002dc4:	f9040713          	addi	a4,s0,-112
    80002dc8:	00f70733          	add	a4,a4,a5
    80002dcc:	02d00693          	li	a3,45
    80002dd0:	fed70823          	sb	a3,-16(a4)
    80002dd4:	00078c93          	mv	s9,a5
    80002dd8:	f8040793          	addi	a5,s0,-128
    80002ddc:	01978cb3          	add	s9,a5,s9
    80002de0:	f7f40d13          	addi	s10,s0,-129
    80002de4:	000cc503          	lbu	a0,0(s9)
    80002de8:	fffc8c93          	addi	s9,s9,-1
    80002dec:	00000097          	auipc	ra,0x0
    80002df0:	9f8080e7          	jalr	-1544(ra) # 800027e4 <consputc>
    80002df4:	ff9d18e3          	bne	s10,s9,80002de4 <__printf+0x41c>
    80002df8:	0100006f          	j	80002e08 <__printf+0x440>
    80002dfc:	00000097          	auipc	ra,0x0
    80002e00:	9e8080e7          	jalr	-1560(ra) # 800027e4 <consputc>
    80002e04:	000c8493          	mv	s1,s9
    80002e08:	00094503          	lbu	a0,0(s2)
    80002e0c:	c60510e3          	bnez	a0,80002a6c <__printf+0xa4>
    80002e10:	e40c0ee3          	beqz	s8,80002c6c <__printf+0x2a4>
    80002e14:	00003517          	auipc	a0,0x3
    80002e18:	e0c50513          	addi	a0,a0,-500 # 80005c20 <pr>
    80002e1c:	00001097          	auipc	ra,0x1
    80002e20:	94c080e7          	jalr	-1716(ra) # 80003768 <release>
    80002e24:	e49ff06f          	j	80002c6c <__printf+0x2a4>
    80002e28:	f7843783          	ld	a5,-136(s0)
    80002e2c:	03000513          	li	a0,48
    80002e30:	01000d13          	li	s10,16
    80002e34:	00878713          	addi	a4,a5,8
    80002e38:	0007bc83          	ld	s9,0(a5)
    80002e3c:	f6e43c23          	sd	a4,-136(s0)
    80002e40:	00000097          	auipc	ra,0x0
    80002e44:	9a4080e7          	jalr	-1628(ra) # 800027e4 <consputc>
    80002e48:	07800513          	li	a0,120
    80002e4c:	00000097          	auipc	ra,0x0
    80002e50:	998080e7          	jalr	-1640(ra) # 800027e4 <consputc>
    80002e54:	00001d97          	auipc	s11,0x1
    80002e58:	474d8d93          	addi	s11,s11,1140 # 800042c8 <digits>
    80002e5c:	03ccd793          	srli	a5,s9,0x3c
    80002e60:	00fd87b3          	add	a5,s11,a5
    80002e64:	0007c503          	lbu	a0,0(a5)
    80002e68:	fffd0d1b          	addiw	s10,s10,-1
    80002e6c:	004c9c93          	slli	s9,s9,0x4
    80002e70:	00000097          	auipc	ra,0x0
    80002e74:	974080e7          	jalr	-1676(ra) # 800027e4 <consputc>
    80002e78:	fe0d12e3          	bnez	s10,80002e5c <__printf+0x494>
    80002e7c:	f8dff06f          	j	80002e08 <__printf+0x440>
    80002e80:	f7843783          	ld	a5,-136(s0)
    80002e84:	0007bc83          	ld	s9,0(a5)
    80002e88:	00878793          	addi	a5,a5,8
    80002e8c:	f6f43c23          	sd	a5,-136(s0)
    80002e90:	000c9a63          	bnez	s9,80002ea4 <__printf+0x4dc>
    80002e94:	1080006f          	j	80002f9c <__printf+0x5d4>
    80002e98:	001c8c93          	addi	s9,s9,1
    80002e9c:	00000097          	auipc	ra,0x0
    80002ea0:	948080e7          	jalr	-1720(ra) # 800027e4 <consputc>
    80002ea4:	000cc503          	lbu	a0,0(s9)
    80002ea8:	fe0518e3          	bnez	a0,80002e98 <__printf+0x4d0>
    80002eac:	f5dff06f          	j	80002e08 <__printf+0x440>
    80002eb0:	02500513          	li	a0,37
    80002eb4:	00000097          	auipc	ra,0x0
    80002eb8:	930080e7          	jalr	-1744(ra) # 800027e4 <consputc>
    80002ebc:	000c8513          	mv	a0,s9
    80002ec0:	00000097          	auipc	ra,0x0
    80002ec4:	924080e7          	jalr	-1756(ra) # 800027e4 <consputc>
    80002ec8:	f41ff06f          	j	80002e08 <__printf+0x440>
    80002ecc:	02500513          	li	a0,37
    80002ed0:	00000097          	auipc	ra,0x0
    80002ed4:	914080e7          	jalr	-1772(ra) # 800027e4 <consputc>
    80002ed8:	f31ff06f          	j	80002e08 <__printf+0x440>
    80002edc:	00030513          	mv	a0,t1
    80002ee0:	00000097          	auipc	ra,0x0
    80002ee4:	7bc080e7          	jalr	1980(ra) # 8000369c <acquire>
    80002ee8:	b4dff06f          	j	80002a34 <__printf+0x6c>
    80002eec:	40c0053b          	negw	a0,a2
    80002ef0:	00a00713          	li	a4,10
    80002ef4:	02e576bb          	remuw	a3,a0,a4
    80002ef8:	00001d97          	auipc	s11,0x1
    80002efc:	3d0d8d93          	addi	s11,s11,976 # 800042c8 <digits>
    80002f00:	ff700593          	li	a1,-9
    80002f04:	02069693          	slli	a3,a3,0x20
    80002f08:	0206d693          	srli	a3,a3,0x20
    80002f0c:	00dd86b3          	add	a3,s11,a3
    80002f10:	0006c683          	lbu	a3,0(a3)
    80002f14:	02e557bb          	divuw	a5,a0,a4
    80002f18:	f8d40023          	sb	a3,-128(s0)
    80002f1c:	10b65e63          	bge	a2,a1,80003038 <__printf+0x670>
    80002f20:	06300593          	li	a1,99
    80002f24:	02e7f6bb          	remuw	a3,a5,a4
    80002f28:	02069693          	slli	a3,a3,0x20
    80002f2c:	0206d693          	srli	a3,a3,0x20
    80002f30:	00dd86b3          	add	a3,s11,a3
    80002f34:	0006c683          	lbu	a3,0(a3)
    80002f38:	02e7d73b          	divuw	a4,a5,a4
    80002f3c:	00200793          	li	a5,2
    80002f40:	f8d400a3          	sb	a3,-127(s0)
    80002f44:	bca5ece3          	bltu	a1,a0,80002b1c <__printf+0x154>
    80002f48:	ce5ff06f          	j	80002c2c <__printf+0x264>
    80002f4c:	40e007bb          	negw	a5,a4
    80002f50:	00001d97          	auipc	s11,0x1
    80002f54:	378d8d93          	addi	s11,s11,888 # 800042c8 <digits>
    80002f58:	00f7f693          	andi	a3,a5,15
    80002f5c:	00dd86b3          	add	a3,s11,a3
    80002f60:	0006c583          	lbu	a1,0(a3)
    80002f64:	ff100613          	li	a2,-15
    80002f68:	0047d69b          	srliw	a3,a5,0x4
    80002f6c:	f8b40023          	sb	a1,-128(s0)
    80002f70:	0047d59b          	srliw	a1,a5,0x4
    80002f74:	0ac75e63          	bge	a4,a2,80003030 <__printf+0x668>
    80002f78:	00f6f693          	andi	a3,a3,15
    80002f7c:	00dd86b3          	add	a3,s11,a3
    80002f80:	0006c603          	lbu	a2,0(a3)
    80002f84:	00f00693          	li	a3,15
    80002f88:	0087d79b          	srliw	a5,a5,0x8
    80002f8c:	f8c400a3          	sb	a2,-127(s0)
    80002f90:	d8b6e4e3          	bltu	a3,a1,80002d18 <__printf+0x350>
    80002f94:	00200793          	li	a5,2
    80002f98:	e2dff06f          	j	80002dc4 <__printf+0x3fc>
    80002f9c:	00001c97          	auipc	s9,0x1
    80002fa0:	30cc8c93          	addi	s9,s9,780 # 800042a8 <_ZZ12printIntegermE6digits+0x288>
    80002fa4:	02800513          	li	a0,40
    80002fa8:	ef1ff06f          	j	80002e98 <__printf+0x4d0>
    80002fac:	00700793          	li	a5,7
    80002fb0:	00600c93          	li	s9,6
    80002fb4:	e0dff06f          	j	80002dc0 <__printf+0x3f8>
    80002fb8:	00700793          	li	a5,7
    80002fbc:	00600c93          	li	s9,6
    80002fc0:	c69ff06f          	j	80002c28 <__printf+0x260>
    80002fc4:	00300793          	li	a5,3
    80002fc8:	00200c93          	li	s9,2
    80002fcc:	c5dff06f          	j	80002c28 <__printf+0x260>
    80002fd0:	00300793          	li	a5,3
    80002fd4:	00200c93          	li	s9,2
    80002fd8:	de9ff06f          	j	80002dc0 <__printf+0x3f8>
    80002fdc:	00400793          	li	a5,4
    80002fe0:	00300c93          	li	s9,3
    80002fe4:	dddff06f          	j	80002dc0 <__printf+0x3f8>
    80002fe8:	00400793          	li	a5,4
    80002fec:	00300c93          	li	s9,3
    80002ff0:	c39ff06f          	j	80002c28 <__printf+0x260>
    80002ff4:	00500793          	li	a5,5
    80002ff8:	00400c93          	li	s9,4
    80002ffc:	c2dff06f          	j	80002c28 <__printf+0x260>
    80003000:	00500793          	li	a5,5
    80003004:	00400c93          	li	s9,4
    80003008:	db9ff06f          	j	80002dc0 <__printf+0x3f8>
    8000300c:	00600793          	li	a5,6
    80003010:	00500c93          	li	s9,5
    80003014:	dadff06f          	j	80002dc0 <__printf+0x3f8>
    80003018:	00600793          	li	a5,6
    8000301c:	00500c93          	li	s9,5
    80003020:	c09ff06f          	j	80002c28 <__printf+0x260>
    80003024:	00800793          	li	a5,8
    80003028:	00700c93          	li	s9,7
    8000302c:	bfdff06f          	j	80002c28 <__printf+0x260>
    80003030:	00100793          	li	a5,1
    80003034:	d91ff06f          	j	80002dc4 <__printf+0x3fc>
    80003038:	00100793          	li	a5,1
    8000303c:	bf1ff06f          	j	80002c2c <__printf+0x264>
    80003040:	00900793          	li	a5,9
    80003044:	00800c93          	li	s9,8
    80003048:	be1ff06f          	j	80002c28 <__printf+0x260>
    8000304c:	00001517          	auipc	a0,0x1
    80003050:	26450513          	addi	a0,a0,612 # 800042b0 <_ZZ12printIntegermE6digits+0x290>
    80003054:	00000097          	auipc	ra,0x0
    80003058:	918080e7          	jalr	-1768(ra) # 8000296c <panic>

000000008000305c <printfinit>:
    8000305c:	fe010113          	addi	sp,sp,-32
    80003060:	00813823          	sd	s0,16(sp)
    80003064:	00913423          	sd	s1,8(sp)
    80003068:	00113c23          	sd	ra,24(sp)
    8000306c:	02010413          	addi	s0,sp,32
    80003070:	00003497          	auipc	s1,0x3
    80003074:	bb048493          	addi	s1,s1,-1104 # 80005c20 <pr>
    80003078:	00048513          	mv	a0,s1
    8000307c:	00001597          	auipc	a1,0x1
    80003080:	24458593          	addi	a1,a1,580 # 800042c0 <_ZZ12printIntegermE6digits+0x2a0>
    80003084:	00000097          	auipc	ra,0x0
    80003088:	5f4080e7          	jalr	1524(ra) # 80003678 <initlock>
    8000308c:	01813083          	ld	ra,24(sp)
    80003090:	01013403          	ld	s0,16(sp)
    80003094:	0004ac23          	sw	zero,24(s1)
    80003098:	00813483          	ld	s1,8(sp)
    8000309c:	02010113          	addi	sp,sp,32
    800030a0:	00008067          	ret

00000000800030a4 <uartinit>:
    800030a4:	ff010113          	addi	sp,sp,-16
    800030a8:	00813423          	sd	s0,8(sp)
    800030ac:	01010413          	addi	s0,sp,16
    800030b0:	100007b7          	lui	a5,0x10000
    800030b4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    800030b8:	f8000713          	li	a4,-128
    800030bc:	00e781a3          	sb	a4,3(a5)
    800030c0:	00300713          	li	a4,3
    800030c4:	00e78023          	sb	a4,0(a5)
    800030c8:	000780a3          	sb	zero,1(a5)
    800030cc:	00e781a3          	sb	a4,3(a5)
    800030d0:	00700693          	li	a3,7
    800030d4:	00d78123          	sb	a3,2(a5)
    800030d8:	00e780a3          	sb	a4,1(a5)
    800030dc:	00813403          	ld	s0,8(sp)
    800030e0:	01010113          	addi	sp,sp,16
    800030e4:	00008067          	ret

00000000800030e8 <uartputc>:
    800030e8:	00002797          	auipc	a5,0x2
    800030ec:	8b07a783          	lw	a5,-1872(a5) # 80004998 <panicked>
    800030f0:	00078463          	beqz	a5,800030f8 <uartputc+0x10>
    800030f4:	0000006f          	j	800030f4 <uartputc+0xc>
    800030f8:	fd010113          	addi	sp,sp,-48
    800030fc:	02813023          	sd	s0,32(sp)
    80003100:	00913c23          	sd	s1,24(sp)
    80003104:	01213823          	sd	s2,16(sp)
    80003108:	01313423          	sd	s3,8(sp)
    8000310c:	02113423          	sd	ra,40(sp)
    80003110:	03010413          	addi	s0,sp,48
    80003114:	00002917          	auipc	s2,0x2
    80003118:	88c90913          	addi	s2,s2,-1908 # 800049a0 <uart_tx_r>
    8000311c:	00093783          	ld	a5,0(s2)
    80003120:	00002497          	auipc	s1,0x2
    80003124:	88848493          	addi	s1,s1,-1912 # 800049a8 <uart_tx_w>
    80003128:	0004b703          	ld	a4,0(s1)
    8000312c:	02078693          	addi	a3,a5,32
    80003130:	00050993          	mv	s3,a0
    80003134:	02e69c63          	bne	a3,a4,8000316c <uartputc+0x84>
    80003138:	00001097          	auipc	ra,0x1
    8000313c:	834080e7          	jalr	-1996(ra) # 8000396c <push_on>
    80003140:	00093783          	ld	a5,0(s2)
    80003144:	0004b703          	ld	a4,0(s1)
    80003148:	02078793          	addi	a5,a5,32
    8000314c:	00e79463          	bne	a5,a4,80003154 <uartputc+0x6c>
    80003150:	0000006f          	j	80003150 <uartputc+0x68>
    80003154:	00001097          	auipc	ra,0x1
    80003158:	88c080e7          	jalr	-1908(ra) # 800039e0 <pop_on>
    8000315c:	00093783          	ld	a5,0(s2)
    80003160:	0004b703          	ld	a4,0(s1)
    80003164:	02078693          	addi	a3,a5,32
    80003168:	fce688e3          	beq	a3,a4,80003138 <uartputc+0x50>
    8000316c:	01f77693          	andi	a3,a4,31
    80003170:	00003597          	auipc	a1,0x3
    80003174:	ad058593          	addi	a1,a1,-1328 # 80005c40 <uart_tx_buf>
    80003178:	00d586b3          	add	a3,a1,a3
    8000317c:	00170713          	addi	a4,a4,1
    80003180:	01368023          	sb	s3,0(a3)
    80003184:	00e4b023          	sd	a4,0(s1)
    80003188:	10000637          	lui	a2,0x10000
    8000318c:	02f71063          	bne	a4,a5,800031ac <uartputc+0xc4>
    80003190:	0340006f          	j	800031c4 <uartputc+0xdc>
    80003194:	00074703          	lbu	a4,0(a4)
    80003198:	00f93023          	sd	a5,0(s2)
    8000319c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    800031a0:	00093783          	ld	a5,0(s2)
    800031a4:	0004b703          	ld	a4,0(s1)
    800031a8:	00f70e63          	beq	a4,a5,800031c4 <uartputc+0xdc>
    800031ac:	00564683          	lbu	a3,5(a2)
    800031b0:	01f7f713          	andi	a4,a5,31
    800031b4:	00e58733          	add	a4,a1,a4
    800031b8:	0206f693          	andi	a3,a3,32
    800031bc:	00178793          	addi	a5,a5,1
    800031c0:	fc069ae3          	bnez	a3,80003194 <uartputc+0xac>
    800031c4:	02813083          	ld	ra,40(sp)
    800031c8:	02013403          	ld	s0,32(sp)
    800031cc:	01813483          	ld	s1,24(sp)
    800031d0:	01013903          	ld	s2,16(sp)
    800031d4:	00813983          	ld	s3,8(sp)
    800031d8:	03010113          	addi	sp,sp,48
    800031dc:	00008067          	ret

00000000800031e0 <uartputc_sync>:
    800031e0:	ff010113          	addi	sp,sp,-16
    800031e4:	00813423          	sd	s0,8(sp)
    800031e8:	01010413          	addi	s0,sp,16
    800031ec:	00001717          	auipc	a4,0x1
    800031f0:	7ac72703          	lw	a4,1964(a4) # 80004998 <panicked>
    800031f4:	02071663          	bnez	a4,80003220 <uartputc_sync+0x40>
    800031f8:	00050793          	mv	a5,a0
    800031fc:	100006b7          	lui	a3,0x10000
    80003200:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80003204:	02077713          	andi	a4,a4,32
    80003208:	fe070ce3          	beqz	a4,80003200 <uartputc_sync+0x20>
    8000320c:	0ff7f793          	andi	a5,a5,255
    80003210:	00f68023          	sb	a5,0(a3)
    80003214:	00813403          	ld	s0,8(sp)
    80003218:	01010113          	addi	sp,sp,16
    8000321c:	00008067          	ret
    80003220:	0000006f          	j	80003220 <uartputc_sync+0x40>

0000000080003224 <uartstart>:
    80003224:	ff010113          	addi	sp,sp,-16
    80003228:	00813423          	sd	s0,8(sp)
    8000322c:	01010413          	addi	s0,sp,16
    80003230:	00001617          	auipc	a2,0x1
    80003234:	77060613          	addi	a2,a2,1904 # 800049a0 <uart_tx_r>
    80003238:	00001517          	auipc	a0,0x1
    8000323c:	77050513          	addi	a0,a0,1904 # 800049a8 <uart_tx_w>
    80003240:	00063783          	ld	a5,0(a2)
    80003244:	00053703          	ld	a4,0(a0)
    80003248:	04f70263          	beq	a4,a5,8000328c <uartstart+0x68>
    8000324c:	100005b7          	lui	a1,0x10000
    80003250:	00003817          	auipc	a6,0x3
    80003254:	9f080813          	addi	a6,a6,-1552 # 80005c40 <uart_tx_buf>
    80003258:	01c0006f          	j	80003274 <uartstart+0x50>
    8000325c:	0006c703          	lbu	a4,0(a3)
    80003260:	00f63023          	sd	a5,0(a2)
    80003264:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80003268:	00063783          	ld	a5,0(a2)
    8000326c:	00053703          	ld	a4,0(a0)
    80003270:	00f70e63          	beq	a4,a5,8000328c <uartstart+0x68>
    80003274:	01f7f713          	andi	a4,a5,31
    80003278:	00e806b3          	add	a3,a6,a4
    8000327c:	0055c703          	lbu	a4,5(a1)
    80003280:	00178793          	addi	a5,a5,1
    80003284:	02077713          	andi	a4,a4,32
    80003288:	fc071ae3          	bnez	a4,8000325c <uartstart+0x38>
    8000328c:	00813403          	ld	s0,8(sp)
    80003290:	01010113          	addi	sp,sp,16
    80003294:	00008067          	ret

0000000080003298 <uartgetc>:
    80003298:	ff010113          	addi	sp,sp,-16
    8000329c:	00813423          	sd	s0,8(sp)
    800032a0:	01010413          	addi	s0,sp,16
    800032a4:	10000737          	lui	a4,0x10000
    800032a8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    800032ac:	0017f793          	andi	a5,a5,1
    800032b0:	00078c63          	beqz	a5,800032c8 <uartgetc+0x30>
    800032b4:	00074503          	lbu	a0,0(a4)
    800032b8:	0ff57513          	andi	a0,a0,255
    800032bc:	00813403          	ld	s0,8(sp)
    800032c0:	01010113          	addi	sp,sp,16
    800032c4:	00008067          	ret
    800032c8:	fff00513          	li	a0,-1
    800032cc:	ff1ff06f          	j	800032bc <uartgetc+0x24>

00000000800032d0 <uartintr>:
    800032d0:	100007b7          	lui	a5,0x10000
    800032d4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    800032d8:	0017f793          	andi	a5,a5,1
    800032dc:	0a078463          	beqz	a5,80003384 <uartintr+0xb4>
    800032e0:	fe010113          	addi	sp,sp,-32
    800032e4:	00813823          	sd	s0,16(sp)
    800032e8:	00913423          	sd	s1,8(sp)
    800032ec:	00113c23          	sd	ra,24(sp)
    800032f0:	02010413          	addi	s0,sp,32
    800032f4:	100004b7          	lui	s1,0x10000
    800032f8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    800032fc:	0ff57513          	andi	a0,a0,255
    80003300:	fffff097          	auipc	ra,0xfffff
    80003304:	534080e7          	jalr	1332(ra) # 80002834 <consoleintr>
    80003308:	0054c783          	lbu	a5,5(s1)
    8000330c:	0017f793          	andi	a5,a5,1
    80003310:	fe0794e3          	bnez	a5,800032f8 <uartintr+0x28>
    80003314:	00001617          	auipc	a2,0x1
    80003318:	68c60613          	addi	a2,a2,1676 # 800049a0 <uart_tx_r>
    8000331c:	00001517          	auipc	a0,0x1
    80003320:	68c50513          	addi	a0,a0,1676 # 800049a8 <uart_tx_w>
    80003324:	00063783          	ld	a5,0(a2)
    80003328:	00053703          	ld	a4,0(a0)
    8000332c:	04f70263          	beq	a4,a5,80003370 <uartintr+0xa0>
    80003330:	100005b7          	lui	a1,0x10000
    80003334:	00003817          	auipc	a6,0x3
    80003338:	90c80813          	addi	a6,a6,-1780 # 80005c40 <uart_tx_buf>
    8000333c:	01c0006f          	j	80003358 <uartintr+0x88>
    80003340:	0006c703          	lbu	a4,0(a3)
    80003344:	00f63023          	sd	a5,0(a2)
    80003348:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000334c:	00063783          	ld	a5,0(a2)
    80003350:	00053703          	ld	a4,0(a0)
    80003354:	00f70e63          	beq	a4,a5,80003370 <uartintr+0xa0>
    80003358:	01f7f713          	andi	a4,a5,31
    8000335c:	00e806b3          	add	a3,a6,a4
    80003360:	0055c703          	lbu	a4,5(a1)
    80003364:	00178793          	addi	a5,a5,1
    80003368:	02077713          	andi	a4,a4,32
    8000336c:	fc071ae3          	bnez	a4,80003340 <uartintr+0x70>
    80003370:	01813083          	ld	ra,24(sp)
    80003374:	01013403          	ld	s0,16(sp)
    80003378:	00813483          	ld	s1,8(sp)
    8000337c:	02010113          	addi	sp,sp,32
    80003380:	00008067          	ret
    80003384:	00001617          	auipc	a2,0x1
    80003388:	61c60613          	addi	a2,a2,1564 # 800049a0 <uart_tx_r>
    8000338c:	00001517          	auipc	a0,0x1
    80003390:	61c50513          	addi	a0,a0,1564 # 800049a8 <uart_tx_w>
    80003394:	00063783          	ld	a5,0(a2)
    80003398:	00053703          	ld	a4,0(a0)
    8000339c:	04f70263          	beq	a4,a5,800033e0 <uartintr+0x110>
    800033a0:	100005b7          	lui	a1,0x10000
    800033a4:	00003817          	auipc	a6,0x3
    800033a8:	89c80813          	addi	a6,a6,-1892 # 80005c40 <uart_tx_buf>
    800033ac:	01c0006f          	j	800033c8 <uartintr+0xf8>
    800033b0:	0006c703          	lbu	a4,0(a3)
    800033b4:	00f63023          	sd	a5,0(a2)
    800033b8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800033bc:	00063783          	ld	a5,0(a2)
    800033c0:	00053703          	ld	a4,0(a0)
    800033c4:	02f70063          	beq	a4,a5,800033e4 <uartintr+0x114>
    800033c8:	01f7f713          	andi	a4,a5,31
    800033cc:	00e806b3          	add	a3,a6,a4
    800033d0:	0055c703          	lbu	a4,5(a1)
    800033d4:	00178793          	addi	a5,a5,1
    800033d8:	02077713          	andi	a4,a4,32
    800033dc:	fc071ae3          	bnez	a4,800033b0 <uartintr+0xe0>
    800033e0:	00008067          	ret
    800033e4:	00008067          	ret

00000000800033e8 <kinit>:
    800033e8:	fc010113          	addi	sp,sp,-64
    800033ec:	02913423          	sd	s1,40(sp)
    800033f0:	fffff7b7          	lui	a5,0xfffff
    800033f4:	00004497          	auipc	s1,0x4
    800033f8:	86b48493          	addi	s1,s1,-1941 # 80006c5f <end+0xfff>
    800033fc:	02813823          	sd	s0,48(sp)
    80003400:	01313c23          	sd	s3,24(sp)
    80003404:	00f4f4b3          	and	s1,s1,a5
    80003408:	02113c23          	sd	ra,56(sp)
    8000340c:	03213023          	sd	s2,32(sp)
    80003410:	01413823          	sd	s4,16(sp)
    80003414:	01513423          	sd	s5,8(sp)
    80003418:	04010413          	addi	s0,sp,64
    8000341c:	000017b7          	lui	a5,0x1
    80003420:	01100993          	li	s3,17
    80003424:	00f487b3          	add	a5,s1,a5
    80003428:	01b99993          	slli	s3,s3,0x1b
    8000342c:	06f9e063          	bltu	s3,a5,8000348c <kinit+0xa4>
    80003430:	00003a97          	auipc	s5,0x3
    80003434:	830a8a93          	addi	s5,s5,-2000 # 80005c60 <end>
    80003438:	0754ec63          	bltu	s1,s5,800034b0 <kinit+0xc8>
    8000343c:	0734fa63          	bgeu	s1,s3,800034b0 <kinit+0xc8>
    80003440:	00088a37          	lui	s4,0x88
    80003444:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80003448:	00001917          	auipc	s2,0x1
    8000344c:	56890913          	addi	s2,s2,1384 # 800049b0 <kmem>
    80003450:	00ca1a13          	slli	s4,s4,0xc
    80003454:	0140006f          	j	80003468 <kinit+0x80>
    80003458:	000017b7          	lui	a5,0x1
    8000345c:	00f484b3          	add	s1,s1,a5
    80003460:	0554e863          	bltu	s1,s5,800034b0 <kinit+0xc8>
    80003464:	0534f663          	bgeu	s1,s3,800034b0 <kinit+0xc8>
    80003468:	00001637          	lui	a2,0x1
    8000346c:	00100593          	li	a1,1
    80003470:	00048513          	mv	a0,s1
    80003474:	00000097          	auipc	ra,0x0
    80003478:	5e4080e7          	jalr	1508(ra) # 80003a58 <__memset>
    8000347c:	00093783          	ld	a5,0(s2)
    80003480:	00f4b023          	sd	a5,0(s1)
    80003484:	00993023          	sd	s1,0(s2)
    80003488:	fd4498e3          	bne	s1,s4,80003458 <kinit+0x70>
    8000348c:	03813083          	ld	ra,56(sp)
    80003490:	03013403          	ld	s0,48(sp)
    80003494:	02813483          	ld	s1,40(sp)
    80003498:	02013903          	ld	s2,32(sp)
    8000349c:	01813983          	ld	s3,24(sp)
    800034a0:	01013a03          	ld	s4,16(sp)
    800034a4:	00813a83          	ld	s5,8(sp)
    800034a8:	04010113          	addi	sp,sp,64
    800034ac:	00008067          	ret
    800034b0:	00001517          	auipc	a0,0x1
    800034b4:	e3050513          	addi	a0,a0,-464 # 800042e0 <digits+0x18>
    800034b8:	fffff097          	auipc	ra,0xfffff
    800034bc:	4b4080e7          	jalr	1204(ra) # 8000296c <panic>

00000000800034c0 <freerange>:
    800034c0:	fc010113          	addi	sp,sp,-64
    800034c4:	000017b7          	lui	a5,0x1
    800034c8:	02913423          	sd	s1,40(sp)
    800034cc:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    800034d0:	009504b3          	add	s1,a0,s1
    800034d4:	fffff537          	lui	a0,0xfffff
    800034d8:	02813823          	sd	s0,48(sp)
    800034dc:	02113c23          	sd	ra,56(sp)
    800034e0:	03213023          	sd	s2,32(sp)
    800034e4:	01313c23          	sd	s3,24(sp)
    800034e8:	01413823          	sd	s4,16(sp)
    800034ec:	01513423          	sd	s5,8(sp)
    800034f0:	01613023          	sd	s6,0(sp)
    800034f4:	04010413          	addi	s0,sp,64
    800034f8:	00a4f4b3          	and	s1,s1,a0
    800034fc:	00f487b3          	add	a5,s1,a5
    80003500:	06f5e463          	bltu	a1,a5,80003568 <freerange+0xa8>
    80003504:	00002a97          	auipc	s5,0x2
    80003508:	75ca8a93          	addi	s5,s5,1884 # 80005c60 <end>
    8000350c:	0954e263          	bltu	s1,s5,80003590 <freerange+0xd0>
    80003510:	01100993          	li	s3,17
    80003514:	01b99993          	slli	s3,s3,0x1b
    80003518:	0734fc63          	bgeu	s1,s3,80003590 <freerange+0xd0>
    8000351c:	00058a13          	mv	s4,a1
    80003520:	00001917          	auipc	s2,0x1
    80003524:	49090913          	addi	s2,s2,1168 # 800049b0 <kmem>
    80003528:	00002b37          	lui	s6,0x2
    8000352c:	0140006f          	j	80003540 <freerange+0x80>
    80003530:	000017b7          	lui	a5,0x1
    80003534:	00f484b3          	add	s1,s1,a5
    80003538:	0554ec63          	bltu	s1,s5,80003590 <freerange+0xd0>
    8000353c:	0534fa63          	bgeu	s1,s3,80003590 <freerange+0xd0>
    80003540:	00001637          	lui	a2,0x1
    80003544:	00100593          	li	a1,1
    80003548:	00048513          	mv	a0,s1
    8000354c:	00000097          	auipc	ra,0x0
    80003550:	50c080e7          	jalr	1292(ra) # 80003a58 <__memset>
    80003554:	00093703          	ld	a4,0(s2)
    80003558:	016487b3          	add	a5,s1,s6
    8000355c:	00e4b023          	sd	a4,0(s1)
    80003560:	00993023          	sd	s1,0(s2)
    80003564:	fcfa76e3          	bgeu	s4,a5,80003530 <freerange+0x70>
    80003568:	03813083          	ld	ra,56(sp)
    8000356c:	03013403          	ld	s0,48(sp)
    80003570:	02813483          	ld	s1,40(sp)
    80003574:	02013903          	ld	s2,32(sp)
    80003578:	01813983          	ld	s3,24(sp)
    8000357c:	01013a03          	ld	s4,16(sp)
    80003580:	00813a83          	ld	s5,8(sp)
    80003584:	00013b03          	ld	s6,0(sp)
    80003588:	04010113          	addi	sp,sp,64
    8000358c:	00008067          	ret
    80003590:	00001517          	auipc	a0,0x1
    80003594:	d5050513          	addi	a0,a0,-688 # 800042e0 <digits+0x18>
    80003598:	fffff097          	auipc	ra,0xfffff
    8000359c:	3d4080e7          	jalr	980(ra) # 8000296c <panic>

00000000800035a0 <kfree>:
    800035a0:	fe010113          	addi	sp,sp,-32
    800035a4:	00813823          	sd	s0,16(sp)
    800035a8:	00113c23          	sd	ra,24(sp)
    800035ac:	00913423          	sd	s1,8(sp)
    800035b0:	02010413          	addi	s0,sp,32
    800035b4:	03451793          	slli	a5,a0,0x34
    800035b8:	04079c63          	bnez	a5,80003610 <kfree+0x70>
    800035bc:	00002797          	auipc	a5,0x2
    800035c0:	6a478793          	addi	a5,a5,1700 # 80005c60 <end>
    800035c4:	00050493          	mv	s1,a0
    800035c8:	04f56463          	bltu	a0,a5,80003610 <kfree+0x70>
    800035cc:	01100793          	li	a5,17
    800035d0:	01b79793          	slli	a5,a5,0x1b
    800035d4:	02f57e63          	bgeu	a0,a5,80003610 <kfree+0x70>
    800035d8:	00001637          	lui	a2,0x1
    800035dc:	00100593          	li	a1,1
    800035e0:	00000097          	auipc	ra,0x0
    800035e4:	478080e7          	jalr	1144(ra) # 80003a58 <__memset>
    800035e8:	00001797          	auipc	a5,0x1
    800035ec:	3c878793          	addi	a5,a5,968 # 800049b0 <kmem>
    800035f0:	0007b703          	ld	a4,0(a5)
    800035f4:	01813083          	ld	ra,24(sp)
    800035f8:	01013403          	ld	s0,16(sp)
    800035fc:	00e4b023          	sd	a4,0(s1)
    80003600:	0097b023          	sd	s1,0(a5)
    80003604:	00813483          	ld	s1,8(sp)
    80003608:	02010113          	addi	sp,sp,32
    8000360c:	00008067          	ret
    80003610:	00001517          	auipc	a0,0x1
    80003614:	cd050513          	addi	a0,a0,-816 # 800042e0 <digits+0x18>
    80003618:	fffff097          	auipc	ra,0xfffff
    8000361c:	354080e7          	jalr	852(ra) # 8000296c <panic>

0000000080003620 <kalloc>:
    80003620:	fe010113          	addi	sp,sp,-32
    80003624:	00813823          	sd	s0,16(sp)
    80003628:	00913423          	sd	s1,8(sp)
    8000362c:	00113c23          	sd	ra,24(sp)
    80003630:	02010413          	addi	s0,sp,32
    80003634:	00001797          	auipc	a5,0x1
    80003638:	37c78793          	addi	a5,a5,892 # 800049b0 <kmem>
    8000363c:	0007b483          	ld	s1,0(a5)
    80003640:	02048063          	beqz	s1,80003660 <kalloc+0x40>
    80003644:	0004b703          	ld	a4,0(s1)
    80003648:	00001637          	lui	a2,0x1
    8000364c:	00500593          	li	a1,5
    80003650:	00048513          	mv	a0,s1
    80003654:	00e7b023          	sd	a4,0(a5)
    80003658:	00000097          	auipc	ra,0x0
    8000365c:	400080e7          	jalr	1024(ra) # 80003a58 <__memset>
    80003660:	01813083          	ld	ra,24(sp)
    80003664:	01013403          	ld	s0,16(sp)
    80003668:	00048513          	mv	a0,s1
    8000366c:	00813483          	ld	s1,8(sp)
    80003670:	02010113          	addi	sp,sp,32
    80003674:	00008067          	ret

0000000080003678 <initlock>:
    80003678:	ff010113          	addi	sp,sp,-16
    8000367c:	00813423          	sd	s0,8(sp)
    80003680:	01010413          	addi	s0,sp,16
    80003684:	00813403          	ld	s0,8(sp)
    80003688:	00b53423          	sd	a1,8(a0)
    8000368c:	00052023          	sw	zero,0(a0)
    80003690:	00053823          	sd	zero,16(a0)
    80003694:	01010113          	addi	sp,sp,16
    80003698:	00008067          	ret

000000008000369c <acquire>:
    8000369c:	fe010113          	addi	sp,sp,-32
    800036a0:	00813823          	sd	s0,16(sp)
    800036a4:	00913423          	sd	s1,8(sp)
    800036a8:	00113c23          	sd	ra,24(sp)
    800036ac:	01213023          	sd	s2,0(sp)
    800036b0:	02010413          	addi	s0,sp,32
    800036b4:	00050493          	mv	s1,a0
    800036b8:	10002973          	csrr	s2,sstatus
    800036bc:	100027f3          	csrr	a5,sstatus
    800036c0:	ffd7f793          	andi	a5,a5,-3
    800036c4:	10079073          	csrw	sstatus,a5
    800036c8:	fffff097          	auipc	ra,0xfffff
    800036cc:	8e4080e7          	jalr	-1820(ra) # 80001fac <mycpu>
    800036d0:	07852783          	lw	a5,120(a0)
    800036d4:	06078e63          	beqz	a5,80003750 <acquire+0xb4>
    800036d8:	fffff097          	auipc	ra,0xfffff
    800036dc:	8d4080e7          	jalr	-1836(ra) # 80001fac <mycpu>
    800036e0:	07852783          	lw	a5,120(a0)
    800036e4:	0004a703          	lw	a4,0(s1)
    800036e8:	0017879b          	addiw	a5,a5,1
    800036ec:	06f52c23          	sw	a5,120(a0)
    800036f0:	04071063          	bnez	a4,80003730 <acquire+0x94>
    800036f4:	00100713          	li	a4,1
    800036f8:	00070793          	mv	a5,a4
    800036fc:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80003700:	0007879b          	sext.w	a5,a5
    80003704:	fe079ae3          	bnez	a5,800036f8 <acquire+0x5c>
    80003708:	0ff0000f          	fence
    8000370c:	fffff097          	auipc	ra,0xfffff
    80003710:	8a0080e7          	jalr	-1888(ra) # 80001fac <mycpu>
    80003714:	01813083          	ld	ra,24(sp)
    80003718:	01013403          	ld	s0,16(sp)
    8000371c:	00a4b823          	sd	a0,16(s1)
    80003720:	00013903          	ld	s2,0(sp)
    80003724:	00813483          	ld	s1,8(sp)
    80003728:	02010113          	addi	sp,sp,32
    8000372c:	00008067          	ret
    80003730:	0104b903          	ld	s2,16(s1)
    80003734:	fffff097          	auipc	ra,0xfffff
    80003738:	878080e7          	jalr	-1928(ra) # 80001fac <mycpu>
    8000373c:	faa91ce3          	bne	s2,a0,800036f4 <acquire+0x58>
    80003740:	00001517          	auipc	a0,0x1
    80003744:	ba850513          	addi	a0,a0,-1112 # 800042e8 <digits+0x20>
    80003748:	fffff097          	auipc	ra,0xfffff
    8000374c:	224080e7          	jalr	548(ra) # 8000296c <panic>
    80003750:	00195913          	srli	s2,s2,0x1
    80003754:	fffff097          	auipc	ra,0xfffff
    80003758:	858080e7          	jalr	-1960(ra) # 80001fac <mycpu>
    8000375c:	00197913          	andi	s2,s2,1
    80003760:	07252e23          	sw	s2,124(a0)
    80003764:	f75ff06f          	j	800036d8 <acquire+0x3c>

0000000080003768 <release>:
    80003768:	fe010113          	addi	sp,sp,-32
    8000376c:	00813823          	sd	s0,16(sp)
    80003770:	00113c23          	sd	ra,24(sp)
    80003774:	00913423          	sd	s1,8(sp)
    80003778:	01213023          	sd	s2,0(sp)
    8000377c:	02010413          	addi	s0,sp,32
    80003780:	00052783          	lw	a5,0(a0)
    80003784:	00079a63          	bnez	a5,80003798 <release+0x30>
    80003788:	00001517          	auipc	a0,0x1
    8000378c:	b6850513          	addi	a0,a0,-1176 # 800042f0 <digits+0x28>
    80003790:	fffff097          	auipc	ra,0xfffff
    80003794:	1dc080e7          	jalr	476(ra) # 8000296c <panic>
    80003798:	01053903          	ld	s2,16(a0)
    8000379c:	00050493          	mv	s1,a0
    800037a0:	fffff097          	auipc	ra,0xfffff
    800037a4:	80c080e7          	jalr	-2036(ra) # 80001fac <mycpu>
    800037a8:	fea910e3          	bne	s2,a0,80003788 <release+0x20>
    800037ac:	0004b823          	sd	zero,16(s1)
    800037b0:	0ff0000f          	fence
    800037b4:	0f50000f          	fence	iorw,ow
    800037b8:	0804a02f          	amoswap.w	zero,zero,(s1)
    800037bc:	ffffe097          	auipc	ra,0xffffe
    800037c0:	7f0080e7          	jalr	2032(ra) # 80001fac <mycpu>
    800037c4:	100027f3          	csrr	a5,sstatus
    800037c8:	0027f793          	andi	a5,a5,2
    800037cc:	04079a63          	bnez	a5,80003820 <release+0xb8>
    800037d0:	07852783          	lw	a5,120(a0)
    800037d4:	02f05e63          	blez	a5,80003810 <release+0xa8>
    800037d8:	fff7871b          	addiw	a4,a5,-1
    800037dc:	06e52c23          	sw	a4,120(a0)
    800037e0:	00071c63          	bnez	a4,800037f8 <release+0x90>
    800037e4:	07c52783          	lw	a5,124(a0)
    800037e8:	00078863          	beqz	a5,800037f8 <release+0x90>
    800037ec:	100027f3          	csrr	a5,sstatus
    800037f0:	0027e793          	ori	a5,a5,2
    800037f4:	10079073          	csrw	sstatus,a5
    800037f8:	01813083          	ld	ra,24(sp)
    800037fc:	01013403          	ld	s0,16(sp)
    80003800:	00813483          	ld	s1,8(sp)
    80003804:	00013903          	ld	s2,0(sp)
    80003808:	02010113          	addi	sp,sp,32
    8000380c:	00008067          	ret
    80003810:	00001517          	auipc	a0,0x1
    80003814:	b0050513          	addi	a0,a0,-1280 # 80004310 <digits+0x48>
    80003818:	fffff097          	auipc	ra,0xfffff
    8000381c:	154080e7          	jalr	340(ra) # 8000296c <panic>
    80003820:	00001517          	auipc	a0,0x1
    80003824:	ad850513          	addi	a0,a0,-1320 # 800042f8 <digits+0x30>
    80003828:	fffff097          	auipc	ra,0xfffff
    8000382c:	144080e7          	jalr	324(ra) # 8000296c <panic>

0000000080003830 <holding>:
    80003830:	00052783          	lw	a5,0(a0)
    80003834:	00079663          	bnez	a5,80003840 <holding+0x10>
    80003838:	00000513          	li	a0,0
    8000383c:	00008067          	ret
    80003840:	fe010113          	addi	sp,sp,-32
    80003844:	00813823          	sd	s0,16(sp)
    80003848:	00913423          	sd	s1,8(sp)
    8000384c:	00113c23          	sd	ra,24(sp)
    80003850:	02010413          	addi	s0,sp,32
    80003854:	01053483          	ld	s1,16(a0)
    80003858:	ffffe097          	auipc	ra,0xffffe
    8000385c:	754080e7          	jalr	1876(ra) # 80001fac <mycpu>
    80003860:	01813083          	ld	ra,24(sp)
    80003864:	01013403          	ld	s0,16(sp)
    80003868:	40a48533          	sub	a0,s1,a0
    8000386c:	00153513          	seqz	a0,a0
    80003870:	00813483          	ld	s1,8(sp)
    80003874:	02010113          	addi	sp,sp,32
    80003878:	00008067          	ret

000000008000387c <push_off>:
    8000387c:	fe010113          	addi	sp,sp,-32
    80003880:	00813823          	sd	s0,16(sp)
    80003884:	00113c23          	sd	ra,24(sp)
    80003888:	00913423          	sd	s1,8(sp)
    8000388c:	02010413          	addi	s0,sp,32
    80003890:	100024f3          	csrr	s1,sstatus
    80003894:	100027f3          	csrr	a5,sstatus
    80003898:	ffd7f793          	andi	a5,a5,-3
    8000389c:	10079073          	csrw	sstatus,a5
    800038a0:	ffffe097          	auipc	ra,0xffffe
    800038a4:	70c080e7          	jalr	1804(ra) # 80001fac <mycpu>
    800038a8:	07852783          	lw	a5,120(a0)
    800038ac:	02078663          	beqz	a5,800038d8 <push_off+0x5c>
    800038b0:	ffffe097          	auipc	ra,0xffffe
    800038b4:	6fc080e7          	jalr	1788(ra) # 80001fac <mycpu>
    800038b8:	07852783          	lw	a5,120(a0)
    800038bc:	01813083          	ld	ra,24(sp)
    800038c0:	01013403          	ld	s0,16(sp)
    800038c4:	0017879b          	addiw	a5,a5,1
    800038c8:	06f52c23          	sw	a5,120(a0)
    800038cc:	00813483          	ld	s1,8(sp)
    800038d0:	02010113          	addi	sp,sp,32
    800038d4:	00008067          	ret
    800038d8:	0014d493          	srli	s1,s1,0x1
    800038dc:	ffffe097          	auipc	ra,0xffffe
    800038e0:	6d0080e7          	jalr	1744(ra) # 80001fac <mycpu>
    800038e4:	0014f493          	andi	s1,s1,1
    800038e8:	06952e23          	sw	s1,124(a0)
    800038ec:	fc5ff06f          	j	800038b0 <push_off+0x34>

00000000800038f0 <pop_off>:
    800038f0:	ff010113          	addi	sp,sp,-16
    800038f4:	00813023          	sd	s0,0(sp)
    800038f8:	00113423          	sd	ra,8(sp)
    800038fc:	01010413          	addi	s0,sp,16
    80003900:	ffffe097          	auipc	ra,0xffffe
    80003904:	6ac080e7          	jalr	1708(ra) # 80001fac <mycpu>
    80003908:	100027f3          	csrr	a5,sstatus
    8000390c:	0027f793          	andi	a5,a5,2
    80003910:	04079663          	bnez	a5,8000395c <pop_off+0x6c>
    80003914:	07852783          	lw	a5,120(a0)
    80003918:	02f05a63          	blez	a5,8000394c <pop_off+0x5c>
    8000391c:	fff7871b          	addiw	a4,a5,-1
    80003920:	06e52c23          	sw	a4,120(a0)
    80003924:	00071c63          	bnez	a4,8000393c <pop_off+0x4c>
    80003928:	07c52783          	lw	a5,124(a0)
    8000392c:	00078863          	beqz	a5,8000393c <pop_off+0x4c>
    80003930:	100027f3          	csrr	a5,sstatus
    80003934:	0027e793          	ori	a5,a5,2
    80003938:	10079073          	csrw	sstatus,a5
    8000393c:	00813083          	ld	ra,8(sp)
    80003940:	00013403          	ld	s0,0(sp)
    80003944:	01010113          	addi	sp,sp,16
    80003948:	00008067          	ret
    8000394c:	00001517          	auipc	a0,0x1
    80003950:	9c450513          	addi	a0,a0,-1596 # 80004310 <digits+0x48>
    80003954:	fffff097          	auipc	ra,0xfffff
    80003958:	018080e7          	jalr	24(ra) # 8000296c <panic>
    8000395c:	00001517          	auipc	a0,0x1
    80003960:	99c50513          	addi	a0,a0,-1636 # 800042f8 <digits+0x30>
    80003964:	fffff097          	auipc	ra,0xfffff
    80003968:	008080e7          	jalr	8(ra) # 8000296c <panic>

000000008000396c <push_on>:
    8000396c:	fe010113          	addi	sp,sp,-32
    80003970:	00813823          	sd	s0,16(sp)
    80003974:	00113c23          	sd	ra,24(sp)
    80003978:	00913423          	sd	s1,8(sp)
    8000397c:	02010413          	addi	s0,sp,32
    80003980:	100024f3          	csrr	s1,sstatus
    80003984:	100027f3          	csrr	a5,sstatus
    80003988:	0027e793          	ori	a5,a5,2
    8000398c:	10079073          	csrw	sstatus,a5
    80003990:	ffffe097          	auipc	ra,0xffffe
    80003994:	61c080e7          	jalr	1564(ra) # 80001fac <mycpu>
    80003998:	07852783          	lw	a5,120(a0)
    8000399c:	02078663          	beqz	a5,800039c8 <push_on+0x5c>
    800039a0:	ffffe097          	auipc	ra,0xffffe
    800039a4:	60c080e7          	jalr	1548(ra) # 80001fac <mycpu>
    800039a8:	07852783          	lw	a5,120(a0)
    800039ac:	01813083          	ld	ra,24(sp)
    800039b0:	01013403          	ld	s0,16(sp)
    800039b4:	0017879b          	addiw	a5,a5,1
    800039b8:	06f52c23          	sw	a5,120(a0)
    800039bc:	00813483          	ld	s1,8(sp)
    800039c0:	02010113          	addi	sp,sp,32
    800039c4:	00008067          	ret
    800039c8:	0014d493          	srli	s1,s1,0x1
    800039cc:	ffffe097          	auipc	ra,0xffffe
    800039d0:	5e0080e7          	jalr	1504(ra) # 80001fac <mycpu>
    800039d4:	0014f493          	andi	s1,s1,1
    800039d8:	06952e23          	sw	s1,124(a0)
    800039dc:	fc5ff06f          	j	800039a0 <push_on+0x34>

00000000800039e0 <pop_on>:
    800039e0:	ff010113          	addi	sp,sp,-16
    800039e4:	00813023          	sd	s0,0(sp)
    800039e8:	00113423          	sd	ra,8(sp)
    800039ec:	01010413          	addi	s0,sp,16
    800039f0:	ffffe097          	auipc	ra,0xffffe
    800039f4:	5bc080e7          	jalr	1468(ra) # 80001fac <mycpu>
    800039f8:	100027f3          	csrr	a5,sstatus
    800039fc:	0027f793          	andi	a5,a5,2
    80003a00:	04078463          	beqz	a5,80003a48 <pop_on+0x68>
    80003a04:	07852783          	lw	a5,120(a0)
    80003a08:	02f05863          	blez	a5,80003a38 <pop_on+0x58>
    80003a0c:	fff7879b          	addiw	a5,a5,-1
    80003a10:	06f52c23          	sw	a5,120(a0)
    80003a14:	07853783          	ld	a5,120(a0)
    80003a18:	00079863          	bnez	a5,80003a28 <pop_on+0x48>
    80003a1c:	100027f3          	csrr	a5,sstatus
    80003a20:	ffd7f793          	andi	a5,a5,-3
    80003a24:	10079073          	csrw	sstatus,a5
    80003a28:	00813083          	ld	ra,8(sp)
    80003a2c:	00013403          	ld	s0,0(sp)
    80003a30:	01010113          	addi	sp,sp,16
    80003a34:	00008067          	ret
    80003a38:	00001517          	auipc	a0,0x1
    80003a3c:	90050513          	addi	a0,a0,-1792 # 80004338 <digits+0x70>
    80003a40:	fffff097          	auipc	ra,0xfffff
    80003a44:	f2c080e7          	jalr	-212(ra) # 8000296c <panic>
    80003a48:	00001517          	auipc	a0,0x1
    80003a4c:	8d050513          	addi	a0,a0,-1840 # 80004318 <digits+0x50>
    80003a50:	fffff097          	auipc	ra,0xfffff
    80003a54:	f1c080e7          	jalr	-228(ra) # 8000296c <panic>

0000000080003a58 <__memset>:
    80003a58:	ff010113          	addi	sp,sp,-16
    80003a5c:	00813423          	sd	s0,8(sp)
    80003a60:	01010413          	addi	s0,sp,16
    80003a64:	1a060e63          	beqz	a2,80003c20 <__memset+0x1c8>
    80003a68:	40a007b3          	neg	a5,a0
    80003a6c:	0077f793          	andi	a5,a5,7
    80003a70:	00778693          	addi	a3,a5,7
    80003a74:	00b00813          	li	a6,11
    80003a78:	0ff5f593          	andi	a1,a1,255
    80003a7c:	fff6071b          	addiw	a4,a2,-1
    80003a80:	1b06e663          	bltu	a3,a6,80003c2c <__memset+0x1d4>
    80003a84:	1cd76463          	bltu	a4,a3,80003c4c <__memset+0x1f4>
    80003a88:	1a078e63          	beqz	a5,80003c44 <__memset+0x1ec>
    80003a8c:	00b50023          	sb	a1,0(a0)
    80003a90:	00100713          	li	a4,1
    80003a94:	1ae78463          	beq	a5,a4,80003c3c <__memset+0x1e4>
    80003a98:	00b500a3          	sb	a1,1(a0)
    80003a9c:	00200713          	li	a4,2
    80003aa0:	1ae78a63          	beq	a5,a4,80003c54 <__memset+0x1fc>
    80003aa4:	00b50123          	sb	a1,2(a0)
    80003aa8:	00300713          	li	a4,3
    80003aac:	18e78463          	beq	a5,a4,80003c34 <__memset+0x1dc>
    80003ab0:	00b501a3          	sb	a1,3(a0)
    80003ab4:	00400713          	li	a4,4
    80003ab8:	1ae78263          	beq	a5,a4,80003c5c <__memset+0x204>
    80003abc:	00b50223          	sb	a1,4(a0)
    80003ac0:	00500713          	li	a4,5
    80003ac4:	1ae78063          	beq	a5,a4,80003c64 <__memset+0x20c>
    80003ac8:	00b502a3          	sb	a1,5(a0)
    80003acc:	00700713          	li	a4,7
    80003ad0:	18e79e63          	bne	a5,a4,80003c6c <__memset+0x214>
    80003ad4:	00b50323          	sb	a1,6(a0)
    80003ad8:	00700e93          	li	t4,7
    80003adc:	00859713          	slli	a4,a1,0x8
    80003ae0:	00e5e733          	or	a4,a1,a4
    80003ae4:	01059e13          	slli	t3,a1,0x10
    80003ae8:	01c76e33          	or	t3,a4,t3
    80003aec:	01859313          	slli	t1,a1,0x18
    80003af0:	006e6333          	or	t1,t3,t1
    80003af4:	02059893          	slli	a7,a1,0x20
    80003af8:	40f60e3b          	subw	t3,a2,a5
    80003afc:	011368b3          	or	a7,t1,a7
    80003b00:	02859813          	slli	a6,a1,0x28
    80003b04:	0108e833          	or	a6,a7,a6
    80003b08:	03059693          	slli	a3,a1,0x30
    80003b0c:	003e589b          	srliw	a7,t3,0x3
    80003b10:	00d866b3          	or	a3,a6,a3
    80003b14:	03859713          	slli	a4,a1,0x38
    80003b18:	00389813          	slli	a6,a7,0x3
    80003b1c:	00f507b3          	add	a5,a0,a5
    80003b20:	00e6e733          	or	a4,a3,a4
    80003b24:	000e089b          	sext.w	a7,t3
    80003b28:	00f806b3          	add	a3,a6,a5
    80003b2c:	00e7b023          	sd	a4,0(a5)
    80003b30:	00878793          	addi	a5,a5,8
    80003b34:	fed79ce3          	bne	a5,a3,80003b2c <__memset+0xd4>
    80003b38:	ff8e7793          	andi	a5,t3,-8
    80003b3c:	0007871b          	sext.w	a4,a5
    80003b40:	01d787bb          	addw	a5,a5,t4
    80003b44:	0ce88e63          	beq	a7,a4,80003c20 <__memset+0x1c8>
    80003b48:	00f50733          	add	a4,a0,a5
    80003b4c:	00b70023          	sb	a1,0(a4)
    80003b50:	0017871b          	addiw	a4,a5,1
    80003b54:	0cc77663          	bgeu	a4,a2,80003c20 <__memset+0x1c8>
    80003b58:	00e50733          	add	a4,a0,a4
    80003b5c:	00b70023          	sb	a1,0(a4)
    80003b60:	0027871b          	addiw	a4,a5,2
    80003b64:	0ac77e63          	bgeu	a4,a2,80003c20 <__memset+0x1c8>
    80003b68:	00e50733          	add	a4,a0,a4
    80003b6c:	00b70023          	sb	a1,0(a4)
    80003b70:	0037871b          	addiw	a4,a5,3
    80003b74:	0ac77663          	bgeu	a4,a2,80003c20 <__memset+0x1c8>
    80003b78:	00e50733          	add	a4,a0,a4
    80003b7c:	00b70023          	sb	a1,0(a4)
    80003b80:	0047871b          	addiw	a4,a5,4
    80003b84:	08c77e63          	bgeu	a4,a2,80003c20 <__memset+0x1c8>
    80003b88:	00e50733          	add	a4,a0,a4
    80003b8c:	00b70023          	sb	a1,0(a4)
    80003b90:	0057871b          	addiw	a4,a5,5
    80003b94:	08c77663          	bgeu	a4,a2,80003c20 <__memset+0x1c8>
    80003b98:	00e50733          	add	a4,a0,a4
    80003b9c:	00b70023          	sb	a1,0(a4)
    80003ba0:	0067871b          	addiw	a4,a5,6
    80003ba4:	06c77e63          	bgeu	a4,a2,80003c20 <__memset+0x1c8>
    80003ba8:	00e50733          	add	a4,a0,a4
    80003bac:	00b70023          	sb	a1,0(a4)
    80003bb0:	0077871b          	addiw	a4,a5,7
    80003bb4:	06c77663          	bgeu	a4,a2,80003c20 <__memset+0x1c8>
    80003bb8:	00e50733          	add	a4,a0,a4
    80003bbc:	00b70023          	sb	a1,0(a4)
    80003bc0:	0087871b          	addiw	a4,a5,8
    80003bc4:	04c77e63          	bgeu	a4,a2,80003c20 <__memset+0x1c8>
    80003bc8:	00e50733          	add	a4,a0,a4
    80003bcc:	00b70023          	sb	a1,0(a4)
    80003bd0:	0097871b          	addiw	a4,a5,9
    80003bd4:	04c77663          	bgeu	a4,a2,80003c20 <__memset+0x1c8>
    80003bd8:	00e50733          	add	a4,a0,a4
    80003bdc:	00b70023          	sb	a1,0(a4)
    80003be0:	00a7871b          	addiw	a4,a5,10
    80003be4:	02c77e63          	bgeu	a4,a2,80003c20 <__memset+0x1c8>
    80003be8:	00e50733          	add	a4,a0,a4
    80003bec:	00b70023          	sb	a1,0(a4)
    80003bf0:	00b7871b          	addiw	a4,a5,11
    80003bf4:	02c77663          	bgeu	a4,a2,80003c20 <__memset+0x1c8>
    80003bf8:	00e50733          	add	a4,a0,a4
    80003bfc:	00b70023          	sb	a1,0(a4)
    80003c00:	00c7871b          	addiw	a4,a5,12
    80003c04:	00c77e63          	bgeu	a4,a2,80003c20 <__memset+0x1c8>
    80003c08:	00e50733          	add	a4,a0,a4
    80003c0c:	00b70023          	sb	a1,0(a4)
    80003c10:	00d7879b          	addiw	a5,a5,13
    80003c14:	00c7f663          	bgeu	a5,a2,80003c20 <__memset+0x1c8>
    80003c18:	00f507b3          	add	a5,a0,a5
    80003c1c:	00b78023          	sb	a1,0(a5)
    80003c20:	00813403          	ld	s0,8(sp)
    80003c24:	01010113          	addi	sp,sp,16
    80003c28:	00008067          	ret
    80003c2c:	00b00693          	li	a3,11
    80003c30:	e55ff06f          	j	80003a84 <__memset+0x2c>
    80003c34:	00300e93          	li	t4,3
    80003c38:	ea5ff06f          	j	80003adc <__memset+0x84>
    80003c3c:	00100e93          	li	t4,1
    80003c40:	e9dff06f          	j	80003adc <__memset+0x84>
    80003c44:	00000e93          	li	t4,0
    80003c48:	e95ff06f          	j	80003adc <__memset+0x84>
    80003c4c:	00000793          	li	a5,0
    80003c50:	ef9ff06f          	j	80003b48 <__memset+0xf0>
    80003c54:	00200e93          	li	t4,2
    80003c58:	e85ff06f          	j	80003adc <__memset+0x84>
    80003c5c:	00400e93          	li	t4,4
    80003c60:	e7dff06f          	j	80003adc <__memset+0x84>
    80003c64:	00500e93          	li	t4,5
    80003c68:	e75ff06f          	j	80003adc <__memset+0x84>
    80003c6c:	00600e93          	li	t4,6
    80003c70:	e6dff06f          	j	80003adc <__memset+0x84>

0000000080003c74 <__memmove>:
    80003c74:	ff010113          	addi	sp,sp,-16
    80003c78:	00813423          	sd	s0,8(sp)
    80003c7c:	01010413          	addi	s0,sp,16
    80003c80:	0e060863          	beqz	a2,80003d70 <__memmove+0xfc>
    80003c84:	fff6069b          	addiw	a3,a2,-1
    80003c88:	0006881b          	sext.w	a6,a3
    80003c8c:	0ea5e863          	bltu	a1,a0,80003d7c <__memmove+0x108>
    80003c90:	00758713          	addi	a4,a1,7
    80003c94:	00a5e7b3          	or	a5,a1,a0
    80003c98:	40a70733          	sub	a4,a4,a0
    80003c9c:	0077f793          	andi	a5,a5,7
    80003ca0:	00f73713          	sltiu	a4,a4,15
    80003ca4:	00174713          	xori	a4,a4,1
    80003ca8:	0017b793          	seqz	a5,a5
    80003cac:	00e7f7b3          	and	a5,a5,a4
    80003cb0:	10078863          	beqz	a5,80003dc0 <__memmove+0x14c>
    80003cb4:	00900793          	li	a5,9
    80003cb8:	1107f463          	bgeu	a5,a6,80003dc0 <__memmove+0x14c>
    80003cbc:	0036581b          	srliw	a6,a2,0x3
    80003cc0:	fff8081b          	addiw	a6,a6,-1
    80003cc4:	02081813          	slli	a6,a6,0x20
    80003cc8:	01d85893          	srli	a7,a6,0x1d
    80003ccc:	00858813          	addi	a6,a1,8
    80003cd0:	00058793          	mv	a5,a1
    80003cd4:	00050713          	mv	a4,a0
    80003cd8:	01088833          	add	a6,a7,a6
    80003cdc:	0007b883          	ld	a7,0(a5)
    80003ce0:	00878793          	addi	a5,a5,8
    80003ce4:	00870713          	addi	a4,a4,8
    80003ce8:	ff173c23          	sd	a7,-8(a4)
    80003cec:	ff0798e3          	bne	a5,a6,80003cdc <__memmove+0x68>
    80003cf0:	ff867713          	andi	a4,a2,-8
    80003cf4:	02071793          	slli	a5,a4,0x20
    80003cf8:	0207d793          	srli	a5,a5,0x20
    80003cfc:	00f585b3          	add	a1,a1,a5
    80003d00:	40e686bb          	subw	a3,a3,a4
    80003d04:	00f507b3          	add	a5,a0,a5
    80003d08:	06e60463          	beq	a2,a4,80003d70 <__memmove+0xfc>
    80003d0c:	0005c703          	lbu	a4,0(a1)
    80003d10:	00e78023          	sb	a4,0(a5)
    80003d14:	04068e63          	beqz	a3,80003d70 <__memmove+0xfc>
    80003d18:	0015c603          	lbu	a2,1(a1)
    80003d1c:	00100713          	li	a4,1
    80003d20:	00c780a3          	sb	a2,1(a5)
    80003d24:	04e68663          	beq	a3,a4,80003d70 <__memmove+0xfc>
    80003d28:	0025c603          	lbu	a2,2(a1)
    80003d2c:	00200713          	li	a4,2
    80003d30:	00c78123          	sb	a2,2(a5)
    80003d34:	02e68e63          	beq	a3,a4,80003d70 <__memmove+0xfc>
    80003d38:	0035c603          	lbu	a2,3(a1)
    80003d3c:	00300713          	li	a4,3
    80003d40:	00c781a3          	sb	a2,3(a5)
    80003d44:	02e68663          	beq	a3,a4,80003d70 <__memmove+0xfc>
    80003d48:	0045c603          	lbu	a2,4(a1)
    80003d4c:	00400713          	li	a4,4
    80003d50:	00c78223          	sb	a2,4(a5)
    80003d54:	00e68e63          	beq	a3,a4,80003d70 <__memmove+0xfc>
    80003d58:	0055c603          	lbu	a2,5(a1)
    80003d5c:	00500713          	li	a4,5
    80003d60:	00c782a3          	sb	a2,5(a5)
    80003d64:	00e68663          	beq	a3,a4,80003d70 <__memmove+0xfc>
    80003d68:	0065c703          	lbu	a4,6(a1)
    80003d6c:	00e78323          	sb	a4,6(a5)
    80003d70:	00813403          	ld	s0,8(sp)
    80003d74:	01010113          	addi	sp,sp,16
    80003d78:	00008067          	ret
    80003d7c:	02061713          	slli	a4,a2,0x20
    80003d80:	02075713          	srli	a4,a4,0x20
    80003d84:	00e587b3          	add	a5,a1,a4
    80003d88:	f0f574e3          	bgeu	a0,a5,80003c90 <__memmove+0x1c>
    80003d8c:	02069613          	slli	a2,a3,0x20
    80003d90:	02065613          	srli	a2,a2,0x20
    80003d94:	fff64613          	not	a2,a2
    80003d98:	00e50733          	add	a4,a0,a4
    80003d9c:	00c78633          	add	a2,a5,a2
    80003da0:	fff7c683          	lbu	a3,-1(a5)
    80003da4:	fff78793          	addi	a5,a5,-1
    80003da8:	fff70713          	addi	a4,a4,-1
    80003dac:	00d70023          	sb	a3,0(a4)
    80003db0:	fec798e3          	bne	a5,a2,80003da0 <__memmove+0x12c>
    80003db4:	00813403          	ld	s0,8(sp)
    80003db8:	01010113          	addi	sp,sp,16
    80003dbc:	00008067          	ret
    80003dc0:	02069713          	slli	a4,a3,0x20
    80003dc4:	02075713          	srli	a4,a4,0x20
    80003dc8:	00170713          	addi	a4,a4,1
    80003dcc:	00e50733          	add	a4,a0,a4
    80003dd0:	00050793          	mv	a5,a0
    80003dd4:	0005c683          	lbu	a3,0(a1)
    80003dd8:	00178793          	addi	a5,a5,1
    80003ddc:	00158593          	addi	a1,a1,1
    80003de0:	fed78fa3          	sb	a3,-1(a5)
    80003de4:	fee798e3          	bne	a5,a4,80003dd4 <__memmove+0x160>
    80003de8:	f89ff06f          	j	80003d70 <__memmove+0xfc>

0000000080003dec <__putc>:
    80003dec:	fe010113          	addi	sp,sp,-32
    80003df0:	00813823          	sd	s0,16(sp)
    80003df4:	00113c23          	sd	ra,24(sp)
    80003df8:	02010413          	addi	s0,sp,32
    80003dfc:	00050793          	mv	a5,a0
    80003e00:	fef40593          	addi	a1,s0,-17
    80003e04:	00100613          	li	a2,1
    80003e08:	00000513          	li	a0,0
    80003e0c:	fef407a3          	sb	a5,-17(s0)
    80003e10:	fffff097          	auipc	ra,0xfffff
    80003e14:	b3c080e7          	jalr	-1220(ra) # 8000294c <console_write>
    80003e18:	01813083          	ld	ra,24(sp)
    80003e1c:	01013403          	ld	s0,16(sp)
    80003e20:	02010113          	addi	sp,sp,32
    80003e24:	00008067          	ret

0000000080003e28 <__getc>:
    80003e28:	fe010113          	addi	sp,sp,-32
    80003e2c:	00813823          	sd	s0,16(sp)
    80003e30:	00113c23          	sd	ra,24(sp)
    80003e34:	02010413          	addi	s0,sp,32
    80003e38:	fe840593          	addi	a1,s0,-24
    80003e3c:	00100613          	li	a2,1
    80003e40:	00000513          	li	a0,0
    80003e44:	fffff097          	auipc	ra,0xfffff
    80003e48:	ae8080e7          	jalr	-1304(ra) # 8000292c <console_read>
    80003e4c:	fe844503          	lbu	a0,-24(s0)
    80003e50:	01813083          	ld	ra,24(sp)
    80003e54:	01013403          	ld	s0,16(sp)
    80003e58:	02010113          	addi	sp,sp,32
    80003e5c:	00008067          	ret

0000000080003e60 <console_handler>:
    80003e60:	fe010113          	addi	sp,sp,-32
    80003e64:	00813823          	sd	s0,16(sp)
    80003e68:	00113c23          	sd	ra,24(sp)
    80003e6c:	00913423          	sd	s1,8(sp)
    80003e70:	02010413          	addi	s0,sp,32
    80003e74:	14202773          	csrr	a4,scause
    80003e78:	100027f3          	csrr	a5,sstatus
    80003e7c:	0027f793          	andi	a5,a5,2
    80003e80:	06079e63          	bnez	a5,80003efc <console_handler+0x9c>
    80003e84:	00074c63          	bltz	a4,80003e9c <console_handler+0x3c>
    80003e88:	01813083          	ld	ra,24(sp)
    80003e8c:	01013403          	ld	s0,16(sp)
    80003e90:	00813483          	ld	s1,8(sp)
    80003e94:	02010113          	addi	sp,sp,32
    80003e98:	00008067          	ret
    80003e9c:	0ff77713          	andi	a4,a4,255
    80003ea0:	00900793          	li	a5,9
    80003ea4:	fef712e3          	bne	a4,a5,80003e88 <console_handler+0x28>
    80003ea8:	ffffe097          	auipc	ra,0xffffe
    80003eac:	6dc080e7          	jalr	1756(ra) # 80002584 <plic_claim>
    80003eb0:	00a00793          	li	a5,10
    80003eb4:	00050493          	mv	s1,a0
    80003eb8:	02f50c63          	beq	a0,a5,80003ef0 <console_handler+0x90>
    80003ebc:	fc0506e3          	beqz	a0,80003e88 <console_handler+0x28>
    80003ec0:	00050593          	mv	a1,a0
    80003ec4:	00000517          	auipc	a0,0x0
    80003ec8:	37c50513          	addi	a0,a0,892 # 80004240 <_ZZ12printIntegermE6digits+0x220>
    80003ecc:	fffff097          	auipc	ra,0xfffff
    80003ed0:	afc080e7          	jalr	-1284(ra) # 800029c8 <__printf>
    80003ed4:	01013403          	ld	s0,16(sp)
    80003ed8:	01813083          	ld	ra,24(sp)
    80003edc:	00048513          	mv	a0,s1
    80003ee0:	00813483          	ld	s1,8(sp)
    80003ee4:	02010113          	addi	sp,sp,32
    80003ee8:	ffffe317          	auipc	t1,0xffffe
    80003eec:	6d430067          	jr	1748(t1) # 800025bc <plic_complete>
    80003ef0:	fffff097          	auipc	ra,0xfffff
    80003ef4:	3e0080e7          	jalr	992(ra) # 800032d0 <uartintr>
    80003ef8:	fddff06f          	j	80003ed4 <console_handler+0x74>
    80003efc:	00000517          	auipc	a0,0x0
    80003f00:	44450513          	addi	a0,a0,1092 # 80004340 <digits+0x78>
    80003f04:	fffff097          	auipc	ra,0xfffff
    80003f08:	a68080e7          	jalr	-1432(ra) # 8000296c <panic>
	...
