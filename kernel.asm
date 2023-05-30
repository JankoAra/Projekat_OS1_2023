
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
    8000001c:	6d1010ef          	jal	ra,80001eec <start>

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
    80001184:	500000ef          	jal	ra,80001684 <interruptRoutine>
    #call interruptHandleRoutine

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

0000000080001210 <interruptHandleRoutine>:
.global interruptHandleRoutine
interruptHandleRoutine:

    80001210:	00008067          	ret

0000000080001214 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>:
.global _ZN3TCB13contextSwitchEPNS_7ContextES1_
.type _ZN3TCB13contextSwitchEPNS_7ContextES1_, @function
_ZN3TCB13contextSwitchEPNS_7ContextES1_:
	# a0 = adresa od oldContext
	# a1 = adresa od newContext
	sd ra, 0 * 8(a0)
    80001214:	00153023          	sd	ra,0(a0) # 1000 <_entry-0x7ffff000>
	sd sp, 1 * 8(a0)
    80001218:	00253423          	sd	sp,8(a0)

	ld ra, 0 * 8(a1)
    8000121c:	0005b083          	ld	ra,0(a1)
    ld sp, 1 * 8(a1)
    80001220:	0085b103          	ld	sp,8(a1)

    80001224:	00008067          	ret

0000000080001228 <_Z9mem_allocm>:

inline void scall() {
	__asm__ volatile("ecall");
}

void* mem_alloc(size_t size) {
    80001228:	ff010113          	addi	sp,sp,-16
    8000122c:	00813423          	sd	s0,8(sp)
    80001230:	01010413          	addi	s0,sp,16
	//na size moramo dodati zaglavlje segmenta
	size += sizeof(MemoryAllocator::UsedMemSegment);
    80001234:	01050513          	addi	a0,a0,16
	//size je u bajtovima, pretvara se u blokove
	size = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
    80001238:	00655313          	srli	t1,a0,0x6
    8000123c:	03f57513          	andi	a0,a0,63
    80001240:	00050463          	beqz	a0,80001248 <_Z9mem_allocm+0x20>
    80001244:	00100513          	li	a0,1
    80001248:	00a30333          	add	t1,t1,a0

	//stavljanje argumenata za sistemski poziv
	__asm__ volatile("mv a1, %[size]": :[size] "r"(size):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000124c:	00030593          	mv	a1,t1
	__asm__ volatile("li a0, 0x01");
    80001250:	00100513          	li	a0,1
	__asm__ volatile("ecall");
    80001254:	00000073          	ecall
	//a1 = broj blokova velicine MEM_BLOCK_SIZE za alokaciju

	scall();

	void* ret;
	__asm__ volatile("mv %[ptr], a0":[ptr] "=r"(ret));
    80001258:	00050513          	mv	a0,a0
	return ret;
}
    8000125c:	00813403          	ld	s0,8(sp)
    80001260:	01010113          	addi	sp,sp,16
    80001264:	00008067          	ret

0000000080001268 <_Z8mem_freePv>:

int mem_free(void* ptr) {
    80001268:	ff010113          	addi	sp,sp,-16
    8000126c:	00813423          	sd	s0,8(sp)
    80001270:	01010413          	addi	s0,sp,16
    80001274:	00050313          	mv	t1,a0
	//stavljanje argumenata za sistemski poziv
	__asm__ volatile("mv a1, %[ptr]": :[ptr] "r"(ptr):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001278:	00030593          	mv	a1,t1
	__asm__ volatile("li a0, 0x02");
    8000127c:	00200513          	li	a0,2
	__asm__ volatile("ecall");
    80001280:	00000073          	ecall
	//a1 = pokazivac na memoriju koju treba dealocirati

	scall();

	int status;
	__asm__ volatile("mv %[status], a0":[status] "=r"(status));
    80001284:	00050513          	mv	a0,a0
	return status;
}
    80001288:	0005051b          	sext.w	a0,a0
    8000128c:	00813403          	ld	s0,8(sp)
    80001290:	01010113          	addi	sp,sp,16
    80001294:	00008067          	ret

0000000080001298 <_Z13thread_createPP3TCBPFvPvES2_>:

int thread_create(thread_t* handle, void (* start_routine)(void*), void* arg) {
    80001298:	fd010113          	addi	sp,sp,-48
    8000129c:	02113423          	sd	ra,40(sp)
    800012a0:	02813023          	sd	s0,32(sp)
    800012a4:	00913c23          	sd	s1,24(sp)
    800012a8:	01213823          	sd	s2,16(sp)
    800012ac:	01313423          	sd	s3,8(sp)
    800012b0:	03010413          	addi	s0,sp,48
    800012b4:	00050913          	mv	s2,a0
    800012b8:	00058493          	mv	s1,a1
    800012bc:	00060993          	mv	s3,a2
	//stvaranje steka ako se ne radi o main kernel niti, posto ona automatski ima stek
	uint64* stack = (start_routine != nullptr ? (uint64*)MemoryAllocator::kmalloc(DEFAULT_STACK_SIZE) : nullptr);
    800012c0:	04058863          	beqz	a1,80001310 <_Z13thread_createPP3TCBPFvPvES2_+0x78>
    800012c4:	00001537          	lui	a0,0x1
    800012c8:	00001097          	auipc	ra,0x1
    800012cc:	84c080e7          	jalr	-1972(ra) # 80001b14 <_ZN15MemoryAllocator7kmallocEm>
    800012d0:	00050313          	mv	t1,a0
	//stavljanje argumenata za sistemski poziv
	__asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800012d4:	00030713          	mv	a4,t1
	__asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800012d8:	00098693          	mv	a3,s3
	__asm__ volatile("mv a2, %[function]": :[function] "r"(
			start_routine):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800012dc:	00048613          	mv	a2,s1
	__asm__ volatile("mv a1, %[handle]": :[handle] "r"(handle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800012e0:	00090593          	mv	a1,s2
	__asm__ volatile("li a0, 0x11");
    800012e4:	01100513          	li	a0,17
	__asm__ volatile("ecall");
    800012e8:	00000073          	ecall
	//a4 = pokazivac na najnizu adresu steka (stek raste ka nizim adresama, pokazuje na poslednju zauzetu)

	scall();

	int status;
	__asm__ volatile("mv %[status], a0":[status] "=r"(status));
    800012ec:	00050513          	mv	a0,a0
	return status;
}
    800012f0:	0005051b          	sext.w	a0,a0
    800012f4:	02813083          	ld	ra,40(sp)
    800012f8:	02013403          	ld	s0,32(sp)
    800012fc:	01813483          	ld	s1,24(sp)
    80001300:	01013903          	ld	s2,16(sp)
    80001304:	00813983          	ld	s3,8(sp)
    80001308:	03010113          	addi	sp,sp,48
    8000130c:	00008067          	ret
	uint64* stack = (start_routine != nullptr ? (uint64*)MemoryAllocator::kmalloc(DEFAULT_STACK_SIZE) : nullptr);
    80001310:	00000313          	li	t1,0
    80001314:	fc1ff06f          	j	800012d4 <_Z13thread_createPP3TCBPFvPvES2_+0x3c>

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
    80001424:	fe010113          	addi	sp,sp,-32
    80001428:	00113c23          	sd	ra,24(sp)
    8000142c:	00813823          	sd	s0,16(sp)
    80001430:	00913423          	sd	s1,8(sp)
    80001434:	02010413          	addi	s0,sp,32
    80001438:	00050493          	mv	s1,a0
    while (*string != '\0') {
    8000143c:	0004c503          	lbu	a0,0(s1)
    80001440:	00050a63          	beqz	a0,80001454 <_Z11printStringPKc+0x30>
        __putc(*string);
    80001444:	00003097          	auipc	ra,0x3
    80001448:	b68080e7          	jalr	-1176(ra) # 80003fac <__putc>
        string++;
    8000144c:	00148493          	addi	s1,s1,1
    while (*string != '\0') {
    80001450:	fedff06f          	j	8000143c <_Z11printStringPKc+0x18>
    }
}
    80001454:	01813083          	ld	ra,24(sp)
    80001458:	01013403          	ld	s0,16(sp)
    8000145c:	00813483          	ld	s1,8(sp)
    80001460:	02010113          	addi	sp,sp,32
    80001464:	00008067          	ret

0000000080001468 <_Z7printlnPKc>:

void println(char const *string) {
    80001468:	ff010113          	addi	sp,sp,-16
    8000146c:	00113423          	sd	ra,8(sp)
    80001470:	00813023          	sd	s0,0(sp)
    80001474:	01010413          	addi	s0,sp,16
    printString(string);
    80001478:	00000097          	auipc	ra,0x0
    8000147c:	fac080e7          	jalr	-84(ra) # 80001424 <_Z11printStringPKc>
    __putc('\n');
    80001480:	00a00513          	li	a0,10
    80001484:	00003097          	auipc	ra,0x3
    80001488:	b28080e7          	jalr	-1240(ra) # 80003fac <__putc>
}
    8000148c:	00813083          	ld	ra,8(sp)
    80001490:	00013403          	ld	s0,0(sp)
    80001494:	01010113          	addi	sp,sp,16
    80001498:	00008067          	ret

000000008000149c <_Z12printIntegerm>:

void printInteger(uint64 integer) {
    8000149c:	fd010113          	addi	sp,sp,-48
    800014a0:	02113423          	sd	ra,40(sp)
    800014a4:	02813023          	sd	s0,32(sp)
    800014a8:	00913c23          	sd	s1,24(sp)
    800014ac:	03010413          	addi	s0,sp,48
    neg = 0;
    if (integer < 0) {
        neg = 1;
        x = -integer;
    } else {
        x = integer;
    800014b0:	0005051b          	sext.w	a0,a0
    }

    i = 0;
    800014b4:	00000493          	li	s1,0
    do {
        buf[i++] = digits[x % 10];
    800014b8:	00a00613          	li	a2,10
    800014bc:	02c5773b          	remuw	a4,a0,a2
    800014c0:	02071693          	slli	a3,a4,0x20
    800014c4:	0206d693          	srli	a3,a3,0x20
    800014c8:	00004717          	auipc	a4,0x4
    800014cc:	b5870713          	addi	a4,a4,-1192 # 80005020 <_ZZ12printIntegermE6digits>
    800014d0:	00d70733          	add	a4,a4,a3
    800014d4:	00074703          	lbu	a4,0(a4)
    800014d8:	fe040693          	addi	a3,s0,-32
    800014dc:	009687b3          	add	a5,a3,s1
    800014e0:	0014849b          	addiw	s1,s1,1
    800014e4:	fee78823          	sb	a4,-16(a5)
    } while ((x /= 10) != 0);
    800014e8:	0005071b          	sext.w	a4,a0
    800014ec:	02c5553b          	divuw	a0,a0,a2
    800014f0:	00900793          	li	a5,9
    800014f4:	fce7e2e3          	bltu	a5,a4,800014b8 <_Z12printIntegerm+0x1c>
    if (neg) buf[i++] = '-';

    while (--i >= 0) {
    800014f8:	fff4849b          	addiw	s1,s1,-1
    800014fc:	0004ce63          	bltz	s1,80001518 <_Z12printIntegerm+0x7c>
        __putc(buf[i]);
    80001500:	fe040793          	addi	a5,s0,-32
    80001504:	009787b3          	add	a5,a5,s1
    80001508:	ff07c503          	lbu	a0,-16(a5)
    8000150c:	00003097          	auipc	ra,0x3
    80001510:	aa0080e7          	jalr	-1376(ra) # 80003fac <__putc>
    80001514:	fe5ff06f          	j	800014f8 <_Z12printIntegerm+0x5c>
    }
}
    80001518:	02813083          	ld	ra,40(sp)
    8000151c:	02013403          	ld	s0,32(sp)
    80001520:	01813483          	ld	s1,24(sp)
    80001524:	03010113          	addi	sp,sp,48
    80001528:	00008067          	ret

000000008000152c <_ZN9Scheduler3putEP3TCB>:

//Scheduler* Scheduler::singleton = nullptr;
TCB* Scheduler::head = nullptr;
TCB* Scheduler::tail = nullptr;

void Scheduler::put(TCB* tcb) {
    8000152c:	ff010113          	addi	sp,sp,-16
    80001530:	00813423          	sd	s0,8(sp)
    80001534:	01010413          	addi	s0,sp,16
	if (tail == nullptr) {
    80001538:	00004797          	auipc	a5,0x4
    8000153c:	4f87b783          	ld	a5,1272(a5) # 80005a30 <_ZN9Scheduler4tailE>
    80001540:	00078e63          	beqz	a5,8000155c <_ZN9Scheduler3putEP3TCB+0x30>
		head = tail = tcb;
	} else {
		tail->nextInScheduler = tcb;
    80001544:	02a7bc23          	sd	a0,56(a5)
		tail = tcb;
    80001548:	00004797          	auipc	a5,0x4
    8000154c:	4ea7b423          	sd	a0,1256(a5) # 80005a30 <_ZN9Scheduler4tailE>
	}
}
    80001550:	00813403          	ld	s0,8(sp)
    80001554:	01010113          	addi	sp,sp,16
    80001558:	00008067          	ret
		head = tail = tcb;
    8000155c:	00004797          	auipc	a5,0x4
    80001560:	4d478793          	addi	a5,a5,1236 # 80005a30 <_ZN9Scheduler4tailE>
    80001564:	00a7b023          	sd	a0,0(a5)
    80001568:	00a7b423          	sd	a0,8(a5)
    8000156c:	fe5ff06f          	j	80001550 <_ZN9Scheduler3putEP3TCB+0x24>

0000000080001570 <_ZN9Scheduler3getEv>:

TCB* Scheduler::get() {
    80001570:	ff010113          	addi	sp,sp,-16
    80001574:	00813423          	sd	s0,8(sp)
    80001578:	01010413          	addi	s0,sp,16
	TCB* firstThread = head;
    8000157c:	00004797          	auipc	a5,0x4
    80001580:	4b478793          	addi	a5,a5,1204 # 80005a30 <_ZN9Scheduler4tailE>
    80001584:	0087b503          	ld	a0,8(a5)
	head = head->nextInScheduler;
    80001588:	03853703          	ld	a4,56(a0) # 1038 <_entry-0x7fffefc8>
    8000158c:	00e7b423          	sd	a4,8(a5)
	return firstThread;
    80001590:	00813403          	ld	s0,8(sp)
    80001594:	01010113          	addi	sp,sp,16
    80001598:	00008067          	ret

000000008000159c <_Z5nit1fPv>:
//void dispatch() {
//	__asm__ volatile ("mv %[savedPC], ra":[savedPC] "=r"(temp));
//	__asm__ volatile("mv ra, %[fAddress]": : [fAddress] "r"(&f));
//}

void nit1f(void*) {
    8000159c:	ff010113          	addi	sp,sp,-16
    800015a0:	00113423          	sd	ra,8(sp)
    800015a4:	00813023          	sd	s0,0(sp)
    800015a8:	01010413          	addi	s0,sp,16
	println("usao u nit 1");
    800015ac:	00004517          	auipc	a0,0x4
    800015b0:	a8450513          	addi	a0,a0,-1404 # 80005030 <_ZZ12printIntegermE6digits+0x10>
    800015b4:	00000097          	auipc	ra,0x0
    800015b8:	eb4080e7          	jalr	-332(ra) # 80001468 <_Z7printlnPKc>
	TCB::dispatch();
    800015bc:	00000097          	auipc	ra,0x0
    800015c0:	498080e7          	jalr	1176(ra) # 80001a54 <_ZN3TCB8dispatchEv>
	println("opet u niti 1");
    800015c4:	00004517          	auipc	a0,0x4
    800015c8:	a7c50513          	addi	a0,a0,-1412 # 80005040 <_ZZ12printIntegermE6digits+0x20>
    800015cc:	00000097          	auipc	ra,0x0
    800015d0:	e9c080e7          	jalr	-356(ra) # 80001468 <_Z7printlnPKc>
}
    800015d4:	00813083          	ld	ra,8(sp)
    800015d8:	00013403          	ld	s0,0(sp)
    800015dc:	01010113          	addi	sp,sp,16
    800015e0:	00008067          	ret

00000000800015e4 <main>:

int main() {
    800015e4:	fe010113          	addi	sp,sp,-32
    800015e8:	00113c23          	sd	ra,24(sp)
    800015ec:	00813823          	sd	s0,16(sp)
    800015f0:	02010413          	addi	s0,sp,32
inline void Riscv::ms_sstatus(uint64 mask) {
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
}

inline void Riscv::mc_sstatus(uint64 mask) {
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    800015f4:	00200793          	li	a5,2
    800015f8:	1007b073          	csrc	sstatus,a5
	//zabrani prekide
	Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
	//postavi adresu prekidne rutine u stvec
	Riscv::w_stvec((uint64)&interruptHandler);
    800015fc:	00004717          	auipc	a4,0x4
    80001600:	3e473703          	ld	a4,996(a4) # 800059e0 <_GLOBAL_OFFSET_TABLE_+0x28>
	__asm__ volatile("csrw stvec, %[stvec]": :[stvec] "r"(stvec));
    80001604:	10571073          	csrw	stvec,a4
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80001608:	1007a073          	csrs	sstatus,a5
//	println("");

	//testiranje kreiranja niti
	thread_t glavnaNit;
	thread_t nit1;
	thread_create(&glavnaNit, nullptr, nullptr);
    8000160c:	00000613          	li	a2,0
    80001610:	00000593          	li	a1,0
    80001614:	fe840513          	addi	a0,s0,-24
    80001618:	00000097          	auipc	ra,0x0
    8000161c:	c80080e7          	jalr	-896(ra) # 80001298 <_Z13thread_createPP3TCBPFvPvES2_>
	TCB::running = glavnaNit;
    80001620:	00004797          	auipc	a5,0x4
    80001624:	3b07b783          	ld	a5,944(a5) # 800059d0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80001628:	fe843703          	ld	a4,-24(s0)
    8000162c:	00e7b023          	sd	a4,0(a5)
	thread_create(&nit1, nit1f, nullptr);
    80001630:	00000613          	li	a2,0
    80001634:	00000597          	auipc	a1,0x0
    80001638:	f6858593          	addi	a1,a1,-152 # 8000159c <_Z5nit1fPv>
    8000163c:	fe040513          	addi	a0,s0,-32
    80001640:	00000097          	auipc	ra,0x0
    80001644:	c58080e7          	jalr	-936(ra) # 80001298 <_Z13thread_createPP3TCBPFvPvES2_>
	while(!nit1->isFinished()){
    80001648:	fe043783          	ld	a5,-32(s0)
	friend class Scheduler;
	using Body = void (*)(void*);

	static TCB* createThread(Body function, void* args, uint64* stack);

	bool isFinished() { return finished; }
    8000164c:	0307c783          	lbu	a5,48(a5)
    80001650:	00079863          	bnez	a5,80001660 <main+0x7c>
		glavnaNit->dispatch();
    80001654:	00000097          	auipc	ra,0x0
    80001658:	400080e7          	jalr	1024(ra) # 80001a54 <_ZN3TCB8dispatchEv>
    8000165c:	fedff06f          	j	80001648 <main+0x64>
	}
	println("");
    80001660:	00004517          	auipc	a0,0x4
    80001664:	bc050513          	addi	a0,a0,-1088 # 80005220 <_ZZ12printIntegermE6digits+0x200>
    80001668:	00000097          	auipc	ra,0x0
    8000166c:	e00080e7          	jalr	-512(ra) # 80001468 <_Z7printlnPKc>
	return 0;
    80001670:	00000513          	li	a0,0
    80001674:	01813083          	ld	ra,24(sp)
    80001678:	01013403          	ld	s0,16(sp)
    8000167c:	02010113          	addi	sp,sp,32
    80001680:	00008067          	ret

0000000080001684 <interruptRoutine>:
#include "../h/syscall_c.hpp"
#include "../h/TCB.hpp"

#pragma GCC optimize("O0")

extern "C" void interruptRoutine() {
    80001684:	f6010113          	addi	sp,sp,-160
    80001688:	08113c23          	sd	ra,152(sp)
    8000168c:	08813823          	sd	s0,144(sp)
    80001690:	0a010413          	addi	s0,sp,160
	//uint64 scause = Riscv::r_scause();
	//uint64 sepc = Riscv::r_sepc();
	uint64 scause, sepc;
	__asm__ volatile("csrr %[scause], scause":[scause] "=r"(scause): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001694:	14202373          	csrr	t1,scause
    80001698:	fe643423          	sd	t1,-24(s0)
	__asm__ volatile("csrr %[sepc], sepc":[sepc] "=r"(sepc): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000169c:	14102373          	csrr	t1,sepc
    800016a0:	fe643023          	sd	t1,-32(s0)
	uint64 a0, a1, a2, a3, a4, a5, a6, a7;
	__asm__ volatile("mv %[ax], a0":[ax] "=r"(a0): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800016a4:	00050313          	mv	t1,a0
    800016a8:	fc643c23          	sd	t1,-40(s0)
	__asm__ volatile("mv %[ax], a1":[ax] "=r"(a1): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800016ac:	00058313          	mv	t1,a1
    800016b0:	fc643823          	sd	t1,-48(s0)
	__asm__ volatile("mv %[ax], a2":[ax] "=r"(a2): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800016b4:	00060313          	mv	t1,a2
    800016b8:	fc643423          	sd	t1,-56(s0)
	__asm__ volatile("mv %[ax], a3":[ax] "=r"(a3): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800016bc:	00068313          	mv	t1,a3
    800016c0:	fc643023          	sd	t1,-64(s0)
	__asm__ volatile("mv %[ax], a4":[ax] "=r"(a4): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800016c4:	00070313          	mv	t1,a4
    800016c8:	fa643c23          	sd	t1,-72(s0)
	__asm__ volatile("mv %[ax], a5":[ax] "=r"(a5): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800016cc:	00078313          	mv	t1,a5
    800016d0:	fa643823          	sd	t1,-80(s0)
	__asm__ volatile("mv %[ax], a6":[ax] "=r"(a6): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800016d4:	00080313          	mv	t1,a6
    800016d8:	fa643423          	sd	t1,-88(s0)
	__asm__ volatile("mv %[ax], a7":[ax] "=r"(a7): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800016dc:	00088313          	mv	t1,a7
    800016e0:	fa643023          	sd	t1,-96(s0)

	if (scause == 0x09 || scause == 0x08) {
    800016e4:	fe843703          	ld	a4,-24(s0)
    800016e8:	00900793          	li	a5,9
    800016ec:	00f70863          	beq	a4,a5,800016fc <interruptRoutine+0x78>
    800016f0:	fe843703          	ld	a4,-24(s0)
    800016f4:	00800793          	li	a5,8
    800016f8:	16f71063          	bne	a4,a5,80001858 <interruptRoutine+0x1d4>
		//prekid zbog poziva ecall
		uint64 opCode = a0;
    800016fc:	fd843783          	ld	a5,-40(s0)
    80001700:	f8f43c23          	sd	a5,-104(s0)

		switch (opCode) {
    80001704:	f9843703          	ld	a4,-104(s0)
    80001708:	04200793          	li	a5,66
    8000170c:	0ce7ea63          	bltu	a5,a4,800017e0 <interruptRoutine+0x15c>
    80001710:	f9843783          	ld	a5,-104(s0)
    80001714:	00279713          	slli	a4,a5,0x2
    80001718:	00004797          	auipc	a5,0x4
    8000171c:	99478793          	addi	a5,a5,-1644 # 800050ac <_ZZ12printIntegermE6digits+0x8c>
    80001720:	00f707b3          	add	a5,a4,a5
    80001724:	0007a783          	lw	a5,0(a5)
    80001728:	0007871b          	sext.w	a4,a5
    8000172c:	00004797          	auipc	a5,0x4
    80001730:	98078793          	addi	a5,a5,-1664 # 800050ac <_ZZ12printIntegermE6digits+0x8c>
    80001734:	00f707b3          	add	a5,a4,a5
    80001738:	00078067          	jr	a5
			case 0x01:
				//mem_alloc
				size_t size;
				size = (size_t)a1;
    8000173c:	fd043783          	ld	a5,-48(s0)
    80001740:	f6f43423          	sd	a5,-152(s0)
				//__asm__ volatile("mv %[size], a1":[size] "=r"(size));
				size = size * MEM_BLOCK_SIZE;
    80001744:	f6843783          	ld	a5,-152(s0)
    80001748:	00679793          	slli	a5,a5,0x6
    8000174c:	f6f43423          	sd	a5,-152(s0)
				MemoryAllocator::kmalloc(size);
    80001750:	f6843503          	ld	a0,-152(s0)
    80001754:	00000097          	auipc	ra,0x0
    80001758:	3c0080e7          	jalr	960(ra) # 80001b14 <_ZN15MemoryAllocator7kmallocEm>
				__asm__ volatile("sd a0, 80(s0)");
    8000175c:	04a43823          	sd	a0,80(s0)
				break;
    80001760:	0dc0006f          	j	8000183c <interruptRoutine+0x1b8>
			case 0x02:
				//mem_free
				void* ptr;
				ptr = (void*)a1;
    80001764:	fd043783          	ld	a5,-48(s0)
    80001768:	f6f43823          	sd	a5,-144(s0)
				//__asm__ volatile("mv %[ptr], a1" :[ptr]"=r"(ptr));
				MemoryAllocator::kfree(ptr);
    8000176c:	f7043503          	ld	a0,-144(s0)
    80001770:	00000097          	auipc	ra,0x0
    80001774:	54c080e7          	jalr	1356(ra) # 80001cbc <_ZN15MemoryAllocator5kfreeEPv>
				__asm__ volatile("sd a0, 80(s0)");
    80001778:	04a43823          	sd	a0,80(s0)
				break;
    8000177c:	0c00006f          	j	8000183c <interruptRoutine+0x1b8>
			case 0x11:
				//thread_create
				thread_t* handle;
				handle = (thread_t*)a1;
    80001780:	fd043783          	ld	a5,-48(s0)
    80001784:	f8f43823          	sd	a5,-112(s0)
				void (* function)(void*);
				function = (void (*)(void*))a2;
    80001788:	fc843783          	ld	a5,-56(s0)
    8000178c:	f8f43423          	sd	a5,-120(s0)
				void* args;
				args = (void*)a3;
    80001790:	fc043783          	ld	a5,-64(s0)
    80001794:	f8f43023          	sd	a5,-128(s0)
				uint64* sp;
				sp = (uint64*)a4;
    80001798:	fb843783          	ld	a5,-72(s0)
    8000179c:	f6f43c23          	sd	a5,-136(s0)
//				__asm__ volatile("mv %[handle], a1":[handle]"=r"(handle));
//				__asm__ volatile("mv %[f], a2":[f]"=r"(function));
//				__asm__ volatile("mv %[args], a3":[args]"=r"(args));
//				__asm__ volatile("mv %[sp], a4":[sp]"=r"(sp));

				*handle = TCB::createThread(function, args, sp);
    800017a0:	f7843603          	ld	a2,-136(s0)
    800017a4:	f8043583          	ld	a1,-128(s0)
    800017a8:	f8843503          	ld	a0,-120(s0)
    800017ac:	00000097          	auipc	ra,0x0
    800017b0:	208080e7          	jalr	520(ra) # 800019b4 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    800017b4:	00050713          	mv	a4,a0
    800017b8:	f9043783          	ld	a5,-112(s0)
    800017bc:	00e7b023          	sd	a4,0(a5)
				if (*handle != nullptr) {
    800017c0:	f9043783          	ld	a5,-112(s0)
    800017c4:	0007b783          	ld	a5,0(a5)
    800017c8:	00078663          	beqz	a5,800017d4 <interruptRoutine+0x150>
					__asm__ volatile("li a0, 0");
    800017cc:	00000513          	li	a0,0
    800017d0:	0080006f          	j	800017d8 <interruptRoutine+0x154>
				} else {
					__asm__ volatile("li a0, -1");
    800017d4:	fff00513          	li	a0,-1
				}
				__asm__ volatile("sd a0, 80(s0)");
    800017d8:	04a43823          	sd	a0,80(s0)
				break;
    800017dc:	0600006f          	j	8000183c <interruptRoutine+0x1b8>
				break;
			case 0x42:
				//putc
				break;
			default:
				printString("\nNepostojeci op code: ");
    800017e0:	00004517          	auipc	a0,0x4
    800017e4:	87050513          	addi	a0,a0,-1936 # 80005050 <_ZZ12printIntegermE6digits+0x30>
    800017e8:	00000097          	auipc	ra,0x0
    800017ec:	c3c080e7          	jalr	-964(ra) # 80001424 <_Z11printStringPKc>
				printInteger(opCode);
    800017f0:	f9843503          	ld	a0,-104(s0)
    800017f4:	00000097          	auipc	ra,0x0
    800017f8:	ca8080e7          	jalr	-856(ra) # 8000149c <_Z12printIntegerm>
				printString("\nscause: ");
    800017fc:	00004517          	auipc	a0,0x4
    80001800:	86c50513          	addi	a0,a0,-1940 # 80005068 <_ZZ12printIntegermE6digits+0x48>
    80001804:	00000097          	auipc	ra,0x0
    80001808:	c20080e7          	jalr	-992(ra) # 80001424 <_Z11printStringPKc>
				printInteger(scause);
    8000180c:	fe843503          	ld	a0,-24(s0)
    80001810:	00000097          	auipc	ra,0x0
    80001814:	c8c080e7          	jalr	-884(ra) # 8000149c <_Z12printIntegerm>
				printString("\nsepc: ");
    80001818:	00004517          	auipc	a0,0x4
    8000181c:	86050513          	addi	a0,a0,-1952 # 80005078 <_ZZ12printIntegermE6digits+0x58>
    80001820:	00000097          	auipc	ra,0x0
    80001824:	c04080e7          	jalr	-1020(ra) # 80001424 <_Z11printStringPKc>
				printInteger(sepc);
    80001828:	fe043503          	ld	a0,-32(s0)
    8000182c:	00000097          	auipc	ra,0x0
    80001830:	c70080e7          	jalr	-912(ra) # 8000149c <_Z12printIntegerm>
				break;
    80001834:	0080006f          	j	8000183c <interruptRoutine+0x1b8>
				break;
    80001838:	00000013          	nop
		}
		//sepc pokazuje na ecall instrukciju, treba preci na sledecu instrukciju
		//sepc += 4;
		__asm__ volatile("addi %[dst], %[src], 0x4":[dst]"=r"(sepc):[src]"r"(
				sepc):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000183c:	fe043303          	ld	t1,-32(s0)
    80001840:	00430313          	addi	t1,t1,4
    80001844:	fe643023          	sd	t1,-32(s0)
		__asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001848:	fe043303          	ld	t1,-32(s0)
    8000184c:	14131073          	csrw	sepc,t1
    80001850:	00000013          	nop
		printString("scause: ");
		printInteger(scause);
		printString("\nsepc: ");
		printInteger(sepc);
	}
}
    80001854:	0900006f          	j	800018e4 <interruptRoutine+0x260>
	} else if (scause == (1UL << 63 | 9)) {
    80001858:	fe843703          	ld	a4,-24(s0)
    8000185c:	fff00793          	li	a5,-1
    80001860:	03f79793          	slli	a5,a5,0x3f
    80001864:	00978793          	addi	a5,a5,9
    80001868:	00f71863          	bne	a4,a5,80001878 <interruptRoutine+0x1f4>
		console_handler();
    8000186c:	00002097          	auipc	ra,0x2
    80001870:	7b4080e7          	jalr	1972(ra) # 80004020 <console_handler>
}
    80001874:	0700006f          	j	800018e4 <interruptRoutine+0x260>
	} else if (scause == (1UL << 63 | 1)) {
    80001878:	fe843703          	ld	a4,-24(s0)
    8000187c:	fff00793          	li	a5,-1
    80001880:	03f79793          	slli	a5,a5,0x3f
    80001884:	00178793          	addi	a5,a5,1
    80001888:	00f71a63          	bne	a4,a5,8000189c <interruptRoutine+0x218>
		Riscv::mc_sip(Riscv::SIP_SSIP);
    8000188c:	00200513          	li	a0,2
    80001890:	00000097          	auipc	ra,0x0
    80001894:	068080e7          	jalr	104(ra) # 800018f8 <_ZN5Riscv6mc_sipEm>
}
    80001898:	04c0006f          	j	800018e4 <interruptRoutine+0x260>
		println("\nGreska u prekidnoj rutini");
    8000189c:	00003517          	auipc	a0,0x3
    800018a0:	7e450513          	addi	a0,a0,2020 # 80005080 <_ZZ12printIntegermE6digits+0x60>
    800018a4:	00000097          	auipc	ra,0x0
    800018a8:	bc4080e7          	jalr	-1084(ra) # 80001468 <_Z7printlnPKc>
		printString("scause: ");
    800018ac:	00003517          	auipc	a0,0x3
    800018b0:	7f450513          	addi	a0,a0,2036 # 800050a0 <_ZZ12printIntegermE6digits+0x80>
    800018b4:	00000097          	auipc	ra,0x0
    800018b8:	b70080e7          	jalr	-1168(ra) # 80001424 <_Z11printStringPKc>
		printInteger(scause);
    800018bc:	fe843503          	ld	a0,-24(s0)
    800018c0:	00000097          	auipc	ra,0x0
    800018c4:	bdc080e7          	jalr	-1060(ra) # 8000149c <_Z12printIntegerm>
		printString("\nsepc: ");
    800018c8:	00003517          	auipc	a0,0x3
    800018cc:	7b050513          	addi	a0,a0,1968 # 80005078 <_ZZ12printIntegermE6digits+0x58>
    800018d0:	00000097          	auipc	ra,0x0
    800018d4:	b54080e7          	jalr	-1196(ra) # 80001424 <_Z11printStringPKc>
		printInteger(sepc);
    800018d8:	fe043503          	ld	a0,-32(s0)
    800018dc:	00000097          	auipc	ra,0x0
    800018e0:	bc0080e7          	jalr	-1088(ra) # 8000149c <_Z12printIntegerm>
}
    800018e4:	00000013          	nop
    800018e8:	09813083          	ld	ra,152(sp)
    800018ec:	09013403          	ld	s0,144(sp)
    800018f0:	0a010113          	addi	sp,sp,160
    800018f4:	00008067          	ret

00000000800018f8 <_ZN5Riscv6mc_sipEm>:
inline void Riscv::mc_sip(uint64 mask) {
    800018f8:	ff010113          	addi	sp,sp,-16
    800018fc:	00813423          	sd	s0,8(sp)
    80001900:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sip, %[mask]": :[mask] "r"(mask));
    80001904:	14453073          	csrc	sip,a0
}
    80001908:	00813403          	ld	s0,8(sp)
    8000190c:	01010113          	addi	sp,sp,16
    80001910:	00008067          	ret

0000000080001914 <_Znwm>:
// Created by os on 5/29/23.
//
#include "../h/syscall_cpp.hpp"

//override globalnog new
void* operator new(size_t size) {
    80001914:	ff010113          	addi	sp,sp,-16
    80001918:	00113423          	sd	ra,8(sp)
    8000191c:	00813023          	sd	s0,0(sp)
    80001920:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    80001924:	00000097          	auipc	ra,0x0
    80001928:	904080e7          	jalr	-1788(ra) # 80001228 <_Z9mem_allocm>
}
    8000192c:	00813083          	ld	ra,8(sp)
    80001930:	00013403          	ld	s0,0(sp)
    80001934:	01010113          	addi	sp,sp,16
    80001938:	00008067          	ret

000000008000193c <_Znam>:

void* operator new[](size_t size) {
    8000193c:	ff010113          	addi	sp,sp,-16
    80001940:	00113423          	sd	ra,8(sp)
    80001944:	00813023          	sd	s0,0(sp)
    80001948:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    8000194c:	00000097          	auipc	ra,0x0
    80001950:	8dc080e7          	jalr	-1828(ra) # 80001228 <_Z9mem_allocm>
}
    80001954:	00813083          	ld	ra,8(sp)
    80001958:	00013403          	ld	s0,0(sp)
    8000195c:	01010113          	addi	sp,sp,16
    80001960:	00008067          	ret

0000000080001964 <_ZdlPv>:

void operator delete(void* ptr)noexcept {
    80001964:	ff010113          	addi	sp,sp,-16
    80001968:	00113423          	sd	ra,8(sp)
    8000196c:	00813023          	sd	s0,0(sp)
    80001970:	01010413          	addi	s0,sp,16
mem_free(ptr);
    80001974:	00000097          	auipc	ra,0x0
    80001978:	8f4080e7          	jalr	-1804(ra) # 80001268 <_Z8mem_freePv>
}
    8000197c:	00813083          	ld	ra,8(sp)
    80001980:	00013403          	ld	s0,0(sp)
    80001984:	01010113          	addi	sp,sp,16
    80001988:	00008067          	ret

000000008000198c <_ZdaPv>:

void operator delete[](void* ptr)noexcept {
    8000198c:	ff010113          	addi	sp,sp,-16
    80001990:	00113423          	sd	ra,8(sp)
    80001994:	00813023          	sd	s0,0(sp)
    80001998:	01010413          	addi	s0,sp,16
mem_free(ptr);
    8000199c:	00000097          	auipc	ra,0x0
    800019a0:	8cc080e7          	jalr	-1844(ra) # 80001268 <_Z8mem_freePv>
    800019a4:	00813083          	ld	ra,8(sp)
    800019a8:	00013403          	ld	s0,0(sp)
    800019ac:	01010113          	addi	sp,sp,16
    800019b0:	00008067          	ret

00000000800019b4 <_ZN3TCB12createThreadEPFvPvES0_Pm>:
#include "../h/Scheduler.hpp"

TCB* TCB::running = nullptr;
uint64 TCB::runningTimeSlice = 0;

TCB* TCB::createThread(TCB::Body function, void* args, uint64* stack) {
    800019b4:	fd010113          	addi	sp,sp,-48
    800019b8:	02113423          	sd	ra,40(sp)
    800019bc:	02813023          	sd	s0,32(sp)
    800019c0:	00913c23          	sd	s1,24(sp)
    800019c4:	01213823          	sd	s2,16(sp)
    800019c8:	01313423          	sd	s3,8(sp)
    800019cc:	03010413          	addi	s0,sp,48
    800019d0:	00050913          	mv	s2,a0
    800019d4:	00058993          	mv	s3,a1
    800019d8:	00060493          	mv	s1,a2
	TCB* newThread = new TCB(function, args, stack);
    800019dc:	04000513          	li	a0,64
    800019e0:	00000097          	auipc	ra,0x0
    800019e4:	f34080e7          	jalr	-204(ra) # 80001914 <_Znwm>
	bool blocked;            //da li je nit blokirana
	TCB* nextInScheduler;    // pokazivac na sledecu nit u Scheduler-u

	TCB(Body function, void* args, uint64* stack) : threadFunction(function), stack(stack), args(args),
													timeSlice(DEFAULT_TIME_SLICE), finished(false), blocked(false),
													nextInScheduler(nullptr) {
    800019e8:	01253823          	sd	s2,16(a0)
    800019ec:	00953c23          	sd	s1,24(a0)
    800019f0:	03353023          	sd	s3,32(a0)
    800019f4:	00200793          	li	a5,2
    800019f8:	02f53423          	sd	a5,40(a0)
    800019fc:	02050823          	sb	zero,48(a0)
    80001a00:	020508a3          	sb	zero,49(a0)
    80001a04:	02053c23          	sd	zero,56(a0)
		//formiranje pocetnog konteksta; specijalni uslovi za main funkciju kojoj se pocetni kontekst automatski formira
		uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
    80001a08:	02090e63          	beqz	s2,80001a44 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x90>
    80001a0c:	00000797          	auipc	a5,0x0
    80001a10:	0b478793          	addi	a5,a5,180 # 80001ac0 <_ZN3TCB7wrapperEv>
		uint64 startSp = stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0;
    80001a14:	02048c63          	beqz	s1,80001a4c <_ZN3TCB12createThreadEPFvPvES0_Pm+0x98>
    80001a18:	00008637          	lui	a2,0x8
    80001a1c:	00c484b3          	add	s1,s1,a2
		this->context.ra = startRa;
    80001a20:	00f53423          	sd	a5,8(a0)
		this->context.sp = startSp;
    80001a24:	00953023          	sd	s1,0(a0)
	//Scheduler::getInstance().put(newThread);
	return newThread;
}
    80001a28:	02813083          	ld	ra,40(sp)
    80001a2c:	02013403          	ld	s0,32(sp)
    80001a30:	01813483          	ld	s1,24(sp)
    80001a34:	01013903          	ld	s2,16(sp)
    80001a38:	00813983          	ld	s3,8(sp)
    80001a3c:	03010113          	addi	sp,sp,48
    80001a40:	00008067          	ret
		uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
    80001a44:	00000793          	li	a5,0
    80001a48:	fcdff06f          	j	80001a14 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x60>
		uint64 startSp = stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0;
    80001a4c:	00000493          	li	s1,0
    80001a50:	fd1ff06f          	j	80001a20 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x6c>

0000000080001a54 <_ZN3TCB8dispatchEv>:

void TCB::dispatch() {
    80001a54:	ff010113          	addi	sp,sp,-16
    80001a58:	00113423          	sd	ra,8(sp)
    80001a5c:	00813023          	sd	s0,0(sp)
    80001a60:	01010413          	addi	s0,sp,16
	TCB* old = TCB::running;
    80001a64:	00004517          	auipc	a0,0x4
    80001a68:	fdc53503          	ld	a0,-36(a0) # 80005a40 <_ZN3TCB7runningE>
	if (!old->isFinished() && !old->isBlocked()) {
		//Scheduler::getInstance().put(old);
	}
	//TCB::running = Scheduler::getInstance().get();
	TCB::contextSwitch(&old->context, &running->context);
    80001a6c:	00050593          	mv	a1,a0
    80001a70:	fffff097          	auipc	ra,0xfffff
    80001a74:	7a4080e7          	jalr	1956(ra) # 80001214 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80001a78:	00813083          	ld	ra,8(sp)
    80001a7c:	00013403          	ld	s0,0(sp)
    80001a80:	01010113          	addi	sp,sp,16
    80001a84:	00008067          	ret

0000000080001a88 <_ZN3TCB5yieldEv>:

void TCB::yield() {
    80001a88:	ff010113          	addi	sp,sp,-16
    80001a8c:	00113423          	sd	ra,8(sp)
    80001a90:	00813023          	sd	s0,0(sp)
    80001a94:	01010413          	addi	s0,sp,16
	Riscv::pushRegisters();
    80001a98:	fffff097          	auipc	ra,0xfffff
    80001a9c:	568080e7          	jalr	1384(ra) # 80001000 <_ZN5Riscv13pushRegistersEv>
	TCB::dispatch();
    80001aa0:	00000097          	auipc	ra,0x0
    80001aa4:	fb4080e7          	jalr	-76(ra) # 80001a54 <_ZN3TCB8dispatchEv>
	Riscv::popRegisters();
    80001aa8:	fffff097          	auipc	ra,0xfffff
    80001aac:	5d4080e7          	jalr	1492(ra) # 8000107c <_ZN5Riscv12popRegistersEv>
}
    80001ab0:	00813083          	ld	ra,8(sp)
    80001ab4:	00013403          	ld	s0,0(sp)
    80001ab8:	01010113          	addi	sp,sp,16
    80001abc:	00008067          	ret

0000000080001ac0 <_ZN3TCB7wrapperEv>:

void TCB::wrapper() {
    80001ac0:	fe010113          	addi	sp,sp,-32
    80001ac4:	00113c23          	sd	ra,24(sp)
    80001ac8:	00813823          	sd	s0,16(sp)
    80001acc:	00913423          	sd	s1,8(sp)
    80001ad0:	02010413          	addi	s0,sp,32
	running->threadFunction(running->args);
    80001ad4:	00004497          	auipc	s1,0x4
    80001ad8:	f6c48493          	addi	s1,s1,-148 # 80005a40 <_ZN3TCB7runningE>
    80001adc:	0004b783          	ld	a5,0(s1)
    80001ae0:	0107b703          	ld	a4,16(a5)
    80001ae4:	0207b503          	ld	a0,32(a5)
    80001ae8:	000700e7          	jalr	a4
	running->finished = true;
    80001aec:	0004b783          	ld	a5,0(s1)
    80001af0:	00100713          	li	a4,1
    80001af4:	02e78823          	sb	a4,48(a5)
	TCB::yield();
    80001af8:	00000097          	auipc	ra,0x0
    80001afc:	f90080e7          	jalr	-112(ra) # 80001a88 <_ZN3TCB5yieldEv>
}
    80001b00:	01813083          	ld	ra,24(sp)
    80001b04:	01013403          	ld	s0,16(sp)
    80001b08:	00813483          	ld	s1,8(sp)
    80001b0c:	02010113          	addi	sp,sp,32
    80001b10:	00008067          	ret

0000000080001b14 <_ZN15MemoryAllocator7kmallocEm>:

bool MemoryAllocator::initialized = false;
MemoryAllocator::FreeMemSegment* MemoryAllocator::freeMemHead = nullptr;
MemoryAllocator::UsedMemSegment* MemoryAllocator::usedMemHead = nullptr;

void* MemoryAllocator::kmalloc(size_t size) {
    80001b14:	ff010113          	addi	sp,sp,-16
    80001b18:	00813423          	sd	s0,8(sp)
    80001b1c:	01010413          	addi	s0,sp,16
	if (size <= 0) return nullptr;
    80001b20:	12050663          	beqz	a0,80001c4c <_ZN15MemoryAllocator7kmallocEm+0x138>

	//pocetna inicijalizacija
	if (!initialized) {
    80001b24:	00004797          	auipc	a5,0x4
    80001b28:	f2c7c783          	lbu	a5,-212(a5) # 80005a50 <_ZN15MemoryAllocator11initializedE>
    80001b2c:	04079863          	bnez	a5,80001b7c <_ZN15MemoryAllocator7kmallocEm+0x68>
		freeMemHead = (FreeMemSegment*)HEAP_START_ADDR;
    80001b30:	00004617          	auipc	a2,0x4
    80001b34:	e9063603          	ld	a2,-368(a2) # 800059c0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001b38:	00063783          	ld	a5,0(a2)
    80001b3c:	00004717          	auipc	a4,0x4
    80001b40:	f1470713          	addi	a4,a4,-236 # 80005a50 <_ZN15MemoryAllocator11initializedE>
    80001b44:	00f73423          	sd	a5,8(a4)
		freeMemHead->next = nullptr;
    80001b48:	0007b023          	sd	zero,0(a5)
		freeMemHead->prev = nullptr;
    80001b4c:	00873683          	ld	a3,8(a4)
    80001b50:	0006b423          	sd	zero,8(a3)
		freeMemHead->size = (char*)HEAP_END_ADDR - (char*)HEAP_START_ADDR - sizeof(FreeMemSegment);
    80001b54:	00004797          	auipc	a5,0x4
    80001b58:	e847b783          	ld	a5,-380(a5) # 800059d8 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001b5c:	0007b783          	ld	a5,0(a5)
    80001b60:	00063603          	ld	a2,0(a2)
    80001b64:	40c787b3          	sub	a5,a5,a2
    80001b68:	fe878793          	addi	a5,a5,-24
    80001b6c:	00f6b823          	sd	a5,16(a3)
		usedMemHead = nullptr;
    80001b70:	00073823          	sd	zero,16(a4)

		initialized = true;
    80001b74:	00100793          	li	a5,1
    80001b78:	00f70023          	sb	a5,0(a4)
	}

	//alokacija uvek zaokruzena na blokove
	//size += sizeof(UsedMemSegment); ;prebaceno u mem_alloc
	size_t blocks = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
    80001b7c:	00655793          	srli	a5,a0,0x6
    80001b80:	03f57513          	andi	a0,a0,63
    80001b84:	00050463          	beqz	a0,80001b8c <_ZN15MemoryAllocator7kmallocEm+0x78>
    80001b88:	00100513          	li	a0,1
    80001b8c:	00a78533          	add	a0,a5,a0
	size = blocks * MEM_BLOCK_SIZE;
    80001b90:	00651793          	slli	a5,a0,0x6

	//trazenje slobodnog segmenta po first-fit algoritmu
	for (FreeMemSegment* current = freeMemHead; current; current = current->next) {
    80001b94:	00004517          	auipc	a0,0x4
    80001b98:	ec453503          	ld	a0,-316(a0) # 80005a58 <_ZN15MemoryAllocator11freeMemHeadE>
    80001b9c:	08050a63          	beqz	a0,80001c30 <_ZN15MemoryAllocator7kmallocEm+0x11c>
		if (current->size < size) continue;
    80001ba0:	01053703          	ld	a4,16(a0)
    80001ba4:	06f76263          	bltu	a4,a5,80001c08 <_ZN15MemoryAllocator7kmallocEm+0xf4>

		//pravljenje novog slobodnog fragmenta od ostatka fragmenta
		FreeMemSegment* remainderFree = (FreeMemSegment*)((char*)current + size);
    80001ba8:	00f506b3          	add	a3,a0,a5
		remainderFree->size = current->size - size;
    80001bac:	40f70733          	sub	a4,a4,a5
    80001bb0:	00e6b823          	sd	a4,16(a3)
		remainderFree->prev = current->prev;
    80001bb4:	00853703          	ld	a4,8(a0)
    80001bb8:	00e6b423          	sd	a4,8(a3)
		if (current->prev) current->prev->next = remainderFree;
    80001bbc:	00070463          	beqz	a4,80001bc4 <_ZN15MemoryAllocator7kmallocEm+0xb0>
    80001bc0:	00d73023          	sd	a3,0(a4)
		remainderFree->next = current->next;
    80001bc4:	00053703          	ld	a4,0(a0)
    80001bc8:	00e6b023          	sd	a4,0(a3)
		if (current->next) current->next->prev = remainderFree;
    80001bcc:	00070463          	beqz	a4,80001bd4 <_ZN15MemoryAllocator7kmallocEm+0xc0>
    80001bd0:	00d73423          	sd	a3,8(a4)
		if (freeMemHead == current) freeMemHead = remainderFree;
    80001bd4:	00004717          	auipc	a4,0x4
    80001bd8:	e8473703          	ld	a4,-380(a4) # 80005a58 <_ZN15MemoryAllocator11freeMemHeadE>
    80001bdc:	02a70a63          	beq	a4,a0,80001c10 <_ZN15MemoryAllocator7kmallocEm+0xfc>

		//ubacivanje novog fragmenta u listu zauzetih fragmenata
		UsedMemSegment* newFragment = (UsedMemSegment*)current;
		newFragment->size = size;
    80001be0:	00f53423          	sd	a5,8(a0)
		UsedMemSegment* prevUsed = nullptr;
		for (UsedMemSegment* cur = usedMemHead; cur && cur < newFragment; prevUsed = cur, cur = cur->next);
    80001be4:	00004697          	auipc	a3,0x4
    80001be8:	e7c6b683          	ld	a3,-388(a3) # 80005a60 <_ZN15MemoryAllocator11usedMemHeadE>
    80001bec:	00068793          	mv	a5,a3
		UsedMemSegment* prevUsed = nullptr;
    80001bf0:	00000713          	li	a4,0
		for (UsedMemSegment* cur = usedMemHead; cur && cur < newFragment; prevUsed = cur, cur = cur->next);
    80001bf4:	02078463          	beqz	a5,80001c1c <_ZN15MemoryAllocator7kmallocEm+0x108>
    80001bf8:	02a7f263          	bgeu	a5,a0,80001c1c <_ZN15MemoryAllocator7kmallocEm+0x108>
    80001bfc:	00078713          	mv	a4,a5
    80001c00:	0007b783          	ld	a5,0(a5)
    80001c04:	ff1ff06f          	j	80001bf4 <_ZN15MemoryAllocator7kmallocEm+0xe0>
	for (FreeMemSegment* current = freeMemHead; current; current = current->next) {
    80001c08:	00053503          	ld	a0,0(a0)
    80001c0c:	f91ff06f          	j	80001b9c <_ZN15MemoryAllocator7kmallocEm+0x88>
		if (freeMemHead == current) freeMemHead = remainderFree;
    80001c10:	00004717          	auipc	a4,0x4
    80001c14:	e4d73423          	sd	a3,-440(a4) # 80005a58 <_ZN15MemoryAllocator11freeMemHeadE>
    80001c18:	fc9ff06f          	j	80001be0 <_ZN15MemoryAllocator7kmallocEm+0xcc>
		if (!prevUsed) {
    80001c1c:	02070063          	beqz	a4,80001c3c <_ZN15MemoryAllocator7kmallocEm+0x128>
			newFragment->next = usedMemHead;
			usedMemHead = newFragment;
		} else {
			newFragment->next = prevUsed->next;
    80001c20:	00073783          	ld	a5,0(a4)
    80001c24:	00f53023          	sd	a5,0(a0)
			prevUsed->next = newFragment;
    80001c28:	00a73023          	sd	a0,0(a4)
		}
		return (char*)newFragment + sizeof(UsedMemSegment);
    80001c2c:	01050513          	addi	a0,a0,16
	}
	return nullptr;
}
    80001c30:	00813403          	ld	s0,8(sp)
    80001c34:	01010113          	addi	sp,sp,16
    80001c38:	00008067          	ret
			newFragment->next = usedMemHead;
    80001c3c:	00d53023          	sd	a3,0(a0)
			usedMemHead = newFragment;
    80001c40:	00004797          	auipc	a5,0x4
    80001c44:	e2a7b023          	sd	a0,-480(a5) # 80005a60 <_ZN15MemoryAllocator11usedMemHeadE>
    80001c48:	fe5ff06f          	j	80001c2c <_ZN15MemoryAllocator7kmallocEm+0x118>
	if (size <= 0) return nullptr;
    80001c4c:	00000513          	li	a0,0
    80001c50:	fe1ff06f          	j	80001c30 <_ZN15MemoryAllocator7kmallocEm+0x11c>

0000000080001c54 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>:
	tryToJoin(newFree);
	tryToJoin(prevFree);
	return 0;
}

int MemoryAllocator::tryToJoin(MemoryAllocator::FreeMemSegment* current) {
    80001c54:	ff010113          	addi	sp,sp,-16
    80001c58:	00813423          	sd	s0,8(sp)
    80001c5c:	01010413          	addi	s0,sp,16
	if (!current) return 0;
    80001c60:	04050663          	beqz	a0,80001cac <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x58>
	bool nextExists = current->next != nullptr;
    80001c64:	00053783          	ld	a5,0(a0)
	char* nextAddr = (char*)current + current->size;
    80001c68:	01053703          	ld	a4,16(a0)
    80001c6c:	00e506b3          	add	a3,a0,a4
	char* cnext = (char*)current->next;
	bool nextIsConnected = (nextAddr == cnext);
	if (nextExists && nextIsConnected) {
    80001c70:	04078263          	beqz	a5,80001cb4 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x60>
    80001c74:	00d78a63          	beq	a5,a3,80001c88 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x34>
		current->size += current->next->size;
		current->next = current->next->next;
		if (current->next) current->next->prev = current;
		return 1;
	} else return 0;
    80001c78:	00000513          	li	a0,0
}
    80001c7c:	00813403          	ld	s0,8(sp)
    80001c80:	01010113          	addi	sp,sp,16
    80001c84:	00008067          	ret
		current->size += current->next->size;
    80001c88:	0107b683          	ld	a3,16(a5)
    80001c8c:	00d70733          	add	a4,a4,a3
    80001c90:	00e53823          	sd	a4,16(a0)
		current->next = current->next->next;
    80001c94:	0007b783          	ld	a5,0(a5)
    80001c98:	00f53023          	sd	a5,0(a0)
		if (current->next) current->next->prev = current;
    80001c9c:	00078463          	beqz	a5,80001ca4 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x50>
    80001ca0:	00a7b423          	sd	a0,8(a5)
		return 1;
    80001ca4:	00100513          	li	a0,1
    80001ca8:	fd5ff06f          	j	80001c7c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>
	if (!current) return 0;
    80001cac:	00000513          	li	a0,0
    80001cb0:	fcdff06f          	j	80001c7c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>
	} else return 0;
    80001cb4:	00000513          	li	a0,0
    80001cb8:	fc5ff06f          	j	80001c7c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>

0000000080001cbc <_ZN15MemoryAllocator5kfreeEPv>:
	if (!ptr) return 0;
    80001cbc:	10050463          	beqz	a0,80001dc4 <_ZN15MemoryAllocator5kfreeEPv+0x108>
    80001cc0:	00050693          	mv	a3,a0
	if (!usedMemHead) return -1;
    80001cc4:	00004797          	auipc	a5,0x4
    80001cc8:	d9c7b783          	ld	a5,-612(a5) # 80005a60 <_ZN15MemoryAllocator11usedMemHeadE>
    80001ccc:	10078063          	beqz	a5,80001dcc <_ZN15MemoryAllocator5kfreeEPv+0x110>
	ptr = (char*)ptr - sizeof(UsedMemSegment);
    80001cd0:	ff050513          	addi	a0,a0,-16
	UsedMemSegment* prevUsed = nullptr;
    80001cd4:	00000713          	li	a4,0
	for (; currentUsed && currentUsed != ptr; prevUsed = currentUsed, currentUsed = currentUsed->next);
    80001cd8:	00078a63          	beqz	a5,80001cec <_ZN15MemoryAllocator5kfreeEPv+0x30>
    80001cdc:	00a78863          	beq	a5,a0,80001cec <_ZN15MemoryAllocator5kfreeEPv+0x30>
    80001ce0:	00078713          	mv	a4,a5
    80001ce4:	0007b783          	ld	a5,0(a5)
    80001ce8:	ff1ff06f          	j	80001cd8 <_ZN15MemoryAllocator5kfreeEPv+0x1c>
	if (currentUsed != ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    80001cec:	0ea79463          	bne	a5,a0,80001dd4 <_ZN15MemoryAllocator5kfreeEPv+0x118>
int MemoryAllocator::kfree(void* ptr) {
    80001cf0:	fe010113          	addi	sp,sp,-32
    80001cf4:	00113c23          	sd	ra,24(sp)
    80001cf8:	00813823          	sd	s0,16(sp)
    80001cfc:	00913423          	sd	s1,8(sp)
    80001d00:	02010413          	addi	s0,sp,32
	if (prevUsed) prevUsed->next = currentUsed->next;
    80001d04:	02070863          	beqz	a4,80001d34 <_ZN15MemoryAllocator5kfreeEPv+0x78>
    80001d08:	0007b783          	ld	a5,0(a5)
    80001d0c:	00f73023          	sd	a5,0(a4)
	if (!freeMemHead || ptr < (char*)freeMemHead) {
    80001d10:	00004797          	auipc	a5,0x4
    80001d14:	d487b783          	ld	a5,-696(a5) # 80005a58 <_ZN15MemoryAllocator11freeMemHeadE>
    80001d18:	02078663          	beqz	a5,80001d44 <_ZN15MemoryAllocator5kfreeEPv+0x88>
    80001d1c:	02f56863          	bltu	a0,a5,80001d4c <_ZN15MemoryAllocator5kfreeEPv+0x90>
			 prevFree->next != nullptr && ptr > (char*)(prevFree->next); prevFree = prevFree->next);
    80001d20:	00078493          	mv	s1,a5
    80001d24:	0007b783          	ld	a5,0(a5)
    80001d28:	02078463          	beqz	a5,80001d50 <_ZN15MemoryAllocator5kfreeEPv+0x94>
    80001d2c:	fea7eae3          	bltu	a5,a0,80001d20 <_ZN15MemoryAllocator5kfreeEPv+0x64>
    80001d30:	0200006f          	j	80001d50 <_ZN15MemoryAllocator5kfreeEPv+0x94>
	else usedMemHead = currentUsed->next;
    80001d34:	0007b783          	ld	a5,0(a5)
    80001d38:	00004717          	auipc	a4,0x4
    80001d3c:	d2f73423          	sd	a5,-728(a4) # 80005a60 <_ZN15MemoryAllocator11usedMemHeadE>
    80001d40:	fd1ff06f          	j	80001d10 <_ZN15MemoryAllocator5kfreeEPv+0x54>
		prevFree = nullptr;
    80001d44:	00078493          	mv	s1,a5
    80001d48:	0080006f          	j	80001d50 <_ZN15MemoryAllocator5kfreeEPv+0x94>
    80001d4c:	00000493          	li	s1,0
	size_t segmentSize = ((UsedMemSegment*)ptr)->size;
    80001d50:	ff86b783          	ld	a5,-8(a3)
	newFree->size = segmentSize;
    80001d54:	00f6b023          	sd	a5,0(a3)
	newFree->prev = prevFree;
    80001d58:	fe96bc23          	sd	s1,-8(a3)
	if (prevFree) newFree->next = prevFree->next;
    80001d5c:	04048663          	beqz	s1,80001da8 <_ZN15MemoryAllocator5kfreeEPv+0xec>
    80001d60:	0004b783          	ld	a5,0(s1)
    80001d64:	fef6b823          	sd	a5,-16(a3)
	if (newFree->next) newFree->next->prev = newFree;
    80001d68:	ff06b783          	ld	a5,-16(a3)
    80001d6c:	00078463          	beqz	a5,80001d74 <_ZN15MemoryAllocator5kfreeEPv+0xb8>
    80001d70:	00a7b423          	sd	a0,8(a5)
	if (prevFree) prevFree->next = newFree;
    80001d74:	04048263          	beqz	s1,80001db8 <_ZN15MemoryAllocator5kfreeEPv+0xfc>
    80001d78:	00a4b023          	sd	a0,0(s1)
	tryToJoin(newFree);
    80001d7c:	00000097          	auipc	ra,0x0
    80001d80:	ed8080e7          	jalr	-296(ra) # 80001c54 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
	tryToJoin(prevFree);
    80001d84:	00048513          	mv	a0,s1
    80001d88:	00000097          	auipc	ra,0x0
    80001d8c:	ecc080e7          	jalr	-308(ra) # 80001c54 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
	return 0;
    80001d90:	00000513          	li	a0,0
}
    80001d94:	01813083          	ld	ra,24(sp)
    80001d98:	01013403          	ld	s0,16(sp)
    80001d9c:	00813483          	ld	s1,8(sp)
    80001da0:	02010113          	addi	sp,sp,32
    80001da4:	00008067          	ret
	else newFree->next = freeMemHead;
    80001da8:	00004797          	auipc	a5,0x4
    80001dac:	cb07b783          	ld	a5,-848(a5) # 80005a58 <_ZN15MemoryAllocator11freeMemHeadE>
    80001db0:	fef6b823          	sd	a5,-16(a3)
    80001db4:	fb5ff06f          	j	80001d68 <_ZN15MemoryAllocator5kfreeEPv+0xac>
	else freeMemHead = newFree;
    80001db8:	00004797          	auipc	a5,0x4
    80001dbc:	caa7b023          	sd	a0,-864(a5) # 80005a58 <_ZN15MemoryAllocator11freeMemHeadE>
    80001dc0:	fbdff06f          	j	80001d7c <_ZN15MemoryAllocator5kfreeEPv+0xc0>
	if (!ptr) return 0;
    80001dc4:	00000513          	li	a0,0
    80001dc8:	00008067          	ret
	if (!usedMemHead) return -1;
    80001dcc:	fff00513          	li	a0,-1
    80001dd0:	00008067          	ret
	if (currentUsed != ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    80001dd4:	fff00513          	li	a0,-1
}
    80001dd8:	00008067          	ret

0000000080001ddc <_Z10testMemoryv>:
// Created by os on 5/29/23.
//
#include "../h/MemoryAllocator.hpp"
#include "../h/helper.hpp"

void testMemory() {
    80001ddc:	81010113          	addi	sp,sp,-2032
    80001de0:	7e113423          	sd	ra,2024(sp)
    80001de4:	7e813023          	sd	s0,2016(sp)
    80001de8:	7c913c23          	sd	s1,2008(sp)
    80001dec:	7f010413          	addi	s0,sp,2032
    80001df0:	83010113          	addi	sp,sp,-2000
	const uint64 NumAllocations = 500;    //zasto nece za preko 500????
	const uint64 AllocationSize = 16;

	// Allocate and initialize pointers
	int* allocations[NumAllocations];
	for (uint64 i = 0; i < NumAllocations; ++i)
    80001df4:	00000713          	li	a4,0
    80001df8:	1f300793          	li	a5,499
    80001dfc:	02e7e263          	bltu	a5,a4,80001e20 <_Z10testMemoryv+0x44>
		allocations[i] = nullptr;
    80001e00:	fffff7b7          	lui	a5,0xfffff
    80001e04:	00371693          	slli	a3,a4,0x3
    80001e08:	fe040613          	addi	a2,s0,-32
    80001e0c:	00f607b3          	add	a5,a2,a5
    80001e10:	00d787b3          	add	a5,a5,a3
    80001e14:	0607b023          	sd	zero,96(a5) # fffffffffffff060 <end+0xffffffff7fff8390>
	for (uint64 i = 0; i < NumAllocations; ++i)
    80001e18:	00170713          	addi	a4,a4,1
    80001e1c:	fddff06f          	j	80001df8 <_Z10testMemoryv+0x1c>

	// Allocate memory
	for (uint64 i = 0; i < NumAllocations; ++i) {
    80001e20:	00000493          	li	s1,0
    80001e24:	1f300793          	li	a5,499
    80001e28:	0497e863          	bltu	a5,s1,80001e78 <_Z10testMemoryv+0x9c>
		allocations[i] = static_cast<int*>(MemoryAllocator::kmalloc(AllocationSize));
    80001e2c:	01000513          	li	a0,16
    80001e30:	00000097          	auipc	ra,0x0
    80001e34:	ce4080e7          	jalr	-796(ra) # 80001b14 <_ZN15MemoryAllocator7kmallocEm>
    80001e38:	fffff737          	lui	a4,0xfffff
    80001e3c:	00349793          	slli	a5,s1,0x3
    80001e40:	fe040693          	addi	a3,s0,-32
    80001e44:	00e68733          	add	a4,a3,a4
    80001e48:	00f707b3          	add	a5,a4,a5
    80001e4c:	06a7b023          	sd	a0,96(a5)
		if (allocations[i] == nullptr) {
    80001e50:	00050663          	beqz	a0,80001e5c <_Z10testMemoryv+0x80>
	for (uint64 i = 0; i < NumAllocations; ++i) {
    80001e54:	00148493          	addi	s1,s1,1
    80001e58:	fcdff06f          	j	80001e24 <_Z10testMemoryv+0x48>
			printString("\nAllocation failed for index ");
    80001e5c:	00003517          	auipc	a0,0x3
    80001e60:	35c50513          	addi	a0,a0,860 # 800051b8 <_ZZ12printIntegermE6digits+0x198>
    80001e64:	fffff097          	auipc	ra,0xfffff
    80001e68:	5c0080e7          	jalr	1472(ra) # 80001424 <_Z11printStringPKc>
			printInteger(i);
    80001e6c:	00048513          	mv	a0,s1
    80001e70:	fffff097          	auipc	ra,0xfffff
    80001e74:	62c080e7          	jalr	1580(ra) # 8000149c <_Z12printIntegerm>
	for (uint64 i = 0; i < NumAllocations; ++i) {
    80001e78:	00000493          	li	s1,0
    80001e7c:	0240006f          	j	80001ea0 <_Z10testMemoryv+0xc4>

	// Free memory
	for (uint64 i = 0; i < NumAllocations; ++i) {
		if (allocations[i] != nullptr) {
			if (MemoryAllocator::kfree(allocations[i]) != 0) {
				printString("\nDeallocation failed for index ");
    80001e80:	00003517          	auipc	a0,0x3
    80001e84:	35850513          	addi	a0,a0,856 # 800051d8 <_ZZ12printIntegermE6digits+0x1b8>
    80001e88:	fffff097          	auipc	ra,0xfffff
    80001e8c:	59c080e7          	jalr	1436(ra) # 80001424 <_Z11printStringPKc>
				printInteger(i);
    80001e90:	00048513          	mv	a0,s1
    80001e94:	fffff097          	auipc	ra,0xfffff
    80001e98:	608080e7          	jalr	1544(ra) # 8000149c <_Z12printIntegerm>
	for (uint64 i = 0; i < NumAllocations; ++i) {
    80001e9c:	00148493          	addi	s1,s1,1
    80001ea0:	1f300793          	li	a5,499
    80001ea4:	0297e863          	bltu	a5,s1,80001ed4 <_Z10testMemoryv+0xf8>
		if (allocations[i] != nullptr) {
    80001ea8:	fffff737          	lui	a4,0xfffff
    80001eac:	00349793          	slli	a5,s1,0x3
    80001eb0:	fe040693          	addi	a3,s0,-32
    80001eb4:	00e68733          	add	a4,a3,a4
    80001eb8:	00f707b3          	add	a5,a4,a5
    80001ebc:	0607b503          	ld	a0,96(a5)
    80001ec0:	fc050ee3          	beqz	a0,80001e9c <_Z10testMemoryv+0xc0>
			if (MemoryAllocator::kfree(allocations[i]) != 0) {
    80001ec4:	00000097          	auipc	ra,0x0
    80001ec8:	df8080e7          	jalr	-520(ra) # 80001cbc <_ZN15MemoryAllocator5kfreeEPv>
    80001ecc:	fc0508e3          	beqz	a0,80001e9c <_Z10testMemoryv+0xc0>
    80001ed0:	fb1ff06f          	j	80001e80 <_Z10testMemoryv+0xa4>
			}
		}
	}
    80001ed4:	7d010113          	addi	sp,sp,2000
    80001ed8:	7e813083          	ld	ra,2024(sp)
    80001edc:	7e013403          	ld	s0,2016(sp)
    80001ee0:	7d813483          	ld	s1,2008(sp)
    80001ee4:	7f010113          	addi	sp,sp,2032
    80001ee8:	00008067          	ret

0000000080001eec <start>:
    80001eec:	ff010113          	addi	sp,sp,-16
    80001ef0:	00813423          	sd	s0,8(sp)
    80001ef4:	01010413          	addi	s0,sp,16
    80001ef8:	300027f3          	csrr	a5,mstatus
    80001efc:	ffffe737          	lui	a4,0xffffe
    80001f00:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff7b2f>
    80001f04:	00e7f7b3          	and	a5,a5,a4
    80001f08:	00001737          	lui	a4,0x1
    80001f0c:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80001f10:	00e7e7b3          	or	a5,a5,a4
    80001f14:	30079073          	csrw	mstatus,a5
    80001f18:	00000797          	auipc	a5,0x0
    80001f1c:	16078793          	addi	a5,a5,352 # 80002078 <system_main>
    80001f20:	34179073          	csrw	mepc,a5
    80001f24:	00000793          	li	a5,0
    80001f28:	18079073          	csrw	satp,a5
    80001f2c:	000107b7          	lui	a5,0x10
    80001f30:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80001f34:	30279073          	csrw	medeleg,a5
    80001f38:	30379073          	csrw	mideleg,a5
    80001f3c:	104027f3          	csrr	a5,sie
    80001f40:	2227e793          	ori	a5,a5,546
    80001f44:	10479073          	csrw	sie,a5
    80001f48:	fff00793          	li	a5,-1
    80001f4c:	00a7d793          	srli	a5,a5,0xa
    80001f50:	3b079073          	csrw	pmpaddr0,a5
    80001f54:	00f00793          	li	a5,15
    80001f58:	3a079073          	csrw	pmpcfg0,a5
    80001f5c:	f14027f3          	csrr	a5,mhartid
    80001f60:	0200c737          	lui	a4,0x200c
    80001f64:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80001f68:	0007869b          	sext.w	a3,a5
    80001f6c:	00269713          	slli	a4,a3,0x2
    80001f70:	000f4637          	lui	a2,0xf4
    80001f74:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80001f78:	00d70733          	add	a4,a4,a3
    80001f7c:	0037979b          	slliw	a5,a5,0x3
    80001f80:	020046b7          	lui	a3,0x2004
    80001f84:	00d787b3          	add	a5,a5,a3
    80001f88:	00c585b3          	add	a1,a1,a2
    80001f8c:	00371693          	slli	a3,a4,0x3
    80001f90:	00004717          	auipc	a4,0x4
    80001f94:	ae070713          	addi	a4,a4,-1312 # 80005a70 <timer_scratch>
    80001f98:	00b7b023          	sd	a1,0(a5)
    80001f9c:	00d70733          	add	a4,a4,a3
    80001fa0:	00f73c23          	sd	a5,24(a4)
    80001fa4:	02c73023          	sd	a2,32(a4)
    80001fa8:	34071073          	csrw	mscratch,a4
    80001fac:	00000797          	auipc	a5,0x0
    80001fb0:	6e478793          	addi	a5,a5,1764 # 80002690 <timervec>
    80001fb4:	30579073          	csrw	mtvec,a5
    80001fb8:	300027f3          	csrr	a5,mstatus
    80001fbc:	0087e793          	ori	a5,a5,8
    80001fc0:	30079073          	csrw	mstatus,a5
    80001fc4:	304027f3          	csrr	a5,mie
    80001fc8:	0807e793          	ori	a5,a5,128
    80001fcc:	30479073          	csrw	mie,a5
    80001fd0:	f14027f3          	csrr	a5,mhartid
    80001fd4:	0007879b          	sext.w	a5,a5
    80001fd8:	00078213          	mv	tp,a5
    80001fdc:	30200073          	mret
    80001fe0:	00813403          	ld	s0,8(sp)
    80001fe4:	01010113          	addi	sp,sp,16
    80001fe8:	00008067          	ret

0000000080001fec <timerinit>:
    80001fec:	ff010113          	addi	sp,sp,-16
    80001ff0:	00813423          	sd	s0,8(sp)
    80001ff4:	01010413          	addi	s0,sp,16
    80001ff8:	f14027f3          	csrr	a5,mhartid
    80001ffc:	0200c737          	lui	a4,0x200c
    80002000:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80002004:	0007869b          	sext.w	a3,a5
    80002008:	00269713          	slli	a4,a3,0x2
    8000200c:	000f4637          	lui	a2,0xf4
    80002010:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80002014:	00d70733          	add	a4,a4,a3
    80002018:	0037979b          	slliw	a5,a5,0x3
    8000201c:	020046b7          	lui	a3,0x2004
    80002020:	00d787b3          	add	a5,a5,a3
    80002024:	00c585b3          	add	a1,a1,a2
    80002028:	00371693          	slli	a3,a4,0x3
    8000202c:	00004717          	auipc	a4,0x4
    80002030:	a4470713          	addi	a4,a4,-1468 # 80005a70 <timer_scratch>
    80002034:	00b7b023          	sd	a1,0(a5)
    80002038:	00d70733          	add	a4,a4,a3
    8000203c:	00f73c23          	sd	a5,24(a4)
    80002040:	02c73023          	sd	a2,32(a4)
    80002044:	34071073          	csrw	mscratch,a4
    80002048:	00000797          	auipc	a5,0x0
    8000204c:	64878793          	addi	a5,a5,1608 # 80002690 <timervec>
    80002050:	30579073          	csrw	mtvec,a5
    80002054:	300027f3          	csrr	a5,mstatus
    80002058:	0087e793          	ori	a5,a5,8
    8000205c:	30079073          	csrw	mstatus,a5
    80002060:	304027f3          	csrr	a5,mie
    80002064:	0807e793          	ori	a5,a5,128
    80002068:	30479073          	csrw	mie,a5
    8000206c:	00813403          	ld	s0,8(sp)
    80002070:	01010113          	addi	sp,sp,16
    80002074:	00008067          	ret

0000000080002078 <system_main>:
    80002078:	fe010113          	addi	sp,sp,-32
    8000207c:	00813823          	sd	s0,16(sp)
    80002080:	00913423          	sd	s1,8(sp)
    80002084:	00113c23          	sd	ra,24(sp)
    80002088:	02010413          	addi	s0,sp,32
    8000208c:	00000097          	auipc	ra,0x0
    80002090:	0c4080e7          	jalr	196(ra) # 80002150 <cpuid>
    80002094:	00004497          	auipc	s1,0x4
    80002098:	96c48493          	addi	s1,s1,-1684 # 80005a00 <started>
    8000209c:	02050263          	beqz	a0,800020c0 <system_main+0x48>
    800020a0:	0004a783          	lw	a5,0(s1)
    800020a4:	0007879b          	sext.w	a5,a5
    800020a8:	fe078ce3          	beqz	a5,800020a0 <system_main+0x28>
    800020ac:	0ff0000f          	fence
    800020b0:	00003517          	auipc	a0,0x3
    800020b4:	17850513          	addi	a0,a0,376 # 80005228 <_ZZ12printIntegermE6digits+0x208>
    800020b8:	00001097          	auipc	ra,0x1
    800020bc:	a74080e7          	jalr	-1420(ra) # 80002b2c <panic>
    800020c0:	00001097          	auipc	ra,0x1
    800020c4:	9c8080e7          	jalr	-1592(ra) # 80002a88 <consoleinit>
    800020c8:	00001097          	auipc	ra,0x1
    800020cc:	154080e7          	jalr	340(ra) # 8000321c <printfinit>
    800020d0:	00003517          	auipc	a0,0x3
    800020d4:	23850513          	addi	a0,a0,568 # 80005308 <_ZZ12printIntegermE6digits+0x2e8>
    800020d8:	00001097          	auipc	ra,0x1
    800020dc:	ab0080e7          	jalr	-1360(ra) # 80002b88 <__printf>
    800020e0:	00003517          	auipc	a0,0x3
    800020e4:	11850513          	addi	a0,a0,280 # 800051f8 <_ZZ12printIntegermE6digits+0x1d8>
    800020e8:	00001097          	auipc	ra,0x1
    800020ec:	aa0080e7          	jalr	-1376(ra) # 80002b88 <__printf>
    800020f0:	00003517          	auipc	a0,0x3
    800020f4:	21850513          	addi	a0,a0,536 # 80005308 <_ZZ12printIntegermE6digits+0x2e8>
    800020f8:	00001097          	auipc	ra,0x1
    800020fc:	a90080e7          	jalr	-1392(ra) # 80002b88 <__printf>
    80002100:	00001097          	auipc	ra,0x1
    80002104:	4a8080e7          	jalr	1192(ra) # 800035a8 <kinit>
    80002108:	00000097          	auipc	ra,0x0
    8000210c:	148080e7          	jalr	328(ra) # 80002250 <trapinit>
    80002110:	00000097          	auipc	ra,0x0
    80002114:	16c080e7          	jalr	364(ra) # 8000227c <trapinithart>
    80002118:	00000097          	auipc	ra,0x0
    8000211c:	5b8080e7          	jalr	1464(ra) # 800026d0 <plicinit>
    80002120:	00000097          	auipc	ra,0x0
    80002124:	5d8080e7          	jalr	1496(ra) # 800026f8 <plicinithart>
    80002128:	00000097          	auipc	ra,0x0
    8000212c:	078080e7          	jalr	120(ra) # 800021a0 <userinit>
    80002130:	0ff0000f          	fence
    80002134:	00100793          	li	a5,1
    80002138:	00003517          	auipc	a0,0x3
    8000213c:	0d850513          	addi	a0,a0,216 # 80005210 <_ZZ12printIntegermE6digits+0x1f0>
    80002140:	00f4a023          	sw	a5,0(s1)
    80002144:	00001097          	auipc	ra,0x1
    80002148:	a44080e7          	jalr	-1468(ra) # 80002b88 <__printf>
    8000214c:	0000006f          	j	8000214c <system_main+0xd4>

0000000080002150 <cpuid>:
    80002150:	ff010113          	addi	sp,sp,-16
    80002154:	00813423          	sd	s0,8(sp)
    80002158:	01010413          	addi	s0,sp,16
    8000215c:	00020513          	mv	a0,tp
    80002160:	00813403          	ld	s0,8(sp)
    80002164:	0005051b          	sext.w	a0,a0
    80002168:	01010113          	addi	sp,sp,16
    8000216c:	00008067          	ret

0000000080002170 <mycpu>:
    80002170:	ff010113          	addi	sp,sp,-16
    80002174:	00813423          	sd	s0,8(sp)
    80002178:	01010413          	addi	s0,sp,16
    8000217c:	00020793          	mv	a5,tp
    80002180:	00813403          	ld	s0,8(sp)
    80002184:	0007879b          	sext.w	a5,a5
    80002188:	00779793          	slli	a5,a5,0x7
    8000218c:	00005517          	auipc	a0,0x5
    80002190:	91450513          	addi	a0,a0,-1772 # 80006aa0 <cpus>
    80002194:	00f50533          	add	a0,a0,a5
    80002198:	01010113          	addi	sp,sp,16
    8000219c:	00008067          	ret

00000000800021a0 <userinit>:
    800021a0:	ff010113          	addi	sp,sp,-16
    800021a4:	00813423          	sd	s0,8(sp)
    800021a8:	01010413          	addi	s0,sp,16
    800021ac:	00813403          	ld	s0,8(sp)
    800021b0:	01010113          	addi	sp,sp,16
    800021b4:	fffff317          	auipc	t1,0xfffff
    800021b8:	43030067          	jr	1072(t1) # 800015e4 <main>

00000000800021bc <either_copyout>:
    800021bc:	ff010113          	addi	sp,sp,-16
    800021c0:	00813023          	sd	s0,0(sp)
    800021c4:	00113423          	sd	ra,8(sp)
    800021c8:	01010413          	addi	s0,sp,16
    800021cc:	02051663          	bnez	a0,800021f8 <either_copyout+0x3c>
    800021d0:	00058513          	mv	a0,a1
    800021d4:	00060593          	mv	a1,a2
    800021d8:	0006861b          	sext.w	a2,a3
    800021dc:	00002097          	auipc	ra,0x2
    800021e0:	c58080e7          	jalr	-936(ra) # 80003e34 <__memmove>
    800021e4:	00813083          	ld	ra,8(sp)
    800021e8:	00013403          	ld	s0,0(sp)
    800021ec:	00000513          	li	a0,0
    800021f0:	01010113          	addi	sp,sp,16
    800021f4:	00008067          	ret
    800021f8:	00003517          	auipc	a0,0x3
    800021fc:	05850513          	addi	a0,a0,88 # 80005250 <_ZZ12printIntegermE6digits+0x230>
    80002200:	00001097          	auipc	ra,0x1
    80002204:	92c080e7          	jalr	-1748(ra) # 80002b2c <panic>

0000000080002208 <either_copyin>:
    80002208:	ff010113          	addi	sp,sp,-16
    8000220c:	00813023          	sd	s0,0(sp)
    80002210:	00113423          	sd	ra,8(sp)
    80002214:	01010413          	addi	s0,sp,16
    80002218:	02059463          	bnez	a1,80002240 <either_copyin+0x38>
    8000221c:	00060593          	mv	a1,a2
    80002220:	0006861b          	sext.w	a2,a3
    80002224:	00002097          	auipc	ra,0x2
    80002228:	c10080e7          	jalr	-1008(ra) # 80003e34 <__memmove>
    8000222c:	00813083          	ld	ra,8(sp)
    80002230:	00013403          	ld	s0,0(sp)
    80002234:	00000513          	li	a0,0
    80002238:	01010113          	addi	sp,sp,16
    8000223c:	00008067          	ret
    80002240:	00003517          	auipc	a0,0x3
    80002244:	03850513          	addi	a0,a0,56 # 80005278 <_ZZ12printIntegermE6digits+0x258>
    80002248:	00001097          	auipc	ra,0x1
    8000224c:	8e4080e7          	jalr	-1820(ra) # 80002b2c <panic>

0000000080002250 <trapinit>:
    80002250:	ff010113          	addi	sp,sp,-16
    80002254:	00813423          	sd	s0,8(sp)
    80002258:	01010413          	addi	s0,sp,16
    8000225c:	00813403          	ld	s0,8(sp)
    80002260:	00003597          	auipc	a1,0x3
    80002264:	04058593          	addi	a1,a1,64 # 800052a0 <_ZZ12printIntegermE6digits+0x280>
    80002268:	00005517          	auipc	a0,0x5
    8000226c:	8b850513          	addi	a0,a0,-1864 # 80006b20 <tickslock>
    80002270:	01010113          	addi	sp,sp,16
    80002274:	00001317          	auipc	t1,0x1
    80002278:	5c430067          	jr	1476(t1) # 80003838 <initlock>

000000008000227c <trapinithart>:
    8000227c:	ff010113          	addi	sp,sp,-16
    80002280:	00813423          	sd	s0,8(sp)
    80002284:	01010413          	addi	s0,sp,16
    80002288:	00000797          	auipc	a5,0x0
    8000228c:	2f878793          	addi	a5,a5,760 # 80002580 <kernelvec>
    80002290:	10579073          	csrw	stvec,a5
    80002294:	00813403          	ld	s0,8(sp)
    80002298:	01010113          	addi	sp,sp,16
    8000229c:	00008067          	ret

00000000800022a0 <usertrap>:
    800022a0:	ff010113          	addi	sp,sp,-16
    800022a4:	00813423          	sd	s0,8(sp)
    800022a8:	01010413          	addi	s0,sp,16
    800022ac:	00813403          	ld	s0,8(sp)
    800022b0:	01010113          	addi	sp,sp,16
    800022b4:	00008067          	ret

00000000800022b8 <usertrapret>:
    800022b8:	ff010113          	addi	sp,sp,-16
    800022bc:	00813423          	sd	s0,8(sp)
    800022c0:	01010413          	addi	s0,sp,16
    800022c4:	00813403          	ld	s0,8(sp)
    800022c8:	01010113          	addi	sp,sp,16
    800022cc:	00008067          	ret

00000000800022d0 <kerneltrap>:
    800022d0:	fe010113          	addi	sp,sp,-32
    800022d4:	00813823          	sd	s0,16(sp)
    800022d8:	00113c23          	sd	ra,24(sp)
    800022dc:	00913423          	sd	s1,8(sp)
    800022e0:	02010413          	addi	s0,sp,32
    800022e4:	142025f3          	csrr	a1,scause
    800022e8:	100027f3          	csrr	a5,sstatus
    800022ec:	0027f793          	andi	a5,a5,2
    800022f0:	10079c63          	bnez	a5,80002408 <kerneltrap+0x138>
    800022f4:	142027f3          	csrr	a5,scause
    800022f8:	0207ce63          	bltz	a5,80002334 <kerneltrap+0x64>
    800022fc:	00003517          	auipc	a0,0x3
    80002300:	fec50513          	addi	a0,a0,-20 # 800052e8 <_ZZ12printIntegermE6digits+0x2c8>
    80002304:	00001097          	auipc	ra,0x1
    80002308:	884080e7          	jalr	-1916(ra) # 80002b88 <__printf>
    8000230c:	141025f3          	csrr	a1,sepc
    80002310:	14302673          	csrr	a2,stval
    80002314:	00003517          	auipc	a0,0x3
    80002318:	fe450513          	addi	a0,a0,-28 # 800052f8 <_ZZ12printIntegermE6digits+0x2d8>
    8000231c:	00001097          	auipc	ra,0x1
    80002320:	86c080e7          	jalr	-1940(ra) # 80002b88 <__printf>
    80002324:	00003517          	auipc	a0,0x3
    80002328:	fec50513          	addi	a0,a0,-20 # 80005310 <_ZZ12printIntegermE6digits+0x2f0>
    8000232c:	00001097          	auipc	ra,0x1
    80002330:	800080e7          	jalr	-2048(ra) # 80002b2c <panic>
    80002334:	0ff7f713          	andi	a4,a5,255
    80002338:	00900693          	li	a3,9
    8000233c:	04d70063          	beq	a4,a3,8000237c <kerneltrap+0xac>
    80002340:	fff00713          	li	a4,-1
    80002344:	03f71713          	slli	a4,a4,0x3f
    80002348:	00170713          	addi	a4,a4,1
    8000234c:	fae798e3          	bne	a5,a4,800022fc <kerneltrap+0x2c>
    80002350:	00000097          	auipc	ra,0x0
    80002354:	e00080e7          	jalr	-512(ra) # 80002150 <cpuid>
    80002358:	06050663          	beqz	a0,800023c4 <kerneltrap+0xf4>
    8000235c:	144027f3          	csrr	a5,sip
    80002360:	ffd7f793          	andi	a5,a5,-3
    80002364:	14479073          	csrw	sip,a5
    80002368:	01813083          	ld	ra,24(sp)
    8000236c:	01013403          	ld	s0,16(sp)
    80002370:	00813483          	ld	s1,8(sp)
    80002374:	02010113          	addi	sp,sp,32
    80002378:	00008067          	ret
    8000237c:	00000097          	auipc	ra,0x0
    80002380:	3c8080e7          	jalr	968(ra) # 80002744 <plic_claim>
    80002384:	00a00793          	li	a5,10
    80002388:	00050493          	mv	s1,a0
    8000238c:	06f50863          	beq	a0,a5,800023fc <kerneltrap+0x12c>
    80002390:	fc050ce3          	beqz	a0,80002368 <kerneltrap+0x98>
    80002394:	00050593          	mv	a1,a0
    80002398:	00003517          	auipc	a0,0x3
    8000239c:	f3050513          	addi	a0,a0,-208 # 800052c8 <_ZZ12printIntegermE6digits+0x2a8>
    800023a0:	00000097          	auipc	ra,0x0
    800023a4:	7e8080e7          	jalr	2024(ra) # 80002b88 <__printf>
    800023a8:	01013403          	ld	s0,16(sp)
    800023ac:	01813083          	ld	ra,24(sp)
    800023b0:	00048513          	mv	a0,s1
    800023b4:	00813483          	ld	s1,8(sp)
    800023b8:	02010113          	addi	sp,sp,32
    800023bc:	00000317          	auipc	t1,0x0
    800023c0:	3c030067          	jr	960(t1) # 8000277c <plic_complete>
    800023c4:	00004517          	auipc	a0,0x4
    800023c8:	75c50513          	addi	a0,a0,1884 # 80006b20 <tickslock>
    800023cc:	00001097          	auipc	ra,0x1
    800023d0:	490080e7          	jalr	1168(ra) # 8000385c <acquire>
    800023d4:	00003717          	auipc	a4,0x3
    800023d8:	63070713          	addi	a4,a4,1584 # 80005a04 <ticks>
    800023dc:	00072783          	lw	a5,0(a4)
    800023e0:	00004517          	auipc	a0,0x4
    800023e4:	74050513          	addi	a0,a0,1856 # 80006b20 <tickslock>
    800023e8:	0017879b          	addiw	a5,a5,1
    800023ec:	00f72023          	sw	a5,0(a4)
    800023f0:	00001097          	auipc	ra,0x1
    800023f4:	538080e7          	jalr	1336(ra) # 80003928 <release>
    800023f8:	f65ff06f          	j	8000235c <kerneltrap+0x8c>
    800023fc:	00001097          	auipc	ra,0x1
    80002400:	094080e7          	jalr	148(ra) # 80003490 <uartintr>
    80002404:	fa5ff06f          	j	800023a8 <kerneltrap+0xd8>
    80002408:	00003517          	auipc	a0,0x3
    8000240c:	ea050513          	addi	a0,a0,-352 # 800052a8 <_ZZ12printIntegermE6digits+0x288>
    80002410:	00000097          	auipc	ra,0x0
    80002414:	71c080e7          	jalr	1820(ra) # 80002b2c <panic>

0000000080002418 <clockintr>:
    80002418:	fe010113          	addi	sp,sp,-32
    8000241c:	00813823          	sd	s0,16(sp)
    80002420:	00913423          	sd	s1,8(sp)
    80002424:	00113c23          	sd	ra,24(sp)
    80002428:	02010413          	addi	s0,sp,32
    8000242c:	00004497          	auipc	s1,0x4
    80002430:	6f448493          	addi	s1,s1,1780 # 80006b20 <tickslock>
    80002434:	00048513          	mv	a0,s1
    80002438:	00001097          	auipc	ra,0x1
    8000243c:	424080e7          	jalr	1060(ra) # 8000385c <acquire>
    80002440:	00003717          	auipc	a4,0x3
    80002444:	5c470713          	addi	a4,a4,1476 # 80005a04 <ticks>
    80002448:	00072783          	lw	a5,0(a4)
    8000244c:	01013403          	ld	s0,16(sp)
    80002450:	01813083          	ld	ra,24(sp)
    80002454:	00048513          	mv	a0,s1
    80002458:	0017879b          	addiw	a5,a5,1
    8000245c:	00813483          	ld	s1,8(sp)
    80002460:	00f72023          	sw	a5,0(a4)
    80002464:	02010113          	addi	sp,sp,32
    80002468:	00001317          	auipc	t1,0x1
    8000246c:	4c030067          	jr	1216(t1) # 80003928 <release>

0000000080002470 <devintr>:
    80002470:	142027f3          	csrr	a5,scause
    80002474:	00000513          	li	a0,0
    80002478:	0007c463          	bltz	a5,80002480 <devintr+0x10>
    8000247c:	00008067          	ret
    80002480:	fe010113          	addi	sp,sp,-32
    80002484:	00813823          	sd	s0,16(sp)
    80002488:	00113c23          	sd	ra,24(sp)
    8000248c:	00913423          	sd	s1,8(sp)
    80002490:	02010413          	addi	s0,sp,32
    80002494:	0ff7f713          	andi	a4,a5,255
    80002498:	00900693          	li	a3,9
    8000249c:	04d70c63          	beq	a4,a3,800024f4 <devintr+0x84>
    800024a0:	fff00713          	li	a4,-1
    800024a4:	03f71713          	slli	a4,a4,0x3f
    800024a8:	00170713          	addi	a4,a4,1
    800024ac:	00e78c63          	beq	a5,a4,800024c4 <devintr+0x54>
    800024b0:	01813083          	ld	ra,24(sp)
    800024b4:	01013403          	ld	s0,16(sp)
    800024b8:	00813483          	ld	s1,8(sp)
    800024bc:	02010113          	addi	sp,sp,32
    800024c0:	00008067          	ret
    800024c4:	00000097          	auipc	ra,0x0
    800024c8:	c8c080e7          	jalr	-884(ra) # 80002150 <cpuid>
    800024cc:	06050663          	beqz	a0,80002538 <devintr+0xc8>
    800024d0:	144027f3          	csrr	a5,sip
    800024d4:	ffd7f793          	andi	a5,a5,-3
    800024d8:	14479073          	csrw	sip,a5
    800024dc:	01813083          	ld	ra,24(sp)
    800024e0:	01013403          	ld	s0,16(sp)
    800024e4:	00813483          	ld	s1,8(sp)
    800024e8:	00200513          	li	a0,2
    800024ec:	02010113          	addi	sp,sp,32
    800024f0:	00008067          	ret
    800024f4:	00000097          	auipc	ra,0x0
    800024f8:	250080e7          	jalr	592(ra) # 80002744 <plic_claim>
    800024fc:	00a00793          	li	a5,10
    80002500:	00050493          	mv	s1,a0
    80002504:	06f50663          	beq	a0,a5,80002570 <devintr+0x100>
    80002508:	00100513          	li	a0,1
    8000250c:	fa0482e3          	beqz	s1,800024b0 <devintr+0x40>
    80002510:	00048593          	mv	a1,s1
    80002514:	00003517          	auipc	a0,0x3
    80002518:	db450513          	addi	a0,a0,-588 # 800052c8 <_ZZ12printIntegermE6digits+0x2a8>
    8000251c:	00000097          	auipc	ra,0x0
    80002520:	66c080e7          	jalr	1644(ra) # 80002b88 <__printf>
    80002524:	00048513          	mv	a0,s1
    80002528:	00000097          	auipc	ra,0x0
    8000252c:	254080e7          	jalr	596(ra) # 8000277c <plic_complete>
    80002530:	00100513          	li	a0,1
    80002534:	f7dff06f          	j	800024b0 <devintr+0x40>
    80002538:	00004517          	auipc	a0,0x4
    8000253c:	5e850513          	addi	a0,a0,1512 # 80006b20 <tickslock>
    80002540:	00001097          	auipc	ra,0x1
    80002544:	31c080e7          	jalr	796(ra) # 8000385c <acquire>
    80002548:	00003717          	auipc	a4,0x3
    8000254c:	4bc70713          	addi	a4,a4,1212 # 80005a04 <ticks>
    80002550:	00072783          	lw	a5,0(a4)
    80002554:	00004517          	auipc	a0,0x4
    80002558:	5cc50513          	addi	a0,a0,1484 # 80006b20 <tickslock>
    8000255c:	0017879b          	addiw	a5,a5,1
    80002560:	00f72023          	sw	a5,0(a4)
    80002564:	00001097          	auipc	ra,0x1
    80002568:	3c4080e7          	jalr	964(ra) # 80003928 <release>
    8000256c:	f65ff06f          	j	800024d0 <devintr+0x60>
    80002570:	00001097          	auipc	ra,0x1
    80002574:	f20080e7          	jalr	-224(ra) # 80003490 <uartintr>
    80002578:	fadff06f          	j	80002524 <devintr+0xb4>
    8000257c:	0000                	unimp
	...

0000000080002580 <kernelvec>:
    80002580:	f0010113          	addi	sp,sp,-256
    80002584:	00113023          	sd	ra,0(sp)
    80002588:	00213423          	sd	sp,8(sp)
    8000258c:	00313823          	sd	gp,16(sp)
    80002590:	00413c23          	sd	tp,24(sp)
    80002594:	02513023          	sd	t0,32(sp)
    80002598:	02613423          	sd	t1,40(sp)
    8000259c:	02713823          	sd	t2,48(sp)
    800025a0:	02813c23          	sd	s0,56(sp)
    800025a4:	04913023          	sd	s1,64(sp)
    800025a8:	04a13423          	sd	a0,72(sp)
    800025ac:	04b13823          	sd	a1,80(sp)
    800025b0:	04c13c23          	sd	a2,88(sp)
    800025b4:	06d13023          	sd	a3,96(sp)
    800025b8:	06e13423          	sd	a4,104(sp)
    800025bc:	06f13823          	sd	a5,112(sp)
    800025c0:	07013c23          	sd	a6,120(sp)
    800025c4:	09113023          	sd	a7,128(sp)
    800025c8:	09213423          	sd	s2,136(sp)
    800025cc:	09313823          	sd	s3,144(sp)
    800025d0:	09413c23          	sd	s4,152(sp)
    800025d4:	0b513023          	sd	s5,160(sp)
    800025d8:	0b613423          	sd	s6,168(sp)
    800025dc:	0b713823          	sd	s7,176(sp)
    800025e0:	0b813c23          	sd	s8,184(sp)
    800025e4:	0d913023          	sd	s9,192(sp)
    800025e8:	0da13423          	sd	s10,200(sp)
    800025ec:	0db13823          	sd	s11,208(sp)
    800025f0:	0dc13c23          	sd	t3,216(sp)
    800025f4:	0fd13023          	sd	t4,224(sp)
    800025f8:	0fe13423          	sd	t5,232(sp)
    800025fc:	0ff13823          	sd	t6,240(sp)
    80002600:	cd1ff0ef          	jal	ra,800022d0 <kerneltrap>
    80002604:	00013083          	ld	ra,0(sp)
    80002608:	00813103          	ld	sp,8(sp)
    8000260c:	01013183          	ld	gp,16(sp)
    80002610:	02013283          	ld	t0,32(sp)
    80002614:	02813303          	ld	t1,40(sp)
    80002618:	03013383          	ld	t2,48(sp)
    8000261c:	03813403          	ld	s0,56(sp)
    80002620:	04013483          	ld	s1,64(sp)
    80002624:	04813503          	ld	a0,72(sp)
    80002628:	05013583          	ld	a1,80(sp)
    8000262c:	05813603          	ld	a2,88(sp)
    80002630:	06013683          	ld	a3,96(sp)
    80002634:	06813703          	ld	a4,104(sp)
    80002638:	07013783          	ld	a5,112(sp)
    8000263c:	07813803          	ld	a6,120(sp)
    80002640:	08013883          	ld	a7,128(sp)
    80002644:	08813903          	ld	s2,136(sp)
    80002648:	09013983          	ld	s3,144(sp)
    8000264c:	09813a03          	ld	s4,152(sp)
    80002650:	0a013a83          	ld	s5,160(sp)
    80002654:	0a813b03          	ld	s6,168(sp)
    80002658:	0b013b83          	ld	s7,176(sp)
    8000265c:	0b813c03          	ld	s8,184(sp)
    80002660:	0c013c83          	ld	s9,192(sp)
    80002664:	0c813d03          	ld	s10,200(sp)
    80002668:	0d013d83          	ld	s11,208(sp)
    8000266c:	0d813e03          	ld	t3,216(sp)
    80002670:	0e013e83          	ld	t4,224(sp)
    80002674:	0e813f03          	ld	t5,232(sp)
    80002678:	0f013f83          	ld	t6,240(sp)
    8000267c:	10010113          	addi	sp,sp,256
    80002680:	10200073          	sret
    80002684:	00000013          	nop
    80002688:	00000013          	nop
    8000268c:	00000013          	nop

0000000080002690 <timervec>:
    80002690:	34051573          	csrrw	a0,mscratch,a0
    80002694:	00b53023          	sd	a1,0(a0)
    80002698:	00c53423          	sd	a2,8(a0)
    8000269c:	00d53823          	sd	a3,16(a0)
    800026a0:	01853583          	ld	a1,24(a0)
    800026a4:	02053603          	ld	a2,32(a0)
    800026a8:	0005b683          	ld	a3,0(a1)
    800026ac:	00c686b3          	add	a3,a3,a2
    800026b0:	00d5b023          	sd	a3,0(a1)
    800026b4:	00200593          	li	a1,2
    800026b8:	14459073          	csrw	sip,a1
    800026bc:	01053683          	ld	a3,16(a0)
    800026c0:	00853603          	ld	a2,8(a0)
    800026c4:	00053583          	ld	a1,0(a0)
    800026c8:	34051573          	csrrw	a0,mscratch,a0
    800026cc:	30200073          	mret

00000000800026d0 <plicinit>:
    800026d0:	ff010113          	addi	sp,sp,-16
    800026d4:	00813423          	sd	s0,8(sp)
    800026d8:	01010413          	addi	s0,sp,16
    800026dc:	00813403          	ld	s0,8(sp)
    800026e0:	0c0007b7          	lui	a5,0xc000
    800026e4:	00100713          	li	a4,1
    800026e8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    800026ec:	00e7a223          	sw	a4,4(a5)
    800026f0:	01010113          	addi	sp,sp,16
    800026f4:	00008067          	ret

00000000800026f8 <plicinithart>:
    800026f8:	ff010113          	addi	sp,sp,-16
    800026fc:	00813023          	sd	s0,0(sp)
    80002700:	00113423          	sd	ra,8(sp)
    80002704:	01010413          	addi	s0,sp,16
    80002708:	00000097          	auipc	ra,0x0
    8000270c:	a48080e7          	jalr	-1464(ra) # 80002150 <cpuid>
    80002710:	0085171b          	slliw	a4,a0,0x8
    80002714:	0c0027b7          	lui	a5,0xc002
    80002718:	00e787b3          	add	a5,a5,a4
    8000271c:	40200713          	li	a4,1026
    80002720:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80002724:	00813083          	ld	ra,8(sp)
    80002728:	00013403          	ld	s0,0(sp)
    8000272c:	00d5151b          	slliw	a0,a0,0xd
    80002730:	0c2017b7          	lui	a5,0xc201
    80002734:	00a78533          	add	a0,a5,a0
    80002738:	00052023          	sw	zero,0(a0)
    8000273c:	01010113          	addi	sp,sp,16
    80002740:	00008067          	ret

0000000080002744 <plic_claim>:
    80002744:	ff010113          	addi	sp,sp,-16
    80002748:	00813023          	sd	s0,0(sp)
    8000274c:	00113423          	sd	ra,8(sp)
    80002750:	01010413          	addi	s0,sp,16
    80002754:	00000097          	auipc	ra,0x0
    80002758:	9fc080e7          	jalr	-1540(ra) # 80002150 <cpuid>
    8000275c:	00813083          	ld	ra,8(sp)
    80002760:	00013403          	ld	s0,0(sp)
    80002764:	00d5151b          	slliw	a0,a0,0xd
    80002768:	0c2017b7          	lui	a5,0xc201
    8000276c:	00a78533          	add	a0,a5,a0
    80002770:	00452503          	lw	a0,4(a0)
    80002774:	01010113          	addi	sp,sp,16
    80002778:	00008067          	ret

000000008000277c <plic_complete>:
    8000277c:	fe010113          	addi	sp,sp,-32
    80002780:	00813823          	sd	s0,16(sp)
    80002784:	00913423          	sd	s1,8(sp)
    80002788:	00113c23          	sd	ra,24(sp)
    8000278c:	02010413          	addi	s0,sp,32
    80002790:	00050493          	mv	s1,a0
    80002794:	00000097          	auipc	ra,0x0
    80002798:	9bc080e7          	jalr	-1604(ra) # 80002150 <cpuid>
    8000279c:	01813083          	ld	ra,24(sp)
    800027a0:	01013403          	ld	s0,16(sp)
    800027a4:	00d5179b          	slliw	a5,a0,0xd
    800027a8:	0c201737          	lui	a4,0xc201
    800027ac:	00f707b3          	add	a5,a4,a5
    800027b0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    800027b4:	00813483          	ld	s1,8(sp)
    800027b8:	02010113          	addi	sp,sp,32
    800027bc:	00008067          	ret

00000000800027c0 <consolewrite>:
    800027c0:	fb010113          	addi	sp,sp,-80
    800027c4:	04813023          	sd	s0,64(sp)
    800027c8:	04113423          	sd	ra,72(sp)
    800027cc:	02913c23          	sd	s1,56(sp)
    800027d0:	03213823          	sd	s2,48(sp)
    800027d4:	03313423          	sd	s3,40(sp)
    800027d8:	03413023          	sd	s4,32(sp)
    800027dc:	01513c23          	sd	s5,24(sp)
    800027e0:	05010413          	addi	s0,sp,80
    800027e4:	06c05c63          	blez	a2,8000285c <consolewrite+0x9c>
    800027e8:	00060993          	mv	s3,a2
    800027ec:	00050a13          	mv	s4,a0
    800027f0:	00058493          	mv	s1,a1
    800027f4:	00000913          	li	s2,0
    800027f8:	fff00a93          	li	s5,-1
    800027fc:	01c0006f          	j	80002818 <consolewrite+0x58>
    80002800:	fbf44503          	lbu	a0,-65(s0)
    80002804:	0019091b          	addiw	s2,s2,1
    80002808:	00148493          	addi	s1,s1,1
    8000280c:	00001097          	auipc	ra,0x1
    80002810:	a9c080e7          	jalr	-1380(ra) # 800032a8 <uartputc>
    80002814:	03298063          	beq	s3,s2,80002834 <consolewrite+0x74>
    80002818:	00048613          	mv	a2,s1
    8000281c:	00100693          	li	a3,1
    80002820:	000a0593          	mv	a1,s4
    80002824:	fbf40513          	addi	a0,s0,-65
    80002828:	00000097          	auipc	ra,0x0
    8000282c:	9e0080e7          	jalr	-1568(ra) # 80002208 <either_copyin>
    80002830:	fd5518e3          	bne	a0,s5,80002800 <consolewrite+0x40>
    80002834:	04813083          	ld	ra,72(sp)
    80002838:	04013403          	ld	s0,64(sp)
    8000283c:	03813483          	ld	s1,56(sp)
    80002840:	02813983          	ld	s3,40(sp)
    80002844:	02013a03          	ld	s4,32(sp)
    80002848:	01813a83          	ld	s5,24(sp)
    8000284c:	00090513          	mv	a0,s2
    80002850:	03013903          	ld	s2,48(sp)
    80002854:	05010113          	addi	sp,sp,80
    80002858:	00008067          	ret
    8000285c:	00000913          	li	s2,0
    80002860:	fd5ff06f          	j	80002834 <consolewrite+0x74>

0000000080002864 <consoleread>:
    80002864:	f9010113          	addi	sp,sp,-112
    80002868:	06813023          	sd	s0,96(sp)
    8000286c:	04913c23          	sd	s1,88(sp)
    80002870:	05213823          	sd	s2,80(sp)
    80002874:	05313423          	sd	s3,72(sp)
    80002878:	05413023          	sd	s4,64(sp)
    8000287c:	03513c23          	sd	s5,56(sp)
    80002880:	03613823          	sd	s6,48(sp)
    80002884:	03713423          	sd	s7,40(sp)
    80002888:	03813023          	sd	s8,32(sp)
    8000288c:	06113423          	sd	ra,104(sp)
    80002890:	01913c23          	sd	s9,24(sp)
    80002894:	07010413          	addi	s0,sp,112
    80002898:	00060b93          	mv	s7,a2
    8000289c:	00050913          	mv	s2,a0
    800028a0:	00058c13          	mv	s8,a1
    800028a4:	00060b1b          	sext.w	s6,a2
    800028a8:	00004497          	auipc	s1,0x4
    800028ac:	2a048493          	addi	s1,s1,672 # 80006b48 <cons>
    800028b0:	00400993          	li	s3,4
    800028b4:	fff00a13          	li	s4,-1
    800028b8:	00a00a93          	li	s5,10
    800028bc:	05705e63          	blez	s7,80002918 <consoleread+0xb4>
    800028c0:	09c4a703          	lw	a4,156(s1)
    800028c4:	0984a783          	lw	a5,152(s1)
    800028c8:	0007071b          	sext.w	a4,a4
    800028cc:	08e78463          	beq	a5,a4,80002954 <consoleread+0xf0>
    800028d0:	07f7f713          	andi	a4,a5,127
    800028d4:	00e48733          	add	a4,s1,a4
    800028d8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    800028dc:	0017869b          	addiw	a3,a5,1
    800028e0:	08d4ac23          	sw	a3,152(s1)
    800028e4:	00070c9b          	sext.w	s9,a4
    800028e8:	0b370663          	beq	a4,s3,80002994 <consoleread+0x130>
    800028ec:	00100693          	li	a3,1
    800028f0:	f9f40613          	addi	a2,s0,-97
    800028f4:	000c0593          	mv	a1,s8
    800028f8:	00090513          	mv	a0,s2
    800028fc:	f8e40fa3          	sb	a4,-97(s0)
    80002900:	00000097          	auipc	ra,0x0
    80002904:	8bc080e7          	jalr	-1860(ra) # 800021bc <either_copyout>
    80002908:	01450863          	beq	a0,s4,80002918 <consoleread+0xb4>
    8000290c:	001c0c13          	addi	s8,s8,1
    80002910:	fffb8b9b          	addiw	s7,s7,-1
    80002914:	fb5c94e3          	bne	s9,s5,800028bc <consoleread+0x58>
    80002918:	000b851b          	sext.w	a0,s7
    8000291c:	06813083          	ld	ra,104(sp)
    80002920:	06013403          	ld	s0,96(sp)
    80002924:	05813483          	ld	s1,88(sp)
    80002928:	05013903          	ld	s2,80(sp)
    8000292c:	04813983          	ld	s3,72(sp)
    80002930:	04013a03          	ld	s4,64(sp)
    80002934:	03813a83          	ld	s5,56(sp)
    80002938:	02813b83          	ld	s7,40(sp)
    8000293c:	02013c03          	ld	s8,32(sp)
    80002940:	01813c83          	ld	s9,24(sp)
    80002944:	40ab053b          	subw	a0,s6,a0
    80002948:	03013b03          	ld	s6,48(sp)
    8000294c:	07010113          	addi	sp,sp,112
    80002950:	00008067          	ret
    80002954:	00001097          	auipc	ra,0x1
    80002958:	1d8080e7          	jalr	472(ra) # 80003b2c <push_on>
    8000295c:	0984a703          	lw	a4,152(s1)
    80002960:	09c4a783          	lw	a5,156(s1)
    80002964:	0007879b          	sext.w	a5,a5
    80002968:	fef70ce3          	beq	a4,a5,80002960 <consoleread+0xfc>
    8000296c:	00001097          	auipc	ra,0x1
    80002970:	234080e7          	jalr	564(ra) # 80003ba0 <pop_on>
    80002974:	0984a783          	lw	a5,152(s1)
    80002978:	07f7f713          	andi	a4,a5,127
    8000297c:	00e48733          	add	a4,s1,a4
    80002980:	01874703          	lbu	a4,24(a4)
    80002984:	0017869b          	addiw	a3,a5,1
    80002988:	08d4ac23          	sw	a3,152(s1)
    8000298c:	00070c9b          	sext.w	s9,a4
    80002990:	f5371ee3          	bne	a4,s3,800028ec <consoleread+0x88>
    80002994:	000b851b          	sext.w	a0,s7
    80002998:	f96bf2e3          	bgeu	s7,s6,8000291c <consoleread+0xb8>
    8000299c:	08f4ac23          	sw	a5,152(s1)
    800029a0:	f7dff06f          	j	8000291c <consoleread+0xb8>

00000000800029a4 <consputc>:
    800029a4:	10000793          	li	a5,256
    800029a8:	00f50663          	beq	a0,a5,800029b4 <consputc+0x10>
    800029ac:	00001317          	auipc	t1,0x1
    800029b0:	9f430067          	jr	-1548(t1) # 800033a0 <uartputc_sync>
    800029b4:	ff010113          	addi	sp,sp,-16
    800029b8:	00113423          	sd	ra,8(sp)
    800029bc:	00813023          	sd	s0,0(sp)
    800029c0:	01010413          	addi	s0,sp,16
    800029c4:	00800513          	li	a0,8
    800029c8:	00001097          	auipc	ra,0x1
    800029cc:	9d8080e7          	jalr	-1576(ra) # 800033a0 <uartputc_sync>
    800029d0:	02000513          	li	a0,32
    800029d4:	00001097          	auipc	ra,0x1
    800029d8:	9cc080e7          	jalr	-1588(ra) # 800033a0 <uartputc_sync>
    800029dc:	00013403          	ld	s0,0(sp)
    800029e0:	00813083          	ld	ra,8(sp)
    800029e4:	00800513          	li	a0,8
    800029e8:	01010113          	addi	sp,sp,16
    800029ec:	00001317          	auipc	t1,0x1
    800029f0:	9b430067          	jr	-1612(t1) # 800033a0 <uartputc_sync>

00000000800029f4 <consoleintr>:
    800029f4:	fe010113          	addi	sp,sp,-32
    800029f8:	00813823          	sd	s0,16(sp)
    800029fc:	00913423          	sd	s1,8(sp)
    80002a00:	01213023          	sd	s2,0(sp)
    80002a04:	00113c23          	sd	ra,24(sp)
    80002a08:	02010413          	addi	s0,sp,32
    80002a0c:	00004917          	auipc	s2,0x4
    80002a10:	13c90913          	addi	s2,s2,316 # 80006b48 <cons>
    80002a14:	00050493          	mv	s1,a0
    80002a18:	00090513          	mv	a0,s2
    80002a1c:	00001097          	auipc	ra,0x1
    80002a20:	e40080e7          	jalr	-448(ra) # 8000385c <acquire>
    80002a24:	02048c63          	beqz	s1,80002a5c <consoleintr+0x68>
    80002a28:	0a092783          	lw	a5,160(s2)
    80002a2c:	09892703          	lw	a4,152(s2)
    80002a30:	07f00693          	li	a3,127
    80002a34:	40e7873b          	subw	a4,a5,a4
    80002a38:	02e6e263          	bltu	a3,a4,80002a5c <consoleintr+0x68>
    80002a3c:	00d00713          	li	a4,13
    80002a40:	04e48063          	beq	s1,a4,80002a80 <consoleintr+0x8c>
    80002a44:	07f7f713          	andi	a4,a5,127
    80002a48:	00e90733          	add	a4,s2,a4
    80002a4c:	0017879b          	addiw	a5,a5,1
    80002a50:	0af92023          	sw	a5,160(s2)
    80002a54:	00970c23          	sb	s1,24(a4)
    80002a58:	08f92e23          	sw	a5,156(s2)
    80002a5c:	01013403          	ld	s0,16(sp)
    80002a60:	01813083          	ld	ra,24(sp)
    80002a64:	00813483          	ld	s1,8(sp)
    80002a68:	00013903          	ld	s2,0(sp)
    80002a6c:	00004517          	auipc	a0,0x4
    80002a70:	0dc50513          	addi	a0,a0,220 # 80006b48 <cons>
    80002a74:	02010113          	addi	sp,sp,32
    80002a78:	00001317          	auipc	t1,0x1
    80002a7c:	eb030067          	jr	-336(t1) # 80003928 <release>
    80002a80:	00a00493          	li	s1,10
    80002a84:	fc1ff06f          	j	80002a44 <consoleintr+0x50>

0000000080002a88 <consoleinit>:
    80002a88:	fe010113          	addi	sp,sp,-32
    80002a8c:	00113c23          	sd	ra,24(sp)
    80002a90:	00813823          	sd	s0,16(sp)
    80002a94:	00913423          	sd	s1,8(sp)
    80002a98:	02010413          	addi	s0,sp,32
    80002a9c:	00004497          	auipc	s1,0x4
    80002aa0:	0ac48493          	addi	s1,s1,172 # 80006b48 <cons>
    80002aa4:	00048513          	mv	a0,s1
    80002aa8:	00003597          	auipc	a1,0x3
    80002aac:	87858593          	addi	a1,a1,-1928 # 80005320 <_ZZ12printIntegermE6digits+0x300>
    80002ab0:	00001097          	auipc	ra,0x1
    80002ab4:	d88080e7          	jalr	-632(ra) # 80003838 <initlock>
    80002ab8:	00000097          	auipc	ra,0x0
    80002abc:	7ac080e7          	jalr	1964(ra) # 80003264 <uartinit>
    80002ac0:	01813083          	ld	ra,24(sp)
    80002ac4:	01013403          	ld	s0,16(sp)
    80002ac8:	00000797          	auipc	a5,0x0
    80002acc:	d9c78793          	addi	a5,a5,-612 # 80002864 <consoleread>
    80002ad0:	0af4bc23          	sd	a5,184(s1)
    80002ad4:	00000797          	auipc	a5,0x0
    80002ad8:	cec78793          	addi	a5,a5,-788 # 800027c0 <consolewrite>
    80002adc:	0cf4b023          	sd	a5,192(s1)
    80002ae0:	00813483          	ld	s1,8(sp)
    80002ae4:	02010113          	addi	sp,sp,32
    80002ae8:	00008067          	ret

0000000080002aec <console_read>:
    80002aec:	ff010113          	addi	sp,sp,-16
    80002af0:	00813423          	sd	s0,8(sp)
    80002af4:	01010413          	addi	s0,sp,16
    80002af8:	00813403          	ld	s0,8(sp)
    80002afc:	00004317          	auipc	t1,0x4
    80002b00:	10433303          	ld	t1,260(t1) # 80006c00 <devsw+0x10>
    80002b04:	01010113          	addi	sp,sp,16
    80002b08:	00030067          	jr	t1

0000000080002b0c <console_write>:
    80002b0c:	ff010113          	addi	sp,sp,-16
    80002b10:	00813423          	sd	s0,8(sp)
    80002b14:	01010413          	addi	s0,sp,16
    80002b18:	00813403          	ld	s0,8(sp)
    80002b1c:	00004317          	auipc	t1,0x4
    80002b20:	0ec33303          	ld	t1,236(t1) # 80006c08 <devsw+0x18>
    80002b24:	01010113          	addi	sp,sp,16
    80002b28:	00030067          	jr	t1

0000000080002b2c <panic>:
    80002b2c:	fe010113          	addi	sp,sp,-32
    80002b30:	00113c23          	sd	ra,24(sp)
    80002b34:	00813823          	sd	s0,16(sp)
    80002b38:	00913423          	sd	s1,8(sp)
    80002b3c:	02010413          	addi	s0,sp,32
    80002b40:	00050493          	mv	s1,a0
    80002b44:	00002517          	auipc	a0,0x2
    80002b48:	7e450513          	addi	a0,a0,2020 # 80005328 <_ZZ12printIntegermE6digits+0x308>
    80002b4c:	00004797          	auipc	a5,0x4
    80002b50:	1407ae23          	sw	zero,348(a5) # 80006ca8 <pr+0x18>
    80002b54:	00000097          	auipc	ra,0x0
    80002b58:	034080e7          	jalr	52(ra) # 80002b88 <__printf>
    80002b5c:	00048513          	mv	a0,s1
    80002b60:	00000097          	auipc	ra,0x0
    80002b64:	028080e7          	jalr	40(ra) # 80002b88 <__printf>
    80002b68:	00002517          	auipc	a0,0x2
    80002b6c:	7a050513          	addi	a0,a0,1952 # 80005308 <_ZZ12printIntegermE6digits+0x2e8>
    80002b70:	00000097          	auipc	ra,0x0
    80002b74:	018080e7          	jalr	24(ra) # 80002b88 <__printf>
    80002b78:	00100793          	li	a5,1
    80002b7c:	00003717          	auipc	a4,0x3
    80002b80:	e8f72623          	sw	a5,-372(a4) # 80005a08 <panicked>
    80002b84:	0000006f          	j	80002b84 <panic+0x58>

0000000080002b88 <__printf>:
    80002b88:	f3010113          	addi	sp,sp,-208
    80002b8c:	08813023          	sd	s0,128(sp)
    80002b90:	07313423          	sd	s3,104(sp)
    80002b94:	09010413          	addi	s0,sp,144
    80002b98:	05813023          	sd	s8,64(sp)
    80002b9c:	08113423          	sd	ra,136(sp)
    80002ba0:	06913c23          	sd	s1,120(sp)
    80002ba4:	07213823          	sd	s2,112(sp)
    80002ba8:	07413023          	sd	s4,96(sp)
    80002bac:	05513c23          	sd	s5,88(sp)
    80002bb0:	05613823          	sd	s6,80(sp)
    80002bb4:	05713423          	sd	s7,72(sp)
    80002bb8:	03913c23          	sd	s9,56(sp)
    80002bbc:	03a13823          	sd	s10,48(sp)
    80002bc0:	03b13423          	sd	s11,40(sp)
    80002bc4:	00004317          	auipc	t1,0x4
    80002bc8:	0cc30313          	addi	t1,t1,204 # 80006c90 <pr>
    80002bcc:	01832c03          	lw	s8,24(t1)
    80002bd0:	00b43423          	sd	a1,8(s0)
    80002bd4:	00c43823          	sd	a2,16(s0)
    80002bd8:	00d43c23          	sd	a3,24(s0)
    80002bdc:	02e43023          	sd	a4,32(s0)
    80002be0:	02f43423          	sd	a5,40(s0)
    80002be4:	03043823          	sd	a6,48(s0)
    80002be8:	03143c23          	sd	a7,56(s0)
    80002bec:	00050993          	mv	s3,a0
    80002bf0:	4a0c1663          	bnez	s8,8000309c <__printf+0x514>
    80002bf4:	60098c63          	beqz	s3,8000320c <__printf+0x684>
    80002bf8:	0009c503          	lbu	a0,0(s3)
    80002bfc:	00840793          	addi	a5,s0,8
    80002c00:	f6f43c23          	sd	a5,-136(s0)
    80002c04:	00000493          	li	s1,0
    80002c08:	22050063          	beqz	a0,80002e28 <__printf+0x2a0>
    80002c0c:	00002a37          	lui	s4,0x2
    80002c10:	00018ab7          	lui	s5,0x18
    80002c14:	000f4b37          	lui	s6,0xf4
    80002c18:	00989bb7          	lui	s7,0x989
    80002c1c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80002c20:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80002c24:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80002c28:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80002c2c:	00148c9b          	addiw	s9,s1,1
    80002c30:	02500793          	li	a5,37
    80002c34:	01998933          	add	s2,s3,s9
    80002c38:	38f51263          	bne	a0,a5,80002fbc <__printf+0x434>
    80002c3c:	00094783          	lbu	a5,0(s2)
    80002c40:	00078c9b          	sext.w	s9,a5
    80002c44:	1e078263          	beqz	a5,80002e28 <__printf+0x2a0>
    80002c48:	0024849b          	addiw	s1,s1,2
    80002c4c:	07000713          	li	a4,112
    80002c50:	00998933          	add	s2,s3,s1
    80002c54:	38e78a63          	beq	a5,a4,80002fe8 <__printf+0x460>
    80002c58:	20f76863          	bltu	a4,a5,80002e68 <__printf+0x2e0>
    80002c5c:	42a78863          	beq	a5,a0,8000308c <__printf+0x504>
    80002c60:	06400713          	li	a4,100
    80002c64:	40e79663          	bne	a5,a4,80003070 <__printf+0x4e8>
    80002c68:	f7843783          	ld	a5,-136(s0)
    80002c6c:	0007a603          	lw	a2,0(a5)
    80002c70:	00878793          	addi	a5,a5,8
    80002c74:	f6f43c23          	sd	a5,-136(s0)
    80002c78:	42064a63          	bltz	a2,800030ac <__printf+0x524>
    80002c7c:	00a00713          	li	a4,10
    80002c80:	02e677bb          	remuw	a5,a2,a4
    80002c84:	00002d97          	auipc	s11,0x2
    80002c88:	6ccd8d93          	addi	s11,s11,1740 # 80005350 <digits>
    80002c8c:	00900593          	li	a1,9
    80002c90:	0006051b          	sext.w	a0,a2
    80002c94:	00000c93          	li	s9,0
    80002c98:	02079793          	slli	a5,a5,0x20
    80002c9c:	0207d793          	srli	a5,a5,0x20
    80002ca0:	00fd87b3          	add	a5,s11,a5
    80002ca4:	0007c783          	lbu	a5,0(a5)
    80002ca8:	02e656bb          	divuw	a3,a2,a4
    80002cac:	f8f40023          	sb	a5,-128(s0)
    80002cb0:	14c5d863          	bge	a1,a2,80002e00 <__printf+0x278>
    80002cb4:	06300593          	li	a1,99
    80002cb8:	00100c93          	li	s9,1
    80002cbc:	02e6f7bb          	remuw	a5,a3,a4
    80002cc0:	02079793          	slli	a5,a5,0x20
    80002cc4:	0207d793          	srli	a5,a5,0x20
    80002cc8:	00fd87b3          	add	a5,s11,a5
    80002ccc:	0007c783          	lbu	a5,0(a5)
    80002cd0:	02e6d73b          	divuw	a4,a3,a4
    80002cd4:	f8f400a3          	sb	a5,-127(s0)
    80002cd8:	12a5f463          	bgeu	a1,a0,80002e00 <__printf+0x278>
    80002cdc:	00a00693          	li	a3,10
    80002ce0:	00900593          	li	a1,9
    80002ce4:	02d777bb          	remuw	a5,a4,a3
    80002ce8:	02079793          	slli	a5,a5,0x20
    80002cec:	0207d793          	srli	a5,a5,0x20
    80002cf0:	00fd87b3          	add	a5,s11,a5
    80002cf4:	0007c503          	lbu	a0,0(a5)
    80002cf8:	02d757bb          	divuw	a5,a4,a3
    80002cfc:	f8a40123          	sb	a0,-126(s0)
    80002d00:	48e5f263          	bgeu	a1,a4,80003184 <__printf+0x5fc>
    80002d04:	06300513          	li	a0,99
    80002d08:	02d7f5bb          	remuw	a1,a5,a3
    80002d0c:	02059593          	slli	a1,a1,0x20
    80002d10:	0205d593          	srli	a1,a1,0x20
    80002d14:	00bd85b3          	add	a1,s11,a1
    80002d18:	0005c583          	lbu	a1,0(a1)
    80002d1c:	02d7d7bb          	divuw	a5,a5,a3
    80002d20:	f8b401a3          	sb	a1,-125(s0)
    80002d24:	48e57263          	bgeu	a0,a4,800031a8 <__printf+0x620>
    80002d28:	3e700513          	li	a0,999
    80002d2c:	02d7f5bb          	remuw	a1,a5,a3
    80002d30:	02059593          	slli	a1,a1,0x20
    80002d34:	0205d593          	srli	a1,a1,0x20
    80002d38:	00bd85b3          	add	a1,s11,a1
    80002d3c:	0005c583          	lbu	a1,0(a1)
    80002d40:	02d7d7bb          	divuw	a5,a5,a3
    80002d44:	f8b40223          	sb	a1,-124(s0)
    80002d48:	46e57663          	bgeu	a0,a4,800031b4 <__printf+0x62c>
    80002d4c:	02d7f5bb          	remuw	a1,a5,a3
    80002d50:	02059593          	slli	a1,a1,0x20
    80002d54:	0205d593          	srli	a1,a1,0x20
    80002d58:	00bd85b3          	add	a1,s11,a1
    80002d5c:	0005c583          	lbu	a1,0(a1)
    80002d60:	02d7d7bb          	divuw	a5,a5,a3
    80002d64:	f8b402a3          	sb	a1,-123(s0)
    80002d68:	46ea7863          	bgeu	s4,a4,800031d8 <__printf+0x650>
    80002d6c:	02d7f5bb          	remuw	a1,a5,a3
    80002d70:	02059593          	slli	a1,a1,0x20
    80002d74:	0205d593          	srli	a1,a1,0x20
    80002d78:	00bd85b3          	add	a1,s11,a1
    80002d7c:	0005c583          	lbu	a1,0(a1)
    80002d80:	02d7d7bb          	divuw	a5,a5,a3
    80002d84:	f8b40323          	sb	a1,-122(s0)
    80002d88:	3eeaf863          	bgeu	s5,a4,80003178 <__printf+0x5f0>
    80002d8c:	02d7f5bb          	remuw	a1,a5,a3
    80002d90:	02059593          	slli	a1,a1,0x20
    80002d94:	0205d593          	srli	a1,a1,0x20
    80002d98:	00bd85b3          	add	a1,s11,a1
    80002d9c:	0005c583          	lbu	a1,0(a1)
    80002da0:	02d7d7bb          	divuw	a5,a5,a3
    80002da4:	f8b403a3          	sb	a1,-121(s0)
    80002da8:	42eb7e63          	bgeu	s6,a4,800031e4 <__printf+0x65c>
    80002dac:	02d7f5bb          	remuw	a1,a5,a3
    80002db0:	02059593          	slli	a1,a1,0x20
    80002db4:	0205d593          	srli	a1,a1,0x20
    80002db8:	00bd85b3          	add	a1,s11,a1
    80002dbc:	0005c583          	lbu	a1,0(a1)
    80002dc0:	02d7d7bb          	divuw	a5,a5,a3
    80002dc4:	f8b40423          	sb	a1,-120(s0)
    80002dc8:	42ebfc63          	bgeu	s7,a4,80003200 <__printf+0x678>
    80002dcc:	02079793          	slli	a5,a5,0x20
    80002dd0:	0207d793          	srli	a5,a5,0x20
    80002dd4:	00fd8db3          	add	s11,s11,a5
    80002dd8:	000dc703          	lbu	a4,0(s11)
    80002ddc:	00a00793          	li	a5,10
    80002de0:	00900c93          	li	s9,9
    80002de4:	f8e404a3          	sb	a4,-119(s0)
    80002de8:	00065c63          	bgez	a2,80002e00 <__printf+0x278>
    80002dec:	f9040713          	addi	a4,s0,-112
    80002df0:	00f70733          	add	a4,a4,a5
    80002df4:	02d00693          	li	a3,45
    80002df8:	fed70823          	sb	a3,-16(a4)
    80002dfc:	00078c93          	mv	s9,a5
    80002e00:	f8040793          	addi	a5,s0,-128
    80002e04:	01978cb3          	add	s9,a5,s9
    80002e08:	f7f40d13          	addi	s10,s0,-129
    80002e0c:	000cc503          	lbu	a0,0(s9)
    80002e10:	fffc8c93          	addi	s9,s9,-1
    80002e14:	00000097          	auipc	ra,0x0
    80002e18:	b90080e7          	jalr	-1136(ra) # 800029a4 <consputc>
    80002e1c:	ffac98e3          	bne	s9,s10,80002e0c <__printf+0x284>
    80002e20:	00094503          	lbu	a0,0(s2)
    80002e24:	e00514e3          	bnez	a0,80002c2c <__printf+0xa4>
    80002e28:	1a0c1663          	bnez	s8,80002fd4 <__printf+0x44c>
    80002e2c:	08813083          	ld	ra,136(sp)
    80002e30:	08013403          	ld	s0,128(sp)
    80002e34:	07813483          	ld	s1,120(sp)
    80002e38:	07013903          	ld	s2,112(sp)
    80002e3c:	06813983          	ld	s3,104(sp)
    80002e40:	06013a03          	ld	s4,96(sp)
    80002e44:	05813a83          	ld	s5,88(sp)
    80002e48:	05013b03          	ld	s6,80(sp)
    80002e4c:	04813b83          	ld	s7,72(sp)
    80002e50:	04013c03          	ld	s8,64(sp)
    80002e54:	03813c83          	ld	s9,56(sp)
    80002e58:	03013d03          	ld	s10,48(sp)
    80002e5c:	02813d83          	ld	s11,40(sp)
    80002e60:	0d010113          	addi	sp,sp,208
    80002e64:	00008067          	ret
    80002e68:	07300713          	li	a4,115
    80002e6c:	1ce78a63          	beq	a5,a4,80003040 <__printf+0x4b8>
    80002e70:	07800713          	li	a4,120
    80002e74:	1ee79e63          	bne	a5,a4,80003070 <__printf+0x4e8>
    80002e78:	f7843783          	ld	a5,-136(s0)
    80002e7c:	0007a703          	lw	a4,0(a5)
    80002e80:	00878793          	addi	a5,a5,8
    80002e84:	f6f43c23          	sd	a5,-136(s0)
    80002e88:	28074263          	bltz	a4,8000310c <__printf+0x584>
    80002e8c:	00002d97          	auipc	s11,0x2
    80002e90:	4c4d8d93          	addi	s11,s11,1220 # 80005350 <digits>
    80002e94:	00f77793          	andi	a5,a4,15
    80002e98:	00fd87b3          	add	a5,s11,a5
    80002e9c:	0007c683          	lbu	a3,0(a5)
    80002ea0:	00f00613          	li	a2,15
    80002ea4:	0007079b          	sext.w	a5,a4
    80002ea8:	f8d40023          	sb	a3,-128(s0)
    80002eac:	0047559b          	srliw	a1,a4,0x4
    80002eb0:	0047569b          	srliw	a3,a4,0x4
    80002eb4:	00000c93          	li	s9,0
    80002eb8:	0ee65063          	bge	a2,a4,80002f98 <__printf+0x410>
    80002ebc:	00f6f693          	andi	a3,a3,15
    80002ec0:	00dd86b3          	add	a3,s11,a3
    80002ec4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80002ec8:	0087d79b          	srliw	a5,a5,0x8
    80002ecc:	00100c93          	li	s9,1
    80002ed0:	f8d400a3          	sb	a3,-127(s0)
    80002ed4:	0cb67263          	bgeu	a2,a1,80002f98 <__printf+0x410>
    80002ed8:	00f7f693          	andi	a3,a5,15
    80002edc:	00dd86b3          	add	a3,s11,a3
    80002ee0:	0006c583          	lbu	a1,0(a3)
    80002ee4:	00f00613          	li	a2,15
    80002ee8:	0047d69b          	srliw	a3,a5,0x4
    80002eec:	f8b40123          	sb	a1,-126(s0)
    80002ef0:	0047d593          	srli	a1,a5,0x4
    80002ef4:	28f67e63          	bgeu	a2,a5,80003190 <__printf+0x608>
    80002ef8:	00f6f693          	andi	a3,a3,15
    80002efc:	00dd86b3          	add	a3,s11,a3
    80002f00:	0006c503          	lbu	a0,0(a3)
    80002f04:	0087d813          	srli	a6,a5,0x8
    80002f08:	0087d69b          	srliw	a3,a5,0x8
    80002f0c:	f8a401a3          	sb	a0,-125(s0)
    80002f10:	28b67663          	bgeu	a2,a1,8000319c <__printf+0x614>
    80002f14:	00f6f693          	andi	a3,a3,15
    80002f18:	00dd86b3          	add	a3,s11,a3
    80002f1c:	0006c583          	lbu	a1,0(a3)
    80002f20:	00c7d513          	srli	a0,a5,0xc
    80002f24:	00c7d69b          	srliw	a3,a5,0xc
    80002f28:	f8b40223          	sb	a1,-124(s0)
    80002f2c:	29067a63          	bgeu	a2,a6,800031c0 <__printf+0x638>
    80002f30:	00f6f693          	andi	a3,a3,15
    80002f34:	00dd86b3          	add	a3,s11,a3
    80002f38:	0006c583          	lbu	a1,0(a3)
    80002f3c:	0107d813          	srli	a6,a5,0x10
    80002f40:	0107d69b          	srliw	a3,a5,0x10
    80002f44:	f8b402a3          	sb	a1,-123(s0)
    80002f48:	28a67263          	bgeu	a2,a0,800031cc <__printf+0x644>
    80002f4c:	00f6f693          	andi	a3,a3,15
    80002f50:	00dd86b3          	add	a3,s11,a3
    80002f54:	0006c683          	lbu	a3,0(a3)
    80002f58:	0147d79b          	srliw	a5,a5,0x14
    80002f5c:	f8d40323          	sb	a3,-122(s0)
    80002f60:	21067663          	bgeu	a2,a6,8000316c <__printf+0x5e4>
    80002f64:	02079793          	slli	a5,a5,0x20
    80002f68:	0207d793          	srli	a5,a5,0x20
    80002f6c:	00fd8db3          	add	s11,s11,a5
    80002f70:	000dc683          	lbu	a3,0(s11)
    80002f74:	00800793          	li	a5,8
    80002f78:	00700c93          	li	s9,7
    80002f7c:	f8d403a3          	sb	a3,-121(s0)
    80002f80:	00075c63          	bgez	a4,80002f98 <__printf+0x410>
    80002f84:	f9040713          	addi	a4,s0,-112
    80002f88:	00f70733          	add	a4,a4,a5
    80002f8c:	02d00693          	li	a3,45
    80002f90:	fed70823          	sb	a3,-16(a4)
    80002f94:	00078c93          	mv	s9,a5
    80002f98:	f8040793          	addi	a5,s0,-128
    80002f9c:	01978cb3          	add	s9,a5,s9
    80002fa0:	f7f40d13          	addi	s10,s0,-129
    80002fa4:	000cc503          	lbu	a0,0(s9)
    80002fa8:	fffc8c93          	addi	s9,s9,-1
    80002fac:	00000097          	auipc	ra,0x0
    80002fb0:	9f8080e7          	jalr	-1544(ra) # 800029a4 <consputc>
    80002fb4:	ff9d18e3          	bne	s10,s9,80002fa4 <__printf+0x41c>
    80002fb8:	0100006f          	j	80002fc8 <__printf+0x440>
    80002fbc:	00000097          	auipc	ra,0x0
    80002fc0:	9e8080e7          	jalr	-1560(ra) # 800029a4 <consputc>
    80002fc4:	000c8493          	mv	s1,s9
    80002fc8:	00094503          	lbu	a0,0(s2)
    80002fcc:	c60510e3          	bnez	a0,80002c2c <__printf+0xa4>
    80002fd0:	e40c0ee3          	beqz	s8,80002e2c <__printf+0x2a4>
    80002fd4:	00004517          	auipc	a0,0x4
    80002fd8:	cbc50513          	addi	a0,a0,-836 # 80006c90 <pr>
    80002fdc:	00001097          	auipc	ra,0x1
    80002fe0:	94c080e7          	jalr	-1716(ra) # 80003928 <release>
    80002fe4:	e49ff06f          	j	80002e2c <__printf+0x2a4>
    80002fe8:	f7843783          	ld	a5,-136(s0)
    80002fec:	03000513          	li	a0,48
    80002ff0:	01000d13          	li	s10,16
    80002ff4:	00878713          	addi	a4,a5,8
    80002ff8:	0007bc83          	ld	s9,0(a5)
    80002ffc:	f6e43c23          	sd	a4,-136(s0)
    80003000:	00000097          	auipc	ra,0x0
    80003004:	9a4080e7          	jalr	-1628(ra) # 800029a4 <consputc>
    80003008:	07800513          	li	a0,120
    8000300c:	00000097          	auipc	ra,0x0
    80003010:	998080e7          	jalr	-1640(ra) # 800029a4 <consputc>
    80003014:	00002d97          	auipc	s11,0x2
    80003018:	33cd8d93          	addi	s11,s11,828 # 80005350 <digits>
    8000301c:	03ccd793          	srli	a5,s9,0x3c
    80003020:	00fd87b3          	add	a5,s11,a5
    80003024:	0007c503          	lbu	a0,0(a5)
    80003028:	fffd0d1b          	addiw	s10,s10,-1
    8000302c:	004c9c93          	slli	s9,s9,0x4
    80003030:	00000097          	auipc	ra,0x0
    80003034:	974080e7          	jalr	-1676(ra) # 800029a4 <consputc>
    80003038:	fe0d12e3          	bnez	s10,8000301c <__printf+0x494>
    8000303c:	f8dff06f          	j	80002fc8 <__printf+0x440>
    80003040:	f7843783          	ld	a5,-136(s0)
    80003044:	0007bc83          	ld	s9,0(a5)
    80003048:	00878793          	addi	a5,a5,8
    8000304c:	f6f43c23          	sd	a5,-136(s0)
    80003050:	000c9a63          	bnez	s9,80003064 <__printf+0x4dc>
    80003054:	1080006f          	j	8000315c <__printf+0x5d4>
    80003058:	001c8c93          	addi	s9,s9,1
    8000305c:	00000097          	auipc	ra,0x0
    80003060:	948080e7          	jalr	-1720(ra) # 800029a4 <consputc>
    80003064:	000cc503          	lbu	a0,0(s9)
    80003068:	fe0518e3          	bnez	a0,80003058 <__printf+0x4d0>
    8000306c:	f5dff06f          	j	80002fc8 <__printf+0x440>
    80003070:	02500513          	li	a0,37
    80003074:	00000097          	auipc	ra,0x0
    80003078:	930080e7          	jalr	-1744(ra) # 800029a4 <consputc>
    8000307c:	000c8513          	mv	a0,s9
    80003080:	00000097          	auipc	ra,0x0
    80003084:	924080e7          	jalr	-1756(ra) # 800029a4 <consputc>
    80003088:	f41ff06f          	j	80002fc8 <__printf+0x440>
    8000308c:	02500513          	li	a0,37
    80003090:	00000097          	auipc	ra,0x0
    80003094:	914080e7          	jalr	-1772(ra) # 800029a4 <consputc>
    80003098:	f31ff06f          	j	80002fc8 <__printf+0x440>
    8000309c:	00030513          	mv	a0,t1
    800030a0:	00000097          	auipc	ra,0x0
    800030a4:	7bc080e7          	jalr	1980(ra) # 8000385c <acquire>
    800030a8:	b4dff06f          	j	80002bf4 <__printf+0x6c>
    800030ac:	40c0053b          	negw	a0,a2
    800030b0:	00a00713          	li	a4,10
    800030b4:	02e576bb          	remuw	a3,a0,a4
    800030b8:	00002d97          	auipc	s11,0x2
    800030bc:	298d8d93          	addi	s11,s11,664 # 80005350 <digits>
    800030c0:	ff700593          	li	a1,-9
    800030c4:	02069693          	slli	a3,a3,0x20
    800030c8:	0206d693          	srli	a3,a3,0x20
    800030cc:	00dd86b3          	add	a3,s11,a3
    800030d0:	0006c683          	lbu	a3,0(a3)
    800030d4:	02e557bb          	divuw	a5,a0,a4
    800030d8:	f8d40023          	sb	a3,-128(s0)
    800030dc:	10b65e63          	bge	a2,a1,800031f8 <__printf+0x670>
    800030e0:	06300593          	li	a1,99
    800030e4:	02e7f6bb          	remuw	a3,a5,a4
    800030e8:	02069693          	slli	a3,a3,0x20
    800030ec:	0206d693          	srli	a3,a3,0x20
    800030f0:	00dd86b3          	add	a3,s11,a3
    800030f4:	0006c683          	lbu	a3,0(a3)
    800030f8:	02e7d73b          	divuw	a4,a5,a4
    800030fc:	00200793          	li	a5,2
    80003100:	f8d400a3          	sb	a3,-127(s0)
    80003104:	bca5ece3          	bltu	a1,a0,80002cdc <__printf+0x154>
    80003108:	ce5ff06f          	j	80002dec <__printf+0x264>
    8000310c:	40e007bb          	negw	a5,a4
    80003110:	00002d97          	auipc	s11,0x2
    80003114:	240d8d93          	addi	s11,s11,576 # 80005350 <digits>
    80003118:	00f7f693          	andi	a3,a5,15
    8000311c:	00dd86b3          	add	a3,s11,a3
    80003120:	0006c583          	lbu	a1,0(a3)
    80003124:	ff100613          	li	a2,-15
    80003128:	0047d69b          	srliw	a3,a5,0x4
    8000312c:	f8b40023          	sb	a1,-128(s0)
    80003130:	0047d59b          	srliw	a1,a5,0x4
    80003134:	0ac75e63          	bge	a4,a2,800031f0 <__printf+0x668>
    80003138:	00f6f693          	andi	a3,a3,15
    8000313c:	00dd86b3          	add	a3,s11,a3
    80003140:	0006c603          	lbu	a2,0(a3)
    80003144:	00f00693          	li	a3,15
    80003148:	0087d79b          	srliw	a5,a5,0x8
    8000314c:	f8c400a3          	sb	a2,-127(s0)
    80003150:	d8b6e4e3          	bltu	a3,a1,80002ed8 <__printf+0x350>
    80003154:	00200793          	li	a5,2
    80003158:	e2dff06f          	j	80002f84 <__printf+0x3fc>
    8000315c:	00002c97          	auipc	s9,0x2
    80003160:	1d4c8c93          	addi	s9,s9,468 # 80005330 <_ZZ12printIntegermE6digits+0x310>
    80003164:	02800513          	li	a0,40
    80003168:	ef1ff06f          	j	80003058 <__printf+0x4d0>
    8000316c:	00700793          	li	a5,7
    80003170:	00600c93          	li	s9,6
    80003174:	e0dff06f          	j	80002f80 <__printf+0x3f8>
    80003178:	00700793          	li	a5,7
    8000317c:	00600c93          	li	s9,6
    80003180:	c69ff06f          	j	80002de8 <__printf+0x260>
    80003184:	00300793          	li	a5,3
    80003188:	00200c93          	li	s9,2
    8000318c:	c5dff06f          	j	80002de8 <__printf+0x260>
    80003190:	00300793          	li	a5,3
    80003194:	00200c93          	li	s9,2
    80003198:	de9ff06f          	j	80002f80 <__printf+0x3f8>
    8000319c:	00400793          	li	a5,4
    800031a0:	00300c93          	li	s9,3
    800031a4:	dddff06f          	j	80002f80 <__printf+0x3f8>
    800031a8:	00400793          	li	a5,4
    800031ac:	00300c93          	li	s9,3
    800031b0:	c39ff06f          	j	80002de8 <__printf+0x260>
    800031b4:	00500793          	li	a5,5
    800031b8:	00400c93          	li	s9,4
    800031bc:	c2dff06f          	j	80002de8 <__printf+0x260>
    800031c0:	00500793          	li	a5,5
    800031c4:	00400c93          	li	s9,4
    800031c8:	db9ff06f          	j	80002f80 <__printf+0x3f8>
    800031cc:	00600793          	li	a5,6
    800031d0:	00500c93          	li	s9,5
    800031d4:	dadff06f          	j	80002f80 <__printf+0x3f8>
    800031d8:	00600793          	li	a5,6
    800031dc:	00500c93          	li	s9,5
    800031e0:	c09ff06f          	j	80002de8 <__printf+0x260>
    800031e4:	00800793          	li	a5,8
    800031e8:	00700c93          	li	s9,7
    800031ec:	bfdff06f          	j	80002de8 <__printf+0x260>
    800031f0:	00100793          	li	a5,1
    800031f4:	d91ff06f          	j	80002f84 <__printf+0x3fc>
    800031f8:	00100793          	li	a5,1
    800031fc:	bf1ff06f          	j	80002dec <__printf+0x264>
    80003200:	00900793          	li	a5,9
    80003204:	00800c93          	li	s9,8
    80003208:	be1ff06f          	j	80002de8 <__printf+0x260>
    8000320c:	00002517          	auipc	a0,0x2
    80003210:	12c50513          	addi	a0,a0,300 # 80005338 <_ZZ12printIntegermE6digits+0x318>
    80003214:	00000097          	auipc	ra,0x0
    80003218:	918080e7          	jalr	-1768(ra) # 80002b2c <panic>

000000008000321c <printfinit>:
    8000321c:	fe010113          	addi	sp,sp,-32
    80003220:	00813823          	sd	s0,16(sp)
    80003224:	00913423          	sd	s1,8(sp)
    80003228:	00113c23          	sd	ra,24(sp)
    8000322c:	02010413          	addi	s0,sp,32
    80003230:	00004497          	auipc	s1,0x4
    80003234:	a6048493          	addi	s1,s1,-1440 # 80006c90 <pr>
    80003238:	00048513          	mv	a0,s1
    8000323c:	00002597          	auipc	a1,0x2
    80003240:	10c58593          	addi	a1,a1,268 # 80005348 <_ZZ12printIntegermE6digits+0x328>
    80003244:	00000097          	auipc	ra,0x0
    80003248:	5f4080e7          	jalr	1524(ra) # 80003838 <initlock>
    8000324c:	01813083          	ld	ra,24(sp)
    80003250:	01013403          	ld	s0,16(sp)
    80003254:	0004ac23          	sw	zero,24(s1)
    80003258:	00813483          	ld	s1,8(sp)
    8000325c:	02010113          	addi	sp,sp,32
    80003260:	00008067          	ret

0000000080003264 <uartinit>:
    80003264:	ff010113          	addi	sp,sp,-16
    80003268:	00813423          	sd	s0,8(sp)
    8000326c:	01010413          	addi	s0,sp,16
    80003270:	100007b7          	lui	a5,0x10000
    80003274:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80003278:	f8000713          	li	a4,-128
    8000327c:	00e781a3          	sb	a4,3(a5)
    80003280:	00300713          	li	a4,3
    80003284:	00e78023          	sb	a4,0(a5)
    80003288:	000780a3          	sb	zero,1(a5)
    8000328c:	00e781a3          	sb	a4,3(a5)
    80003290:	00700693          	li	a3,7
    80003294:	00d78123          	sb	a3,2(a5)
    80003298:	00e780a3          	sb	a4,1(a5)
    8000329c:	00813403          	ld	s0,8(sp)
    800032a0:	01010113          	addi	sp,sp,16
    800032a4:	00008067          	ret

00000000800032a8 <uartputc>:
    800032a8:	00002797          	auipc	a5,0x2
    800032ac:	7607a783          	lw	a5,1888(a5) # 80005a08 <panicked>
    800032b0:	00078463          	beqz	a5,800032b8 <uartputc+0x10>
    800032b4:	0000006f          	j	800032b4 <uartputc+0xc>
    800032b8:	fd010113          	addi	sp,sp,-48
    800032bc:	02813023          	sd	s0,32(sp)
    800032c0:	00913c23          	sd	s1,24(sp)
    800032c4:	01213823          	sd	s2,16(sp)
    800032c8:	01313423          	sd	s3,8(sp)
    800032cc:	02113423          	sd	ra,40(sp)
    800032d0:	03010413          	addi	s0,sp,48
    800032d4:	00002917          	auipc	s2,0x2
    800032d8:	73c90913          	addi	s2,s2,1852 # 80005a10 <uart_tx_r>
    800032dc:	00093783          	ld	a5,0(s2)
    800032e0:	00002497          	auipc	s1,0x2
    800032e4:	73848493          	addi	s1,s1,1848 # 80005a18 <uart_tx_w>
    800032e8:	0004b703          	ld	a4,0(s1)
    800032ec:	02078693          	addi	a3,a5,32
    800032f0:	00050993          	mv	s3,a0
    800032f4:	02e69c63          	bne	a3,a4,8000332c <uartputc+0x84>
    800032f8:	00001097          	auipc	ra,0x1
    800032fc:	834080e7          	jalr	-1996(ra) # 80003b2c <push_on>
    80003300:	00093783          	ld	a5,0(s2)
    80003304:	0004b703          	ld	a4,0(s1)
    80003308:	02078793          	addi	a5,a5,32
    8000330c:	00e79463          	bne	a5,a4,80003314 <uartputc+0x6c>
    80003310:	0000006f          	j	80003310 <uartputc+0x68>
    80003314:	00001097          	auipc	ra,0x1
    80003318:	88c080e7          	jalr	-1908(ra) # 80003ba0 <pop_on>
    8000331c:	00093783          	ld	a5,0(s2)
    80003320:	0004b703          	ld	a4,0(s1)
    80003324:	02078693          	addi	a3,a5,32
    80003328:	fce688e3          	beq	a3,a4,800032f8 <uartputc+0x50>
    8000332c:	01f77693          	andi	a3,a4,31
    80003330:	00004597          	auipc	a1,0x4
    80003334:	98058593          	addi	a1,a1,-1664 # 80006cb0 <uart_tx_buf>
    80003338:	00d586b3          	add	a3,a1,a3
    8000333c:	00170713          	addi	a4,a4,1
    80003340:	01368023          	sb	s3,0(a3)
    80003344:	00e4b023          	sd	a4,0(s1)
    80003348:	10000637          	lui	a2,0x10000
    8000334c:	02f71063          	bne	a4,a5,8000336c <uartputc+0xc4>
    80003350:	0340006f          	j	80003384 <uartputc+0xdc>
    80003354:	00074703          	lbu	a4,0(a4)
    80003358:	00f93023          	sd	a5,0(s2)
    8000335c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80003360:	00093783          	ld	a5,0(s2)
    80003364:	0004b703          	ld	a4,0(s1)
    80003368:	00f70e63          	beq	a4,a5,80003384 <uartputc+0xdc>
    8000336c:	00564683          	lbu	a3,5(a2)
    80003370:	01f7f713          	andi	a4,a5,31
    80003374:	00e58733          	add	a4,a1,a4
    80003378:	0206f693          	andi	a3,a3,32
    8000337c:	00178793          	addi	a5,a5,1
    80003380:	fc069ae3          	bnez	a3,80003354 <uartputc+0xac>
    80003384:	02813083          	ld	ra,40(sp)
    80003388:	02013403          	ld	s0,32(sp)
    8000338c:	01813483          	ld	s1,24(sp)
    80003390:	01013903          	ld	s2,16(sp)
    80003394:	00813983          	ld	s3,8(sp)
    80003398:	03010113          	addi	sp,sp,48
    8000339c:	00008067          	ret

00000000800033a0 <uartputc_sync>:
    800033a0:	ff010113          	addi	sp,sp,-16
    800033a4:	00813423          	sd	s0,8(sp)
    800033a8:	01010413          	addi	s0,sp,16
    800033ac:	00002717          	auipc	a4,0x2
    800033b0:	65c72703          	lw	a4,1628(a4) # 80005a08 <panicked>
    800033b4:	02071663          	bnez	a4,800033e0 <uartputc_sync+0x40>
    800033b8:	00050793          	mv	a5,a0
    800033bc:	100006b7          	lui	a3,0x10000
    800033c0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    800033c4:	02077713          	andi	a4,a4,32
    800033c8:	fe070ce3          	beqz	a4,800033c0 <uartputc_sync+0x20>
    800033cc:	0ff7f793          	andi	a5,a5,255
    800033d0:	00f68023          	sb	a5,0(a3)
    800033d4:	00813403          	ld	s0,8(sp)
    800033d8:	01010113          	addi	sp,sp,16
    800033dc:	00008067          	ret
    800033e0:	0000006f          	j	800033e0 <uartputc_sync+0x40>

00000000800033e4 <uartstart>:
    800033e4:	ff010113          	addi	sp,sp,-16
    800033e8:	00813423          	sd	s0,8(sp)
    800033ec:	01010413          	addi	s0,sp,16
    800033f0:	00002617          	auipc	a2,0x2
    800033f4:	62060613          	addi	a2,a2,1568 # 80005a10 <uart_tx_r>
    800033f8:	00002517          	auipc	a0,0x2
    800033fc:	62050513          	addi	a0,a0,1568 # 80005a18 <uart_tx_w>
    80003400:	00063783          	ld	a5,0(a2)
    80003404:	00053703          	ld	a4,0(a0)
    80003408:	04f70263          	beq	a4,a5,8000344c <uartstart+0x68>
    8000340c:	100005b7          	lui	a1,0x10000
    80003410:	00004817          	auipc	a6,0x4
    80003414:	8a080813          	addi	a6,a6,-1888 # 80006cb0 <uart_tx_buf>
    80003418:	01c0006f          	j	80003434 <uartstart+0x50>
    8000341c:	0006c703          	lbu	a4,0(a3)
    80003420:	00f63023          	sd	a5,0(a2)
    80003424:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80003428:	00063783          	ld	a5,0(a2)
    8000342c:	00053703          	ld	a4,0(a0)
    80003430:	00f70e63          	beq	a4,a5,8000344c <uartstart+0x68>
    80003434:	01f7f713          	andi	a4,a5,31
    80003438:	00e806b3          	add	a3,a6,a4
    8000343c:	0055c703          	lbu	a4,5(a1)
    80003440:	00178793          	addi	a5,a5,1
    80003444:	02077713          	andi	a4,a4,32
    80003448:	fc071ae3          	bnez	a4,8000341c <uartstart+0x38>
    8000344c:	00813403          	ld	s0,8(sp)
    80003450:	01010113          	addi	sp,sp,16
    80003454:	00008067          	ret

0000000080003458 <uartgetc>:
    80003458:	ff010113          	addi	sp,sp,-16
    8000345c:	00813423          	sd	s0,8(sp)
    80003460:	01010413          	addi	s0,sp,16
    80003464:	10000737          	lui	a4,0x10000
    80003468:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000346c:	0017f793          	andi	a5,a5,1
    80003470:	00078c63          	beqz	a5,80003488 <uartgetc+0x30>
    80003474:	00074503          	lbu	a0,0(a4)
    80003478:	0ff57513          	andi	a0,a0,255
    8000347c:	00813403          	ld	s0,8(sp)
    80003480:	01010113          	addi	sp,sp,16
    80003484:	00008067          	ret
    80003488:	fff00513          	li	a0,-1
    8000348c:	ff1ff06f          	j	8000347c <uartgetc+0x24>

0000000080003490 <uartintr>:
    80003490:	100007b7          	lui	a5,0x10000
    80003494:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80003498:	0017f793          	andi	a5,a5,1
    8000349c:	0a078463          	beqz	a5,80003544 <uartintr+0xb4>
    800034a0:	fe010113          	addi	sp,sp,-32
    800034a4:	00813823          	sd	s0,16(sp)
    800034a8:	00913423          	sd	s1,8(sp)
    800034ac:	00113c23          	sd	ra,24(sp)
    800034b0:	02010413          	addi	s0,sp,32
    800034b4:	100004b7          	lui	s1,0x10000
    800034b8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    800034bc:	0ff57513          	andi	a0,a0,255
    800034c0:	fffff097          	auipc	ra,0xfffff
    800034c4:	534080e7          	jalr	1332(ra) # 800029f4 <consoleintr>
    800034c8:	0054c783          	lbu	a5,5(s1)
    800034cc:	0017f793          	andi	a5,a5,1
    800034d0:	fe0794e3          	bnez	a5,800034b8 <uartintr+0x28>
    800034d4:	00002617          	auipc	a2,0x2
    800034d8:	53c60613          	addi	a2,a2,1340 # 80005a10 <uart_tx_r>
    800034dc:	00002517          	auipc	a0,0x2
    800034e0:	53c50513          	addi	a0,a0,1340 # 80005a18 <uart_tx_w>
    800034e4:	00063783          	ld	a5,0(a2)
    800034e8:	00053703          	ld	a4,0(a0)
    800034ec:	04f70263          	beq	a4,a5,80003530 <uartintr+0xa0>
    800034f0:	100005b7          	lui	a1,0x10000
    800034f4:	00003817          	auipc	a6,0x3
    800034f8:	7bc80813          	addi	a6,a6,1980 # 80006cb0 <uart_tx_buf>
    800034fc:	01c0006f          	j	80003518 <uartintr+0x88>
    80003500:	0006c703          	lbu	a4,0(a3)
    80003504:	00f63023          	sd	a5,0(a2)
    80003508:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000350c:	00063783          	ld	a5,0(a2)
    80003510:	00053703          	ld	a4,0(a0)
    80003514:	00f70e63          	beq	a4,a5,80003530 <uartintr+0xa0>
    80003518:	01f7f713          	andi	a4,a5,31
    8000351c:	00e806b3          	add	a3,a6,a4
    80003520:	0055c703          	lbu	a4,5(a1)
    80003524:	00178793          	addi	a5,a5,1
    80003528:	02077713          	andi	a4,a4,32
    8000352c:	fc071ae3          	bnez	a4,80003500 <uartintr+0x70>
    80003530:	01813083          	ld	ra,24(sp)
    80003534:	01013403          	ld	s0,16(sp)
    80003538:	00813483          	ld	s1,8(sp)
    8000353c:	02010113          	addi	sp,sp,32
    80003540:	00008067          	ret
    80003544:	00002617          	auipc	a2,0x2
    80003548:	4cc60613          	addi	a2,a2,1228 # 80005a10 <uart_tx_r>
    8000354c:	00002517          	auipc	a0,0x2
    80003550:	4cc50513          	addi	a0,a0,1228 # 80005a18 <uart_tx_w>
    80003554:	00063783          	ld	a5,0(a2)
    80003558:	00053703          	ld	a4,0(a0)
    8000355c:	04f70263          	beq	a4,a5,800035a0 <uartintr+0x110>
    80003560:	100005b7          	lui	a1,0x10000
    80003564:	00003817          	auipc	a6,0x3
    80003568:	74c80813          	addi	a6,a6,1868 # 80006cb0 <uart_tx_buf>
    8000356c:	01c0006f          	j	80003588 <uartintr+0xf8>
    80003570:	0006c703          	lbu	a4,0(a3)
    80003574:	00f63023          	sd	a5,0(a2)
    80003578:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000357c:	00063783          	ld	a5,0(a2)
    80003580:	00053703          	ld	a4,0(a0)
    80003584:	02f70063          	beq	a4,a5,800035a4 <uartintr+0x114>
    80003588:	01f7f713          	andi	a4,a5,31
    8000358c:	00e806b3          	add	a3,a6,a4
    80003590:	0055c703          	lbu	a4,5(a1)
    80003594:	00178793          	addi	a5,a5,1
    80003598:	02077713          	andi	a4,a4,32
    8000359c:	fc071ae3          	bnez	a4,80003570 <uartintr+0xe0>
    800035a0:	00008067          	ret
    800035a4:	00008067          	ret

00000000800035a8 <kinit>:
    800035a8:	fc010113          	addi	sp,sp,-64
    800035ac:	02913423          	sd	s1,40(sp)
    800035b0:	fffff7b7          	lui	a5,0xfffff
    800035b4:	00004497          	auipc	s1,0x4
    800035b8:	71b48493          	addi	s1,s1,1819 # 80007ccf <end+0xfff>
    800035bc:	02813823          	sd	s0,48(sp)
    800035c0:	01313c23          	sd	s3,24(sp)
    800035c4:	00f4f4b3          	and	s1,s1,a5
    800035c8:	02113c23          	sd	ra,56(sp)
    800035cc:	03213023          	sd	s2,32(sp)
    800035d0:	01413823          	sd	s4,16(sp)
    800035d4:	01513423          	sd	s5,8(sp)
    800035d8:	04010413          	addi	s0,sp,64
    800035dc:	000017b7          	lui	a5,0x1
    800035e0:	01100993          	li	s3,17
    800035e4:	00f487b3          	add	a5,s1,a5
    800035e8:	01b99993          	slli	s3,s3,0x1b
    800035ec:	06f9e063          	bltu	s3,a5,8000364c <kinit+0xa4>
    800035f0:	00003a97          	auipc	s5,0x3
    800035f4:	6e0a8a93          	addi	s5,s5,1760 # 80006cd0 <end>
    800035f8:	0754ec63          	bltu	s1,s5,80003670 <kinit+0xc8>
    800035fc:	0734fa63          	bgeu	s1,s3,80003670 <kinit+0xc8>
    80003600:	00088a37          	lui	s4,0x88
    80003604:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80003608:	00002917          	auipc	s2,0x2
    8000360c:	41890913          	addi	s2,s2,1048 # 80005a20 <kmem>
    80003610:	00ca1a13          	slli	s4,s4,0xc
    80003614:	0140006f          	j	80003628 <kinit+0x80>
    80003618:	000017b7          	lui	a5,0x1
    8000361c:	00f484b3          	add	s1,s1,a5
    80003620:	0554e863          	bltu	s1,s5,80003670 <kinit+0xc8>
    80003624:	0534f663          	bgeu	s1,s3,80003670 <kinit+0xc8>
    80003628:	00001637          	lui	a2,0x1
    8000362c:	00100593          	li	a1,1
    80003630:	00048513          	mv	a0,s1
    80003634:	00000097          	auipc	ra,0x0
    80003638:	5e4080e7          	jalr	1508(ra) # 80003c18 <__memset>
    8000363c:	00093783          	ld	a5,0(s2)
    80003640:	00f4b023          	sd	a5,0(s1)
    80003644:	00993023          	sd	s1,0(s2)
    80003648:	fd4498e3          	bne	s1,s4,80003618 <kinit+0x70>
    8000364c:	03813083          	ld	ra,56(sp)
    80003650:	03013403          	ld	s0,48(sp)
    80003654:	02813483          	ld	s1,40(sp)
    80003658:	02013903          	ld	s2,32(sp)
    8000365c:	01813983          	ld	s3,24(sp)
    80003660:	01013a03          	ld	s4,16(sp)
    80003664:	00813a83          	ld	s5,8(sp)
    80003668:	04010113          	addi	sp,sp,64
    8000366c:	00008067          	ret
    80003670:	00002517          	auipc	a0,0x2
    80003674:	cf850513          	addi	a0,a0,-776 # 80005368 <digits+0x18>
    80003678:	fffff097          	auipc	ra,0xfffff
    8000367c:	4b4080e7          	jalr	1204(ra) # 80002b2c <panic>

0000000080003680 <freerange>:
    80003680:	fc010113          	addi	sp,sp,-64
    80003684:	000017b7          	lui	a5,0x1
    80003688:	02913423          	sd	s1,40(sp)
    8000368c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80003690:	009504b3          	add	s1,a0,s1
    80003694:	fffff537          	lui	a0,0xfffff
    80003698:	02813823          	sd	s0,48(sp)
    8000369c:	02113c23          	sd	ra,56(sp)
    800036a0:	03213023          	sd	s2,32(sp)
    800036a4:	01313c23          	sd	s3,24(sp)
    800036a8:	01413823          	sd	s4,16(sp)
    800036ac:	01513423          	sd	s5,8(sp)
    800036b0:	01613023          	sd	s6,0(sp)
    800036b4:	04010413          	addi	s0,sp,64
    800036b8:	00a4f4b3          	and	s1,s1,a0
    800036bc:	00f487b3          	add	a5,s1,a5
    800036c0:	06f5e463          	bltu	a1,a5,80003728 <freerange+0xa8>
    800036c4:	00003a97          	auipc	s5,0x3
    800036c8:	60ca8a93          	addi	s5,s5,1548 # 80006cd0 <end>
    800036cc:	0954e263          	bltu	s1,s5,80003750 <freerange+0xd0>
    800036d0:	01100993          	li	s3,17
    800036d4:	01b99993          	slli	s3,s3,0x1b
    800036d8:	0734fc63          	bgeu	s1,s3,80003750 <freerange+0xd0>
    800036dc:	00058a13          	mv	s4,a1
    800036e0:	00002917          	auipc	s2,0x2
    800036e4:	34090913          	addi	s2,s2,832 # 80005a20 <kmem>
    800036e8:	00002b37          	lui	s6,0x2
    800036ec:	0140006f          	j	80003700 <freerange+0x80>
    800036f0:	000017b7          	lui	a5,0x1
    800036f4:	00f484b3          	add	s1,s1,a5
    800036f8:	0554ec63          	bltu	s1,s5,80003750 <freerange+0xd0>
    800036fc:	0534fa63          	bgeu	s1,s3,80003750 <freerange+0xd0>
    80003700:	00001637          	lui	a2,0x1
    80003704:	00100593          	li	a1,1
    80003708:	00048513          	mv	a0,s1
    8000370c:	00000097          	auipc	ra,0x0
    80003710:	50c080e7          	jalr	1292(ra) # 80003c18 <__memset>
    80003714:	00093703          	ld	a4,0(s2)
    80003718:	016487b3          	add	a5,s1,s6
    8000371c:	00e4b023          	sd	a4,0(s1)
    80003720:	00993023          	sd	s1,0(s2)
    80003724:	fcfa76e3          	bgeu	s4,a5,800036f0 <freerange+0x70>
    80003728:	03813083          	ld	ra,56(sp)
    8000372c:	03013403          	ld	s0,48(sp)
    80003730:	02813483          	ld	s1,40(sp)
    80003734:	02013903          	ld	s2,32(sp)
    80003738:	01813983          	ld	s3,24(sp)
    8000373c:	01013a03          	ld	s4,16(sp)
    80003740:	00813a83          	ld	s5,8(sp)
    80003744:	00013b03          	ld	s6,0(sp)
    80003748:	04010113          	addi	sp,sp,64
    8000374c:	00008067          	ret
    80003750:	00002517          	auipc	a0,0x2
    80003754:	c1850513          	addi	a0,a0,-1000 # 80005368 <digits+0x18>
    80003758:	fffff097          	auipc	ra,0xfffff
    8000375c:	3d4080e7          	jalr	980(ra) # 80002b2c <panic>

0000000080003760 <kfree>:
    80003760:	fe010113          	addi	sp,sp,-32
    80003764:	00813823          	sd	s0,16(sp)
    80003768:	00113c23          	sd	ra,24(sp)
    8000376c:	00913423          	sd	s1,8(sp)
    80003770:	02010413          	addi	s0,sp,32
    80003774:	03451793          	slli	a5,a0,0x34
    80003778:	04079c63          	bnez	a5,800037d0 <kfree+0x70>
    8000377c:	00003797          	auipc	a5,0x3
    80003780:	55478793          	addi	a5,a5,1364 # 80006cd0 <end>
    80003784:	00050493          	mv	s1,a0
    80003788:	04f56463          	bltu	a0,a5,800037d0 <kfree+0x70>
    8000378c:	01100793          	li	a5,17
    80003790:	01b79793          	slli	a5,a5,0x1b
    80003794:	02f57e63          	bgeu	a0,a5,800037d0 <kfree+0x70>
    80003798:	00001637          	lui	a2,0x1
    8000379c:	00100593          	li	a1,1
    800037a0:	00000097          	auipc	ra,0x0
    800037a4:	478080e7          	jalr	1144(ra) # 80003c18 <__memset>
    800037a8:	00002797          	auipc	a5,0x2
    800037ac:	27878793          	addi	a5,a5,632 # 80005a20 <kmem>
    800037b0:	0007b703          	ld	a4,0(a5)
    800037b4:	01813083          	ld	ra,24(sp)
    800037b8:	01013403          	ld	s0,16(sp)
    800037bc:	00e4b023          	sd	a4,0(s1)
    800037c0:	0097b023          	sd	s1,0(a5)
    800037c4:	00813483          	ld	s1,8(sp)
    800037c8:	02010113          	addi	sp,sp,32
    800037cc:	00008067          	ret
    800037d0:	00002517          	auipc	a0,0x2
    800037d4:	b9850513          	addi	a0,a0,-1128 # 80005368 <digits+0x18>
    800037d8:	fffff097          	auipc	ra,0xfffff
    800037dc:	354080e7          	jalr	852(ra) # 80002b2c <panic>

00000000800037e0 <kalloc>:
    800037e0:	fe010113          	addi	sp,sp,-32
    800037e4:	00813823          	sd	s0,16(sp)
    800037e8:	00913423          	sd	s1,8(sp)
    800037ec:	00113c23          	sd	ra,24(sp)
    800037f0:	02010413          	addi	s0,sp,32
    800037f4:	00002797          	auipc	a5,0x2
    800037f8:	22c78793          	addi	a5,a5,556 # 80005a20 <kmem>
    800037fc:	0007b483          	ld	s1,0(a5)
    80003800:	02048063          	beqz	s1,80003820 <kalloc+0x40>
    80003804:	0004b703          	ld	a4,0(s1)
    80003808:	00001637          	lui	a2,0x1
    8000380c:	00500593          	li	a1,5
    80003810:	00048513          	mv	a0,s1
    80003814:	00e7b023          	sd	a4,0(a5)
    80003818:	00000097          	auipc	ra,0x0
    8000381c:	400080e7          	jalr	1024(ra) # 80003c18 <__memset>
    80003820:	01813083          	ld	ra,24(sp)
    80003824:	01013403          	ld	s0,16(sp)
    80003828:	00048513          	mv	a0,s1
    8000382c:	00813483          	ld	s1,8(sp)
    80003830:	02010113          	addi	sp,sp,32
    80003834:	00008067          	ret

0000000080003838 <initlock>:
    80003838:	ff010113          	addi	sp,sp,-16
    8000383c:	00813423          	sd	s0,8(sp)
    80003840:	01010413          	addi	s0,sp,16
    80003844:	00813403          	ld	s0,8(sp)
    80003848:	00b53423          	sd	a1,8(a0)
    8000384c:	00052023          	sw	zero,0(a0)
    80003850:	00053823          	sd	zero,16(a0)
    80003854:	01010113          	addi	sp,sp,16
    80003858:	00008067          	ret

000000008000385c <acquire>:
    8000385c:	fe010113          	addi	sp,sp,-32
    80003860:	00813823          	sd	s0,16(sp)
    80003864:	00913423          	sd	s1,8(sp)
    80003868:	00113c23          	sd	ra,24(sp)
    8000386c:	01213023          	sd	s2,0(sp)
    80003870:	02010413          	addi	s0,sp,32
    80003874:	00050493          	mv	s1,a0
    80003878:	10002973          	csrr	s2,sstatus
    8000387c:	100027f3          	csrr	a5,sstatus
    80003880:	ffd7f793          	andi	a5,a5,-3
    80003884:	10079073          	csrw	sstatus,a5
    80003888:	fffff097          	auipc	ra,0xfffff
    8000388c:	8e8080e7          	jalr	-1816(ra) # 80002170 <mycpu>
    80003890:	07852783          	lw	a5,120(a0)
    80003894:	06078e63          	beqz	a5,80003910 <acquire+0xb4>
    80003898:	fffff097          	auipc	ra,0xfffff
    8000389c:	8d8080e7          	jalr	-1832(ra) # 80002170 <mycpu>
    800038a0:	07852783          	lw	a5,120(a0)
    800038a4:	0004a703          	lw	a4,0(s1)
    800038a8:	0017879b          	addiw	a5,a5,1
    800038ac:	06f52c23          	sw	a5,120(a0)
    800038b0:	04071063          	bnez	a4,800038f0 <acquire+0x94>
    800038b4:	00100713          	li	a4,1
    800038b8:	00070793          	mv	a5,a4
    800038bc:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    800038c0:	0007879b          	sext.w	a5,a5
    800038c4:	fe079ae3          	bnez	a5,800038b8 <acquire+0x5c>
    800038c8:	0ff0000f          	fence
    800038cc:	fffff097          	auipc	ra,0xfffff
    800038d0:	8a4080e7          	jalr	-1884(ra) # 80002170 <mycpu>
    800038d4:	01813083          	ld	ra,24(sp)
    800038d8:	01013403          	ld	s0,16(sp)
    800038dc:	00a4b823          	sd	a0,16(s1)
    800038e0:	00013903          	ld	s2,0(sp)
    800038e4:	00813483          	ld	s1,8(sp)
    800038e8:	02010113          	addi	sp,sp,32
    800038ec:	00008067          	ret
    800038f0:	0104b903          	ld	s2,16(s1)
    800038f4:	fffff097          	auipc	ra,0xfffff
    800038f8:	87c080e7          	jalr	-1924(ra) # 80002170 <mycpu>
    800038fc:	faa91ce3          	bne	s2,a0,800038b4 <acquire+0x58>
    80003900:	00002517          	auipc	a0,0x2
    80003904:	a7050513          	addi	a0,a0,-1424 # 80005370 <digits+0x20>
    80003908:	fffff097          	auipc	ra,0xfffff
    8000390c:	224080e7          	jalr	548(ra) # 80002b2c <panic>
    80003910:	00195913          	srli	s2,s2,0x1
    80003914:	fffff097          	auipc	ra,0xfffff
    80003918:	85c080e7          	jalr	-1956(ra) # 80002170 <mycpu>
    8000391c:	00197913          	andi	s2,s2,1
    80003920:	07252e23          	sw	s2,124(a0)
    80003924:	f75ff06f          	j	80003898 <acquire+0x3c>

0000000080003928 <release>:
    80003928:	fe010113          	addi	sp,sp,-32
    8000392c:	00813823          	sd	s0,16(sp)
    80003930:	00113c23          	sd	ra,24(sp)
    80003934:	00913423          	sd	s1,8(sp)
    80003938:	01213023          	sd	s2,0(sp)
    8000393c:	02010413          	addi	s0,sp,32
    80003940:	00052783          	lw	a5,0(a0)
    80003944:	00079a63          	bnez	a5,80003958 <release+0x30>
    80003948:	00002517          	auipc	a0,0x2
    8000394c:	a3050513          	addi	a0,a0,-1488 # 80005378 <digits+0x28>
    80003950:	fffff097          	auipc	ra,0xfffff
    80003954:	1dc080e7          	jalr	476(ra) # 80002b2c <panic>
    80003958:	01053903          	ld	s2,16(a0)
    8000395c:	00050493          	mv	s1,a0
    80003960:	fffff097          	auipc	ra,0xfffff
    80003964:	810080e7          	jalr	-2032(ra) # 80002170 <mycpu>
    80003968:	fea910e3          	bne	s2,a0,80003948 <release+0x20>
    8000396c:	0004b823          	sd	zero,16(s1)
    80003970:	0ff0000f          	fence
    80003974:	0f50000f          	fence	iorw,ow
    80003978:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000397c:	ffffe097          	auipc	ra,0xffffe
    80003980:	7f4080e7          	jalr	2036(ra) # 80002170 <mycpu>
    80003984:	100027f3          	csrr	a5,sstatus
    80003988:	0027f793          	andi	a5,a5,2
    8000398c:	04079a63          	bnez	a5,800039e0 <release+0xb8>
    80003990:	07852783          	lw	a5,120(a0)
    80003994:	02f05e63          	blez	a5,800039d0 <release+0xa8>
    80003998:	fff7871b          	addiw	a4,a5,-1
    8000399c:	06e52c23          	sw	a4,120(a0)
    800039a0:	00071c63          	bnez	a4,800039b8 <release+0x90>
    800039a4:	07c52783          	lw	a5,124(a0)
    800039a8:	00078863          	beqz	a5,800039b8 <release+0x90>
    800039ac:	100027f3          	csrr	a5,sstatus
    800039b0:	0027e793          	ori	a5,a5,2
    800039b4:	10079073          	csrw	sstatus,a5
    800039b8:	01813083          	ld	ra,24(sp)
    800039bc:	01013403          	ld	s0,16(sp)
    800039c0:	00813483          	ld	s1,8(sp)
    800039c4:	00013903          	ld	s2,0(sp)
    800039c8:	02010113          	addi	sp,sp,32
    800039cc:	00008067          	ret
    800039d0:	00002517          	auipc	a0,0x2
    800039d4:	9c850513          	addi	a0,a0,-1592 # 80005398 <digits+0x48>
    800039d8:	fffff097          	auipc	ra,0xfffff
    800039dc:	154080e7          	jalr	340(ra) # 80002b2c <panic>
    800039e0:	00002517          	auipc	a0,0x2
    800039e4:	9a050513          	addi	a0,a0,-1632 # 80005380 <digits+0x30>
    800039e8:	fffff097          	auipc	ra,0xfffff
    800039ec:	144080e7          	jalr	324(ra) # 80002b2c <panic>

00000000800039f0 <holding>:
    800039f0:	00052783          	lw	a5,0(a0)
    800039f4:	00079663          	bnez	a5,80003a00 <holding+0x10>
    800039f8:	00000513          	li	a0,0
    800039fc:	00008067          	ret
    80003a00:	fe010113          	addi	sp,sp,-32
    80003a04:	00813823          	sd	s0,16(sp)
    80003a08:	00913423          	sd	s1,8(sp)
    80003a0c:	00113c23          	sd	ra,24(sp)
    80003a10:	02010413          	addi	s0,sp,32
    80003a14:	01053483          	ld	s1,16(a0)
    80003a18:	ffffe097          	auipc	ra,0xffffe
    80003a1c:	758080e7          	jalr	1880(ra) # 80002170 <mycpu>
    80003a20:	01813083          	ld	ra,24(sp)
    80003a24:	01013403          	ld	s0,16(sp)
    80003a28:	40a48533          	sub	a0,s1,a0
    80003a2c:	00153513          	seqz	a0,a0
    80003a30:	00813483          	ld	s1,8(sp)
    80003a34:	02010113          	addi	sp,sp,32
    80003a38:	00008067          	ret

0000000080003a3c <push_off>:
    80003a3c:	fe010113          	addi	sp,sp,-32
    80003a40:	00813823          	sd	s0,16(sp)
    80003a44:	00113c23          	sd	ra,24(sp)
    80003a48:	00913423          	sd	s1,8(sp)
    80003a4c:	02010413          	addi	s0,sp,32
    80003a50:	100024f3          	csrr	s1,sstatus
    80003a54:	100027f3          	csrr	a5,sstatus
    80003a58:	ffd7f793          	andi	a5,a5,-3
    80003a5c:	10079073          	csrw	sstatus,a5
    80003a60:	ffffe097          	auipc	ra,0xffffe
    80003a64:	710080e7          	jalr	1808(ra) # 80002170 <mycpu>
    80003a68:	07852783          	lw	a5,120(a0)
    80003a6c:	02078663          	beqz	a5,80003a98 <push_off+0x5c>
    80003a70:	ffffe097          	auipc	ra,0xffffe
    80003a74:	700080e7          	jalr	1792(ra) # 80002170 <mycpu>
    80003a78:	07852783          	lw	a5,120(a0)
    80003a7c:	01813083          	ld	ra,24(sp)
    80003a80:	01013403          	ld	s0,16(sp)
    80003a84:	0017879b          	addiw	a5,a5,1
    80003a88:	06f52c23          	sw	a5,120(a0)
    80003a8c:	00813483          	ld	s1,8(sp)
    80003a90:	02010113          	addi	sp,sp,32
    80003a94:	00008067          	ret
    80003a98:	0014d493          	srli	s1,s1,0x1
    80003a9c:	ffffe097          	auipc	ra,0xffffe
    80003aa0:	6d4080e7          	jalr	1748(ra) # 80002170 <mycpu>
    80003aa4:	0014f493          	andi	s1,s1,1
    80003aa8:	06952e23          	sw	s1,124(a0)
    80003aac:	fc5ff06f          	j	80003a70 <push_off+0x34>

0000000080003ab0 <pop_off>:
    80003ab0:	ff010113          	addi	sp,sp,-16
    80003ab4:	00813023          	sd	s0,0(sp)
    80003ab8:	00113423          	sd	ra,8(sp)
    80003abc:	01010413          	addi	s0,sp,16
    80003ac0:	ffffe097          	auipc	ra,0xffffe
    80003ac4:	6b0080e7          	jalr	1712(ra) # 80002170 <mycpu>
    80003ac8:	100027f3          	csrr	a5,sstatus
    80003acc:	0027f793          	andi	a5,a5,2
    80003ad0:	04079663          	bnez	a5,80003b1c <pop_off+0x6c>
    80003ad4:	07852783          	lw	a5,120(a0)
    80003ad8:	02f05a63          	blez	a5,80003b0c <pop_off+0x5c>
    80003adc:	fff7871b          	addiw	a4,a5,-1
    80003ae0:	06e52c23          	sw	a4,120(a0)
    80003ae4:	00071c63          	bnez	a4,80003afc <pop_off+0x4c>
    80003ae8:	07c52783          	lw	a5,124(a0)
    80003aec:	00078863          	beqz	a5,80003afc <pop_off+0x4c>
    80003af0:	100027f3          	csrr	a5,sstatus
    80003af4:	0027e793          	ori	a5,a5,2
    80003af8:	10079073          	csrw	sstatus,a5
    80003afc:	00813083          	ld	ra,8(sp)
    80003b00:	00013403          	ld	s0,0(sp)
    80003b04:	01010113          	addi	sp,sp,16
    80003b08:	00008067          	ret
    80003b0c:	00002517          	auipc	a0,0x2
    80003b10:	88c50513          	addi	a0,a0,-1908 # 80005398 <digits+0x48>
    80003b14:	fffff097          	auipc	ra,0xfffff
    80003b18:	018080e7          	jalr	24(ra) # 80002b2c <panic>
    80003b1c:	00002517          	auipc	a0,0x2
    80003b20:	86450513          	addi	a0,a0,-1948 # 80005380 <digits+0x30>
    80003b24:	fffff097          	auipc	ra,0xfffff
    80003b28:	008080e7          	jalr	8(ra) # 80002b2c <panic>

0000000080003b2c <push_on>:
    80003b2c:	fe010113          	addi	sp,sp,-32
    80003b30:	00813823          	sd	s0,16(sp)
    80003b34:	00113c23          	sd	ra,24(sp)
    80003b38:	00913423          	sd	s1,8(sp)
    80003b3c:	02010413          	addi	s0,sp,32
    80003b40:	100024f3          	csrr	s1,sstatus
    80003b44:	100027f3          	csrr	a5,sstatus
    80003b48:	0027e793          	ori	a5,a5,2
    80003b4c:	10079073          	csrw	sstatus,a5
    80003b50:	ffffe097          	auipc	ra,0xffffe
    80003b54:	620080e7          	jalr	1568(ra) # 80002170 <mycpu>
    80003b58:	07852783          	lw	a5,120(a0)
    80003b5c:	02078663          	beqz	a5,80003b88 <push_on+0x5c>
    80003b60:	ffffe097          	auipc	ra,0xffffe
    80003b64:	610080e7          	jalr	1552(ra) # 80002170 <mycpu>
    80003b68:	07852783          	lw	a5,120(a0)
    80003b6c:	01813083          	ld	ra,24(sp)
    80003b70:	01013403          	ld	s0,16(sp)
    80003b74:	0017879b          	addiw	a5,a5,1
    80003b78:	06f52c23          	sw	a5,120(a0)
    80003b7c:	00813483          	ld	s1,8(sp)
    80003b80:	02010113          	addi	sp,sp,32
    80003b84:	00008067          	ret
    80003b88:	0014d493          	srli	s1,s1,0x1
    80003b8c:	ffffe097          	auipc	ra,0xffffe
    80003b90:	5e4080e7          	jalr	1508(ra) # 80002170 <mycpu>
    80003b94:	0014f493          	andi	s1,s1,1
    80003b98:	06952e23          	sw	s1,124(a0)
    80003b9c:	fc5ff06f          	j	80003b60 <push_on+0x34>

0000000080003ba0 <pop_on>:
    80003ba0:	ff010113          	addi	sp,sp,-16
    80003ba4:	00813023          	sd	s0,0(sp)
    80003ba8:	00113423          	sd	ra,8(sp)
    80003bac:	01010413          	addi	s0,sp,16
    80003bb0:	ffffe097          	auipc	ra,0xffffe
    80003bb4:	5c0080e7          	jalr	1472(ra) # 80002170 <mycpu>
    80003bb8:	100027f3          	csrr	a5,sstatus
    80003bbc:	0027f793          	andi	a5,a5,2
    80003bc0:	04078463          	beqz	a5,80003c08 <pop_on+0x68>
    80003bc4:	07852783          	lw	a5,120(a0)
    80003bc8:	02f05863          	blez	a5,80003bf8 <pop_on+0x58>
    80003bcc:	fff7879b          	addiw	a5,a5,-1
    80003bd0:	06f52c23          	sw	a5,120(a0)
    80003bd4:	07853783          	ld	a5,120(a0)
    80003bd8:	00079863          	bnez	a5,80003be8 <pop_on+0x48>
    80003bdc:	100027f3          	csrr	a5,sstatus
    80003be0:	ffd7f793          	andi	a5,a5,-3
    80003be4:	10079073          	csrw	sstatus,a5
    80003be8:	00813083          	ld	ra,8(sp)
    80003bec:	00013403          	ld	s0,0(sp)
    80003bf0:	01010113          	addi	sp,sp,16
    80003bf4:	00008067          	ret
    80003bf8:	00001517          	auipc	a0,0x1
    80003bfc:	7c850513          	addi	a0,a0,1992 # 800053c0 <digits+0x70>
    80003c00:	fffff097          	auipc	ra,0xfffff
    80003c04:	f2c080e7          	jalr	-212(ra) # 80002b2c <panic>
    80003c08:	00001517          	auipc	a0,0x1
    80003c0c:	79850513          	addi	a0,a0,1944 # 800053a0 <digits+0x50>
    80003c10:	fffff097          	auipc	ra,0xfffff
    80003c14:	f1c080e7          	jalr	-228(ra) # 80002b2c <panic>

0000000080003c18 <__memset>:
    80003c18:	ff010113          	addi	sp,sp,-16
    80003c1c:	00813423          	sd	s0,8(sp)
    80003c20:	01010413          	addi	s0,sp,16
    80003c24:	1a060e63          	beqz	a2,80003de0 <__memset+0x1c8>
    80003c28:	40a007b3          	neg	a5,a0
    80003c2c:	0077f793          	andi	a5,a5,7
    80003c30:	00778693          	addi	a3,a5,7
    80003c34:	00b00813          	li	a6,11
    80003c38:	0ff5f593          	andi	a1,a1,255
    80003c3c:	fff6071b          	addiw	a4,a2,-1
    80003c40:	1b06e663          	bltu	a3,a6,80003dec <__memset+0x1d4>
    80003c44:	1cd76463          	bltu	a4,a3,80003e0c <__memset+0x1f4>
    80003c48:	1a078e63          	beqz	a5,80003e04 <__memset+0x1ec>
    80003c4c:	00b50023          	sb	a1,0(a0)
    80003c50:	00100713          	li	a4,1
    80003c54:	1ae78463          	beq	a5,a4,80003dfc <__memset+0x1e4>
    80003c58:	00b500a3          	sb	a1,1(a0)
    80003c5c:	00200713          	li	a4,2
    80003c60:	1ae78a63          	beq	a5,a4,80003e14 <__memset+0x1fc>
    80003c64:	00b50123          	sb	a1,2(a0)
    80003c68:	00300713          	li	a4,3
    80003c6c:	18e78463          	beq	a5,a4,80003df4 <__memset+0x1dc>
    80003c70:	00b501a3          	sb	a1,3(a0)
    80003c74:	00400713          	li	a4,4
    80003c78:	1ae78263          	beq	a5,a4,80003e1c <__memset+0x204>
    80003c7c:	00b50223          	sb	a1,4(a0)
    80003c80:	00500713          	li	a4,5
    80003c84:	1ae78063          	beq	a5,a4,80003e24 <__memset+0x20c>
    80003c88:	00b502a3          	sb	a1,5(a0)
    80003c8c:	00700713          	li	a4,7
    80003c90:	18e79e63          	bne	a5,a4,80003e2c <__memset+0x214>
    80003c94:	00b50323          	sb	a1,6(a0)
    80003c98:	00700e93          	li	t4,7
    80003c9c:	00859713          	slli	a4,a1,0x8
    80003ca0:	00e5e733          	or	a4,a1,a4
    80003ca4:	01059e13          	slli	t3,a1,0x10
    80003ca8:	01c76e33          	or	t3,a4,t3
    80003cac:	01859313          	slli	t1,a1,0x18
    80003cb0:	006e6333          	or	t1,t3,t1
    80003cb4:	02059893          	slli	a7,a1,0x20
    80003cb8:	40f60e3b          	subw	t3,a2,a5
    80003cbc:	011368b3          	or	a7,t1,a7
    80003cc0:	02859813          	slli	a6,a1,0x28
    80003cc4:	0108e833          	or	a6,a7,a6
    80003cc8:	03059693          	slli	a3,a1,0x30
    80003ccc:	003e589b          	srliw	a7,t3,0x3
    80003cd0:	00d866b3          	or	a3,a6,a3
    80003cd4:	03859713          	slli	a4,a1,0x38
    80003cd8:	00389813          	slli	a6,a7,0x3
    80003cdc:	00f507b3          	add	a5,a0,a5
    80003ce0:	00e6e733          	or	a4,a3,a4
    80003ce4:	000e089b          	sext.w	a7,t3
    80003ce8:	00f806b3          	add	a3,a6,a5
    80003cec:	00e7b023          	sd	a4,0(a5)
    80003cf0:	00878793          	addi	a5,a5,8
    80003cf4:	fed79ce3          	bne	a5,a3,80003cec <__memset+0xd4>
    80003cf8:	ff8e7793          	andi	a5,t3,-8
    80003cfc:	0007871b          	sext.w	a4,a5
    80003d00:	01d787bb          	addw	a5,a5,t4
    80003d04:	0ce88e63          	beq	a7,a4,80003de0 <__memset+0x1c8>
    80003d08:	00f50733          	add	a4,a0,a5
    80003d0c:	00b70023          	sb	a1,0(a4)
    80003d10:	0017871b          	addiw	a4,a5,1
    80003d14:	0cc77663          	bgeu	a4,a2,80003de0 <__memset+0x1c8>
    80003d18:	00e50733          	add	a4,a0,a4
    80003d1c:	00b70023          	sb	a1,0(a4)
    80003d20:	0027871b          	addiw	a4,a5,2
    80003d24:	0ac77e63          	bgeu	a4,a2,80003de0 <__memset+0x1c8>
    80003d28:	00e50733          	add	a4,a0,a4
    80003d2c:	00b70023          	sb	a1,0(a4)
    80003d30:	0037871b          	addiw	a4,a5,3
    80003d34:	0ac77663          	bgeu	a4,a2,80003de0 <__memset+0x1c8>
    80003d38:	00e50733          	add	a4,a0,a4
    80003d3c:	00b70023          	sb	a1,0(a4)
    80003d40:	0047871b          	addiw	a4,a5,4
    80003d44:	08c77e63          	bgeu	a4,a2,80003de0 <__memset+0x1c8>
    80003d48:	00e50733          	add	a4,a0,a4
    80003d4c:	00b70023          	sb	a1,0(a4)
    80003d50:	0057871b          	addiw	a4,a5,5
    80003d54:	08c77663          	bgeu	a4,a2,80003de0 <__memset+0x1c8>
    80003d58:	00e50733          	add	a4,a0,a4
    80003d5c:	00b70023          	sb	a1,0(a4)
    80003d60:	0067871b          	addiw	a4,a5,6
    80003d64:	06c77e63          	bgeu	a4,a2,80003de0 <__memset+0x1c8>
    80003d68:	00e50733          	add	a4,a0,a4
    80003d6c:	00b70023          	sb	a1,0(a4)
    80003d70:	0077871b          	addiw	a4,a5,7
    80003d74:	06c77663          	bgeu	a4,a2,80003de0 <__memset+0x1c8>
    80003d78:	00e50733          	add	a4,a0,a4
    80003d7c:	00b70023          	sb	a1,0(a4)
    80003d80:	0087871b          	addiw	a4,a5,8
    80003d84:	04c77e63          	bgeu	a4,a2,80003de0 <__memset+0x1c8>
    80003d88:	00e50733          	add	a4,a0,a4
    80003d8c:	00b70023          	sb	a1,0(a4)
    80003d90:	0097871b          	addiw	a4,a5,9
    80003d94:	04c77663          	bgeu	a4,a2,80003de0 <__memset+0x1c8>
    80003d98:	00e50733          	add	a4,a0,a4
    80003d9c:	00b70023          	sb	a1,0(a4)
    80003da0:	00a7871b          	addiw	a4,a5,10
    80003da4:	02c77e63          	bgeu	a4,a2,80003de0 <__memset+0x1c8>
    80003da8:	00e50733          	add	a4,a0,a4
    80003dac:	00b70023          	sb	a1,0(a4)
    80003db0:	00b7871b          	addiw	a4,a5,11
    80003db4:	02c77663          	bgeu	a4,a2,80003de0 <__memset+0x1c8>
    80003db8:	00e50733          	add	a4,a0,a4
    80003dbc:	00b70023          	sb	a1,0(a4)
    80003dc0:	00c7871b          	addiw	a4,a5,12
    80003dc4:	00c77e63          	bgeu	a4,a2,80003de0 <__memset+0x1c8>
    80003dc8:	00e50733          	add	a4,a0,a4
    80003dcc:	00b70023          	sb	a1,0(a4)
    80003dd0:	00d7879b          	addiw	a5,a5,13
    80003dd4:	00c7f663          	bgeu	a5,a2,80003de0 <__memset+0x1c8>
    80003dd8:	00f507b3          	add	a5,a0,a5
    80003ddc:	00b78023          	sb	a1,0(a5)
    80003de0:	00813403          	ld	s0,8(sp)
    80003de4:	01010113          	addi	sp,sp,16
    80003de8:	00008067          	ret
    80003dec:	00b00693          	li	a3,11
    80003df0:	e55ff06f          	j	80003c44 <__memset+0x2c>
    80003df4:	00300e93          	li	t4,3
    80003df8:	ea5ff06f          	j	80003c9c <__memset+0x84>
    80003dfc:	00100e93          	li	t4,1
    80003e00:	e9dff06f          	j	80003c9c <__memset+0x84>
    80003e04:	00000e93          	li	t4,0
    80003e08:	e95ff06f          	j	80003c9c <__memset+0x84>
    80003e0c:	00000793          	li	a5,0
    80003e10:	ef9ff06f          	j	80003d08 <__memset+0xf0>
    80003e14:	00200e93          	li	t4,2
    80003e18:	e85ff06f          	j	80003c9c <__memset+0x84>
    80003e1c:	00400e93          	li	t4,4
    80003e20:	e7dff06f          	j	80003c9c <__memset+0x84>
    80003e24:	00500e93          	li	t4,5
    80003e28:	e75ff06f          	j	80003c9c <__memset+0x84>
    80003e2c:	00600e93          	li	t4,6
    80003e30:	e6dff06f          	j	80003c9c <__memset+0x84>

0000000080003e34 <__memmove>:
    80003e34:	ff010113          	addi	sp,sp,-16
    80003e38:	00813423          	sd	s0,8(sp)
    80003e3c:	01010413          	addi	s0,sp,16
    80003e40:	0e060863          	beqz	a2,80003f30 <__memmove+0xfc>
    80003e44:	fff6069b          	addiw	a3,a2,-1
    80003e48:	0006881b          	sext.w	a6,a3
    80003e4c:	0ea5e863          	bltu	a1,a0,80003f3c <__memmove+0x108>
    80003e50:	00758713          	addi	a4,a1,7
    80003e54:	00a5e7b3          	or	a5,a1,a0
    80003e58:	40a70733          	sub	a4,a4,a0
    80003e5c:	0077f793          	andi	a5,a5,7
    80003e60:	00f73713          	sltiu	a4,a4,15
    80003e64:	00174713          	xori	a4,a4,1
    80003e68:	0017b793          	seqz	a5,a5
    80003e6c:	00e7f7b3          	and	a5,a5,a4
    80003e70:	10078863          	beqz	a5,80003f80 <__memmove+0x14c>
    80003e74:	00900793          	li	a5,9
    80003e78:	1107f463          	bgeu	a5,a6,80003f80 <__memmove+0x14c>
    80003e7c:	0036581b          	srliw	a6,a2,0x3
    80003e80:	fff8081b          	addiw	a6,a6,-1
    80003e84:	02081813          	slli	a6,a6,0x20
    80003e88:	01d85893          	srli	a7,a6,0x1d
    80003e8c:	00858813          	addi	a6,a1,8
    80003e90:	00058793          	mv	a5,a1
    80003e94:	00050713          	mv	a4,a0
    80003e98:	01088833          	add	a6,a7,a6
    80003e9c:	0007b883          	ld	a7,0(a5)
    80003ea0:	00878793          	addi	a5,a5,8
    80003ea4:	00870713          	addi	a4,a4,8
    80003ea8:	ff173c23          	sd	a7,-8(a4)
    80003eac:	ff0798e3          	bne	a5,a6,80003e9c <__memmove+0x68>
    80003eb0:	ff867713          	andi	a4,a2,-8
    80003eb4:	02071793          	slli	a5,a4,0x20
    80003eb8:	0207d793          	srli	a5,a5,0x20
    80003ebc:	00f585b3          	add	a1,a1,a5
    80003ec0:	40e686bb          	subw	a3,a3,a4
    80003ec4:	00f507b3          	add	a5,a0,a5
    80003ec8:	06e60463          	beq	a2,a4,80003f30 <__memmove+0xfc>
    80003ecc:	0005c703          	lbu	a4,0(a1)
    80003ed0:	00e78023          	sb	a4,0(a5)
    80003ed4:	04068e63          	beqz	a3,80003f30 <__memmove+0xfc>
    80003ed8:	0015c603          	lbu	a2,1(a1)
    80003edc:	00100713          	li	a4,1
    80003ee0:	00c780a3          	sb	a2,1(a5)
    80003ee4:	04e68663          	beq	a3,a4,80003f30 <__memmove+0xfc>
    80003ee8:	0025c603          	lbu	a2,2(a1)
    80003eec:	00200713          	li	a4,2
    80003ef0:	00c78123          	sb	a2,2(a5)
    80003ef4:	02e68e63          	beq	a3,a4,80003f30 <__memmove+0xfc>
    80003ef8:	0035c603          	lbu	a2,3(a1)
    80003efc:	00300713          	li	a4,3
    80003f00:	00c781a3          	sb	a2,3(a5)
    80003f04:	02e68663          	beq	a3,a4,80003f30 <__memmove+0xfc>
    80003f08:	0045c603          	lbu	a2,4(a1)
    80003f0c:	00400713          	li	a4,4
    80003f10:	00c78223          	sb	a2,4(a5)
    80003f14:	00e68e63          	beq	a3,a4,80003f30 <__memmove+0xfc>
    80003f18:	0055c603          	lbu	a2,5(a1)
    80003f1c:	00500713          	li	a4,5
    80003f20:	00c782a3          	sb	a2,5(a5)
    80003f24:	00e68663          	beq	a3,a4,80003f30 <__memmove+0xfc>
    80003f28:	0065c703          	lbu	a4,6(a1)
    80003f2c:	00e78323          	sb	a4,6(a5)
    80003f30:	00813403          	ld	s0,8(sp)
    80003f34:	01010113          	addi	sp,sp,16
    80003f38:	00008067          	ret
    80003f3c:	02061713          	slli	a4,a2,0x20
    80003f40:	02075713          	srli	a4,a4,0x20
    80003f44:	00e587b3          	add	a5,a1,a4
    80003f48:	f0f574e3          	bgeu	a0,a5,80003e50 <__memmove+0x1c>
    80003f4c:	02069613          	slli	a2,a3,0x20
    80003f50:	02065613          	srli	a2,a2,0x20
    80003f54:	fff64613          	not	a2,a2
    80003f58:	00e50733          	add	a4,a0,a4
    80003f5c:	00c78633          	add	a2,a5,a2
    80003f60:	fff7c683          	lbu	a3,-1(a5)
    80003f64:	fff78793          	addi	a5,a5,-1
    80003f68:	fff70713          	addi	a4,a4,-1
    80003f6c:	00d70023          	sb	a3,0(a4)
    80003f70:	fec798e3          	bne	a5,a2,80003f60 <__memmove+0x12c>
    80003f74:	00813403          	ld	s0,8(sp)
    80003f78:	01010113          	addi	sp,sp,16
    80003f7c:	00008067          	ret
    80003f80:	02069713          	slli	a4,a3,0x20
    80003f84:	02075713          	srli	a4,a4,0x20
    80003f88:	00170713          	addi	a4,a4,1
    80003f8c:	00e50733          	add	a4,a0,a4
    80003f90:	00050793          	mv	a5,a0
    80003f94:	0005c683          	lbu	a3,0(a1)
    80003f98:	00178793          	addi	a5,a5,1
    80003f9c:	00158593          	addi	a1,a1,1
    80003fa0:	fed78fa3          	sb	a3,-1(a5)
    80003fa4:	fee798e3          	bne	a5,a4,80003f94 <__memmove+0x160>
    80003fa8:	f89ff06f          	j	80003f30 <__memmove+0xfc>

0000000080003fac <__putc>:
    80003fac:	fe010113          	addi	sp,sp,-32
    80003fb0:	00813823          	sd	s0,16(sp)
    80003fb4:	00113c23          	sd	ra,24(sp)
    80003fb8:	02010413          	addi	s0,sp,32
    80003fbc:	00050793          	mv	a5,a0
    80003fc0:	fef40593          	addi	a1,s0,-17
    80003fc4:	00100613          	li	a2,1
    80003fc8:	00000513          	li	a0,0
    80003fcc:	fef407a3          	sb	a5,-17(s0)
    80003fd0:	fffff097          	auipc	ra,0xfffff
    80003fd4:	b3c080e7          	jalr	-1220(ra) # 80002b0c <console_write>
    80003fd8:	01813083          	ld	ra,24(sp)
    80003fdc:	01013403          	ld	s0,16(sp)
    80003fe0:	02010113          	addi	sp,sp,32
    80003fe4:	00008067          	ret

0000000080003fe8 <__getc>:
    80003fe8:	fe010113          	addi	sp,sp,-32
    80003fec:	00813823          	sd	s0,16(sp)
    80003ff0:	00113c23          	sd	ra,24(sp)
    80003ff4:	02010413          	addi	s0,sp,32
    80003ff8:	fe840593          	addi	a1,s0,-24
    80003ffc:	00100613          	li	a2,1
    80004000:	00000513          	li	a0,0
    80004004:	fffff097          	auipc	ra,0xfffff
    80004008:	ae8080e7          	jalr	-1304(ra) # 80002aec <console_read>
    8000400c:	fe844503          	lbu	a0,-24(s0)
    80004010:	01813083          	ld	ra,24(sp)
    80004014:	01013403          	ld	s0,16(sp)
    80004018:	02010113          	addi	sp,sp,32
    8000401c:	00008067          	ret

0000000080004020 <console_handler>:
    80004020:	fe010113          	addi	sp,sp,-32
    80004024:	00813823          	sd	s0,16(sp)
    80004028:	00113c23          	sd	ra,24(sp)
    8000402c:	00913423          	sd	s1,8(sp)
    80004030:	02010413          	addi	s0,sp,32
    80004034:	14202773          	csrr	a4,scause
    80004038:	100027f3          	csrr	a5,sstatus
    8000403c:	0027f793          	andi	a5,a5,2
    80004040:	06079e63          	bnez	a5,800040bc <console_handler+0x9c>
    80004044:	00074c63          	bltz	a4,8000405c <console_handler+0x3c>
    80004048:	01813083          	ld	ra,24(sp)
    8000404c:	01013403          	ld	s0,16(sp)
    80004050:	00813483          	ld	s1,8(sp)
    80004054:	02010113          	addi	sp,sp,32
    80004058:	00008067          	ret
    8000405c:	0ff77713          	andi	a4,a4,255
    80004060:	00900793          	li	a5,9
    80004064:	fef712e3          	bne	a4,a5,80004048 <console_handler+0x28>
    80004068:	ffffe097          	auipc	ra,0xffffe
    8000406c:	6dc080e7          	jalr	1756(ra) # 80002744 <plic_claim>
    80004070:	00a00793          	li	a5,10
    80004074:	00050493          	mv	s1,a0
    80004078:	02f50c63          	beq	a0,a5,800040b0 <console_handler+0x90>
    8000407c:	fc0506e3          	beqz	a0,80004048 <console_handler+0x28>
    80004080:	00050593          	mv	a1,a0
    80004084:	00001517          	auipc	a0,0x1
    80004088:	24450513          	addi	a0,a0,580 # 800052c8 <_ZZ12printIntegermE6digits+0x2a8>
    8000408c:	fffff097          	auipc	ra,0xfffff
    80004090:	afc080e7          	jalr	-1284(ra) # 80002b88 <__printf>
    80004094:	01013403          	ld	s0,16(sp)
    80004098:	01813083          	ld	ra,24(sp)
    8000409c:	00048513          	mv	a0,s1
    800040a0:	00813483          	ld	s1,8(sp)
    800040a4:	02010113          	addi	sp,sp,32
    800040a8:	ffffe317          	auipc	t1,0xffffe
    800040ac:	6d430067          	jr	1748(t1) # 8000277c <plic_complete>
    800040b0:	fffff097          	auipc	ra,0xfffff
    800040b4:	3e0080e7          	jalr	992(ra) # 80003490 <uartintr>
    800040b8:	fddff06f          	j	80004094 <console_handler+0x74>
    800040bc:	00001517          	auipc	a0,0x1
    800040c0:	30c50513          	addi	a0,a0,780 # 800053c8 <digits+0x78>
    800040c4:	fffff097          	auipc	ra,0xfffff
    800040c8:	a68080e7          	jalr	-1432(ra) # 80002b2c <panic>
	...
