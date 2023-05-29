
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00006117          	auipc	sp,0x6
    80000004:	a3813103          	ld	sp,-1480(sp) # 80005a38 <_GLOBAL_OFFSET_TABLE_+0x10>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	7d9010ef          	jal	ra,80001ff4 <start>

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
    80001188:	5b8000ef          	jal	ra,80001740 <interruptRoutine>
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
    80001244:	00655313          	srli	t1,a0,0x6
    80001248:	03f57513          	andi	a0,a0,63
    8000124c:	00050463          	beqz	a0,80001254 <_Z9mem_allocm+0x1c>
    80001250:	00100513          	li	a0,1
    80001254:	00a30333          	add	t1,t1,a0
	__asm__ volatile("mv a1, %[size]": :[size] "r"(size):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001258:	00030593          	mv	a1,t1
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
    80001284:	00050313          	mv	t1,a0
	__asm__ volatile("mv a1, %[ptr]": :[ptr] "r"(ptr):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001288:	00030593          	mv	a1,t1
    8000128c:	00200793          	li	a5,2
    80001290:	00078513          	mv	a0,a5
	__asm__ volatile("ecall");
    80001294:	00000073          	ecall
	Riscv::loadOpCode(0x02);

	scall();

	int status;
	__asm__ volatile("mv %[status], a0":[status] "=r"(status));
    80001298:	00050513          	mv	a0,a0
	return status;
}
    8000129c:	0005051b          	sext.w	a0,a0
    800012a0:	00813403          	ld	s0,8(sp)
    800012a4:	01010113          	addi	sp,sp,16
    800012a8:	00008067          	ret

00000000800012ac <_Z13thread_createPP3TCBPFvPvES2_>:

int thread_create(thread_t* handle, void (* start_routine)(void*), void* arg) {
    800012ac:	fd010113          	addi	sp,sp,-48
    800012b0:	02113423          	sd	ra,40(sp)
    800012b4:	02813023          	sd	s0,32(sp)
    800012b8:	00913c23          	sd	s1,24(sp)
    800012bc:	01213823          	sd	s2,16(sp)
    800012c0:	01313423          	sd	s3,8(sp)
    800012c4:	03010413          	addi	s0,sp,48
    800012c8:	00050913          	mv	s2,a0
    800012cc:	00058493          	mv	s1,a1
    800012d0:	00060993          	mv	s3,a2
//	__asm__ volatile("mv s1, a1");
//	__asm__ volatile("mv s2, a2");
//	__asm__ volatile("mv s3, a3");
	uint64* stack = (start_routine != nullptr ? (uint64*)MemoryAllocator::kmalloc(DEFAULT_STACK_SIZE) : nullptr);
    800012d4:	04058863          	beqz	a1,80001324 <_Z13thread_createPP3TCBPFvPvES2_+0x78>
    800012d8:	00001537          	lui	a0,0x1
    800012dc:	00001097          	auipc	ra,0x1
    800012e0:	93c080e7          	jalr	-1732(ra) # 80001c18 <_ZN15MemoryAllocator7kmallocEm>
    800012e4:	00050313          	mv	t1,a0
	__asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800012e8:	00030713          	mv	a4,t1
//	__asm__ volatile("mv a3, s3");
//	__asm__ volatile("mv a2, s2");
//	__asm__ volatile("mv a1, s1");
	__asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800012ec:	00098693          	mv	a3,s3
	__asm__ volatile("mv a2, %[function]": :[function] "r"(start_routine):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800012f0:	00048613          	mv	a2,s1
	__asm__ volatile("mv a1, %[handle]": :[handle] "r"(handle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800012f4:	00090593          	mv	a1,s2

	__asm__ volatile("li a0, 0x11");
    800012f8:	01100513          	li	a0,17
	__asm__ volatile("ecall");
    800012fc:	00000073          	ecall
	//Riscv::loadOpCode(0x11);

	scall();

	int status;
	__asm__ volatile("mv %[status], a0":[status] "=r"(status));
    80001300:	00050513          	mv	a0,a0
	return status;
}
    80001304:	0005051b          	sext.w	a0,a0
    80001308:	02813083          	ld	ra,40(sp)
    8000130c:	02013403          	ld	s0,32(sp)
    80001310:	01813483          	ld	s1,24(sp)
    80001314:	01013903          	ld	s2,16(sp)
    80001318:	00813983          	ld	s3,8(sp)
    8000131c:	03010113          	addi	sp,sp,48
    80001320:	00008067          	ret
	uint64* stack = (start_routine != nullptr ? (uint64*)MemoryAllocator::kmalloc(DEFAULT_STACK_SIZE) : nullptr);
    80001324:	00000313          	li	t1,0
    80001328:	fc1ff06f          	j	800012e8 <_Z13thread_createPP3TCBPFvPvES2_+0x3c>

000000008000132c <_Z11thread_exitv>:

int thread_exit() {
    8000132c:	ff010113          	addi	sp,sp,-16
    80001330:	00813423          	sd	s0,8(sp)
    80001334:	01010413          	addi	s0,sp,16
	return 0;
}
    80001338:	00000513          	li	a0,0
    8000133c:	00813403          	ld	s0,8(sp)
    80001340:	01010113          	addi	sp,sp,16
    80001344:	00008067          	ret

0000000080001348 <_Z15thread_dispatchv>:

void thread_dispatch() {
    80001348:	ff010113          	addi	sp,sp,-16
    8000134c:	00813423          	sd	s0,8(sp)
    80001350:	01010413          	addi	s0,sp,16

}
    80001354:	00813403          	ld	s0,8(sp)
    80001358:	01010113          	addi	sp,sp,16
    8000135c:	00008067          	ret

0000000080001360 <_Z11thread_joinP3TCB>:

void thread_join(thread_t handle) {
    80001360:	ff010113          	addi	sp,sp,-16
    80001364:	00813423          	sd	s0,8(sp)
    80001368:	01010413          	addi	s0,sp,16

}
    8000136c:	00813403          	ld	s0,8(sp)
    80001370:	01010113          	addi	sp,sp,16
    80001374:	00008067          	ret

0000000080001378 <_Z10time_sleepm>:

int time_sleep(time_t) {
    80001378:	ff010113          	addi	sp,sp,-16
    8000137c:	00813423          	sd	s0,8(sp)
    80001380:	01010413          	addi	s0,sp,16
	return 0;
}
    80001384:	00000513          	li	a0,0
    80001388:	00813403          	ld	s0,8(sp)
    8000138c:	01010113          	addi	sp,sp,16
    80001390:	00008067          	ret

0000000080001394 <_Z8sem_openPP4_semj>:

int sem_open(sem_t* handle, unsigned int init) {
    80001394:	ff010113          	addi	sp,sp,-16
    80001398:	00813423          	sd	s0,8(sp)
    8000139c:	01010413          	addi	s0,sp,16
	return 0;
}
    800013a0:	00000513          	li	a0,0
    800013a4:	00813403          	ld	s0,8(sp)
    800013a8:	01010113          	addi	sp,sp,16
    800013ac:	00008067          	ret

00000000800013b0 <_Z9sem_closeP4_sem>:

int sem_close(sem_t handle) {
    800013b0:	ff010113          	addi	sp,sp,-16
    800013b4:	00813423          	sd	s0,8(sp)
    800013b8:	01010413          	addi	s0,sp,16
	return 0;
}
    800013bc:	00000513          	li	a0,0
    800013c0:	00813403          	ld	s0,8(sp)
    800013c4:	01010113          	addi	sp,sp,16
    800013c8:	00008067          	ret

00000000800013cc <_Z8sem_waitP4_sem>:

int sem_wait(sem_t id) {
    800013cc:	ff010113          	addi	sp,sp,-16
    800013d0:	00813423          	sd	s0,8(sp)
    800013d4:	01010413          	addi	s0,sp,16
	return 0;
}
    800013d8:	00000513          	li	a0,0
    800013dc:	00813403          	ld	s0,8(sp)
    800013e0:	01010113          	addi	sp,sp,16
    800013e4:	00008067          	ret

00000000800013e8 <_Z10sem_signalP4_sem>:

int sem_signal(sem_t id) {
    800013e8:	ff010113          	addi	sp,sp,-16
    800013ec:	00813423          	sd	s0,8(sp)
    800013f0:	01010413          	addi	s0,sp,16
	return 0;
}
    800013f4:	00000513          	li	a0,0
    800013f8:	00813403          	ld	s0,8(sp)
    800013fc:	01010113          	addi	sp,sp,16
    80001400:	00008067          	ret

0000000080001404 <_Z4getcv>:

char getc() {
    80001404:	ff010113          	addi	sp,sp,-16
    80001408:	00813423          	sd	s0,8(sp)
    8000140c:	01010413          	addi	s0,sp,16
	return 0;
}
    80001410:	00000513          	li	a0,0
    80001414:	00813403          	ld	s0,8(sp)
    80001418:	01010113          	addi	sp,sp,16
    8000141c:	00008067          	ret

0000000080001420 <_Z4putcc>:

void putc(char) {
    80001420:	ff010113          	addi	sp,sp,-16
    80001424:	00813423          	sd	s0,8(sp)
    80001428:	01010413          	addi	s0,sp,16

}
    8000142c:	00813403          	ld	s0,8(sp)
    80001430:	01010113          	addi	sp,sp,16
    80001434:	00008067          	ret

0000000080001438 <_Z11printStringPKc>:
#include "../h/helper.hpp"
#include "../lib/console.h"
#include "../h/Riscv.hpp"

void printString(char const *string) {
    80001438:	fe010113          	addi	sp,sp,-32
    8000143c:	00113c23          	sd	ra,24(sp)
    80001440:	00813823          	sd	s0,16(sp)
    80001444:	00913423          	sd	s1,8(sp)
    80001448:	02010413          	addi	s0,sp,32
    8000144c:	00050493          	mv	s1,a0
    while (*string != '\0') {
    80001450:	0004c503          	lbu	a0,0(s1)
    80001454:	00050a63          	beqz	a0,80001468 <_Z11printStringPKc+0x30>
        __putc(*string);
    80001458:	00003097          	auipc	ra,0x3
    8000145c:	c64080e7          	jalr	-924(ra) # 800040bc <__putc>
        string++;
    80001460:	00148493          	addi	s1,s1,1
    while (*string != '\0') {
    80001464:	fedff06f          	j	80001450 <_Z11printStringPKc+0x18>
    }
}
    80001468:	01813083          	ld	ra,24(sp)
    8000146c:	01013403          	ld	s0,16(sp)
    80001470:	00813483          	ld	s1,8(sp)
    80001474:	02010113          	addi	sp,sp,32
    80001478:	00008067          	ret

000000008000147c <_Z7printlnPKc>:

void println(char const *string) {
    8000147c:	ff010113          	addi	sp,sp,-16
    80001480:	00113423          	sd	ra,8(sp)
    80001484:	00813023          	sd	s0,0(sp)
    80001488:	01010413          	addi	s0,sp,16
    printString(string);
    8000148c:	00000097          	auipc	ra,0x0
    80001490:	fac080e7          	jalr	-84(ra) # 80001438 <_Z11printStringPKc>
    __putc('\n');
    80001494:	00a00513          	li	a0,10
    80001498:	00003097          	auipc	ra,0x3
    8000149c:	c24080e7          	jalr	-988(ra) # 800040bc <__putc>
}
    800014a0:	00813083          	ld	ra,8(sp)
    800014a4:	00013403          	ld	s0,0(sp)
    800014a8:	01010113          	addi	sp,sp,16
    800014ac:	00008067          	ret

00000000800014b0 <_Z12printIntegerm>:

void printInteger(uint64 integer) {
    800014b0:	fd010113          	addi	sp,sp,-48
    800014b4:	02113423          	sd	ra,40(sp)
    800014b8:	02813023          	sd	s0,32(sp)
    800014bc:	00913c23          	sd	s1,24(sp)
    800014c0:	03010413          	addi	s0,sp,48
    neg = 0;
    if (integer < 0) {
        neg = 1;
        x = -integer;
    } else {
        x = integer;
    800014c4:	0005051b          	sext.w	a0,a0
    }

    i = 0;
    800014c8:	00000493          	li	s1,0
    do {
        buf[i++] = digits[x % 10];
    800014cc:	00a00613          	li	a2,10
    800014d0:	02c5773b          	remuw	a4,a0,a2
    800014d4:	02071693          	slli	a3,a4,0x20
    800014d8:	0206d693          	srli	a3,a3,0x20
    800014dc:	00004717          	auipc	a4,0x4
    800014e0:	b4470713          	addi	a4,a4,-1212 # 80005020 <_ZZ12printIntegermE6digits>
    800014e4:	00d70733          	add	a4,a4,a3
    800014e8:	00074703          	lbu	a4,0(a4)
    800014ec:	fe040693          	addi	a3,s0,-32
    800014f0:	009687b3          	add	a5,a3,s1
    800014f4:	0014849b          	addiw	s1,s1,1
    800014f8:	fee78823          	sb	a4,-16(a5)
    } while ((x /= 10) != 0);
    800014fc:	0005071b          	sext.w	a4,a0
    80001500:	02c5553b          	divuw	a0,a0,a2
    80001504:	00900793          	li	a5,9
    80001508:	fce7e2e3          	bltu	a5,a4,800014cc <_Z12printIntegerm+0x1c>
    if (neg) buf[i++] = '-';

    while (--i >= 0) {
    8000150c:	fff4849b          	addiw	s1,s1,-1
    80001510:	0004ce63          	bltz	s1,8000152c <_Z12printIntegerm+0x7c>
        __putc(buf[i]);
    80001514:	fe040793          	addi	a5,s0,-32
    80001518:	009787b3          	add	a5,a5,s1
    8000151c:	ff07c503          	lbu	a0,-16(a5)
    80001520:	00003097          	auipc	ra,0x3
    80001524:	b9c080e7          	jalr	-1124(ra) # 800040bc <__putc>
    80001528:	fe5ff06f          	j	8000150c <_Z12printIntegerm+0x5c>
    }
}
    8000152c:	02813083          	ld	ra,40(sp)
    80001530:	02013403          	ld	s0,32(sp)
    80001534:	01813483          	ld	s1,24(sp)
    80001538:	03010113          	addi	sp,sp,48
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
    8000156c:	00004797          	auipc	a5,0x4
    80001570:	53478793          	addi	a5,a5,1332 # 80005aa0 <_ZN9Scheduler12readyThreadsE>
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
    800015a4:	424080e7          	jalr	1060(ra) # 800019c4 <_Znwm>
		Elem(T* data, Elem* next) : data(data), next(next) {}
    800015a8:	00953023          	sd	s1,0(a0) # 1000 <_entry-0x7ffff000>
    800015ac:	00053423          	sd	zero,8(a0)
		if (tail) {
    800015b0:	00004797          	auipc	a5,0x4
    800015b4:	4f87b783          	ld	a5,1272(a5) # 80005aa8 <_ZN9Scheduler12readyThreadsE+0x8>
    800015b8:	02078c63          	beqz	a5,800015f0 <_ZN9Scheduler3putEP3TCB+0x6c>
			tail->next = elem;
    800015bc:	00a7b423          	sd	a0,8(a5)
			tail = elem;
    800015c0:	00004797          	auipc	a5,0x4
    800015c4:	4ea7b423          	sd	a0,1256(a5) # 80005aa8 <_ZN9Scheduler12readyThreadsE+0x8>
		} else {
			head = tail = elem;
		}
		numOfElements++;
    800015c8:	00004717          	auipc	a4,0x4
    800015cc:	4d870713          	addi	a4,a4,1240 # 80005aa0 <_ZN9Scheduler12readyThreadsE>
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
    800015f0:	00004797          	auipc	a5,0x4
    800015f4:	4b078793          	addi	a5,a5,1200 # 80005aa0 <_ZN9Scheduler12readyThreadsE>
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
    80001618:	00004517          	auipc	a0,0x4
    8000161c:	48853503          	ld	a0,1160(a0) # 80005aa0 <_ZN9Scheduler12readyThreadsE>
    80001620:	04050c63          	beqz	a0,80001678 <_ZN9Scheduler3getEv+0x74>

		Elem* elem = head;
		head = head->next;
    80001624:	00853783          	ld	a5,8(a0)
    80001628:	00004717          	auipc	a4,0x4
    8000162c:	46f73c23          	sd	a5,1144(a4) # 80005aa0 <_ZN9Scheduler12readyThreadsE>
		if (!head) { tail = nullptr; }
    80001630:	02078e63          	beqz	a5,8000166c <_ZN9Scheduler3getEv+0x68>

		T* ret = elem->data;
    80001634:	00053483          	ld	s1,0(a0)
		delete elem;
    80001638:	00000097          	auipc	ra,0x0
    8000163c:	3dc080e7          	jalr	988(ra) # 80001a14 <_ZdlPv>
		numOfElements--;
    80001640:	00004717          	auipc	a4,0x4
    80001644:	46070713          	addi	a4,a4,1120 # 80005aa0 <_ZN9Scheduler12readyThreadsE>
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
    8000166c:	00004797          	auipc	a5,0x4
    80001670:	4207be23          	sd	zero,1084(a5) # 80005aa8 <_ZN9Scheduler12readyThreadsE+0x8>
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

00000000800016b4 <_Z5nit1fPv>:
//void dispatch() {
//	__asm__ volatile ("mv %[savedPC], ra":[savedPC] "=r"(temp));
//	__asm__ volatile("mv ra, %[fAddress]": : [fAddress] "r"(&f));
//}

void nit1f(void*){
    800016b4:	ff010113          	addi	sp,sp,-16
    800016b8:	00113423          	sd	ra,8(sp)
    800016bc:	00813023          	sd	s0,0(sp)
    800016c0:	01010413          	addi	s0,sp,16
	println("usao u nit 1");
    800016c4:	00004517          	auipc	a0,0x4
    800016c8:	96c50513          	addi	a0,a0,-1684 # 80005030 <_ZZ12printIntegermE6digits+0x10>
    800016cc:	00000097          	auipc	ra,0x0
    800016d0:	db0080e7          	jalr	-592(ra) # 8000147c <_Z7printlnPKc>
	TCB::dispatch();
    800016d4:	00000097          	auipc	ra,0x0
    800016d8:	448080e7          	jalr	1096(ra) # 80001b1c <_ZN3TCB8dispatchEv>
	println("opet u niti 1");
    800016dc:	00004517          	auipc	a0,0x4
    800016e0:	96450513          	addi	a0,a0,-1692 # 80005040 <_ZZ12printIntegermE6digits+0x20>
    800016e4:	00000097          	auipc	ra,0x0
    800016e8:	d98080e7          	jalr	-616(ra) # 8000147c <_Z7printlnPKc>
}
    800016ec:	00813083          	ld	ra,8(sp)
    800016f0:	00013403          	ld	s0,0(sp)
    800016f4:	01010113          	addi	sp,sp,16
    800016f8:	00008067          	ret

00000000800016fc <main>:
int main() {
    800016fc:	ff010113          	addi	sp,sp,-16
    80001700:	00113423          	sd	ra,8(sp)
    80001704:	00813023          	sd	s0,0(sp)
    80001708:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    8000170c:	00200793          	li	a5,2
    80001710:	1007b073          	csrc	sstatus,a5
	//zabrani prekide
	Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
	//postavi adresu prekidne rutine u stvec
	Riscv::w_stvec((uint64)&interruptHandler);
    80001714:	00004717          	auipc	a4,0x4
    80001718:	33473703          	ld	a4,820(a4) # 80005a48 <_GLOBAL_OFFSET_TABLE_+0x20>
	__asm__ volatile("csrw stvec, %[stvec]": :[stvec] "r"(stvec));
    8000171c:	10571073          	csrw	stvec,a4
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80001720:	1007a073          	csrs	sstatus,a5
	//omoguci prekide
	Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

	//testiranje alociranja memorije
testMemory();
    80001724:	00000097          	auipc	ra,0x0
    80001728:	7c0080e7          	jalr	1984(ra) # 80001ee4 <_Z10testMemoryv>
//	while(!nit1->isFinished()){
//		glavnaNit->dispatch();
//	}
//	println("");
	return 0;
    8000172c:	00000513          	li	a0,0
    80001730:	00813083          	ld	ra,8(sp)
    80001734:	00013403          	ld	s0,0(sp)
    80001738:	01010113          	addi	sp,sp,16
    8000173c:	00008067          	ret

0000000080001740 <interruptRoutine>:
#include "../h/syscall_c.hpp"
#include "../h/TCB.hpp"

#pragma GCC optimize("O0")

extern "C" void interruptRoutine() {
    80001740:	f6010113          	addi	sp,sp,-160
    80001744:	08113c23          	sd	ra,152(sp)
    80001748:	08813823          	sd	s0,144(sp)
    8000174c:	0a010413          	addi	s0,sp,160
	//uint64 scause = Riscv::r_scause();
	//uint64 sepc = Riscv::r_sepc();
	uint64 scause, sepc;
	__asm__ volatile("csrr %[scause], scause":[scause] "=r"(scause): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001750:	14202373          	csrr	t1,scause
    80001754:	fe643423          	sd	t1,-24(s0)
	__asm__ volatile("csrr %[sepc], sepc":[sepc] "=r"(sepc): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001758:	14102373          	csrr	t1,sepc
    8000175c:	fe643023          	sd	t1,-32(s0)
	uint64 a0, a1, a2, a3, a4, a5, a6, a7;
	__asm__ volatile("mv %[ax], a0":[ax] "=r"(a0): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001760:	00050313          	mv	t1,a0
    80001764:	fc643c23          	sd	t1,-40(s0)
	__asm__ volatile("mv %[ax], a1":[ax] "=r"(a1): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001768:	00058313          	mv	t1,a1
    8000176c:	fc643823          	sd	t1,-48(s0)
	__asm__ volatile("mv %[ax], a2":[ax] "=r"(a2): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001770:	00060313          	mv	t1,a2
    80001774:	fc643423          	sd	t1,-56(s0)
	__asm__ volatile("mv %[ax], a3":[ax] "=r"(a3): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001778:	00068313          	mv	t1,a3
    8000177c:	fc643023          	sd	t1,-64(s0)
	__asm__ volatile("mv %[ax], a4":[ax] "=r"(a4): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001780:	00070313          	mv	t1,a4
    80001784:	fa643c23          	sd	t1,-72(s0)
	__asm__ volatile("mv %[ax], a5":[ax] "=r"(a5): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001788:	00078313          	mv	t1,a5
    8000178c:	fa643823          	sd	t1,-80(s0)
	__asm__ volatile("mv %[ax], a6":[ax] "=r"(a6): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001790:	00080313          	mv	t1,a6
    80001794:	fa643423          	sd	t1,-88(s0)
	__asm__ volatile("mv %[ax], a7":[ax] "=r"(a7): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001798:	00088313          	mv	t1,a7
    8000179c:	fa643023          	sd	t1,-96(s0)

	if (scause == 0x09 || scause == 0x08) {
    800017a0:	fe843703          	ld	a4,-24(s0)
    800017a4:	00900793          	li	a5,9
    800017a8:	00f70863          	beq	a4,a5,800017b8 <interruptRoutine+0x78>
    800017ac:	fe843703          	ld	a4,-24(s0)
    800017b0:	00800793          	li	a5,8
    800017b4:	14f71a63          	bne	a4,a5,80001908 <interruptRoutine+0x1c8>
		//prekid zbog poziva ecall
		uint64 opCode = a0;
    800017b8:	fd843783          	ld	a5,-40(s0)
    800017bc:	f8f43c23          	sd	a5,-104(s0)

		switch (opCode) {
    800017c0:	f9843703          	ld	a4,-104(s0)
    800017c4:	04200793          	li	a5,66
    800017c8:	0ce7e463          	bltu	a5,a4,80001890 <interruptRoutine+0x150>
    800017cc:	f9843783          	ld	a5,-104(s0)
    800017d0:	00279713          	slli	a4,a5,0x2
    800017d4:	00004797          	auipc	a5,0x4
    800017d8:	8d878793          	addi	a5,a5,-1832 # 800050ac <_ZZ12printIntegermE6digits+0x8c>
    800017dc:	00f707b3          	add	a5,a4,a5
    800017e0:	0007a783          	lw	a5,0(a5)
    800017e4:	0007871b          	sext.w	a4,a5
    800017e8:	00004797          	auipc	a5,0x4
    800017ec:	8c478793          	addi	a5,a5,-1852 # 800050ac <_ZZ12printIntegermE6digits+0x8c>
    800017f0:	00f707b3          	add	a5,a4,a5
    800017f4:	00078067          	jr	a5
			case 0x01:
				//mem_alloc
				size_t size;
				size = (size_t)a1;
    800017f8:	fd043783          	ld	a5,-48(s0)
    800017fc:	f6f43423          	sd	a5,-152(s0)
				//__asm__ volatile("mv %[size], a1":[size] "=r"(size));
				size = size * MEM_BLOCK_SIZE;
    80001800:	f6843783          	ld	a5,-152(s0)
    80001804:	00679793          	slli	a5,a5,0x6
    80001808:	f6f43423          	sd	a5,-152(s0)
				MemoryAllocator::kmalloc(size);
    8000180c:	f6843503          	ld	a0,-152(s0)
    80001810:	00000097          	auipc	ra,0x0
    80001814:	408080e7          	jalr	1032(ra) # 80001c18 <_ZN15MemoryAllocator7kmallocEm>
				break;
    80001818:	0d40006f          	j	800018ec <interruptRoutine+0x1ac>
			case 0x02:
				//mem_free
				void* ptr;
				ptr = (void*)a1;
    8000181c:	fd043783          	ld	a5,-48(s0)
    80001820:	f6f43823          	sd	a5,-144(s0)
				//__asm__ volatile("mv %[ptr], a1" :[ptr]"=r"(ptr));
				MemoryAllocator::kfree(ptr);
    80001824:	f7043503          	ld	a0,-144(s0)
    80001828:	00000097          	auipc	ra,0x0
    8000182c:	59c080e7          	jalr	1436(ra) # 80001dc4 <_ZN15MemoryAllocator5kfreeEPv>
				break;
    80001830:	0bc0006f          	j	800018ec <interruptRoutine+0x1ac>
			case 0x11:
				//thread_create
				thread_t* handle;
				handle = (thread_t*)a1;
    80001834:	fd043783          	ld	a5,-48(s0)
    80001838:	f8f43823          	sd	a5,-112(s0)
				void (* function)(void*);
				function = (void (*)(void*))a2;
    8000183c:	fc843783          	ld	a5,-56(s0)
    80001840:	f8f43423          	sd	a5,-120(s0)
				void* args;
				args = (void*)a3;
    80001844:	fc043783          	ld	a5,-64(s0)
    80001848:	f8f43023          	sd	a5,-128(s0)
				uint64* sp;
				sp = (uint64*)a4;
    8000184c:	fb843783          	ld	a5,-72(s0)
    80001850:	f6f43c23          	sd	a5,-136(s0)
//				__asm__ volatile("mv %[handle], a1":[handle]"=r"(handle));
//				__asm__ volatile("mv %[f], a2":[f]"=r"(function));
//				__asm__ volatile("mv %[args], a3":[args]"=r"(args));
//				__asm__ volatile("mv %[sp], a4":[sp]"=r"(sp));

				*handle = TCB::createThread(function, args, sp);
    80001854:	f7843603          	ld	a2,-136(s0)
    80001858:	f8043583          	ld	a1,-128(s0)
    8000185c:	f8843503          	ld	a0,-120(s0)
    80001860:	00000097          	auipc	ra,0x0
    80001864:	204080e7          	jalr	516(ra) # 80001a64 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80001868:	00050713          	mv	a4,a0
    8000186c:	f9043783          	ld	a5,-112(s0)
    80001870:	00e7b023          	sd	a4,0(a5)
				if (*handle != nullptr) {
    80001874:	f9043783          	ld	a5,-112(s0)
    80001878:	0007b783          	ld	a5,0(a5)
    8000187c:	00078663          	beqz	a5,80001888 <interruptRoutine+0x148>
					__asm__ volatile("li a0, 0");
    80001880:	00000513          	li	a0,0
				} else {
					__asm__ volatile("li a0, -1");
				}
				break;
    80001884:	0680006f          	j	800018ec <interruptRoutine+0x1ac>
					__asm__ volatile("li a0, -1");
    80001888:	fff00513          	li	a0,-1
				break;
    8000188c:	0600006f          	j	800018ec <interruptRoutine+0x1ac>
				break;
			case 0x42:
				//putc
				break;
			default:
				printString("\nNepostojeci op code: ");
    80001890:	00003517          	auipc	a0,0x3
    80001894:	7c050513          	addi	a0,a0,1984 # 80005050 <_ZZ12printIntegermE6digits+0x30>
    80001898:	00000097          	auipc	ra,0x0
    8000189c:	ba0080e7          	jalr	-1120(ra) # 80001438 <_Z11printStringPKc>
				printInteger(opCode);
    800018a0:	f9843503          	ld	a0,-104(s0)
    800018a4:	00000097          	auipc	ra,0x0
    800018a8:	c0c080e7          	jalr	-1012(ra) # 800014b0 <_Z12printIntegerm>
				printString("\nscause: ");
    800018ac:	00003517          	auipc	a0,0x3
    800018b0:	7bc50513          	addi	a0,a0,1980 # 80005068 <_ZZ12printIntegermE6digits+0x48>
    800018b4:	00000097          	auipc	ra,0x0
    800018b8:	b84080e7          	jalr	-1148(ra) # 80001438 <_Z11printStringPKc>
				printInteger(scause);
    800018bc:	fe843503          	ld	a0,-24(s0)
    800018c0:	00000097          	auipc	ra,0x0
    800018c4:	bf0080e7          	jalr	-1040(ra) # 800014b0 <_Z12printIntegerm>
				printString("\nsepc: ");
    800018c8:	00003517          	auipc	a0,0x3
    800018cc:	7b050513          	addi	a0,a0,1968 # 80005078 <_ZZ12printIntegermE6digits+0x58>
    800018d0:	00000097          	auipc	ra,0x0
    800018d4:	b68080e7          	jalr	-1176(ra) # 80001438 <_Z11printStringPKc>
				printInteger(sepc);
    800018d8:	fe043503          	ld	a0,-32(s0)
    800018dc:	00000097          	auipc	ra,0x0
    800018e0:	bd4080e7          	jalr	-1068(ra) # 800014b0 <_Z12printIntegerm>
				break;
    800018e4:	0080006f          	j	800018ec <interruptRoutine+0x1ac>
				break;
    800018e8:	00000013          	nop
		}
		//sepc pokazuje na ecall instrukciju, treba preci na sledecu instrukciju
		//sepc += 4;
		__asm__ volatile("addi %[dst], %[src], 0x4":[dst]"=r"(sepc):[src]"r"(
				sepc):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800018ec:	fe043303          	ld	t1,-32(s0)
    800018f0:	00430313          	addi	t1,t1,4
    800018f4:	fe643023          	sd	t1,-32(s0)
		__asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800018f8:	fe043303          	ld	t1,-32(s0)
    800018fc:	14131073          	csrw	sepc,t1
    80001900:	00000013          	nop
		printString("scause: ");
		printInteger(scause);
		printString("\nsepc: ");
		printInteger(sepc);
	}
}
    80001904:	0900006f          	j	80001994 <interruptRoutine+0x254>
	} else if (scause == (1UL << 63 | 9)) {
    80001908:	fe843703          	ld	a4,-24(s0)
    8000190c:	fff00793          	li	a5,-1
    80001910:	03f79793          	slli	a5,a5,0x3f
    80001914:	00978793          	addi	a5,a5,9
    80001918:	00f71863          	bne	a4,a5,80001928 <interruptRoutine+0x1e8>
		console_handler();
    8000191c:	00003097          	auipc	ra,0x3
    80001920:	814080e7          	jalr	-2028(ra) # 80004130 <console_handler>
}
    80001924:	0700006f          	j	80001994 <interruptRoutine+0x254>
	} else if (scause == (1UL << 63 | 1)) {
    80001928:	fe843703          	ld	a4,-24(s0)
    8000192c:	fff00793          	li	a5,-1
    80001930:	03f79793          	slli	a5,a5,0x3f
    80001934:	00178793          	addi	a5,a5,1
    80001938:	00f71a63          	bne	a4,a5,8000194c <interruptRoutine+0x20c>
		Riscv::mc_sip(Riscv::SIP_SSIP);
    8000193c:	00200513          	li	a0,2
    80001940:	00000097          	auipc	ra,0x0
    80001944:	068080e7          	jalr	104(ra) # 800019a8 <_ZN5Riscv6mc_sipEm>
}
    80001948:	04c0006f          	j	80001994 <interruptRoutine+0x254>
		println("\nGreska u prekidnoj rutini");
    8000194c:	00003517          	auipc	a0,0x3
    80001950:	73450513          	addi	a0,a0,1844 # 80005080 <_ZZ12printIntegermE6digits+0x60>
    80001954:	00000097          	auipc	ra,0x0
    80001958:	b28080e7          	jalr	-1240(ra) # 8000147c <_Z7printlnPKc>
		printString("scause: ");
    8000195c:	00003517          	auipc	a0,0x3
    80001960:	74450513          	addi	a0,a0,1860 # 800050a0 <_ZZ12printIntegermE6digits+0x80>
    80001964:	00000097          	auipc	ra,0x0
    80001968:	ad4080e7          	jalr	-1324(ra) # 80001438 <_Z11printStringPKc>
		printInteger(scause);
    8000196c:	fe843503          	ld	a0,-24(s0)
    80001970:	00000097          	auipc	ra,0x0
    80001974:	b40080e7          	jalr	-1216(ra) # 800014b0 <_Z12printIntegerm>
		printString("\nsepc: ");
    80001978:	00003517          	auipc	a0,0x3
    8000197c:	70050513          	addi	a0,a0,1792 # 80005078 <_ZZ12printIntegermE6digits+0x58>
    80001980:	00000097          	auipc	ra,0x0
    80001984:	ab8080e7          	jalr	-1352(ra) # 80001438 <_Z11printStringPKc>
		printInteger(sepc);
    80001988:	fe043503          	ld	a0,-32(s0)
    8000198c:	00000097          	auipc	ra,0x0
    80001990:	b24080e7          	jalr	-1244(ra) # 800014b0 <_Z12printIntegerm>
}
    80001994:	00000013          	nop
    80001998:	09813083          	ld	ra,152(sp)
    8000199c:	09013403          	ld	s0,144(sp)
    800019a0:	0a010113          	addi	sp,sp,160
    800019a4:	00008067          	ret

00000000800019a8 <_ZN5Riscv6mc_sipEm>:
inline void Riscv::mc_sip(uint64 mask) {
    800019a8:	ff010113          	addi	sp,sp,-16
    800019ac:	00813423          	sd	s0,8(sp)
    800019b0:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sip, %[mask]": :[mask] "r"(mask));
    800019b4:	14453073          	csrc	sip,a0
}
    800019b8:	00813403          	ld	s0,8(sp)
    800019bc:	01010113          	addi	sp,sp,16
    800019c0:	00008067          	ret

00000000800019c4 <_Znwm>:
// Created by os on 5/29/23.
//
#include "../h/syscall_cpp.hpp"

//override globalnog new
void* operator new(size_t size) {
    800019c4:	ff010113          	addi	sp,sp,-16
    800019c8:	00113423          	sd	ra,8(sp)
    800019cc:	00813023          	sd	s0,0(sp)
    800019d0:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    800019d4:	00000097          	auipc	ra,0x0
    800019d8:	864080e7          	jalr	-1948(ra) # 80001238 <_Z9mem_allocm>
}
    800019dc:	00813083          	ld	ra,8(sp)
    800019e0:	00013403          	ld	s0,0(sp)
    800019e4:	01010113          	addi	sp,sp,16
    800019e8:	00008067          	ret

00000000800019ec <_Znam>:

void* operator new[](size_t size) {
    800019ec:	ff010113          	addi	sp,sp,-16
    800019f0:	00113423          	sd	ra,8(sp)
    800019f4:	00813023          	sd	s0,0(sp)
    800019f8:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    800019fc:	00000097          	auipc	ra,0x0
    80001a00:	83c080e7          	jalr	-1988(ra) # 80001238 <_Z9mem_allocm>
}
    80001a04:	00813083          	ld	ra,8(sp)
    80001a08:	00013403          	ld	s0,0(sp)
    80001a0c:	01010113          	addi	sp,sp,16
    80001a10:	00008067          	ret

0000000080001a14 <_ZdlPv>:

void operator delete(void* ptr)noexcept {
    80001a14:	ff010113          	addi	sp,sp,-16
    80001a18:	00113423          	sd	ra,8(sp)
    80001a1c:	00813023          	sd	s0,0(sp)
    80001a20:	01010413          	addi	s0,sp,16
mem_free(ptr);
    80001a24:	00000097          	auipc	ra,0x0
    80001a28:	854080e7          	jalr	-1964(ra) # 80001278 <_Z8mem_freePv>
}
    80001a2c:	00813083          	ld	ra,8(sp)
    80001a30:	00013403          	ld	s0,0(sp)
    80001a34:	01010113          	addi	sp,sp,16
    80001a38:	00008067          	ret

0000000080001a3c <_ZdaPv>:

void operator delete[](void* ptr)noexcept {
    80001a3c:	ff010113          	addi	sp,sp,-16
    80001a40:	00113423          	sd	ra,8(sp)
    80001a44:	00813023          	sd	s0,0(sp)
    80001a48:	01010413          	addi	s0,sp,16
mem_free(ptr);
    80001a4c:	00000097          	auipc	ra,0x0
    80001a50:	82c080e7          	jalr	-2004(ra) # 80001278 <_Z8mem_freePv>
    80001a54:	00813083          	ld	ra,8(sp)
    80001a58:	00013403          	ld	s0,0(sp)
    80001a5c:	01010113          	addi	sp,sp,16
    80001a60:	00008067          	ret

0000000080001a64 <_ZN3TCB12createThreadEPFvPvES0_Pm>:
#include "../h/Riscv.hpp"

TCB* TCB::running = nullptr;
uint64 TCB::runningTimeSlice = 0;

TCB* TCB::createThread(TCB::Body function, void* args, uint64* stack) {
    80001a64:	fd010113          	addi	sp,sp,-48
    80001a68:	02113423          	sd	ra,40(sp)
    80001a6c:	02813023          	sd	s0,32(sp)
    80001a70:	00913c23          	sd	s1,24(sp)
    80001a74:	01213823          	sd	s2,16(sp)
    80001a78:	01313423          	sd	s3,8(sp)
    80001a7c:	01413023          	sd	s4,0(sp)
    80001a80:	03010413          	addi	s0,sp,48
    80001a84:	00050993          	mv	s3,a0
    80001a88:	00058a13          	mv	s4,a1
    80001a8c:	00060913          	mv	s2,a2
	TCB* newThread = new TCB(function, args, stack);
    80001a90:	03800513          	li	a0,56
    80001a94:	00000097          	auipc	ra,0x0
    80001a98:	f30080e7          	jalr	-208(ra) # 800019c4 <_Znwm>
    80001a9c:	00050493          	mv	s1,a0
	uint64 timeSlice;        //vremenski odsecak dodeljen datoj niti
	bool finished;            //da li je nit zavrsila izvrsavanje funkcije
	bool blocked;            //da li je nit blokirana

	TCB(Body function, void* args, uint64* stack) : threadFunction(function), stack(stack), args(args),
													timeSlice(DEFAULT_TIME_SLICE), finished(false), blocked(false) {
    80001aa0:	01353823          	sd	s3,16(a0)
    80001aa4:	01253c23          	sd	s2,24(a0)
    80001aa8:	03453023          	sd	s4,32(a0)
    80001aac:	00200793          	li	a5,2
    80001ab0:	02f53423          	sd	a5,40(a0)
    80001ab4:	02050823          	sb	zero,48(a0)
    80001ab8:	020508a3          	sb	zero,49(a0)
		//formiranje pocetnog konteksta; specijalni uslovi za main funkciju kojoj se pocetni kontekst automatski formira
		uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
    80001abc:	04098863          	beqz	s3,80001b0c <_ZN3TCB12createThreadEPFvPvES0_Pm+0xa8>
    80001ac0:	00000797          	auipc	a5,0x0
    80001ac4:	10478793          	addi	a5,a5,260 # 80001bc4 <_ZN3TCB7wrapperEv>
		uint64 startSp = stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0;
    80001ac8:	04090663          	beqz	s2,80001b14 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xb0>
    80001acc:	00008637          	lui	a2,0x8
    80001ad0:	00c90933          	add	s2,s2,a2
		this->context.ra = startRa;
    80001ad4:	00f4b423          	sd	a5,8(s1)
		this->context.sp = startSp;
    80001ad8:	0124b023          	sd	s2,0(s1)
	Scheduler::put(newThread);
    80001adc:	00048513          	mv	a0,s1
    80001ae0:	00000097          	auipc	ra,0x0
    80001ae4:	aa4080e7          	jalr	-1372(ra) # 80001584 <_ZN9Scheduler3putEP3TCB>
	return newThread;
}
    80001ae8:	00048513          	mv	a0,s1
    80001aec:	02813083          	ld	ra,40(sp)
    80001af0:	02013403          	ld	s0,32(sp)
    80001af4:	01813483          	ld	s1,24(sp)
    80001af8:	01013903          	ld	s2,16(sp)
    80001afc:	00813983          	ld	s3,8(sp)
    80001b00:	00013a03          	ld	s4,0(sp)
    80001b04:	03010113          	addi	sp,sp,48
    80001b08:	00008067          	ret
		uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
    80001b0c:	00000793          	li	a5,0
    80001b10:	fb9ff06f          	j	80001ac8 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x64>
		uint64 startSp = stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0;
    80001b14:	00000913          	li	s2,0
    80001b18:	fbdff06f          	j	80001ad4 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x70>

0000000080001b1c <_ZN3TCB8dispatchEv>:

void TCB::dispatch() {
    80001b1c:	fe010113          	addi	sp,sp,-32
    80001b20:	00113c23          	sd	ra,24(sp)
    80001b24:	00813823          	sd	s0,16(sp)
    80001b28:	00913423          	sd	s1,8(sp)
    80001b2c:	02010413          	addi	s0,sp,32
	TCB* old = TCB::running;
    80001b30:	00004497          	auipc	s1,0x4
    80001b34:	f884b483          	ld	s1,-120(s1) # 80005ab8 <_ZN3TCB7runningE>
	bool isFinished() { return finished; }
    80001b38:	0304c783          	lbu	a5,48(s1)
	if (!old->isFinished() && !old->isBlocked()) {
    80001b3c:	00079663          	bnez	a5,80001b48 <_ZN3TCB8dispatchEv+0x2c>
	bool isBlocked() { return blocked; }
    80001b40:	0314c783          	lbu	a5,49(s1)
    80001b44:	02078c63          	beqz	a5,80001b7c <_ZN3TCB8dispatchEv+0x60>
		Scheduler::put(old);
	}
	TCB::running = Scheduler::get();
    80001b48:	00000097          	auipc	ra,0x0
    80001b4c:	abc080e7          	jalr	-1348(ra) # 80001604 <_ZN9Scheduler3getEv>
    80001b50:	00050593          	mv	a1,a0
    80001b54:	00004797          	auipc	a5,0x4
    80001b58:	f6a7b223          	sd	a0,-156(a5) # 80005ab8 <_ZN3TCB7runningE>
	TCB::contextSwitch(&old->context, &running->context);
    80001b5c:	00048513          	mv	a0,s1
    80001b60:	fffff097          	auipc	ra,0xfffff
    80001b64:	6c4080e7          	jalr	1732(ra) # 80001224 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80001b68:	01813083          	ld	ra,24(sp)
    80001b6c:	01013403          	ld	s0,16(sp)
    80001b70:	00813483          	ld	s1,8(sp)
    80001b74:	02010113          	addi	sp,sp,32
    80001b78:	00008067          	ret
		Scheduler::put(old);
    80001b7c:	00048513          	mv	a0,s1
    80001b80:	00000097          	auipc	ra,0x0
    80001b84:	a04080e7          	jalr	-1532(ra) # 80001584 <_ZN9Scheduler3putEP3TCB>
    80001b88:	fc1ff06f          	j	80001b48 <_ZN3TCB8dispatchEv+0x2c>

0000000080001b8c <_ZN3TCB5yieldEv>:

void TCB::yield() {
    80001b8c:	ff010113          	addi	sp,sp,-16
    80001b90:	00113423          	sd	ra,8(sp)
    80001b94:	00813023          	sd	s0,0(sp)
    80001b98:	01010413          	addi	s0,sp,16
	Riscv::pushRegisters();
    80001b9c:	fffff097          	auipc	ra,0xfffff
    80001ba0:	464080e7          	jalr	1124(ra) # 80001000 <_ZN5Riscv13pushRegistersEv>
	TCB::dispatch();
    80001ba4:	00000097          	auipc	ra,0x0
    80001ba8:	f78080e7          	jalr	-136(ra) # 80001b1c <_ZN3TCB8dispatchEv>
	Riscv::popRegisters();
    80001bac:	fffff097          	auipc	ra,0xfffff
    80001bb0:	4d0080e7          	jalr	1232(ra) # 8000107c <_ZN5Riscv12popRegistersEv>
}
    80001bb4:	00813083          	ld	ra,8(sp)
    80001bb8:	00013403          	ld	s0,0(sp)
    80001bbc:	01010113          	addi	sp,sp,16
    80001bc0:	00008067          	ret

0000000080001bc4 <_ZN3TCB7wrapperEv>:

void TCB::wrapper() {
    80001bc4:	fe010113          	addi	sp,sp,-32
    80001bc8:	00113c23          	sd	ra,24(sp)
    80001bcc:	00813823          	sd	s0,16(sp)
    80001bd0:	00913423          	sd	s1,8(sp)
    80001bd4:	02010413          	addi	s0,sp,32
	running->threadFunction(running->args);
    80001bd8:	00004497          	auipc	s1,0x4
    80001bdc:	ee048493          	addi	s1,s1,-288 # 80005ab8 <_ZN3TCB7runningE>
    80001be0:	0004b783          	ld	a5,0(s1)
    80001be4:	0107b703          	ld	a4,16(a5)
    80001be8:	0207b503          	ld	a0,32(a5)
    80001bec:	000700e7          	jalr	a4
	running->finished = true;
    80001bf0:	0004b783          	ld	a5,0(s1)
    80001bf4:	00100713          	li	a4,1
    80001bf8:	02e78823          	sb	a4,48(a5)
	TCB::yield();
    80001bfc:	00000097          	auipc	ra,0x0
    80001c00:	f90080e7          	jalr	-112(ra) # 80001b8c <_ZN3TCB5yieldEv>
}
    80001c04:	01813083          	ld	ra,24(sp)
    80001c08:	01013403          	ld	s0,16(sp)
    80001c0c:	00813483          	ld	s1,8(sp)
    80001c10:	02010113          	addi	sp,sp,32
    80001c14:	00008067          	ret

0000000080001c18 <_ZN15MemoryAllocator7kmallocEm>:

bool MemoryAllocator::initialized = false;
MemoryAllocator::FreeMemSegment* MemoryAllocator::freeMemHead = nullptr;
MemoryAllocator::UsedMemSegment* MemoryAllocator::usedMemHead = nullptr;

void* MemoryAllocator::kmalloc(size_t size) {
    80001c18:	ff010113          	addi	sp,sp,-16
    80001c1c:	00813423          	sd	s0,8(sp)
    80001c20:	01010413          	addi	s0,sp,16
	if (size <= 0) return nullptr;
    80001c24:	12050863          	beqz	a0,80001d54 <_ZN15MemoryAllocator7kmallocEm+0x13c>

	//pocetna inicijalizacija
	if (!initialized) {
    80001c28:	00004797          	auipc	a5,0x4
    80001c2c:	ea07c783          	lbu	a5,-352(a5) # 80005ac8 <_ZN15MemoryAllocator11initializedE>
    80001c30:	04079863          	bnez	a5,80001c80 <_ZN15MemoryAllocator7kmallocEm+0x68>
		freeMemHead = (FreeMemSegment*)HEAP_START_ADDR;
    80001c34:	00004617          	auipc	a2,0x4
    80001c38:	dfc63603          	ld	a2,-516(a2) # 80005a30 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001c3c:	00063783          	ld	a5,0(a2)
    80001c40:	00004717          	auipc	a4,0x4
    80001c44:	e8870713          	addi	a4,a4,-376 # 80005ac8 <_ZN15MemoryAllocator11initializedE>
    80001c48:	00f73423          	sd	a5,8(a4)
		freeMemHead->next = nullptr;
    80001c4c:	0007b023          	sd	zero,0(a5)
		freeMemHead->prev = nullptr;
    80001c50:	00873683          	ld	a3,8(a4)
    80001c54:	0006b423          	sd	zero,8(a3)
		freeMemHead->size = (char*)HEAP_END_ADDR - (char*)HEAP_START_ADDR - sizeof(FreeMemSegment);
    80001c58:	00004797          	auipc	a5,0x4
    80001c5c:	de87b783          	ld	a5,-536(a5) # 80005a40 <_GLOBAL_OFFSET_TABLE_+0x18>
    80001c60:	0007b783          	ld	a5,0(a5)
    80001c64:	00063603          	ld	a2,0(a2)
    80001c68:	40c787b3          	sub	a5,a5,a2
    80001c6c:	fe878793          	addi	a5,a5,-24
    80001c70:	00f6b823          	sd	a5,16(a3)
		usedMemHead = nullptr;
    80001c74:	00073823          	sd	zero,16(a4)

		initialized = true;
    80001c78:	00100793          	li	a5,1
    80001c7c:	00f70023          	sb	a5,0(a4)
	}

	//alokacija uvek zaokruzena na blokove
	size += sizeof(UsedMemSegment);
    80001c80:	01050513          	addi	a0,a0,16
	size_t blocks = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
    80001c84:	00655713          	srli	a4,a0,0x6
    80001c88:	03f57793          	andi	a5,a0,63
    80001c8c:	00078463          	beqz	a5,80001c94 <_ZN15MemoryAllocator7kmallocEm+0x7c>
    80001c90:	00100793          	li	a5,1
    80001c94:	00f707b3          	add	a5,a4,a5
	size = blocks * MEM_BLOCK_SIZE;
    80001c98:	00679793          	slli	a5,a5,0x6

	//trazenje slobodnog segmenta po first-fit algoritmu
	for (FreeMemSegment* current = freeMemHead; current; current = current->next) {
    80001c9c:	00004517          	auipc	a0,0x4
    80001ca0:	e3453503          	ld	a0,-460(a0) # 80005ad0 <_ZN15MemoryAllocator11freeMemHeadE>
    80001ca4:	08050a63          	beqz	a0,80001d38 <_ZN15MemoryAllocator7kmallocEm+0x120>
		if (current->size < size) continue;
    80001ca8:	01053703          	ld	a4,16(a0)
    80001cac:	06f76263          	bltu	a4,a5,80001d10 <_ZN15MemoryAllocator7kmallocEm+0xf8>

		//pravljenje novog slobodnog fragmenta od ostatka fragmenta
		FreeMemSegment* remainderFree = (FreeMemSegment*)((char*)current + size);
    80001cb0:	00f506b3          	add	a3,a0,a5
		remainderFree->size = current->size - size;
    80001cb4:	40f70733          	sub	a4,a4,a5
    80001cb8:	00e6b823          	sd	a4,16(a3)
		remainderFree->prev = current->prev;
    80001cbc:	00853703          	ld	a4,8(a0)
    80001cc0:	00e6b423          	sd	a4,8(a3)
		if (current->prev) current->prev->next = remainderFree;
    80001cc4:	00070463          	beqz	a4,80001ccc <_ZN15MemoryAllocator7kmallocEm+0xb4>
    80001cc8:	00d73023          	sd	a3,0(a4)
		remainderFree->next = current->next;
    80001ccc:	00053703          	ld	a4,0(a0)
    80001cd0:	00e6b023          	sd	a4,0(a3)
		if (current->next) current->next->prev = remainderFree;
    80001cd4:	00070463          	beqz	a4,80001cdc <_ZN15MemoryAllocator7kmallocEm+0xc4>
    80001cd8:	00d73423          	sd	a3,8(a4)
		if (freeMemHead == current) freeMemHead = remainderFree;
    80001cdc:	00004717          	auipc	a4,0x4
    80001ce0:	df473703          	ld	a4,-524(a4) # 80005ad0 <_ZN15MemoryAllocator11freeMemHeadE>
    80001ce4:	02a70a63          	beq	a4,a0,80001d18 <_ZN15MemoryAllocator7kmallocEm+0x100>

		//ubacivanje novog fragmenta u listu zauzetih fragmenata
		UsedMemSegment* newFragment = (UsedMemSegment*)current;
		newFragment->size = size;
    80001ce8:	00f53423          	sd	a5,8(a0)
		UsedMemSegment* prevUsed = nullptr;
		for (UsedMemSegment* cur = usedMemHead; cur && cur < newFragment; prevUsed = cur, cur = cur->next);
    80001cec:	00004697          	auipc	a3,0x4
    80001cf0:	dec6b683          	ld	a3,-532(a3) # 80005ad8 <_ZN15MemoryAllocator11usedMemHeadE>
    80001cf4:	00068793          	mv	a5,a3
		UsedMemSegment* prevUsed = nullptr;
    80001cf8:	00000713          	li	a4,0
		for (UsedMemSegment* cur = usedMemHead; cur && cur < newFragment; prevUsed = cur, cur = cur->next);
    80001cfc:	02078463          	beqz	a5,80001d24 <_ZN15MemoryAllocator7kmallocEm+0x10c>
    80001d00:	02a7f263          	bgeu	a5,a0,80001d24 <_ZN15MemoryAllocator7kmallocEm+0x10c>
    80001d04:	00078713          	mv	a4,a5
    80001d08:	0007b783          	ld	a5,0(a5)
    80001d0c:	ff1ff06f          	j	80001cfc <_ZN15MemoryAllocator7kmallocEm+0xe4>
	for (FreeMemSegment* current = freeMemHead; current; current = current->next) {
    80001d10:	00053503          	ld	a0,0(a0)
    80001d14:	f91ff06f          	j	80001ca4 <_ZN15MemoryAllocator7kmallocEm+0x8c>
		if (freeMemHead == current) freeMemHead = remainderFree;
    80001d18:	00004717          	auipc	a4,0x4
    80001d1c:	dad73c23          	sd	a3,-584(a4) # 80005ad0 <_ZN15MemoryAllocator11freeMemHeadE>
    80001d20:	fc9ff06f          	j	80001ce8 <_ZN15MemoryAllocator7kmallocEm+0xd0>
		if (!prevUsed) {
    80001d24:	02070063          	beqz	a4,80001d44 <_ZN15MemoryAllocator7kmallocEm+0x12c>
			newFragment->next = usedMemHead;
			usedMemHead = newFragment;
		} else {
			newFragment->next = prevUsed->next;
    80001d28:	00073783          	ld	a5,0(a4)
    80001d2c:	00f53023          	sd	a5,0(a0)
			prevUsed->next = newFragment;
    80001d30:	00a73023          	sd	a0,0(a4)
		}
		return (char*)newFragment + sizeof(UsedMemSegment);
    80001d34:	01050513          	addi	a0,a0,16
	}
	return nullptr;
}
    80001d38:	00813403          	ld	s0,8(sp)
    80001d3c:	01010113          	addi	sp,sp,16
    80001d40:	00008067          	ret
			newFragment->next = usedMemHead;
    80001d44:	00d53023          	sd	a3,0(a0)
			usedMemHead = newFragment;
    80001d48:	00004797          	auipc	a5,0x4
    80001d4c:	d8a7b823          	sd	a0,-624(a5) # 80005ad8 <_ZN15MemoryAllocator11usedMemHeadE>
    80001d50:	fe5ff06f          	j	80001d34 <_ZN15MemoryAllocator7kmallocEm+0x11c>
	if (size <= 0) return nullptr;
    80001d54:	00000513          	li	a0,0
    80001d58:	fe1ff06f          	j	80001d38 <_ZN15MemoryAllocator7kmallocEm+0x120>

0000000080001d5c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>:
	tryToJoin(newFree);
	tryToJoin(prevFree);
	return 0;
}

int MemoryAllocator::tryToJoin(MemoryAllocator::FreeMemSegment* current) {
    80001d5c:	ff010113          	addi	sp,sp,-16
    80001d60:	00813423          	sd	s0,8(sp)
    80001d64:	01010413          	addi	s0,sp,16
	if (!current) return 0;
    80001d68:	04050663          	beqz	a0,80001db4 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x58>
	bool nextExists = current->next != nullptr;
    80001d6c:	00053783          	ld	a5,0(a0)
	char* nextAddr = (char*)current + current->size;
    80001d70:	01053703          	ld	a4,16(a0)
    80001d74:	00e506b3          	add	a3,a0,a4
	char* cnext = (char*)current->next;
	bool nextIsConnected = (nextAddr == cnext);
	if (nextExists && nextIsConnected) {
    80001d78:	04078263          	beqz	a5,80001dbc <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x60>
    80001d7c:	00d78a63          	beq	a5,a3,80001d90 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x34>
		current->size += current->next->size;
		current->next = current->next->next;
		if (current->next) current->next->prev = current;
		return 1;
	} else return 0;
    80001d80:	00000513          	li	a0,0
}
    80001d84:	00813403          	ld	s0,8(sp)
    80001d88:	01010113          	addi	sp,sp,16
    80001d8c:	00008067          	ret
		current->size += current->next->size;
    80001d90:	0107b683          	ld	a3,16(a5)
    80001d94:	00d70733          	add	a4,a4,a3
    80001d98:	00e53823          	sd	a4,16(a0)
		current->next = current->next->next;
    80001d9c:	0007b783          	ld	a5,0(a5)
    80001da0:	00f53023          	sd	a5,0(a0)
		if (current->next) current->next->prev = current;
    80001da4:	00078463          	beqz	a5,80001dac <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x50>
    80001da8:	00a7b423          	sd	a0,8(a5)
		return 1;
    80001dac:	00100513          	li	a0,1
    80001db0:	fd5ff06f          	j	80001d84 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>
	if (!current) return 0;
    80001db4:	00000513          	li	a0,0
    80001db8:	fcdff06f          	j	80001d84 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>
	} else return 0;
    80001dbc:	00000513          	li	a0,0
    80001dc0:	fc5ff06f          	j	80001d84 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>

0000000080001dc4 <_ZN15MemoryAllocator5kfreeEPv>:
	if (!ptr) return 0;
    80001dc4:	10050463          	beqz	a0,80001ecc <_ZN15MemoryAllocator5kfreeEPv+0x108>
    80001dc8:	00050693          	mv	a3,a0
	if (!usedMemHead) return -1;
    80001dcc:	00004797          	auipc	a5,0x4
    80001dd0:	d0c7b783          	ld	a5,-756(a5) # 80005ad8 <_ZN15MemoryAllocator11usedMemHeadE>
    80001dd4:	10078063          	beqz	a5,80001ed4 <_ZN15MemoryAllocator5kfreeEPv+0x110>
	ptr = (char*)ptr - sizeof(UsedMemSegment);
    80001dd8:	ff050513          	addi	a0,a0,-16
	UsedMemSegment* prevUsed = nullptr;
    80001ddc:	00000713          	li	a4,0
	for (; currentUsed && currentUsed != ptr; prevUsed = currentUsed, currentUsed = currentUsed->next);
    80001de0:	00078a63          	beqz	a5,80001df4 <_ZN15MemoryAllocator5kfreeEPv+0x30>
    80001de4:	00a78863          	beq	a5,a0,80001df4 <_ZN15MemoryAllocator5kfreeEPv+0x30>
    80001de8:	00078713          	mv	a4,a5
    80001dec:	0007b783          	ld	a5,0(a5)
    80001df0:	ff1ff06f          	j	80001de0 <_ZN15MemoryAllocator5kfreeEPv+0x1c>
	if (currentUsed != ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    80001df4:	0ea79463          	bne	a5,a0,80001edc <_ZN15MemoryAllocator5kfreeEPv+0x118>
int MemoryAllocator::kfree(void* ptr) {
    80001df8:	fe010113          	addi	sp,sp,-32
    80001dfc:	00113c23          	sd	ra,24(sp)
    80001e00:	00813823          	sd	s0,16(sp)
    80001e04:	00913423          	sd	s1,8(sp)
    80001e08:	02010413          	addi	s0,sp,32
	if (prevUsed) prevUsed->next = currentUsed->next;
    80001e0c:	02070863          	beqz	a4,80001e3c <_ZN15MemoryAllocator5kfreeEPv+0x78>
    80001e10:	0007b783          	ld	a5,0(a5)
    80001e14:	00f73023          	sd	a5,0(a4)
	if (!freeMemHead || ptr < (char*)freeMemHead) {
    80001e18:	00004797          	auipc	a5,0x4
    80001e1c:	cb87b783          	ld	a5,-840(a5) # 80005ad0 <_ZN15MemoryAllocator11freeMemHeadE>
    80001e20:	02078663          	beqz	a5,80001e4c <_ZN15MemoryAllocator5kfreeEPv+0x88>
    80001e24:	02f56863          	bltu	a0,a5,80001e54 <_ZN15MemoryAllocator5kfreeEPv+0x90>
			 prevFree->next != nullptr && ptr > (char*)(prevFree->next); prevFree = prevFree->next);
    80001e28:	00078493          	mv	s1,a5
    80001e2c:	0007b783          	ld	a5,0(a5)
    80001e30:	02078463          	beqz	a5,80001e58 <_ZN15MemoryAllocator5kfreeEPv+0x94>
    80001e34:	fea7eae3          	bltu	a5,a0,80001e28 <_ZN15MemoryAllocator5kfreeEPv+0x64>
    80001e38:	0200006f          	j	80001e58 <_ZN15MemoryAllocator5kfreeEPv+0x94>
	else usedMemHead = currentUsed->next;
    80001e3c:	0007b783          	ld	a5,0(a5)
    80001e40:	00004717          	auipc	a4,0x4
    80001e44:	c8f73c23          	sd	a5,-872(a4) # 80005ad8 <_ZN15MemoryAllocator11usedMemHeadE>
    80001e48:	fd1ff06f          	j	80001e18 <_ZN15MemoryAllocator5kfreeEPv+0x54>
		prevFree = nullptr;
    80001e4c:	00078493          	mv	s1,a5
    80001e50:	0080006f          	j	80001e58 <_ZN15MemoryAllocator5kfreeEPv+0x94>
    80001e54:	00000493          	li	s1,0
	size_t segmentSize = ((UsedMemSegment*)ptr)->size;
    80001e58:	ff86b783          	ld	a5,-8(a3)
	newFree->size = segmentSize;
    80001e5c:	00f6b023          	sd	a5,0(a3)
	newFree->prev = prevFree;
    80001e60:	fe96bc23          	sd	s1,-8(a3)
	if (prevFree) newFree->next = prevFree->next;
    80001e64:	04048663          	beqz	s1,80001eb0 <_ZN15MemoryAllocator5kfreeEPv+0xec>
    80001e68:	0004b783          	ld	a5,0(s1)
    80001e6c:	fef6b823          	sd	a5,-16(a3)
	if (newFree->next) newFree->next->prev = newFree;
    80001e70:	ff06b783          	ld	a5,-16(a3)
    80001e74:	00078463          	beqz	a5,80001e7c <_ZN15MemoryAllocator5kfreeEPv+0xb8>
    80001e78:	00a7b423          	sd	a0,8(a5)
	if (prevFree) prevFree->next = newFree;
    80001e7c:	04048263          	beqz	s1,80001ec0 <_ZN15MemoryAllocator5kfreeEPv+0xfc>
    80001e80:	00a4b023          	sd	a0,0(s1)
	tryToJoin(newFree);
    80001e84:	00000097          	auipc	ra,0x0
    80001e88:	ed8080e7          	jalr	-296(ra) # 80001d5c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
	tryToJoin(prevFree);
    80001e8c:	00048513          	mv	a0,s1
    80001e90:	00000097          	auipc	ra,0x0
    80001e94:	ecc080e7          	jalr	-308(ra) # 80001d5c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
	return 0;
    80001e98:	00000513          	li	a0,0
}
    80001e9c:	01813083          	ld	ra,24(sp)
    80001ea0:	01013403          	ld	s0,16(sp)
    80001ea4:	00813483          	ld	s1,8(sp)
    80001ea8:	02010113          	addi	sp,sp,32
    80001eac:	00008067          	ret
	else newFree->next = freeMemHead;
    80001eb0:	00004797          	auipc	a5,0x4
    80001eb4:	c207b783          	ld	a5,-992(a5) # 80005ad0 <_ZN15MemoryAllocator11freeMemHeadE>
    80001eb8:	fef6b823          	sd	a5,-16(a3)
    80001ebc:	fb5ff06f          	j	80001e70 <_ZN15MemoryAllocator5kfreeEPv+0xac>
	else freeMemHead = newFree;
    80001ec0:	00004797          	auipc	a5,0x4
    80001ec4:	c0a7b823          	sd	a0,-1008(a5) # 80005ad0 <_ZN15MemoryAllocator11freeMemHeadE>
    80001ec8:	fbdff06f          	j	80001e84 <_ZN15MemoryAllocator5kfreeEPv+0xc0>
	if (!ptr) return 0;
    80001ecc:	00000513          	li	a0,0
    80001ed0:	00008067          	ret
	if (!usedMemHead) return -1;
    80001ed4:	fff00513          	li	a0,-1
    80001ed8:	00008067          	ret
	if (currentUsed != ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    80001edc:	fff00513          	li	a0,-1
}
    80001ee0:	00008067          	ret

0000000080001ee4 <_Z10testMemoryv>:
// Created by os on 5/29/23.
//
#include "../h/MemoryAllocator.hpp"
#include "../h/helper.hpp"

void testMemory() {
    80001ee4:	81010113          	addi	sp,sp,-2032
    80001ee8:	7e113423          	sd	ra,2024(sp)
    80001eec:	7e813023          	sd	s0,2016(sp)
    80001ef0:	7c913c23          	sd	s1,2008(sp)
    80001ef4:	7f010413          	addi	s0,sp,2032
    80001ef8:	82010113          	addi	sp,sp,-2016
	const uint64 NumAllocations = 501;	//zasto nece za preko 500????
	const uint64 AllocationSize = 16;

	// Allocate and initialize pointers
	int* allocations[NumAllocations];
	for (uint64 i = 0; i < NumAllocations; ++i)
    80001efc:	00000713          	li	a4,0
    80001f00:	1f400793          	li	a5,500
    80001f04:	02e7e263          	bltu	a5,a4,80001f28 <_Z10testMemoryv+0x44>
		allocations[i] = nullptr;
    80001f08:	fffff7b7          	lui	a5,0xfffff
    80001f0c:	00371693          	slli	a3,a4,0x3
    80001f10:	fe040613          	addi	a2,s0,-32
    80001f14:	00f607b3          	add	a5,a2,a5
    80001f18:	00d787b3          	add	a5,a5,a3
    80001f1c:	0407bc23          	sd	zero,88(a5) # fffffffffffff058 <end+0xffffffff7fff8318>
	for (uint64 i = 0; i < NumAllocations; ++i)
    80001f20:	00170713          	addi	a4,a4,1
    80001f24:	fddff06f          	j	80001f00 <_Z10testMemoryv+0x1c>

	// Allocate memory
	for (uint64 i = 0; i < NumAllocations; ++i) {
    80001f28:	00000493          	li	s1,0
    80001f2c:	1f400793          	li	a5,500
    80001f30:	0497e863          	bltu	a5,s1,80001f80 <_Z10testMemoryv+0x9c>
		allocations[i] = static_cast<int*>(MemoryAllocator::kmalloc(AllocationSize));
    80001f34:	01000513          	li	a0,16
    80001f38:	00000097          	auipc	ra,0x0
    80001f3c:	ce0080e7          	jalr	-800(ra) # 80001c18 <_ZN15MemoryAllocator7kmallocEm>
    80001f40:	fffff737          	lui	a4,0xfffff
    80001f44:	00349793          	slli	a5,s1,0x3
    80001f48:	fe040693          	addi	a3,s0,-32
    80001f4c:	00e68733          	add	a4,a3,a4
    80001f50:	00f707b3          	add	a5,a4,a5
    80001f54:	04a7bc23          	sd	a0,88(a5)
		if (allocations[i] == nullptr) {
    80001f58:	00050663          	beqz	a0,80001f64 <_Z10testMemoryv+0x80>
	for (uint64 i = 0; i < NumAllocations; ++i) {
    80001f5c:	00148493          	addi	s1,s1,1
    80001f60:	fcdff06f          	j	80001f2c <_Z10testMemoryv+0x48>
			printString("\nAllocation failed for index ");
    80001f64:	00003517          	auipc	a0,0x3
    80001f68:	25450513          	addi	a0,a0,596 # 800051b8 <_ZZ12printIntegermE6digits+0x198>
    80001f6c:	fffff097          	auipc	ra,0xfffff
    80001f70:	4cc080e7          	jalr	1228(ra) # 80001438 <_Z11printStringPKc>
			printInteger(i);
    80001f74:	00048513          	mv	a0,s1
    80001f78:	fffff097          	auipc	ra,0xfffff
    80001f7c:	538080e7          	jalr	1336(ra) # 800014b0 <_Z12printIntegerm>
	for (uint64 i = 0; i < NumAllocations; ++i) {
    80001f80:	00000493          	li	s1,0
    80001f84:	0240006f          	j	80001fa8 <_Z10testMemoryv+0xc4>

	// Free memory
	for (uint64 i = 0; i < NumAllocations; ++i) {
		if (allocations[i] != nullptr) {
			if (MemoryAllocator::kfree(allocations[i]) != 0) {
				printString("\nDeallocation failed for index ");
    80001f88:	00003517          	auipc	a0,0x3
    80001f8c:	25050513          	addi	a0,a0,592 # 800051d8 <_ZZ12printIntegermE6digits+0x1b8>
    80001f90:	fffff097          	auipc	ra,0xfffff
    80001f94:	4a8080e7          	jalr	1192(ra) # 80001438 <_Z11printStringPKc>
				printInteger(i);
    80001f98:	00048513          	mv	a0,s1
    80001f9c:	fffff097          	auipc	ra,0xfffff
    80001fa0:	514080e7          	jalr	1300(ra) # 800014b0 <_Z12printIntegerm>
	for (uint64 i = 0; i < NumAllocations; ++i) {
    80001fa4:	00148493          	addi	s1,s1,1
    80001fa8:	1f400793          	li	a5,500
    80001fac:	0297e863          	bltu	a5,s1,80001fdc <_Z10testMemoryv+0xf8>
		if (allocations[i] != nullptr) {
    80001fb0:	fffff737          	lui	a4,0xfffff
    80001fb4:	00349793          	slli	a5,s1,0x3
    80001fb8:	fe040693          	addi	a3,s0,-32
    80001fbc:	00e68733          	add	a4,a3,a4
    80001fc0:	00f707b3          	add	a5,a4,a5
    80001fc4:	0587b503          	ld	a0,88(a5)
    80001fc8:	fc050ee3          	beqz	a0,80001fa4 <_Z10testMemoryv+0xc0>
			if (MemoryAllocator::kfree(allocations[i]) != 0) {
    80001fcc:	00000097          	auipc	ra,0x0
    80001fd0:	df8080e7          	jalr	-520(ra) # 80001dc4 <_ZN15MemoryAllocator5kfreeEPv>
    80001fd4:	fc0508e3          	beqz	a0,80001fa4 <_Z10testMemoryv+0xc0>
    80001fd8:	fb1ff06f          	j	80001f88 <_Z10testMemoryv+0xa4>
			}
		}
	}
    80001fdc:	7e010113          	addi	sp,sp,2016
    80001fe0:	7e813083          	ld	ra,2024(sp)
    80001fe4:	7e013403          	ld	s0,2016(sp)
    80001fe8:	7d813483          	ld	s1,2008(sp)
    80001fec:	7f010113          	addi	sp,sp,2032
    80001ff0:	00008067          	ret

0000000080001ff4 <start>:
    80001ff4:	ff010113          	addi	sp,sp,-16
    80001ff8:	00813423          	sd	s0,8(sp)
    80001ffc:	01010413          	addi	s0,sp,16
    80002000:	300027f3          	csrr	a5,mstatus
    80002004:	ffffe737          	lui	a4,0xffffe
    80002008:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff7abf>
    8000200c:	00e7f7b3          	and	a5,a5,a4
    80002010:	00001737          	lui	a4,0x1
    80002014:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80002018:	00e7e7b3          	or	a5,a5,a4
    8000201c:	30079073          	csrw	mstatus,a5
    80002020:	00000797          	auipc	a5,0x0
    80002024:	16078793          	addi	a5,a5,352 # 80002180 <system_main>
    80002028:	34179073          	csrw	mepc,a5
    8000202c:	00000793          	li	a5,0
    80002030:	18079073          	csrw	satp,a5
    80002034:	000107b7          	lui	a5,0x10
    80002038:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    8000203c:	30279073          	csrw	medeleg,a5
    80002040:	30379073          	csrw	mideleg,a5
    80002044:	104027f3          	csrr	a5,sie
    80002048:	2227e793          	ori	a5,a5,546
    8000204c:	10479073          	csrw	sie,a5
    80002050:	fff00793          	li	a5,-1
    80002054:	00a7d793          	srli	a5,a5,0xa
    80002058:	3b079073          	csrw	pmpaddr0,a5
    8000205c:	00f00793          	li	a5,15
    80002060:	3a079073          	csrw	pmpcfg0,a5
    80002064:	f14027f3          	csrr	a5,mhartid
    80002068:	0200c737          	lui	a4,0x200c
    8000206c:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80002070:	0007869b          	sext.w	a3,a5
    80002074:	00269713          	slli	a4,a3,0x2
    80002078:	000f4637          	lui	a2,0xf4
    8000207c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80002080:	00d70733          	add	a4,a4,a3
    80002084:	0037979b          	slliw	a5,a5,0x3
    80002088:	020046b7          	lui	a3,0x2004
    8000208c:	00d787b3          	add	a5,a5,a3
    80002090:	00c585b3          	add	a1,a1,a2
    80002094:	00371693          	slli	a3,a4,0x3
    80002098:	00004717          	auipc	a4,0x4
    8000209c:	a4870713          	addi	a4,a4,-1464 # 80005ae0 <timer_scratch>
    800020a0:	00b7b023          	sd	a1,0(a5)
    800020a4:	00d70733          	add	a4,a4,a3
    800020a8:	00f73c23          	sd	a5,24(a4)
    800020ac:	02c73023          	sd	a2,32(a4)
    800020b0:	34071073          	csrw	mscratch,a4
    800020b4:	00000797          	auipc	a5,0x0
    800020b8:	6ec78793          	addi	a5,a5,1772 # 800027a0 <timervec>
    800020bc:	30579073          	csrw	mtvec,a5
    800020c0:	300027f3          	csrr	a5,mstatus
    800020c4:	0087e793          	ori	a5,a5,8
    800020c8:	30079073          	csrw	mstatus,a5
    800020cc:	304027f3          	csrr	a5,mie
    800020d0:	0807e793          	ori	a5,a5,128
    800020d4:	30479073          	csrw	mie,a5
    800020d8:	f14027f3          	csrr	a5,mhartid
    800020dc:	0007879b          	sext.w	a5,a5
    800020e0:	00078213          	mv	tp,a5
    800020e4:	30200073          	mret
    800020e8:	00813403          	ld	s0,8(sp)
    800020ec:	01010113          	addi	sp,sp,16
    800020f0:	00008067          	ret

00000000800020f4 <timerinit>:
    800020f4:	ff010113          	addi	sp,sp,-16
    800020f8:	00813423          	sd	s0,8(sp)
    800020fc:	01010413          	addi	s0,sp,16
    80002100:	f14027f3          	csrr	a5,mhartid
    80002104:	0200c737          	lui	a4,0x200c
    80002108:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    8000210c:	0007869b          	sext.w	a3,a5
    80002110:	00269713          	slli	a4,a3,0x2
    80002114:	000f4637          	lui	a2,0xf4
    80002118:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    8000211c:	00d70733          	add	a4,a4,a3
    80002120:	0037979b          	slliw	a5,a5,0x3
    80002124:	020046b7          	lui	a3,0x2004
    80002128:	00d787b3          	add	a5,a5,a3
    8000212c:	00c585b3          	add	a1,a1,a2
    80002130:	00371693          	slli	a3,a4,0x3
    80002134:	00004717          	auipc	a4,0x4
    80002138:	9ac70713          	addi	a4,a4,-1620 # 80005ae0 <timer_scratch>
    8000213c:	00b7b023          	sd	a1,0(a5)
    80002140:	00d70733          	add	a4,a4,a3
    80002144:	00f73c23          	sd	a5,24(a4)
    80002148:	02c73023          	sd	a2,32(a4)
    8000214c:	34071073          	csrw	mscratch,a4
    80002150:	00000797          	auipc	a5,0x0
    80002154:	65078793          	addi	a5,a5,1616 # 800027a0 <timervec>
    80002158:	30579073          	csrw	mtvec,a5
    8000215c:	300027f3          	csrr	a5,mstatus
    80002160:	0087e793          	ori	a5,a5,8
    80002164:	30079073          	csrw	mstatus,a5
    80002168:	304027f3          	csrr	a5,mie
    8000216c:	0807e793          	ori	a5,a5,128
    80002170:	30479073          	csrw	mie,a5
    80002174:	00813403          	ld	s0,8(sp)
    80002178:	01010113          	addi	sp,sp,16
    8000217c:	00008067          	ret

0000000080002180 <system_main>:
    80002180:	fe010113          	addi	sp,sp,-32
    80002184:	00813823          	sd	s0,16(sp)
    80002188:	00913423          	sd	s1,8(sp)
    8000218c:	00113c23          	sd	ra,24(sp)
    80002190:	02010413          	addi	s0,sp,32
    80002194:	00000097          	auipc	ra,0x0
    80002198:	0c4080e7          	jalr	196(ra) # 80002258 <cpuid>
    8000219c:	00004497          	auipc	s1,0x4
    800021a0:	8d448493          	addi	s1,s1,-1836 # 80005a70 <started>
    800021a4:	02050263          	beqz	a0,800021c8 <system_main+0x48>
    800021a8:	0004a783          	lw	a5,0(s1)
    800021ac:	0007879b          	sext.w	a5,a5
    800021b0:	fe078ce3          	beqz	a5,800021a8 <system_main+0x28>
    800021b4:	0ff0000f          	fence
    800021b8:	00003517          	auipc	a0,0x3
    800021bc:	07050513          	addi	a0,a0,112 # 80005228 <_ZZ12printIntegermE6digits+0x208>
    800021c0:	00001097          	auipc	ra,0x1
    800021c4:	a7c080e7          	jalr	-1412(ra) # 80002c3c <panic>
    800021c8:	00001097          	auipc	ra,0x1
    800021cc:	9d0080e7          	jalr	-1584(ra) # 80002b98 <consoleinit>
    800021d0:	00001097          	auipc	ra,0x1
    800021d4:	15c080e7          	jalr	348(ra) # 8000332c <printfinit>
    800021d8:	00003517          	auipc	a0,0x3
    800021dc:	13050513          	addi	a0,a0,304 # 80005308 <_ZZ12printIntegermE6digits+0x2e8>
    800021e0:	00001097          	auipc	ra,0x1
    800021e4:	ab8080e7          	jalr	-1352(ra) # 80002c98 <__printf>
    800021e8:	00003517          	auipc	a0,0x3
    800021ec:	01050513          	addi	a0,a0,16 # 800051f8 <_ZZ12printIntegermE6digits+0x1d8>
    800021f0:	00001097          	auipc	ra,0x1
    800021f4:	aa8080e7          	jalr	-1368(ra) # 80002c98 <__printf>
    800021f8:	00003517          	auipc	a0,0x3
    800021fc:	11050513          	addi	a0,a0,272 # 80005308 <_ZZ12printIntegermE6digits+0x2e8>
    80002200:	00001097          	auipc	ra,0x1
    80002204:	a98080e7          	jalr	-1384(ra) # 80002c98 <__printf>
    80002208:	00001097          	auipc	ra,0x1
    8000220c:	4b0080e7          	jalr	1200(ra) # 800036b8 <kinit>
    80002210:	00000097          	auipc	ra,0x0
    80002214:	148080e7          	jalr	328(ra) # 80002358 <trapinit>
    80002218:	00000097          	auipc	ra,0x0
    8000221c:	16c080e7          	jalr	364(ra) # 80002384 <trapinithart>
    80002220:	00000097          	auipc	ra,0x0
    80002224:	5c0080e7          	jalr	1472(ra) # 800027e0 <plicinit>
    80002228:	00000097          	auipc	ra,0x0
    8000222c:	5e0080e7          	jalr	1504(ra) # 80002808 <plicinithart>
    80002230:	00000097          	auipc	ra,0x0
    80002234:	078080e7          	jalr	120(ra) # 800022a8 <userinit>
    80002238:	0ff0000f          	fence
    8000223c:	00100793          	li	a5,1
    80002240:	00003517          	auipc	a0,0x3
    80002244:	fd050513          	addi	a0,a0,-48 # 80005210 <_ZZ12printIntegermE6digits+0x1f0>
    80002248:	00f4a023          	sw	a5,0(s1)
    8000224c:	00001097          	auipc	ra,0x1
    80002250:	a4c080e7          	jalr	-1460(ra) # 80002c98 <__printf>
    80002254:	0000006f          	j	80002254 <system_main+0xd4>

0000000080002258 <cpuid>:
    80002258:	ff010113          	addi	sp,sp,-16
    8000225c:	00813423          	sd	s0,8(sp)
    80002260:	01010413          	addi	s0,sp,16
    80002264:	00020513          	mv	a0,tp
    80002268:	00813403          	ld	s0,8(sp)
    8000226c:	0005051b          	sext.w	a0,a0
    80002270:	01010113          	addi	sp,sp,16
    80002274:	00008067          	ret

0000000080002278 <mycpu>:
    80002278:	ff010113          	addi	sp,sp,-16
    8000227c:	00813423          	sd	s0,8(sp)
    80002280:	01010413          	addi	s0,sp,16
    80002284:	00020793          	mv	a5,tp
    80002288:	00813403          	ld	s0,8(sp)
    8000228c:	0007879b          	sext.w	a5,a5
    80002290:	00779793          	slli	a5,a5,0x7
    80002294:	00005517          	auipc	a0,0x5
    80002298:	87c50513          	addi	a0,a0,-1924 # 80006b10 <cpus>
    8000229c:	00f50533          	add	a0,a0,a5
    800022a0:	01010113          	addi	sp,sp,16
    800022a4:	00008067          	ret

00000000800022a8 <userinit>:
    800022a8:	ff010113          	addi	sp,sp,-16
    800022ac:	00813423          	sd	s0,8(sp)
    800022b0:	01010413          	addi	s0,sp,16
    800022b4:	00813403          	ld	s0,8(sp)
    800022b8:	01010113          	addi	sp,sp,16
    800022bc:	fffff317          	auipc	t1,0xfffff
    800022c0:	44030067          	jr	1088(t1) # 800016fc <main>

00000000800022c4 <either_copyout>:
    800022c4:	ff010113          	addi	sp,sp,-16
    800022c8:	00813023          	sd	s0,0(sp)
    800022cc:	00113423          	sd	ra,8(sp)
    800022d0:	01010413          	addi	s0,sp,16
    800022d4:	02051663          	bnez	a0,80002300 <either_copyout+0x3c>
    800022d8:	00058513          	mv	a0,a1
    800022dc:	00060593          	mv	a1,a2
    800022e0:	0006861b          	sext.w	a2,a3
    800022e4:	00002097          	auipc	ra,0x2
    800022e8:	c60080e7          	jalr	-928(ra) # 80003f44 <__memmove>
    800022ec:	00813083          	ld	ra,8(sp)
    800022f0:	00013403          	ld	s0,0(sp)
    800022f4:	00000513          	li	a0,0
    800022f8:	01010113          	addi	sp,sp,16
    800022fc:	00008067          	ret
    80002300:	00003517          	auipc	a0,0x3
    80002304:	f5050513          	addi	a0,a0,-176 # 80005250 <_ZZ12printIntegermE6digits+0x230>
    80002308:	00001097          	auipc	ra,0x1
    8000230c:	934080e7          	jalr	-1740(ra) # 80002c3c <panic>

0000000080002310 <either_copyin>:
    80002310:	ff010113          	addi	sp,sp,-16
    80002314:	00813023          	sd	s0,0(sp)
    80002318:	00113423          	sd	ra,8(sp)
    8000231c:	01010413          	addi	s0,sp,16
    80002320:	02059463          	bnez	a1,80002348 <either_copyin+0x38>
    80002324:	00060593          	mv	a1,a2
    80002328:	0006861b          	sext.w	a2,a3
    8000232c:	00002097          	auipc	ra,0x2
    80002330:	c18080e7          	jalr	-1000(ra) # 80003f44 <__memmove>
    80002334:	00813083          	ld	ra,8(sp)
    80002338:	00013403          	ld	s0,0(sp)
    8000233c:	00000513          	li	a0,0
    80002340:	01010113          	addi	sp,sp,16
    80002344:	00008067          	ret
    80002348:	00003517          	auipc	a0,0x3
    8000234c:	f3050513          	addi	a0,a0,-208 # 80005278 <_ZZ12printIntegermE6digits+0x258>
    80002350:	00001097          	auipc	ra,0x1
    80002354:	8ec080e7          	jalr	-1812(ra) # 80002c3c <panic>

0000000080002358 <trapinit>:
    80002358:	ff010113          	addi	sp,sp,-16
    8000235c:	00813423          	sd	s0,8(sp)
    80002360:	01010413          	addi	s0,sp,16
    80002364:	00813403          	ld	s0,8(sp)
    80002368:	00003597          	auipc	a1,0x3
    8000236c:	f3858593          	addi	a1,a1,-200 # 800052a0 <_ZZ12printIntegermE6digits+0x280>
    80002370:	00005517          	auipc	a0,0x5
    80002374:	82050513          	addi	a0,a0,-2016 # 80006b90 <tickslock>
    80002378:	01010113          	addi	sp,sp,16
    8000237c:	00001317          	auipc	t1,0x1
    80002380:	5cc30067          	jr	1484(t1) # 80003948 <initlock>

0000000080002384 <trapinithart>:
    80002384:	ff010113          	addi	sp,sp,-16
    80002388:	00813423          	sd	s0,8(sp)
    8000238c:	01010413          	addi	s0,sp,16
    80002390:	00000797          	auipc	a5,0x0
    80002394:	30078793          	addi	a5,a5,768 # 80002690 <kernelvec>
    80002398:	10579073          	csrw	stvec,a5
    8000239c:	00813403          	ld	s0,8(sp)
    800023a0:	01010113          	addi	sp,sp,16
    800023a4:	00008067          	ret

00000000800023a8 <usertrap>:
    800023a8:	ff010113          	addi	sp,sp,-16
    800023ac:	00813423          	sd	s0,8(sp)
    800023b0:	01010413          	addi	s0,sp,16
    800023b4:	00813403          	ld	s0,8(sp)
    800023b8:	01010113          	addi	sp,sp,16
    800023bc:	00008067          	ret

00000000800023c0 <usertrapret>:
    800023c0:	ff010113          	addi	sp,sp,-16
    800023c4:	00813423          	sd	s0,8(sp)
    800023c8:	01010413          	addi	s0,sp,16
    800023cc:	00813403          	ld	s0,8(sp)
    800023d0:	01010113          	addi	sp,sp,16
    800023d4:	00008067          	ret

00000000800023d8 <kerneltrap>:
    800023d8:	fe010113          	addi	sp,sp,-32
    800023dc:	00813823          	sd	s0,16(sp)
    800023e0:	00113c23          	sd	ra,24(sp)
    800023e4:	00913423          	sd	s1,8(sp)
    800023e8:	02010413          	addi	s0,sp,32
    800023ec:	142025f3          	csrr	a1,scause
    800023f0:	100027f3          	csrr	a5,sstatus
    800023f4:	0027f793          	andi	a5,a5,2
    800023f8:	10079c63          	bnez	a5,80002510 <kerneltrap+0x138>
    800023fc:	142027f3          	csrr	a5,scause
    80002400:	0207ce63          	bltz	a5,8000243c <kerneltrap+0x64>
    80002404:	00003517          	auipc	a0,0x3
    80002408:	ee450513          	addi	a0,a0,-284 # 800052e8 <_ZZ12printIntegermE6digits+0x2c8>
    8000240c:	00001097          	auipc	ra,0x1
    80002410:	88c080e7          	jalr	-1908(ra) # 80002c98 <__printf>
    80002414:	141025f3          	csrr	a1,sepc
    80002418:	14302673          	csrr	a2,stval
    8000241c:	00003517          	auipc	a0,0x3
    80002420:	edc50513          	addi	a0,a0,-292 # 800052f8 <_ZZ12printIntegermE6digits+0x2d8>
    80002424:	00001097          	auipc	ra,0x1
    80002428:	874080e7          	jalr	-1932(ra) # 80002c98 <__printf>
    8000242c:	00003517          	auipc	a0,0x3
    80002430:	ee450513          	addi	a0,a0,-284 # 80005310 <_ZZ12printIntegermE6digits+0x2f0>
    80002434:	00001097          	auipc	ra,0x1
    80002438:	808080e7          	jalr	-2040(ra) # 80002c3c <panic>
    8000243c:	0ff7f713          	andi	a4,a5,255
    80002440:	00900693          	li	a3,9
    80002444:	04d70063          	beq	a4,a3,80002484 <kerneltrap+0xac>
    80002448:	fff00713          	li	a4,-1
    8000244c:	03f71713          	slli	a4,a4,0x3f
    80002450:	00170713          	addi	a4,a4,1
    80002454:	fae798e3          	bne	a5,a4,80002404 <kerneltrap+0x2c>
    80002458:	00000097          	auipc	ra,0x0
    8000245c:	e00080e7          	jalr	-512(ra) # 80002258 <cpuid>
    80002460:	06050663          	beqz	a0,800024cc <kerneltrap+0xf4>
    80002464:	144027f3          	csrr	a5,sip
    80002468:	ffd7f793          	andi	a5,a5,-3
    8000246c:	14479073          	csrw	sip,a5
    80002470:	01813083          	ld	ra,24(sp)
    80002474:	01013403          	ld	s0,16(sp)
    80002478:	00813483          	ld	s1,8(sp)
    8000247c:	02010113          	addi	sp,sp,32
    80002480:	00008067          	ret
    80002484:	00000097          	auipc	ra,0x0
    80002488:	3d0080e7          	jalr	976(ra) # 80002854 <plic_claim>
    8000248c:	00a00793          	li	a5,10
    80002490:	00050493          	mv	s1,a0
    80002494:	06f50863          	beq	a0,a5,80002504 <kerneltrap+0x12c>
    80002498:	fc050ce3          	beqz	a0,80002470 <kerneltrap+0x98>
    8000249c:	00050593          	mv	a1,a0
    800024a0:	00003517          	auipc	a0,0x3
    800024a4:	e2850513          	addi	a0,a0,-472 # 800052c8 <_ZZ12printIntegermE6digits+0x2a8>
    800024a8:	00000097          	auipc	ra,0x0
    800024ac:	7f0080e7          	jalr	2032(ra) # 80002c98 <__printf>
    800024b0:	01013403          	ld	s0,16(sp)
    800024b4:	01813083          	ld	ra,24(sp)
    800024b8:	00048513          	mv	a0,s1
    800024bc:	00813483          	ld	s1,8(sp)
    800024c0:	02010113          	addi	sp,sp,32
    800024c4:	00000317          	auipc	t1,0x0
    800024c8:	3c830067          	jr	968(t1) # 8000288c <plic_complete>
    800024cc:	00004517          	auipc	a0,0x4
    800024d0:	6c450513          	addi	a0,a0,1732 # 80006b90 <tickslock>
    800024d4:	00001097          	auipc	ra,0x1
    800024d8:	498080e7          	jalr	1176(ra) # 8000396c <acquire>
    800024dc:	00003717          	auipc	a4,0x3
    800024e0:	59870713          	addi	a4,a4,1432 # 80005a74 <ticks>
    800024e4:	00072783          	lw	a5,0(a4)
    800024e8:	00004517          	auipc	a0,0x4
    800024ec:	6a850513          	addi	a0,a0,1704 # 80006b90 <tickslock>
    800024f0:	0017879b          	addiw	a5,a5,1
    800024f4:	00f72023          	sw	a5,0(a4)
    800024f8:	00001097          	auipc	ra,0x1
    800024fc:	540080e7          	jalr	1344(ra) # 80003a38 <release>
    80002500:	f65ff06f          	j	80002464 <kerneltrap+0x8c>
    80002504:	00001097          	auipc	ra,0x1
    80002508:	09c080e7          	jalr	156(ra) # 800035a0 <uartintr>
    8000250c:	fa5ff06f          	j	800024b0 <kerneltrap+0xd8>
    80002510:	00003517          	auipc	a0,0x3
    80002514:	d9850513          	addi	a0,a0,-616 # 800052a8 <_ZZ12printIntegermE6digits+0x288>
    80002518:	00000097          	auipc	ra,0x0
    8000251c:	724080e7          	jalr	1828(ra) # 80002c3c <panic>

0000000080002520 <clockintr>:
    80002520:	fe010113          	addi	sp,sp,-32
    80002524:	00813823          	sd	s0,16(sp)
    80002528:	00913423          	sd	s1,8(sp)
    8000252c:	00113c23          	sd	ra,24(sp)
    80002530:	02010413          	addi	s0,sp,32
    80002534:	00004497          	auipc	s1,0x4
    80002538:	65c48493          	addi	s1,s1,1628 # 80006b90 <tickslock>
    8000253c:	00048513          	mv	a0,s1
    80002540:	00001097          	auipc	ra,0x1
    80002544:	42c080e7          	jalr	1068(ra) # 8000396c <acquire>
    80002548:	00003717          	auipc	a4,0x3
    8000254c:	52c70713          	addi	a4,a4,1324 # 80005a74 <ticks>
    80002550:	00072783          	lw	a5,0(a4)
    80002554:	01013403          	ld	s0,16(sp)
    80002558:	01813083          	ld	ra,24(sp)
    8000255c:	00048513          	mv	a0,s1
    80002560:	0017879b          	addiw	a5,a5,1
    80002564:	00813483          	ld	s1,8(sp)
    80002568:	00f72023          	sw	a5,0(a4)
    8000256c:	02010113          	addi	sp,sp,32
    80002570:	00001317          	auipc	t1,0x1
    80002574:	4c830067          	jr	1224(t1) # 80003a38 <release>

0000000080002578 <devintr>:
    80002578:	142027f3          	csrr	a5,scause
    8000257c:	00000513          	li	a0,0
    80002580:	0007c463          	bltz	a5,80002588 <devintr+0x10>
    80002584:	00008067          	ret
    80002588:	fe010113          	addi	sp,sp,-32
    8000258c:	00813823          	sd	s0,16(sp)
    80002590:	00113c23          	sd	ra,24(sp)
    80002594:	00913423          	sd	s1,8(sp)
    80002598:	02010413          	addi	s0,sp,32
    8000259c:	0ff7f713          	andi	a4,a5,255
    800025a0:	00900693          	li	a3,9
    800025a4:	04d70c63          	beq	a4,a3,800025fc <devintr+0x84>
    800025a8:	fff00713          	li	a4,-1
    800025ac:	03f71713          	slli	a4,a4,0x3f
    800025b0:	00170713          	addi	a4,a4,1
    800025b4:	00e78c63          	beq	a5,a4,800025cc <devintr+0x54>
    800025b8:	01813083          	ld	ra,24(sp)
    800025bc:	01013403          	ld	s0,16(sp)
    800025c0:	00813483          	ld	s1,8(sp)
    800025c4:	02010113          	addi	sp,sp,32
    800025c8:	00008067          	ret
    800025cc:	00000097          	auipc	ra,0x0
    800025d0:	c8c080e7          	jalr	-884(ra) # 80002258 <cpuid>
    800025d4:	06050663          	beqz	a0,80002640 <devintr+0xc8>
    800025d8:	144027f3          	csrr	a5,sip
    800025dc:	ffd7f793          	andi	a5,a5,-3
    800025e0:	14479073          	csrw	sip,a5
    800025e4:	01813083          	ld	ra,24(sp)
    800025e8:	01013403          	ld	s0,16(sp)
    800025ec:	00813483          	ld	s1,8(sp)
    800025f0:	00200513          	li	a0,2
    800025f4:	02010113          	addi	sp,sp,32
    800025f8:	00008067          	ret
    800025fc:	00000097          	auipc	ra,0x0
    80002600:	258080e7          	jalr	600(ra) # 80002854 <plic_claim>
    80002604:	00a00793          	li	a5,10
    80002608:	00050493          	mv	s1,a0
    8000260c:	06f50663          	beq	a0,a5,80002678 <devintr+0x100>
    80002610:	00100513          	li	a0,1
    80002614:	fa0482e3          	beqz	s1,800025b8 <devintr+0x40>
    80002618:	00048593          	mv	a1,s1
    8000261c:	00003517          	auipc	a0,0x3
    80002620:	cac50513          	addi	a0,a0,-852 # 800052c8 <_ZZ12printIntegermE6digits+0x2a8>
    80002624:	00000097          	auipc	ra,0x0
    80002628:	674080e7          	jalr	1652(ra) # 80002c98 <__printf>
    8000262c:	00048513          	mv	a0,s1
    80002630:	00000097          	auipc	ra,0x0
    80002634:	25c080e7          	jalr	604(ra) # 8000288c <plic_complete>
    80002638:	00100513          	li	a0,1
    8000263c:	f7dff06f          	j	800025b8 <devintr+0x40>
    80002640:	00004517          	auipc	a0,0x4
    80002644:	55050513          	addi	a0,a0,1360 # 80006b90 <tickslock>
    80002648:	00001097          	auipc	ra,0x1
    8000264c:	324080e7          	jalr	804(ra) # 8000396c <acquire>
    80002650:	00003717          	auipc	a4,0x3
    80002654:	42470713          	addi	a4,a4,1060 # 80005a74 <ticks>
    80002658:	00072783          	lw	a5,0(a4)
    8000265c:	00004517          	auipc	a0,0x4
    80002660:	53450513          	addi	a0,a0,1332 # 80006b90 <tickslock>
    80002664:	0017879b          	addiw	a5,a5,1
    80002668:	00f72023          	sw	a5,0(a4)
    8000266c:	00001097          	auipc	ra,0x1
    80002670:	3cc080e7          	jalr	972(ra) # 80003a38 <release>
    80002674:	f65ff06f          	j	800025d8 <devintr+0x60>
    80002678:	00001097          	auipc	ra,0x1
    8000267c:	f28080e7          	jalr	-216(ra) # 800035a0 <uartintr>
    80002680:	fadff06f          	j	8000262c <devintr+0xb4>
	...

0000000080002690 <kernelvec>:
    80002690:	f0010113          	addi	sp,sp,-256
    80002694:	00113023          	sd	ra,0(sp)
    80002698:	00213423          	sd	sp,8(sp)
    8000269c:	00313823          	sd	gp,16(sp)
    800026a0:	00413c23          	sd	tp,24(sp)
    800026a4:	02513023          	sd	t0,32(sp)
    800026a8:	02613423          	sd	t1,40(sp)
    800026ac:	02713823          	sd	t2,48(sp)
    800026b0:	02813c23          	sd	s0,56(sp)
    800026b4:	04913023          	sd	s1,64(sp)
    800026b8:	04a13423          	sd	a0,72(sp)
    800026bc:	04b13823          	sd	a1,80(sp)
    800026c0:	04c13c23          	sd	a2,88(sp)
    800026c4:	06d13023          	sd	a3,96(sp)
    800026c8:	06e13423          	sd	a4,104(sp)
    800026cc:	06f13823          	sd	a5,112(sp)
    800026d0:	07013c23          	sd	a6,120(sp)
    800026d4:	09113023          	sd	a7,128(sp)
    800026d8:	09213423          	sd	s2,136(sp)
    800026dc:	09313823          	sd	s3,144(sp)
    800026e0:	09413c23          	sd	s4,152(sp)
    800026e4:	0b513023          	sd	s5,160(sp)
    800026e8:	0b613423          	sd	s6,168(sp)
    800026ec:	0b713823          	sd	s7,176(sp)
    800026f0:	0b813c23          	sd	s8,184(sp)
    800026f4:	0d913023          	sd	s9,192(sp)
    800026f8:	0da13423          	sd	s10,200(sp)
    800026fc:	0db13823          	sd	s11,208(sp)
    80002700:	0dc13c23          	sd	t3,216(sp)
    80002704:	0fd13023          	sd	t4,224(sp)
    80002708:	0fe13423          	sd	t5,232(sp)
    8000270c:	0ff13823          	sd	t6,240(sp)
    80002710:	cc9ff0ef          	jal	ra,800023d8 <kerneltrap>
    80002714:	00013083          	ld	ra,0(sp)
    80002718:	00813103          	ld	sp,8(sp)
    8000271c:	01013183          	ld	gp,16(sp)
    80002720:	02013283          	ld	t0,32(sp)
    80002724:	02813303          	ld	t1,40(sp)
    80002728:	03013383          	ld	t2,48(sp)
    8000272c:	03813403          	ld	s0,56(sp)
    80002730:	04013483          	ld	s1,64(sp)
    80002734:	04813503          	ld	a0,72(sp)
    80002738:	05013583          	ld	a1,80(sp)
    8000273c:	05813603          	ld	a2,88(sp)
    80002740:	06013683          	ld	a3,96(sp)
    80002744:	06813703          	ld	a4,104(sp)
    80002748:	07013783          	ld	a5,112(sp)
    8000274c:	07813803          	ld	a6,120(sp)
    80002750:	08013883          	ld	a7,128(sp)
    80002754:	08813903          	ld	s2,136(sp)
    80002758:	09013983          	ld	s3,144(sp)
    8000275c:	09813a03          	ld	s4,152(sp)
    80002760:	0a013a83          	ld	s5,160(sp)
    80002764:	0a813b03          	ld	s6,168(sp)
    80002768:	0b013b83          	ld	s7,176(sp)
    8000276c:	0b813c03          	ld	s8,184(sp)
    80002770:	0c013c83          	ld	s9,192(sp)
    80002774:	0c813d03          	ld	s10,200(sp)
    80002778:	0d013d83          	ld	s11,208(sp)
    8000277c:	0d813e03          	ld	t3,216(sp)
    80002780:	0e013e83          	ld	t4,224(sp)
    80002784:	0e813f03          	ld	t5,232(sp)
    80002788:	0f013f83          	ld	t6,240(sp)
    8000278c:	10010113          	addi	sp,sp,256
    80002790:	10200073          	sret
    80002794:	00000013          	nop
    80002798:	00000013          	nop
    8000279c:	00000013          	nop

00000000800027a0 <timervec>:
    800027a0:	34051573          	csrrw	a0,mscratch,a0
    800027a4:	00b53023          	sd	a1,0(a0)
    800027a8:	00c53423          	sd	a2,8(a0)
    800027ac:	00d53823          	sd	a3,16(a0)
    800027b0:	01853583          	ld	a1,24(a0)
    800027b4:	02053603          	ld	a2,32(a0)
    800027b8:	0005b683          	ld	a3,0(a1)
    800027bc:	00c686b3          	add	a3,a3,a2
    800027c0:	00d5b023          	sd	a3,0(a1)
    800027c4:	00200593          	li	a1,2
    800027c8:	14459073          	csrw	sip,a1
    800027cc:	01053683          	ld	a3,16(a0)
    800027d0:	00853603          	ld	a2,8(a0)
    800027d4:	00053583          	ld	a1,0(a0)
    800027d8:	34051573          	csrrw	a0,mscratch,a0
    800027dc:	30200073          	mret

00000000800027e0 <plicinit>:
    800027e0:	ff010113          	addi	sp,sp,-16
    800027e4:	00813423          	sd	s0,8(sp)
    800027e8:	01010413          	addi	s0,sp,16
    800027ec:	00813403          	ld	s0,8(sp)
    800027f0:	0c0007b7          	lui	a5,0xc000
    800027f4:	00100713          	li	a4,1
    800027f8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    800027fc:	00e7a223          	sw	a4,4(a5)
    80002800:	01010113          	addi	sp,sp,16
    80002804:	00008067          	ret

0000000080002808 <plicinithart>:
    80002808:	ff010113          	addi	sp,sp,-16
    8000280c:	00813023          	sd	s0,0(sp)
    80002810:	00113423          	sd	ra,8(sp)
    80002814:	01010413          	addi	s0,sp,16
    80002818:	00000097          	auipc	ra,0x0
    8000281c:	a40080e7          	jalr	-1472(ra) # 80002258 <cpuid>
    80002820:	0085171b          	slliw	a4,a0,0x8
    80002824:	0c0027b7          	lui	a5,0xc002
    80002828:	00e787b3          	add	a5,a5,a4
    8000282c:	40200713          	li	a4,1026
    80002830:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80002834:	00813083          	ld	ra,8(sp)
    80002838:	00013403          	ld	s0,0(sp)
    8000283c:	00d5151b          	slliw	a0,a0,0xd
    80002840:	0c2017b7          	lui	a5,0xc201
    80002844:	00a78533          	add	a0,a5,a0
    80002848:	00052023          	sw	zero,0(a0)
    8000284c:	01010113          	addi	sp,sp,16
    80002850:	00008067          	ret

0000000080002854 <plic_claim>:
    80002854:	ff010113          	addi	sp,sp,-16
    80002858:	00813023          	sd	s0,0(sp)
    8000285c:	00113423          	sd	ra,8(sp)
    80002860:	01010413          	addi	s0,sp,16
    80002864:	00000097          	auipc	ra,0x0
    80002868:	9f4080e7          	jalr	-1548(ra) # 80002258 <cpuid>
    8000286c:	00813083          	ld	ra,8(sp)
    80002870:	00013403          	ld	s0,0(sp)
    80002874:	00d5151b          	slliw	a0,a0,0xd
    80002878:	0c2017b7          	lui	a5,0xc201
    8000287c:	00a78533          	add	a0,a5,a0
    80002880:	00452503          	lw	a0,4(a0)
    80002884:	01010113          	addi	sp,sp,16
    80002888:	00008067          	ret

000000008000288c <plic_complete>:
    8000288c:	fe010113          	addi	sp,sp,-32
    80002890:	00813823          	sd	s0,16(sp)
    80002894:	00913423          	sd	s1,8(sp)
    80002898:	00113c23          	sd	ra,24(sp)
    8000289c:	02010413          	addi	s0,sp,32
    800028a0:	00050493          	mv	s1,a0
    800028a4:	00000097          	auipc	ra,0x0
    800028a8:	9b4080e7          	jalr	-1612(ra) # 80002258 <cpuid>
    800028ac:	01813083          	ld	ra,24(sp)
    800028b0:	01013403          	ld	s0,16(sp)
    800028b4:	00d5179b          	slliw	a5,a0,0xd
    800028b8:	0c201737          	lui	a4,0xc201
    800028bc:	00f707b3          	add	a5,a4,a5
    800028c0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    800028c4:	00813483          	ld	s1,8(sp)
    800028c8:	02010113          	addi	sp,sp,32
    800028cc:	00008067          	ret

00000000800028d0 <consolewrite>:
    800028d0:	fb010113          	addi	sp,sp,-80
    800028d4:	04813023          	sd	s0,64(sp)
    800028d8:	04113423          	sd	ra,72(sp)
    800028dc:	02913c23          	sd	s1,56(sp)
    800028e0:	03213823          	sd	s2,48(sp)
    800028e4:	03313423          	sd	s3,40(sp)
    800028e8:	03413023          	sd	s4,32(sp)
    800028ec:	01513c23          	sd	s5,24(sp)
    800028f0:	05010413          	addi	s0,sp,80
    800028f4:	06c05c63          	blez	a2,8000296c <consolewrite+0x9c>
    800028f8:	00060993          	mv	s3,a2
    800028fc:	00050a13          	mv	s4,a0
    80002900:	00058493          	mv	s1,a1
    80002904:	00000913          	li	s2,0
    80002908:	fff00a93          	li	s5,-1
    8000290c:	01c0006f          	j	80002928 <consolewrite+0x58>
    80002910:	fbf44503          	lbu	a0,-65(s0)
    80002914:	0019091b          	addiw	s2,s2,1
    80002918:	00148493          	addi	s1,s1,1
    8000291c:	00001097          	auipc	ra,0x1
    80002920:	a9c080e7          	jalr	-1380(ra) # 800033b8 <uartputc>
    80002924:	03298063          	beq	s3,s2,80002944 <consolewrite+0x74>
    80002928:	00048613          	mv	a2,s1
    8000292c:	00100693          	li	a3,1
    80002930:	000a0593          	mv	a1,s4
    80002934:	fbf40513          	addi	a0,s0,-65
    80002938:	00000097          	auipc	ra,0x0
    8000293c:	9d8080e7          	jalr	-1576(ra) # 80002310 <either_copyin>
    80002940:	fd5518e3          	bne	a0,s5,80002910 <consolewrite+0x40>
    80002944:	04813083          	ld	ra,72(sp)
    80002948:	04013403          	ld	s0,64(sp)
    8000294c:	03813483          	ld	s1,56(sp)
    80002950:	02813983          	ld	s3,40(sp)
    80002954:	02013a03          	ld	s4,32(sp)
    80002958:	01813a83          	ld	s5,24(sp)
    8000295c:	00090513          	mv	a0,s2
    80002960:	03013903          	ld	s2,48(sp)
    80002964:	05010113          	addi	sp,sp,80
    80002968:	00008067          	ret
    8000296c:	00000913          	li	s2,0
    80002970:	fd5ff06f          	j	80002944 <consolewrite+0x74>

0000000080002974 <consoleread>:
    80002974:	f9010113          	addi	sp,sp,-112
    80002978:	06813023          	sd	s0,96(sp)
    8000297c:	04913c23          	sd	s1,88(sp)
    80002980:	05213823          	sd	s2,80(sp)
    80002984:	05313423          	sd	s3,72(sp)
    80002988:	05413023          	sd	s4,64(sp)
    8000298c:	03513c23          	sd	s5,56(sp)
    80002990:	03613823          	sd	s6,48(sp)
    80002994:	03713423          	sd	s7,40(sp)
    80002998:	03813023          	sd	s8,32(sp)
    8000299c:	06113423          	sd	ra,104(sp)
    800029a0:	01913c23          	sd	s9,24(sp)
    800029a4:	07010413          	addi	s0,sp,112
    800029a8:	00060b93          	mv	s7,a2
    800029ac:	00050913          	mv	s2,a0
    800029b0:	00058c13          	mv	s8,a1
    800029b4:	00060b1b          	sext.w	s6,a2
    800029b8:	00004497          	auipc	s1,0x4
    800029bc:	20048493          	addi	s1,s1,512 # 80006bb8 <cons>
    800029c0:	00400993          	li	s3,4
    800029c4:	fff00a13          	li	s4,-1
    800029c8:	00a00a93          	li	s5,10
    800029cc:	05705e63          	blez	s7,80002a28 <consoleread+0xb4>
    800029d0:	09c4a703          	lw	a4,156(s1)
    800029d4:	0984a783          	lw	a5,152(s1)
    800029d8:	0007071b          	sext.w	a4,a4
    800029dc:	08e78463          	beq	a5,a4,80002a64 <consoleread+0xf0>
    800029e0:	07f7f713          	andi	a4,a5,127
    800029e4:	00e48733          	add	a4,s1,a4
    800029e8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    800029ec:	0017869b          	addiw	a3,a5,1
    800029f0:	08d4ac23          	sw	a3,152(s1)
    800029f4:	00070c9b          	sext.w	s9,a4
    800029f8:	0b370663          	beq	a4,s3,80002aa4 <consoleread+0x130>
    800029fc:	00100693          	li	a3,1
    80002a00:	f9f40613          	addi	a2,s0,-97
    80002a04:	000c0593          	mv	a1,s8
    80002a08:	00090513          	mv	a0,s2
    80002a0c:	f8e40fa3          	sb	a4,-97(s0)
    80002a10:	00000097          	auipc	ra,0x0
    80002a14:	8b4080e7          	jalr	-1868(ra) # 800022c4 <either_copyout>
    80002a18:	01450863          	beq	a0,s4,80002a28 <consoleread+0xb4>
    80002a1c:	001c0c13          	addi	s8,s8,1
    80002a20:	fffb8b9b          	addiw	s7,s7,-1
    80002a24:	fb5c94e3          	bne	s9,s5,800029cc <consoleread+0x58>
    80002a28:	000b851b          	sext.w	a0,s7
    80002a2c:	06813083          	ld	ra,104(sp)
    80002a30:	06013403          	ld	s0,96(sp)
    80002a34:	05813483          	ld	s1,88(sp)
    80002a38:	05013903          	ld	s2,80(sp)
    80002a3c:	04813983          	ld	s3,72(sp)
    80002a40:	04013a03          	ld	s4,64(sp)
    80002a44:	03813a83          	ld	s5,56(sp)
    80002a48:	02813b83          	ld	s7,40(sp)
    80002a4c:	02013c03          	ld	s8,32(sp)
    80002a50:	01813c83          	ld	s9,24(sp)
    80002a54:	40ab053b          	subw	a0,s6,a0
    80002a58:	03013b03          	ld	s6,48(sp)
    80002a5c:	07010113          	addi	sp,sp,112
    80002a60:	00008067          	ret
    80002a64:	00001097          	auipc	ra,0x1
    80002a68:	1d8080e7          	jalr	472(ra) # 80003c3c <push_on>
    80002a6c:	0984a703          	lw	a4,152(s1)
    80002a70:	09c4a783          	lw	a5,156(s1)
    80002a74:	0007879b          	sext.w	a5,a5
    80002a78:	fef70ce3          	beq	a4,a5,80002a70 <consoleread+0xfc>
    80002a7c:	00001097          	auipc	ra,0x1
    80002a80:	234080e7          	jalr	564(ra) # 80003cb0 <pop_on>
    80002a84:	0984a783          	lw	a5,152(s1)
    80002a88:	07f7f713          	andi	a4,a5,127
    80002a8c:	00e48733          	add	a4,s1,a4
    80002a90:	01874703          	lbu	a4,24(a4)
    80002a94:	0017869b          	addiw	a3,a5,1
    80002a98:	08d4ac23          	sw	a3,152(s1)
    80002a9c:	00070c9b          	sext.w	s9,a4
    80002aa0:	f5371ee3          	bne	a4,s3,800029fc <consoleread+0x88>
    80002aa4:	000b851b          	sext.w	a0,s7
    80002aa8:	f96bf2e3          	bgeu	s7,s6,80002a2c <consoleread+0xb8>
    80002aac:	08f4ac23          	sw	a5,152(s1)
    80002ab0:	f7dff06f          	j	80002a2c <consoleread+0xb8>

0000000080002ab4 <consputc>:
    80002ab4:	10000793          	li	a5,256
    80002ab8:	00f50663          	beq	a0,a5,80002ac4 <consputc+0x10>
    80002abc:	00001317          	auipc	t1,0x1
    80002ac0:	9f430067          	jr	-1548(t1) # 800034b0 <uartputc_sync>
    80002ac4:	ff010113          	addi	sp,sp,-16
    80002ac8:	00113423          	sd	ra,8(sp)
    80002acc:	00813023          	sd	s0,0(sp)
    80002ad0:	01010413          	addi	s0,sp,16
    80002ad4:	00800513          	li	a0,8
    80002ad8:	00001097          	auipc	ra,0x1
    80002adc:	9d8080e7          	jalr	-1576(ra) # 800034b0 <uartputc_sync>
    80002ae0:	02000513          	li	a0,32
    80002ae4:	00001097          	auipc	ra,0x1
    80002ae8:	9cc080e7          	jalr	-1588(ra) # 800034b0 <uartputc_sync>
    80002aec:	00013403          	ld	s0,0(sp)
    80002af0:	00813083          	ld	ra,8(sp)
    80002af4:	00800513          	li	a0,8
    80002af8:	01010113          	addi	sp,sp,16
    80002afc:	00001317          	auipc	t1,0x1
    80002b00:	9b430067          	jr	-1612(t1) # 800034b0 <uartputc_sync>

0000000080002b04 <consoleintr>:
    80002b04:	fe010113          	addi	sp,sp,-32
    80002b08:	00813823          	sd	s0,16(sp)
    80002b0c:	00913423          	sd	s1,8(sp)
    80002b10:	01213023          	sd	s2,0(sp)
    80002b14:	00113c23          	sd	ra,24(sp)
    80002b18:	02010413          	addi	s0,sp,32
    80002b1c:	00004917          	auipc	s2,0x4
    80002b20:	09c90913          	addi	s2,s2,156 # 80006bb8 <cons>
    80002b24:	00050493          	mv	s1,a0
    80002b28:	00090513          	mv	a0,s2
    80002b2c:	00001097          	auipc	ra,0x1
    80002b30:	e40080e7          	jalr	-448(ra) # 8000396c <acquire>
    80002b34:	02048c63          	beqz	s1,80002b6c <consoleintr+0x68>
    80002b38:	0a092783          	lw	a5,160(s2)
    80002b3c:	09892703          	lw	a4,152(s2)
    80002b40:	07f00693          	li	a3,127
    80002b44:	40e7873b          	subw	a4,a5,a4
    80002b48:	02e6e263          	bltu	a3,a4,80002b6c <consoleintr+0x68>
    80002b4c:	00d00713          	li	a4,13
    80002b50:	04e48063          	beq	s1,a4,80002b90 <consoleintr+0x8c>
    80002b54:	07f7f713          	andi	a4,a5,127
    80002b58:	00e90733          	add	a4,s2,a4
    80002b5c:	0017879b          	addiw	a5,a5,1
    80002b60:	0af92023          	sw	a5,160(s2)
    80002b64:	00970c23          	sb	s1,24(a4)
    80002b68:	08f92e23          	sw	a5,156(s2)
    80002b6c:	01013403          	ld	s0,16(sp)
    80002b70:	01813083          	ld	ra,24(sp)
    80002b74:	00813483          	ld	s1,8(sp)
    80002b78:	00013903          	ld	s2,0(sp)
    80002b7c:	00004517          	auipc	a0,0x4
    80002b80:	03c50513          	addi	a0,a0,60 # 80006bb8 <cons>
    80002b84:	02010113          	addi	sp,sp,32
    80002b88:	00001317          	auipc	t1,0x1
    80002b8c:	eb030067          	jr	-336(t1) # 80003a38 <release>
    80002b90:	00a00493          	li	s1,10
    80002b94:	fc1ff06f          	j	80002b54 <consoleintr+0x50>

0000000080002b98 <consoleinit>:
    80002b98:	fe010113          	addi	sp,sp,-32
    80002b9c:	00113c23          	sd	ra,24(sp)
    80002ba0:	00813823          	sd	s0,16(sp)
    80002ba4:	00913423          	sd	s1,8(sp)
    80002ba8:	02010413          	addi	s0,sp,32
    80002bac:	00004497          	auipc	s1,0x4
    80002bb0:	00c48493          	addi	s1,s1,12 # 80006bb8 <cons>
    80002bb4:	00048513          	mv	a0,s1
    80002bb8:	00002597          	auipc	a1,0x2
    80002bbc:	76858593          	addi	a1,a1,1896 # 80005320 <_ZZ12printIntegermE6digits+0x300>
    80002bc0:	00001097          	auipc	ra,0x1
    80002bc4:	d88080e7          	jalr	-632(ra) # 80003948 <initlock>
    80002bc8:	00000097          	auipc	ra,0x0
    80002bcc:	7ac080e7          	jalr	1964(ra) # 80003374 <uartinit>
    80002bd0:	01813083          	ld	ra,24(sp)
    80002bd4:	01013403          	ld	s0,16(sp)
    80002bd8:	00000797          	auipc	a5,0x0
    80002bdc:	d9c78793          	addi	a5,a5,-612 # 80002974 <consoleread>
    80002be0:	0af4bc23          	sd	a5,184(s1)
    80002be4:	00000797          	auipc	a5,0x0
    80002be8:	cec78793          	addi	a5,a5,-788 # 800028d0 <consolewrite>
    80002bec:	0cf4b023          	sd	a5,192(s1)
    80002bf0:	00813483          	ld	s1,8(sp)
    80002bf4:	02010113          	addi	sp,sp,32
    80002bf8:	00008067          	ret

0000000080002bfc <console_read>:
    80002bfc:	ff010113          	addi	sp,sp,-16
    80002c00:	00813423          	sd	s0,8(sp)
    80002c04:	01010413          	addi	s0,sp,16
    80002c08:	00813403          	ld	s0,8(sp)
    80002c0c:	00004317          	auipc	t1,0x4
    80002c10:	06433303          	ld	t1,100(t1) # 80006c70 <devsw+0x10>
    80002c14:	01010113          	addi	sp,sp,16
    80002c18:	00030067          	jr	t1

0000000080002c1c <console_write>:
    80002c1c:	ff010113          	addi	sp,sp,-16
    80002c20:	00813423          	sd	s0,8(sp)
    80002c24:	01010413          	addi	s0,sp,16
    80002c28:	00813403          	ld	s0,8(sp)
    80002c2c:	00004317          	auipc	t1,0x4
    80002c30:	04c33303          	ld	t1,76(t1) # 80006c78 <devsw+0x18>
    80002c34:	01010113          	addi	sp,sp,16
    80002c38:	00030067          	jr	t1

0000000080002c3c <panic>:
    80002c3c:	fe010113          	addi	sp,sp,-32
    80002c40:	00113c23          	sd	ra,24(sp)
    80002c44:	00813823          	sd	s0,16(sp)
    80002c48:	00913423          	sd	s1,8(sp)
    80002c4c:	02010413          	addi	s0,sp,32
    80002c50:	00050493          	mv	s1,a0
    80002c54:	00002517          	auipc	a0,0x2
    80002c58:	6d450513          	addi	a0,a0,1748 # 80005328 <_ZZ12printIntegermE6digits+0x308>
    80002c5c:	00004797          	auipc	a5,0x4
    80002c60:	0a07ae23          	sw	zero,188(a5) # 80006d18 <pr+0x18>
    80002c64:	00000097          	auipc	ra,0x0
    80002c68:	034080e7          	jalr	52(ra) # 80002c98 <__printf>
    80002c6c:	00048513          	mv	a0,s1
    80002c70:	00000097          	auipc	ra,0x0
    80002c74:	028080e7          	jalr	40(ra) # 80002c98 <__printf>
    80002c78:	00002517          	auipc	a0,0x2
    80002c7c:	69050513          	addi	a0,a0,1680 # 80005308 <_ZZ12printIntegermE6digits+0x2e8>
    80002c80:	00000097          	auipc	ra,0x0
    80002c84:	018080e7          	jalr	24(ra) # 80002c98 <__printf>
    80002c88:	00100793          	li	a5,1
    80002c8c:	00003717          	auipc	a4,0x3
    80002c90:	def72623          	sw	a5,-532(a4) # 80005a78 <panicked>
    80002c94:	0000006f          	j	80002c94 <panic+0x58>

0000000080002c98 <__printf>:
    80002c98:	f3010113          	addi	sp,sp,-208
    80002c9c:	08813023          	sd	s0,128(sp)
    80002ca0:	07313423          	sd	s3,104(sp)
    80002ca4:	09010413          	addi	s0,sp,144
    80002ca8:	05813023          	sd	s8,64(sp)
    80002cac:	08113423          	sd	ra,136(sp)
    80002cb0:	06913c23          	sd	s1,120(sp)
    80002cb4:	07213823          	sd	s2,112(sp)
    80002cb8:	07413023          	sd	s4,96(sp)
    80002cbc:	05513c23          	sd	s5,88(sp)
    80002cc0:	05613823          	sd	s6,80(sp)
    80002cc4:	05713423          	sd	s7,72(sp)
    80002cc8:	03913c23          	sd	s9,56(sp)
    80002ccc:	03a13823          	sd	s10,48(sp)
    80002cd0:	03b13423          	sd	s11,40(sp)
    80002cd4:	00004317          	auipc	t1,0x4
    80002cd8:	02c30313          	addi	t1,t1,44 # 80006d00 <pr>
    80002cdc:	01832c03          	lw	s8,24(t1)
    80002ce0:	00b43423          	sd	a1,8(s0)
    80002ce4:	00c43823          	sd	a2,16(s0)
    80002ce8:	00d43c23          	sd	a3,24(s0)
    80002cec:	02e43023          	sd	a4,32(s0)
    80002cf0:	02f43423          	sd	a5,40(s0)
    80002cf4:	03043823          	sd	a6,48(s0)
    80002cf8:	03143c23          	sd	a7,56(s0)
    80002cfc:	00050993          	mv	s3,a0
    80002d00:	4a0c1663          	bnez	s8,800031ac <__printf+0x514>
    80002d04:	60098c63          	beqz	s3,8000331c <__printf+0x684>
    80002d08:	0009c503          	lbu	a0,0(s3)
    80002d0c:	00840793          	addi	a5,s0,8
    80002d10:	f6f43c23          	sd	a5,-136(s0)
    80002d14:	00000493          	li	s1,0
    80002d18:	22050063          	beqz	a0,80002f38 <__printf+0x2a0>
    80002d1c:	00002a37          	lui	s4,0x2
    80002d20:	00018ab7          	lui	s5,0x18
    80002d24:	000f4b37          	lui	s6,0xf4
    80002d28:	00989bb7          	lui	s7,0x989
    80002d2c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80002d30:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80002d34:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80002d38:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80002d3c:	00148c9b          	addiw	s9,s1,1
    80002d40:	02500793          	li	a5,37
    80002d44:	01998933          	add	s2,s3,s9
    80002d48:	38f51263          	bne	a0,a5,800030cc <__printf+0x434>
    80002d4c:	00094783          	lbu	a5,0(s2)
    80002d50:	00078c9b          	sext.w	s9,a5
    80002d54:	1e078263          	beqz	a5,80002f38 <__printf+0x2a0>
    80002d58:	0024849b          	addiw	s1,s1,2
    80002d5c:	07000713          	li	a4,112
    80002d60:	00998933          	add	s2,s3,s1
    80002d64:	38e78a63          	beq	a5,a4,800030f8 <__printf+0x460>
    80002d68:	20f76863          	bltu	a4,a5,80002f78 <__printf+0x2e0>
    80002d6c:	42a78863          	beq	a5,a0,8000319c <__printf+0x504>
    80002d70:	06400713          	li	a4,100
    80002d74:	40e79663          	bne	a5,a4,80003180 <__printf+0x4e8>
    80002d78:	f7843783          	ld	a5,-136(s0)
    80002d7c:	0007a603          	lw	a2,0(a5)
    80002d80:	00878793          	addi	a5,a5,8
    80002d84:	f6f43c23          	sd	a5,-136(s0)
    80002d88:	42064a63          	bltz	a2,800031bc <__printf+0x524>
    80002d8c:	00a00713          	li	a4,10
    80002d90:	02e677bb          	remuw	a5,a2,a4
    80002d94:	00002d97          	auipc	s11,0x2
    80002d98:	5bcd8d93          	addi	s11,s11,1468 # 80005350 <digits>
    80002d9c:	00900593          	li	a1,9
    80002da0:	0006051b          	sext.w	a0,a2
    80002da4:	00000c93          	li	s9,0
    80002da8:	02079793          	slli	a5,a5,0x20
    80002dac:	0207d793          	srli	a5,a5,0x20
    80002db0:	00fd87b3          	add	a5,s11,a5
    80002db4:	0007c783          	lbu	a5,0(a5)
    80002db8:	02e656bb          	divuw	a3,a2,a4
    80002dbc:	f8f40023          	sb	a5,-128(s0)
    80002dc0:	14c5d863          	bge	a1,a2,80002f10 <__printf+0x278>
    80002dc4:	06300593          	li	a1,99
    80002dc8:	00100c93          	li	s9,1
    80002dcc:	02e6f7bb          	remuw	a5,a3,a4
    80002dd0:	02079793          	slli	a5,a5,0x20
    80002dd4:	0207d793          	srli	a5,a5,0x20
    80002dd8:	00fd87b3          	add	a5,s11,a5
    80002ddc:	0007c783          	lbu	a5,0(a5)
    80002de0:	02e6d73b          	divuw	a4,a3,a4
    80002de4:	f8f400a3          	sb	a5,-127(s0)
    80002de8:	12a5f463          	bgeu	a1,a0,80002f10 <__printf+0x278>
    80002dec:	00a00693          	li	a3,10
    80002df0:	00900593          	li	a1,9
    80002df4:	02d777bb          	remuw	a5,a4,a3
    80002df8:	02079793          	slli	a5,a5,0x20
    80002dfc:	0207d793          	srli	a5,a5,0x20
    80002e00:	00fd87b3          	add	a5,s11,a5
    80002e04:	0007c503          	lbu	a0,0(a5)
    80002e08:	02d757bb          	divuw	a5,a4,a3
    80002e0c:	f8a40123          	sb	a0,-126(s0)
    80002e10:	48e5f263          	bgeu	a1,a4,80003294 <__printf+0x5fc>
    80002e14:	06300513          	li	a0,99
    80002e18:	02d7f5bb          	remuw	a1,a5,a3
    80002e1c:	02059593          	slli	a1,a1,0x20
    80002e20:	0205d593          	srli	a1,a1,0x20
    80002e24:	00bd85b3          	add	a1,s11,a1
    80002e28:	0005c583          	lbu	a1,0(a1)
    80002e2c:	02d7d7bb          	divuw	a5,a5,a3
    80002e30:	f8b401a3          	sb	a1,-125(s0)
    80002e34:	48e57263          	bgeu	a0,a4,800032b8 <__printf+0x620>
    80002e38:	3e700513          	li	a0,999
    80002e3c:	02d7f5bb          	remuw	a1,a5,a3
    80002e40:	02059593          	slli	a1,a1,0x20
    80002e44:	0205d593          	srli	a1,a1,0x20
    80002e48:	00bd85b3          	add	a1,s11,a1
    80002e4c:	0005c583          	lbu	a1,0(a1)
    80002e50:	02d7d7bb          	divuw	a5,a5,a3
    80002e54:	f8b40223          	sb	a1,-124(s0)
    80002e58:	46e57663          	bgeu	a0,a4,800032c4 <__printf+0x62c>
    80002e5c:	02d7f5bb          	remuw	a1,a5,a3
    80002e60:	02059593          	slli	a1,a1,0x20
    80002e64:	0205d593          	srli	a1,a1,0x20
    80002e68:	00bd85b3          	add	a1,s11,a1
    80002e6c:	0005c583          	lbu	a1,0(a1)
    80002e70:	02d7d7bb          	divuw	a5,a5,a3
    80002e74:	f8b402a3          	sb	a1,-123(s0)
    80002e78:	46ea7863          	bgeu	s4,a4,800032e8 <__printf+0x650>
    80002e7c:	02d7f5bb          	remuw	a1,a5,a3
    80002e80:	02059593          	slli	a1,a1,0x20
    80002e84:	0205d593          	srli	a1,a1,0x20
    80002e88:	00bd85b3          	add	a1,s11,a1
    80002e8c:	0005c583          	lbu	a1,0(a1)
    80002e90:	02d7d7bb          	divuw	a5,a5,a3
    80002e94:	f8b40323          	sb	a1,-122(s0)
    80002e98:	3eeaf863          	bgeu	s5,a4,80003288 <__printf+0x5f0>
    80002e9c:	02d7f5bb          	remuw	a1,a5,a3
    80002ea0:	02059593          	slli	a1,a1,0x20
    80002ea4:	0205d593          	srli	a1,a1,0x20
    80002ea8:	00bd85b3          	add	a1,s11,a1
    80002eac:	0005c583          	lbu	a1,0(a1)
    80002eb0:	02d7d7bb          	divuw	a5,a5,a3
    80002eb4:	f8b403a3          	sb	a1,-121(s0)
    80002eb8:	42eb7e63          	bgeu	s6,a4,800032f4 <__printf+0x65c>
    80002ebc:	02d7f5bb          	remuw	a1,a5,a3
    80002ec0:	02059593          	slli	a1,a1,0x20
    80002ec4:	0205d593          	srli	a1,a1,0x20
    80002ec8:	00bd85b3          	add	a1,s11,a1
    80002ecc:	0005c583          	lbu	a1,0(a1)
    80002ed0:	02d7d7bb          	divuw	a5,a5,a3
    80002ed4:	f8b40423          	sb	a1,-120(s0)
    80002ed8:	42ebfc63          	bgeu	s7,a4,80003310 <__printf+0x678>
    80002edc:	02079793          	slli	a5,a5,0x20
    80002ee0:	0207d793          	srli	a5,a5,0x20
    80002ee4:	00fd8db3          	add	s11,s11,a5
    80002ee8:	000dc703          	lbu	a4,0(s11)
    80002eec:	00a00793          	li	a5,10
    80002ef0:	00900c93          	li	s9,9
    80002ef4:	f8e404a3          	sb	a4,-119(s0)
    80002ef8:	00065c63          	bgez	a2,80002f10 <__printf+0x278>
    80002efc:	f9040713          	addi	a4,s0,-112
    80002f00:	00f70733          	add	a4,a4,a5
    80002f04:	02d00693          	li	a3,45
    80002f08:	fed70823          	sb	a3,-16(a4)
    80002f0c:	00078c93          	mv	s9,a5
    80002f10:	f8040793          	addi	a5,s0,-128
    80002f14:	01978cb3          	add	s9,a5,s9
    80002f18:	f7f40d13          	addi	s10,s0,-129
    80002f1c:	000cc503          	lbu	a0,0(s9)
    80002f20:	fffc8c93          	addi	s9,s9,-1
    80002f24:	00000097          	auipc	ra,0x0
    80002f28:	b90080e7          	jalr	-1136(ra) # 80002ab4 <consputc>
    80002f2c:	ffac98e3          	bne	s9,s10,80002f1c <__printf+0x284>
    80002f30:	00094503          	lbu	a0,0(s2)
    80002f34:	e00514e3          	bnez	a0,80002d3c <__printf+0xa4>
    80002f38:	1a0c1663          	bnez	s8,800030e4 <__printf+0x44c>
    80002f3c:	08813083          	ld	ra,136(sp)
    80002f40:	08013403          	ld	s0,128(sp)
    80002f44:	07813483          	ld	s1,120(sp)
    80002f48:	07013903          	ld	s2,112(sp)
    80002f4c:	06813983          	ld	s3,104(sp)
    80002f50:	06013a03          	ld	s4,96(sp)
    80002f54:	05813a83          	ld	s5,88(sp)
    80002f58:	05013b03          	ld	s6,80(sp)
    80002f5c:	04813b83          	ld	s7,72(sp)
    80002f60:	04013c03          	ld	s8,64(sp)
    80002f64:	03813c83          	ld	s9,56(sp)
    80002f68:	03013d03          	ld	s10,48(sp)
    80002f6c:	02813d83          	ld	s11,40(sp)
    80002f70:	0d010113          	addi	sp,sp,208
    80002f74:	00008067          	ret
    80002f78:	07300713          	li	a4,115
    80002f7c:	1ce78a63          	beq	a5,a4,80003150 <__printf+0x4b8>
    80002f80:	07800713          	li	a4,120
    80002f84:	1ee79e63          	bne	a5,a4,80003180 <__printf+0x4e8>
    80002f88:	f7843783          	ld	a5,-136(s0)
    80002f8c:	0007a703          	lw	a4,0(a5)
    80002f90:	00878793          	addi	a5,a5,8
    80002f94:	f6f43c23          	sd	a5,-136(s0)
    80002f98:	28074263          	bltz	a4,8000321c <__printf+0x584>
    80002f9c:	00002d97          	auipc	s11,0x2
    80002fa0:	3b4d8d93          	addi	s11,s11,948 # 80005350 <digits>
    80002fa4:	00f77793          	andi	a5,a4,15
    80002fa8:	00fd87b3          	add	a5,s11,a5
    80002fac:	0007c683          	lbu	a3,0(a5)
    80002fb0:	00f00613          	li	a2,15
    80002fb4:	0007079b          	sext.w	a5,a4
    80002fb8:	f8d40023          	sb	a3,-128(s0)
    80002fbc:	0047559b          	srliw	a1,a4,0x4
    80002fc0:	0047569b          	srliw	a3,a4,0x4
    80002fc4:	00000c93          	li	s9,0
    80002fc8:	0ee65063          	bge	a2,a4,800030a8 <__printf+0x410>
    80002fcc:	00f6f693          	andi	a3,a3,15
    80002fd0:	00dd86b3          	add	a3,s11,a3
    80002fd4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80002fd8:	0087d79b          	srliw	a5,a5,0x8
    80002fdc:	00100c93          	li	s9,1
    80002fe0:	f8d400a3          	sb	a3,-127(s0)
    80002fe4:	0cb67263          	bgeu	a2,a1,800030a8 <__printf+0x410>
    80002fe8:	00f7f693          	andi	a3,a5,15
    80002fec:	00dd86b3          	add	a3,s11,a3
    80002ff0:	0006c583          	lbu	a1,0(a3)
    80002ff4:	00f00613          	li	a2,15
    80002ff8:	0047d69b          	srliw	a3,a5,0x4
    80002ffc:	f8b40123          	sb	a1,-126(s0)
    80003000:	0047d593          	srli	a1,a5,0x4
    80003004:	28f67e63          	bgeu	a2,a5,800032a0 <__printf+0x608>
    80003008:	00f6f693          	andi	a3,a3,15
    8000300c:	00dd86b3          	add	a3,s11,a3
    80003010:	0006c503          	lbu	a0,0(a3)
    80003014:	0087d813          	srli	a6,a5,0x8
    80003018:	0087d69b          	srliw	a3,a5,0x8
    8000301c:	f8a401a3          	sb	a0,-125(s0)
    80003020:	28b67663          	bgeu	a2,a1,800032ac <__printf+0x614>
    80003024:	00f6f693          	andi	a3,a3,15
    80003028:	00dd86b3          	add	a3,s11,a3
    8000302c:	0006c583          	lbu	a1,0(a3)
    80003030:	00c7d513          	srli	a0,a5,0xc
    80003034:	00c7d69b          	srliw	a3,a5,0xc
    80003038:	f8b40223          	sb	a1,-124(s0)
    8000303c:	29067a63          	bgeu	a2,a6,800032d0 <__printf+0x638>
    80003040:	00f6f693          	andi	a3,a3,15
    80003044:	00dd86b3          	add	a3,s11,a3
    80003048:	0006c583          	lbu	a1,0(a3)
    8000304c:	0107d813          	srli	a6,a5,0x10
    80003050:	0107d69b          	srliw	a3,a5,0x10
    80003054:	f8b402a3          	sb	a1,-123(s0)
    80003058:	28a67263          	bgeu	a2,a0,800032dc <__printf+0x644>
    8000305c:	00f6f693          	andi	a3,a3,15
    80003060:	00dd86b3          	add	a3,s11,a3
    80003064:	0006c683          	lbu	a3,0(a3)
    80003068:	0147d79b          	srliw	a5,a5,0x14
    8000306c:	f8d40323          	sb	a3,-122(s0)
    80003070:	21067663          	bgeu	a2,a6,8000327c <__printf+0x5e4>
    80003074:	02079793          	slli	a5,a5,0x20
    80003078:	0207d793          	srli	a5,a5,0x20
    8000307c:	00fd8db3          	add	s11,s11,a5
    80003080:	000dc683          	lbu	a3,0(s11)
    80003084:	00800793          	li	a5,8
    80003088:	00700c93          	li	s9,7
    8000308c:	f8d403a3          	sb	a3,-121(s0)
    80003090:	00075c63          	bgez	a4,800030a8 <__printf+0x410>
    80003094:	f9040713          	addi	a4,s0,-112
    80003098:	00f70733          	add	a4,a4,a5
    8000309c:	02d00693          	li	a3,45
    800030a0:	fed70823          	sb	a3,-16(a4)
    800030a4:	00078c93          	mv	s9,a5
    800030a8:	f8040793          	addi	a5,s0,-128
    800030ac:	01978cb3          	add	s9,a5,s9
    800030b0:	f7f40d13          	addi	s10,s0,-129
    800030b4:	000cc503          	lbu	a0,0(s9)
    800030b8:	fffc8c93          	addi	s9,s9,-1
    800030bc:	00000097          	auipc	ra,0x0
    800030c0:	9f8080e7          	jalr	-1544(ra) # 80002ab4 <consputc>
    800030c4:	ff9d18e3          	bne	s10,s9,800030b4 <__printf+0x41c>
    800030c8:	0100006f          	j	800030d8 <__printf+0x440>
    800030cc:	00000097          	auipc	ra,0x0
    800030d0:	9e8080e7          	jalr	-1560(ra) # 80002ab4 <consputc>
    800030d4:	000c8493          	mv	s1,s9
    800030d8:	00094503          	lbu	a0,0(s2)
    800030dc:	c60510e3          	bnez	a0,80002d3c <__printf+0xa4>
    800030e0:	e40c0ee3          	beqz	s8,80002f3c <__printf+0x2a4>
    800030e4:	00004517          	auipc	a0,0x4
    800030e8:	c1c50513          	addi	a0,a0,-996 # 80006d00 <pr>
    800030ec:	00001097          	auipc	ra,0x1
    800030f0:	94c080e7          	jalr	-1716(ra) # 80003a38 <release>
    800030f4:	e49ff06f          	j	80002f3c <__printf+0x2a4>
    800030f8:	f7843783          	ld	a5,-136(s0)
    800030fc:	03000513          	li	a0,48
    80003100:	01000d13          	li	s10,16
    80003104:	00878713          	addi	a4,a5,8
    80003108:	0007bc83          	ld	s9,0(a5)
    8000310c:	f6e43c23          	sd	a4,-136(s0)
    80003110:	00000097          	auipc	ra,0x0
    80003114:	9a4080e7          	jalr	-1628(ra) # 80002ab4 <consputc>
    80003118:	07800513          	li	a0,120
    8000311c:	00000097          	auipc	ra,0x0
    80003120:	998080e7          	jalr	-1640(ra) # 80002ab4 <consputc>
    80003124:	00002d97          	auipc	s11,0x2
    80003128:	22cd8d93          	addi	s11,s11,556 # 80005350 <digits>
    8000312c:	03ccd793          	srli	a5,s9,0x3c
    80003130:	00fd87b3          	add	a5,s11,a5
    80003134:	0007c503          	lbu	a0,0(a5)
    80003138:	fffd0d1b          	addiw	s10,s10,-1
    8000313c:	004c9c93          	slli	s9,s9,0x4
    80003140:	00000097          	auipc	ra,0x0
    80003144:	974080e7          	jalr	-1676(ra) # 80002ab4 <consputc>
    80003148:	fe0d12e3          	bnez	s10,8000312c <__printf+0x494>
    8000314c:	f8dff06f          	j	800030d8 <__printf+0x440>
    80003150:	f7843783          	ld	a5,-136(s0)
    80003154:	0007bc83          	ld	s9,0(a5)
    80003158:	00878793          	addi	a5,a5,8
    8000315c:	f6f43c23          	sd	a5,-136(s0)
    80003160:	000c9a63          	bnez	s9,80003174 <__printf+0x4dc>
    80003164:	1080006f          	j	8000326c <__printf+0x5d4>
    80003168:	001c8c93          	addi	s9,s9,1
    8000316c:	00000097          	auipc	ra,0x0
    80003170:	948080e7          	jalr	-1720(ra) # 80002ab4 <consputc>
    80003174:	000cc503          	lbu	a0,0(s9)
    80003178:	fe0518e3          	bnez	a0,80003168 <__printf+0x4d0>
    8000317c:	f5dff06f          	j	800030d8 <__printf+0x440>
    80003180:	02500513          	li	a0,37
    80003184:	00000097          	auipc	ra,0x0
    80003188:	930080e7          	jalr	-1744(ra) # 80002ab4 <consputc>
    8000318c:	000c8513          	mv	a0,s9
    80003190:	00000097          	auipc	ra,0x0
    80003194:	924080e7          	jalr	-1756(ra) # 80002ab4 <consputc>
    80003198:	f41ff06f          	j	800030d8 <__printf+0x440>
    8000319c:	02500513          	li	a0,37
    800031a0:	00000097          	auipc	ra,0x0
    800031a4:	914080e7          	jalr	-1772(ra) # 80002ab4 <consputc>
    800031a8:	f31ff06f          	j	800030d8 <__printf+0x440>
    800031ac:	00030513          	mv	a0,t1
    800031b0:	00000097          	auipc	ra,0x0
    800031b4:	7bc080e7          	jalr	1980(ra) # 8000396c <acquire>
    800031b8:	b4dff06f          	j	80002d04 <__printf+0x6c>
    800031bc:	40c0053b          	negw	a0,a2
    800031c0:	00a00713          	li	a4,10
    800031c4:	02e576bb          	remuw	a3,a0,a4
    800031c8:	00002d97          	auipc	s11,0x2
    800031cc:	188d8d93          	addi	s11,s11,392 # 80005350 <digits>
    800031d0:	ff700593          	li	a1,-9
    800031d4:	02069693          	slli	a3,a3,0x20
    800031d8:	0206d693          	srli	a3,a3,0x20
    800031dc:	00dd86b3          	add	a3,s11,a3
    800031e0:	0006c683          	lbu	a3,0(a3)
    800031e4:	02e557bb          	divuw	a5,a0,a4
    800031e8:	f8d40023          	sb	a3,-128(s0)
    800031ec:	10b65e63          	bge	a2,a1,80003308 <__printf+0x670>
    800031f0:	06300593          	li	a1,99
    800031f4:	02e7f6bb          	remuw	a3,a5,a4
    800031f8:	02069693          	slli	a3,a3,0x20
    800031fc:	0206d693          	srli	a3,a3,0x20
    80003200:	00dd86b3          	add	a3,s11,a3
    80003204:	0006c683          	lbu	a3,0(a3)
    80003208:	02e7d73b          	divuw	a4,a5,a4
    8000320c:	00200793          	li	a5,2
    80003210:	f8d400a3          	sb	a3,-127(s0)
    80003214:	bca5ece3          	bltu	a1,a0,80002dec <__printf+0x154>
    80003218:	ce5ff06f          	j	80002efc <__printf+0x264>
    8000321c:	40e007bb          	negw	a5,a4
    80003220:	00002d97          	auipc	s11,0x2
    80003224:	130d8d93          	addi	s11,s11,304 # 80005350 <digits>
    80003228:	00f7f693          	andi	a3,a5,15
    8000322c:	00dd86b3          	add	a3,s11,a3
    80003230:	0006c583          	lbu	a1,0(a3)
    80003234:	ff100613          	li	a2,-15
    80003238:	0047d69b          	srliw	a3,a5,0x4
    8000323c:	f8b40023          	sb	a1,-128(s0)
    80003240:	0047d59b          	srliw	a1,a5,0x4
    80003244:	0ac75e63          	bge	a4,a2,80003300 <__printf+0x668>
    80003248:	00f6f693          	andi	a3,a3,15
    8000324c:	00dd86b3          	add	a3,s11,a3
    80003250:	0006c603          	lbu	a2,0(a3)
    80003254:	00f00693          	li	a3,15
    80003258:	0087d79b          	srliw	a5,a5,0x8
    8000325c:	f8c400a3          	sb	a2,-127(s0)
    80003260:	d8b6e4e3          	bltu	a3,a1,80002fe8 <__printf+0x350>
    80003264:	00200793          	li	a5,2
    80003268:	e2dff06f          	j	80003094 <__printf+0x3fc>
    8000326c:	00002c97          	auipc	s9,0x2
    80003270:	0c4c8c93          	addi	s9,s9,196 # 80005330 <_ZZ12printIntegermE6digits+0x310>
    80003274:	02800513          	li	a0,40
    80003278:	ef1ff06f          	j	80003168 <__printf+0x4d0>
    8000327c:	00700793          	li	a5,7
    80003280:	00600c93          	li	s9,6
    80003284:	e0dff06f          	j	80003090 <__printf+0x3f8>
    80003288:	00700793          	li	a5,7
    8000328c:	00600c93          	li	s9,6
    80003290:	c69ff06f          	j	80002ef8 <__printf+0x260>
    80003294:	00300793          	li	a5,3
    80003298:	00200c93          	li	s9,2
    8000329c:	c5dff06f          	j	80002ef8 <__printf+0x260>
    800032a0:	00300793          	li	a5,3
    800032a4:	00200c93          	li	s9,2
    800032a8:	de9ff06f          	j	80003090 <__printf+0x3f8>
    800032ac:	00400793          	li	a5,4
    800032b0:	00300c93          	li	s9,3
    800032b4:	dddff06f          	j	80003090 <__printf+0x3f8>
    800032b8:	00400793          	li	a5,4
    800032bc:	00300c93          	li	s9,3
    800032c0:	c39ff06f          	j	80002ef8 <__printf+0x260>
    800032c4:	00500793          	li	a5,5
    800032c8:	00400c93          	li	s9,4
    800032cc:	c2dff06f          	j	80002ef8 <__printf+0x260>
    800032d0:	00500793          	li	a5,5
    800032d4:	00400c93          	li	s9,4
    800032d8:	db9ff06f          	j	80003090 <__printf+0x3f8>
    800032dc:	00600793          	li	a5,6
    800032e0:	00500c93          	li	s9,5
    800032e4:	dadff06f          	j	80003090 <__printf+0x3f8>
    800032e8:	00600793          	li	a5,6
    800032ec:	00500c93          	li	s9,5
    800032f0:	c09ff06f          	j	80002ef8 <__printf+0x260>
    800032f4:	00800793          	li	a5,8
    800032f8:	00700c93          	li	s9,7
    800032fc:	bfdff06f          	j	80002ef8 <__printf+0x260>
    80003300:	00100793          	li	a5,1
    80003304:	d91ff06f          	j	80003094 <__printf+0x3fc>
    80003308:	00100793          	li	a5,1
    8000330c:	bf1ff06f          	j	80002efc <__printf+0x264>
    80003310:	00900793          	li	a5,9
    80003314:	00800c93          	li	s9,8
    80003318:	be1ff06f          	j	80002ef8 <__printf+0x260>
    8000331c:	00002517          	auipc	a0,0x2
    80003320:	01c50513          	addi	a0,a0,28 # 80005338 <_ZZ12printIntegermE6digits+0x318>
    80003324:	00000097          	auipc	ra,0x0
    80003328:	918080e7          	jalr	-1768(ra) # 80002c3c <panic>

000000008000332c <printfinit>:
    8000332c:	fe010113          	addi	sp,sp,-32
    80003330:	00813823          	sd	s0,16(sp)
    80003334:	00913423          	sd	s1,8(sp)
    80003338:	00113c23          	sd	ra,24(sp)
    8000333c:	02010413          	addi	s0,sp,32
    80003340:	00004497          	auipc	s1,0x4
    80003344:	9c048493          	addi	s1,s1,-1600 # 80006d00 <pr>
    80003348:	00048513          	mv	a0,s1
    8000334c:	00002597          	auipc	a1,0x2
    80003350:	ffc58593          	addi	a1,a1,-4 # 80005348 <_ZZ12printIntegermE6digits+0x328>
    80003354:	00000097          	auipc	ra,0x0
    80003358:	5f4080e7          	jalr	1524(ra) # 80003948 <initlock>
    8000335c:	01813083          	ld	ra,24(sp)
    80003360:	01013403          	ld	s0,16(sp)
    80003364:	0004ac23          	sw	zero,24(s1)
    80003368:	00813483          	ld	s1,8(sp)
    8000336c:	02010113          	addi	sp,sp,32
    80003370:	00008067          	ret

0000000080003374 <uartinit>:
    80003374:	ff010113          	addi	sp,sp,-16
    80003378:	00813423          	sd	s0,8(sp)
    8000337c:	01010413          	addi	s0,sp,16
    80003380:	100007b7          	lui	a5,0x10000
    80003384:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80003388:	f8000713          	li	a4,-128
    8000338c:	00e781a3          	sb	a4,3(a5)
    80003390:	00300713          	li	a4,3
    80003394:	00e78023          	sb	a4,0(a5)
    80003398:	000780a3          	sb	zero,1(a5)
    8000339c:	00e781a3          	sb	a4,3(a5)
    800033a0:	00700693          	li	a3,7
    800033a4:	00d78123          	sb	a3,2(a5)
    800033a8:	00e780a3          	sb	a4,1(a5)
    800033ac:	00813403          	ld	s0,8(sp)
    800033b0:	01010113          	addi	sp,sp,16
    800033b4:	00008067          	ret

00000000800033b8 <uartputc>:
    800033b8:	00002797          	auipc	a5,0x2
    800033bc:	6c07a783          	lw	a5,1728(a5) # 80005a78 <panicked>
    800033c0:	00078463          	beqz	a5,800033c8 <uartputc+0x10>
    800033c4:	0000006f          	j	800033c4 <uartputc+0xc>
    800033c8:	fd010113          	addi	sp,sp,-48
    800033cc:	02813023          	sd	s0,32(sp)
    800033d0:	00913c23          	sd	s1,24(sp)
    800033d4:	01213823          	sd	s2,16(sp)
    800033d8:	01313423          	sd	s3,8(sp)
    800033dc:	02113423          	sd	ra,40(sp)
    800033e0:	03010413          	addi	s0,sp,48
    800033e4:	00002917          	auipc	s2,0x2
    800033e8:	69c90913          	addi	s2,s2,1692 # 80005a80 <uart_tx_r>
    800033ec:	00093783          	ld	a5,0(s2)
    800033f0:	00002497          	auipc	s1,0x2
    800033f4:	69848493          	addi	s1,s1,1688 # 80005a88 <uart_tx_w>
    800033f8:	0004b703          	ld	a4,0(s1)
    800033fc:	02078693          	addi	a3,a5,32
    80003400:	00050993          	mv	s3,a0
    80003404:	02e69c63          	bne	a3,a4,8000343c <uartputc+0x84>
    80003408:	00001097          	auipc	ra,0x1
    8000340c:	834080e7          	jalr	-1996(ra) # 80003c3c <push_on>
    80003410:	00093783          	ld	a5,0(s2)
    80003414:	0004b703          	ld	a4,0(s1)
    80003418:	02078793          	addi	a5,a5,32
    8000341c:	00e79463          	bne	a5,a4,80003424 <uartputc+0x6c>
    80003420:	0000006f          	j	80003420 <uartputc+0x68>
    80003424:	00001097          	auipc	ra,0x1
    80003428:	88c080e7          	jalr	-1908(ra) # 80003cb0 <pop_on>
    8000342c:	00093783          	ld	a5,0(s2)
    80003430:	0004b703          	ld	a4,0(s1)
    80003434:	02078693          	addi	a3,a5,32
    80003438:	fce688e3          	beq	a3,a4,80003408 <uartputc+0x50>
    8000343c:	01f77693          	andi	a3,a4,31
    80003440:	00004597          	auipc	a1,0x4
    80003444:	8e058593          	addi	a1,a1,-1824 # 80006d20 <uart_tx_buf>
    80003448:	00d586b3          	add	a3,a1,a3
    8000344c:	00170713          	addi	a4,a4,1
    80003450:	01368023          	sb	s3,0(a3)
    80003454:	00e4b023          	sd	a4,0(s1)
    80003458:	10000637          	lui	a2,0x10000
    8000345c:	02f71063          	bne	a4,a5,8000347c <uartputc+0xc4>
    80003460:	0340006f          	j	80003494 <uartputc+0xdc>
    80003464:	00074703          	lbu	a4,0(a4)
    80003468:	00f93023          	sd	a5,0(s2)
    8000346c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80003470:	00093783          	ld	a5,0(s2)
    80003474:	0004b703          	ld	a4,0(s1)
    80003478:	00f70e63          	beq	a4,a5,80003494 <uartputc+0xdc>
    8000347c:	00564683          	lbu	a3,5(a2)
    80003480:	01f7f713          	andi	a4,a5,31
    80003484:	00e58733          	add	a4,a1,a4
    80003488:	0206f693          	andi	a3,a3,32
    8000348c:	00178793          	addi	a5,a5,1
    80003490:	fc069ae3          	bnez	a3,80003464 <uartputc+0xac>
    80003494:	02813083          	ld	ra,40(sp)
    80003498:	02013403          	ld	s0,32(sp)
    8000349c:	01813483          	ld	s1,24(sp)
    800034a0:	01013903          	ld	s2,16(sp)
    800034a4:	00813983          	ld	s3,8(sp)
    800034a8:	03010113          	addi	sp,sp,48
    800034ac:	00008067          	ret

00000000800034b0 <uartputc_sync>:
    800034b0:	ff010113          	addi	sp,sp,-16
    800034b4:	00813423          	sd	s0,8(sp)
    800034b8:	01010413          	addi	s0,sp,16
    800034bc:	00002717          	auipc	a4,0x2
    800034c0:	5bc72703          	lw	a4,1468(a4) # 80005a78 <panicked>
    800034c4:	02071663          	bnez	a4,800034f0 <uartputc_sync+0x40>
    800034c8:	00050793          	mv	a5,a0
    800034cc:	100006b7          	lui	a3,0x10000
    800034d0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    800034d4:	02077713          	andi	a4,a4,32
    800034d8:	fe070ce3          	beqz	a4,800034d0 <uartputc_sync+0x20>
    800034dc:	0ff7f793          	andi	a5,a5,255
    800034e0:	00f68023          	sb	a5,0(a3)
    800034e4:	00813403          	ld	s0,8(sp)
    800034e8:	01010113          	addi	sp,sp,16
    800034ec:	00008067          	ret
    800034f0:	0000006f          	j	800034f0 <uartputc_sync+0x40>

00000000800034f4 <uartstart>:
    800034f4:	ff010113          	addi	sp,sp,-16
    800034f8:	00813423          	sd	s0,8(sp)
    800034fc:	01010413          	addi	s0,sp,16
    80003500:	00002617          	auipc	a2,0x2
    80003504:	58060613          	addi	a2,a2,1408 # 80005a80 <uart_tx_r>
    80003508:	00002517          	auipc	a0,0x2
    8000350c:	58050513          	addi	a0,a0,1408 # 80005a88 <uart_tx_w>
    80003510:	00063783          	ld	a5,0(a2)
    80003514:	00053703          	ld	a4,0(a0)
    80003518:	04f70263          	beq	a4,a5,8000355c <uartstart+0x68>
    8000351c:	100005b7          	lui	a1,0x10000
    80003520:	00004817          	auipc	a6,0x4
    80003524:	80080813          	addi	a6,a6,-2048 # 80006d20 <uart_tx_buf>
    80003528:	01c0006f          	j	80003544 <uartstart+0x50>
    8000352c:	0006c703          	lbu	a4,0(a3)
    80003530:	00f63023          	sd	a5,0(a2)
    80003534:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80003538:	00063783          	ld	a5,0(a2)
    8000353c:	00053703          	ld	a4,0(a0)
    80003540:	00f70e63          	beq	a4,a5,8000355c <uartstart+0x68>
    80003544:	01f7f713          	andi	a4,a5,31
    80003548:	00e806b3          	add	a3,a6,a4
    8000354c:	0055c703          	lbu	a4,5(a1)
    80003550:	00178793          	addi	a5,a5,1
    80003554:	02077713          	andi	a4,a4,32
    80003558:	fc071ae3          	bnez	a4,8000352c <uartstart+0x38>
    8000355c:	00813403          	ld	s0,8(sp)
    80003560:	01010113          	addi	sp,sp,16
    80003564:	00008067          	ret

0000000080003568 <uartgetc>:
    80003568:	ff010113          	addi	sp,sp,-16
    8000356c:	00813423          	sd	s0,8(sp)
    80003570:	01010413          	addi	s0,sp,16
    80003574:	10000737          	lui	a4,0x10000
    80003578:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000357c:	0017f793          	andi	a5,a5,1
    80003580:	00078c63          	beqz	a5,80003598 <uartgetc+0x30>
    80003584:	00074503          	lbu	a0,0(a4)
    80003588:	0ff57513          	andi	a0,a0,255
    8000358c:	00813403          	ld	s0,8(sp)
    80003590:	01010113          	addi	sp,sp,16
    80003594:	00008067          	ret
    80003598:	fff00513          	li	a0,-1
    8000359c:	ff1ff06f          	j	8000358c <uartgetc+0x24>

00000000800035a0 <uartintr>:
    800035a0:	100007b7          	lui	a5,0x10000
    800035a4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    800035a8:	0017f793          	andi	a5,a5,1
    800035ac:	0a078463          	beqz	a5,80003654 <uartintr+0xb4>
    800035b0:	fe010113          	addi	sp,sp,-32
    800035b4:	00813823          	sd	s0,16(sp)
    800035b8:	00913423          	sd	s1,8(sp)
    800035bc:	00113c23          	sd	ra,24(sp)
    800035c0:	02010413          	addi	s0,sp,32
    800035c4:	100004b7          	lui	s1,0x10000
    800035c8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    800035cc:	0ff57513          	andi	a0,a0,255
    800035d0:	fffff097          	auipc	ra,0xfffff
    800035d4:	534080e7          	jalr	1332(ra) # 80002b04 <consoleintr>
    800035d8:	0054c783          	lbu	a5,5(s1)
    800035dc:	0017f793          	andi	a5,a5,1
    800035e0:	fe0794e3          	bnez	a5,800035c8 <uartintr+0x28>
    800035e4:	00002617          	auipc	a2,0x2
    800035e8:	49c60613          	addi	a2,a2,1180 # 80005a80 <uart_tx_r>
    800035ec:	00002517          	auipc	a0,0x2
    800035f0:	49c50513          	addi	a0,a0,1180 # 80005a88 <uart_tx_w>
    800035f4:	00063783          	ld	a5,0(a2)
    800035f8:	00053703          	ld	a4,0(a0)
    800035fc:	04f70263          	beq	a4,a5,80003640 <uartintr+0xa0>
    80003600:	100005b7          	lui	a1,0x10000
    80003604:	00003817          	auipc	a6,0x3
    80003608:	71c80813          	addi	a6,a6,1820 # 80006d20 <uart_tx_buf>
    8000360c:	01c0006f          	j	80003628 <uartintr+0x88>
    80003610:	0006c703          	lbu	a4,0(a3)
    80003614:	00f63023          	sd	a5,0(a2)
    80003618:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000361c:	00063783          	ld	a5,0(a2)
    80003620:	00053703          	ld	a4,0(a0)
    80003624:	00f70e63          	beq	a4,a5,80003640 <uartintr+0xa0>
    80003628:	01f7f713          	andi	a4,a5,31
    8000362c:	00e806b3          	add	a3,a6,a4
    80003630:	0055c703          	lbu	a4,5(a1)
    80003634:	00178793          	addi	a5,a5,1
    80003638:	02077713          	andi	a4,a4,32
    8000363c:	fc071ae3          	bnez	a4,80003610 <uartintr+0x70>
    80003640:	01813083          	ld	ra,24(sp)
    80003644:	01013403          	ld	s0,16(sp)
    80003648:	00813483          	ld	s1,8(sp)
    8000364c:	02010113          	addi	sp,sp,32
    80003650:	00008067          	ret
    80003654:	00002617          	auipc	a2,0x2
    80003658:	42c60613          	addi	a2,a2,1068 # 80005a80 <uart_tx_r>
    8000365c:	00002517          	auipc	a0,0x2
    80003660:	42c50513          	addi	a0,a0,1068 # 80005a88 <uart_tx_w>
    80003664:	00063783          	ld	a5,0(a2)
    80003668:	00053703          	ld	a4,0(a0)
    8000366c:	04f70263          	beq	a4,a5,800036b0 <uartintr+0x110>
    80003670:	100005b7          	lui	a1,0x10000
    80003674:	00003817          	auipc	a6,0x3
    80003678:	6ac80813          	addi	a6,a6,1708 # 80006d20 <uart_tx_buf>
    8000367c:	01c0006f          	j	80003698 <uartintr+0xf8>
    80003680:	0006c703          	lbu	a4,0(a3)
    80003684:	00f63023          	sd	a5,0(a2)
    80003688:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000368c:	00063783          	ld	a5,0(a2)
    80003690:	00053703          	ld	a4,0(a0)
    80003694:	02f70063          	beq	a4,a5,800036b4 <uartintr+0x114>
    80003698:	01f7f713          	andi	a4,a5,31
    8000369c:	00e806b3          	add	a3,a6,a4
    800036a0:	0055c703          	lbu	a4,5(a1)
    800036a4:	00178793          	addi	a5,a5,1
    800036a8:	02077713          	andi	a4,a4,32
    800036ac:	fc071ae3          	bnez	a4,80003680 <uartintr+0xe0>
    800036b0:	00008067          	ret
    800036b4:	00008067          	ret

00000000800036b8 <kinit>:
    800036b8:	fc010113          	addi	sp,sp,-64
    800036bc:	02913423          	sd	s1,40(sp)
    800036c0:	fffff7b7          	lui	a5,0xfffff
    800036c4:	00004497          	auipc	s1,0x4
    800036c8:	67b48493          	addi	s1,s1,1659 # 80007d3f <end+0xfff>
    800036cc:	02813823          	sd	s0,48(sp)
    800036d0:	01313c23          	sd	s3,24(sp)
    800036d4:	00f4f4b3          	and	s1,s1,a5
    800036d8:	02113c23          	sd	ra,56(sp)
    800036dc:	03213023          	sd	s2,32(sp)
    800036e0:	01413823          	sd	s4,16(sp)
    800036e4:	01513423          	sd	s5,8(sp)
    800036e8:	04010413          	addi	s0,sp,64
    800036ec:	000017b7          	lui	a5,0x1
    800036f0:	01100993          	li	s3,17
    800036f4:	00f487b3          	add	a5,s1,a5
    800036f8:	01b99993          	slli	s3,s3,0x1b
    800036fc:	06f9e063          	bltu	s3,a5,8000375c <kinit+0xa4>
    80003700:	00003a97          	auipc	s5,0x3
    80003704:	640a8a93          	addi	s5,s5,1600 # 80006d40 <end>
    80003708:	0754ec63          	bltu	s1,s5,80003780 <kinit+0xc8>
    8000370c:	0734fa63          	bgeu	s1,s3,80003780 <kinit+0xc8>
    80003710:	00088a37          	lui	s4,0x88
    80003714:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80003718:	00002917          	auipc	s2,0x2
    8000371c:	37890913          	addi	s2,s2,888 # 80005a90 <kmem>
    80003720:	00ca1a13          	slli	s4,s4,0xc
    80003724:	0140006f          	j	80003738 <kinit+0x80>
    80003728:	000017b7          	lui	a5,0x1
    8000372c:	00f484b3          	add	s1,s1,a5
    80003730:	0554e863          	bltu	s1,s5,80003780 <kinit+0xc8>
    80003734:	0534f663          	bgeu	s1,s3,80003780 <kinit+0xc8>
    80003738:	00001637          	lui	a2,0x1
    8000373c:	00100593          	li	a1,1
    80003740:	00048513          	mv	a0,s1
    80003744:	00000097          	auipc	ra,0x0
    80003748:	5e4080e7          	jalr	1508(ra) # 80003d28 <__memset>
    8000374c:	00093783          	ld	a5,0(s2)
    80003750:	00f4b023          	sd	a5,0(s1)
    80003754:	00993023          	sd	s1,0(s2)
    80003758:	fd4498e3          	bne	s1,s4,80003728 <kinit+0x70>
    8000375c:	03813083          	ld	ra,56(sp)
    80003760:	03013403          	ld	s0,48(sp)
    80003764:	02813483          	ld	s1,40(sp)
    80003768:	02013903          	ld	s2,32(sp)
    8000376c:	01813983          	ld	s3,24(sp)
    80003770:	01013a03          	ld	s4,16(sp)
    80003774:	00813a83          	ld	s5,8(sp)
    80003778:	04010113          	addi	sp,sp,64
    8000377c:	00008067          	ret
    80003780:	00002517          	auipc	a0,0x2
    80003784:	be850513          	addi	a0,a0,-1048 # 80005368 <digits+0x18>
    80003788:	fffff097          	auipc	ra,0xfffff
    8000378c:	4b4080e7          	jalr	1204(ra) # 80002c3c <panic>

0000000080003790 <freerange>:
    80003790:	fc010113          	addi	sp,sp,-64
    80003794:	000017b7          	lui	a5,0x1
    80003798:	02913423          	sd	s1,40(sp)
    8000379c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    800037a0:	009504b3          	add	s1,a0,s1
    800037a4:	fffff537          	lui	a0,0xfffff
    800037a8:	02813823          	sd	s0,48(sp)
    800037ac:	02113c23          	sd	ra,56(sp)
    800037b0:	03213023          	sd	s2,32(sp)
    800037b4:	01313c23          	sd	s3,24(sp)
    800037b8:	01413823          	sd	s4,16(sp)
    800037bc:	01513423          	sd	s5,8(sp)
    800037c0:	01613023          	sd	s6,0(sp)
    800037c4:	04010413          	addi	s0,sp,64
    800037c8:	00a4f4b3          	and	s1,s1,a0
    800037cc:	00f487b3          	add	a5,s1,a5
    800037d0:	06f5e463          	bltu	a1,a5,80003838 <freerange+0xa8>
    800037d4:	00003a97          	auipc	s5,0x3
    800037d8:	56ca8a93          	addi	s5,s5,1388 # 80006d40 <end>
    800037dc:	0954e263          	bltu	s1,s5,80003860 <freerange+0xd0>
    800037e0:	01100993          	li	s3,17
    800037e4:	01b99993          	slli	s3,s3,0x1b
    800037e8:	0734fc63          	bgeu	s1,s3,80003860 <freerange+0xd0>
    800037ec:	00058a13          	mv	s4,a1
    800037f0:	00002917          	auipc	s2,0x2
    800037f4:	2a090913          	addi	s2,s2,672 # 80005a90 <kmem>
    800037f8:	00002b37          	lui	s6,0x2
    800037fc:	0140006f          	j	80003810 <freerange+0x80>
    80003800:	000017b7          	lui	a5,0x1
    80003804:	00f484b3          	add	s1,s1,a5
    80003808:	0554ec63          	bltu	s1,s5,80003860 <freerange+0xd0>
    8000380c:	0534fa63          	bgeu	s1,s3,80003860 <freerange+0xd0>
    80003810:	00001637          	lui	a2,0x1
    80003814:	00100593          	li	a1,1
    80003818:	00048513          	mv	a0,s1
    8000381c:	00000097          	auipc	ra,0x0
    80003820:	50c080e7          	jalr	1292(ra) # 80003d28 <__memset>
    80003824:	00093703          	ld	a4,0(s2)
    80003828:	016487b3          	add	a5,s1,s6
    8000382c:	00e4b023          	sd	a4,0(s1)
    80003830:	00993023          	sd	s1,0(s2)
    80003834:	fcfa76e3          	bgeu	s4,a5,80003800 <freerange+0x70>
    80003838:	03813083          	ld	ra,56(sp)
    8000383c:	03013403          	ld	s0,48(sp)
    80003840:	02813483          	ld	s1,40(sp)
    80003844:	02013903          	ld	s2,32(sp)
    80003848:	01813983          	ld	s3,24(sp)
    8000384c:	01013a03          	ld	s4,16(sp)
    80003850:	00813a83          	ld	s5,8(sp)
    80003854:	00013b03          	ld	s6,0(sp)
    80003858:	04010113          	addi	sp,sp,64
    8000385c:	00008067          	ret
    80003860:	00002517          	auipc	a0,0x2
    80003864:	b0850513          	addi	a0,a0,-1272 # 80005368 <digits+0x18>
    80003868:	fffff097          	auipc	ra,0xfffff
    8000386c:	3d4080e7          	jalr	980(ra) # 80002c3c <panic>

0000000080003870 <kfree>:
    80003870:	fe010113          	addi	sp,sp,-32
    80003874:	00813823          	sd	s0,16(sp)
    80003878:	00113c23          	sd	ra,24(sp)
    8000387c:	00913423          	sd	s1,8(sp)
    80003880:	02010413          	addi	s0,sp,32
    80003884:	03451793          	slli	a5,a0,0x34
    80003888:	04079c63          	bnez	a5,800038e0 <kfree+0x70>
    8000388c:	00003797          	auipc	a5,0x3
    80003890:	4b478793          	addi	a5,a5,1204 # 80006d40 <end>
    80003894:	00050493          	mv	s1,a0
    80003898:	04f56463          	bltu	a0,a5,800038e0 <kfree+0x70>
    8000389c:	01100793          	li	a5,17
    800038a0:	01b79793          	slli	a5,a5,0x1b
    800038a4:	02f57e63          	bgeu	a0,a5,800038e0 <kfree+0x70>
    800038a8:	00001637          	lui	a2,0x1
    800038ac:	00100593          	li	a1,1
    800038b0:	00000097          	auipc	ra,0x0
    800038b4:	478080e7          	jalr	1144(ra) # 80003d28 <__memset>
    800038b8:	00002797          	auipc	a5,0x2
    800038bc:	1d878793          	addi	a5,a5,472 # 80005a90 <kmem>
    800038c0:	0007b703          	ld	a4,0(a5)
    800038c4:	01813083          	ld	ra,24(sp)
    800038c8:	01013403          	ld	s0,16(sp)
    800038cc:	00e4b023          	sd	a4,0(s1)
    800038d0:	0097b023          	sd	s1,0(a5)
    800038d4:	00813483          	ld	s1,8(sp)
    800038d8:	02010113          	addi	sp,sp,32
    800038dc:	00008067          	ret
    800038e0:	00002517          	auipc	a0,0x2
    800038e4:	a8850513          	addi	a0,a0,-1400 # 80005368 <digits+0x18>
    800038e8:	fffff097          	auipc	ra,0xfffff
    800038ec:	354080e7          	jalr	852(ra) # 80002c3c <panic>

00000000800038f0 <kalloc>:
    800038f0:	fe010113          	addi	sp,sp,-32
    800038f4:	00813823          	sd	s0,16(sp)
    800038f8:	00913423          	sd	s1,8(sp)
    800038fc:	00113c23          	sd	ra,24(sp)
    80003900:	02010413          	addi	s0,sp,32
    80003904:	00002797          	auipc	a5,0x2
    80003908:	18c78793          	addi	a5,a5,396 # 80005a90 <kmem>
    8000390c:	0007b483          	ld	s1,0(a5)
    80003910:	02048063          	beqz	s1,80003930 <kalloc+0x40>
    80003914:	0004b703          	ld	a4,0(s1)
    80003918:	00001637          	lui	a2,0x1
    8000391c:	00500593          	li	a1,5
    80003920:	00048513          	mv	a0,s1
    80003924:	00e7b023          	sd	a4,0(a5)
    80003928:	00000097          	auipc	ra,0x0
    8000392c:	400080e7          	jalr	1024(ra) # 80003d28 <__memset>
    80003930:	01813083          	ld	ra,24(sp)
    80003934:	01013403          	ld	s0,16(sp)
    80003938:	00048513          	mv	a0,s1
    8000393c:	00813483          	ld	s1,8(sp)
    80003940:	02010113          	addi	sp,sp,32
    80003944:	00008067          	ret

0000000080003948 <initlock>:
    80003948:	ff010113          	addi	sp,sp,-16
    8000394c:	00813423          	sd	s0,8(sp)
    80003950:	01010413          	addi	s0,sp,16
    80003954:	00813403          	ld	s0,8(sp)
    80003958:	00b53423          	sd	a1,8(a0)
    8000395c:	00052023          	sw	zero,0(a0)
    80003960:	00053823          	sd	zero,16(a0)
    80003964:	01010113          	addi	sp,sp,16
    80003968:	00008067          	ret

000000008000396c <acquire>:
    8000396c:	fe010113          	addi	sp,sp,-32
    80003970:	00813823          	sd	s0,16(sp)
    80003974:	00913423          	sd	s1,8(sp)
    80003978:	00113c23          	sd	ra,24(sp)
    8000397c:	01213023          	sd	s2,0(sp)
    80003980:	02010413          	addi	s0,sp,32
    80003984:	00050493          	mv	s1,a0
    80003988:	10002973          	csrr	s2,sstatus
    8000398c:	100027f3          	csrr	a5,sstatus
    80003990:	ffd7f793          	andi	a5,a5,-3
    80003994:	10079073          	csrw	sstatus,a5
    80003998:	fffff097          	auipc	ra,0xfffff
    8000399c:	8e0080e7          	jalr	-1824(ra) # 80002278 <mycpu>
    800039a0:	07852783          	lw	a5,120(a0)
    800039a4:	06078e63          	beqz	a5,80003a20 <acquire+0xb4>
    800039a8:	fffff097          	auipc	ra,0xfffff
    800039ac:	8d0080e7          	jalr	-1840(ra) # 80002278 <mycpu>
    800039b0:	07852783          	lw	a5,120(a0)
    800039b4:	0004a703          	lw	a4,0(s1)
    800039b8:	0017879b          	addiw	a5,a5,1
    800039bc:	06f52c23          	sw	a5,120(a0)
    800039c0:	04071063          	bnez	a4,80003a00 <acquire+0x94>
    800039c4:	00100713          	li	a4,1
    800039c8:	00070793          	mv	a5,a4
    800039cc:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    800039d0:	0007879b          	sext.w	a5,a5
    800039d4:	fe079ae3          	bnez	a5,800039c8 <acquire+0x5c>
    800039d8:	0ff0000f          	fence
    800039dc:	fffff097          	auipc	ra,0xfffff
    800039e0:	89c080e7          	jalr	-1892(ra) # 80002278 <mycpu>
    800039e4:	01813083          	ld	ra,24(sp)
    800039e8:	01013403          	ld	s0,16(sp)
    800039ec:	00a4b823          	sd	a0,16(s1)
    800039f0:	00013903          	ld	s2,0(sp)
    800039f4:	00813483          	ld	s1,8(sp)
    800039f8:	02010113          	addi	sp,sp,32
    800039fc:	00008067          	ret
    80003a00:	0104b903          	ld	s2,16(s1)
    80003a04:	fffff097          	auipc	ra,0xfffff
    80003a08:	874080e7          	jalr	-1932(ra) # 80002278 <mycpu>
    80003a0c:	faa91ce3          	bne	s2,a0,800039c4 <acquire+0x58>
    80003a10:	00002517          	auipc	a0,0x2
    80003a14:	96050513          	addi	a0,a0,-1696 # 80005370 <digits+0x20>
    80003a18:	fffff097          	auipc	ra,0xfffff
    80003a1c:	224080e7          	jalr	548(ra) # 80002c3c <panic>
    80003a20:	00195913          	srli	s2,s2,0x1
    80003a24:	fffff097          	auipc	ra,0xfffff
    80003a28:	854080e7          	jalr	-1964(ra) # 80002278 <mycpu>
    80003a2c:	00197913          	andi	s2,s2,1
    80003a30:	07252e23          	sw	s2,124(a0)
    80003a34:	f75ff06f          	j	800039a8 <acquire+0x3c>

0000000080003a38 <release>:
    80003a38:	fe010113          	addi	sp,sp,-32
    80003a3c:	00813823          	sd	s0,16(sp)
    80003a40:	00113c23          	sd	ra,24(sp)
    80003a44:	00913423          	sd	s1,8(sp)
    80003a48:	01213023          	sd	s2,0(sp)
    80003a4c:	02010413          	addi	s0,sp,32
    80003a50:	00052783          	lw	a5,0(a0)
    80003a54:	00079a63          	bnez	a5,80003a68 <release+0x30>
    80003a58:	00002517          	auipc	a0,0x2
    80003a5c:	92050513          	addi	a0,a0,-1760 # 80005378 <digits+0x28>
    80003a60:	fffff097          	auipc	ra,0xfffff
    80003a64:	1dc080e7          	jalr	476(ra) # 80002c3c <panic>
    80003a68:	01053903          	ld	s2,16(a0)
    80003a6c:	00050493          	mv	s1,a0
    80003a70:	fffff097          	auipc	ra,0xfffff
    80003a74:	808080e7          	jalr	-2040(ra) # 80002278 <mycpu>
    80003a78:	fea910e3          	bne	s2,a0,80003a58 <release+0x20>
    80003a7c:	0004b823          	sd	zero,16(s1)
    80003a80:	0ff0000f          	fence
    80003a84:	0f50000f          	fence	iorw,ow
    80003a88:	0804a02f          	amoswap.w	zero,zero,(s1)
    80003a8c:	ffffe097          	auipc	ra,0xffffe
    80003a90:	7ec080e7          	jalr	2028(ra) # 80002278 <mycpu>
    80003a94:	100027f3          	csrr	a5,sstatus
    80003a98:	0027f793          	andi	a5,a5,2
    80003a9c:	04079a63          	bnez	a5,80003af0 <release+0xb8>
    80003aa0:	07852783          	lw	a5,120(a0)
    80003aa4:	02f05e63          	blez	a5,80003ae0 <release+0xa8>
    80003aa8:	fff7871b          	addiw	a4,a5,-1
    80003aac:	06e52c23          	sw	a4,120(a0)
    80003ab0:	00071c63          	bnez	a4,80003ac8 <release+0x90>
    80003ab4:	07c52783          	lw	a5,124(a0)
    80003ab8:	00078863          	beqz	a5,80003ac8 <release+0x90>
    80003abc:	100027f3          	csrr	a5,sstatus
    80003ac0:	0027e793          	ori	a5,a5,2
    80003ac4:	10079073          	csrw	sstatus,a5
    80003ac8:	01813083          	ld	ra,24(sp)
    80003acc:	01013403          	ld	s0,16(sp)
    80003ad0:	00813483          	ld	s1,8(sp)
    80003ad4:	00013903          	ld	s2,0(sp)
    80003ad8:	02010113          	addi	sp,sp,32
    80003adc:	00008067          	ret
    80003ae0:	00002517          	auipc	a0,0x2
    80003ae4:	8b850513          	addi	a0,a0,-1864 # 80005398 <digits+0x48>
    80003ae8:	fffff097          	auipc	ra,0xfffff
    80003aec:	154080e7          	jalr	340(ra) # 80002c3c <panic>
    80003af0:	00002517          	auipc	a0,0x2
    80003af4:	89050513          	addi	a0,a0,-1904 # 80005380 <digits+0x30>
    80003af8:	fffff097          	auipc	ra,0xfffff
    80003afc:	144080e7          	jalr	324(ra) # 80002c3c <panic>

0000000080003b00 <holding>:
    80003b00:	00052783          	lw	a5,0(a0)
    80003b04:	00079663          	bnez	a5,80003b10 <holding+0x10>
    80003b08:	00000513          	li	a0,0
    80003b0c:	00008067          	ret
    80003b10:	fe010113          	addi	sp,sp,-32
    80003b14:	00813823          	sd	s0,16(sp)
    80003b18:	00913423          	sd	s1,8(sp)
    80003b1c:	00113c23          	sd	ra,24(sp)
    80003b20:	02010413          	addi	s0,sp,32
    80003b24:	01053483          	ld	s1,16(a0)
    80003b28:	ffffe097          	auipc	ra,0xffffe
    80003b2c:	750080e7          	jalr	1872(ra) # 80002278 <mycpu>
    80003b30:	01813083          	ld	ra,24(sp)
    80003b34:	01013403          	ld	s0,16(sp)
    80003b38:	40a48533          	sub	a0,s1,a0
    80003b3c:	00153513          	seqz	a0,a0
    80003b40:	00813483          	ld	s1,8(sp)
    80003b44:	02010113          	addi	sp,sp,32
    80003b48:	00008067          	ret

0000000080003b4c <push_off>:
    80003b4c:	fe010113          	addi	sp,sp,-32
    80003b50:	00813823          	sd	s0,16(sp)
    80003b54:	00113c23          	sd	ra,24(sp)
    80003b58:	00913423          	sd	s1,8(sp)
    80003b5c:	02010413          	addi	s0,sp,32
    80003b60:	100024f3          	csrr	s1,sstatus
    80003b64:	100027f3          	csrr	a5,sstatus
    80003b68:	ffd7f793          	andi	a5,a5,-3
    80003b6c:	10079073          	csrw	sstatus,a5
    80003b70:	ffffe097          	auipc	ra,0xffffe
    80003b74:	708080e7          	jalr	1800(ra) # 80002278 <mycpu>
    80003b78:	07852783          	lw	a5,120(a0)
    80003b7c:	02078663          	beqz	a5,80003ba8 <push_off+0x5c>
    80003b80:	ffffe097          	auipc	ra,0xffffe
    80003b84:	6f8080e7          	jalr	1784(ra) # 80002278 <mycpu>
    80003b88:	07852783          	lw	a5,120(a0)
    80003b8c:	01813083          	ld	ra,24(sp)
    80003b90:	01013403          	ld	s0,16(sp)
    80003b94:	0017879b          	addiw	a5,a5,1
    80003b98:	06f52c23          	sw	a5,120(a0)
    80003b9c:	00813483          	ld	s1,8(sp)
    80003ba0:	02010113          	addi	sp,sp,32
    80003ba4:	00008067          	ret
    80003ba8:	0014d493          	srli	s1,s1,0x1
    80003bac:	ffffe097          	auipc	ra,0xffffe
    80003bb0:	6cc080e7          	jalr	1740(ra) # 80002278 <mycpu>
    80003bb4:	0014f493          	andi	s1,s1,1
    80003bb8:	06952e23          	sw	s1,124(a0)
    80003bbc:	fc5ff06f          	j	80003b80 <push_off+0x34>

0000000080003bc0 <pop_off>:
    80003bc0:	ff010113          	addi	sp,sp,-16
    80003bc4:	00813023          	sd	s0,0(sp)
    80003bc8:	00113423          	sd	ra,8(sp)
    80003bcc:	01010413          	addi	s0,sp,16
    80003bd0:	ffffe097          	auipc	ra,0xffffe
    80003bd4:	6a8080e7          	jalr	1704(ra) # 80002278 <mycpu>
    80003bd8:	100027f3          	csrr	a5,sstatus
    80003bdc:	0027f793          	andi	a5,a5,2
    80003be0:	04079663          	bnez	a5,80003c2c <pop_off+0x6c>
    80003be4:	07852783          	lw	a5,120(a0)
    80003be8:	02f05a63          	blez	a5,80003c1c <pop_off+0x5c>
    80003bec:	fff7871b          	addiw	a4,a5,-1
    80003bf0:	06e52c23          	sw	a4,120(a0)
    80003bf4:	00071c63          	bnez	a4,80003c0c <pop_off+0x4c>
    80003bf8:	07c52783          	lw	a5,124(a0)
    80003bfc:	00078863          	beqz	a5,80003c0c <pop_off+0x4c>
    80003c00:	100027f3          	csrr	a5,sstatus
    80003c04:	0027e793          	ori	a5,a5,2
    80003c08:	10079073          	csrw	sstatus,a5
    80003c0c:	00813083          	ld	ra,8(sp)
    80003c10:	00013403          	ld	s0,0(sp)
    80003c14:	01010113          	addi	sp,sp,16
    80003c18:	00008067          	ret
    80003c1c:	00001517          	auipc	a0,0x1
    80003c20:	77c50513          	addi	a0,a0,1916 # 80005398 <digits+0x48>
    80003c24:	fffff097          	auipc	ra,0xfffff
    80003c28:	018080e7          	jalr	24(ra) # 80002c3c <panic>
    80003c2c:	00001517          	auipc	a0,0x1
    80003c30:	75450513          	addi	a0,a0,1876 # 80005380 <digits+0x30>
    80003c34:	fffff097          	auipc	ra,0xfffff
    80003c38:	008080e7          	jalr	8(ra) # 80002c3c <panic>

0000000080003c3c <push_on>:
    80003c3c:	fe010113          	addi	sp,sp,-32
    80003c40:	00813823          	sd	s0,16(sp)
    80003c44:	00113c23          	sd	ra,24(sp)
    80003c48:	00913423          	sd	s1,8(sp)
    80003c4c:	02010413          	addi	s0,sp,32
    80003c50:	100024f3          	csrr	s1,sstatus
    80003c54:	100027f3          	csrr	a5,sstatus
    80003c58:	0027e793          	ori	a5,a5,2
    80003c5c:	10079073          	csrw	sstatus,a5
    80003c60:	ffffe097          	auipc	ra,0xffffe
    80003c64:	618080e7          	jalr	1560(ra) # 80002278 <mycpu>
    80003c68:	07852783          	lw	a5,120(a0)
    80003c6c:	02078663          	beqz	a5,80003c98 <push_on+0x5c>
    80003c70:	ffffe097          	auipc	ra,0xffffe
    80003c74:	608080e7          	jalr	1544(ra) # 80002278 <mycpu>
    80003c78:	07852783          	lw	a5,120(a0)
    80003c7c:	01813083          	ld	ra,24(sp)
    80003c80:	01013403          	ld	s0,16(sp)
    80003c84:	0017879b          	addiw	a5,a5,1
    80003c88:	06f52c23          	sw	a5,120(a0)
    80003c8c:	00813483          	ld	s1,8(sp)
    80003c90:	02010113          	addi	sp,sp,32
    80003c94:	00008067          	ret
    80003c98:	0014d493          	srli	s1,s1,0x1
    80003c9c:	ffffe097          	auipc	ra,0xffffe
    80003ca0:	5dc080e7          	jalr	1500(ra) # 80002278 <mycpu>
    80003ca4:	0014f493          	andi	s1,s1,1
    80003ca8:	06952e23          	sw	s1,124(a0)
    80003cac:	fc5ff06f          	j	80003c70 <push_on+0x34>

0000000080003cb0 <pop_on>:
    80003cb0:	ff010113          	addi	sp,sp,-16
    80003cb4:	00813023          	sd	s0,0(sp)
    80003cb8:	00113423          	sd	ra,8(sp)
    80003cbc:	01010413          	addi	s0,sp,16
    80003cc0:	ffffe097          	auipc	ra,0xffffe
    80003cc4:	5b8080e7          	jalr	1464(ra) # 80002278 <mycpu>
    80003cc8:	100027f3          	csrr	a5,sstatus
    80003ccc:	0027f793          	andi	a5,a5,2
    80003cd0:	04078463          	beqz	a5,80003d18 <pop_on+0x68>
    80003cd4:	07852783          	lw	a5,120(a0)
    80003cd8:	02f05863          	blez	a5,80003d08 <pop_on+0x58>
    80003cdc:	fff7879b          	addiw	a5,a5,-1
    80003ce0:	06f52c23          	sw	a5,120(a0)
    80003ce4:	07853783          	ld	a5,120(a0)
    80003ce8:	00079863          	bnez	a5,80003cf8 <pop_on+0x48>
    80003cec:	100027f3          	csrr	a5,sstatus
    80003cf0:	ffd7f793          	andi	a5,a5,-3
    80003cf4:	10079073          	csrw	sstatus,a5
    80003cf8:	00813083          	ld	ra,8(sp)
    80003cfc:	00013403          	ld	s0,0(sp)
    80003d00:	01010113          	addi	sp,sp,16
    80003d04:	00008067          	ret
    80003d08:	00001517          	auipc	a0,0x1
    80003d0c:	6b850513          	addi	a0,a0,1720 # 800053c0 <digits+0x70>
    80003d10:	fffff097          	auipc	ra,0xfffff
    80003d14:	f2c080e7          	jalr	-212(ra) # 80002c3c <panic>
    80003d18:	00001517          	auipc	a0,0x1
    80003d1c:	68850513          	addi	a0,a0,1672 # 800053a0 <digits+0x50>
    80003d20:	fffff097          	auipc	ra,0xfffff
    80003d24:	f1c080e7          	jalr	-228(ra) # 80002c3c <panic>

0000000080003d28 <__memset>:
    80003d28:	ff010113          	addi	sp,sp,-16
    80003d2c:	00813423          	sd	s0,8(sp)
    80003d30:	01010413          	addi	s0,sp,16
    80003d34:	1a060e63          	beqz	a2,80003ef0 <__memset+0x1c8>
    80003d38:	40a007b3          	neg	a5,a0
    80003d3c:	0077f793          	andi	a5,a5,7
    80003d40:	00778693          	addi	a3,a5,7
    80003d44:	00b00813          	li	a6,11
    80003d48:	0ff5f593          	andi	a1,a1,255
    80003d4c:	fff6071b          	addiw	a4,a2,-1
    80003d50:	1b06e663          	bltu	a3,a6,80003efc <__memset+0x1d4>
    80003d54:	1cd76463          	bltu	a4,a3,80003f1c <__memset+0x1f4>
    80003d58:	1a078e63          	beqz	a5,80003f14 <__memset+0x1ec>
    80003d5c:	00b50023          	sb	a1,0(a0)
    80003d60:	00100713          	li	a4,1
    80003d64:	1ae78463          	beq	a5,a4,80003f0c <__memset+0x1e4>
    80003d68:	00b500a3          	sb	a1,1(a0)
    80003d6c:	00200713          	li	a4,2
    80003d70:	1ae78a63          	beq	a5,a4,80003f24 <__memset+0x1fc>
    80003d74:	00b50123          	sb	a1,2(a0)
    80003d78:	00300713          	li	a4,3
    80003d7c:	18e78463          	beq	a5,a4,80003f04 <__memset+0x1dc>
    80003d80:	00b501a3          	sb	a1,3(a0)
    80003d84:	00400713          	li	a4,4
    80003d88:	1ae78263          	beq	a5,a4,80003f2c <__memset+0x204>
    80003d8c:	00b50223          	sb	a1,4(a0)
    80003d90:	00500713          	li	a4,5
    80003d94:	1ae78063          	beq	a5,a4,80003f34 <__memset+0x20c>
    80003d98:	00b502a3          	sb	a1,5(a0)
    80003d9c:	00700713          	li	a4,7
    80003da0:	18e79e63          	bne	a5,a4,80003f3c <__memset+0x214>
    80003da4:	00b50323          	sb	a1,6(a0)
    80003da8:	00700e93          	li	t4,7
    80003dac:	00859713          	slli	a4,a1,0x8
    80003db0:	00e5e733          	or	a4,a1,a4
    80003db4:	01059e13          	slli	t3,a1,0x10
    80003db8:	01c76e33          	or	t3,a4,t3
    80003dbc:	01859313          	slli	t1,a1,0x18
    80003dc0:	006e6333          	or	t1,t3,t1
    80003dc4:	02059893          	slli	a7,a1,0x20
    80003dc8:	40f60e3b          	subw	t3,a2,a5
    80003dcc:	011368b3          	or	a7,t1,a7
    80003dd0:	02859813          	slli	a6,a1,0x28
    80003dd4:	0108e833          	or	a6,a7,a6
    80003dd8:	03059693          	slli	a3,a1,0x30
    80003ddc:	003e589b          	srliw	a7,t3,0x3
    80003de0:	00d866b3          	or	a3,a6,a3
    80003de4:	03859713          	slli	a4,a1,0x38
    80003de8:	00389813          	slli	a6,a7,0x3
    80003dec:	00f507b3          	add	a5,a0,a5
    80003df0:	00e6e733          	or	a4,a3,a4
    80003df4:	000e089b          	sext.w	a7,t3
    80003df8:	00f806b3          	add	a3,a6,a5
    80003dfc:	00e7b023          	sd	a4,0(a5)
    80003e00:	00878793          	addi	a5,a5,8
    80003e04:	fed79ce3          	bne	a5,a3,80003dfc <__memset+0xd4>
    80003e08:	ff8e7793          	andi	a5,t3,-8
    80003e0c:	0007871b          	sext.w	a4,a5
    80003e10:	01d787bb          	addw	a5,a5,t4
    80003e14:	0ce88e63          	beq	a7,a4,80003ef0 <__memset+0x1c8>
    80003e18:	00f50733          	add	a4,a0,a5
    80003e1c:	00b70023          	sb	a1,0(a4)
    80003e20:	0017871b          	addiw	a4,a5,1
    80003e24:	0cc77663          	bgeu	a4,a2,80003ef0 <__memset+0x1c8>
    80003e28:	00e50733          	add	a4,a0,a4
    80003e2c:	00b70023          	sb	a1,0(a4)
    80003e30:	0027871b          	addiw	a4,a5,2
    80003e34:	0ac77e63          	bgeu	a4,a2,80003ef0 <__memset+0x1c8>
    80003e38:	00e50733          	add	a4,a0,a4
    80003e3c:	00b70023          	sb	a1,0(a4)
    80003e40:	0037871b          	addiw	a4,a5,3
    80003e44:	0ac77663          	bgeu	a4,a2,80003ef0 <__memset+0x1c8>
    80003e48:	00e50733          	add	a4,a0,a4
    80003e4c:	00b70023          	sb	a1,0(a4)
    80003e50:	0047871b          	addiw	a4,a5,4
    80003e54:	08c77e63          	bgeu	a4,a2,80003ef0 <__memset+0x1c8>
    80003e58:	00e50733          	add	a4,a0,a4
    80003e5c:	00b70023          	sb	a1,0(a4)
    80003e60:	0057871b          	addiw	a4,a5,5
    80003e64:	08c77663          	bgeu	a4,a2,80003ef0 <__memset+0x1c8>
    80003e68:	00e50733          	add	a4,a0,a4
    80003e6c:	00b70023          	sb	a1,0(a4)
    80003e70:	0067871b          	addiw	a4,a5,6
    80003e74:	06c77e63          	bgeu	a4,a2,80003ef0 <__memset+0x1c8>
    80003e78:	00e50733          	add	a4,a0,a4
    80003e7c:	00b70023          	sb	a1,0(a4)
    80003e80:	0077871b          	addiw	a4,a5,7
    80003e84:	06c77663          	bgeu	a4,a2,80003ef0 <__memset+0x1c8>
    80003e88:	00e50733          	add	a4,a0,a4
    80003e8c:	00b70023          	sb	a1,0(a4)
    80003e90:	0087871b          	addiw	a4,a5,8
    80003e94:	04c77e63          	bgeu	a4,a2,80003ef0 <__memset+0x1c8>
    80003e98:	00e50733          	add	a4,a0,a4
    80003e9c:	00b70023          	sb	a1,0(a4)
    80003ea0:	0097871b          	addiw	a4,a5,9
    80003ea4:	04c77663          	bgeu	a4,a2,80003ef0 <__memset+0x1c8>
    80003ea8:	00e50733          	add	a4,a0,a4
    80003eac:	00b70023          	sb	a1,0(a4)
    80003eb0:	00a7871b          	addiw	a4,a5,10
    80003eb4:	02c77e63          	bgeu	a4,a2,80003ef0 <__memset+0x1c8>
    80003eb8:	00e50733          	add	a4,a0,a4
    80003ebc:	00b70023          	sb	a1,0(a4)
    80003ec0:	00b7871b          	addiw	a4,a5,11
    80003ec4:	02c77663          	bgeu	a4,a2,80003ef0 <__memset+0x1c8>
    80003ec8:	00e50733          	add	a4,a0,a4
    80003ecc:	00b70023          	sb	a1,0(a4)
    80003ed0:	00c7871b          	addiw	a4,a5,12
    80003ed4:	00c77e63          	bgeu	a4,a2,80003ef0 <__memset+0x1c8>
    80003ed8:	00e50733          	add	a4,a0,a4
    80003edc:	00b70023          	sb	a1,0(a4)
    80003ee0:	00d7879b          	addiw	a5,a5,13
    80003ee4:	00c7f663          	bgeu	a5,a2,80003ef0 <__memset+0x1c8>
    80003ee8:	00f507b3          	add	a5,a0,a5
    80003eec:	00b78023          	sb	a1,0(a5)
    80003ef0:	00813403          	ld	s0,8(sp)
    80003ef4:	01010113          	addi	sp,sp,16
    80003ef8:	00008067          	ret
    80003efc:	00b00693          	li	a3,11
    80003f00:	e55ff06f          	j	80003d54 <__memset+0x2c>
    80003f04:	00300e93          	li	t4,3
    80003f08:	ea5ff06f          	j	80003dac <__memset+0x84>
    80003f0c:	00100e93          	li	t4,1
    80003f10:	e9dff06f          	j	80003dac <__memset+0x84>
    80003f14:	00000e93          	li	t4,0
    80003f18:	e95ff06f          	j	80003dac <__memset+0x84>
    80003f1c:	00000793          	li	a5,0
    80003f20:	ef9ff06f          	j	80003e18 <__memset+0xf0>
    80003f24:	00200e93          	li	t4,2
    80003f28:	e85ff06f          	j	80003dac <__memset+0x84>
    80003f2c:	00400e93          	li	t4,4
    80003f30:	e7dff06f          	j	80003dac <__memset+0x84>
    80003f34:	00500e93          	li	t4,5
    80003f38:	e75ff06f          	j	80003dac <__memset+0x84>
    80003f3c:	00600e93          	li	t4,6
    80003f40:	e6dff06f          	j	80003dac <__memset+0x84>

0000000080003f44 <__memmove>:
    80003f44:	ff010113          	addi	sp,sp,-16
    80003f48:	00813423          	sd	s0,8(sp)
    80003f4c:	01010413          	addi	s0,sp,16
    80003f50:	0e060863          	beqz	a2,80004040 <__memmove+0xfc>
    80003f54:	fff6069b          	addiw	a3,a2,-1
    80003f58:	0006881b          	sext.w	a6,a3
    80003f5c:	0ea5e863          	bltu	a1,a0,8000404c <__memmove+0x108>
    80003f60:	00758713          	addi	a4,a1,7
    80003f64:	00a5e7b3          	or	a5,a1,a0
    80003f68:	40a70733          	sub	a4,a4,a0
    80003f6c:	0077f793          	andi	a5,a5,7
    80003f70:	00f73713          	sltiu	a4,a4,15
    80003f74:	00174713          	xori	a4,a4,1
    80003f78:	0017b793          	seqz	a5,a5
    80003f7c:	00e7f7b3          	and	a5,a5,a4
    80003f80:	10078863          	beqz	a5,80004090 <__memmove+0x14c>
    80003f84:	00900793          	li	a5,9
    80003f88:	1107f463          	bgeu	a5,a6,80004090 <__memmove+0x14c>
    80003f8c:	0036581b          	srliw	a6,a2,0x3
    80003f90:	fff8081b          	addiw	a6,a6,-1
    80003f94:	02081813          	slli	a6,a6,0x20
    80003f98:	01d85893          	srli	a7,a6,0x1d
    80003f9c:	00858813          	addi	a6,a1,8
    80003fa0:	00058793          	mv	a5,a1
    80003fa4:	00050713          	mv	a4,a0
    80003fa8:	01088833          	add	a6,a7,a6
    80003fac:	0007b883          	ld	a7,0(a5)
    80003fb0:	00878793          	addi	a5,a5,8
    80003fb4:	00870713          	addi	a4,a4,8
    80003fb8:	ff173c23          	sd	a7,-8(a4)
    80003fbc:	ff0798e3          	bne	a5,a6,80003fac <__memmove+0x68>
    80003fc0:	ff867713          	andi	a4,a2,-8
    80003fc4:	02071793          	slli	a5,a4,0x20
    80003fc8:	0207d793          	srli	a5,a5,0x20
    80003fcc:	00f585b3          	add	a1,a1,a5
    80003fd0:	40e686bb          	subw	a3,a3,a4
    80003fd4:	00f507b3          	add	a5,a0,a5
    80003fd8:	06e60463          	beq	a2,a4,80004040 <__memmove+0xfc>
    80003fdc:	0005c703          	lbu	a4,0(a1)
    80003fe0:	00e78023          	sb	a4,0(a5)
    80003fe4:	04068e63          	beqz	a3,80004040 <__memmove+0xfc>
    80003fe8:	0015c603          	lbu	a2,1(a1)
    80003fec:	00100713          	li	a4,1
    80003ff0:	00c780a3          	sb	a2,1(a5)
    80003ff4:	04e68663          	beq	a3,a4,80004040 <__memmove+0xfc>
    80003ff8:	0025c603          	lbu	a2,2(a1)
    80003ffc:	00200713          	li	a4,2
    80004000:	00c78123          	sb	a2,2(a5)
    80004004:	02e68e63          	beq	a3,a4,80004040 <__memmove+0xfc>
    80004008:	0035c603          	lbu	a2,3(a1)
    8000400c:	00300713          	li	a4,3
    80004010:	00c781a3          	sb	a2,3(a5)
    80004014:	02e68663          	beq	a3,a4,80004040 <__memmove+0xfc>
    80004018:	0045c603          	lbu	a2,4(a1)
    8000401c:	00400713          	li	a4,4
    80004020:	00c78223          	sb	a2,4(a5)
    80004024:	00e68e63          	beq	a3,a4,80004040 <__memmove+0xfc>
    80004028:	0055c603          	lbu	a2,5(a1)
    8000402c:	00500713          	li	a4,5
    80004030:	00c782a3          	sb	a2,5(a5)
    80004034:	00e68663          	beq	a3,a4,80004040 <__memmove+0xfc>
    80004038:	0065c703          	lbu	a4,6(a1)
    8000403c:	00e78323          	sb	a4,6(a5)
    80004040:	00813403          	ld	s0,8(sp)
    80004044:	01010113          	addi	sp,sp,16
    80004048:	00008067          	ret
    8000404c:	02061713          	slli	a4,a2,0x20
    80004050:	02075713          	srli	a4,a4,0x20
    80004054:	00e587b3          	add	a5,a1,a4
    80004058:	f0f574e3          	bgeu	a0,a5,80003f60 <__memmove+0x1c>
    8000405c:	02069613          	slli	a2,a3,0x20
    80004060:	02065613          	srli	a2,a2,0x20
    80004064:	fff64613          	not	a2,a2
    80004068:	00e50733          	add	a4,a0,a4
    8000406c:	00c78633          	add	a2,a5,a2
    80004070:	fff7c683          	lbu	a3,-1(a5)
    80004074:	fff78793          	addi	a5,a5,-1
    80004078:	fff70713          	addi	a4,a4,-1
    8000407c:	00d70023          	sb	a3,0(a4)
    80004080:	fec798e3          	bne	a5,a2,80004070 <__memmove+0x12c>
    80004084:	00813403          	ld	s0,8(sp)
    80004088:	01010113          	addi	sp,sp,16
    8000408c:	00008067          	ret
    80004090:	02069713          	slli	a4,a3,0x20
    80004094:	02075713          	srli	a4,a4,0x20
    80004098:	00170713          	addi	a4,a4,1
    8000409c:	00e50733          	add	a4,a0,a4
    800040a0:	00050793          	mv	a5,a0
    800040a4:	0005c683          	lbu	a3,0(a1)
    800040a8:	00178793          	addi	a5,a5,1
    800040ac:	00158593          	addi	a1,a1,1
    800040b0:	fed78fa3          	sb	a3,-1(a5)
    800040b4:	fee798e3          	bne	a5,a4,800040a4 <__memmove+0x160>
    800040b8:	f89ff06f          	j	80004040 <__memmove+0xfc>

00000000800040bc <__putc>:
    800040bc:	fe010113          	addi	sp,sp,-32
    800040c0:	00813823          	sd	s0,16(sp)
    800040c4:	00113c23          	sd	ra,24(sp)
    800040c8:	02010413          	addi	s0,sp,32
    800040cc:	00050793          	mv	a5,a0
    800040d0:	fef40593          	addi	a1,s0,-17
    800040d4:	00100613          	li	a2,1
    800040d8:	00000513          	li	a0,0
    800040dc:	fef407a3          	sb	a5,-17(s0)
    800040e0:	fffff097          	auipc	ra,0xfffff
    800040e4:	b3c080e7          	jalr	-1220(ra) # 80002c1c <console_write>
    800040e8:	01813083          	ld	ra,24(sp)
    800040ec:	01013403          	ld	s0,16(sp)
    800040f0:	02010113          	addi	sp,sp,32
    800040f4:	00008067          	ret

00000000800040f8 <__getc>:
    800040f8:	fe010113          	addi	sp,sp,-32
    800040fc:	00813823          	sd	s0,16(sp)
    80004100:	00113c23          	sd	ra,24(sp)
    80004104:	02010413          	addi	s0,sp,32
    80004108:	fe840593          	addi	a1,s0,-24
    8000410c:	00100613          	li	a2,1
    80004110:	00000513          	li	a0,0
    80004114:	fffff097          	auipc	ra,0xfffff
    80004118:	ae8080e7          	jalr	-1304(ra) # 80002bfc <console_read>
    8000411c:	fe844503          	lbu	a0,-24(s0)
    80004120:	01813083          	ld	ra,24(sp)
    80004124:	01013403          	ld	s0,16(sp)
    80004128:	02010113          	addi	sp,sp,32
    8000412c:	00008067          	ret

0000000080004130 <console_handler>:
    80004130:	fe010113          	addi	sp,sp,-32
    80004134:	00813823          	sd	s0,16(sp)
    80004138:	00113c23          	sd	ra,24(sp)
    8000413c:	00913423          	sd	s1,8(sp)
    80004140:	02010413          	addi	s0,sp,32
    80004144:	14202773          	csrr	a4,scause
    80004148:	100027f3          	csrr	a5,sstatus
    8000414c:	0027f793          	andi	a5,a5,2
    80004150:	06079e63          	bnez	a5,800041cc <console_handler+0x9c>
    80004154:	00074c63          	bltz	a4,8000416c <console_handler+0x3c>
    80004158:	01813083          	ld	ra,24(sp)
    8000415c:	01013403          	ld	s0,16(sp)
    80004160:	00813483          	ld	s1,8(sp)
    80004164:	02010113          	addi	sp,sp,32
    80004168:	00008067          	ret
    8000416c:	0ff77713          	andi	a4,a4,255
    80004170:	00900793          	li	a5,9
    80004174:	fef712e3          	bne	a4,a5,80004158 <console_handler+0x28>
    80004178:	ffffe097          	auipc	ra,0xffffe
    8000417c:	6dc080e7          	jalr	1756(ra) # 80002854 <plic_claim>
    80004180:	00a00793          	li	a5,10
    80004184:	00050493          	mv	s1,a0
    80004188:	02f50c63          	beq	a0,a5,800041c0 <console_handler+0x90>
    8000418c:	fc0506e3          	beqz	a0,80004158 <console_handler+0x28>
    80004190:	00050593          	mv	a1,a0
    80004194:	00001517          	auipc	a0,0x1
    80004198:	13450513          	addi	a0,a0,308 # 800052c8 <_ZZ12printIntegermE6digits+0x2a8>
    8000419c:	fffff097          	auipc	ra,0xfffff
    800041a0:	afc080e7          	jalr	-1284(ra) # 80002c98 <__printf>
    800041a4:	01013403          	ld	s0,16(sp)
    800041a8:	01813083          	ld	ra,24(sp)
    800041ac:	00048513          	mv	a0,s1
    800041b0:	00813483          	ld	s1,8(sp)
    800041b4:	02010113          	addi	sp,sp,32
    800041b8:	ffffe317          	auipc	t1,0xffffe
    800041bc:	6d430067          	jr	1748(t1) # 8000288c <plic_complete>
    800041c0:	fffff097          	auipc	ra,0xfffff
    800041c4:	3e0080e7          	jalr	992(ra) # 800035a0 <uartintr>
    800041c8:	fddff06f          	j	800041a4 <console_handler+0x74>
    800041cc:	00001517          	auipc	a0,0x1
    800041d0:	1fc50513          	addi	a0,a0,508 # 800053c8 <digits+0x78>
    800041d4:	fffff097          	auipc	ra,0xfffff
    800041d8:	a68080e7          	jalr	-1432(ra) # 80002c3c <panic>
	...
