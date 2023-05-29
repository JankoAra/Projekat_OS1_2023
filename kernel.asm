
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00006117          	auipc	sp,0x6
    80000004:	9c813103          	ld	sp,-1592(sp) # 800059c8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	709010ef          	jal	ra,80001f24 <start>

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
    80001188:	5fc000ef          	jal	ra,80001784 <interruptRoutine>
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
    800012e0:	980080e7          	jalr	-1664(ra) # 80001c5c <_ZN15MemoryAllocator7kmallocEm>
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
    8000145c:	b94080e7          	jalr	-1132(ra) # 80003fec <__putc>
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
    8000149c:	b54080e7          	jalr	-1196(ra) # 80003fec <__putc>
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
    80001524:	acc080e7          	jalr	-1332(ra) # 80003fec <__putc>
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
    80001570:	4c478793          	addi	a5,a5,1220 # 80005a30 <_ZN9Scheduler12readyThreadsE>
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
    800015a4:	468080e7          	jalr	1128(ra) # 80001a08 <_Znwm>
		Elem(T* data, Elem* next) : data(data), next(next) {}
    800015a8:	00953023          	sd	s1,0(a0) # 1000 <_entry-0x7ffff000>
    800015ac:	00053423          	sd	zero,8(a0)
		if (tail) {
    800015b0:	00004797          	auipc	a5,0x4
    800015b4:	4887b783          	ld	a5,1160(a5) # 80005a38 <_ZN9Scheduler12readyThreadsE+0x8>
    800015b8:	02078c63          	beqz	a5,800015f0 <_ZN9Scheduler3putEP3TCB+0x6c>
			tail->next = elem;
    800015bc:	00a7b423          	sd	a0,8(a5)
			tail = elem;
    800015c0:	00004797          	auipc	a5,0x4
    800015c4:	46a7bc23          	sd	a0,1144(a5) # 80005a38 <_ZN9Scheduler12readyThreadsE+0x8>
		} else {
			head = tail = elem;
		}
		numOfElements++;
    800015c8:	00004717          	auipc	a4,0x4
    800015cc:	46870713          	addi	a4,a4,1128 # 80005a30 <_ZN9Scheduler12readyThreadsE>
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
    800015f4:	44078793          	addi	a5,a5,1088 # 80005a30 <_ZN9Scheduler12readyThreadsE>
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
    8000161c:	41853503          	ld	a0,1048(a0) # 80005a30 <_ZN9Scheduler12readyThreadsE>
    80001620:	04050c63          	beqz	a0,80001678 <_ZN9Scheduler3getEv+0x74>

		Elem* elem = head;
		head = head->next;
    80001624:	00853783          	ld	a5,8(a0)
    80001628:	00004717          	auipc	a4,0x4
    8000162c:	40f73423          	sd	a5,1032(a4) # 80005a30 <_ZN9Scheduler12readyThreadsE>
		if (!head) { tail = nullptr; }
    80001630:	02078e63          	beqz	a5,8000166c <_ZN9Scheduler3getEv+0x68>

		T* ret = elem->data;
    80001634:	00053483          	ld	s1,0(a0)
		delete elem;
    80001638:	00000097          	auipc	ra,0x0
    8000163c:	420080e7          	jalr	1056(ra) # 80001a58 <_ZdlPv>
		numOfElements--;
    80001640:	00004717          	auipc	a4,0x4
    80001644:	3f070713          	addi	a4,a4,1008 # 80005a30 <_ZN9Scheduler12readyThreadsE>
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
    80001670:	3c07b623          	sd	zero,972(a5) # 80005a38 <_ZN9Scheduler12readyThreadsE+0x8>
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
    800016d8:	48c080e7          	jalr	1164(ra) # 80001b60 <_ZN3TCB8dispatchEv>
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
    800016fc:	fe010113          	addi	sp,sp,-32
    80001700:	00113c23          	sd	ra,24(sp)
    80001704:	00813823          	sd	s0,16(sp)
    80001708:	02010413          	addi	s0,sp,32
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    8000170c:	00200793          	li	a5,2
    80001710:	1007b073          	csrc	sstatus,a5
	//zabrani prekide
	Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
	//postavi adresu prekidne rutine u stvec
	Riscv::w_stvec((uint64)&interruptHandler);
    80001714:	00004717          	auipc	a4,0x4
    80001718:	2cc73703          	ld	a4,716(a4) # 800059e0 <_GLOBAL_OFFSET_TABLE_+0x28>
	__asm__ volatile("csrw stvec, %[stvec]": :[stvec] "r"(stvec));
    8000171c:	10571073          	csrw	stvec,a4
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80001720:	1007a073          	csrs	sstatus,a5
//	println("");

	//testiranje kreiranja niti
	thread_t glavnaNit;
	thread_t nit1;
	thread_create(&glavnaNit, nullptr, nullptr);
    80001724:	00000613          	li	a2,0
    80001728:	00000593          	li	a1,0
    8000172c:	fe840513          	addi	a0,s0,-24
    80001730:	00000097          	auipc	ra,0x0
    80001734:	b7c080e7          	jalr	-1156(ra) # 800012ac <_Z13thread_createPP3TCBPFvPvES2_>
	TCB::running = glavnaNit;
    80001738:	00004797          	auipc	a5,0x4
    8000173c:	2987b783          	ld	a5,664(a5) # 800059d0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80001740:	fe843703          	ld	a4,-24(s0)
    80001744:	00e7b023          	sd	a4,0(a5)
	thread_create(&nit1, nit1f, nullptr);
    80001748:	00000613          	li	a2,0
    8000174c:	00000597          	auipc	a1,0x0
    80001750:	f6858593          	addi	a1,a1,-152 # 800016b4 <_Z5nit1fPv>
    80001754:	fe040513          	addi	a0,s0,-32
    80001758:	00000097          	auipc	ra,0x0
    8000175c:	b54080e7          	jalr	-1196(ra) # 800012ac <_Z13thread_createPP3TCBPFvPvES2_>
	println("");
    80001760:	00004517          	auipc	a0,0x4
    80001764:	a8050513          	addi	a0,a0,-1408 # 800051e0 <_ZZ12printIntegermE6digits+0x1c0>
    80001768:	00000097          	auipc	ra,0x0
    8000176c:	d14080e7          	jalr	-748(ra) # 8000147c <_Z7printlnPKc>
	return 0;
    80001770:	00000513          	li	a0,0
    80001774:	01813083          	ld	ra,24(sp)
    80001778:	01013403          	ld	s0,16(sp)
    8000177c:	02010113          	addi	sp,sp,32
    80001780:	00008067          	ret

0000000080001784 <interruptRoutine>:
#include "../h/syscall_c.hpp"
#include "../h/TCB.hpp"

#pragma GCC optimize("O0")

extern "C" void interruptRoutine() {
    80001784:	f6010113          	addi	sp,sp,-160
    80001788:	08113c23          	sd	ra,152(sp)
    8000178c:	08813823          	sd	s0,144(sp)
    80001790:	0a010413          	addi	s0,sp,160
	//uint64 scause = Riscv::r_scause();
	//uint64 sepc = Riscv::r_sepc();
	uint64 scause, sepc;
	__asm__ volatile("csrr %[scause], scause":[scause] "=r"(scause): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001794:	14202373          	csrr	t1,scause
    80001798:	fe643423          	sd	t1,-24(s0)
	__asm__ volatile("csrr %[sepc], sepc":[sepc] "=r"(sepc): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000179c:	14102373          	csrr	t1,sepc
    800017a0:	fe643023          	sd	t1,-32(s0)
	uint64 a0, a1, a2, a3, a4, a5, a6, a7;
	__asm__ volatile("mv %[ax], a0":[ax] "=r"(a0): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800017a4:	00050313          	mv	t1,a0
    800017a8:	fc643c23          	sd	t1,-40(s0)
	__asm__ volatile("mv %[ax], a1":[ax] "=r"(a1): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800017ac:	00058313          	mv	t1,a1
    800017b0:	fc643823          	sd	t1,-48(s0)
	__asm__ volatile("mv %[ax], a2":[ax] "=r"(a2): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800017b4:	00060313          	mv	t1,a2
    800017b8:	fc643423          	sd	t1,-56(s0)
	__asm__ volatile("mv %[ax], a3":[ax] "=r"(a3): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800017bc:	00068313          	mv	t1,a3
    800017c0:	fc643023          	sd	t1,-64(s0)
	__asm__ volatile("mv %[ax], a4":[ax] "=r"(a4): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800017c4:	00070313          	mv	t1,a4
    800017c8:	fa643c23          	sd	t1,-72(s0)
	__asm__ volatile("mv %[ax], a5":[ax] "=r"(a5): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800017cc:	00078313          	mv	t1,a5
    800017d0:	fa643823          	sd	t1,-80(s0)
	__asm__ volatile("mv %[ax], a6":[ax] "=r"(a6): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800017d4:	00080313          	mv	t1,a6
    800017d8:	fa643423          	sd	t1,-88(s0)
	__asm__ volatile("mv %[ax], a7":[ax] "=r"(a7): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800017dc:	00088313          	mv	t1,a7
    800017e0:	fa643023          	sd	t1,-96(s0)

	if (scause == 0x09 || scause == 0x08) {
    800017e4:	fe843703          	ld	a4,-24(s0)
    800017e8:	00900793          	li	a5,9
    800017ec:	00f70863          	beq	a4,a5,800017fc <interruptRoutine+0x78>
    800017f0:	fe843703          	ld	a4,-24(s0)
    800017f4:	00800793          	li	a5,8
    800017f8:	14f71a63          	bne	a4,a5,8000194c <interruptRoutine+0x1c8>
		//prekid zbog poziva ecall
		uint64 opCode = a0;
    800017fc:	fd843783          	ld	a5,-40(s0)
    80001800:	f8f43c23          	sd	a5,-104(s0)

		switch (opCode) {
    80001804:	f9843703          	ld	a4,-104(s0)
    80001808:	04200793          	li	a5,66
    8000180c:	0ce7e463          	bltu	a5,a4,800018d4 <interruptRoutine+0x150>
    80001810:	f9843783          	ld	a5,-104(s0)
    80001814:	00279713          	slli	a4,a5,0x2
    80001818:	00004797          	auipc	a5,0x4
    8000181c:	89478793          	addi	a5,a5,-1900 # 800050ac <_ZZ12printIntegermE6digits+0x8c>
    80001820:	00f707b3          	add	a5,a4,a5
    80001824:	0007a783          	lw	a5,0(a5)
    80001828:	0007871b          	sext.w	a4,a5
    8000182c:	00004797          	auipc	a5,0x4
    80001830:	88078793          	addi	a5,a5,-1920 # 800050ac <_ZZ12printIntegermE6digits+0x8c>
    80001834:	00f707b3          	add	a5,a4,a5
    80001838:	00078067          	jr	a5
			case 0x01:
				//mem_alloc
				size_t size;
				size = (size_t)a1;
    8000183c:	fd043783          	ld	a5,-48(s0)
    80001840:	f6f43423          	sd	a5,-152(s0)
				//__asm__ volatile("mv %[size], a1":[size] "=r"(size));
				size = size * MEM_BLOCK_SIZE;
    80001844:	f6843783          	ld	a5,-152(s0)
    80001848:	00679793          	slli	a5,a5,0x6
    8000184c:	f6f43423          	sd	a5,-152(s0)
				MemoryAllocator::kmalloc(size);
    80001850:	f6843503          	ld	a0,-152(s0)
    80001854:	00000097          	auipc	ra,0x0
    80001858:	408080e7          	jalr	1032(ra) # 80001c5c <_ZN15MemoryAllocator7kmallocEm>
				break;
    8000185c:	0d40006f          	j	80001930 <interruptRoutine+0x1ac>
			case 0x02:
				//mem_free
				void* ptr;
				ptr = (void*)a1;
    80001860:	fd043783          	ld	a5,-48(s0)
    80001864:	f6f43823          	sd	a5,-144(s0)
				//__asm__ volatile("mv %[ptr], a1" :[ptr]"=r"(ptr));
				MemoryAllocator::kfree(ptr);
    80001868:	f7043503          	ld	a0,-144(s0)
    8000186c:	00000097          	auipc	ra,0x0
    80001870:	598080e7          	jalr	1432(ra) # 80001e04 <_ZN15MemoryAllocator5kfreeEPv>
				break;
    80001874:	0bc0006f          	j	80001930 <interruptRoutine+0x1ac>
			case 0x11:
				//thread_create
				thread_t* handle;
				handle = (thread_t*)a1;
    80001878:	fd043783          	ld	a5,-48(s0)
    8000187c:	f8f43823          	sd	a5,-112(s0)
				void (* function)(void*);
				function = (void (*)(void*))a2;
    80001880:	fc843783          	ld	a5,-56(s0)
    80001884:	f8f43423          	sd	a5,-120(s0)
				void* args;
				args = (void*)a3;
    80001888:	fc043783          	ld	a5,-64(s0)
    8000188c:	f8f43023          	sd	a5,-128(s0)
				uint64* sp;
				sp = (uint64*)a4;
    80001890:	fb843783          	ld	a5,-72(s0)
    80001894:	f6f43c23          	sd	a5,-136(s0)
//				__asm__ volatile("mv %[handle], a1":[handle]"=r"(handle));
//				__asm__ volatile("mv %[f], a2":[f]"=r"(function));
//				__asm__ volatile("mv %[args], a3":[args]"=r"(args));
//				__asm__ volatile("mv %[sp], a4":[sp]"=r"(sp));

				*handle = TCB::createThread(function, args, sp);
    80001898:	f7843603          	ld	a2,-136(s0)
    8000189c:	f8043583          	ld	a1,-128(s0)
    800018a0:	f8843503          	ld	a0,-120(s0)
    800018a4:	00000097          	auipc	ra,0x0
    800018a8:	204080e7          	jalr	516(ra) # 80001aa8 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    800018ac:	00050713          	mv	a4,a0
    800018b0:	f9043783          	ld	a5,-112(s0)
    800018b4:	00e7b023          	sd	a4,0(a5)
				if (*handle != nullptr) {
    800018b8:	f9043783          	ld	a5,-112(s0)
    800018bc:	0007b783          	ld	a5,0(a5)
    800018c0:	00078663          	beqz	a5,800018cc <interruptRoutine+0x148>
					__asm__ volatile("li a0, 0");
    800018c4:	00000513          	li	a0,0
				} else {
					__asm__ volatile("li a0, -1");
				}
				break;
    800018c8:	0680006f          	j	80001930 <interruptRoutine+0x1ac>
					__asm__ volatile("li a0, -1");
    800018cc:	fff00513          	li	a0,-1
				break;
    800018d0:	0600006f          	j	80001930 <interruptRoutine+0x1ac>
				break;
			case 0x42:
				//putc
				break;
			default:
				printString("\nNepostojeci op code: ");
    800018d4:	00003517          	auipc	a0,0x3
    800018d8:	77c50513          	addi	a0,a0,1916 # 80005050 <_ZZ12printIntegermE6digits+0x30>
    800018dc:	00000097          	auipc	ra,0x0
    800018e0:	b5c080e7          	jalr	-1188(ra) # 80001438 <_Z11printStringPKc>
				printInteger(opCode);
    800018e4:	f9843503          	ld	a0,-104(s0)
    800018e8:	00000097          	auipc	ra,0x0
    800018ec:	bc8080e7          	jalr	-1080(ra) # 800014b0 <_Z12printIntegerm>
				printString("\nscause: ");
    800018f0:	00003517          	auipc	a0,0x3
    800018f4:	77850513          	addi	a0,a0,1912 # 80005068 <_ZZ12printIntegermE6digits+0x48>
    800018f8:	00000097          	auipc	ra,0x0
    800018fc:	b40080e7          	jalr	-1216(ra) # 80001438 <_Z11printStringPKc>
				printInteger(scause);
    80001900:	fe843503          	ld	a0,-24(s0)
    80001904:	00000097          	auipc	ra,0x0
    80001908:	bac080e7          	jalr	-1108(ra) # 800014b0 <_Z12printIntegerm>
				printString("\nsepc: ");
    8000190c:	00003517          	auipc	a0,0x3
    80001910:	76c50513          	addi	a0,a0,1900 # 80005078 <_ZZ12printIntegermE6digits+0x58>
    80001914:	00000097          	auipc	ra,0x0
    80001918:	b24080e7          	jalr	-1244(ra) # 80001438 <_Z11printStringPKc>
				printInteger(sepc);
    8000191c:	fe043503          	ld	a0,-32(s0)
    80001920:	00000097          	auipc	ra,0x0
    80001924:	b90080e7          	jalr	-1136(ra) # 800014b0 <_Z12printIntegerm>
				break;
    80001928:	0080006f          	j	80001930 <interruptRoutine+0x1ac>
				break;
    8000192c:	00000013          	nop
		}
		//sepc pokazuje na ecall instrukciju, treba preci na sledecu instrukciju
		//sepc += 4;
		__asm__ volatile("addi %[dst], %[src], 0x4":[dst]"=r"(sepc):[src]"r"(
				sepc):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001930:	fe043303          	ld	t1,-32(s0)
    80001934:	00430313          	addi	t1,t1,4
    80001938:	fe643023          	sd	t1,-32(s0)
		__asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000193c:	fe043303          	ld	t1,-32(s0)
    80001940:	14131073          	csrw	sepc,t1
    80001944:	00000013          	nop
		printString("scause: ");
		printInteger(scause);
		printString("\nsepc: ");
		printInteger(sepc);
	}
}
    80001948:	0900006f          	j	800019d8 <interruptRoutine+0x254>
	} else if (scause == (1UL << 63 | 9)) {
    8000194c:	fe843703          	ld	a4,-24(s0)
    80001950:	fff00793          	li	a5,-1
    80001954:	03f79793          	slli	a5,a5,0x3f
    80001958:	00978793          	addi	a5,a5,9
    8000195c:	00f71863          	bne	a4,a5,8000196c <interruptRoutine+0x1e8>
		console_handler();
    80001960:	00002097          	auipc	ra,0x2
    80001964:	700080e7          	jalr	1792(ra) # 80004060 <console_handler>
}
    80001968:	0700006f          	j	800019d8 <interruptRoutine+0x254>
	} else if (scause == (1UL << 63 | 1)) {
    8000196c:	fe843703          	ld	a4,-24(s0)
    80001970:	fff00793          	li	a5,-1
    80001974:	03f79793          	slli	a5,a5,0x3f
    80001978:	00178793          	addi	a5,a5,1
    8000197c:	00f71a63          	bne	a4,a5,80001990 <interruptRoutine+0x20c>
		Riscv::mc_sip(Riscv::SIP_SSIP);
    80001980:	00200513          	li	a0,2
    80001984:	00000097          	auipc	ra,0x0
    80001988:	068080e7          	jalr	104(ra) # 800019ec <_ZN5Riscv6mc_sipEm>
}
    8000198c:	04c0006f          	j	800019d8 <interruptRoutine+0x254>
		println("\nGreska u prekidnoj rutini");
    80001990:	00003517          	auipc	a0,0x3
    80001994:	6f050513          	addi	a0,a0,1776 # 80005080 <_ZZ12printIntegermE6digits+0x60>
    80001998:	00000097          	auipc	ra,0x0
    8000199c:	ae4080e7          	jalr	-1308(ra) # 8000147c <_Z7printlnPKc>
		printString("scause: ");
    800019a0:	00003517          	auipc	a0,0x3
    800019a4:	70050513          	addi	a0,a0,1792 # 800050a0 <_ZZ12printIntegermE6digits+0x80>
    800019a8:	00000097          	auipc	ra,0x0
    800019ac:	a90080e7          	jalr	-1392(ra) # 80001438 <_Z11printStringPKc>
		printInteger(scause);
    800019b0:	fe843503          	ld	a0,-24(s0)
    800019b4:	00000097          	auipc	ra,0x0
    800019b8:	afc080e7          	jalr	-1284(ra) # 800014b0 <_Z12printIntegerm>
		printString("\nsepc: ");
    800019bc:	00003517          	auipc	a0,0x3
    800019c0:	6bc50513          	addi	a0,a0,1724 # 80005078 <_ZZ12printIntegermE6digits+0x58>
    800019c4:	00000097          	auipc	ra,0x0
    800019c8:	a74080e7          	jalr	-1420(ra) # 80001438 <_Z11printStringPKc>
		printInteger(sepc);
    800019cc:	fe043503          	ld	a0,-32(s0)
    800019d0:	00000097          	auipc	ra,0x0
    800019d4:	ae0080e7          	jalr	-1312(ra) # 800014b0 <_Z12printIntegerm>
}
    800019d8:	00000013          	nop
    800019dc:	09813083          	ld	ra,152(sp)
    800019e0:	09013403          	ld	s0,144(sp)
    800019e4:	0a010113          	addi	sp,sp,160
    800019e8:	00008067          	ret

00000000800019ec <_ZN5Riscv6mc_sipEm>:
inline void Riscv::mc_sip(uint64 mask) {
    800019ec:	ff010113          	addi	sp,sp,-16
    800019f0:	00813423          	sd	s0,8(sp)
    800019f4:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sip, %[mask]": :[mask] "r"(mask));
    800019f8:	14453073          	csrc	sip,a0
}
    800019fc:	00813403          	ld	s0,8(sp)
    80001a00:	01010113          	addi	sp,sp,16
    80001a04:	00008067          	ret

0000000080001a08 <_Znwm>:
// Created by os on 5/29/23.
//
#include "../h/syscall_cpp.hpp"

//override globalnog new
void* operator new(size_t size) {
    80001a08:	ff010113          	addi	sp,sp,-16
    80001a0c:	00113423          	sd	ra,8(sp)
    80001a10:	00813023          	sd	s0,0(sp)
    80001a14:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    80001a18:	00000097          	auipc	ra,0x0
    80001a1c:	820080e7          	jalr	-2016(ra) # 80001238 <_Z9mem_allocm>
}
    80001a20:	00813083          	ld	ra,8(sp)
    80001a24:	00013403          	ld	s0,0(sp)
    80001a28:	01010113          	addi	sp,sp,16
    80001a2c:	00008067          	ret

0000000080001a30 <_Znam>:

void* operator new[](size_t size) {
    80001a30:	ff010113          	addi	sp,sp,-16
    80001a34:	00113423          	sd	ra,8(sp)
    80001a38:	00813023          	sd	s0,0(sp)
    80001a3c:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    80001a40:	fffff097          	auipc	ra,0xfffff
    80001a44:	7f8080e7          	jalr	2040(ra) # 80001238 <_Z9mem_allocm>
}
    80001a48:	00813083          	ld	ra,8(sp)
    80001a4c:	00013403          	ld	s0,0(sp)
    80001a50:	01010113          	addi	sp,sp,16
    80001a54:	00008067          	ret

0000000080001a58 <_ZdlPv>:

void operator delete(void* ptr)noexcept {
    80001a58:	ff010113          	addi	sp,sp,-16
    80001a5c:	00113423          	sd	ra,8(sp)
    80001a60:	00813023          	sd	s0,0(sp)
    80001a64:	01010413          	addi	s0,sp,16
mem_free(ptr);
    80001a68:	00000097          	auipc	ra,0x0
    80001a6c:	810080e7          	jalr	-2032(ra) # 80001278 <_Z8mem_freePv>
}
    80001a70:	00813083          	ld	ra,8(sp)
    80001a74:	00013403          	ld	s0,0(sp)
    80001a78:	01010113          	addi	sp,sp,16
    80001a7c:	00008067          	ret

0000000080001a80 <_ZdaPv>:

void operator delete[](void* ptr)noexcept {
    80001a80:	ff010113          	addi	sp,sp,-16
    80001a84:	00113423          	sd	ra,8(sp)
    80001a88:	00813023          	sd	s0,0(sp)
    80001a8c:	01010413          	addi	s0,sp,16
mem_free(ptr);
    80001a90:	fffff097          	auipc	ra,0xfffff
    80001a94:	7e8080e7          	jalr	2024(ra) # 80001278 <_Z8mem_freePv>
    80001a98:	00813083          	ld	ra,8(sp)
    80001a9c:	00013403          	ld	s0,0(sp)
    80001aa0:	01010113          	addi	sp,sp,16
    80001aa4:	00008067          	ret

0000000080001aa8 <_ZN3TCB12createThreadEPFvPvES0_Pm>:
#include "../h/Riscv.hpp"

TCB* TCB::running = nullptr;
uint64 TCB::runningTimeSlice = 0;

TCB* TCB::createThread(TCB::Body function, void* args, uint64* stack) {
    80001aa8:	fd010113          	addi	sp,sp,-48
    80001aac:	02113423          	sd	ra,40(sp)
    80001ab0:	02813023          	sd	s0,32(sp)
    80001ab4:	00913c23          	sd	s1,24(sp)
    80001ab8:	01213823          	sd	s2,16(sp)
    80001abc:	01313423          	sd	s3,8(sp)
    80001ac0:	01413023          	sd	s4,0(sp)
    80001ac4:	03010413          	addi	s0,sp,48
    80001ac8:	00050993          	mv	s3,a0
    80001acc:	00058a13          	mv	s4,a1
    80001ad0:	00060913          	mv	s2,a2
	TCB* newThread = new TCB(function, args, stack);
    80001ad4:	03800513          	li	a0,56
    80001ad8:	00000097          	auipc	ra,0x0
    80001adc:	f30080e7          	jalr	-208(ra) # 80001a08 <_Znwm>
    80001ae0:	00050493          	mv	s1,a0
	uint64 timeSlice;        //vremenski odsecak dodeljen datoj niti
	bool finished;            //da li je nit zavrsila izvrsavanje funkcije
	bool blocked;            //da li je nit blokirana

	TCB(Body function, void* args, uint64* stack) : threadFunction(function), stack(stack), args(args),
													timeSlice(DEFAULT_TIME_SLICE), finished(false), blocked(false) {
    80001ae4:	01353823          	sd	s3,16(a0)
    80001ae8:	01253c23          	sd	s2,24(a0)
    80001aec:	03453023          	sd	s4,32(a0)
    80001af0:	00200793          	li	a5,2
    80001af4:	02f53423          	sd	a5,40(a0)
    80001af8:	02050823          	sb	zero,48(a0)
    80001afc:	020508a3          	sb	zero,49(a0)
		//formiranje pocetnog konteksta; specijalni uslovi za main funkciju kojoj se pocetni kontekst automatski formira
		uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
    80001b00:	04098863          	beqz	s3,80001b50 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xa8>
    80001b04:	00000797          	auipc	a5,0x0
    80001b08:	10478793          	addi	a5,a5,260 # 80001c08 <_ZN3TCB7wrapperEv>
		uint64 startSp = stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0;
    80001b0c:	04090663          	beqz	s2,80001b58 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xb0>
    80001b10:	00008637          	lui	a2,0x8
    80001b14:	00c90933          	add	s2,s2,a2
		this->context.ra = startRa;
    80001b18:	00f4b423          	sd	a5,8(s1)
		this->context.sp = startSp;
    80001b1c:	0124b023          	sd	s2,0(s1)
	Scheduler::put(newThread);
    80001b20:	00048513          	mv	a0,s1
    80001b24:	00000097          	auipc	ra,0x0
    80001b28:	a60080e7          	jalr	-1440(ra) # 80001584 <_ZN9Scheduler3putEP3TCB>
	return newThread;
}
    80001b2c:	00048513          	mv	a0,s1
    80001b30:	02813083          	ld	ra,40(sp)
    80001b34:	02013403          	ld	s0,32(sp)
    80001b38:	01813483          	ld	s1,24(sp)
    80001b3c:	01013903          	ld	s2,16(sp)
    80001b40:	00813983          	ld	s3,8(sp)
    80001b44:	00013a03          	ld	s4,0(sp)
    80001b48:	03010113          	addi	sp,sp,48
    80001b4c:	00008067          	ret
		uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
    80001b50:	00000793          	li	a5,0
    80001b54:	fb9ff06f          	j	80001b0c <_ZN3TCB12createThreadEPFvPvES0_Pm+0x64>
		uint64 startSp = stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0;
    80001b58:	00000913          	li	s2,0
    80001b5c:	fbdff06f          	j	80001b18 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x70>

0000000080001b60 <_ZN3TCB8dispatchEv>:

void TCB::dispatch() {
    80001b60:	fe010113          	addi	sp,sp,-32
    80001b64:	00113c23          	sd	ra,24(sp)
    80001b68:	00813823          	sd	s0,16(sp)
    80001b6c:	00913423          	sd	s1,8(sp)
    80001b70:	02010413          	addi	s0,sp,32
	TCB* old = TCB::running;
    80001b74:	00004497          	auipc	s1,0x4
    80001b78:	ed44b483          	ld	s1,-300(s1) # 80005a48 <_ZN3TCB7runningE>
	bool isFinished() { return finished; }
    80001b7c:	0304c783          	lbu	a5,48(s1)
	if (!old->isFinished() && !old->isBlocked()) {
    80001b80:	00079663          	bnez	a5,80001b8c <_ZN3TCB8dispatchEv+0x2c>
	bool isBlocked() { return blocked; }
    80001b84:	0314c783          	lbu	a5,49(s1)
    80001b88:	02078c63          	beqz	a5,80001bc0 <_ZN3TCB8dispatchEv+0x60>
		Scheduler::put(old);
	}
	TCB::running = Scheduler::get();
    80001b8c:	00000097          	auipc	ra,0x0
    80001b90:	a78080e7          	jalr	-1416(ra) # 80001604 <_ZN9Scheduler3getEv>
    80001b94:	00050593          	mv	a1,a0
    80001b98:	00004797          	auipc	a5,0x4
    80001b9c:	eaa7b823          	sd	a0,-336(a5) # 80005a48 <_ZN3TCB7runningE>
	TCB::contextSwitch(&old->context, &running->context);
    80001ba0:	00048513          	mv	a0,s1
    80001ba4:	fffff097          	auipc	ra,0xfffff
    80001ba8:	680080e7          	jalr	1664(ra) # 80001224 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80001bac:	01813083          	ld	ra,24(sp)
    80001bb0:	01013403          	ld	s0,16(sp)
    80001bb4:	00813483          	ld	s1,8(sp)
    80001bb8:	02010113          	addi	sp,sp,32
    80001bbc:	00008067          	ret
		Scheduler::put(old);
    80001bc0:	00048513          	mv	a0,s1
    80001bc4:	00000097          	auipc	ra,0x0
    80001bc8:	9c0080e7          	jalr	-1600(ra) # 80001584 <_ZN9Scheduler3putEP3TCB>
    80001bcc:	fc1ff06f          	j	80001b8c <_ZN3TCB8dispatchEv+0x2c>

0000000080001bd0 <_ZN3TCB5yieldEv>:

void TCB::yield() {
    80001bd0:	ff010113          	addi	sp,sp,-16
    80001bd4:	00113423          	sd	ra,8(sp)
    80001bd8:	00813023          	sd	s0,0(sp)
    80001bdc:	01010413          	addi	s0,sp,16
	Riscv::pushRegisters();
    80001be0:	fffff097          	auipc	ra,0xfffff
    80001be4:	420080e7          	jalr	1056(ra) # 80001000 <_ZN5Riscv13pushRegistersEv>
	TCB::dispatch();
    80001be8:	00000097          	auipc	ra,0x0
    80001bec:	f78080e7          	jalr	-136(ra) # 80001b60 <_ZN3TCB8dispatchEv>
	Riscv::popRegisters();
    80001bf0:	fffff097          	auipc	ra,0xfffff
    80001bf4:	48c080e7          	jalr	1164(ra) # 8000107c <_ZN5Riscv12popRegistersEv>
}
    80001bf8:	00813083          	ld	ra,8(sp)
    80001bfc:	00013403          	ld	s0,0(sp)
    80001c00:	01010113          	addi	sp,sp,16
    80001c04:	00008067          	ret

0000000080001c08 <_ZN3TCB7wrapperEv>:

void TCB::wrapper() {
    80001c08:	fe010113          	addi	sp,sp,-32
    80001c0c:	00113c23          	sd	ra,24(sp)
    80001c10:	00813823          	sd	s0,16(sp)
    80001c14:	00913423          	sd	s1,8(sp)
    80001c18:	02010413          	addi	s0,sp,32
	running->threadFunction(running->args);
    80001c1c:	00004497          	auipc	s1,0x4
    80001c20:	e2c48493          	addi	s1,s1,-468 # 80005a48 <_ZN3TCB7runningE>
    80001c24:	0004b783          	ld	a5,0(s1)
    80001c28:	0107b703          	ld	a4,16(a5)
    80001c2c:	0207b503          	ld	a0,32(a5)
    80001c30:	000700e7          	jalr	a4
	running->finished = true;
    80001c34:	0004b783          	ld	a5,0(s1)
    80001c38:	00100713          	li	a4,1
    80001c3c:	02e78823          	sb	a4,48(a5)
	TCB::yield();
    80001c40:	00000097          	auipc	ra,0x0
    80001c44:	f90080e7          	jalr	-112(ra) # 80001bd0 <_ZN3TCB5yieldEv>
}
    80001c48:	01813083          	ld	ra,24(sp)
    80001c4c:	01013403          	ld	s0,16(sp)
    80001c50:	00813483          	ld	s1,8(sp)
    80001c54:	02010113          	addi	sp,sp,32
    80001c58:	00008067          	ret

0000000080001c5c <_ZN15MemoryAllocator7kmallocEm>:

bool MemoryAllocator::initialized = false;
MemoryAllocator::FreeMemSegment* MemoryAllocator::freeMemHead = nullptr;
MemoryAllocator::UsedMemSegment* MemoryAllocator::usedMemHead = nullptr;

void* MemoryAllocator::kmalloc(size_t size) {
    80001c5c:	ff010113          	addi	sp,sp,-16
    80001c60:	00813423          	sd	s0,8(sp)
    80001c64:	01010413          	addi	s0,sp,16
	if (size <= 0) return nullptr;
    80001c68:	12050663          	beqz	a0,80001d94 <_ZN15MemoryAllocator7kmallocEm+0x138>

	//pocetna inicijalizacija
	if (!initialized) {
    80001c6c:	00004797          	auipc	a5,0x4
    80001c70:	dec7c783          	lbu	a5,-532(a5) # 80005a58 <_ZN15MemoryAllocator11initializedE>
    80001c74:	04079663          	bnez	a5,80001cc0 <_ZN15MemoryAllocator7kmallocEm+0x64>
		freeMemHead = (FreeMemSegment*)HEAP_START_ADDR;
    80001c78:	00004617          	auipc	a2,0x4
    80001c7c:	d4863603          	ld	a2,-696(a2) # 800059c0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001c80:	00063703          	ld	a4,0(a2)
    80001c84:	00004797          	auipc	a5,0x4
    80001c88:	dd478793          	addi	a5,a5,-556 # 80005a58 <_ZN15MemoryAllocator11initializedE>
    80001c8c:	00e7b423          	sd	a4,8(a5)
		freeMemHead->next = nullptr;
    80001c90:	00073023          	sd	zero,0(a4)
		freeMemHead->prev = nullptr;
    80001c94:	0087b683          	ld	a3,8(a5)
    80001c98:	0006b423          	sd	zero,8(a3)
		freeMemHead->size = (char*)HEAP_END_ADDR - (char*)HEAP_START_ADDR;
    80001c9c:	00004717          	auipc	a4,0x4
    80001ca0:	d3c73703          	ld	a4,-708(a4) # 800059d8 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001ca4:	00073703          	ld	a4,0(a4)
    80001ca8:	00063603          	ld	a2,0(a2)
    80001cac:	40c70733          	sub	a4,a4,a2
    80001cb0:	00e6b823          	sd	a4,16(a3)
		usedMemHead = nullptr;
    80001cb4:	0007b823          	sd	zero,16(a5)

		initialized = true;
    80001cb8:	00100713          	li	a4,1
    80001cbc:	00e78023          	sb	a4,0(a5)
	}

	//alokacija uvek zaokruzena na blokove
	size += sizeof(UsedMemSegment);
    80001cc0:	01050513          	addi	a0,a0,16
	size_t blocks = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
    80001cc4:	00655713          	srli	a4,a0,0x6
    80001cc8:	03f57793          	andi	a5,a0,63
    80001ccc:	00078463          	beqz	a5,80001cd4 <_ZN15MemoryAllocator7kmallocEm+0x78>
    80001cd0:	00100793          	li	a5,1
    80001cd4:	00f707b3          	add	a5,a4,a5
	size = blocks * MEM_BLOCK_SIZE;
    80001cd8:	00679793          	slli	a5,a5,0x6

	//trazenje slobodnog segmenta po first-fit algoritmu
	for (FreeMemSegment* current = freeMemHead; current; current = current->next) {
    80001cdc:	00004517          	auipc	a0,0x4
    80001ce0:	d8453503          	ld	a0,-636(a0) # 80005a60 <_ZN15MemoryAllocator11freeMemHeadE>
    80001ce4:	08050a63          	beqz	a0,80001d78 <_ZN15MemoryAllocator7kmallocEm+0x11c>
		if (current->size < size) continue;
    80001ce8:	01053703          	ld	a4,16(a0)
    80001cec:	06f76263          	bltu	a4,a5,80001d50 <_ZN15MemoryAllocator7kmallocEm+0xf4>

		//pravljenje novog slobodnog fragmenta od ostatka fragmenta
		FreeMemSegment* remainderFree = (FreeMemSegment*)((char*)current + size);
    80001cf0:	00f506b3          	add	a3,a0,a5
		remainderFree->size = current->size - size;
    80001cf4:	40f70733          	sub	a4,a4,a5
    80001cf8:	00e6b823          	sd	a4,16(a3)
		remainderFree->prev = current->prev;
    80001cfc:	00853703          	ld	a4,8(a0)
    80001d00:	00e6b423          	sd	a4,8(a3)
		if (current->prev) current->prev->next = remainderFree;
    80001d04:	00070463          	beqz	a4,80001d0c <_ZN15MemoryAllocator7kmallocEm+0xb0>
    80001d08:	00d73023          	sd	a3,0(a4)
		remainderFree->next = current->next;
    80001d0c:	00053703          	ld	a4,0(a0)
    80001d10:	00e6b023          	sd	a4,0(a3)
		if (current->next) current->next->prev = remainderFree;
    80001d14:	00070463          	beqz	a4,80001d1c <_ZN15MemoryAllocator7kmallocEm+0xc0>
    80001d18:	00d73423          	sd	a3,8(a4)
		if (freeMemHead == current) freeMemHead = remainderFree;
    80001d1c:	00004717          	auipc	a4,0x4
    80001d20:	d4473703          	ld	a4,-700(a4) # 80005a60 <_ZN15MemoryAllocator11freeMemHeadE>
    80001d24:	02a70a63          	beq	a4,a0,80001d58 <_ZN15MemoryAllocator7kmallocEm+0xfc>

		//ubacivanje novog fragmenta u listu zauzetih fragmenata
		UsedMemSegment* newFragment = (UsedMemSegment*)current;
		newFragment->size = size;
    80001d28:	00f53423          	sd	a5,8(a0)
		UsedMemSegment* prevUsed = nullptr;
		for (UsedMemSegment* cur = usedMemHead; cur && cur < newFragment; prevUsed = cur, cur = cur->next);
    80001d2c:	00004697          	auipc	a3,0x4
    80001d30:	d3c6b683          	ld	a3,-708(a3) # 80005a68 <_ZN15MemoryAllocator11usedMemHeadE>
    80001d34:	00068793          	mv	a5,a3
		UsedMemSegment* prevUsed = nullptr;
    80001d38:	00000713          	li	a4,0
		for (UsedMemSegment* cur = usedMemHead; cur && cur < newFragment; prevUsed = cur, cur = cur->next);
    80001d3c:	02078463          	beqz	a5,80001d64 <_ZN15MemoryAllocator7kmallocEm+0x108>
    80001d40:	02a7f263          	bgeu	a5,a0,80001d64 <_ZN15MemoryAllocator7kmallocEm+0x108>
    80001d44:	00078713          	mv	a4,a5
    80001d48:	0007b783          	ld	a5,0(a5)
    80001d4c:	ff1ff06f          	j	80001d3c <_ZN15MemoryAllocator7kmallocEm+0xe0>
	for (FreeMemSegment* current = freeMemHead; current; current = current->next) {
    80001d50:	00053503          	ld	a0,0(a0)
    80001d54:	f91ff06f          	j	80001ce4 <_ZN15MemoryAllocator7kmallocEm+0x88>
		if (freeMemHead == current) freeMemHead = remainderFree;
    80001d58:	00004717          	auipc	a4,0x4
    80001d5c:	d0d73423          	sd	a3,-760(a4) # 80005a60 <_ZN15MemoryAllocator11freeMemHeadE>
    80001d60:	fc9ff06f          	j	80001d28 <_ZN15MemoryAllocator7kmallocEm+0xcc>
		if (!prevUsed) {
    80001d64:	02070063          	beqz	a4,80001d84 <_ZN15MemoryAllocator7kmallocEm+0x128>
			newFragment->next = usedMemHead;
			usedMemHead = newFragment;
		} else {
			newFragment->next = prevUsed->next;
    80001d68:	00073783          	ld	a5,0(a4)
    80001d6c:	00f53023          	sd	a5,0(a0)
			prevUsed->next = newFragment;
    80001d70:	00a73023          	sd	a0,0(a4)
		}
		return (char*)newFragment + sizeof(UsedMemSegment);
    80001d74:	01050513          	addi	a0,a0,16
	}
	return nullptr;
}
    80001d78:	00813403          	ld	s0,8(sp)
    80001d7c:	01010113          	addi	sp,sp,16
    80001d80:	00008067          	ret
			newFragment->next = usedMemHead;
    80001d84:	00d53023          	sd	a3,0(a0)
			usedMemHead = newFragment;
    80001d88:	00004797          	auipc	a5,0x4
    80001d8c:	cea7b023          	sd	a0,-800(a5) # 80005a68 <_ZN15MemoryAllocator11usedMemHeadE>
    80001d90:	fe5ff06f          	j	80001d74 <_ZN15MemoryAllocator7kmallocEm+0x118>
	if (size <= 0) return nullptr;
    80001d94:	00000513          	li	a0,0
    80001d98:	fe1ff06f          	j	80001d78 <_ZN15MemoryAllocator7kmallocEm+0x11c>

0000000080001d9c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>:
	tryToJoin(newFree);
	tryToJoin(prevFree);
	return 0;
}

int MemoryAllocator::tryToJoin(MemoryAllocator::FreeMemSegment* current) {
    80001d9c:	ff010113          	addi	sp,sp,-16
    80001da0:	00813423          	sd	s0,8(sp)
    80001da4:	01010413          	addi	s0,sp,16
	if (!current) return 0;
    80001da8:	04050663          	beqz	a0,80001df4 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x58>
	if (current->next && (char*)current + current->size == (char*)(current->next)) {
    80001dac:	00053783          	ld	a5,0(a0)
    80001db0:	04078663          	beqz	a5,80001dfc <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x60>
    80001db4:	01053703          	ld	a4,16(a0)
    80001db8:	00e506b3          	add	a3,a0,a4
    80001dbc:	00d78a63          	beq	a5,a3,80001dd0 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x34>
		current->size += current->next->size;
		current->next = current->next->next;
		if (current->next) current->next->prev = current;
		return 1;
	} else return 0;
    80001dc0:	00000513          	li	a0,0
}
    80001dc4:	00813403          	ld	s0,8(sp)
    80001dc8:	01010113          	addi	sp,sp,16
    80001dcc:	00008067          	ret
		current->size += current->next->size;
    80001dd0:	0107b683          	ld	a3,16(a5)
    80001dd4:	00d70733          	add	a4,a4,a3
    80001dd8:	00e53823          	sd	a4,16(a0)
		current->next = current->next->next;
    80001ddc:	0007b783          	ld	a5,0(a5)
    80001de0:	00f53023          	sd	a5,0(a0)
		if (current->next) current->next->prev = current;
    80001de4:	00078463          	beqz	a5,80001dec <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x50>
    80001de8:	00a7b423          	sd	a0,8(a5)
		return 1;
    80001dec:	00100513          	li	a0,1
    80001df0:	fd5ff06f          	j	80001dc4 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>
	if (!current) return 0;
    80001df4:	00000513          	li	a0,0
    80001df8:	fcdff06f          	j	80001dc4 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>
	} else return 0;
    80001dfc:	00000513          	li	a0,0
    80001e00:	fc5ff06f          	j	80001dc4 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>

0000000080001e04 <_ZN15MemoryAllocator5kfreeEPv>:
	if (!ptr) return 0;
    80001e04:	10050463          	beqz	a0,80001f0c <_ZN15MemoryAllocator5kfreeEPv+0x108>
    80001e08:	00050693          	mv	a3,a0
	if (!usedMemHead) return -1;
    80001e0c:	00004797          	auipc	a5,0x4
    80001e10:	c5c7b783          	ld	a5,-932(a5) # 80005a68 <_ZN15MemoryAllocator11usedMemHeadE>
    80001e14:	10078063          	beqz	a5,80001f14 <_ZN15MemoryAllocator5kfreeEPv+0x110>
	ptr = (char*)ptr - sizeof(UsedMemSegment);
    80001e18:	ff050513          	addi	a0,a0,-16
	UsedMemSegment* prevUsed = nullptr;
    80001e1c:	00000713          	li	a4,0
	for (; currentUsed && currentUsed != ptr; prevUsed = currentUsed, currentUsed = currentUsed->next);
    80001e20:	00078a63          	beqz	a5,80001e34 <_ZN15MemoryAllocator5kfreeEPv+0x30>
    80001e24:	00a78863          	beq	a5,a0,80001e34 <_ZN15MemoryAllocator5kfreeEPv+0x30>
    80001e28:	00078713          	mv	a4,a5
    80001e2c:	0007b783          	ld	a5,0(a5)
    80001e30:	ff1ff06f          	j	80001e20 <_ZN15MemoryAllocator5kfreeEPv+0x1c>
	if (currentUsed != ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    80001e34:	0ea79463          	bne	a5,a0,80001f1c <_ZN15MemoryAllocator5kfreeEPv+0x118>
int MemoryAllocator::kfree(void* ptr) {
    80001e38:	fe010113          	addi	sp,sp,-32
    80001e3c:	00113c23          	sd	ra,24(sp)
    80001e40:	00813823          	sd	s0,16(sp)
    80001e44:	00913423          	sd	s1,8(sp)
    80001e48:	02010413          	addi	s0,sp,32
	if (prevUsed) prevUsed->next = currentUsed->next;
    80001e4c:	02070863          	beqz	a4,80001e7c <_ZN15MemoryAllocator5kfreeEPv+0x78>
    80001e50:	0007b783          	ld	a5,0(a5)
    80001e54:	00f73023          	sd	a5,0(a4)
	if (!freeMemHead || ptr < (char*)freeMemHead) {
    80001e58:	00004797          	auipc	a5,0x4
    80001e5c:	c087b783          	ld	a5,-1016(a5) # 80005a60 <_ZN15MemoryAllocator11freeMemHeadE>
    80001e60:	02078663          	beqz	a5,80001e8c <_ZN15MemoryAllocator5kfreeEPv+0x88>
    80001e64:	02f56863          	bltu	a0,a5,80001e94 <_ZN15MemoryAllocator5kfreeEPv+0x90>
			 prevFree->next != nullptr && ptr > (char*)(prevFree->next); prevFree = prevFree->next);
    80001e68:	00078493          	mv	s1,a5
    80001e6c:	0007b783          	ld	a5,0(a5)
    80001e70:	02078463          	beqz	a5,80001e98 <_ZN15MemoryAllocator5kfreeEPv+0x94>
    80001e74:	fea7eae3          	bltu	a5,a0,80001e68 <_ZN15MemoryAllocator5kfreeEPv+0x64>
    80001e78:	0200006f          	j	80001e98 <_ZN15MemoryAllocator5kfreeEPv+0x94>
	else usedMemHead = currentUsed->next;
    80001e7c:	0007b783          	ld	a5,0(a5)
    80001e80:	00004717          	auipc	a4,0x4
    80001e84:	bef73423          	sd	a5,-1048(a4) # 80005a68 <_ZN15MemoryAllocator11usedMemHeadE>
    80001e88:	fd1ff06f          	j	80001e58 <_ZN15MemoryAllocator5kfreeEPv+0x54>
		prevFree = nullptr;
    80001e8c:	00078493          	mv	s1,a5
    80001e90:	0080006f          	j	80001e98 <_ZN15MemoryAllocator5kfreeEPv+0x94>
    80001e94:	00000493          	li	s1,0
	size_t segmentSize = ((UsedMemSegment*)ptr)->size;
    80001e98:	ff86b783          	ld	a5,-8(a3)
	newFree->size = segmentSize;
    80001e9c:	00f6b023          	sd	a5,0(a3)
	newFree->prev = prevFree;
    80001ea0:	fe96bc23          	sd	s1,-8(a3)
	if (prevFree) newFree->next = prevFree->next;
    80001ea4:	04048663          	beqz	s1,80001ef0 <_ZN15MemoryAllocator5kfreeEPv+0xec>
    80001ea8:	0004b783          	ld	a5,0(s1)
    80001eac:	fef6b823          	sd	a5,-16(a3)
	if (newFree->next) newFree->next->prev = newFree;
    80001eb0:	ff06b783          	ld	a5,-16(a3)
    80001eb4:	00078463          	beqz	a5,80001ebc <_ZN15MemoryAllocator5kfreeEPv+0xb8>
    80001eb8:	00a7b423          	sd	a0,8(a5)
	if (prevFree) prevFree->next = newFree;
    80001ebc:	04048263          	beqz	s1,80001f00 <_ZN15MemoryAllocator5kfreeEPv+0xfc>
    80001ec0:	00a4b023          	sd	a0,0(s1)
	tryToJoin(newFree);
    80001ec4:	00000097          	auipc	ra,0x0
    80001ec8:	ed8080e7          	jalr	-296(ra) # 80001d9c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
	tryToJoin(prevFree);
    80001ecc:	00048513          	mv	a0,s1
    80001ed0:	00000097          	auipc	ra,0x0
    80001ed4:	ecc080e7          	jalr	-308(ra) # 80001d9c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
	return 0;
    80001ed8:	00000513          	li	a0,0
}
    80001edc:	01813083          	ld	ra,24(sp)
    80001ee0:	01013403          	ld	s0,16(sp)
    80001ee4:	00813483          	ld	s1,8(sp)
    80001ee8:	02010113          	addi	sp,sp,32
    80001eec:	00008067          	ret
	else newFree->next = freeMemHead;
    80001ef0:	00004797          	auipc	a5,0x4
    80001ef4:	b707b783          	ld	a5,-1168(a5) # 80005a60 <_ZN15MemoryAllocator11freeMemHeadE>
    80001ef8:	fef6b823          	sd	a5,-16(a3)
    80001efc:	fb5ff06f          	j	80001eb0 <_ZN15MemoryAllocator5kfreeEPv+0xac>
	else freeMemHead = newFree;
    80001f00:	00004797          	auipc	a5,0x4
    80001f04:	b6a7b023          	sd	a0,-1184(a5) # 80005a60 <_ZN15MemoryAllocator11freeMemHeadE>
    80001f08:	fbdff06f          	j	80001ec4 <_ZN15MemoryAllocator5kfreeEPv+0xc0>
	if (!ptr) return 0;
    80001f0c:	00000513          	li	a0,0
    80001f10:	00008067          	ret
	if (!usedMemHead) return -1;
    80001f14:	fff00513          	li	a0,-1
    80001f18:	00008067          	ret
	if (currentUsed != ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    80001f1c:	fff00513          	li	a0,-1
}
    80001f20:	00008067          	ret

0000000080001f24 <start>:
    80001f24:	ff010113          	addi	sp,sp,-16
    80001f28:	00813423          	sd	s0,8(sp)
    80001f2c:	01010413          	addi	s0,sp,16
    80001f30:	300027f3          	csrr	a5,mstatus
    80001f34:	ffffe737          	lui	a4,0xffffe
    80001f38:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff7b2f>
    80001f3c:	00e7f7b3          	and	a5,a5,a4
    80001f40:	00001737          	lui	a4,0x1
    80001f44:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80001f48:	00e7e7b3          	or	a5,a5,a4
    80001f4c:	30079073          	csrw	mstatus,a5
    80001f50:	00000797          	auipc	a5,0x0
    80001f54:	16078793          	addi	a5,a5,352 # 800020b0 <system_main>
    80001f58:	34179073          	csrw	mepc,a5
    80001f5c:	00000793          	li	a5,0
    80001f60:	18079073          	csrw	satp,a5
    80001f64:	000107b7          	lui	a5,0x10
    80001f68:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80001f6c:	30279073          	csrw	medeleg,a5
    80001f70:	30379073          	csrw	mideleg,a5
    80001f74:	104027f3          	csrr	a5,sie
    80001f78:	2227e793          	ori	a5,a5,546
    80001f7c:	10479073          	csrw	sie,a5
    80001f80:	fff00793          	li	a5,-1
    80001f84:	00a7d793          	srli	a5,a5,0xa
    80001f88:	3b079073          	csrw	pmpaddr0,a5
    80001f8c:	00f00793          	li	a5,15
    80001f90:	3a079073          	csrw	pmpcfg0,a5
    80001f94:	f14027f3          	csrr	a5,mhartid
    80001f98:	0200c737          	lui	a4,0x200c
    80001f9c:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80001fa0:	0007869b          	sext.w	a3,a5
    80001fa4:	00269713          	slli	a4,a3,0x2
    80001fa8:	000f4637          	lui	a2,0xf4
    80001fac:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80001fb0:	00d70733          	add	a4,a4,a3
    80001fb4:	0037979b          	slliw	a5,a5,0x3
    80001fb8:	020046b7          	lui	a3,0x2004
    80001fbc:	00d787b3          	add	a5,a5,a3
    80001fc0:	00c585b3          	add	a1,a1,a2
    80001fc4:	00371693          	slli	a3,a4,0x3
    80001fc8:	00004717          	auipc	a4,0x4
    80001fcc:	aa870713          	addi	a4,a4,-1368 # 80005a70 <timer_scratch>
    80001fd0:	00b7b023          	sd	a1,0(a5)
    80001fd4:	00d70733          	add	a4,a4,a3
    80001fd8:	00f73c23          	sd	a5,24(a4)
    80001fdc:	02c73023          	sd	a2,32(a4)
    80001fe0:	34071073          	csrw	mscratch,a4
    80001fe4:	00000797          	auipc	a5,0x0
    80001fe8:	6ec78793          	addi	a5,a5,1772 # 800026d0 <timervec>
    80001fec:	30579073          	csrw	mtvec,a5
    80001ff0:	300027f3          	csrr	a5,mstatus
    80001ff4:	0087e793          	ori	a5,a5,8
    80001ff8:	30079073          	csrw	mstatus,a5
    80001ffc:	304027f3          	csrr	a5,mie
    80002000:	0807e793          	ori	a5,a5,128
    80002004:	30479073          	csrw	mie,a5
    80002008:	f14027f3          	csrr	a5,mhartid
    8000200c:	0007879b          	sext.w	a5,a5
    80002010:	00078213          	mv	tp,a5
    80002014:	30200073          	mret
    80002018:	00813403          	ld	s0,8(sp)
    8000201c:	01010113          	addi	sp,sp,16
    80002020:	00008067          	ret

0000000080002024 <timerinit>:
    80002024:	ff010113          	addi	sp,sp,-16
    80002028:	00813423          	sd	s0,8(sp)
    8000202c:	01010413          	addi	s0,sp,16
    80002030:	f14027f3          	csrr	a5,mhartid
    80002034:	0200c737          	lui	a4,0x200c
    80002038:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    8000203c:	0007869b          	sext.w	a3,a5
    80002040:	00269713          	slli	a4,a3,0x2
    80002044:	000f4637          	lui	a2,0xf4
    80002048:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    8000204c:	00d70733          	add	a4,a4,a3
    80002050:	0037979b          	slliw	a5,a5,0x3
    80002054:	020046b7          	lui	a3,0x2004
    80002058:	00d787b3          	add	a5,a5,a3
    8000205c:	00c585b3          	add	a1,a1,a2
    80002060:	00371693          	slli	a3,a4,0x3
    80002064:	00004717          	auipc	a4,0x4
    80002068:	a0c70713          	addi	a4,a4,-1524 # 80005a70 <timer_scratch>
    8000206c:	00b7b023          	sd	a1,0(a5)
    80002070:	00d70733          	add	a4,a4,a3
    80002074:	00f73c23          	sd	a5,24(a4)
    80002078:	02c73023          	sd	a2,32(a4)
    8000207c:	34071073          	csrw	mscratch,a4
    80002080:	00000797          	auipc	a5,0x0
    80002084:	65078793          	addi	a5,a5,1616 # 800026d0 <timervec>
    80002088:	30579073          	csrw	mtvec,a5
    8000208c:	300027f3          	csrr	a5,mstatus
    80002090:	0087e793          	ori	a5,a5,8
    80002094:	30079073          	csrw	mstatus,a5
    80002098:	304027f3          	csrr	a5,mie
    8000209c:	0807e793          	ori	a5,a5,128
    800020a0:	30479073          	csrw	mie,a5
    800020a4:	00813403          	ld	s0,8(sp)
    800020a8:	01010113          	addi	sp,sp,16
    800020ac:	00008067          	ret

00000000800020b0 <system_main>:
    800020b0:	fe010113          	addi	sp,sp,-32
    800020b4:	00813823          	sd	s0,16(sp)
    800020b8:	00913423          	sd	s1,8(sp)
    800020bc:	00113c23          	sd	ra,24(sp)
    800020c0:	02010413          	addi	s0,sp,32
    800020c4:	00000097          	auipc	ra,0x0
    800020c8:	0c4080e7          	jalr	196(ra) # 80002188 <cpuid>
    800020cc:	00004497          	auipc	s1,0x4
    800020d0:	93448493          	addi	s1,s1,-1740 # 80005a00 <started>
    800020d4:	02050263          	beqz	a0,800020f8 <system_main+0x48>
    800020d8:	0004a783          	lw	a5,0(s1)
    800020dc:	0007879b          	sext.w	a5,a5
    800020e0:	fe078ce3          	beqz	a5,800020d8 <system_main+0x28>
    800020e4:	0ff0000f          	fence
    800020e8:	00003517          	auipc	a0,0x3
    800020ec:	10050513          	addi	a0,a0,256 # 800051e8 <_ZZ12printIntegermE6digits+0x1c8>
    800020f0:	00001097          	auipc	ra,0x1
    800020f4:	a7c080e7          	jalr	-1412(ra) # 80002b6c <panic>
    800020f8:	00001097          	auipc	ra,0x1
    800020fc:	9d0080e7          	jalr	-1584(ra) # 80002ac8 <consoleinit>
    80002100:	00001097          	auipc	ra,0x1
    80002104:	15c080e7          	jalr	348(ra) # 8000325c <printfinit>
    80002108:	00003517          	auipc	a0,0x3
    8000210c:	1c050513          	addi	a0,a0,448 # 800052c8 <_ZZ12printIntegermE6digits+0x2a8>
    80002110:	00001097          	auipc	ra,0x1
    80002114:	ab8080e7          	jalr	-1352(ra) # 80002bc8 <__printf>
    80002118:	00003517          	auipc	a0,0x3
    8000211c:	0a050513          	addi	a0,a0,160 # 800051b8 <_ZZ12printIntegermE6digits+0x198>
    80002120:	00001097          	auipc	ra,0x1
    80002124:	aa8080e7          	jalr	-1368(ra) # 80002bc8 <__printf>
    80002128:	00003517          	auipc	a0,0x3
    8000212c:	1a050513          	addi	a0,a0,416 # 800052c8 <_ZZ12printIntegermE6digits+0x2a8>
    80002130:	00001097          	auipc	ra,0x1
    80002134:	a98080e7          	jalr	-1384(ra) # 80002bc8 <__printf>
    80002138:	00001097          	auipc	ra,0x1
    8000213c:	4b0080e7          	jalr	1200(ra) # 800035e8 <kinit>
    80002140:	00000097          	auipc	ra,0x0
    80002144:	148080e7          	jalr	328(ra) # 80002288 <trapinit>
    80002148:	00000097          	auipc	ra,0x0
    8000214c:	16c080e7          	jalr	364(ra) # 800022b4 <trapinithart>
    80002150:	00000097          	auipc	ra,0x0
    80002154:	5c0080e7          	jalr	1472(ra) # 80002710 <plicinit>
    80002158:	00000097          	auipc	ra,0x0
    8000215c:	5e0080e7          	jalr	1504(ra) # 80002738 <plicinithart>
    80002160:	00000097          	auipc	ra,0x0
    80002164:	078080e7          	jalr	120(ra) # 800021d8 <userinit>
    80002168:	0ff0000f          	fence
    8000216c:	00100793          	li	a5,1
    80002170:	00003517          	auipc	a0,0x3
    80002174:	06050513          	addi	a0,a0,96 # 800051d0 <_ZZ12printIntegermE6digits+0x1b0>
    80002178:	00f4a023          	sw	a5,0(s1)
    8000217c:	00001097          	auipc	ra,0x1
    80002180:	a4c080e7          	jalr	-1460(ra) # 80002bc8 <__printf>
    80002184:	0000006f          	j	80002184 <system_main+0xd4>

0000000080002188 <cpuid>:
    80002188:	ff010113          	addi	sp,sp,-16
    8000218c:	00813423          	sd	s0,8(sp)
    80002190:	01010413          	addi	s0,sp,16
    80002194:	00020513          	mv	a0,tp
    80002198:	00813403          	ld	s0,8(sp)
    8000219c:	0005051b          	sext.w	a0,a0
    800021a0:	01010113          	addi	sp,sp,16
    800021a4:	00008067          	ret

00000000800021a8 <mycpu>:
    800021a8:	ff010113          	addi	sp,sp,-16
    800021ac:	00813423          	sd	s0,8(sp)
    800021b0:	01010413          	addi	s0,sp,16
    800021b4:	00020793          	mv	a5,tp
    800021b8:	00813403          	ld	s0,8(sp)
    800021bc:	0007879b          	sext.w	a5,a5
    800021c0:	00779793          	slli	a5,a5,0x7
    800021c4:	00005517          	auipc	a0,0x5
    800021c8:	8dc50513          	addi	a0,a0,-1828 # 80006aa0 <cpus>
    800021cc:	00f50533          	add	a0,a0,a5
    800021d0:	01010113          	addi	sp,sp,16
    800021d4:	00008067          	ret

00000000800021d8 <userinit>:
    800021d8:	ff010113          	addi	sp,sp,-16
    800021dc:	00813423          	sd	s0,8(sp)
    800021e0:	01010413          	addi	s0,sp,16
    800021e4:	00813403          	ld	s0,8(sp)
    800021e8:	01010113          	addi	sp,sp,16
    800021ec:	fffff317          	auipc	t1,0xfffff
    800021f0:	51030067          	jr	1296(t1) # 800016fc <main>

00000000800021f4 <either_copyout>:
    800021f4:	ff010113          	addi	sp,sp,-16
    800021f8:	00813023          	sd	s0,0(sp)
    800021fc:	00113423          	sd	ra,8(sp)
    80002200:	01010413          	addi	s0,sp,16
    80002204:	02051663          	bnez	a0,80002230 <either_copyout+0x3c>
    80002208:	00058513          	mv	a0,a1
    8000220c:	00060593          	mv	a1,a2
    80002210:	0006861b          	sext.w	a2,a3
    80002214:	00002097          	auipc	ra,0x2
    80002218:	c60080e7          	jalr	-928(ra) # 80003e74 <__memmove>
    8000221c:	00813083          	ld	ra,8(sp)
    80002220:	00013403          	ld	s0,0(sp)
    80002224:	00000513          	li	a0,0
    80002228:	01010113          	addi	sp,sp,16
    8000222c:	00008067          	ret
    80002230:	00003517          	auipc	a0,0x3
    80002234:	fe050513          	addi	a0,a0,-32 # 80005210 <_ZZ12printIntegermE6digits+0x1f0>
    80002238:	00001097          	auipc	ra,0x1
    8000223c:	934080e7          	jalr	-1740(ra) # 80002b6c <panic>

0000000080002240 <either_copyin>:
    80002240:	ff010113          	addi	sp,sp,-16
    80002244:	00813023          	sd	s0,0(sp)
    80002248:	00113423          	sd	ra,8(sp)
    8000224c:	01010413          	addi	s0,sp,16
    80002250:	02059463          	bnez	a1,80002278 <either_copyin+0x38>
    80002254:	00060593          	mv	a1,a2
    80002258:	0006861b          	sext.w	a2,a3
    8000225c:	00002097          	auipc	ra,0x2
    80002260:	c18080e7          	jalr	-1000(ra) # 80003e74 <__memmove>
    80002264:	00813083          	ld	ra,8(sp)
    80002268:	00013403          	ld	s0,0(sp)
    8000226c:	00000513          	li	a0,0
    80002270:	01010113          	addi	sp,sp,16
    80002274:	00008067          	ret
    80002278:	00003517          	auipc	a0,0x3
    8000227c:	fc050513          	addi	a0,a0,-64 # 80005238 <_ZZ12printIntegermE6digits+0x218>
    80002280:	00001097          	auipc	ra,0x1
    80002284:	8ec080e7          	jalr	-1812(ra) # 80002b6c <panic>

0000000080002288 <trapinit>:
    80002288:	ff010113          	addi	sp,sp,-16
    8000228c:	00813423          	sd	s0,8(sp)
    80002290:	01010413          	addi	s0,sp,16
    80002294:	00813403          	ld	s0,8(sp)
    80002298:	00003597          	auipc	a1,0x3
    8000229c:	fc858593          	addi	a1,a1,-56 # 80005260 <_ZZ12printIntegermE6digits+0x240>
    800022a0:	00005517          	auipc	a0,0x5
    800022a4:	88050513          	addi	a0,a0,-1920 # 80006b20 <tickslock>
    800022a8:	01010113          	addi	sp,sp,16
    800022ac:	00001317          	auipc	t1,0x1
    800022b0:	5cc30067          	jr	1484(t1) # 80003878 <initlock>

00000000800022b4 <trapinithart>:
    800022b4:	ff010113          	addi	sp,sp,-16
    800022b8:	00813423          	sd	s0,8(sp)
    800022bc:	01010413          	addi	s0,sp,16
    800022c0:	00000797          	auipc	a5,0x0
    800022c4:	30078793          	addi	a5,a5,768 # 800025c0 <kernelvec>
    800022c8:	10579073          	csrw	stvec,a5
    800022cc:	00813403          	ld	s0,8(sp)
    800022d0:	01010113          	addi	sp,sp,16
    800022d4:	00008067          	ret

00000000800022d8 <usertrap>:
    800022d8:	ff010113          	addi	sp,sp,-16
    800022dc:	00813423          	sd	s0,8(sp)
    800022e0:	01010413          	addi	s0,sp,16
    800022e4:	00813403          	ld	s0,8(sp)
    800022e8:	01010113          	addi	sp,sp,16
    800022ec:	00008067          	ret

00000000800022f0 <usertrapret>:
    800022f0:	ff010113          	addi	sp,sp,-16
    800022f4:	00813423          	sd	s0,8(sp)
    800022f8:	01010413          	addi	s0,sp,16
    800022fc:	00813403          	ld	s0,8(sp)
    80002300:	01010113          	addi	sp,sp,16
    80002304:	00008067          	ret

0000000080002308 <kerneltrap>:
    80002308:	fe010113          	addi	sp,sp,-32
    8000230c:	00813823          	sd	s0,16(sp)
    80002310:	00113c23          	sd	ra,24(sp)
    80002314:	00913423          	sd	s1,8(sp)
    80002318:	02010413          	addi	s0,sp,32
    8000231c:	142025f3          	csrr	a1,scause
    80002320:	100027f3          	csrr	a5,sstatus
    80002324:	0027f793          	andi	a5,a5,2
    80002328:	10079c63          	bnez	a5,80002440 <kerneltrap+0x138>
    8000232c:	142027f3          	csrr	a5,scause
    80002330:	0207ce63          	bltz	a5,8000236c <kerneltrap+0x64>
    80002334:	00003517          	auipc	a0,0x3
    80002338:	f7450513          	addi	a0,a0,-140 # 800052a8 <_ZZ12printIntegermE6digits+0x288>
    8000233c:	00001097          	auipc	ra,0x1
    80002340:	88c080e7          	jalr	-1908(ra) # 80002bc8 <__printf>
    80002344:	141025f3          	csrr	a1,sepc
    80002348:	14302673          	csrr	a2,stval
    8000234c:	00003517          	auipc	a0,0x3
    80002350:	f6c50513          	addi	a0,a0,-148 # 800052b8 <_ZZ12printIntegermE6digits+0x298>
    80002354:	00001097          	auipc	ra,0x1
    80002358:	874080e7          	jalr	-1932(ra) # 80002bc8 <__printf>
    8000235c:	00003517          	auipc	a0,0x3
    80002360:	f7450513          	addi	a0,a0,-140 # 800052d0 <_ZZ12printIntegermE6digits+0x2b0>
    80002364:	00001097          	auipc	ra,0x1
    80002368:	808080e7          	jalr	-2040(ra) # 80002b6c <panic>
    8000236c:	0ff7f713          	andi	a4,a5,255
    80002370:	00900693          	li	a3,9
    80002374:	04d70063          	beq	a4,a3,800023b4 <kerneltrap+0xac>
    80002378:	fff00713          	li	a4,-1
    8000237c:	03f71713          	slli	a4,a4,0x3f
    80002380:	00170713          	addi	a4,a4,1
    80002384:	fae798e3          	bne	a5,a4,80002334 <kerneltrap+0x2c>
    80002388:	00000097          	auipc	ra,0x0
    8000238c:	e00080e7          	jalr	-512(ra) # 80002188 <cpuid>
    80002390:	06050663          	beqz	a0,800023fc <kerneltrap+0xf4>
    80002394:	144027f3          	csrr	a5,sip
    80002398:	ffd7f793          	andi	a5,a5,-3
    8000239c:	14479073          	csrw	sip,a5
    800023a0:	01813083          	ld	ra,24(sp)
    800023a4:	01013403          	ld	s0,16(sp)
    800023a8:	00813483          	ld	s1,8(sp)
    800023ac:	02010113          	addi	sp,sp,32
    800023b0:	00008067          	ret
    800023b4:	00000097          	auipc	ra,0x0
    800023b8:	3d0080e7          	jalr	976(ra) # 80002784 <plic_claim>
    800023bc:	00a00793          	li	a5,10
    800023c0:	00050493          	mv	s1,a0
    800023c4:	06f50863          	beq	a0,a5,80002434 <kerneltrap+0x12c>
    800023c8:	fc050ce3          	beqz	a0,800023a0 <kerneltrap+0x98>
    800023cc:	00050593          	mv	a1,a0
    800023d0:	00003517          	auipc	a0,0x3
    800023d4:	eb850513          	addi	a0,a0,-328 # 80005288 <_ZZ12printIntegermE6digits+0x268>
    800023d8:	00000097          	auipc	ra,0x0
    800023dc:	7f0080e7          	jalr	2032(ra) # 80002bc8 <__printf>
    800023e0:	01013403          	ld	s0,16(sp)
    800023e4:	01813083          	ld	ra,24(sp)
    800023e8:	00048513          	mv	a0,s1
    800023ec:	00813483          	ld	s1,8(sp)
    800023f0:	02010113          	addi	sp,sp,32
    800023f4:	00000317          	auipc	t1,0x0
    800023f8:	3c830067          	jr	968(t1) # 800027bc <plic_complete>
    800023fc:	00004517          	auipc	a0,0x4
    80002400:	72450513          	addi	a0,a0,1828 # 80006b20 <tickslock>
    80002404:	00001097          	auipc	ra,0x1
    80002408:	498080e7          	jalr	1176(ra) # 8000389c <acquire>
    8000240c:	00003717          	auipc	a4,0x3
    80002410:	5f870713          	addi	a4,a4,1528 # 80005a04 <ticks>
    80002414:	00072783          	lw	a5,0(a4)
    80002418:	00004517          	auipc	a0,0x4
    8000241c:	70850513          	addi	a0,a0,1800 # 80006b20 <tickslock>
    80002420:	0017879b          	addiw	a5,a5,1
    80002424:	00f72023          	sw	a5,0(a4)
    80002428:	00001097          	auipc	ra,0x1
    8000242c:	540080e7          	jalr	1344(ra) # 80003968 <release>
    80002430:	f65ff06f          	j	80002394 <kerneltrap+0x8c>
    80002434:	00001097          	auipc	ra,0x1
    80002438:	09c080e7          	jalr	156(ra) # 800034d0 <uartintr>
    8000243c:	fa5ff06f          	j	800023e0 <kerneltrap+0xd8>
    80002440:	00003517          	auipc	a0,0x3
    80002444:	e2850513          	addi	a0,a0,-472 # 80005268 <_ZZ12printIntegermE6digits+0x248>
    80002448:	00000097          	auipc	ra,0x0
    8000244c:	724080e7          	jalr	1828(ra) # 80002b6c <panic>

0000000080002450 <clockintr>:
    80002450:	fe010113          	addi	sp,sp,-32
    80002454:	00813823          	sd	s0,16(sp)
    80002458:	00913423          	sd	s1,8(sp)
    8000245c:	00113c23          	sd	ra,24(sp)
    80002460:	02010413          	addi	s0,sp,32
    80002464:	00004497          	auipc	s1,0x4
    80002468:	6bc48493          	addi	s1,s1,1724 # 80006b20 <tickslock>
    8000246c:	00048513          	mv	a0,s1
    80002470:	00001097          	auipc	ra,0x1
    80002474:	42c080e7          	jalr	1068(ra) # 8000389c <acquire>
    80002478:	00003717          	auipc	a4,0x3
    8000247c:	58c70713          	addi	a4,a4,1420 # 80005a04 <ticks>
    80002480:	00072783          	lw	a5,0(a4)
    80002484:	01013403          	ld	s0,16(sp)
    80002488:	01813083          	ld	ra,24(sp)
    8000248c:	00048513          	mv	a0,s1
    80002490:	0017879b          	addiw	a5,a5,1
    80002494:	00813483          	ld	s1,8(sp)
    80002498:	00f72023          	sw	a5,0(a4)
    8000249c:	02010113          	addi	sp,sp,32
    800024a0:	00001317          	auipc	t1,0x1
    800024a4:	4c830067          	jr	1224(t1) # 80003968 <release>

00000000800024a8 <devintr>:
    800024a8:	142027f3          	csrr	a5,scause
    800024ac:	00000513          	li	a0,0
    800024b0:	0007c463          	bltz	a5,800024b8 <devintr+0x10>
    800024b4:	00008067          	ret
    800024b8:	fe010113          	addi	sp,sp,-32
    800024bc:	00813823          	sd	s0,16(sp)
    800024c0:	00113c23          	sd	ra,24(sp)
    800024c4:	00913423          	sd	s1,8(sp)
    800024c8:	02010413          	addi	s0,sp,32
    800024cc:	0ff7f713          	andi	a4,a5,255
    800024d0:	00900693          	li	a3,9
    800024d4:	04d70c63          	beq	a4,a3,8000252c <devintr+0x84>
    800024d8:	fff00713          	li	a4,-1
    800024dc:	03f71713          	slli	a4,a4,0x3f
    800024e0:	00170713          	addi	a4,a4,1
    800024e4:	00e78c63          	beq	a5,a4,800024fc <devintr+0x54>
    800024e8:	01813083          	ld	ra,24(sp)
    800024ec:	01013403          	ld	s0,16(sp)
    800024f0:	00813483          	ld	s1,8(sp)
    800024f4:	02010113          	addi	sp,sp,32
    800024f8:	00008067          	ret
    800024fc:	00000097          	auipc	ra,0x0
    80002500:	c8c080e7          	jalr	-884(ra) # 80002188 <cpuid>
    80002504:	06050663          	beqz	a0,80002570 <devintr+0xc8>
    80002508:	144027f3          	csrr	a5,sip
    8000250c:	ffd7f793          	andi	a5,a5,-3
    80002510:	14479073          	csrw	sip,a5
    80002514:	01813083          	ld	ra,24(sp)
    80002518:	01013403          	ld	s0,16(sp)
    8000251c:	00813483          	ld	s1,8(sp)
    80002520:	00200513          	li	a0,2
    80002524:	02010113          	addi	sp,sp,32
    80002528:	00008067          	ret
    8000252c:	00000097          	auipc	ra,0x0
    80002530:	258080e7          	jalr	600(ra) # 80002784 <plic_claim>
    80002534:	00a00793          	li	a5,10
    80002538:	00050493          	mv	s1,a0
    8000253c:	06f50663          	beq	a0,a5,800025a8 <devintr+0x100>
    80002540:	00100513          	li	a0,1
    80002544:	fa0482e3          	beqz	s1,800024e8 <devintr+0x40>
    80002548:	00048593          	mv	a1,s1
    8000254c:	00003517          	auipc	a0,0x3
    80002550:	d3c50513          	addi	a0,a0,-708 # 80005288 <_ZZ12printIntegermE6digits+0x268>
    80002554:	00000097          	auipc	ra,0x0
    80002558:	674080e7          	jalr	1652(ra) # 80002bc8 <__printf>
    8000255c:	00048513          	mv	a0,s1
    80002560:	00000097          	auipc	ra,0x0
    80002564:	25c080e7          	jalr	604(ra) # 800027bc <plic_complete>
    80002568:	00100513          	li	a0,1
    8000256c:	f7dff06f          	j	800024e8 <devintr+0x40>
    80002570:	00004517          	auipc	a0,0x4
    80002574:	5b050513          	addi	a0,a0,1456 # 80006b20 <tickslock>
    80002578:	00001097          	auipc	ra,0x1
    8000257c:	324080e7          	jalr	804(ra) # 8000389c <acquire>
    80002580:	00003717          	auipc	a4,0x3
    80002584:	48470713          	addi	a4,a4,1156 # 80005a04 <ticks>
    80002588:	00072783          	lw	a5,0(a4)
    8000258c:	00004517          	auipc	a0,0x4
    80002590:	59450513          	addi	a0,a0,1428 # 80006b20 <tickslock>
    80002594:	0017879b          	addiw	a5,a5,1
    80002598:	00f72023          	sw	a5,0(a4)
    8000259c:	00001097          	auipc	ra,0x1
    800025a0:	3cc080e7          	jalr	972(ra) # 80003968 <release>
    800025a4:	f65ff06f          	j	80002508 <devintr+0x60>
    800025a8:	00001097          	auipc	ra,0x1
    800025ac:	f28080e7          	jalr	-216(ra) # 800034d0 <uartintr>
    800025b0:	fadff06f          	j	8000255c <devintr+0xb4>
	...

00000000800025c0 <kernelvec>:
    800025c0:	f0010113          	addi	sp,sp,-256
    800025c4:	00113023          	sd	ra,0(sp)
    800025c8:	00213423          	sd	sp,8(sp)
    800025cc:	00313823          	sd	gp,16(sp)
    800025d0:	00413c23          	sd	tp,24(sp)
    800025d4:	02513023          	sd	t0,32(sp)
    800025d8:	02613423          	sd	t1,40(sp)
    800025dc:	02713823          	sd	t2,48(sp)
    800025e0:	02813c23          	sd	s0,56(sp)
    800025e4:	04913023          	sd	s1,64(sp)
    800025e8:	04a13423          	sd	a0,72(sp)
    800025ec:	04b13823          	sd	a1,80(sp)
    800025f0:	04c13c23          	sd	a2,88(sp)
    800025f4:	06d13023          	sd	a3,96(sp)
    800025f8:	06e13423          	sd	a4,104(sp)
    800025fc:	06f13823          	sd	a5,112(sp)
    80002600:	07013c23          	sd	a6,120(sp)
    80002604:	09113023          	sd	a7,128(sp)
    80002608:	09213423          	sd	s2,136(sp)
    8000260c:	09313823          	sd	s3,144(sp)
    80002610:	09413c23          	sd	s4,152(sp)
    80002614:	0b513023          	sd	s5,160(sp)
    80002618:	0b613423          	sd	s6,168(sp)
    8000261c:	0b713823          	sd	s7,176(sp)
    80002620:	0b813c23          	sd	s8,184(sp)
    80002624:	0d913023          	sd	s9,192(sp)
    80002628:	0da13423          	sd	s10,200(sp)
    8000262c:	0db13823          	sd	s11,208(sp)
    80002630:	0dc13c23          	sd	t3,216(sp)
    80002634:	0fd13023          	sd	t4,224(sp)
    80002638:	0fe13423          	sd	t5,232(sp)
    8000263c:	0ff13823          	sd	t6,240(sp)
    80002640:	cc9ff0ef          	jal	ra,80002308 <kerneltrap>
    80002644:	00013083          	ld	ra,0(sp)
    80002648:	00813103          	ld	sp,8(sp)
    8000264c:	01013183          	ld	gp,16(sp)
    80002650:	02013283          	ld	t0,32(sp)
    80002654:	02813303          	ld	t1,40(sp)
    80002658:	03013383          	ld	t2,48(sp)
    8000265c:	03813403          	ld	s0,56(sp)
    80002660:	04013483          	ld	s1,64(sp)
    80002664:	04813503          	ld	a0,72(sp)
    80002668:	05013583          	ld	a1,80(sp)
    8000266c:	05813603          	ld	a2,88(sp)
    80002670:	06013683          	ld	a3,96(sp)
    80002674:	06813703          	ld	a4,104(sp)
    80002678:	07013783          	ld	a5,112(sp)
    8000267c:	07813803          	ld	a6,120(sp)
    80002680:	08013883          	ld	a7,128(sp)
    80002684:	08813903          	ld	s2,136(sp)
    80002688:	09013983          	ld	s3,144(sp)
    8000268c:	09813a03          	ld	s4,152(sp)
    80002690:	0a013a83          	ld	s5,160(sp)
    80002694:	0a813b03          	ld	s6,168(sp)
    80002698:	0b013b83          	ld	s7,176(sp)
    8000269c:	0b813c03          	ld	s8,184(sp)
    800026a0:	0c013c83          	ld	s9,192(sp)
    800026a4:	0c813d03          	ld	s10,200(sp)
    800026a8:	0d013d83          	ld	s11,208(sp)
    800026ac:	0d813e03          	ld	t3,216(sp)
    800026b0:	0e013e83          	ld	t4,224(sp)
    800026b4:	0e813f03          	ld	t5,232(sp)
    800026b8:	0f013f83          	ld	t6,240(sp)
    800026bc:	10010113          	addi	sp,sp,256
    800026c0:	10200073          	sret
    800026c4:	00000013          	nop
    800026c8:	00000013          	nop
    800026cc:	00000013          	nop

00000000800026d0 <timervec>:
    800026d0:	34051573          	csrrw	a0,mscratch,a0
    800026d4:	00b53023          	sd	a1,0(a0)
    800026d8:	00c53423          	sd	a2,8(a0)
    800026dc:	00d53823          	sd	a3,16(a0)
    800026e0:	01853583          	ld	a1,24(a0)
    800026e4:	02053603          	ld	a2,32(a0)
    800026e8:	0005b683          	ld	a3,0(a1)
    800026ec:	00c686b3          	add	a3,a3,a2
    800026f0:	00d5b023          	sd	a3,0(a1)
    800026f4:	00200593          	li	a1,2
    800026f8:	14459073          	csrw	sip,a1
    800026fc:	01053683          	ld	a3,16(a0)
    80002700:	00853603          	ld	a2,8(a0)
    80002704:	00053583          	ld	a1,0(a0)
    80002708:	34051573          	csrrw	a0,mscratch,a0
    8000270c:	30200073          	mret

0000000080002710 <plicinit>:
    80002710:	ff010113          	addi	sp,sp,-16
    80002714:	00813423          	sd	s0,8(sp)
    80002718:	01010413          	addi	s0,sp,16
    8000271c:	00813403          	ld	s0,8(sp)
    80002720:	0c0007b7          	lui	a5,0xc000
    80002724:	00100713          	li	a4,1
    80002728:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000272c:	00e7a223          	sw	a4,4(a5)
    80002730:	01010113          	addi	sp,sp,16
    80002734:	00008067          	ret

0000000080002738 <plicinithart>:
    80002738:	ff010113          	addi	sp,sp,-16
    8000273c:	00813023          	sd	s0,0(sp)
    80002740:	00113423          	sd	ra,8(sp)
    80002744:	01010413          	addi	s0,sp,16
    80002748:	00000097          	auipc	ra,0x0
    8000274c:	a40080e7          	jalr	-1472(ra) # 80002188 <cpuid>
    80002750:	0085171b          	slliw	a4,a0,0x8
    80002754:	0c0027b7          	lui	a5,0xc002
    80002758:	00e787b3          	add	a5,a5,a4
    8000275c:	40200713          	li	a4,1026
    80002760:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80002764:	00813083          	ld	ra,8(sp)
    80002768:	00013403          	ld	s0,0(sp)
    8000276c:	00d5151b          	slliw	a0,a0,0xd
    80002770:	0c2017b7          	lui	a5,0xc201
    80002774:	00a78533          	add	a0,a5,a0
    80002778:	00052023          	sw	zero,0(a0)
    8000277c:	01010113          	addi	sp,sp,16
    80002780:	00008067          	ret

0000000080002784 <plic_claim>:
    80002784:	ff010113          	addi	sp,sp,-16
    80002788:	00813023          	sd	s0,0(sp)
    8000278c:	00113423          	sd	ra,8(sp)
    80002790:	01010413          	addi	s0,sp,16
    80002794:	00000097          	auipc	ra,0x0
    80002798:	9f4080e7          	jalr	-1548(ra) # 80002188 <cpuid>
    8000279c:	00813083          	ld	ra,8(sp)
    800027a0:	00013403          	ld	s0,0(sp)
    800027a4:	00d5151b          	slliw	a0,a0,0xd
    800027a8:	0c2017b7          	lui	a5,0xc201
    800027ac:	00a78533          	add	a0,a5,a0
    800027b0:	00452503          	lw	a0,4(a0)
    800027b4:	01010113          	addi	sp,sp,16
    800027b8:	00008067          	ret

00000000800027bc <plic_complete>:
    800027bc:	fe010113          	addi	sp,sp,-32
    800027c0:	00813823          	sd	s0,16(sp)
    800027c4:	00913423          	sd	s1,8(sp)
    800027c8:	00113c23          	sd	ra,24(sp)
    800027cc:	02010413          	addi	s0,sp,32
    800027d0:	00050493          	mv	s1,a0
    800027d4:	00000097          	auipc	ra,0x0
    800027d8:	9b4080e7          	jalr	-1612(ra) # 80002188 <cpuid>
    800027dc:	01813083          	ld	ra,24(sp)
    800027e0:	01013403          	ld	s0,16(sp)
    800027e4:	00d5179b          	slliw	a5,a0,0xd
    800027e8:	0c201737          	lui	a4,0xc201
    800027ec:	00f707b3          	add	a5,a4,a5
    800027f0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    800027f4:	00813483          	ld	s1,8(sp)
    800027f8:	02010113          	addi	sp,sp,32
    800027fc:	00008067          	ret

0000000080002800 <consolewrite>:
    80002800:	fb010113          	addi	sp,sp,-80
    80002804:	04813023          	sd	s0,64(sp)
    80002808:	04113423          	sd	ra,72(sp)
    8000280c:	02913c23          	sd	s1,56(sp)
    80002810:	03213823          	sd	s2,48(sp)
    80002814:	03313423          	sd	s3,40(sp)
    80002818:	03413023          	sd	s4,32(sp)
    8000281c:	01513c23          	sd	s5,24(sp)
    80002820:	05010413          	addi	s0,sp,80
    80002824:	06c05c63          	blez	a2,8000289c <consolewrite+0x9c>
    80002828:	00060993          	mv	s3,a2
    8000282c:	00050a13          	mv	s4,a0
    80002830:	00058493          	mv	s1,a1
    80002834:	00000913          	li	s2,0
    80002838:	fff00a93          	li	s5,-1
    8000283c:	01c0006f          	j	80002858 <consolewrite+0x58>
    80002840:	fbf44503          	lbu	a0,-65(s0)
    80002844:	0019091b          	addiw	s2,s2,1
    80002848:	00148493          	addi	s1,s1,1
    8000284c:	00001097          	auipc	ra,0x1
    80002850:	a9c080e7          	jalr	-1380(ra) # 800032e8 <uartputc>
    80002854:	03298063          	beq	s3,s2,80002874 <consolewrite+0x74>
    80002858:	00048613          	mv	a2,s1
    8000285c:	00100693          	li	a3,1
    80002860:	000a0593          	mv	a1,s4
    80002864:	fbf40513          	addi	a0,s0,-65
    80002868:	00000097          	auipc	ra,0x0
    8000286c:	9d8080e7          	jalr	-1576(ra) # 80002240 <either_copyin>
    80002870:	fd5518e3          	bne	a0,s5,80002840 <consolewrite+0x40>
    80002874:	04813083          	ld	ra,72(sp)
    80002878:	04013403          	ld	s0,64(sp)
    8000287c:	03813483          	ld	s1,56(sp)
    80002880:	02813983          	ld	s3,40(sp)
    80002884:	02013a03          	ld	s4,32(sp)
    80002888:	01813a83          	ld	s5,24(sp)
    8000288c:	00090513          	mv	a0,s2
    80002890:	03013903          	ld	s2,48(sp)
    80002894:	05010113          	addi	sp,sp,80
    80002898:	00008067          	ret
    8000289c:	00000913          	li	s2,0
    800028a0:	fd5ff06f          	j	80002874 <consolewrite+0x74>

00000000800028a4 <consoleread>:
    800028a4:	f9010113          	addi	sp,sp,-112
    800028a8:	06813023          	sd	s0,96(sp)
    800028ac:	04913c23          	sd	s1,88(sp)
    800028b0:	05213823          	sd	s2,80(sp)
    800028b4:	05313423          	sd	s3,72(sp)
    800028b8:	05413023          	sd	s4,64(sp)
    800028bc:	03513c23          	sd	s5,56(sp)
    800028c0:	03613823          	sd	s6,48(sp)
    800028c4:	03713423          	sd	s7,40(sp)
    800028c8:	03813023          	sd	s8,32(sp)
    800028cc:	06113423          	sd	ra,104(sp)
    800028d0:	01913c23          	sd	s9,24(sp)
    800028d4:	07010413          	addi	s0,sp,112
    800028d8:	00060b93          	mv	s7,a2
    800028dc:	00050913          	mv	s2,a0
    800028e0:	00058c13          	mv	s8,a1
    800028e4:	00060b1b          	sext.w	s6,a2
    800028e8:	00004497          	auipc	s1,0x4
    800028ec:	26048493          	addi	s1,s1,608 # 80006b48 <cons>
    800028f0:	00400993          	li	s3,4
    800028f4:	fff00a13          	li	s4,-1
    800028f8:	00a00a93          	li	s5,10
    800028fc:	05705e63          	blez	s7,80002958 <consoleread+0xb4>
    80002900:	09c4a703          	lw	a4,156(s1)
    80002904:	0984a783          	lw	a5,152(s1)
    80002908:	0007071b          	sext.w	a4,a4
    8000290c:	08e78463          	beq	a5,a4,80002994 <consoleread+0xf0>
    80002910:	07f7f713          	andi	a4,a5,127
    80002914:	00e48733          	add	a4,s1,a4
    80002918:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000291c:	0017869b          	addiw	a3,a5,1
    80002920:	08d4ac23          	sw	a3,152(s1)
    80002924:	00070c9b          	sext.w	s9,a4
    80002928:	0b370663          	beq	a4,s3,800029d4 <consoleread+0x130>
    8000292c:	00100693          	li	a3,1
    80002930:	f9f40613          	addi	a2,s0,-97
    80002934:	000c0593          	mv	a1,s8
    80002938:	00090513          	mv	a0,s2
    8000293c:	f8e40fa3          	sb	a4,-97(s0)
    80002940:	00000097          	auipc	ra,0x0
    80002944:	8b4080e7          	jalr	-1868(ra) # 800021f4 <either_copyout>
    80002948:	01450863          	beq	a0,s4,80002958 <consoleread+0xb4>
    8000294c:	001c0c13          	addi	s8,s8,1
    80002950:	fffb8b9b          	addiw	s7,s7,-1
    80002954:	fb5c94e3          	bne	s9,s5,800028fc <consoleread+0x58>
    80002958:	000b851b          	sext.w	a0,s7
    8000295c:	06813083          	ld	ra,104(sp)
    80002960:	06013403          	ld	s0,96(sp)
    80002964:	05813483          	ld	s1,88(sp)
    80002968:	05013903          	ld	s2,80(sp)
    8000296c:	04813983          	ld	s3,72(sp)
    80002970:	04013a03          	ld	s4,64(sp)
    80002974:	03813a83          	ld	s5,56(sp)
    80002978:	02813b83          	ld	s7,40(sp)
    8000297c:	02013c03          	ld	s8,32(sp)
    80002980:	01813c83          	ld	s9,24(sp)
    80002984:	40ab053b          	subw	a0,s6,a0
    80002988:	03013b03          	ld	s6,48(sp)
    8000298c:	07010113          	addi	sp,sp,112
    80002990:	00008067          	ret
    80002994:	00001097          	auipc	ra,0x1
    80002998:	1d8080e7          	jalr	472(ra) # 80003b6c <push_on>
    8000299c:	0984a703          	lw	a4,152(s1)
    800029a0:	09c4a783          	lw	a5,156(s1)
    800029a4:	0007879b          	sext.w	a5,a5
    800029a8:	fef70ce3          	beq	a4,a5,800029a0 <consoleread+0xfc>
    800029ac:	00001097          	auipc	ra,0x1
    800029b0:	234080e7          	jalr	564(ra) # 80003be0 <pop_on>
    800029b4:	0984a783          	lw	a5,152(s1)
    800029b8:	07f7f713          	andi	a4,a5,127
    800029bc:	00e48733          	add	a4,s1,a4
    800029c0:	01874703          	lbu	a4,24(a4)
    800029c4:	0017869b          	addiw	a3,a5,1
    800029c8:	08d4ac23          	sw	a3,152(s1)
    800029cc:	00070c9b          	sext.w	s9,a4
    800029d0:	f5371ee3          	bne	a4,s3,8000292c <consoleread+0x88>
    800029d4:	000b851b          	sext.w	a0,s7
    800029d8:	f96bf2e3          	bgeu	s7,s6,8000295c <consoleread+0xb8>
    800029dc:	08f4ac23          	sw	a5,152(s1)
    800029e0:	f7dff06f          	j	8000295c <consoleread+0xb8>

00000000800029e4 <consputc>:
    800029e4:	10000793          	li	a5,256
    800029e8:	00f50663          	beq	a0,a5,800029f4 <consputc+0x10>
    800029ec:	00001317          	auipc	t1,0x1
    800029f0:	9f430067          	jr	-1548(t1) # 800033e0 <uartputc_sync>
    800029f4:	ff010113          	addi	sp,sp,-16
    800029f8:	00113423          	sd	ra,8(sp)
    800029fc:	00813023          	sd	s0,0(sp)
    80002a00:	01010413          	addi	s0,sp,16
    80002a04:	00800513          	li	a0,8
    80002a08:	00001097          	auipc	ra,0x1
    80002a0c:	9d8080e7          	jalr	-1576(ra) # 800033e0 <uartputc_sync>
    80002a10:	02000513          	li	a0,32
    80002a14:	00001097          	auipc	ra,0x1
    80002a18:	9cc080e7          	jalr	-1588(ra) # 800033e0 <uartputc_sync>
    80002a1c:	00013403          	ld	s0,0(sp)
    80002a20:	00813083          	ld	ra,8(sp)
    80002a24:	00800513          	li	a0,8
    80002a28:	01010113          	addi	sp,sp,16
    80002a2c:	00001317          	auipc	t1,0x1
    80002a30:	9b430067          	jr	-1612(t1) # 800033e0 <uartputc_sync>

0000000080002a34 <consoleintr>:
    80002a34:	fe010113          	addi	sp,sp,-32
    80002a38:	00813823          	sd	s0,16(sp)
    80002a3c:	00913423          	sd	s1,8(sp)
    80002a40:	01213023          	sd	s2,0(sp)
    80002a44:	00113c23          	sd	ra,24(sp)
    80002a48:	02010413          	addi	s0,sp,32
    80002a4c:	00004917          	auipc	s2,0x4
    80002a50:	0fc90913          	addi	s2,s2,252 # 80006b48 <cons>
    80002a54:	00050493          	mv	s1,a0
    80002a58:	00090513          	mv	a0,s2
    80002a5c:	00001097          	auipc	ra,0x1
    80002a60:	e40080e7          	jalr	-448(ra) # 8000389c <acquire>
    80002a64:	02048c63          	beqz	s1,80002a9c <consoleintr+0x68>
    80002a68:	0a092783          	lw	a5,160(s2)
    80002a6c:	09892703          	lw	a4,152(s2)
    80002a70:	07f00693          	li	a3,127
    80002a74:	40e7873b          	subw	a4,a5,a4
    80002a78:	02e6e263          	bltu	a3,a4,80002a9c <consoleintr+0x68>
    80002a7c:	00d00713          	li	a4,13
    80002a80:	04e48063          	beq	s1,a4,80002ac0 <consoleintr+0x8c>
    80002a84:	07f7f713          	andi	a4,a5,127
    80002a88:	00e90733          	add	a4,s2,a4
    80002a8c:	0017879b          	addiw	a5,a5,1
    80002a90:	0af92023          	sw	a5,160(s2)
    80002a94:	00970c23          	sb	s1,24(a4)
    80002a98:	08f92e23          	sw	a5,156(s2)
    80002a9c:	01013403          	ld	s0,16(sp)
    80002aa0:	01813083          	ld	ra,24(sp)
    80002aa4:	00813483          	ld	s1,8(sp)
    80002aa8:	00013903          	ld	s2,0(sp)
    80002aac:	00004517          	auipc	a0,0x4
    80002ab0:	09c50513          	addi	a0,a0,156 # 80006b48 <cons>
    80002ab4:	02010113          	addi	sp,sp,32
    80002ab8:	00001317          	auipc	t1,0x1
    80002abc:	eb030067          	jr	-336(t1) # 80003968 <release>
    80002ac0:	00a00493          	li	s1,10
    80002ac4:	fc1ff06f          	j	80002a84 <consoleintr+0x50>

0000000080002ac8 <consoleinit>:
    80002ac8:	fe010113          	addi	sp,sp,-32
    80002acc:	00113c23          	sd	ra,24(sp)
    80002ad0:	00813823          	sd	s0,16(sp)
    80002ad4:	00913423          	sd	s1,8(sp)
    80002ad8:	02010413          	addi	s0,sp,32
    80002adc:	00004497          	auipc	s1,0x4
    80002ae0:	06c48493          	addi	s1,s1,108 # 80006b48 <cons>
    80002ae4:	00048513          	mv	a0,s1
    80002ae8:	00002597          	auipc	a1,0x2
    80002aec:	7f858593          	addi	a1,a1,2040 # 800052e0 <_ZZ12printIntegermE6digits+0x2c0>
    80002af0:	00001097          	auipc	ra,0x1
    80002af4:	d88080e7          	jalr	-632(ra) # 80003878 <initlock>
    80002af8:	00000097          	auipc	ra,0x0
    80002afc:	7ac080e7          	jalr	1964(ra) # 800032a4 <uartinit>
    80002b00:	01813083          	ld	ra,24(sp)
    80002b04:	01013403          	ld	s0,16(sp)
    80002b08:	00000797          	auipc	a5,0x0
    80002b0c:	d9c78793          	addi	a5,a5,-612 # 800028a4 <consoleread>
    80002b10:	0af4bc23          	sd	a5,184(s1)
    80002b14:	00000797          	auipc	a5,0x0
    80002b18:	cec78793          	addi	a5,a5,-788 # 80002800 <consolewrite>
    80002b1c:	0cf4b023          	sd	a5,192(s1)
    80002b20:	00813483          	ld	s1,8(sp)
    80002b24:	02010113          	addi	sp,sp,32
    80002b28:	00008067          	ret

0000000080002b2c <console_read>:
    80002b2c:	ff010113          	addi	sp,sp,-16
    80002b30:	00813423          	sd	s0,8(sp)
    80002b34:	01010413          	addi	s0,sp,16
    80002b38:	00813403          	ld	s0,8(sp)
    80002b3c:	00004317          	auipc	t1,0x4
    80002b40:	0c433303          	ld	t1,196(t1) # 80006c00 <devsw+0x10>
    80002b44:	01010113          	addi	sp,sp,16
    80002b48:	00030067          	jr	t1

0000000080002b4c <console_write>:
    80002b4c:	ff010113          	addi	sp,sp,-16
    80002b50:	00813423          	sd	s0,8(sp)
    80002b54:	01010413          	addi	s0,sp,16
    80002b58:	00813403          	ld	s0,8(sp)
    80002b5c:	00004317          	auipc	t1,0x4
    80002b60:	0ac33303          	ld	t1,172(t1) # 80006c08 <devsw+0x18>
    80002b64:	01010113          	addi	sp,sp,16
    80002b68:	00030067          	jr	t1

0000000080002b6c <panic>:
    80002b6c:	fe010113          	addi	sp,sp,-32
    80002b70:	00113c23          	sd	ra,24(sp)
    80002b74:	00813823          	sd	s0,16(sp)
    80002b78:	00913423          	sd	s1,8(sp)
    80002b7c:	02010413          	addi	s0,sp,32
    80002b80:	00050493          	mv	s1,a0
    80002b84:	00002517          	auipc	a0,0x2
    80002b88:	76450513          	addi	a0,a0,1892 # 800052e8 <_ZZ12printIntegermE6digits+0x2c8>
    80002b8c:	00004797          	auipc	a5,0x4
    80002b90:	1007ae23          	sw	zero,284(a5) # 80006ca8 <pr+0x18>
    80002b94:	00000097          	auipc	ra,0x0
    80002b98:	034080e7          	jalr	52(ra) # 80002bc8 <__printf>
    80002b9c:	00048513          	mv	a0,s1
    80002ba0:	00000097          	auipc	ra,0x0
    80002ba4:	028080e7          	jalr	40(ra) # 80002bc8 <__printf>
    80002ba8:	00002517          	auipc	a0,0x2
    80002bac:	72050513          	addi	a0,a0,1824 # 800052c8 <_ZZ12printIntegermE6digits+0x2a8>
    80002bb0:	00000097          	auipc	ra,0x0
    80002bb4:	018080e7          	jalr	24(ra) # 80002bc8 <__printf>
    80002bb8:	00100793          	li	a5,1
    80002bbc:	00003717          	auipc	a4,0x3
    80002bc0:	e4f72623          	sw	a5,-436(a4) # 80005a08 <panicked>
    80002bc4:	0000006f          	j	80002bc4 <panic+0x58>

0000000080002bc8 <__printf>:
    80002bc8:	f3010113          	addi	sp,sp,-208
    80002bcc:	08813023          	sd	s0,128(sp)
    80002bd0:	07313423          	sd	s3,104(sp)
    80002bd4:	09010413          	addi	s0,sp,144
    80002bd8:	05813023          	sd	s8,64(sp)
    80002bdc:	08113423          	sd	ra,136(sp)
    80002be0:	06913c23          	sd	s1,120(sp)
    80002be4:	07213823          	sd	s2,112(sp)
    80002be8:	07413023          	sd	s4,96(sp)
    80002bec:	05513c23          	sd	s5,88(sp)
    80002bf0:	05613823          	sd	s6,80(sp)
    80002bf4:	05713423          	sd	s7,72(sp)
    80002bf8:	03913c23          	sd	s9,56(sp)
    80002bfc:	03a13823          	sd	s10,48(sp)
    80002c00:	03b13423          	sd	s11,40(sp)
    80002c04:	00004317          	auipc	t1,0x4
    80002c08:	08c30313          	addi	t1,t1,140 # 80006c90 <pr>
    80002c0c:	01832c03          	lw	s8,24(t1)
    80002c10:	00b43423          	sd	a1,8(s0)
    80002c14:	00c43823          	sd	a2,16(s0)
    80002c18:	00d43c23          	sd	a3,24(s0)
    80002c1c:	02e43023          	sd	a4,32(s0)
    80002c20:	02f43423          	sd	a5,40(s0)
    80002c24:	03043823          	sd	a6,48(s0)
    80002c28:	03143c23          	sd	a7,56(s0)
    80002c2c:	00050993          	mv	s3,a0
    80002c30:	4a0c1663          	bnez	s8,800030dc <__printf+0x514>
    80002c34:	60098c63          	beqz	s3,8000324c <__printf+0x684>
    80002c38:	0009c503          	lbu	a0,0(s3)
    80002c3c:	00840793          	addi	a5,s0,8
    80002c40:	f6f43c23          	sd	a5,-136(s0)
    80002c44:	00000493          	li	s1,0
    80002c48:	22050063          	beqz	a0,80002e68 <__printf+0x2a0>
    80002c4c:	00002a37          	lui	s4,0x2
    80002c50:	00018ab7          	lui	s5,0x18
    80002c54:	000f4b37          	lui	s6,0xf4
    80002c58:	00989bb7          	lui	s7,0x989
    80002c5c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80002c60:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80002c64:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80002c68:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80002c6c:	00148c9b          	addiw	s9,s1,1
    80002c70:	02500793          	li	a5,37
    80002c74:	01998933          	add	s2,s3,s9
    80002c78:	38f51263          	bne	a0,a5,80002ffc <__printf+0x434>
    80002c7c:	00094783          	lbu	a5,0(s2)
    80002c80:	00078c9b          	sext.w	s9,a5
    80002c84:	1e078263          	beqz	a5,80002e68 <__printf+0x2a0>
    80002c88:	0024849b          	addiw	s1,s1,2
    80002c8c:	07000713          	li	a4,112
    80002c90:	00998933          	add	s2,s3,s1
    80002c94:	38e78a63          	beq	a5,a4,80003028 <__printf+0x460>
    80002c98:	20f76863          	bltu	a4,a5,80002ea8 <__printf+0x2e0>
    80002c9c:	42a78863          	beq	a5,a0,800030cc <__printf+0x504>
    80002ca0:	06400713          	li	a4,100
    80002ca4:	40e79663          	bne	a5,a4,800030b0 <__printf+0x4e8>
    80002ca8:	f7843783          	ld	a5,-136(s0)
    80002cac:	0007a603          	lw	a2,0(a5)
    80002cb0:	00878793          	addi	a5,a5,8
    80002cb4:	f6f43c23          	sd	a5,-136(s0)
    80002cb8:	42064a63          	bltz	a2,800030ec <__printf+0x524>
    80002cbc:	00a00713          	li	a4,10
    80002cc0:	02e677bb          	remuw	a5,a2,a4
    80002cc4:	00002d97          	auipc	s11,0x2
    80002cc8:	64cd8d93          	addi	s11,s11,1612 # 80005310 <digits>
    80002ccc:	00900593          	li	a1,9
    80002cd0:	0006051b          	sext.w	a0,a2
    80002cd4:	00000c93          	li	s9,0
    80002cd8:	02079793          	slli	a5,a5,0x20
    80002cdc:	0207d793          	srli	a5,a5,0x20
    80002ce0:	00fd87b3          	add	a5,s11,a5
    80002ce4:	0007c783          	lbu	a5,0(a5)
    80002ce8:	02e656bb          	divuw	a3,a2,a4
    80002cec:	f8f40023          	sb	a5,-128(s0)
    80002cf0:	14c5d863          	bge	a1,a2,80002e40 <__printf+0x278>
    80002cf4:	06300593          	li	a1,99
    80002cf8:	00100c93          	li	s9,1
    80002cfc:	02e6f7bb          	remuw	a5,a3,a4
    80002d00:	02079793          	slli	a5,a5,0x20
    80002d04:	0207d793          	srli	a5,a5,0x20
    80002d08:	00fd87b3          	add	a5,s11,a5
    80002d0c:	0007c783          	lbu	a5,0(a5)
    80002d10:	02e6d73b          	divuw	a4,a3,a4
    80002d14:	f8f400a3          	sb	a5,-127(s0)
    80002d18:	12a5f463          	bgeu	a1,a0,80002e40 <__printf+0x278>
    80002d1c:	00a00693          	li	a3,10
    80002d20:	00900593          	li	a1,9
    80002d24:	02d777bb          	remuw	a5,a4,a3
    80002d28:	02079793          	slli	a5,a5,0x20
    80002d2c:	0207d793          	srli	a5,a5,0x20
    80002d30:	00fd87b3          	add	a5,s11,a5
    80002d34:	0007c503          	lbu	a0,0(a5)
    80002d38:	02d757bb          	divuw	a5,a4,a3
    80002d3c:	f8a40123          	sb	a0,-126(s0)
    80002d40:	48e5f263          	bgeu	a1,a4,800031c4 <__printf+0x5fc>
    80002d44:	06300513          	li	a0,99
    80002d48:	02d7f5bb          	remuw	a1,a5,a3
    80002d4c:	02059593          	slli	a1,a1,0x20
    80002d50:	0205d593          	srli	a1,a1,0x20
    80002d54:	00bd85b3          	add	a1,s11,a1
    80002d58:	0005c583          	lbu	a1,0(a1)
    80002d5c:	02d7d7bb          	divuw	a5,a5,a3
    80002d60:	f8b401a3          	sb	a1,-125(s0)
    80002d64:	48e57263          	bgeu	a0,a4,800031e8 <__printf+0x620>
    80002d68:	3e700513          	li	a0,999
    80002d6c:	02d7f5bb          	remuw	a1,a5,a3
    80002d70:	02059593          	slli	a1,a1,0x20
    80002d74:	0205d593          	srli	a1,a1,0x20
    80002d78:	00bd85b3          	add	a1,s11,a1
    80002d7c:	0005c583          	lbu	a1,0(a1)
    80002d80:	02d7d7bb          	divuw	a5,a5,a3
    80002d84:	f8b40223          	sb	a1,-124(s0)
    80002d88:	46e57663          	bgeu	a0,a4,800031f4 <__printf+0x62c>
    80002d8c:	02d7f5bb          	remuw	a1,a5,a3
    80002d90:	02059593          	slli	a1,a1,0x20
    80002d94:	0205d593          	srli	a1,a1,0x20
    80002d98:	00bd85b3          	add	a1,s11,a1
    80002d9c:	0005c583          	lbu	a1,0(a1)
    80002da0:	02d7d7bb          	divuw	a5,a5,a3
    80002da4:	f8b402a3          	sb	a1,-123(s0)
    80002da8:	46ea7863          	bgeu	s4,a4,80003218 <__printf+0x650>
    80002dac:	02d7f5bb          	remuw	a1,a5,a3
    80002db0:	02059593          	slli	a1,a1,0x20
    80002db4:	0205d593          	srli	a1,a1,0x20
    80002db8:	00bd85b3          	add	a1,s11,a1
    80002dbc:	0005c583          	lbu	a1,0(a1)
    80002dc0:	02d7d7bb          	divuw	a5,a5,a3
    80002dc4:	f8b40323          	sb	a1,-122(s0)
    80002dc8:	3eeaf863          	bgeu	s5,a4,800031b8 <__printf+0x5f0>
    80002dcc:	02d7f5bb          	remuw	a1,a5,a3
    80002dd0:	02059593          	slli	a1,a1,0x20
    80002dd4:	0205d593          	srli	a1,a1,0x20
    80002dd8:	00bd85b3          	add	a1,s11,a1
    80002ddc:	0005c583          	lbu	a1,0(a1)
    80002de0:	02d7d7bb          	divuw	a5,a5,a3
    80002de4:	f8b403a3          	sb	a1,-121(s0)
    80002de8:	42eb7e63          	bgeu	s6,a4,80003224 <__printf+0x65c>
    80002dec:	02d7f5bb          	remuw	a1,a5,a3
    80002df0:	02059593          	slli	a1,a1,0x20
    80002df4:	0205d593          	srli	a1,a1,0x20
    80002df8:	00bd85b3          	add	a1,s11,a1
    80002dfc:	0005c583          	lbu	a1,0(a1)
    80002e00:	02d7d7bb          	divuw	a5,a5,a3
    80002e04:	f8b40423          	sb	a1,-120(s0)
    80002e08:	42ebfc63          	bgeu	s7,a4,80003240 <__printf+0x678>
    80002e0c:	02079793          	slli	a5,a5,0x20
    80002e10:	0207d793          	srli	a5,a5,0x20
    80002e14:	00fd8db3          	add	s11,s11,a5
    80002e18:	000dc703          	lbu	a4,0(s11)
    80002e1c:	00a00793          	li	a5,10
    80002e20:	00900c93          	li	s9,9
    80002e24:	f8e404a3          	sb	a4,-119(s0)
    80002e28:	00065c63          	bgez	a2,80002e40 <__printf+0x278>
    80002e2c:	f9040713          	addi	a4,s0,-112
    80002e30:	00f70733          	add	a4,a4,a5
    80002e34:	02d00693          	li	a3,45
    80002e38:	fed70823          	sb	a3,-16(a4)
    80002e3c:	00078c93          	mv	s9,a5
    80002e40:	f8040793          	addi	a5,s0,-128
    80002e44:	01978cb3          	add	s9,a5,s9
    80002e48:	f7f40d13          	addi	s10,s0,-129
    80002e4c:	000cc503          	lbu	a0,0(s9)
    80002e50:	fffc8c93          	addi	s9,s9,-1
    80002e54:	00000097          	auipc	ra,0x0
    80002e58:	b90080e7          	jalr	-1136(ra) # 800029e4 <consputc>
    80002e5c:	ffac98e3          	bne	s9,s10,80002e4c <__printf+0x284>
    80002e60:	00094503          	lbu	a0,0(s2)
    80002e64:	e00514e3          	bnez	a0,80002c6c <__printf+0xa4>
    80002e68:	1a0c1663          	bnez	s8,80003014 <__printf+0x44c>
    80002e6c:	08813083          	ld	ra,136(sp)
    80002e70:	08013403          	ld	s0,128(sp)
    80002e74:	07813483          	ld	s1,120(sp)
    80002e78:	07013903          	ld	s2,112(sp)
    80002e7c:	06813983          	ld	s3,104(sp)
    80002e80:	06013a03          	ld	s4,96(sp)
    80002e84:	05813a83          	ld	s5,88(sp)
    80002e88:	05013b03          	ld	s6,80(sp)
    80002e8c:	04813b83          	ld	s7,72(sp)
    80002e90:	04013c03          	ld	s8,64(sp)
    80002e94:	03813c83          	ld	s9,56(sp)
    80002e98:	03013d03          	ld	s10,48(sp)
    80002e9c:	02813d83          	ld	s11,40(sp)
    80002ea0:	0d010113          	addi	sp,sp,208
    80002ea4:	00008067          	ret
    80002ea8:	07300713          	li	a4,115
    80002eac:	1ce78a63          	beq	a5,a4,80003080 <__printf+0x4b8>
    80002eb0:	07800713          	li	a4,120
    80002eb4:	1ee79e63          	bne	a5,a4,800030b0 <__printf+0x4e8>
    80002eb8:	f7843783          	ld	a5,-136(s0)
    80002ebc:	0007a703          	lw	a4,0(a5)
    80002ec0:	00878793          	addi	a5,a5,8
    80002ec4:	f6f43c23          	sd	a5,-136(s0)
    80002ec8:	28074263          	bltz	a4,8000314c <__printf+0x584>
    80002ecc:	00002d97          	auipc	s11,0x2
    80002ed0:	444d8d93          	addi	s11,s11,1092 # 80005310 <digits>
    80002ed4:	00f77793          	andi	a5,a4,15
    80002ed8:	00fd87b3          	add	a5,s11,a5
    80002edc:	0007c683          	lbu	a3,0(a5)
    80002ee0:	00f00613          	li	a2,15
    80002ee4:	0007079b          	sext.w	a5,a4
    80002ee8:	f8d40023          	sb	a3,-128(s0)
    80002eec:	0047559b          	srliw	a1,a4,0x4
    80002ef0:	0047569b          	srliw	a3,a4,0x4
    80002ef4:	00000c93          	li	s9,0
    80002ef8:	0ee65063          	bge	a2,a4,80002fd8 <__printf+0x410>
    80002efc:	00f6f693          	andi	a3,a3,15
    80002f00:	00dd86b3          	add	a3,s11,a3
    80002f04:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80002f08:	0087d79b          	srliw	a5,a5,0x8
    80002f0c:	00100c93          	li	s9,1
    80002f10:	f8d400a3          	sb	a3,-127(s0)
    80002f14:	0cb67263          	bgeu	a2,a1,80002fd8 <__printf+0x410>
    80002f18:	00f7f693          	andi	a3,a5,15
    80002f1c:	00dd86b3          	add	a3,s11,a3
    80002f20:	0006c583          	lbu	a1,0(a3)
    80002f24:	00f00613          	li	a2,15
    80002f28:	0047d69b          	srliw	a3,a5,0x4
    80002f2c:	f8b40123          	sb	a1,-126(s0)
    80002f30:	0047d593          	srli	a1,a5,0x4
    80002f34:	28f67e63          	bgeu	a2,a5,800031d0 <__printf+0x608>
    80002f38:	00f6f693          	andi	a3,a3,15
    80002f3c:	00dd86b3          	add	a3,s11,a3
    80002f40:	0006c503          	lbu	a0,0(a3)
    80002f44:	0087d813          	srli	a6,a5,0x8
    80002f48:	0087d69b          	srliw	a3,a5,0x8
    80002f4c:	f8a401a3          	sb	a0,-125(s0)
    80002f50:	28b67663          	bgeu	a2,a1,800031dc <__printf+0x614>
    80002f54:	00f6f693          	andi	a3,a3,15
    80002f58:	00dd86b3          	add	a3,s11,a3
    80002f5c:	0006c583          	lbu	a1,0(a3)
    80002f60:	00c7d513          	srli	a0,a5,0xc
    80002f64:	00c7d69b          	srliw	a3,a5,0xc
    80002f68:	f8b40223          	sb	a1,-124(s0)
    80002f6c:	29067a63          	bgeu	a2,a6,80003200 <__printf+0x638>
    80002f70:	00f6f693          	andi	a3,a3,15
    80002f74:	00dd86b3          	add	a3,s11,a3
    80002f78:	0006c583          	lbu	a1,0(a3)
    80002f7c:	0107d813          	srli	a6,a5,0x10
    80002f80:	0107d69b          	srliw	a3,a5,0x10
    80002f84:	f8b402a3          	sb	a1,-123(s0)
    80002f88:	28a67263          	bgeu	a2,a0,8000320c <__printf+0x644>
    80002f8c:	00f6f693          	andi	a3,a3,15
    80002f90:	00dd86b3          	add	a3,s11,a3
    80002f94:	0006c683          	lbu	a3,0(a3)
    80002f98:	0147d79b          	srliw	a5,a5,0x14
    80002f9c:	f8d40323          	sb	a3,-122(s0)
    80002fa0:	21067663          	bgeu	a2,a6,800031ac <__printf+0x5e4>
    80002fa4:	02079793          	slli	a5,a5,0x20
    80002fa8:	0207d793          	srli	a5,a5,0x20
    80002fac:	00fd8db3          	add	s11,s11,a5
    80002fb0:	000dc683          	lbu	a3,0(s11)
    80002fb4:	00800793          	li	a5,8
    80002fb8:	00700c93          	li	s9,7
    80002fbc:	f8d403a3          	sb	a3,-121(s0)
    80002fc0:	00075c63          	bgez	a4,80002fd8 <__printf+0x410>
    80002fc4:	f9040713          	addi	a4,s0,-112
    80002fc8:	00f70733          	add	a4,a4,a5
    80002fcc:	02d00693          	li	a3,45
    80002fd0:	fed70823          	sb	a3,-16(a4)
    80002fd4:	00078c93          	mv	s9,a5
    80002fd8:	f8040793          	addi	a5,s0,-128
    80002fdc:	01978cb3          	add	s9,a5,s9
    80002fe0:	f7f40d13          	addi	s10,s0,-129
    80002fe4:	000cc503          	lbu	a0,0(s9)
    80002fe8:	fffc8c93          	addi	s9,s9,-1
    80002fec:	00000097          	auipc	ra,0x0
    80002ff0:	9f8080e7          	jalr	-1544(ra) # 800029e4 <consputc>
    80002ff4:	ff9d18e3          	bne	s10,s9,80002fe4 <__printf+0x41c>
    80002ff8:	0100006f          	j	80003008 <__printf+0x440>
    80002ffc:	00000097          	auipc	ra,0x0
    80003000:	9e8080e7          	jalr	-1560(ra) # 800029e4 <consputc>
    80003004:	000c8493          	mv	s1,s9
    80003008:	00094503          	lbu	a0,0(s2)
    8000300c:	c60510e3          	bnez	a0,80002c6c <__printf+0xa4>
    80003010:	e40c0ee3          	beqz	s8,80002e6c <__printf+0x2a4>
    80003014:	00004517          	auipc	a0,0x4
    80003018:	c7c50513          	addi	a0,a0,-900 # 80006c90 <pr>
    8000301c:	00001097          	auipc	ra,0x1
    80003020:	94c080e7          	jalr	-1716(ra) # 80003968 <release>
    80003024:	e49ff06f          	j	80002e6c <__printf+0x2a4>
    80003028:	f7843783          	ld	a5,-136(s0)
    8000302c:	03000513          	li	a0,48
    80003030:	01000d13          	li	s10,16
    80003034:	00878713          	addi	a4,a5,8
    80003038:	0007bc83          	ld	s9,0(a5)
    8000303c:	f6e43c23          	sd	a4,-136(s0)
    80003040:	00000097          	auipc	ra,0x0
    80003044:	9a4080e7          	jalr	-1628(ra) # 800029e4 <consputc>
    80003048:	07800513          	li	a0,120
    8000304c:	00000097          	auipc	ra,0x0
    80003050:	998080e7          	jalr	-1640(ra) # 800029e4 <consputc>
    80003054:	00002d97          	auipc	s11,0x2
    80003058:	2bcd8d93          	addi	s11,s11,700 # 80005310 <digits>
    8000305c:	03ccd793          	srli	a5,s9,0x3c
    80003060:	00fd87b3          	add	a5,s11,a5
    80003064:	0007c503          	lbu	a0,0(a5)
    80003068:	fffd0d1b          	addiw	s10,s10,-1
    8000306c:	004c9c93          	slli	s9,s9,0x4
    80003070:	00000097          	auipc	ra,0x0
    80003074:	974080e7          	jalr	-1676(ra) # 800029e4 <consputc>
    80003078:	fe0d12e3          	bnez	s10,8000305c <__printf+0x494>
    8000307c:	f8dff06f          	j	80003008 <__printf+0x440>
    80003080:	f7843783          	ld	a5,-136(s0)
    80003084:	0007bc83          	ld	s9,0(a5)
    80003088:	00878793          	addi	a5,a5,8
    8000308c:	f6f43c23          	sd	a5,-136(s0)
    80003090:	000c9a63          	bnez	s9,800030a4 <__printf+0x4dc>
    80003094:	1080006f          	j	8000319c <__printf+0x5d4>
    80003098:	001c8c93          	addi	s9,s9,1
    8000309c:	00000097          	auipc	ra,0x0
    800030a0:	948080e7          	jalr	-1720(ra) # 800029e4 <consputc>
    800030a4:	000cc503          	lbu	a0,0(s9)
    800030a8:	fe0518e3          	bnez	a0,80003098 <__printf+0x4d0>
    800030ac:	f5dff06f          	j	80003008 <__printf+0x440>
    800030b0:	02500513          	li	a0,37
    800030b4:	00000097          	auipc	ra,0x0
    800030b8:	930080e7          	jalr	-1744(ra) # 800029e4 <consputc>
    800030bc:	000c8513          	mv	a0,s9
    800030c0:	00000097          	auipc	ra,0x0
    800030c4:	924080e7          	jalr	-1756(ra) # 800029e4 <consputc>
    800030c8:	f41ff06f          	j	80003008 <__printf+0x440>
    800030cc:	02500513          	li	a0,37
    800030d0:	00000097          	auipc	ra,0x0
    800030d4:	914080e7          	jalr	-1772(ra) # 800029e4 <consputc>
    800030d8:	f31ff06f          	j	80003008 <__printf+0x440>
    800030dc:	00030513          	mv	a0,t1
    800030e0:	00000097          	auipc	ra,0x0
    800030e4:	7bc080e7          	jalr	1980(ra) # 8000389c <acquire>
    800030e8:	b4dff06f          	j	80002c34 <__printf+0x6c>
    800030ec:	40c0053b          	negw	a0,a2
    800030f0:	00a00713          	li	a4,10
    800030f4:	02e576bb          	remuw	a3,a0,a4
    800030f8:	00002d97          	auipc	s11,0x2
    800030fc:	218d8d93          	addi	s11,s11,536 # 80005310 <digits>
    80003100:	ff700593          	li	a1,-9
    80003104:	02069693          	slli	a3,a3,0x20
    80003108:	0206d693          	srli	a3,a3,0x20
    8000310c:	00dd86b3          	add	a3,s11,a3
    80003110:	0006c683          	lbu	a3,0(a3)
    80003114:	02e557bb          	divuw	a5,a0,a4
    80003118:	f8d40023          	sb	a3,-128(s0)
    8000311c:	10b65e63          	bge	a2,a1,80003238 <__printf+0x670>
    80003120:	06300593          	li	a1,99
    80003124:	02e7f6bb          	remuw	a3,a5,a4
    80003128:	02069693          	slli	a3,a3,0x20
    8000312c:	0206d693          	srli	a3,a3,0x20
    80003130:	00dd86b3          	add	a3,s11,a3
    80003134:	0006c683          	lbu	a3,0(a3)
    80003138:	02e7d73b          	divuw	a4,a5,a4
    8000313c:	00200793          	li	a5,2
    80003140:	f8d400a3          	sb	a3,-127(s0)
    80003144:	bca5ece3          	bltu	a1,a0,80002d1c <__printf+0x154>
    80003148:	ce5ff06f          	j	80002e2c <__printf+0x264>
    8000314c:	40e007bb          	negw	a5,a4
    80003150:	00002d97          	auipc	s11,0x2
    80003154:	1c0d8d93          	addi	s11,s11,448 # 80005310 <digits>
    80003158:	00f7f693          	andi	a3,a5,15
    8000315c:	00dd86b3          	add	a3,s11,a3
    80003160:	0006c583          	lbu	a1,0(a3)
    80003164:	ff100613          	li	a2,-15
    80003168:	0047d69b          	srliw	a3,a5,0x4
    8000316c:	f8b40023          	sb	a1,-128(s0)
    80003170:	0047d59b          	srliw	a1,a5,0x4
    80003174:	0ac75e63          	bge	a4,a2,80003230 <__printf+0x668>
    80003178:	00f6f693          	andi	a3,a3,15
    8000317c:	00dd86b3          	add	a3,s11,a3
    80003180:	0006c603          	lbu	a2,0(a3)
    80003184:	00f00693          	li	a3,15
    80003188:	0087d79b          	srliw	a5,a5,0x8
    8000318c:	f8c400a3          	sb	a2,-127(s0)
    80003190:	d8b6e4e3          	bltu	a3,a1,80002f18 <__printf+0x350>
    80003194:	00200793          	li	a5,2
    80003198:	e2dff06f          	j	80002fc4 <__printf+0x3fc>
    8000319c:	00002c97          	auipc	s9,0x2
    800031a0:	154c8c93          	addi	s9,s9,340 # 800052f0 <_ZZ12printIntegermE6digits+0x2d0>
    800031a4:	02800513          	li	a0,40
    800031a8:	ef1ff06f          	j	80003098 <__printf+0x4d0>
    800031ac:	00700793          	li	a5,7
    800031b0:	00600c93          	li	s9,6
    800031b4:	e0dff06f          	j	80002fc0 <__printf+0x3f8>
    800031b8:	00700793          	li	a5,7
    800031bc:	00600c93          	li	s9,6
    800031c0:	c69ff06f          	j	80002e28 <__printf+0x260>
    800031c4:	00300793          	li	a5,3
    800031c8:	00200c93          	li	s9,2
    800031cc:	c5dff06f          	j	80002e28 <__printf+0x260>
    800031d0:	00300793          	li	a5,3
    800031d4:	00200c93          	li	s9,2
    800031d8:	de9ff06f          	j	80002fc0 <__printf+0x3f8>
    800031dc:	00400793          	li	a5,4
    800031e0:	00300c93          	li	s9,3
    800031e4:	dddff06f          	j	80002fc0 <__printf+0x3f8>
    800031e8:	00400793          	li	a5,4
    800031ec:	00300c93          	li	s9,3
    800031f0:	c39ff06f          	j	80002e28 <__printf+0x260>
    800031f4:	00500793          	li	a5,5
    800031f8:	00400c93          	li	s9,4
    800031fc:	c2dff06f          	j	80002e28 <__printf+0x260>
    80003200:	00500793          	li	a5,5
    80003204:	00400c93          	li	s9,4
    80003208:	db9ff06f          	j	80002fc0 <__printf+0x3f8>
    8000320c:	00600793          	li	a5,6
    80003210:	00500c93          	li	s9,5
    80003214:	dadff06f          	j	80002fc0 <__printf+0x3f8>
    80003218:	00600793          	li	a5,6
    8000321c:	00500c93          	li	s9,5
    80003220:	c09ff06f          	j	80002e28 <__printf+0x260>
    80003224:	00800793          	li	a5,8
    80003228:	00700c93          	li	s9,7
    8000322c:	bfdff06f          	j	80002e28 <__printf+0x260>
    80003230:	00100793          	li	a5,1
    80003234:	d91ff06f          	j	80002fc4 <__printf+0x3fc>
    80003238:	00100793          	li	a5,1
    8000323c:	bf1ff06f          	j	80002e2c <__printf+0x264>
    80003240:	00900793          	li	a5,9
    80003244:	00800c93          	li	s9,8
    80003248:	be1ff06f          	j	80002e28 <__printf+0x260>
    8000324c:	00002517          	auipc	a0,0x2
    80003250:	0ac50513          	addi	a0,a0,172 # 800052f8 <_ZZ12printIntegermE6digits+0x2d8>
    80003254:	00000097          	auipc	ra,0x0
    80003258:	918080e7          	jalr	-1768(ra) # 80002b6c <panic>

000000008000325c <printfinit>:
    8000325c:	fe010113          	addi	sp,sp,-32
    80003260:	00813823          	sd	s0,16(sp)
    80003264:	00913423          	sd	s1,8(sp)
    80003268:	00113c23          	sd	ra,24(sp)
    8000326c:	02010413          	addi	s0,sp,32
    80003270:	00004497          	auipc	s1,0x4
    80003274:	a2048493          	addi	s1,s1,-1504 # 80006c90 <pr>
    80003278:	00048513          	mv	a0,s1
    8000327c:	00002597          	auipc	a1,0x2
    80003280:	08c58593          	addi	a1,a1,140 # 80005308 <_ZZ12printIntegermE6digits+0x2e8>
    80003284:	00000097          	auipc	ra,0x0
    80003288:	5f4080e7          	jalr	1524(ra) # 80003878 <initlock>
    8000328c:	01813083          	ld	ra,24(sp)
    80003290:	01013403          	ld	s0,16(sp)
    80003294:	0004ac23          	sw	zero,24(s1)
    80003298:	00813483          	ld	s1,8(sp)
    8000329c:	02010113          	addi	sp,sp,32
    800032a0:	00008067          	ret

00000000800032a4 <uartinit>:
    800032a4:	ff010113          	addi	sp,sp,-16
    800032a8:	00813423          	sd	s0,8(sp)
    800032ac:	01010413          	addi	s0,sp,16
    800032b0:	100007b7          	lui	a5,0x10000
    800032b4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    800032b8:	f8000713          	li	a4,-128
    800032bc:	00e781a3          	sb	a4,3(a5)
    800032c0:	00300713          	li	a4,3
    800032c4:	00e78023          	sb	a4,0(a5)
    800032c8:	000780a3          	sb	zero,1(a5)
    800032cc:	00e781a3          	sb	a4,3(a5)
    800032d0:	00700693          	li	a3,7
    800032d4:	00d78123          	sb	a3,2(a5)
    800032d8:	00e780a3          	sb	a4,1(a5)
    800032dc:	00813403          	ld	s0,8(sp)
    800032e0:	01010113          	addi	sp,sp,16
    800032e4:	00008067          	ret

00000000800032e8 <uartputc>:
    800032e8:	00002797          	auipc	a5,0x2
    800032ec:	7207a783          	lw	a5,1824(a5) # 80005a08 <panicked>
    800032f0:	00078463          	beqz	a5,800032f8 <uartputc+0x10>
    800032f4:	0000006f          	j	800032f4 <uartputc+0xc>
    800032f8:	fd010113          	addi	sp,sp,-48
    800032fc:	02813023          	sd	s0,32(sp)
    80003300:	00913c23          	sd	s1,24(sp)
    80003304:	01213823          	sd	s2,16(sp)
    80003308:	01313423          	sd	s3,8(sp)
    8000330c:	02113423          	sd	ra,40(sp)
    80003310:	03010413          	addi	s0,sp,48
    80003314:	00002917          	auipc	s2,0x2
    80003318:	6fc90913          	addi	s2,s2,1788 # 80005a10 <uart_tx_r>
    8000331c:	00093783          	ld	a5,0(s2)
    80003320:	00002497          	auipc	s1,0x2
    80003324:	6f848493          	addi	s1,s1,1784 # 80005a18 <uart_tx_w>
    80003328:	0004b703          	ld	a4,0(s1)
    8000332c:	02078693          	addi	a3,a5,32
    80003330:	00050993          	mv	s3,a0
    80003334:	02e69c63          	bne	a3,a4,8000336c <uartputc+0x84>
    80003338:	00001097          	auipc	ra,0x1
    8000333c:	834080e7          	jalr	-1996(ra) # 80003b6c <push_on>
    80003340:	00093783          	ld	a5,0(s2)
    80003344:	0004b703          	ld	a4,0(s1)
    80003348:	02078793          	addi	a5,a5,32
    8000334c:	00e79463          	bne	a5,a4,80003354 <uartputc+0x6c>
    80003350:	0000006f          	j	80003350 <uartputc+0x68>
    80003354:	00001097          	auipc	ra,0x1
    80003358:	88c080e7          	jalr	-1908(ra) # 80003be0 <pop_on>
    8000335c:	00093783          	ld	a5,0(s2)
    80003360:	0004b703          	ld	a4,0(s1)
    80003364:	02078693          	addi	a3,a5,32
    80003368:	fce688e3          	beq	a3,a4,80003338 <uartputc+0x50>
    8000336c:	01f77693          	andi	a3,a4,31
    80003370:	00004597          	auipc	a1,0x4
    80003374:	94058593          	addi	a1,a1,-1728 # 80006cb0 <uart_tx_buf>
    80003378:	00d586b3          	add	a3,a1,a3
    8000337c:	00170713          	addi	a4,a4,1
    80003380:	01368023          	sb	s3,0(a3)
    80003384:	00e4b023          	sd	a4,0(s1)
    80003388:	10000637          	lui	a2,0x10000
    8000338c:	02f71063          	bne	a4,a5,800033ac <uartputc+0xc4>
    80003390:	0340006f          	j	800033c4 <uartputc+0xdc>
    80003394:	00074703          	lbu	a4,0(a4)
    80003398:	00f93023          	sd	a5,0(s2)
    8000339c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    800033a0:	00093783          	ld	a5,0(s2)
    800033a4:	0004b703          	ld	a4,0(s1)
    800033a8:	00f70e63          	beq	a4,a5,800033c4 <uartputc+0xdc>
    800033ac:	00564683          	lbu	a3,5(a2)
    800033b0:	01f7f713          	andi	a4,a5,31
    800033b4:	00e58733          	add	a4,a1,a4
    800033b8:	0206f693          	andi	a3,a3,32
    800033bc:	00178793          	addi	a5,a5,1
    800033c0:	fc069ae3          	bnez	a3,80003394 <uartputc+0xac>
    800033c4:	02813083          	ld	ra,40(sp)
    800033c8:	02013403          	ld	s0,32(sp)
    800033cc:	01813483          	ld	s1,24(sp)
    800033d0:	01013903          	ld	s2,16(sp)
    800033d4:	00813983          	ld	s3,8(sp)
    800033d8:	03010113          	addi	sp,sp,48
    800033dc:	00008067          	ret

00000000800033e0 <uartputc_sync>:
    800033e0:	ff010113          	addi	sp,sp,-16
    800033e4:	00813423          	sd	s0,8(sp)
    800033e8:	01010413          	addi	s0,sp,16
    800033ec:	00002717          	auipc	a4,0x2
    800033f0:	61c72703          	lw	a4,1564(a4) # 80005a08 <panicked>
    800033f4:	02071663          	bnez	a4,80003420 <uartputc_sync+0x40>
    800033f8:	00050793          	mv	a5,a0
    800033fc:	100006b7          	lui	a3,0x10000
    80003400:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80003404:	02077713          	andi	a4,a4,32
    80003408:	fe070ce3          	beqz	a4,80003400 <uartputc_sync+0x20>
    8000340c:	0ff7f793          	andi	a5,a5,255
    80003410:	00f68023          	sb	a5,0(a3)
    80003414:	00813403          	ld	s0,8(sp)
    80003418:	01010113          	addi	sp,sp,16
    8000341c:	00008067          	ret
    80003420:	0000006f          	j	80003420 <uartputc_sync+0x40>

0000000080003424 <uartstart>:
    80003424:	ff010113          	addi	sp,sp,-16
    80003428:	00813423          	sd	s0,8(sp)
    8000342c:	01010413          	addi	s0,sp,16
    80003430:	00002617          	auipc	a2,0x2
    80003434:	5e060613          	addi	a2,a2,1504 # 80005a10 <uart_tx_r>
    80003438:	00002517          	auipc	a0,0x2
    8000343c:	5e050513          	addi	a0,a0,1504 # 80005a18 <uart_tx_w>
    80003440:	00063783          	ld	a5,0(a2)
    80003444:	00053703          	ld	a4,0(a0)
    80003448:	04f70263          	beq	a4,a5,8000348c <uartstart+0x68>
    8000344c:	100005b7          	lui	a1,0x10000
    80003450:	00004817          	auipc	a6,0x4
    80003454:	86080813          	addi	a6,a6,-1952 # 80006cb0 <uart_tx_buf>
    80003458:	01c0006f          	j	80003474 <uartstart+0x50>
    8000345c:	0006c703          	lbu	a4,0(a3)
    80003460:	00f63023          	sd	a5,0(a2)
    80003464:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80003468:	00063783          	ld	a5,0(a2)
    8000346c:	00053703          	ld	a4,0(a0)
    80003470:	00f70e63          	beq	a4,a5,8000348c <uartstart+0x68>
    80003474:	01f7f713          	andi	a4,a5,31
    80003478:	00e806b3          	add	a3,a6,a4
    8000347c:	0055c703          	lbu	a4,5(a1)
    80003480:	00178793          	addi	a5,a5,1
    80003484:	02077713          	andi	a4,a4,32
    80003488:	fc071ae3          	bnez	a4,8000345c <uartstart+0x38>
    8000348c:	00813403          	ld	s0,8(sp)
    80003490:	01010113          	addi	sp,sp,16
    80003494:	00008067          	ret

0000000080003498 <uartgetc>:
    80003498:	ff010113          	addi	sp,sp,-16
    8000349c:	00813423          	sd	s0,8(sp)
    800034a0:	01010413          	addi	s0,sp,16
    800034a4:	10000737          	lui	a4,0x10000
    800034a8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    800034ac:	0017f793          	andi	a5,a5,1
    800034b0:	00078c63          	beqz	a5,800034c8 <uartgetc+0x30>
    800034b4:	00074503          	lbu	a0,0(a4)
    800034b8:	0ff57513          	andi	a0,a0,255
    800034bc:	00813403          	ld	s0,8(sp)
    800034c0:	01010113          	addi	sp,sp,16
    800034c4:	00008067          	ret
    800034c8:	fff00513          	li	a0,-1
    800034cc:	ff1ff06f          	j	800034bc <uartgetc+0x24>

00000000800034d0 <uartintr>:
    800034d0:	100007b7          	lui	a5,0x10000
    800034d4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    800034d8:	0017f793          	andi	a5,a5,1
    800034dc:	0a078463          	beqz	a5,80003584 <uartintr+0xb4>
    800034e0:	fe010113          	addi	sp,sp,-32
    800034e4:	00813823          	sd	s0,16(sp)
    800034e8:	00913423          	sd	s1,8(sp)
    800034ec:	00113c23          	sd	ra,24(sp)
    800034f0:	02010413          	addi	s0,sp,32
    800034f4:	100004b7          	lui	s1,0x10000
    800034f8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    800034fc:	0ff57513          	andi	a0,a0,255
    80003500:	fffff097          	auipc	ra,0xfffff
    80003504:	534080e7          	jalr	1332(ra) # 80002a34 <consoleintr>
    80003508:	0054c783          	lbu	a5,5(s1)
    8000350c:	0017f793          	andi	a5,a5,1
    80003510:	fe0794e3          	bnez	a5,800034f8 <uartintr+0x28>
    80003514:	00002617          	auipc	a2,0x2
    80003518:	4fc60613          	addi	a2,a2,1276 # 80005a10 <uart_tx_r>
    8000351c:	00002517          	auipc	a0,0x2
    80003520:	4fc50513          	addi	a0,a0,1276 # 80005a18 <uart_tx_w>
    80003524:	00063783          	ld	a5,0(a2)
    80003528:	00053703          	ld	a4,0(a0)
    8000352c:	04f70263          	beq	a4,a5,80003570 <uartintr+0xa0>
    80003530:	100005b7          	lui	a1,0x10000
    80003534:	00003817          	auipc	a6,0x3
    80003538:	77c80813          	addi	a6,a6,1916 # 80006cb0 <uart_tx_buf>
    8000353c:	01c0006f          	j	80003558 <uartintr+0x88>
    80003540:	0006c703          	lbu	a4,0(a3)
    80003544:	00f63023          	sd	a5,0(a2)
    80003548:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000354c:	00063783          	ld	a5,0(a2)
    80003550:	00053703          	ld	a4,0(a0)
    80003554:	00f70e63          	beq	a4,a5,80003570 <uartintr+0xa0>
    80003558:	01f7f713          	andi	a4,a5,31
    8000355c:	00e806b3          	add	a3,a6,a4
    80003560:	0055c703          	lbu	a4,5(a1)
    80003564:	00178793          	addi	a5,a5,1
    80003568:	02077713          	andi	a4,a4,32
    8000356c:	fc071ae3          	bnez	a4,80003540 <uartintr+0x70>
    80003570:	01813083          	ld	ra,24(sp)
    80003574:	01013403          	ld	s0,16(sp)
    80003578:	00813483          	ld	s1,8(sp)
    8000357c:	02010113          	addi	sp,sp,32
    80003580:	00008067          	ret
    80003584:	00002617          	auipc	a2,0x2
    80003588:	48c60613          	addi	a2,a2,1164 # 80005a10 <uart_tx_r>
    8000358c:	00002517          	auipc	a0,0x2
    80003590:	48c50513          	addi	a0,a0,1164 # 80005a18 <uart_tx_w>
    80003594:	00063783          	ld	a5,0(a2)
    80003598:	00053703          	ld	a4,0(a0)
    8000359c:	04f70263          	beq	a4,a5,800035e0 <uartintr+0x110>
    800035a0:	100005b7          	lui	a1,0x10000
    800035a4:	00003817          	auipc	a6,0x3
    800035a8:	70c80813          	addi	a6,a6,1804 # 80006cb0 <uart_tx_buf>
    800035ac:	01c0006f          	j	800035c8 <uartintr+0xf8>
    800035b0:	0006c703          	lbu	a4,0(a3)
    800035b4:	00f63023          	sd	a5,0(a2)
    800035b8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800035bc:	00063783          	ld	a5,0(a2)
    800035c0:	00053703          	ld	a4,0(a0)
    800035c4:	02f70063          	beq	a4,a5,800035e4 <uartintr+0x114>
    800035c8:	01f7f713          	andi	a4,a5,31
    800035cc:	00e806b3          	add	a3,a6,a4
    800035d0:	0055c703          	lbu	a4,5(a1)
    800035d4:	00178793          	addi	a5,a5,1
    800035d8:	02077713          	andi	a4,a4,32
    800035dc:	fc071ae3          	bnez	a4,800035b0 <uartintr+0xe0>
    800035e0:	00008067          	ret
    800035e4:	00008067          	ret

00000000800035e8 <kinit>:
    800035e8:	fc010113          	addi	sp,sp,-64
    800035ec:	02913423          	sd	s1,40(sp)
    800035f0:	fffff7b7          	lui	a5,0xfffff
    800035f4:	00004497          	auipc	s1,0x4
    800035f8:	6db48493          	addi	s1,s1,1755 # 80007ccf <end+0xfff>
    800035fc:	02813823          	sd	s0,48(sp)
    80003600:	01313c23          	sd	s3,24(sp)
    80003604:	00f4f4b3          	and	s1,s1,a5
    80003608:	02113c23          	sd	ra,56(sp)
    8000360c:	03213023          	sd	s2,32(sp)
    80003610:	01413823          	sd	s4,16(sp)
    80003614:	01513423          	sd	s5,8(sp)
    80003618:	04010413          	addi	s0,sp,64
    8000361c:	000017b7          	lui	a5,0x1
    80003620:	01100993          	li	s3,17
    80003624:	00f487b3          	add	a5,s1,a5
    80003628:	01b99993          	slli	s3,s3,0x1b
    8000362c:	06f9e063          	bltu	s3,a5,8000368c <kinit+0xa4>
    80003630:	00003a97          	auipc	s5,0x3
    80003634:	6a0a8a93          	addi	s5,s5,1696 # 80006cd0 <end>
    80003638:	0754ec63          	bltu	s1,s5,800036b0 <kinit+0xc8>
    8000363c:	0734fa63          	bgeu	s1,s3,800036b0 <kinit+0xc8>
    80003640:	00088a37          	lui	s4,0x88
    80003644:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80003648:	00002917          	auipc	s2,0x2
    8000364c:	3d890913          	addi	s2,s2,984 # 80005a20 <kmem>
    80003650:	00ca1a13          	slli	s4,s4,0xc
    80003654:	0140006f          	j	80003668 <kinit+0x80>
    80003658:	000017b7          	lui	a5,0x1
    8000365c:	00f484b3          	add	s1,s1,a5
    80003660:	0554e863          	bltu	s1,s5,800036b0 <kinit+0xc8>
    80003664:	0534f663          	bgeu	s1,s3,800036b0 <kinit+0xc8>
    80003668:	00001637          	lui	a2,0x1
    8000366c:	00100593          	li	a1,1
    80003670:	00048513          	mv	a0,s1
    80003674:	00000097          	auipc	ra,0x0
    80003678:	5e4080e7          	jalr	1508(ra) # 80003c58 <__memset>
    8000367c:	00093783          	ld	a5,0(s2)
    80003680:	00f4b023          	sd	a5,0(s1)
    80003684:	00993023          	sd	s1,0(s2)
    80003688:	fd4498e3          	bne	s1,s4,80003658 <kinit+0x70>
    8000368c:	03813083          	ld	ra,56(sp)
    80003690:	03013403          	ld	s0,48(sp)
    80003694:	02813483          	ld	s1,40(sp)
    80003698:	02013903          	ld	s2,32(sp)
    8000369c:	01813983          	ld	s3,24(sp)
    800036a0:	01013a03          	ld	s4,16(sp)
    800036a4:	00813a83          	ld	s5,8(sp)
    800036a8:	04010113          	addi	sp,sp,64
    800036ac:	00008067          	ret
    800036b0:	00002517          	auipc	a0,0x2
    800036b4:	c7850513          	addi	a0,a0,-904 # 80005328 <digits+0x18>
    800036b8:	fffff097          	auipc	ra,0xfffff
    800036bc:	4b4080e7          	jalr	1204(ra) # 80002b6c <panic>

00000000800036c0 <freerange>:
    800036c0:	fc010113          	addi	sp,sp,-64
    800036c4:	000017b7          	lui	a5,0x1
    800036c8:	02913423          	sd	s1,40(sp)
    800036cc:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    800036d0:	009504b3          	add	s1,a0,s1
    800036d4:	fffff537          	lui	a0,0xfffff
    800036d8:	02813823          	sd	s0,48(sp)
    800036dc:	02113c23          	sd	ra,56(sp)
    800036e0:	03213023          	sd	s2,32(sp)
    800036e4:	01313c23          	sd	s3,24(sp)
    800036e8:	01413823          	sd	s4,16(sp)
    800036ec:	01513423          	sd	s5,8(sp)
    800036f0:	01613023          	sd	s6,0(sp)
    800036f4:	04010413          	addi	s0,sp,64
    800036f8:	00a4f4b3          	and	s1,s1,a0
    800036fc:	00f487b3          	add	a5,s1,a5
    80003700:	06f5e463          	bltu	a1,a5,80003768 <freerange+0xa8>
    80003704:	00003a97          	auipc	s5,0x3
    80003708:	5cca8a93          	addi	s5,s5,1484 # 80006cd0 <end>
    8000370c:	0954e263          	bltu	s1,s5,80003790 <freerange+0xd0>
    80003710:	01100993          	li	s3,17
    80003714:	01b99993          	slli	s3,s3,0x1b
    80003718:	0734fc63          	bgeu	s1,s3,80003790 <freerange+0xd0>
    8000371c:	00058a13          	mv	s4,a1
    80003720:	00002917          	auipc	s2,0x2
    80003724:	30090913          	addi	s2,s2,768 # 80005a20 <kmem>
    80003728:	00002b37          	lui	s6,0x2
    8000372c:	0140006f          	j	80003740 <freerange+0x80>
    80003730:	000017b7          	lui	a5,0x1
    80003734:	00f484b3          	add	s1,s1,a5
    80003738:	0554ec63          	bltu	s1,s5,80003790 <freerange+0xd0>
    8000373c:	0534fa63          	bgeu	s1,s3,80003790 <freerange+0xd0>
    80003740:	00001637          	lui	a2,0x1
    80003744:	00100593          	li	a1,1
    80003748:	00048513          	mv	a0,s1
    8000374c:	00000097          	auipc	ra,0x0
    80003750:	50c080e7          	jalr	1292(ra) # 80003c58 <__memset>
    80003754:	00093703          	ld	a4,0(s2)
    80003758:	016487b3          	add	a5,s1,s6
    8000375c:	00e4b023          	sd	a4,0(s1)
    80003760:	00993023          	sd	s1,0(s2)
    80003764:	fcfa76e3          	bgeu	s4,a5,80003730 <freerange+0x70>
    80003768:	03813083          	ld	ra,56(sp)
    8000376c:	03013403          	ld	s0,48(sp)
    80003770:	02813483          	ld	s1,40(sp)
    80003774:	02013903          	ld	s2,32(sp)
    80003778:	01813983          	ld	s3,24(sp)
    8000377c:	01013a03          	ld	s4,16(sp)
    80003780:	00813a83          	ld	s5,8(sp)
    80003784:	00013b03          	ld	s6,0(sp)
    80003788:	04010113          	addi	sp,sp,64
    8000378c:	00008067          	ret
    80003790:	00002517          	auipc	a0,0x2
    80003794:	b9850513          	addi	a0,a0,-1128 # 80005328 <digits+0x18>
    80003798:	fffff097          	auipc	ra,0xfffff
    8000379c:	3d4080e7          	jalr	980(ra) # 80002b6c <panic>

00000000800037a0 <kfree>:
    800037a0:	fe010113          	addi	sp,sp,-32
    800037a4:	00813823          	sd	s0,16(sp)
    800037a8:	00113c23          	sd	ra,24(sp)
    800037ac:	00913423          	sd	s1,8(sp)
    800037b0:	02010413          	addi	s0,sp,32
    800037b4:	03451793          	slli	a5,a0,0x34
    800037b8:	04079c63          	bnez	a5,80003810 <kfree+0x70>
    800037bc:	00003797          	auipc	a5,0x3
    800037c0:	51478793          	addi	a5,a5,1300 # 80006cd0 <end>
    800037c4:	00050493          	mv	s1,a0
    800037c8:	04f56463          	bltu	a0,a5,80003810 <kfree+0x70>
    800037cc:	01100793          	li	a5,17
    800037d0:	01b79793          	slli	a5,a5,0x1b
    800037d4:	02f57e63          	bgeu	a0,a5,80003810 <kfree+0x70>
    800037d8:	00001637          	lui	a2,0x1
    800037dc:	00100593          	li	a1,1
    800037e0:	00000097          	auipc	ra,0x0
    800037e4:	478080e7          	jalr	1144(ra) # 80003c58 <__memset>
    800037e8:	00002797          	auipc	a5,0x2
    800037ec:	23878793          	addi	a5,a5,568 # 80005a20 <kmem>
    800037f0:	0007b703          	ld	a4,0(a5)
    800037f4:	01813083          	ld	ra,24(sp)
    800037f8:	01013403          	ld	s0,16(sp)
    800037fc:	00e4b023          	sd	a4,0(s1)
    80003800:	0097b023          	sd	s1,0(a5)
    80003804:	00813483          	ld	s1,8(sp)
    80003808:	02010113          	addi	sp,sp,32
    8000380c:	00008067          	ret
    80003810:	00002517          	auipc	a0,0x2
    80003814:	b1850513          	addi	a0,a0,-1256 # 80005328 <digits+0x18>
    80003818:	fffff097          	auipc	ra,0xfffff
    8000381c:	354080e7          	jalr	852(ra) # 80002b6c <panic>

0000000080003820 <kalloc>:
    80003820:	fe010113          	addi	sp,sp,-32
    80003824:	00813823          	sd	s0,16(sp)
    80003828:	00913423          	sd	s1,8(sp)
    8000382c:	00113c23          	sd	ra,24(sp)
    80003830:	02010413          	addi	s0,sp,32
    80003834:	00002797          	auipc	a5,0x2
    80003838:	1ec78793          	addi	a5,a5,492 # 80005a20 <kmem>
    8000383c:	0007b483          	ld	s1,0(a5)
    80003840:	02048063          	beqz	s1,80003860 <kalloc+0x40>
    80003844:	0004b703          	ld	a4,0(s1)
    80003848:	00001637          	lui	a2,0x1
    8000384c:	00500593          	li	a1,5
    80003850:	00048513          	mv	a0,s1
    80003854:	00e7b023          	sd	a4,0(a5)
    80003858:	00000097          	auipc	ra,0x0
    8000385c:	400080e7          	jalr	1024(ra) # 80003c58 <__memset>
    80003860:	01813083          	ld	ra,24(sp)
    80003864:	01013403          	ld	s0,16(sp)
    80003868:	00048513          	mv	a0,s1
    8000386c:	00813483          	ld	s1,8(sp)
    80003870:	02010113          	addi	sp,sp,32
    80003874:	00008067          	ret

0000000080003878 <initlock>:
    80003878:	ff010113          	addi	sp,sp,-16
    8000387c:	00813423          	sd	s0,8(sp)
    80003880:	01010413          	addi	s0,sp,16
    80003884:	00813403          	ld	s0,8(sp)
    80003888:	00b53423          	sd	a1,8(a0)
    8000388c:	00052023          	sw	zero,0(a0)
    80003890:	00053823          	sd	zero,16(a0)
    80003894:	01010113          	addi	sp,sp,16
    80003898:	00008067          	ret

000000008000389c <acquire>:
    8000389c:	fe010113          	addi	sp,sp,-32
    800038a0:	00813823          	sd	s0,16(sp)
    800038a4:	00913423          	sd	s1,8(sp)
    800038a8:	00113c23          	sd	ra,24(sp)
    800038ac:	01213023          	sd	s2,0(sp)
    800038b0:	02010413          	addi	s0,sp,32
    800038b4:	00050493          	mv	s1,a0
    800038b8:	10002973          	csrr	s2,sstatus
    800038bc:	100027f3          	csrr	a5,sstatus
    800038c0:	ffd7f793          	andi	a5,a5,-3
    800038c4:	10079073          	csrw	sstatus,a5
    800038c8:	fffff097          	auipc	ra,0xfffff
    800038cc:	8e0080e7          	jalr	-1824(ra) # 800021a8 <mycpu>
    800038d0:	07852783          	lw	a5,120(a0)
    800038d4:	06078e63          	beqz	a5,80003950 <acquire+0xb4>
    800038d8:	fffff097          	auipc	ra,0xfffff
    800038dc:	8d0080e7          	jalr	-1840(ra) # 800021a8 <mycpu>
    800038e0:	07852783          	lw	a5,120(a0)
    800038e4:	0004a703          	lw	a4,0(s1)
    800038e8:	0017879b          	addiw	a5,a5,1
    800038ec:	06f52c23          	sw	a5,120(a0)
    800038f0:	04071063          	bnez	a4,80003930 <acquire+0x94>
    800038f4:	00100713          	li	a4,1
    800038f8:	00070793          	mv	a5,a4
    800038fc:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80003900:	0007879b          	sext.w	a5,a5
    80003904:	fe079ae3          	bnez	a5,800038f8 <acquire+0x5c>
    80003908:	0ff0000f          	fence
    8000390c:	fffff097          	auipc	ra,0xfffff
    80003910:	89c080e7          	jalr	-1892(ra) # 800021a8 <mycpu>
    80003914:	01813083          	ld	ra,24(sp)
    80003918:	01013403          	ld	s0,16(sp)
    8000391c:	00a4b823          	sd	a0,16(s1)
    80003920:	00013903          	ld	s2,0(sp)
    80003924:	00813483          	ld	s1,8(sp)
    80003928:	02010113          	addi	sp,sp,32
    8000392c:	00008067          	ret
    80003930:	0104b903          	ld	s2,16(s1)
    80003934:	fffff097          	auipc	ra,0xfffff
    80003938:	874080e7          	jalr	-1932(ra) # 800021a8 <mycpu>
    8000393c:	faa91ce3          	bne	s2,a0,800038f4 <acquire+0x58>
    80003940:	00002517          	auipc	a0,0x2
    80003944:	9f050513          	addi	a0,a0,-1552 # 80005330 <digits+0x20>
    80003948:	fffff097          	auipc	ra,0xfffff
    8000394c:	224080e7          	jalr	548(ra) # 80002b6c <panic>
    80003950:	00195913          	srli	s2,s2,0x1
    80003954:	fffff097          	auipc	ra,0xfffff
    80003958:	854080e7          	jalr	-1964(ra) # 800021a8 <mycpu>
    8000395c:	00197913          	andi	s2,s2,1
    80003960:	07252e23          	sw	s2,124(a0)
    80003964:	f75ff06f          	j	800038d8 <acquire+0x3c>

0000000080003968 <release>:
    80003968:	fe010113          	addi	sp,sp,-32
    8000396c:	00813823          	sd	s0,16(sp)
    80003970:	00113c23          	sd	ra,24(sp)
    80003974:	00913423          	sd	s1,8(sp)
    80003978:	01213023          	sd	s2,0(sp)
    8000397c:	02010413          	addi	s0,sp,32
    80003980:	00052783          	lw	a5,0(a0)
    80003984:	00079a63          	bnez	a5,80003998 <release+0x30>
    80003988:	00002517          	auipc	a0,0x2
    8000398c:	9b050513          	addi	a0,a0,-1616 # 80005338 <digits+0x28>
    80003990:	fffff097          	auipc	ra,0xfffff
    80003994:	1dc080e7          	jalr	476(ra) # 80002b6c <panic>
    80003998:	01053903          	ld	s2,16(a0)
    8000399c:	00050493          	mv	s1,a0
    800039a0:	fffff097          	auipc	ra,0xfffff
    800039a4:	808080e7          	jalr	-2040(ra) # 800021a8 <mycpu>
    800039a8:	fea910e3          	bne	s2,a0,80003988 <release+0x20>
    800039ac:	0004b823          	sd	zero,16(s1)
    800039b0:	0ff0000f          	fence
    800039b4:	0f50000f          	fence	iorw,ow
    800039b8:	0804a02f          	amoswap.w	zero,zero,(s1)
    800039bc:	ffffe097          	auipc	ra,0xffffe
    800039c0:	7ec080e7          	jalr	2028(ra) # 800021a8 <mycpu>
    800039c4:	100027f3          	csrr	a5,sstatus
    800039c8:	0027f793          	andi	a5,a5,2
    800039cc:	04079a63          	bnez	a5,80003a20 <release+0xb8>
    800039d0:	07852783          	lw	a5,120(a0)
    800039d4:	02f05e63          	blez	a5,80003a10 <release+0xa8>
    800039d8:	fff7871b          	addiw	a4,a5,-1
    800039dc:	06e52c23          	sw	a4,120(a0)
    800039e0:	00071c63          	bnez	a4,800039f8 <release+0x90>
    800039e4:	07c52783          	lw	a5,124(a0)
    800039e8:	00078863          	beqz	a5,800039f8 <release+0x90>
    800039ec:	100027f3          	csrr	a5,sstatus
    800039f0:	0027e793          	ori	a5,a5,2
    800039f4:	10079073          	csrw	sstatus,a5
    800039f8:	01813083          	ld	ra,24(sp)
    800039fc:	01013403          	ld	s0,16(sp)
    80003a00:	00813483          	ld	s1,8(sp)
    80003a04:	00013903          	ld	s2,0(sp)
    80003a08:	02010113          	addi	sp,sp,32
    80003a0c:	00008067          	ret
    80003a10:	00002517          	auipc	a0,0x2
    80003a14:	94850513          	addi	a0,a0,-1720 # 80005358 <digits+0x48>
    80003a18:	fffff097          	auipc	ra,0xfffff
    80003a1c:	154080e7          	jalr	340(ra) # 80002b6c <panic>
    80003a20:	00002517          	auipc	a0,0x2
    80003a24:	92050513          	addi	a0,a0,-1760 # 80005340 <digits+0x30>
    80003a28:	fffff097          	auipc	ra,0xfffff
    80003a2c:	144080e7          	jalr	324(ra) # 80002b6c <panic>

0000000080003a30 <holding>:
    80003a30:	00052783          	lw	a5,0(a0)
    80003a34:	00079663          	bnez	a5,80003a40 <holding+0x10>
    80003a38:	00000513          	li	a0,0
    80003a3c:	00008067          	ret
    80003a40:	fe010113          	addi	sp,sp,-32
    80003a44:	00813823          	sd	s0,16(sp)
    80003a48:	00913423          	sd	s1,8(sp)
    80003a4c:	00113c23          	sd	ra,24(sp)
    80003a50:	02010413          	addi	s0,sp,32
    80003a54:	01053483          	ld	s1,16(a0)
    80003a58:	ffffe097          	auipc	ra,0xffffe
    80003a5c:	750080e7          	jalr	1872(ra) # 800021a8 <mycpu>
    80003a60:	01813083          	ld	ra,24(sp)
    80003a64:	01013403          	ld	s0,16(sp)
    80003a68:	40a48533          	sub	a0,s1,a0
    80003a6c:	00153513          	seqz	a0,a0
    80003a70:	00813483          	ld	s1,8(sp)
    80003a74:	02010113          	addi	sp,sp,32
    80003a78:	00008067          	ret

0000000080003a7c <push_off>:
    80003a7c:	fe010113          	addi	sp,sp,-32
    80003a80:	00813823          	sd	s0,16(sp)
    80003a84:	00113c23          	sd	ra,24(sp)
    80003a88:	00913423          	sd	s1,8(sp)
    80003a8c:	02010413          	addi	s0,sp,32
    80003a90:	100024f3          	csrr	s1,sstatus
    80003a94:	100027f3          	csrr	a5,sstatus
    80003a98:	ffd7f793          	andi	a5,a5,-3
    80003a9c:	10079073          	csrw	sstatus,a5
    80003aa0:	ffffe097          	auipc	ra,0xffffe
    80003aa4:	708080e7          	jalr	1800(ra) # 800021a8 <mycpu>
    80003aa8:	07852783          	lw	a5,120(a0)
    80003aac:	02078663          	beqz	a5,80003ad8 <push_off+0x5c>
    80003ab0:	ffffe097          	auipc	ra,0xffffe
    80003ab4:	6f8080e7          	jalr	1784(ra) # 800021a8 <mycpu>
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
    80003ae0:	6cc080e7          	jalr	1740(ra) # 800021a8 <mycpu>
    80003ae4:	0014f493          	andi	s1,s1,1
    80003ae8:	06952e23          	sw	s1,124(a0)
    80003aec:	fc5ff06f          	j	80003ab0 <push_off+0x34>

0000000080003af0 <pop_off>:
    80003af0:	ff010113          	addi	sp,sp,-16
    80003af4:	00813023          	sd	s0,0(sp)
    80003af8:	00113423          	sd	ra,8(sp)
    80003afc:	01010413          	addi	s0,sp,16
    80003b00:	ffffe097          	auipc	ra,0xffffe
    80003b04:	6a8080e7          	jalr	1704(ra) # 800021a8 <mycpu>
    80003b08:	100027f3          	csrr	a5,sstatus
    80003b0c:	0027f793          	andi	a5,a5,2
    80003b10:	04079663          	bnez	a5,80003b5c <pop_off+0x6c>
    80003b14:	07852783          	lw	a5,120(a0)
    80003b18:	02f05a63          	blez	a5,80003b4c <pop_off+0x5c>
    80003b1c:	fff7871b          	addiw	a4,a5,-1
    80003b20:	06e52c23          	sw	a4,120(a0)
    80003b24:	00071c63          	bnez	a4,80003b3c <pop_off+0x4c>
    80003b28:	07c52783          	lw	a5,124(a0)
    80003b2c:	00078863          	beqz	a5,80003b3c <pop_off+0x4c>
    80003b30:	100027f3          	csrr	a5,sstatus
    80003b34:	0027e793          	ori	a5,a5,2
    80003b38:	10079073          	csrw	sstatus,a5
    80003b3c:	00813083          	ld	ra,8(sp)
    80003b40:	00013403          	ld	s0,0(sp)
    80003b44:	01010113          	addi	sp,sp,16
    80003b48:	00008067          	ret
    80003b4c:	00002517          	auipc	a0,0x2
    80003b50:	80c50513          	addi	a0,a0,-2036 # 80005358 <digits+0x48>
    80003b54:	fffff097          	auipc	ra,0xfffff
    80003b58:	018080e7          	jalr	24(ra) # 80002b6c <panic>
    80003b5c:	00001517          	auipc	a0,0x1
    80003b60:	7e450513          	addi	a0,a0,2020 # 80005340 <digits+0x30>
    80003b64:	fffff097          	auipc	ra,0xfffff
    80003b68:	008080e7          	jalr	8(ra) # 80002b6c <panic>

0000000080003b6c <push_on>:
    80003b6c:	fe010113          	addi	sp,sp,-32
    80003b70:	00813823          	sd	s0,16(sp)
    80003b74:	00113c23          	sd	ra,24(sp)
    80003b78:	00913423          	sd	s1,8(sp)
    80003b7c:	02010413          	addi	s0,sp,32
    80003b80:	100024f3          	csrr	s1,sstatus
    80003b84:	100027f3          	csrr	a5,sstatus
    80003b88:	0027e793          	ori	a5,a5,2
    80003b8c:	10079073          	csrw	sstatus,a5
    80003b90:	ffffe097          	auipc	ra,0xffffe
    80003b94:	618080e7          	jalr	1560(ra) # 800021a8 <mycpu>
    80003b98:	07852783          	lw	a5,120(a0)
    80003b9c:	02078663          	beqz	a5,80003bc8 <push_on+0x5c>
    80003ba0:	ffffe097          	auipc	ra,0xffffe
    80003ba4:	608080e7          	jalr	1544(ra) # 800021a8 <mycpu>
    80003ba8:	07852783          	lw	a5,120(a0)
    80003bac:	01813083          	ld	ra,24(sp)
    80003bb0:	01013403          	ld	s0,16(sp)
    80003bb4:	0017879b          	addiw	a5,a5,1
    80003bb8:	06f52c23          	sw	a5,120(a0)
    80003bbc:	00813483          	ld	s1,8(sp)
    80003bc0:	02010113          	addi	sp,sp,32
    80003bc4:	00008067          	ret
    80003bc8:	0014d493          	srli	s1,s1,0x1
    80003bcc:	ffffe097          	auipc	ra,0xffffe
    80003bd0:	5dc080e7          	jalr	1500(ra) # 800021a8 <mycpu>
    80003bd4:	0014f493          	andi	s1,s1,1
    80003bd8:	06952e23          	sw	s1,124(a0)
    80003bdc:	fc5ff06f          	j	80003ba0 <push_on+0x34>

0000000080003be0 <pop_on>:
    80003be0:	ff010113          	addi	sp,sp,-16
    80003be4:	00813023          	sd	s0,0(sp)
    80003be8:	00113423          	sd	ra,8(sp)
    80003bec:	01010413          	addi	s0,sp,16
    80003bf0:	ffffe097          	auipc	ra,0xffffe
    80003bf4:	5b8080e7          	jalr	1464(ra) # 800021a8 <mycpu>
    80003bf8:	100027f3          	csrr	a5,sstatus
    80003bfc:	0027f793          	andi	a5,a5,2
    80003c00:	04078463          	beqz	a5,80003c48 <pop_on+0x68>
    80003c04:	07852783          	lw	a5,120(a0)
    80003c08:	02f05863          	blez	a5,80003c38 <pop_on+0x58>
    80003c0c:	fff7879b          	addiw	a5,a5,-1
    80003c10:	06f52c23          	sw	a5,120(a0)
    80003c14:	07853783          	ld	a5,120(a0)
    80003c18:	00079863          	bnez	a5,80003c28 <pop_on+0x48>
    80003c1c:	100027f3          	csrr	a5,sstatus
    80003c20:	ffd7f793          	andi	a5,a5,-3
    80003c24:	10079073          	csrw	sstatus,a5
    80003c28:	00813083          	ld	ra,8(sp)
    80003c2c:	00013403          	ld	s0,0(sp)
    80003c30:	01010113          	addi	sp,sp,16
    80003c34:	00008067          	ret
    80003c38:	00001517          	auipc	a0,0x1
    80003c3c:	74850513          	addi	a0,a0,1864 # 80005380 <digits+0x70>
    80003c40:	fffff097          	auipc	ra,0xfffff
    80003c44:	f2c080e7          	jalr	-212(ra) # 80002b6c <panic>
    80003c48:	00001517          	auipc	a0,0x1
    80003c4c:	71850513          	addi	a0,a0,1816 # 80005360 <digits+0x50>
    80003c50:	fffff097          	auipc	ra,0xfffff
    80003c54:	f1c080e7          	jalr	-228(ra) # 80002b6c <panic>

0000000080003c58 <__memset>:
    80003c58:	ff010113          	addi	sp,sp,-16
    80003c5c:	00813423          	sd	s0,8(sp)
    80003c60:	01010413          	addi	s0,sp,16
    80003c64:	1a060e63          	beqz	a2,80003e20 <__memset+0x1c8>
    80003c68:	40a007b3          	neg	a5,a0
    80003c6c:	0077f793          	andi	a5,a5,7
    80003c70:	00778693          	addi	a3,a5,7
    80003c74:	00b00813          	li	a6,11
    80003c78:	0ff5f593          	andi	a1,a1,255
    80003c7c:	fff6071b          	addiw	a4,a2,-1
    80003c80:	1b06e663          	bltu	a3,a6,80003e2c <__memset+0x1d4>
    80003c84:	1cd76463          	bltu	a4,a3,80003e4c <__memset+0x1f4>
    80003c88:	1a078e63          	beqz	a5,80003e44 <__memset+0x1ec>
    80003c8c:	00b50023          	sb	a1,0(a0)
    80003c90:	00100713          	li	a4,1
    80003c94:	1ae78463          	beq	a5,a4,80003e3c <__memset+0x1e4>
    80003c98:	00b500a3          	sb	a1,1(a0)
    80003c9c:	00200713          	li	a4,2
    80003ca0:	1ae78a63          	beq	a5,a4,80003e54 <__memset+0x1fc>
    80003ca4:	00b50123          	sb	a1,2(a0)
    80003ca8:	00300713          	li	a4,3
    80003cac:	18e78463          	beq	a5,a4,80003e34 <__memset+0x1dc>
    80003cb0:	00b501a3          	sb	a1,3(a0)
    80003cb4:	00400713          	li	a4,4
    80003cb8:	1ae78263          	beq	a5,a4,80003e5c <__memset+0x204>
    80003cbc:	00b50223          	sb	a1,4(a0)
    80003cc0:	00500713          	li	a4,5
    80003cc4:	1ae78063          	beq	a5,a4,80003e64 <__memset+0x20c>
    80003cc8:	00b502a3          	sb	a1,5(a0)
    80003ccc:	00700713          	li	a4,7
    80003cd0:	18e79e63          	bne	a5,a4,80003e6c <__memset+0x214>
    80003cd4:	00b50323          	sb	a1,6(a0)
    80003cd8:	00700e93          	li	t4,7
    80003cdc:	00859713          	slli	a4,a1,0x8
    80003ce0:	00e5e733          	or	a4,a1,a4
    80003ce4:	01059e13          	slli	t3,a1,0x10
    80003ce8:	01c76e33          	or	t3,a4,t3
    80003cec:	01859313          	slli	t1,a1,0x18
    80003cf0:	006e6333          	or	t1,t3,t1
    80003cf4:	02059893          	slli	a7,a1,0x20
    80003cf8:	40f60e3b          	subw	t3,a2,a5
    80003cfc:	011368b3          	or	a7,t1,a7
    80003d00:	02859813          	slli	a6,a1,0x28
    80003d04:	0108e833          	or	a6,a7,a6
    80003d08:	03059693          	slli	a3,a1,0x30
    80003d0c:	003e589b          	srliw	a7,t3,0x3
    80003d10:	00d866b3          	or	a3,a6,a3
    80003d14:	03859713          	slli	a4,a1,0x38
    80003d18:	00389813          	slli	a6,a7,0x3
    80003d1c:	00f507b3          	add	a5,a0,a5
    80003d20:	00e6e733          	or	a4,a3,a4
    80003d24:	000e089b          	sext.w	a7,t3
    80003d28:	00f806b3          	add	a3,a6,a5
    80003d2c:	00e7b023          	sd	a4,0(a5)
    80003d30:	00878793          	addi	a5,a5,8
    80003d34:	fed79ce3          	bne	a5,a3,80003d2c <__memset+0xd4>
    80003d38:	ff8e7793          	andi	a5,t3,-8
    80003d3c:	0007871b          	sext.w	a4,a5
    80003d40:	01d787bb          	addw	a5,a5,t4
    80003d44:	0ce88e63          	beq	a7,a4,80003e20 <__memset+0x1c8>
    80003d48:	00f50733          	add	a4,a0,a5
    80003d4c:	00b70023          	sb	a1,0(a4)
    80003d50:	0017871b          	addiw	a4,a5,1
    80003d54:	0cc77663          	bgeu	a4,a2,80003e20 <__memset+0x1c8>
    80003d58:	00e50733          	add	a4,a0,a4
    80003d5c:	00b70023          	sb	a1,0(a4)
    80003d60:	0027871b          	addiw	a4,a5,2
    80003d64:	0ac77e63          	bgeu	a4,a2,80003e20 <__memset+0x1c8>
    80003d68:	00e50733          	add	a4,a0,a4
    80003d6c:	00b70023          	sb	a1,0(a4)
    80003d70:	0037871b          	addiw	a4,a5,3
    80003d74:	0ac77663          	bgeu	a4,a2,80003e20 <__memset+0x1c8>
    80003d78:	00e50733          	add	a4,a0,a4
    80003d7c:	00b70023          	sb	a1,0(a4)
    80003d80:	0047871b          	addiw	a4,a5,4
    80003d84:	08c77e63          	bgeu	a4,a2,80003e20 <__memset+0x1c8>
    80003d88:	00e50733          	add	a4,a0,a4
    80003d8c:	00b70023          	sb	a1,0(a4)
    80003d90:	0057871b          	addiw	a4,a5,5
    80003d94:	08c77663          	bgeu	a4,a2,80003e20 <__memset+0x1c8>
    80003d98:	00e50733          	add	a4,a0,a4
    80003d9c:	00b70023          	sb	a1,0(a4)
    80003da0:	0067871b          	addiw	a4,a5,6
    80003da4:	06c77e63          	bgeu	a4,a2,80003e20 <__memset+0x1c8>
    80003da8:	00e50733          	add	a4,a0,a4
    80003dac:	00b70023          	sb	a1,0(a4)
    80003db0:	0077871b          	addiw	a4,a5,7
    80003db4:	06c77663          	bgeu	a4,a2,80003e20 <__memset+0x1c8>
    80003db8:	00e50733          	add	a4,a0,a4
    80003dbc:	00b70023          	sb	a1,0(a4)
    80003dc0:	0087871b          	addiw	a4,a5,8
    80003dc4:	04c77e63          	bgeu	a4,a2,80003e20 <__memset+0x1c8>
    80003dc8:	00e50733          	add	a4,a0,a4
    80003dcc:	00b70023          	sb	a1,0(a4)
    80003dd0:	0097871b          	addiw	a4,a5,9
    80003dd4:	04c77663          	bgeu	a4,a2,80003e20 <__memset+0x1c8>
    80003dd8:	00e50733          	add	a4,a0,a4
    80003ddc:	00b70023          	sb	a1,0(a4)
    80003de0:	00a7871b          	addiw	a4,a5,10
    80003de4:	02c77e63          	bgeu	a4,a2,80003e20 <__memset+0x1c8>
    80003de8:	00e50733          	add	a4,a0,a4
    80003dec:	00b70023          	sb	a1,0(a4)
    80003df0:	00b7871b          	addiw	a4,a5,11
    80003df4:	02c77663          	bgeu	a4,a2,80003e20 <__memset+0x1c8>
    80003df8:	00e50733          	add	a4,a0,a4
    80003dfc:	00b70023          	sb	a1,0(a4)
    80003e00:	00c7871b          	addiw	a4,a5,12
    80003e04:	00c77e63          	bgeu	a4,a2,80003e20 <__memset+0x1c8>
    80003e08:	00e50733          	add	a4,a0,a4
    80003e0c:	00b70023          	sb	a1,0(a4)
    80003e10:	00d7879b          	addiw	a5,a5,13
    80003e14:	00c7f663          	bgeu	a5,a2,80003e20 <__memset+0x1c8>
    80003e18:	00f507b3          	add	a5,a0,a5
    80003e1c:	00b78023          	sb	a1,0(a5)
    80003e20:	00813403          	ld	s0,8(sp)
    80003e24:	01010113          	addi	sp,sp,16
    80003e28:	00008067          	ret
    80003e2c:	00b00693          	li	a3,11
    80003e30:	e55ff06f          	j	80003c84 <__memset+0x2c>
    80003e34:	00300e93          	li	t4,3
    80003e38:	ea5ff06f          	j	80003cdc <__memset+0x84>
    80003e3c:	00100e93          	li	t4,1
    80003e40:	e9dff06f          	j	80003cdc <__memset+0x84>
    80003e44:	00000e93          	li	t4,0
    80003e48:	e95ff06f          	j	80003cdc <__memset+0x84>
    80003e4c:	00000793          	li	a5,0
    80003e50:	ef9ff06f          	j	80003d48 <__memset+0xf0>
    80003e54:	00200e93          	li	t4,2
    80003e58:	e85ff06f          	j	80003cdc <__memset+0x84>
    80003e5c:	00400e93          	li	t4,4
    80003e60:	e7dff06f          	j	80003cdc <__memset+0x84>
    80003e64:	00500e93          	li	t4,5
    80003e68:	e75ff06f          	j	80003cdc <__memset+0x84>
    80003e6c:	00600e93          	li	t4,6
    80003e70:	e6dff06f          	j	80003cdc <__memset+0x84>

0000000080003e74 <__memmove>:
    80003e74:	ff010113          	addi	sp,sp,-16
    80003e78:	00813423          	sd	s0,8(sp)
    80003e7c:	01010413          	addi	s0,sp,16
    80003e80:	0e060863          	beqz	a2,80003f70 <__memmove+0xfc>
    80003e84:	fff6069b          	addiw	a3,a2,-1
    80003e88:	0006881b          	sext.w	a6,a3
    80003e8c:	0ea5e863          	bltu	a1,a0,80003f7c <__memmove+0x108>
    80003e90:	00758713          	addi	a4,a1,7
    80003e94:	00a5e7b3          	or	a5,a1,a0
    80003e98:	40a70733          	sub	a4,a4,a0
    80003e9c:	0077f793          	andi	a5,a5,7
    80003ea0:	00f73713          	sltiu	a4,a4,15
    80003ea4:	00174713          	xori	a4,a4,1
    80003ea8:	0017b793          	seqz	a5,a5
    80003eac:	00e7f7b3          	and	a5,a5,a4
    80003eb0:	10078863          	beqz	a5,80003fc0 <__memmove+0x14c>
    80003eb4:	00900793          	li	a5,9
    80003eb8:	1107f463          	bgeu	a5,a6,80003fc0 <__memmove+0x14c>
    80003ebc:	0036581b          	srliw	a6,a2,0x3
    80003ec0:	fff8081b          	addiw	a6,a6,-1
    80003ec4:	02081813          	slli	a6,a6,0x20
    80003ec8:	01d85893          	srli	a7,a6,0x1d
    80003ecc:	00858813          	addi	a6,a1,8
    80003ed0:	00058793          	mv	a5,a1
    80003ed4:	00050713          	mv	a4,a0
    80003ed8:	01088833          	add	a6,a7,a6
    80003edc:	0007b883          	ld	a7,0(a5)
    80003ee0:	00878793          	addi	a5,a5,8
    80003ee4:	00870713          	addi	a4,a4,8
    80003ee8:	ff173c23          	sd	a7,-8(a4)
    80003eec:	ff0798e3          	bne	a5,a6,80003edc <__memmove+0x68>
    80003ef0:	ff867713          	andi	a4,a2,-8
    80003ef4:	02071793          	slli	a5,a4,0x20
    80003ef8:	0207d793          	srli	a5,a5,0x20
    80003efc:	00f585b3          	add	a1,a1,a5
    80003f00:	40e686bb          	subw	a3,a3,a4
    80003f04:	00f507b3          	add	a5,a0,a5
    80003f08:	06e60463          	beq	a2,a4,80003f70 <__memmove+0xfc>
    80003f0c:	0005c703          	lbu	a4,0(a1)
    80003f10:	00e78023          	sb	a4,0(a5)
    80003f14:	04068e63          	beqz	a3,80003f70 <__memmove+0xfc>
    80003f18:	0015c603          	lbu	a2,1(a1)
    80003f1c:	00100713          	li	a4,1
    80003f20:	00c780a3          	sb	a2,1(a5)
    80003f24:	04e68663          	beq	a3,a4,80003f70 <__memmove+0xfc>
    80003f28:	0025c603          	lbu	a2,2(a1)
    80003f2c:	00200713          	li	a4,2
    80003f30:	00c78123          	sb	a2,2(a5)
    80003f34:	02e68e63          	beq	a3,a4,80003f70 <__memmove+0xfc>
    80003f38:	0035c603          	lbu	a2,3(a1)
    80003f3c:	00300713          	li	a4,3
    80003f40:	00c781a3          	sb	a2,3(a5)
    80003f44:	02e68663          	beq	a3,a4,80003f70 <__memmove+0xfc>
    80003f48:	0045c603          	lbu	a2,4(a1)
    80003f4c:	00400713          	li	a4,4
    80003f50:	00c78223          	sb	a2,4(a5)
    80003f54:	00e68e63          	beq	a3,a4,80003f70 <__memmove+0xfc>
    80003f58:	0055c603          	lbu	a2,5(a1)
    80003f5c:	00500713          	li	a4,5
    80003f60:	00c782a3          	sb	a2,5(a5)
    80003f64:	00e68663          	beq	a3,a4,80003f70 <__memmove+0xfc>
    80003f68:	0065c703          	lbu	a4,6(a1)
    80003f6c:	00e78323          	sb	a4,6(a5)
    80003f70:	00813403          	ld	s0,8(sp)
    80003f74:	01010113          	addi	sp,sp,16
    80003f78:	00008067          	ret
    80003f7c:	02061713          	slli	a4,a2,0x20
    80003f80:	02075713          	srli	a4,a4,0x20
    80003f84:	00e587b3          	add	a5,a1,a4
    80003f88:	f0f574e3          	bgeu	a0,a5,80003e90 <__memmove+0x1c>
    80003f8c:	02069613          	slli	a2,a3,0x20
    80003f90:	02065613          	srli	a2,a2,0x20
    80003f94:	fff64613          	not	a2,a2
    80003f98:	00e50733          	add	a4,a0,a4
    80003f9c:	00c78633          	add	a2,a5,a2
    80003fa0:	fff7c683          	lbu	a3,-1(a5)
    80003fa4:	fff78793          	addi	a5,a5,-1
    80003fa8:	fff70713          	addi	a4,a4,-1
    80003fac:	00d70023          	sb	a3,0(a4)
    80003fb0:	fec798e3          	bne	a5,a2,80003fa0 <__memmove+0x12c>
    80003fb4:	00813403          	ld	s0,8(sp)
    80003fb8:	01010113          	addi	sp,sp,16
    80003fbc:	00008067          	ret
    80003fc0:	02069713          	slli	a4,a3,0x20
    80003fc4:	02075713          	srli	a4,a4,0x20
    80003fc8:	00170713          	addi	a4,a4,1
    80003fcc:	00e50733          	add	a4,a0,a4
    80003fd0:	00050793          	mv	a5,a0
    80003fd4:	0005c683          	lbu	a3,0(a1)
    80003fd8:	00178793          	addi	a5,a5,1
    80003fdc:	00158593          	addi	a1,a1,1
    80003fe0:	fed78fa3          	sb	a3,-1(a5)
    80003fe4:	fee798e3          	bne	a5,a4,80003fd4 <__memmove+0x160>
    80003fe8:	f89ff06f          	j	80003f70 <__memmove+0xfc>

0000000080003fec <__putc>:
    80003fec:	fe010113          	addi	sp,sp,-32
    80003ff0:	00813823          	sd	s0,16(sp)
    80003ff4:	00113c23          	sd	ra,24(sp)
    80003ff8:	02010413          	addi	s0,sp,32
    80003ffc:	00050793          	mv	a5,a0
    80004000:	fef40593          	addi	a1,s0,-17
    80004004:	00100613          	li	a2,1
    80004008:	00000513          	li	a0,0
    8000400c:	fef407a3          	sb	a5,-17(s0)
    80004010:	fffff097          	auipc	ra,0xfffff
    80004014:	b3c080e7          	jalr	-1220(ra) # 80002b4c <console_write>
    80004018:	01813083          	ld	ra,24(sp)
    8000401c:	01013403          	ld	s0,16(sp)
    80004020:	02010113          	addi	sp,sp,32
    80004024:	00008067          	ret

0000000080004028 <__getc>:
    80004028:	fe010113          	addi	sp,sp,-32
    8000402c:	00813823          	sd	s0,16(sp)
    80004030:	00113c23          	sd	ra,24(sp)
    80004034:	02010413          	addi	s0,sp,32
    80004038:	fe840593          	addi	a1,s0,-24
    8000403c:	00100613          	li	a2,1
    80004040:	00000513          	li	a0,0
    80004044:	fffff097          	auipc	ra,0xfffff
    80004048:	ae8080e7          	jalr	-1304(ra) # 80002b2c <console_read>
    8000404c:	fe844503          	lbu	a0,-24(s0)
    80004050:	01813083          	ld	ra,24(sp)
    80004054:	01013403          	ld	s0,16(sp)
    80004058:	02010113          	addi	sp,sp,32
    8000405c:	00008067          	ret

0000000080004060 <console_handler>:
    80004060:	fe010113          	addi	sp,sp,-32
    80004064:	00813823          	sd	s0,16(sp)
    80004068:	00113c23          	sd	ra,24(sp)
    8000406c:	00913423          	sd	s1,8(sp)
    80004070:	02010413          	addi	s0,sp,32
    80004074:	14202773          	csrr	a4,scause
    80004078:	100027f3          	csrr	a5,sstatus
    8000407c:	0027f793          	andi	a5,a5,2
    80004080:	06079e63          	bnez	a5,800040fc <console_handler+0x9c>
    80004084:	00074c63          	bltz	a4,8000409c <console_handler+0x3c>
    80004088:	01813083          	ld	ra,24(sp)
    8000408c:	01013403          	ld	s0,16(sp)
    80004090:	00813483          	ld	s1,8(sp)
    80004094:	02010113          	addi	sp,sp,32
    80004098:	00008067          	ret
    8000409c:	0ff77713          	andi	a4,a4,255
    800040a0:	00900793          	li	a5,9
    800040a4:	fef712e3          	bne	a4,a5,80004088 <console_handler+0x28>
    800040a8:	ffffe097          	auipc	ra,0xffffe
    800040ac:	6dc080e7          	jalr	1756(ra) # 80002784 <plic_claim>
    800040b0:	00a00793          	li	a5,10
    800040b4:	00050493          	mv	s1,a0
    800040b8:	02f50c63          	beq	a0,a5,800040f0 <console_handler+0x90>
    800040bc:	fc0506e3          	beqz	a0,80004088 <console_handler+0x28>
    800040c0:	00050593          	mv	a1,a0
    800040c4:	00001517          	auipc	a0,0x1
    800040c8:	1c450513          	addi	a0,a0,452 # 80005288 <_ZZ12printIntegermE6digits+0x268>
    800040cc:	fffff097          	auipc	ra,0xfffff
    800040d0:	afc080e7          	jalr	-1284(ra) # 80002bc8 <__printf>
    800040d4:	01013403          	ld	s0,16(sp)
    800040d8:	01813083          	ld	ra,24(sp)
    800040dc:	00048513          	mv	a0,s1
    800040e0:	00813483          	ld	s1,8(sp)
    800040e4:	02010113          	addi	sp,sp,32
    800040e8:	ffffe317          	auipc	t1,0xffffe
    800040ec:	6d430067          	jr	1748(t1) # 800027bc <plic_complete>
    800040f0:	fffff097          	auipc	ra,0xfffff
    800040f4:	3e0080e7          	jalr	992(ra) # 800034d0 <uartintr>
    800040f8:	fddff06f          	j	800040d4 <console_handler+0x74>
    800040fc:	00001517          	auipc	a0,0x1
    80004100:	28c50513          	addi	a0,a0,652 # 80005388 <digits+0x78>
    80004104:	fffff097          	auipc	ra,0xfffff
    80004108:	a68080e7          	jalr	-1432(ra) # 80002b6c <panic>
	...
