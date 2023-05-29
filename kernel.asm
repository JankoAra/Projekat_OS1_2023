
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00006117          	auipc	sp,0x6
    80000004:	98813103          	ld	sp,-1656(sp) # 80005988 <_GLOBAL_OFFSET_TABLE_+0x10>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	034020ef          	jal	ra,80002050 <start>

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
    80001184:	490000ef          	jal	ra,80001614 <interruptRoutine>
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
    800012cc:	9b0080e7          	jalr	-1616(ra) # 80001c78 <_ZN15MemoryAllocator7kmallocEm>
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
    80001448:	cc8080e7          	jalr	-824(ra) # 8000410c <__putc>
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
    80001488:	c88080e7          	jalr	-888(ra) # 8000410c <__putc>
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
    80001510:	c00080e7          	jalr	-1024(ra) # 8000410c <__putc>
    80001514:	fe5ff06f          	j	800014f8 <_Z12printIntegerm+0x5c>
    }
}
    80001518:	02813083          	ld	ra,40(sp)
    8000151c:	02013403          	ld	s0,32(sp)
    80001520:	01813483          	ld	s1,24(sp)
    80001524:	03010113          	addi	sp,sp,48
    80001528:	00008067          	ret

000000008000152c <_Z5nit1fPv>:
//void dispatch() {
//	__asm__ volatile ("mv %[savedPC], ra":[savedPC] "=r"(temp));
//	__asm__ volatile("mv ra, %[fAddress]": : [fAddress] "r"(&f));
//}

void nit1f(void*) {
    8000152c:	ff010113          	addi	sp,sp,-16
    80001530:	00113423          	sd	ra,8(sp)
    80001534:	00813023          	sd	s0,0(sp)
    80001538:	01010413          	addi	s0,sp,16
	println("usao u nit 1");
    8000153c:	00004517          	auipc	a0,0x4
    80001540:	af450513          	addi	a0,a0,-1292 # 80005030 <_ZZ12printIntegermE6digits+0x10>
    80001544:	00000097          	auipc	ra,0x0
    80001548:	f24080e7          	jalr	-220(ra) # 80001468 <_Z7printlnPKc>
	TCB::dispatch();
    8000154c:	00000097          	auipc	ra,0x0
    80001550:	524080e7          	jalr	1316(ra) # 80001a70 <_ZN3TCB8dispatchEv>
	println("opet u niti 1");
    80001554:	00004517          	auipc	a0,0x4
    80001558:	aec50513          	addi	a0,a0,-1300 # 80005040 <_ZZ12printIntegermE6digits+0x20>
    8000155c:	00000097          	auipc	ra,0x0
    80001560:	f0c080e7          	jalr	-244(ra) # 80001468 <_Z7printlnPKc>
}
    80001564:	00813083          	ld	ra,8(sp)
    80001568:	00013403          	ld	s0,0(sp)
    8000156c:	01010113          	addi	sp,sp,16
    80001570:	00008067          	ret

0000000080001574 <main>:

int main() {
    80001574:	fe010113          	addi	sp,sp,-32
    80001578:	00113c23          	sd	ra,24(sp)
    8000157c:	00813823          	sd	s0,16(sp)
    80001580:	02010413          	addi	s0,sp,32
inline void Riscv::ms_sstatus(uint64 mask) {
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
}

inline void Riscv::mc_sstatus(uint64 mask) {
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80001584:	00200793          	li	a5,2
    80001588:	1007b073          	csrc	sstatus,a5
	//zabrani prekide
	Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
	//postavi adresu prekidne rutine u stvec
	Riscv::w_stvec((uint64)&interruptHandler);
    8000158c:	00004717          	auipc	a4,0x4
    80001590:	41c73703          	ld	a4,1052(a4) # 800059a8 <_GLOBAL_OFFSET_TABLE_+0x30>
	__asm__ volatile("csrw stvec, %[stvec]": :[stvec] "r"(stvec));
    80001594:	10571073          	csrw	stvec,a4
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80001598:	1007a073          	csrs	sstatus,a5
//	println("");

	//testiranje kreiranja niti
	thread_t glavnaNit;
	thread_t nit1;
	thread_create(&glavnaNit, nullptr, nullptr);
    8000159c:	00000613          	li	a2,0
    800015a0:	00000593          	li	a1,0
    800015a4:	fe840513          	addi	a0,s0,-24
    800015a8:	00000097          	auipc	ra,0x0
    800015ac:	cf0080e7          	jalr	-784(ra) # 80001298 <_Z13thread_createPP3TCBPFvPvES2_>
	TCB::running = glavnaNit;
    800015b0:	00004797          	auipc	a5,0x4
    800015b4:	3e87b783          	ld	a5,1000(a5) # 80005998 <_GLOBAL_OFFSET_TABLE_+0x20>
    800015b8:	fe843703          	ld	a4,-24(s0)
    800015bc:	00e7b023          	sd	a4,0(a5)
	thread_create(&nit1, nit1f, nullptr);
    800015c0:	00000613          	li	a2,0
    800015c4:	00000597          	auipc	a1,0x0
    800015c8:	f6858593          	addi	a1,a1,-152 # 8000152c <_Z5nit1fPv>
    800015cc:	fe040513          	addi	a0,s0,-32
    800015d0:	00000097          	auipc	ra,0x0
    800015d4:	cc8080e7          	jalr	-824(ra) # 80001298 <_Z13thread_createPP3TCBPFvPvES2_>
	while(!nit1->isFinished()){
    800015d8:	fe043783          	ld	a5,-32(s0)
public:
	using Body = void (*)(void*);

	static TCB* createThread(Body function, void* args, uint64* stack);

	bool isFinished() { return finished; }
    800015dc:	0307c783          	lbu	a5,48(a5)
    800015e0:	00079863          	bnez	a5,800015f0 <main+0x7c>
		glavnaNit->dispatch();
    800015e4:	00000097          	auipc	ra,0x0
    800015e8:	48c080e7          	jalr	1164(ra) # 80001a70 <_ZN3TCB8dispatchEv>
    800015ec:	fedff06f          	j	800015d8 <main+0x64>
	}
	println("");
    800015f0:	00004517          	auipc	a0,0x4
    800015f4:	c3050513          	addi	a0,a0,-976 # 80005220 <_ZZ12printIntegermE6digits+0x200>
    800015f8:	00000097          	auipc	ra,0x0
    800015fc:	e70080e7          	jalr	-400(ra) # 80001468 <_Z7printlnPKc>
	return 0;
    80001600:	00000513          	li	a0,0
    80001604:	01813083          	ld	ra,24(sp)
    80001608:	01013403          	ld	s0,16(sp)
    8000160c:	02010113          	addi	sp,sp,32
    80001610:	00008067          	ret

0000000080001614 <interruptRoutine>:
#include "../h/syscall_c.hpp"
#include "../h/TCB.hpp"

#pragma GCC optimize("O0")

extern "C" void interruptRoutine() {
    80001614:	f6010113          	addi	sp,sp,-160
    80001618:	08113c23          	sd	ra,152(sp)
    8000161c:	08813823          	sd	s0,144(sp)
    80001620:	0a010413          	addi	s0,sp,160
	//uint64 scause = Riscv::r_scause();
	//uint64 sepc = Riscv::r_sepc();
	uint64 scause, sepc;
	__asm__ volatile("csrr %[scause], scause":[scause] "=r"(scause): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001624:	14202373          	csrr	t1,scause
    80001628:	fe643423          	sd	t1,-24(s0)
	__asm__ volatile("csrr %[sepc], sepc":[sepc] "=r"(sepc): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000162c:	14102373          	csrr	t1,sepc
    80001630:	fe643023          	sd	t1,-32(s0)
	uint64 a0, a1, a2, a3, a4, a5, a6, a7;
	__asm__ volatile("mv %[ax], a0":[ax] "=r"(a0): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001634:	00050313          	mv	t1,a0
    80001638:	fc643c23          	sd	t1,-40(s0)
	__asm__ volatile("mv %[ax], a1":[ax] "=r"(a1): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000163c:	00058313          	mv	t1,a1
    80001640:	fc643823          	sd	t1,-48(s0)
	__asm__ volatile("mv %[ax], a2":[ax] "=r"(a2): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001644:	00060313          	mv	t1,a2
    80001648:	fc643423          	sd	t1,-56(s0)
	__asm__ volatile("mv %[ax], a3":[ax] "=r"(a3): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000164c:	00068313          	mv	t1,a3
    80001650:	fc643023          	sd	t1,-64(s0)
	__asm__ volatile("mv %[ax], a4":[ax] "=r"(a4): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001654:	00070313          	mv	t1,a4
    80001658:	fa643c23          	sd	t1,-72(s0)
	__asm__ volatile("mv %[ax], a5":[ax] "=r"(a5): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000165c:	00078313          	mv	t1,a5
    80001660:	fa643823          	sd	t1,-80(s0)
	__asm__ volatile("mv %[ax], a6":[ax] "=r"(a6): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001664:	00080313          	mv	t1,a6
    80001668:	fa643423          	sd	t1,-88(s0)
	__asm__ volatile("mv %[ax], a7":[ax] "=r"(a7): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000166c:	00088313          	mv	t1,a7
    80001670:	fa643023          	sd	t1,-96(s0)

	if (scause == 0x09 || scause == 0x08) {
    80001674:	fe843703          	ld	a4,-24(s0)
    80001678:	00900793          	li	a5,9
    8000167c:	00f70863          	beq	a4,a5,8000168c <interruptRoutine+0x78>
    80001680:	fe843703          	ld	a4,-24(s0)
    80001684:	00800793          	li	a5,8
    80001688:	16f71063          	bne	a4,a5,800017e8 <interruptRoutine+0x1d4>
		//prekid zbog poziva ecall
		uint64 opCode = a0;
    8000168c:	fd843783          	ld	a5,-40(s0)
    80001690:	f8f43c23          	sd	a5,-104(s0)

		switch (opCode) {
    80001694:	f9843703          	ld	a4,-104(s0)
    80001698:	04200793          	li	a5,66
    8000169c:	0ce7ea63          	bltu	a5,a4,80001770 <interruptRoutine+0x15c>
    800016a0:	f9843783          	ld	a5,-104(s0)
    800016a4:	00279713          	slli	a4,a5,0x2
    800016a8:	00004797          	auipc	a5,0x4
    800016ac:	a0478793          	addi	a5,a5,-1532 # 800050ac <_ZZ12printIntegermE6digits+0x8c>
    800016b0:	00f707b3          	add	a5,a4,a5
    800016b4:	0007a783          	lw	a5,0(a5)
    800016b8:	0007871b          	sext.w	a4,a5
    800016bc:	00004797          	auipc	a5,0x4
    800016c0:	9f078793          	addi	a5,a5,-1552 # 800050ac <_ZZ12printIntegermE6digits+0x8c>
    800016c4:	00f707b3          	add	a5,a4,a5
    800016c8:	00078067          	jr	a5
			case 0x01:
				//mem_alloc
				size_t size;
				size = (size_t)a1;
    800016cc:	fd043783          	ld	a5,-48(s0)
    800016d0:	f6f43423          	sd	a5,-152(s0)
				//__asm__ volatile("mv %[size], a1":[size] "=r"(size));
				size = size * MEM_BLOCK_SIZE;
    800016d4:	f6843783          	ld	a5,-152(s0)
    800016d8:	00679793          	slli	a5,a5,0x6
    800016dc:	f6f43423          	sd	a5,-152(s0)
				MemoryAllocator::kmalloc(size);
    800016e0:	f6843503          	ld	a0,-152(s0)
    800016e4:	00000097          	auipc	ra,0x0
    800016e8:	594080e7          	jalr	1428(ra) # 80001c78 <_ZN15MemoryAllocator7kmallocEm>
				__asm__ volatile("sd a0, 80(s0)");
    800016ec:	04a43823          	sd	a0,80(s0)
				break;
    800016f0:	0dc0006f          	j	800017cc <interruptRoutine+0x1b8>
			case 0x02:
				//mem_free
				void* ptr;
				ptr = (void*)a1;
    800016f4:	fd043783          	ld	a5,-48(s0)
    800016f8:	f6f43823          	sd	a5,-144(s0)
				//__asm__ volatile("mv %[ptr], a1" :[ptr]"=r"(ptr));
				MemoryAllocator::kfree(ptr);
    800016fc:	f7043503          	ld	a0,-144(s0)
    80001700:	00000097          	auipc	ra,0x0
    80001704:	720080e7          	jalr	1824(ra) # 80001e20 <_ZN15MemoryAllocator5kfreeEPv>
				__asm__ volatile("sd a0, 80(s0)");
    80001708:	04a43823          	sd	a0,80(s0)
				break;
    8000170c:	0c00006f          	j	800017cc <interruptRoutine+0x1b8>
			case 0x11:
				//thread_create
				thread_t* handle;
				handle = (thread_t*)a1;
    80001710:	fd043783          	ld	a5,-48(s0)
    80001714:	f8f43823          	sd	a5,-112(s0)
				void (* function)(void*);
				function = (void (*)(void*))a2;
    80001718:	fc843783          	ld	a5,-56(s0)
    8000171c:	f8f43423          	sd	a5,-120(s0)
				void* args;
				args = (void*)a3;
    80001720:	fc043783          	ld	a5,-64(s0)
    80001724:	f8f43023          	sd	a5,-128(s0)
				uint64* sp;
				sp = (uint64*)a4;
    80001728:	fb843783          	ld	a5,-72(s0)
    8000172c:	f6f43c23          	sd	a5,-136(s0)
//				__asm__ volatile("mv %[handle], a1":[handle]"=r"(handle));
//				__asm__ volatile("mv %[f], a2":[f]"=r"(function));
//				__asm__ volatile("mv %[args], a3":[args]"=r"(args));
//				__asm__ volatile("mv %[sp], a4":[sp]"=r"(sp));

				*handle = TCB::createThread(function, args, sp);
    80001730:	f7843603          	ld	a2,-136(s0)
    80001734:	f8043583          	ld	a1,-128(s0)
    80001738:	f8843503          	ld	a0,-120(s0)
    8000173c:	00000097          	auipc	ra,0x0
    80001740:	208080e7          	jalr	520(ra) # 80001944 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80001744:	00050713          	mv	a4,a0
    80001748:	f9043783          	ld	a5,-112(s0)
    8000174c:	00e7b023          	sd	a4,0(a5)
				if (*handle != nullptr) {
    80001750:	f9043783          	ld	a5,-112(s0)
    80001754:	0007b783          	ld	a5,0(a5)
    80001758:	00078663          	beqz	a5,80001764 <interruptRoutine+0x150>
					__asm__ volatile("li a0, 0");
    8000175c:	00000513          	li	a0,0
    80001760:	0080006f          	j	80001768 <interruptRoutine+0x154>
				} else {
					__asm__ volatile("li a0, -1");
    80001764:	fff00513          	li	a0,-1
				}
				__asm__ volatile("sd a0, 80(s0)");
    80001768:	04a43823          	sd	a0,80(s0)
				break;
    8000176c:	0600006f          	j	800017cc <interruptRoutine+0x1b8>
				break;
			case 0x42:
				//putc
				break;
			default:
				printString("\nNepostojeci op code: ");
    80001770:	00004517          	auipc	a0,0x4
    80001774:	8e050513          	addi	a0,a0,-1824 # 80005050 <_ZZ12printIntegermE6digits+0x30>
    80001778:	00000097          	auipc	ra,0x0
    8000177c:	cac080e7          	jalr	-852(ra) # 80001424 <_Z11printStringPKc>
				printInteger(opCode);
    80001780:	f9843503          	ld	a0,-104(s0)
    80001784:	00000097          	auipc	ra,0x0
    80001788:	d18080e7          	jalr	-744(ra) # 8000149c <_Z12printIntegerm>
				printString("\nscause: ");
    8000178c:	00004517          	auipc	a0,0x4
    80001790:	8dc50513          	addi	a0,a0,-1828 # 80005068 <_ZZ12printIntegermE6digits+0x48>
    80001794:	00000097          	auipc	ra,0x0
    80001798:	c90080e7          	jalr	-880(ra) # 80001424 <_Z11printStringPKc>
				printInteger(scause);
    8000179c:	fe843503          	ld	a0,-24(s0)
    800017a0:	00000097          	auipc	ra,0x0
    800017a4:	cfc080e7          	jalr	-772(ra) # 8000149c <_Z12printIntegerm>
				printString("\nsepc: ");
    800017a8:	00004517          	auipc	a0,0x4
    800017ac:	8d050513          	addi	a0,a0,-1840 # 80005078 <_ZZ12printIntegermE6digits+0x58>
    800017b0:	00000097          	auipc	ra,0x0
    800017b4:	c74080e7          	jalr	-908(ra) # 80001424 <_Z11printStringPKc>
				printInteger(sepc);
    800017b8:	fe043503          	ld	a0,-32(s0)
    800017bc:	00000097          	auipc	ra,0x0
    800017c0:	ce0080e7          	jalr	-800(ra) # 8000149c <_Z12printIntegerm>
				break;
    800017c4:	0080006f          	j	800017cc <interruptRoutine+0x1b8>
				break;
    800017c8:	00000013          	nop
		}
		//sepc pokazuje na ecall instrukciju, treba preci na sledecu instrukciju
		//sepc += 4;
		__asm__ volatile("addi %[dst], %[src], 0x4":[dst]"=r"(sepc):[src]"r"(
				sepc):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800017cc:	fe043303          	ld	t1,-32(s0)
    800017d0:	00430313          	addi	t1,t1,4
    800017d4:	fe643023          	sd	t1,-32(s0)
		__asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800017d8:	fe043303          	ld	t1,-32(s0)
    800017dc:	14131073          	csrw	sepc,t1
    800017e0:	00000013          	nop
		printString("scause: ");
		printInteger(scause);
		printString("\nsepc: ");
		printInteger(sepc);
	}
}
    800017e4:	0900006f          	j	80001874 <interruptRoutine+0x260>
	} else if (scause == (1UL << 63 | 9)) {
    800017e8:	fe843703          	ld	a4,-24(s0)
    800017ec:	fff00793          	li	a5,-1
    800017f0:	03f79793          	slli	a5,a5,0x3f
    800017f4:	00978793          	addi	a5,a5,9
    800017f8:	00f71863          	bne	a4,a5,80001808 <interruptRoutine+0x1f4>
		console_handler();
    800017fc:	00003097          	auipc	ra,0x3
    80001800:	984080e7          	jalr	-1660(ra) # 80004180 <console_handler>
}
    80001804:	0700006f          	j	80001874 <interruptRoutine+0x260>
	} else if (scause == (1UL << 63 | 1)) {
    80001808:	fe843703          	ld	a4,-24(s0)
    8000180c:	fff00793          	li	a5,-1
    80001810:	03f79793          	slli	a5,a5,0x3f
    80001814:	00178793          	addi	a5,a5,1
    80001818:	00f71a63          	bne	a4,a5,8000182c <interruptRoutine+0x218>
		Riscv::mc_sip(Riscv::SIP_SSIP);
    8000181c:	00200513          	li	a0,2
    80001820:	00000097          	auipc	ra,0x0
    80001824:	068080e7          	jalr	104(ra) # 80001888 <_ZN5Riscv6mc_sipEm>
}
    80001828:	04c0006f          	j	80001874 <interruptRoutine+0x260>
		println("\nGreska u prekidnoj rutini");
    8000182c:	00004517          	auipc	a0,0x4
    80001830:	85450513          	addi	a0,a0,-1964 # 80005080 <_ZZ12printIntegermE6digits+0x60>
    80001834:	00000097          	auipc	ra,0x0
    80001838:	c34080e7          	jalr	-972(ra) # 80001468 <_Z7printlnPKc>
		printString("scause: ");
    8000183c:	00004517          	auipc	a0,0x4
    80001840:	86450513          	addi	a0,a0,-1948 # 800050a0 <_ZZ12printIntegermE6digits+0x80>
    80001844:	00000097          	auipc	ra,0x0
    80001848:	be0080e7          	jalr	-1056(ra) # 80001424 <_Z11printStringPKc>
		printInteger(scause);
    8000184c:	fe843503          	ld	a0,-24(s0)
    80001850:	00000097          	auipc	ra,0x0
    80001854:	c4c080e7          	jalr	-948(ra) # 8000149c <_Z12printIntegerm>
		printString("\nsepc: ");
    80001858:	00004517          	auipc	a0,0x4
    8000185c:	82050513          	addi	a0,a0,-2016 # 80005078 <_ZZ12printIntegermE6digits+0x58>
    80001860:	00000097          	auipc	ra,0x0
    80001864:	bc4080e7          	jalr	-1084(ra) # 80001424 <_Z11printStringPKc>
		printInteger(sepc);
    80001868:	fe043503          	ld	a0,-32(s0)
    8000186c:	00000097          	auipc	ra,0x0
    80001870:	c30080e7          	jalr	-976(ra) # 8000149c <_Z12printIntegerm>
}
    80001874:	00000013          	nop
    80001878:	09813083          	ld	ra,152(sp)
    8000187c:	09013403          	ld	s0,144(sp)
    80001880:	0a010113          	addi	sp,sp,160
    80001884:	00008067          	ret

0000000080001888 <_ZN5Riscv6mc_sipEm>:
inline void Riscv::mc_sip(uint64 mask) {
    80001888:	ff010113          	addi	sp,sp,-16
    8000188c:	00813423          	sd	s0,8(sp)
    80001890:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sip, %[mask]": :[mask] "r"(mask));
    80001894:	14453073          	csrc	sip,a0
}
    80001898:	00813403          	ld	s0,8(sp)
    8000189c:	01010113          	addi	sp,sp,16
    800018a0:	00008067          	ret

00000000800018a4 <_Znwm>:
// Created by os on 5/29/23.
//
#include "../h/syscall_cpp.hpp"

//override globalnog new
void* operator new(size_t size) {
    800018a4:	ff010113          	addi	sp,sp,-16
    800018a8:	00113423          	sd	ra,8(sp)
    800018ac:	00813023          	sd	s0,0(sp)
    800018b0:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    800018b4:	00000097          	auipc	ra,0x0
    800018b8:	974080e7          	jalr	-1676(ra) # 80001228 <_Z9mem_allocm>
}
    800018bc:	00813083          	ld	ra,8(sp)
    800018c0:	00013403          	ld	s0,0(sp)
    800018c4:	01010113          	addi	sp,sp,16
    800018c8:	00008067          	ret

00000000800018cc <_Znam>:

void* operator new[](size_t size) {
    800018cc:	ff010113          	addi	sp,sp,-16
    800018d0:	00113423          	sd	ra,8(sp)
    800018d4:	00813023          	sd	s0,0(sp)
    800018d8:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    800018dc:	00000097          	auipc	ra,0x0
    800018e0:	94c080e7          	jalr	-1716(ra) # 80001228 <_Z9mem_allocm>
}
    800018e4:	00813083          	ld	ra,8(sp)
    800018e8:	00013403          	ld	s0,0(sp)
    800018ec:	01010113          	addi	sp,sp,16
    800018f0:	00008067          	ret

00000000800018f4 <_ZdlPv>:

void operator delete(void* ptr)noexcept {
    800018f4:	ff010113          	addi	sp,sp,-16
    800018f8:	00113423          	sd	ra,8(sp)
    800018fc:	00813023          	sd	s0,0(sp)
    80001900:	01010413          	addi	s0,sp,16
mem_free(ptr);
    80001904:	00000097          	auipc	ra,0x0
    80001908:	964080e7          	jalr	-1692(ra) # 80001268 <_Z8mem_freePv>
}
    8000190c:	00813083          	ld	ra,8(sp)
    80001910:	00013403          	ld	s0,0(sp)
    80001914:	01010113          	addi	sp,sp,16
    80001918:	00008067          	ret

000000008000191c <_ZdaPv>:

void operator delete[](void* ptr)noexcept {
    8000191c:	ff010113          	addi	sp,sp,-16
    80001920:	00113423          	sd	ra,8(sp)
    80001924:	00813023          	sd	s0,0(sp)
    80001928:	01010413          	addi	s0,sp,16
mem_free(ptr);
    8000192c:	00000097          	auipc	ra,0x0
    80001930:	93c080e7          	jalr	-1732(ra) # 80001268 <_Z8mem_freePv>
    80001934:	00813083          	ld	ra,8(sp)
    80001938:	00013403          	ld	s0,0(sp)
    8000193c:	01010113          	addi	sp,sp,16
    80001940:	00008067          	ret

0000000080001944 <_ZN3TCB12createThreadEPFvPvES0_Pm>:
#include "../h/Scheduler.hpp"

TCB* TCB::running = nullptr;
uint64 TCB::runningTimeSlice = 0;

TCB* TCB::createThread(TCB::Body function, void* args, uint64* stack) {
    80001944:	fd010113          	addi	sp,sp,-48
    80001948:	02113423          	sd	ra,40(sp)
    8000194c:	02813023          	sd	s0,32(sp)
    80001950:	00913c23          	sd	s1,24(sp)
    80001954:	01213823          	sd	s2,16(sp)
    80001958:	01313423          	sd	s3,8(sp)
    8000195c:	01413023          	sd	s4,0(sp)
    80001960:	03010413          	addi	s0,sp,48
    80001964:	00050993          	mv	s3,a0
    80001968:	00058a13          	mv	s4,a1
    8000196c:	00060913          	mv	s2,a2
	TCB* newThread = new TCB(function, args, stack);
    80001970:	03800513          	li	a0,56
    80001974:	00000097          	auipc	ra,0x0
    80001978:	f30080e7          	jalr	-208(ra) # 800018a4 <_Znwm>
    8000197c:	00050493          	mv	s1,a0
	uint64 timeSlice;        //vremenski odsecak dodeljen datoj niti
	bool finished;            //da li je nit zavrsila izvrsavanje funkcije
	bool blocked;            //da li je nit blokirana

	TCB(Body function, void* args, uint64* stack) : threadFunction(function), stack(stack), args(args),
													timeSlice(DEFAULT_TIME_SLICE), finished(false), blocked(false) {
    80001980:	01353823          	sd	s3,16(a0)
    80001984:	01253c23          	sd	s2,24(a0)
    80001988:	03453023          	sd	s4,32(a0)
    8000198c:	00200793          	li	a5,2
    80001990:	02f53423          	sd	a5,40(a0)
    80001994:	02050823          	sb	zero,48(a0)
    80001998:	020508a3          	sb	zero,49(a0)
		//formiranje pocetnog konteksta; specijalni uslovi za main funkciju kojoj se pocetni kontekst automatski formira
		uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
    8000199c:	08098863          	beqz	s3,80001a2c <_ZN3TCB12createThreadEPFvPvES0_Pm+0xe8>
    800019a0:	00000797          	auipc	a5,0x0
    800019a4:	28478793          	addi	a5,a5,644 # 80001c24 <_ZN3TCB7wrapperEv>
		uint64 startSp = stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0;
    800019a8:	08090663          	beqz	s2,80001a34 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xf0>
    800019ac:	00008637          	lui	a2,0x8
    800019b0:	00c90933          	add	s2,s2,a2
		this->context.ra = startRa;
    800019b4:	00f4b423          	sd	a5,8(s1)
		this->context.sp = startSp;
    800019b8:	0124b023          	sd	s2,0(s1)

	Scheduler() {}

public:
	static Scheduler& getInstance() {
		if(singleton==nullptr){
    800019bc:	00004797          	auipc	a5,0x4
    800019c0:	fd47b783          	ld	a5,-44(a5) # 80005990 <_GLOBAL_OFFSET_TABLE_+0x18>
    800019c4:	0007b783          	ld	a5,0(a5)
    800019c8:	06078a63          	beqz	a5,80001a3c <_ZN3TCB12createThreadEPFvPvES0_Pm+0xf8>
			Scheduler* instance = new Scheduler();
			singleton = instance;
		}
		return *singleton;
    800019cc:	00004797          	auipc	a5,0x4
    800019d0:	fc47b783          	ld	a5,-60(a5) # 80005990 <_GLOBAL_OFFSET_TABLE_+0x18>
    800019d4:	0007b903          	ld	s2,0(a5)
		if (!tail) { tail = head; }
		numOfElements++;
	}

	void addLast(T* data) {
		Elem* elem = new Elem(data, nullptr);
    800019d8:	01000513          	li	a0,16
    800019dc:	00000097          	auipc	ra,0x0
    800019e0:	ec8080e7          	jalr	-312(ra) # 800018a4 <_Znwm>
		Elem(T* data, Elem* next) : data(data), next(next) {}
    800019e4:	00953023          	sd	s1,0(a0)
    800019e8:	00053423          	sd	zero,8(a0)
		if (tail) {
    800019ec:	00893783          	ld	a5,8(s2)
    800019f0:	06078a63          	beqz	a5,80001a64 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x120>
			tail->next = elem;
    800019f4:	00a7b423          	sd	a0,8(a5)
			tail = elem;
    800019f8:	00a93423          	sd	a0,8(s2)
		} else {
			head = tail = elem;
		}
		numOfElements++;
    800019fc:	01093783          	ld	a5,16(s2)
    80001a00:	00178793          	addi	a5,a5,1
    80001a04:	00f93823          	sd	a5,16(s2)
	Scheduler::getInstance().put(newThread);
	return newThread;
}
    80001a08:	00048513          	mv	a0,s1
    80001a0c:	02813083          	ld	ra,40(sp)
    80001a10:	02013403          	ld	s0,32(sp)
    80001a14:	01813483          	ld	s1,24(sp)
    80001a18:	01013903          	ld	s2,16(sp)
    80001a1c:	00813983          	ld	s3,8(sp)
    80001a20:	00013a03          	ld	s4,0(sp)
    80001a24:	03010113          	addi	sp,sp,48
    80001a28:	00008067          	ret
		uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
    80001a2c:	00000793          	li	a5,0
    80001a30:	f79ff06f          	j	800019a8 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x64>
		uint64 startSp = stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0;
    80001a34:	00000913          	li	s2,0
    80001a38:	f7dff06f          	j	800019b4 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x70>
			Scheduler* instance = new Scheduler();
    80001a3c:	01800513          	li	a0,24
    80001a40:	00000097          	auipc	ra,0x0
    80001a44:	e64080e7          	jalr	-412(ra) # 800018a4 <_Znwm>
	List() : head(nullptr), tail(nullptr), numOfElements(0) {}
    80001a48:	00053023          	sd	zero,0(a0)
    80001a4c:	00053423          	sd	zero,8(a0)
    80001a50:	00053823          	sd	zero,16(a0)
			singleton = instance;
    80001a54:	00004797          	auipc	a5,0x4
    80001a58:	f3c7b783          	ld	a5,-196(a5) # 80005990 <_GLOBAL_OFFSET_TABLE_+0x18>
    80001a5c:	00a7b023          	sd	a0,0(a5)
    80001a60:	f6dff06f          	j	800019cc <_ZN3TCB12createThreadEPFvPvES0_Pm+0x88>
			head = tail = elem;
    80001a64:	00a93423          	sd	a0,8(s2)
    80001a68:	00a93023          	sd	a0,0(s2)
    80001a6c:	f91ff06f          	j	800019fc <_ZN3TCB12createThreadEPFvPvES0_Pm+0xb8>

0000000080001a70 <_ZN3TCB8dispatchEv>:

void TCB::dispatch() {
    80001a70:	fd010113          	addi	sp,sp,-48
    80001a74:	02113423          	sd	ra,40(sp)
    80001a78:	02813023          	sd	s0,32(sp)
    80001a7c:	00913c23          	sd	s1,24(sp)
    80001a80:	01213823          	sd	s2,16(sp)
    80001a84:	01313423          	sd	s3,8(sp)
    80001a88:	03010413          	addi	s0,sp,48
	TCB* old = TCB::running;
    80001a8c:	00004917          	auipc	s2,0x4
    80001a90:	f6c93903          	ld	s2,-148(s2) # 800059f8 <_ZN3TCB7runningE>
	bool isFinished() { return finished; }
    80001a94:	03094783          	lbu	a5,48(s2)
	if (!old->isFinished() && !old->isBlocked()) {
    80001a98:	00079663          	bnez	a5,80001aa4 <_ZN3TCB8dispatchEv+0x34>
	bool isBlocked() { return blocked; }
    80001a9c:	03194783          	lbu	a5,49(s2)
    80001aa0:	08078463          	beqz	a5,80001b28 <_ZN3TCB8dispatchEv+0xb8>
		if(singleton==nullptr){
    80001aa4:	00004797          	auipc	a5,0x4
    80001aa8:	eec7b783          	ld	a5,-276(a5) # 80005990 <_GLOBAL_OFFSET_TABLE_+0x18>
    80001aac:	0007b783          	ld	a5,0(a5)
    80001ab0:	0e078e63          	beqz	a5,80001bac <_ZN3TCB8dispatchEv+0x13c>
		return *singleton;
    80001ab4:	00004797          	auipc	a5,0x4
    80001ab8:	edc7b783          	ld	a5,-292(a5) # 80005990 <_GLOBAL_OFFSET_TABLE_+0x18>
    80001abc:	0007b483          	ld	s1,0(a5)
	bool isEmpty() { return numOfElements == 0; }
    80001ac0:	0104b783          	ld	a5,16(s1)
	void put(TCB* tcb) {
		readyThreads.addLast(tcb);
	}

	TCB* get() {
		if (readyThreads.isEmpty()) {
    80001ac4:	12078063          	beqz	a5,80001be4 <_ZN3TCB8dispatchEv+0x174>
	}

	T* removeFirst() {
		if (!head) { return nullptr; }
    80001ac8:	0004b503          	ld	a0,0(s1)
    80001acc:	10050863          	beqz	a0,80001bdc <_ZN3TCB8dispatchEv+0x16c>

		Elem* elem = head;
		head = head->next;
    80001ad0:	00853783          	ld	a5,8(a0)
    80001ad4:	00f4b023          	sd	a5,0(s1)
		if (!head) { tail = nullptr; }
    80001ad8:	0e078e63          	beqz	a5,80001bd4 <_ZN3TCB8dispatchEv+0x164>

		T* ret = elem->data;
    80001adc:	00053983          	ld	s3,0(a0)
		delete elem;
    80001ae0:	00000097          	auipc	ra,0x0
    80001ae4:	e14080e7          	jalr	-492(ra) # 800018f4 <_ZdlPv>
		numOfElements--;
    80001ae8:	0104b783          	ld	a5,16(s1)
    80001aec:	fff78793          	addi	a5,a5,-1
    80001af0:	00f4b823          	sd	a5,16(s1)
		Scheduler::getInstance().put(old);
	}
	TCB::running = Scheduler::getInstance().get();
    80001af4:	00004797          	auipc	a5,0x4
    80001af8:	f137b223          	sd	s3,-252(a5) # 800059f8 <_ZN3TCB7runningE>
	TCB::contextSwitch(&old->context, &running->context);
    80001afc:	00098593          	mv	a1,s3
    80001b00:	00090513          	mv	a0,s2
    80001b04:	fffff097          	auipc	ra,0xfffff
    80001b08:	710080e7          	jalr	1808(ra) # 80001214 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80001b0c:	02813083          	ld	ra,40(sp)
    80001b10:	02013403          	ld	s0,32(sp)
    80001b14:	01813483          	ld	s1,24(sp)
    80001b18:	01013903          	ld	s2,16(sp)
    80001b1c:	00813983          	ld	s3,8(sp)
    80001b20:	03010113          	addi	sp,sp,48
    80001b24:	00008067          	ret
		if(singleton==nullptr){
    80001b28:	00004797          	auipc	a5,0x4
    80001b2c:	e687b783          	ld	a5,-408(a5) # 80005990 <_GLOBAL_OFFSET_TABLE_+0x18>
    80001b30:	0007b783          	ld	a5,0(a5)
    80001b34:	04078263          	beqz	a5,80001b78 <_ZN3TCB8dispatchEv+0x108>
		return *singleton;
    80001b38:	00004797          	auipc	a5,0x4
    80001b3c:	e587b783          	ld	a5,-424(a5) # 80005990 <_GLOBAL_OFFSET_TABLE_+0x18>
    80001b40:	0007b483          	ld	s1,0(a5)
		Elem* elem = new Elem(data, nullptr);
    80001b44:	01000513          	li	a0,16
    80001b48:	00000097          	auipc	ra,0x0
    80001b4c:	d5c080e7          	jalr	-676(ra) # 800018a4 <_Znwm>
		Elem(T* data, Elem* next) : data(data), next(next) {}
    80001b50:	01253023          	sd	s2,0(a0)
    80001b54:	00053423          	sd	zero,8(a0)
		if (tail) {
    80001b58:	0084b783          	ld	a5,8(s1)
    80001b5c:	04078263          	beqz	a5,80001ba0 <_ZN3TCB8dispatchEv+0x130>
			tail->next = elem;
    80001b60:	00a7b423          	sd	a0,8(a5)
			tail = elem;
    80001b64:	00a4b423          	sd	a0,8(s1)
		numOfElements++;
    80001b68:	0104b783          	ld	a5,16(s1)
    80001b6c:	00178793          	addi	a5,a5,1
    80001b70:	00f4b823          	sd	a5,16(s1)
	}
    80001b74:	f31ff06f          	j	80001aa4 <_ZN3TCB8dispatchEv+0x34>
			Scheduler* instance = new Scheduler();
    80001b78:	01800513          	li	a0,24
    80001b7c:	00000097          	auipc	ra,0x0
    80001b80:	d28080e7          	jalr	-728(ra) # 800018a4 <_Znwm>
	List() : head(nullptr), tail(nullptr), numOfElements(0) {}
    80001b84:	00053023          	sd	zero,0(a0)
    80001b88:	00053423          	sd	zero,8(a0)
    80001b8c:	00053823          	sd	zero,16(a0)
			singleton = instance;
    80001b90:	00004797          	auipc	a5,0x4
    80001b94:	e007b783          	ld	a5,-512(a5) # 80005990 <_GLOBAL_OFFSET_TABLE_+0x18>
    80001b98:	00a7b023          	sd	a0,0(a5)
    80001b9c:	f9dff06f          	j	80001b38 <_ZN3TCB8dispatchEv+0xc8>
			head = tail = elem;
    80001ba0:	00a4b423          	sd	a0,8(s1)
    80001ba4:	00a4b023          	sd	a0,0(s1)
    80001ba8:	fc1ff06f          	j	80001b68 <_ZN3TCB8dispatchEv+0xf8>
			Scheduler* instance = new Scheduler();
    80001bac:	01800513          	li	a0,24
    80001bb0:	00000097          	auipc	ra,0x0
    80001bb4:	cf4080e7          	jalr	-780(ra) # 800018a4 <_Znwm>
	List() : head(nullptr), tail(nullptr), numOfElements(0) {}
    80001bb8:	00053023          	sd	zero,0(a0)
    80001bbc:	00053423          	sd	zero,8(a0)
    80001bc0:	00053823          	sd	zero,16(a0)
			singleton = instance;
    80001bc4:	00004797          	auipc	a5,0x4
    80001bc8:	dcc7b783          	ld	a5,-564(a5) # 80005990 <_GLOBAL_OFFSET_TABLE_+0x18>
    80001bcc:	00a7b023          	sd	a0,0(a5)
    80001bd0:	ee5ff06f          	j	80001ab4 <_ZN3TCB8dispatchEv+0x44>
		if (!head) { tail = nullptr; }
    80001bd4:	0004b423          	sd	zero,8(s1)
    80001bd8:	f05ff06f          	j	80001adc <_ZN3TCB8dispatchEv+0x6c>
		if (!head) { return nullptr; }
    80001bdc:	00050993          	mv	s3,a0
			return nullptr;
		}
		TCB* tcb = readyThreads.removeFirst();
		return tcb;
    80001be0:	f15ff06f          	j	80001af4 <_ZN3TCB8dispatchEv+0x84>
			return nullptr;
    80001be4:	00000993          	li	s3,0
    80001be8:	f0dff06f          	j	80001af4 <_ZN3TCB8dispatchEv+0x84>

0000000080001bec <_ZN3TCB5yieldEv>:

void TCB::yield() {
    80001bec:	ff010113          	addi	sp,sp,-16
    80001bf0:	00113423          	sd	ra,8(sp)
    80001bf4:	00813023          	sd	s0,0(sp)
    80001bf8:	01010413          	addi	s0,sp,16
	Riscv::pushRegisters();
    80001bfc:	fffff097          	auipc	ra,0xfffff
    80001c00:	404080e7          	jalr	1028(ra) # 80001000 <_ZN5Riscv13pushRegistersEv>
	TCB::dispatch();
    80001c04:	00000097          	auipc	ra,0x0
    80001c08:	e6c080e7          	jalr	-404(ra) # 80001a70 <_ZN3TCB8dispatchEv>
	Riscv::popRegisters();
    80001c0c:	fffff097          	auipc	ra,0xfffff
    80001c10:	470080e7          	jalr	1136(ra) # 8000107c <_ZN5Riscv12popRegistersEv>
}
    80001c14:	00813083          	ld	ra,8(sp)
    80001c18:	00013403          	ld	s0,0(sp)
    80001c1c:	01010113          	addi	sp,sp,16
    80001c20:	00008067          	ret

0000000080001c24 <_ZN3TCB7wrapperEv>:

void TCB::wrapper() {
    80001c24:	fe010113          	addi	sp,sp,-32
    80001c28:	00113c23          	sd	ra,24(sp)
    80001c2c:	00813823          	sd	s0,16(sp)
    80001c30:	00913423          	sd	s1,8(sp)
    80001c34:	02010413          	addi	s0,sp,32
	running->threadFunction(running->args);
    80001c38:	00004497          	auipc	s1,0x4
    80001c3c:	dc048493          	addi	s1,s1,-576 # 800059f8 <_ZN3TCB7runningE>
    80001c40:	0004b783          	ld	a5,0(s1)
    80001c44:	0107b703          	ld	a4,16(a5)
    80001c48:	0207b503          	ld	a0,32(a5)
    80001c4c:	000700e7          	jalr	a4
	running->finished = true;
    80001c50:	0004b783          	ld	a5,0(s1)
    80001c54:	00100713          	li	a4,1
    80001c58:	02e78823          	sb	a4,48(a5)
	TCB::yield();
    80001c5c:	00000097          	auipc	ra,0x0
    80001c60:	f90080e7          	jalr	-112(ra) # 80001bec <_ZN3TCB5yieldEv>
}
    80001c64:	01813083          	ld	ra,24(sp)
    80001c68:	01013403          	ld	s0,16(sp)
    80001c6c:	00813483          	ld	s1,8(sp)
    80001c70:	02010113          	addi	sp,sp,32
    80001c74:	00008067          	ret

0000000080001c78 <_ZN15MemoryAllocator7kmallocEm>:

bool MemoryAllocator::initialized = false;
MemoryAllocator::FreeMemSegment* MemoryAllocator::freeMemHead = nullptr;
MemoryAllocator::UsedMemSegment* MemoryAllocator::usedMemHead = nullptr;

void* MemoryAllocator::kmalloc(size_t size) {
    80001c78:	ff010113          	addi	sp,sp,-16
    80001c7c:	00813423          	sd	s0,8(sp)
    80001c80:	01010413          	addi	s0,sp,16
	if (size <= 0) return nullptr;
    80001c84:	12050663          	beqz	a0,80001db0 <_ZN15MemoryAllocator7kmallocEm+0x138>

	//pocetna inicijalizacija
	if (!initialized) {
    80001c88:	00004797          	auipc	a5,0x4
    80001c8c:	d807c783          	lbu	a5,-640(a5) # 80005a08 <_ZN15MemoryAllocator11initializedE>
    80001c90:	04079863          	bnez	a5,80001ce0 <_ZN15MemoryAllocator7kmallocEm+0x68>
		freeMemHead = (FreeMemSegment*)HEAP_START_ADDR;
    80001c94:	00004617          	auipc	a2,0x4
    80001c98:	cec63603          	ld	a2,-788(a2) # 80005980 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001c9c:	00063783          	ld	a5,0(a2)
    80001ca0:	00004717          	auipc	a4,0x4
    80001ca4:	d6870713          	addi	a4,a4,-664 # 80005a08 <_ZN15MemoryAllocator11initializedE>
    80001ca8:	00f73423          	sd	a5,8(a4)
		freeMemHead->next = nullptr;
    80001cac:	0007b023          	sd	zero,0(a5)
		freeMemHead->prev = nullptr;
    80001cb0:	00873683          	ld	a3,8(a4)
    80001cb4:	0006b423          	sd	zero,8(a3)
		freeMemHead->size = (char*)HEAP_END_ADDR - (char*)HEAP_START_ADDR - sizeof(FreeMemSegment);
    80001cb8:	00004797          	auipc	a5,0x4
    80001cbc:	ce87b783          	ld	a5,-792(a5) # 800059a0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001cc0:	0007b783          	ld	a5,0(a5)
    80001cc4:	00063603          	ld	a2,0(a2)
    80001cc8:	40c787b3          	sub	a5,a5,a2
    80001ccc:	fe878793          	addi	a5,a5,-24
    80001cd0:	00f6b823          	sd	a5,16(a3)
		usedMemHead = nullptr;
    80001cd4:	00073823          	sd	zero,16(a4)

		initialized = true;
    80001cd8:	00100793          	li	a5,1
    80001cdc:	00f70023          	sb	a5,0(a4)
	}

	//alokacija uvek zaokruzena na blokove
	//size += sizeof(UsedMemSegment); ;prebaceno u mem_alloc
	size_t blocks = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
    80001ce0:	00655793          	srli	a5,a0,0x6
    80001ce4:	03f57513          	andi	a0,a0,63
    80001ce8:	00050463          	beqz	a0,80001cf0 <_ZN15MemoryAllocator7kmallocEm+0x78>
    80001cec:	00100513          	li	a0,1
    80001cf0:	00a78533          	add	a0,a5,a0
	size = blocks * MEM_BLOCK_SIZE;
    80001cf4:	00651793          	slli	a5,a0,0x6

	//trazenje slobodnog segmenta po first-fit algoritmu
	for (FreeMemSegment* current = freeMemHead; current; current = current->next) {
    80001cf8:	00004517          	auipc	a0,0x4
    80001cfc:	d1853503          	ld	a0,-744(a0) # 80005a10 <_ZN15MemoryAllocator11freeMemHeadE>
    80001d00:	08050a63          	beqz	a0,80001d94 <_ZN15MemoryAllocator7kmallocEm+0x11c>
		if (current->size < size) continue;
    80001d04:	01053703          	ld	a4,16(a0)
    80001d08:	06f76263          	bltu	a4,a5,80001d6c <_ZN15MemoryAllocator7kmallocEm+0xf4>

		//pravljenje novog slobodnog fragmenta od ostatka fragmenta
		FreeMemSegment* remainderFree = (FreeMemSegment*)((char*)current + size);
    80001d0c:	00f506b3          	add	a3,a0,a5
		remainderFree->size = current->size - size;
    80001d10:	40f70733          	sub	a4,a4,a5
    80001d14:	00e6b823          	sd	a4,16(a3)
		remainderFree->prev = current->prev;
    80001d18:	00853703          	ld	a4,8(a0)
    80001d1c:	00e6b423          	sd	a4,8(a3)
		if (current->prev) current->prev->next = remainderFree;
    80001d20:	00070463          	beqz	a4,80001d28 <_ZN15MemoryAllocator7kmallocEm+0xb0>
    80001d24:	00d73023          	sd	a3,0(a4)
		remainderFree->next = current->next;
    80001d28:	00053703          	ld	a4,0(a0)
    80001d2c:	00e6b023          	sd	a4,0(a3)
		if (current->next) current->next->prev = remainderFree;
    80001d30:	00070463          	beqz	a4,80001d38 <_ZN15MemoryAllocator7kmallocEm+0xc0>
    80001d34:	00d73423          	sd	a3,8(a4)
		if (freeMemHead == current) freeMemHead = remainderFree;
    80001d38:	00004717          	auipc	a4,0x4
    80001d3c:	cd873703          	ld	a4,-808(a4) # 80005a10 <_ZN15MemoryAllocator11freeMemHeadE>
    80001d40:	02a70a63          	beq	a4,a0,80001d74 <_ZN15MemoryAllocator7kmallocEm+0xfc>

		//ubacivanje novog fragmenta u listu zauzetih fragmenata
		UsedMemSegment* newFragment = (UsedMemSegment*)current;
		newFragment->size = size;
    80001d44:	00f53423          	sd	a5,8(a0)
		UsedMemSegment* prevUsed = nullptr;
		for (UsedMemSegment* cur = usedMemHead; cur && cur < newFragment; prevUsed = cur, cur = cur->next);
    80001d48:	00004697          	auipc	a3,0x4
    80001d4c:	cd06b683          	ld	a3,-816(a3) # 80005a18 <_ZN15MemoryAllocator11usedMemHeadE>
    80001d50:	00068793          	mv	a5,a3
		UsedMemSegment* prevUsed = nullptr;
    80001d54:	00000713          	li	a4,0
		for (UsedMemSegment* cur = usedMemHead; cur && cur < newFragment; prevUsed = cur, cur = cur->next);
    80001d58:	02078463          	beqz	a5,80001d80 <_ZN15MemoryAllocator7kmallocEm+0x108>
    80001d5c:	02a7f263          	bgeu	a5,a0,80001d80 <_ZN15MemoryAllocator7kmallocEm+0x108>
    80001d60:	00078713          	mv	a4,a5
    80001d64:	0007b783          	ld	a5,0(a5)
    80001d68:	ff1ff06f          	j	80001d58 <_ZN15MemoryAllocator7kmallocEm+0xe0>
	for (FreeMemSegment* current = freeMemHead; current; current = current->next) {
    80001d6c:	00053503          	ld	a0,0(a0)
    80001d70:	f91ff06f          	j	80001d00 <_ZN15MemoryAllocator7kmallocEm+0x88>
		if (freeMemHead == current) freeMemHead = remainderFree;
    80001d74:	00004717          	auipc	a4,0x4
    80001d78:	c8d73e23          	sd	a3,-868(a4) # 80005a10 <_ZN15MemoryAllocator11freeMemHeadE>
    80001d7c:	fc9ff06f          	j	80001d44 <_ZN15MemoryAllocator7kmallocEm+0xcc>
		if (!prevUsed) {
    80001d80:	02070063          	beqz	a4,80001da0 <_ZN15MemoryAllocator7kmallocEm+0x128>
			newFragment->next = usedMemHead;
			usedMemHead = newFragment;
		} else {
			newFragment->next = prevUsed->next;
    80001d84:	00073783          	ld	a5,0(a4)
    80001d88:	00f53023          	sd	a5,0(a0)
			prevUsed->next = newFragment;
    80001d8c:	00a73023          	sd	a0,0(a4)
		}
		return (char*)newFragment + sizeof(UsedMemSegment);
    80001d90:	01050513          	addi	a0,a0,16
	}
	return nullptr;
}
    80001d94:	00813403          	ld	s0,8(sp)
    80001d98:	01010113          	addi	sp,sp,16
    80001d9c:	00008067          	ret
			newFragment->next = usedMemHead;
    80001da0:	00d53023          	sd	a3,0(a0)
			usedMemHead = newFragment;
    80001da4:	00004797          	auipc	a5,0x4
    80001da8:	c6a7ba23          	sd	a0,-908(a5) # 80005a18 <_ZN15MemoryAllocator11usedMemHeadE>
    80001dac:	fe5ff06f          	j	80001d90 <_ZN15MemoryAllocator7kmallocEm+0x118>
	if (size <= 0) return nullptr;
    80001db0:	00000513          	li	a0,0
    80001db4:	fe1ff06f          	j	80001d94 <_ZN15MemoryAllocator7kmallocEm+0x11c>

0000000080001db8 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>:
	tryToJoin(newFree);
	tryToJoin(prevFree);
	return 0;
}

int MemoryAllocator::tryToJoin(MemoryAllocator::FreeMemSegment* current) {
    80001db8:	ff010113          	addi	sp,sp,-16
    80001dbc:	00813423          	sd	s0,8(sp)
    80001dc0:	01010413          	addi	s0,sp,16
	if (!current) return 0;
    80001dc4:	04050663          	beqz	a0,80001e10 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x58>
	bool nextExists = current->next != nullptr;
    80001dc8:	00053783          	ld	a5,0(a0)
	char* nextAddr = (char*)current + current->size;
    80001dcc:	01053703          	ld	a4,16(a0)
    80001dd0:	00e506b3          	add	a3,a0,a4
	char* cnext = (char*)current->next;
	bool nextIsConnected = (nextAddr == cnext);
	if (nextExists && nextIsConnected) {
    80001dd4:	04078263          	beqz	a5,80001e18 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x60>
    80001dd8:	00d78a63          	beq	a5,a3,80001dec <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x34>
		current->size += current->next->size;
		current->next = current->next->next;
		if (current->next) current->next->prev = current;
		return 1;
	} else return 0;
    80001ddc:	00000513          	li	a0,0
}
    80001de0:	00813403          	ld	s0,8(sp)
    80001de4:	01010113          	addi	sp,sp,16
    80001de8:	00008067          	ret
		current->size += current->next->size;
    80001dec:	0107b683          	ld	a3,16(a5)
    80001df0:	00d70733          	add	a4,a4,a3
    80001df4:	00e53823          	sd	a4,16(a0)
		current->next = current->next->next;
    80001df8:	0007b783          	ld	a5,0(a5)
    80001dfc:	00f53023          	sd	a5,0(a0)
		if (current->next) current->next->prev = current;
    80001e00:	00078463          	beqz	a5,80001e08 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x50>
    80001e04:	00a7b423          	sd	a0,8(a5)
		return 1;
    80001e08:	00100513          	li	a0,1
    80001e0c:	fd5ff06f          	j	80001de0 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>
	if (!current) return 0;
    80001e10:	00000513          	li	a0,0
    80001e14:	fcdff06f          	j	80001de0 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>
	} else return 0;
    80001e18:	00000513          	li	a0,0
    80001e1c:	fc5ff06f          	j	80001de0 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>

0000000080001e20 <_ZN15MemoryAllocator5kfreeEPv>:
	if (!ptr) return 0;
    80001e20:	10050463          	beqz	a0,80001f28 <_ZN15MemoryAllocator5kfreeEPv+0x108>
    80001e24:	00050693          	mv	a3,a0
	if (!usedMemHead) return -1;
    80001e28:	00004797          	auipc	a5,0x4
    80001e2c:	bf07b783          	ld	a5,-1040(a5) # 80005a18 <_ZN15MemoryAllocator11usedMemHeadE>
    80001e30:	10078063          	beqz	a5,80001f30 <_ZN15MemoryAllocator5kfreeEPv+0x110>
	ptr = (char*)ptr - sizeof(UsedMemSegment);
    80001e34:	ff050513          	addi	a0,a0,-16
	UsedMemSegment* prevUsed = nullptr;
    80001e38:	00000713          	li	a4,0
	for (; currentUsed && currentUsed != ptr; prevUsed = currentUsed, currentUsed = currentUsed->next);
    80001e3c:	00078a63          	beqz	a5,80001e50 <_ZN15MemoryAllocator5kfreeEPv+0x30>
    80001e40:	00a78863          	beq	a5,a0,80001e50 <_ZN15MemoryAllocator5kfreeEPv+0x30>
    80001e44:	00078713          	mv	a4,a5
    80001e48:	0007b783          	ld	a5,0(a5)
    80001e4c:	ff1ff06f          	j	80001e3c <_ZN15MemoryAllocator5kfreeEPv+0x1c>
	if (currentUsed != ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    80001e50:	0ea79463          	bne	a5,a0,80001f38 <_ZN15MemoryAllocator5kfreeEPv+0x118>
int MemoryAllocator::kfree(void* ptr) {
    80001e54:	fe010113          	addi	sp,sp,-32
    80001e58:	00113c23          	sd	ra,24(sp)
    80001e5c:	00813823          	sd	s0,16(sp)
    80001e60:	00913423          	sd	s1,8(sp)
    80001e64:	02010413          	addi	s0,sp,32
	if (prevUsed) prevUsed->next = currentUsed->next;
    80001e68:	02070863          	beqz	a4,80001e98 <_ZN15MemoryAllocator5kfreeEPv+0x78>
    80001e6c:	0007b783          	ld	a5,0(a5)
    80001e70:	00f73023          	sd	a5,0(a4)
	if (!freeMemHead || ptr < (char*)freeMemHead) {
    80001e74:	00004797          	auipc	a5,0x4
    80001e78:	b9c7b783          	ld	a5,-1124(a5) # 80005a10 <_ZN15MemoryAllocator11freeMemHeadE>
    80001e7c:	02078663          	beqz	a5,80001ea8 <_ZN15MemoryAllocator5kfreeEPv+0x88>
    80001e80:	02f56863          	bltu	a0,a5,80001eb0 <_ZN15MemoryAllocator5kfreeEPv+0x90>
			 prevFree->next != nullptr && ptr > (char*)(prevFree->next); prevFree = prevFree->next);
    80001e84:	00078493          	mv	s1,a5
    80001e88:	0007b783          	ld	a5,0(a5)
    80001e8c:	02078463          	beqz	a5,80001eb4 <_ZN15MemoryAllocator5kfreeEPv+0x94>
    80001e90:	fea7eae3          	bltu	a5,a0,80001e84 <_ZN15MemoryAllocator5kfreeEPv+0x64>
    80001e94:	0200006f          	j	80001eb4 <_ZN15MemoryAllocator5kfreeEPv+0x94>
	else usedMemHead = currentUsed->next;
    80001e98:	0007b783          	ld	a5,0(a5)
    80001e9c:	00004717          	auipc	a4,0x4
    80001ea0:	b6f73e23          	sd	a5,-1156(a4) # 80005a18 <_ZN15MemoryAllocator11usedMemHeadE>
    80001ea4:	fd1ff06f          	j	80001e74 <_ZN15MemoryAllocator5kfreeEPv+0x54>
		prevFree = nullptr;
    80001ea8:	00078493          	mv	s1,a5
    80001eac:	0080006f          	j	80001eb4 <_ZN15MemoryAllocator5kfreeEPv+0x94>
    80001eb0:	00000493          	li	s1,0
	size_t segmentSize = ((UsedMemSegment*)ptr)->size;
    80001eb4:	ff86b783          	ld	a5,-8(a3)
	newFree->size = segmentSize;
    80001eb8:	00f6b023          	sd	a5,0(a3)
	newFree->prev = prevFree;
    80001ebc:	fe96bc23          	sd	s1,-8(a3)
	if (prevFree) newFree->next = prevFree->next;
    80001ec0:	04048663          	beqz	s1,80001f0c <_ZN15MemoryAllocator5kfreeEPv+0xec>
    80001ec4:	0004b783          	ld	a5,0(s1)
    80001ec8:	fef6b823          	sd	a5,-16(a3)
	if (newFree->next) newFree->next->prev = newFree;
    80001ecc:	ff06b783          	ld	a5,-16(a3)
    80001ed0:	00078463          	beqz	a5,80001ed8 <_ZN15MemoryAllocator5kfreeEPv+0xb8>
    80001ed4:	00a7b423          	sd	a0,8(a5)
	if (prevFree) prevFree->next = newFree;
    80001ed8:	04048263          	beqz	s1,80001f1c <_ZN15MemoryAllocator5kfreeEPv+0xfc>
    80001edc:	00a4b023          	sd	a0,0(s1)
	tryToJoin(newFree);
    80001ee0:	00000097          	auipc	ra,0x0
    80001ee4:	ed8080e7          	jalr	-296(ra) # 80001db8 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
	tryToJoin(prevFree);
    80001ee8:	00048513          	mv	a0,s1
    80001eec:	00000097          	auipc	ra,0x0
    80001ef0:	ecc080e7          	jalr	-308(ra) # 80001db8 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
	return 0;
    80001ef4:	00000513          	li	a0,0
}
    80001ef8:	01813083          	ld	ra,24(sp)
    80001efc:	01013403          	ld	s0,16(sp)
    80001f00:	00813483          	ld	s1,8(sp)
    80001f04:	02010113          	addi	sp,sp,32
    80001f08:	00008067          	ret
	else newFree->next = freeMemHead;
    80001f0c:	00004797          	auipc	a5,0x4
    80001f10:	b047b783          	ld	a5,-1276(a5) # 80005a10 <_ZN15MemoryAllocator11freeMemHeadE>
    80001f14:	fef6b823          	sd	a5,-16(a3)
    80001f18:	fb5ff06f          	j	80001ecc <_ZN15MemoryAllocator5kfreeEPv+0xac>
	else freeMemHead = newFree;
    80001f1c:	00004797          	auipc	a5,0x4
    80001f20:	aea7ba23          	sd	a0,-1292(a5) # 80005a10 <_ZN15MemoryAllocator11freeMemHeadE>
    80001f24:	fbdff06f          	j	80001ee0 <_ZN15MemoryAllocator5kfreeEPv+0xc0>
	if (!ptr) return 0;
    80001f28:	00000513          	li	a0,0
    80001f2c:	00008067          	ret
	if (!usedMemHead) return -1;
    80001f30:	fff00513          	li	a0,-1
    80001f34:	00008067          	ret
	if (currentUsed != ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    80001f38:	fff00513          	li	a0,-1
}
    80001f3c:	00008067          	ret

0000000080001f40 <_Z10testMemoryv>:
// Created by os on 5/29/23.
//
#include "../h/MemoryAllocator.hpp"
#include "../h/helper.hpp"

void testMemory() {
    80001f40:	81010113          	addi	sp,sp,-2032
    80001f44:	7e113423          	sd	ra,2024(sp)
    80001f48:	7e813023          	sd	s0,2016(sp)
    80001f4c:	7c913c23          	sd	s1,2008(sp)
    80001f50:	7f010413          	addi	s0,sp,2032
    80001f54:	83010113          	addi	sp,sp,-2000
	const uint64 NumAllocations = 500;    //zasto nece za preko 500????
	const uint64 AllocationSize = 16;

	// Allocate and initialize pointers
	int* allocations[NumAllocations];
	for (uint64 i = 0; i < NumAllocations; ++i)
    80001f58:	00000713          	li	a4,0
    80001f5c:	1f300793          	li	a5,499
    80001f60:	02e7e263          	bltu	a5,a4,80001f84 <_Z10testMemoryv+0x44>
		allocations[i] = nullptr;
    80001f64:	fffff7b7          	lui	a5,0xfffff
    80001f68:	00371693          	slli	a3,a4,0x3
    80001f6c:	fe040613          	addi	a2,s0,-32
    80001f70:	00f607b3          	add	a5,a2,a5
    80001f74:	00d787b3          	add	a5,a5,a3
    80001f78:	0607b023          	sd	zero,96(a5) # fffffffffffff060 <end+0xffffffff7fff83e0>
	for (uint64 i = 0; i < NumAllocations; ++i)
    80001f7c:	00170713          	addi	a4,a4,1
    80001f80:	fddff06f          	j	80001f5c <_Z10testMemoryv+0x1c>

	// Allocate memory
	for (uint64 i = 0; i < NumAllocations; ++i) {
    80001f84:	00000493          	li	s1,0
    80001f88:	1f300793          	li	a5,499
    80001f8c:	0497e863          	bltu	a5,s1,80001fdc <_Z10testMemoryv+0x9c>
		allocations[i] = static_cast<int*>(MemoryAllocator::kmalloc(AllocationSize));
    80001f90:	01000513          	li	a0,16
    80001f94:	00000097          	auipc	ra,0x0
    80001f98:	ce4080e7          	jalr	-796(ra) # 80001c78 <_ZN15MemoryAllocator7kmallocEm>
    80001f9c:	fffff737          	lui	a4,0xfffff
    80001fa0:	00349793          	slli	a5,s1,0x3
    80001fa4:	fe040693          	addi	a3,s0,-32
    80001fa8:	00e68733          	add	a4,a3,a4
    80001fac:	00f707b3          	add	a5,a4,a5
    80001fb0:	06a7b023          	sd	a0,96(a5)
		if (allocations[i] == nullptr) {
    80001fb4:	00050663          	beqz	a0,80001fc0 <_Z10testMemoryv+0x80>
	for (uint64 i = 0; i < NumAllocations; ++i) {
    80001fb8:	00148493          	addi	s1,s1,1
    80001fbc:	fcdff06f          	j	80001f88 <_Z10testMemoryv+0x48>
			printString("\nAllocation failed for index ");
    80001fc0:	00003517          	auipc	a0,0x3
    80001fc4:	1f850513          	addi	a0,a0,504 # 800051b8 <_ZZ12printIntegermE6digits+0x198>
    80001fc8:	fffff097          	auipc	ra,0xfffff
    80001fcc:	45c080e7          	jalr	1116(ra) # 80001424 <_Z11printStringPKc>
			printInteger(i);
    80001fd0:	00048513          	mv	a0,s1
    80001fd4:	fffff097          	auipc	ra,0xfffff
    80001fd8:	4c8080e7          	jalr	1224(ra) # 8000149c <_Z12printIntegerm>
	for (uint64 i = 0; i < NumAllocations; ++i) {
    80001fdc:	00000493          	li	s1,0
    80001fe0:	0240006f          	j	80002004 <_Z10testMemoryv+0xc4>

	// Free memory
	for (uint64 i = 0; i < NumAllocations; ++i) {
		if (allocations[i] != nullptr) {
			if (MemoryAllocator::kfree(allocations[i]) != 0) {
				printString("\nDeallocation failed for index ");
    80001fe4:	00003517          	auipc	a0,0x3
    80001fe8:	1f450513          	addi	a0,a0,500 # 800051d8 <_ZZ12printIntegermE6digits+0x1b8>
    80001fec:	fffff097          	auipc	ra,0xfffff
    80001ff0:	438080e7          	jalr	1080(ra) # 80001424 <_Z11printStringPKc>
				printInteger(i);
    80001ff4:	00048513          	mv	a0,s1
    80001ff8:	fffff097          	auipc	ra,0xfffff
    80001ffc:	4a4080e7          	jalr	1188(ra) # 8000149c <_Z12printIntegerm>
	for (uint64 i = 0; i < NumAllocations; ++i) {
    80002000:	00148493          	addi	s1,s1,1
    80002004:	1f300793          	li	a5,499
    80002008:	0297e863          	bltu	a5,s1,80002038 <_Z10testMemoryv+0xf8>
		if (allocations[i] != nullptr) {
    8000200c:	fffff737          	lui	a4,0xfffff
    80002010:	00349793          	slli	a5,s1,0x3
    80002014:	fe040693          	addi	a3,s0,-32
    80002018:	00e68733          	add	a4,a3,a4
    8000201c:	00f707b3          	add	a5,a4,a5
    80002020:	0607b503          	ld	a0,96(a5)
    80002024:	fc050ee3          	beqz	a0,80002000 <_Z10testMemoryv+0xc0>
			if (MemoryAllocator::kfree(allocations[i]) != 0) {
    80002028:	00000097          	auipc	ra,0x0
    8000202c:	df8080e7          	jalr	-520(ra) # 80001e20 <_ZN15MemoryAllocator5kfreeEPv>
    80002030:	fc0508e3          	beqz	a0,80002000 <_Z10testMemoryv+0xc0>
    80002034:	fb1ff06f          	j	80001fe4 <_Z10testMemoryv+0xa4>
			}
		}
	}
    80002038:	7d010113          	addi	sp,sp,2000
    8000203c:	7e813083          	ld	ra,2024(sp)
    80002040:	7e013403          	ld	s0,2016(sp)
    80002044:	7d813483          	ld	s1,2008(sp)
    80002048:	7f010113          	addi	sp,sp,2032
    8000204c:	00008067          	ret

0000000080002050 <start>:
    80002050:	ff010113          	addi	sp,sp,-16
    80002054:	00813423          	sd	s0,8(sp)
    80002058:	01010413          	addi	s0,sp,16
    8000205c:	300027f3          	csrr	a5,mstatus
    80002060:	ffffe737          	lui	a4,0xffffe
    80002064:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff7b7f>
    80002068:	00e7f7b3          	and	a5,a5,a4
    8000206c:	00001737          	lui	a4,0x1
    80002070:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80002074:	00e7e7b3          	or	a5,a5,a4
    80002078:	30079073          	csrw	mstatus,a5
    8000207c:	00000797          	auipc	a5,0x0
    80002080:	16078793          	addi	a5,a5,352 # 800021dc <system_main>
    80002084:	34179073          	csrw	mepc,a5
    80002088:	00000793          	li	a5,0
    8000208c:	18079073          	csrw	satp,a5
    80002090:	000107b7          	lui	a5,0x10
    80002094:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80002098:	30279073          	csrw	medeleg,a5
    8000209c:	30379073          	csrw	mideleg,a5
    800020a0:	104027f3          	csrr	a5,sie
    800020a4:	2227e793          	ori	a5,a5,546
    800020a8:	10479073          	csrw	sie,a5
    800020ac:	fff00793          	li	a5,-1
    800020b0:	00a7d793          	srli	a5,a5,0xa
    800020b4:	3b079073          	csrw	pmpaddr0,a5
    800020b8:	00f00793          	li	a5,15
    800020bc:	3a079073          	csrw	pmpcfg0,a5
    800020c0:	f14027f3          	csrr	a5,mhartid
    800020c4:	0200c737          	lui	a4,0x200c
    800020c8:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800020cc:	0007869b          	sext.w	a3,a5
    800020d0:	00269713          	slli	a4,a3,0x2
    800020d4:	000f4637          	lui	a2,0xf4
    800020d8:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800020dc:	00d70733          	add	a4,a4,a3
    800020e0:	0037979b          	slliw	a5,a5,0x3
    800020e4:	020046b7          	lui	a3,0x2004
    800020e8:	00d787b3          	add	a5,a5,a3
    800020ec:	00c585b3          	add	a1,a1,a2
    800020f0:	00371693          	slli	a3,a4,0x3
    800020f4:	00004717          	auipc	a4,0x4
    800020f8:	92c70713          	addi	a4,a4,-1748 # 80005a20 <timer_scratch>
    800020fc:	00b7b023          	sd	a1,0(a5)
    80002100:	00d70733          	add	a4,a4,a3
    80002104:	00f73c23          	sd	a5,24(a4)
    80002108:	02c73023          	sd	a2,32(a4)
    8000210c:	34071073          	csrw	mscratch,a4
    80002110:	00000797          	auipc	a5,0x0
    80002114:	6e078793          	addi	a5,a5,1760 # 800027f0 <timervec>
    80002118:	30579073          	csrw	mtvec,a5
    8000211c:	300027f3          	csrr	a5,mstatus
    80002120:	0087e793          	ori	a5,a5,8
    80002124:	30079073          	csrw	mstatus,a5
    80002128:	304027f3          	csrr	a5,mie
    8000212c:	0807e793          	ori	a5,a5,128
    80002130:	30479073          	csrw	mie,a5
    80002134:	f14027f3          	csrr	a5,mhartid
    80002138:	0007879b          	sext.w	a5,a5
    8000213c:	00078213          	mv	tp,a5
    80002140:	30200073          	mret
    80002144:	00813403          	ld	s0,8(sp)
    80002148:	01010113          	addi	sp,sp,16
    8000214c:	00008067          	ret

0000000080002150 <timerinit>:
    80002150:	ff010113          	addi	sp,sp,-16
    80002154:	00813423          	sd	s0,8(sp)
    80002158:	01010413          	addi	s0,sp,16
    8000215c:	f14027f3          	csrr	a5,mhartid
    80002160:	0200c737          	lui	a4,0x200c
    80002164:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80002168:	0007869b          	sext.w	a3,a5
    8000216c:	00269713          	slli	a4,a3,0x2
    80002170:	000f4637          	lui	a2,0xf4
    80002174:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80002178:	00d70733          	add	a4,a4,a3
    8000217c:	0037979b          	slliw	a5,a5,0x3
    80002180:	020046b7          	lui	a3,0x2004
    80002184:	00d787b3          	add	a5,a5,a3
    80002188:	00c585b3          	add	a1,a1,a2
    8000218c:	00371693          	slli	a3,a4,0x3
    80002190:	00004717          	auipc	a4,0x4
    80002194:	89070713          	addi	a4,a4,-1904 # 80005a20 <timer_scratch>
    80002198:	00b7b023          	sd	a1,0(a5)
    8000219c:	00d70733          	add	a4,a4,a3
    800021a0:	00f73c23          	sd	a5,24(a4)
    800021a4:	02c73023          	sd	a2,32(a4)
    800021a8:	34071073          	csrw	mscratch,a4
    800021ac:	00000797          	auipc	a5,0x0
    800021b0:	64478793          	addi	a5,a5,1604 # 800027f0 <timervec>
    800021b4:	30579073          	csrw	mtvec,a5
    800021b8:	300027f3          	csrr	a5,mstatus
    800021bc:	0087e793          	ori	a5,a5,8
    800021c0:	30079073          	csrw	mstatus,a5
    800021c4:	304027f3          	csrr	a5,mie
    800021c8:	0807e793          	ori	a5,a5,128
    800021cc:	30479073          	csrw	mie,a5
    800021d0:	00813403          	ld	s0,8(sp)
    800021d4:	01010113          	addi	sp,sp,16
    800021d8:	00008067          	ret

00000000800021dc <system_main>:
    800021dc:	fe010113          	addi	sp,sp,-32
    800021e0:	00813823          	sd	s0,16(sp)
    800021e4:	00913423          	sd	s1,8(sp)
    800021e8:	00113c23          	sd	ra,24(sp)
    800021ec:	02010413          	addi	s0,sp,32
    800021f0:	00000097          	auipc	ra,0x0
    800021f4:	0c4080e7          	jalr	196(ra) # 800022b4 <cpuid>
    800021f8:	00003497          	auipc	s1,0x3
    800021fc:	7c848493          	addi	s1,s1,1992 # 800059c0 <started>
    80002200:	02050263          	beqz	a0,80002224 <system_main+0x48>
    80002204:	0004a783          	lw	a5,0(s1)
    80002208:	0007879b          	sext.w	a5,a5
    8000220c:	fe078ce3          	beqz	a5,80002204 <system_main+0x28>
    80002210:	0ff0000f          	fence
    80002214:	00003517          	auipc	a0,0x3
    80002218:	01450513          	addi	a0,a0,20 # 80005228 <_ZZ12printIntegermE6digits+0x208>
    8000221c:	00001097          	auipc	ra,0x1
    80002220:	a70080e7          	jalr	-1424(ra) # 80002c8c <panic>
    80002224:	00001097          	auipc	ra,0x1
    80002228:	9c4080e7          	jalr	-1596(ra) # 80002be8 <consoleinit>
    8000222c:	00001097          	auipc	ra,0x1
    80002230:	150080e7          	jalr	336(ra) # 8000337c <printfinit>
    80002234:	00003517          	auipc	a0,0x3
    80002238:	0d450513          	addi	a0,a0,212 # 80005308 <_ZZ12printIntegermE6digits+0x2e8>
    8000223c:	00001097          	auipc	ra,0x1
    80002240:	aac080e7          	jalr	-1364(ra) # 80002ce8 <__printf>
    80002244:	00003517          	auipc	a0,0x3
    80002248:	fb450513          	addi	a0,a0,-76 # 800051f8 <_ZZ12printIntegermE6digits+0x1d8>
    8000224c:	00001097          	auipc	ra,0x1
    80002250:	a9c080e7          	jalr	-1380(ra) # 80002ce8 <__printf>
    80002254:	00003517          	auipc	a0,0x3
    80002258:	0b450513          	addi	a0,a0,180 # 80005308 <_ZZ12printIntegermE6digits+0x2e8>
    8000225c:	00001097          	auipc	ra,0x1
    80002260:	a8c080e7          	jalr	-1396(ra) # 80002ce8 <__printf>
    80002264:	00001097          	auipc	ra,0x1
    80002268:	4a4080e7          	jalr	1188(ra) # 80003708 <kinit>
    8000226c:	00000097          	auipc	ra,0x0
    80002270:	148080e7          	jalr	328(ra) # 800023b4 <trapinit>
    80002274:	00000097          	auipc	ra,0x0
    80002278:	16c080e7          	jalr	364(ra) # 800023e0 <trapinithart>
    8000227c:	00000097          	auipc	ra,0x0
    80002280:	5b4080e7          	jalr	1460(ra) # 80002830 <plicinit>
    80002284:	00000097          	auipc	ra,0x0
    80002288:	5d4080e7          	jalr	1492(ra) # 80002858 <plicinithart>
    8000228c:	00000097          	auipc	ra,0x0
    80002290:	078080e7          	jalr	120(ra) # 80002304 <userinit>
    80002294:	0ff0000f          	fence
    80002298:	00100793          	li	a5,1
    8000229c:	00003517          	auipc	a0,0x3
    800022a0:	f7450513          	addi	a0,a0,-140 # 80005210 <_ZZ12printIntegermE6digits+0x1f0>
    800022a4:	00f4a023          	sw	a5,0(s1)
    800022a8:	00001097          	auipc	ra,0x1
    800022ac:	a40080e7          	jalr	-1472(ra) # 80002ce8 <__printf>
    800022b0:	0000006f          	j	800022b0 <system_main+0xd4>

00000000800022b4 <cpuid>:
    800022b4:	ff010113          	addi	sp,sp,-16
    800022b8:	00813423          	sd	s0,8(sp)
    800022bc:	01010413          	addi	s0,sp,16
    800022c0:	00020513          	mv	a0,tp
    800022c4:	00813403          	ld	s0,8(sp)
    800022c8:	0005051b          	sext.w	a0,a0
    800022cc:	01010113          	addi	sp,sp,16
    800022d0:	00008067          	ret

00000000800022d4 <mycpu>:
    800022d4:	ff010113          	addi	sp,sp,-16
    800022d8:	00813423          	sd	s0,8(sp)
    800022dc:	01010413          	addi	s0,sp,16
    800022e0:	00020793          	mv	a5,tp
    800022e4:	00813403          	ld	s0,8(sp)
    800022e8:	0007879b          	sext.w	a5,a5
    800022ec:	00779793          	slli	a5,a5,0x7
    800022f0:	00004517          	auipc	a0,0x4
    800022f4:	76050513          	addi	a0,a0,1888 # 80006a50 <cpus>
    800022f8:	00f50533          	add	a0,a0,a5
    800022fc:	01010113          	addi	sp,sp,16
    80002300:	00008067          	ret

0000000080002304 <userinit>:
    80002304:	ff010113          	addi	sp,sp,-16
    80002308:	00813423          	sd	s0,8(sp)
    8000230c:	01010413          	addi	s0,sp,16
    80002310:	00813403          	ld	s0,8(sp)
    80002314:	01010113          	addi	sp,sp,16
    80002318:	fffff317          	auipc	t1,0xfffff
    8000231c:	25c30067          	jr	604(t1) # 80001574 <main>

0000000080002320 <either_copyout>:
    80002320:	ff010113          	addi	sp,sp,-16
    80002324:	00813023          	sd	s0,0(sp)
    80002328:	00113423          	sd	ra,8(sp)
    8000232c:	01010413          	addi	s0,sp,16
    80002330:	02051663          	bnez	a0,8000235c <either_copyout+0x3c>
    80002334:	00058513          	mv	a0,a1
    80002338:	00060593          	mv	a1,a2
    8000233c:	0006861b          	sext.w	a2,a3
    80002340:	00002097          	auipc	ra,0x2
    80002344:	c54080e7          	jalr	-940(ra) # 80003f94 <__memmove>
    80002348:	00813083          	ld	ra,8(sp)
    8000234c:	00013403          	ld	s0,0(sp)
    80002350:	00000513          	li	a0,0
    80002354:	01010113          	addi	sp,sp,16
    80002358:	00008067          	ret
    8000235c:	00003517          	auipc	a0,0x3
    80002360:	ef450513          	addi	a0,a0,-268 # 80005250 <_ZZ12printIntegermE6digits+0x230>
    80002364:	00001097          	auipc	ra,0x1
    80002368:	928080e7          	jalr	-1752(ra) # 80002c8c <panic>

000000008000236c <either_copyin>:
    8000236c:	ff010113          	addi	sp,sp,-16
    80002370:	00813023          	sd	s0,0(sp)
    80002374:	00113423          	sd	ra,8(sp)
    80002378:	01010413          	addi	s0,sp,16
    8000237c:	02059463          	bnez	a1,800023a4 <either_copyin+0x38>
    80002380:	00060593          	mv	a1,a2
    80002384:	0006861b          	sext.w	a2,a3
    80002388:	00002097          	auipc	ra,0x2
    8000238c:	c0c080e7          	jalr	-1012(ra) # 80003f94 <__memmove>
    80002390:	00813083          	ld	ra,8(sp)
    80002394:	00013403          	ld	s0,0(sp)
    80002398:	00000513          	li	a0,0
    8000239c:	01010113          	addi	sp,sp,16
    800023a0:	00008067          	ret
    800023a4:	00003517          	auipc	a0,0x3
    800023a8:	ed450513          	addi	a0,a0,-300 # 80005278 <_ZZ12printIntegermE6digits+0x258>
    800023ac:	00001097          	auipc	ra,0x1
    800023b0:	8e0080e7          	jalr	-1824(ra) # 80002c8c <panic>

00000000800023b4 <trapinit>:
    800023b4:	ff010113          	addi	sp,sp,-16
    800023b8:	00813423          	sd	s0,8(sp)
    800023bc:	01010413          	addi	s0,sp,16
    800023c0:	00813403          	ld	s0,8(sp)
    800023c4:	00003597          	auipc	a1,0x3
    800023c8:	edc58593          	addi	a1,a1,-292 # 800052a0 <_ZZ12printIntegermE6digits+0x280>
    800023cc:	00004517          	auipc	a0,0x4
    800023d0:	70450513          	addi	a0,a0,1796 # 80006ad0 <tickslock>
    800023d4:	01010113          	addi	sp,sp,16
    800023d8:	00001317          	auipc	t1,0x1
    800023dc:	5c030067          	jr	1472(t1) # 80003998 <initlock>

00000000800023e0 <trapinithart>:
    800023e0:	ff010113          	addi	sp,sp,-16
    800023e4:	00813423          	sd	s0,8(sp)
    800023e8:	01010413          	addi	s0,sp,16
    800023ec:	00000797          	auipc	a5,0x0
    800023f0:	2f478793          	addi	a5,a5,756 # 800026e0 <kernelvec>
    800023f4:	10579073          	csrw	stvec,a5
    800023f8:	00813403          	ld	s0,8(sp)
    800023fc:	01010113          	addi	sp,sp,16
    80002400:	00008067          	ret

0000000080002404 <usertrap>:
    80002404:	ff010113          	addi	sp,sp,-16
    80002408:	00813423          	sd	s0,8(sp)
    8000240c:	01010413          	addi	s0,sp,16
    80002410:	00813403          	ld	s0,8(sp)
    80002414:	01010113          	addi	sp,sp,16
    80002418:	00008067          	ret

000000008000241c <usertrapret>:
    8000241c:	ff010113          	addi	sp,sp,-16
    80002420:	00813423          	sd	s0,8(sp)
    80002424:	01010413          	addi	s0,sp,16
    80002428:	00813403          	ld	s0,8(sp)
    8000242c:	01010113          	addi	sp,sp,16
    80002430:	00008067          	ret

0000000080002434 <kerneltrap>:
    80002434:	fe010113          	addi	sp,sp,-32
    80002438:	00813823          	sd	s0,16(sp)
    8000243c:	00113c23          	sd	ra,24(sp)
    80002440:	00913423          	sd	s1,8(sp)
    80002444:	02010413          	addi	s0,sp,32
    80002448:	142025f3          	csrr	a1,scause
    8000244c:	100027f3          	csrr	a5,sstatus
    80002450:	0027f793          	andi	a5,a5,2
    80002454:	10079c63          	bnez	a5,8000256c <kerneltrap+0x138>
    80002458:	142027f3          	csrr	a5,scause
    8000245c:	0207ce63          	bltz	a5,80002498 <kerneltrap+0x64>
    80002460:	00003517          	auipc	a0,0x3
    80002464:	e8850513          	addi	a0,a0,-376 # 800052e8 <_ZZ12printIntegermE6digits+0x2c8>
    80002468:	00001097          	auipc	ra,0x1
    8000246c:	880080e7          	jalr	-1920(ra) # 80002ce8 <__printf>
    80002470:	141025f3          	csrr	a1,sepc
    80002474:	14302673          	csrr	a2,stval
    80002478:	00003517          	auipc	a0,0x3
    8000247c:	e8050513          	addi	a0,a0,-384 # 800052f8 <_ZZ12printIntegermE6digits+0x2d8>
    80002480:	00001097          	auipc	ra,0x1
    80002484:	868080e7          	jalr	-1944(ra) # 80002ce8 <__printf>
    80002488:	00003517          	auipc	a0,0x3
    8000248c:	e8850513          	addi	a0,a0,-376 # 80005310 <_ZZ12printIntegermE6digits+0x2f0>
    80002490:	00000097          	auipc	ra,0x0
    80002494:	7fc080e7          	jalr	2044(ra) # 80002c8c <panic>
    80002498:	0ff7f713          	andi	a4,a5,255
    8000249c:	00900693          	li	a3,9
    800024a0:	04d70063          	beq	a4,a3,800024e0 <kerneltrap+0xac>
    800024a4:	fff00713          	li	a4,-1
    800024a8:	03f71713          	slli	a4,a4,0x3f
    800024ac:	00170713          	addi	a4,a4,1
    800024b0:	fae798e3          	bne	a5,a4,80002460 <kerneltrap+0x2c>
    800024b4:	00000097          	auipc	ra,0x0
    800024b8:	e00080e7          	jalr	-512(ra) # 800022b4 <cpuid>
    800024bc:	06050663          	beqz	a0,80002528 <kerneltrap+0xf4>
    800024c0:	144027f3          	csrr	a5,sip
    800024c4:	ffd7f793          	andi	a5,a5,-3
    800024c8:	14479073          	csrw	sip,a5
    800024cc:	01813083          	ld	ra,24(sp)
    800024d0:	01013403          	ld	s0,16(sp)
    800024d4:	00813483          	ld	s1,8(sp)
    800024d8:	02010113          	addi	sp,sp,32
    800024dc:	00008067          	ret
    800024e0:	00000097          	auipc	ra,0x0
    800024e4:	3c4080e7          	jalr	964(ra) # 800028a4 <plic_claim>
    800024e8:	00a00793          	li	a5,10
    800024ec:	00050493          	mv	s1,a0
    800024f0:	06f50863          	beq	a0,a5,80002560 <kerneltrap+0x12c>
    800024f4:	fc050ce3          	beqz	a0,800024cc <kerneltrap+0x98>
    800024f8:	00050593          	mv	a1,a0
    800024fc:	00003517          	auipc	a0,0x3
    80002500:	dcc50513          	addi	a0,a0,-564 # 800052c8 <_ZZ12printIntegermE6digits+0x2a8>
    80002504:	00000097          	auipc	ra,0x0
    80002508:	7e4080e7          	jalr	2020(ra) # 80002ce8 <__printf>
    8000250c:	01013403          	ld	s0,16(sp)
    80002510:	01813083          	ld	ra,24(sp)
    80002514:	00048513          	mv	a0,s1
    80002518:	00813483          	ld	s1,8(sp)
    8000251c:	02010113          	addi	sp,sp,32
    80002520:	00000317          	auipc	t1,0x0
    80002524:	3bc30067          	jr	956(t1) # 800028dc <plic_complete>
    80002528:	00004517          	auipc	a0,0x4
    8000252c:	5a850513          	addi	a0,a0,1448 # 80006ad0 <tickslock>
    80002530:	00001097          	auipc	ra,0x1
    80002534:	48c080e7          	jalr	1164(ra) # 800039bc <acquire>
    80002538:	00003717          	auipc	a4,0x3
    8000253c:	48c70713          	addi	a4,a4,1164 # 800059c4 <ticks>
    80002540:	00072783          	lw	a5,0(a4)
    80002544:	00004517          	auipc	a0,0x4
    80002548:	58c50513          	addi	a0,a0,1420 # 80006ad0 <tickslock>
    8000254c:	0017879b          	addiw	a5,a5,1
    80002550:	00f72023          	sw	a5,0(a4)
    80002554:	00001097          	auipc	ra,0x1
    80002558:	534080e7          	jalr	1332(ra) # 80003a88 <release>
    8000255c:	f65ff06f          	j	800024c0 <kerneltrap+0x8c>
    80002560:	00001097          	auipc	ra,0x1
    80002564:	090080e7          	jalr	144(ra) # 800035f0 <uartintr>
    80002568:	fa5ff06f          	j	8000250c <kerneltrap+0xd8>
    8000256c:	00003517          	auipc	a0,0x3
    80002570:	d3c50513          	addi	a0,a0,-708 # 800052a8 <_ZZ12printIntegermE6digits+0x288>
    80002574:	00000097          	auipc	ra,0x0
    80002578:	718080e7          	jalr	1816(ra) # 80002c8c <panic>

000000008000257c <clockintr>:
    8000257c:	fe010113          	addi	sp,sp,-32
    80002580:	00813823          	sd	s0,16(sp)
    80002584:	00913423          	sd	s1,8(sp)
    80002588:	00113c23          	sd	ra,24(sp)
    8000258c:	02010413          	addi	s0,sp,32
    80002590:	00004497          	auipc	s1,0x4
    80002594:	54048493          	addi	s1,s1,1344 # 80006ad0 <tickslock>
    80002598:	00048513          	mv	a0,s1
    8000259c:	00001097          	auipc	ra,0x1
    800025a0:	420080e7          	jalr	1056(ra) # 800039bc <acquire>
    800025a4:	00003717          	auipc	a4,0x3
    800025a8:	42070713          	addi	a4,a4,1056 # 800059c4 <ticks>
    800025ac:	00072783          	lw	a5,0(a4)
    800025b0:	01013403          	ld	s0,16(sp)
    800025b4:	01813083          	ld	ra,24(sp)
    800025b8:	00048513          	mv	a0,s1
    800025bc:	0017879b          	addiw	a5,a5,1
    800025c0:	00813483          	ld	s1,8(sp)
    800025c4:	00f72023          	sw	a5,0(a4)
    800025c8:	02010113          	addi	sp,sp,32
    800025cc:	00001317          	auipc	t1,0x1
    800025d0:	4bc30067          	jr	1212(t1) # 80003a88 <release>

00000000800025d4 <devintr>:
    800025d4:	142027f3          	csrr	a5,scause
    800025d8:	00000513          	li	a0,0
    800025dc:	0007c463          	bltz	a5,800025e4 <devintr+0x10>
    800025e0:	00008067          	ret
    800025e4:	fe010113          	addi	sp,sp,-32
    800025e8:	00813823          	sd	s0,16(sp)
    800025ec:	00113c23          	sd	ra,24(sp)
    800025f0:	00913423          	sd	s1,8(sp)
    800025f4:	02010413          	addi	s0,sp,32
    800025f8:	0ff7f713          	andi	a4,a5,255
    800025fc:	00900693          	li	a3,9
    80002600:	04d70c63          	beq	a4,a3,80002658 <devintr+0x84>
    80002604:	fff00713          	li	a4,-1
    80002608:	03f71713          	slli	a4,a4,0x3f
    8000260c:	00170713          	addi	a4,a4,1
    80002610:	00e78c63          	beq	a5,a4,80002628 <devintr+0x54>
    80002614:	01813083          	ld	ra,24(sp)
    80002618:	01013403          	ld	s0,16(sp)
    8000261c:	00813483          	ld	s1,8(sp)
    80002620:	02010113          	addi	sp,sp,32
    80002624:	00008067          	ret
    80002628:	00000097          	auipc	ra,0x0
    8000262c:	c8c080e7          	jalr	-884(ra) # 800022b4 <cpuid>
    80002630:	06050663          	beqz	a0,8000269c <devintr+0xc8>
    80002634:	144027f3          	csrr	a5,sip
    80002638:	ffd7f793          	andi	a5,a5,-3
    8000263c:	14479073          	csrw	sip,a5
    80002640:	01813083          	ld	ra,24(sp)
    80002644:	01013403          	ld	s0,16(sp)
    80002648:	00813483          	ld	s1,8(sp)
    8000264c:	00200513          	li	a0,2
    80002650:	02010113          	addi	sp,sp,32
    80002654:	00008067          	ret
    80002658:	00000097          	auipc	ra,0x0
    8000265c:	24c080e7          	jalr	588(ra) # 800028a4 <plic_claim>
    80002660:	00a00793          	li	a5,10
    80002664:	00050493          	mv	s1,a0
    80002668:	06f50663          	beq	a0,a5,800026d4 <devintr+0x100>
    8000266c:	00100513          	li	a0,1
    80002670:	fa0482e3          	beqz	s1,80002614 <devintr+0x40>
    80002674:	00048593          	mv	a1,s1
    80002678:	00003517          	auipc	a0,0x3
    8000267c:	c5050513          	addi	a0,a0,-944 # 800052c8 <_ZZ12printIntegermE6digits+0x2a8>
    80002680:	00000097          	auipc	ra,0x0
    80002684:	668080e7          	jalr	1640(ra) # 80002ce8 <__printf>
    80002688:	00048513          	mv	a0,s1
    8000268c:	00000097          	auipc	ra,0x0
    80002690:	250080e7          	jalr	592(ra) # 800028dc <plic_complete>
    80002694:	00100513          	li	a0,1
    80002698:	f7dff06f          	j	80002614 <devintr+0x40>
    8000269c:	00004517          	auipc	a0,0x4
    800026a0:	43450513          	addi	a0,a0,1076 # 80006ad0 <tickslock>
    800026a4:	00001097          	auipc	ra,0x1
    800026a8:	318080e7          	jalr	792(ra) # 800039bc <acquire>
    800026ac:	00003717          	auipc	a4,0x3
    800026b0:	31870713          	addi	a4,a4,792 # 800059c4 <ticks>
    800026b4:	00072783          	lw	a5,0(a4)
    800026b8:	00004517          	auipc	a0,0x4
    800026bc:	41850513          	addi	a0,a0,1048 # 80006ad0 <tickslock>
    800026c0:	0017879b          	addiw	a5,a5,1
    800026c4:	00f72023          	sw	a5,0(a4)
    800026c8:	00001097          	auipc	ra,0x1
    800026cc:	3c0080e7          	jalr	960(ra) # 80003a88 <release>
    800026d0:	f65ff06f          	j	80002634 <devintr+0x60>
    800026d4:	00001097          	auipc	ra,0x1
    800026d8:	f1c080e7          	jalr	-228(ra) # 800035f0 <uartintr>
    800026dc:	fadff06f          	j	80002688 <devintr+0xb4>

00000000800026e0 <kernelvec>:
    800026e0:	f0010113          	addi	sp,sp,-256
    800026e4:	00113023          	sd	ra,0(sp)
    800026e8:	00213423          	sd	sp,8(sp)
    800026ec:	00313823          	sd	gp,16(sp)
    800026f0:	00413c23          	sd	tp,24(sp)
    800026f4:	02513023          	sd	t0,32(sp)
    800026f8:	02613423          	sd	t1,40(sp)
    800026fc:	02713823          	sd	t2,48(sp)
    80002700:	02813c23          	sd	s0,56(sp)
    80002704:	04913023          	sd	s1,64(sp)
    80002708:	04a13423          	sd	a0,72(sp)
    8000270c:	04b13823          	sd	a1,80(sp)
    80002710:	04c13c23          	sd	a2,88(sp)
    80002714:	06d13023          	sd	a3,96(sp)
    80002718:	06e13423          	sd	a4,104(sp)
    8000271c:	06f13823          	sd	a5,112(sp)
    80002720:	07013c23          	sd	a6,120(sp)
    80002724:	09113023          	sd	a7,128(sp)
    80002728:	09213423          	sd	s2,136(sp)
    8000272c:	09313823          	sd	s3,144(sp)
    80002730:	09413c23          	sd	s4,152(sp)
    80002734:	0b513023          	sd	s5,160(sp)
    80002738:	0b613423          	sd	s6,168(sp)
    8000273c:	0b713823          	sd	s7,176(sp)
    80002740:	0b813c23          	sd	s8,184(sp)
    80002744:	0d913023          	sd	s9,192(sp)
    80002748:	0da13423          	sd	s10,200(sp)
    8000274c:	0db13823          	sd	s11,208(sp)
    80002750:	0dc13c23          	sd	t3,216(sp)
    80002754:	0fd13023          	sd	t4,224(sp)
    80002758:	0fe13423          	sd	t5,232(sp)
    8000275c:	0ff13823          	sd	t6,240(sp)
    80002760:	cd5ff0ef          	jal	ra,80002434 <kerneltrap>
    80002764:	00013083          	ld	ra,0(sp)
    80002768:	00813103          	ld	sp,8(sp)
    8000276c:	01013183          	ld	gp,16(sp)
    80002770:	02013283          	ld	t0,32(sp)
    80002774:	02813303          	ld	t1,40(sp)
    80002778:	03013383          	ld	t2,48(sp)
    8000277c:	03813403          	ld	s0,56(sp)
    80002780:	04013483          	ld	s1,64(sp)
    80002784:	04813503          	ld	a0,72(sp)
    80002788:	05013583          	ld	a1,80(sp)
    8000278c:	05813603          	ld	a2,88(sp)
    80002790:	06013683          	ld	a3,96(sp)
    80002794:	06813703          	ld	a4,104(sp)
    80002798:	07013783          	ld	a5,112(sp)
    8000279c:	07813803          	ld	a6,120(sp)
    800027a0:	08013883          	ld	a7,128(sp)
    800027a4:	08813903          	ld	s2,136(sp)
    800027a8:	09013983          	ld	s3,144(sp)
    800027ac:	09813a03          	ld	s4,152(sp)
    800027b0:	0a013a83          	ld	s5,160(sp)
    800027b4:	0a813b03          	ld	s6,168(sp)
    800027b8:	0b013b83          	ld	s7,176(sp)
    800027bc:	0b813c03          	ld	s8,184(sp)
    800027c0:	0c013c83          	ld	s9,192(sp)
    800027c4:	0c813d03          	ld	s10,200(sp)
    800027c8:	0d013d83          	ld	s11,208(sp)
    800027cc:	0d813e03          	ld	t3,216(sp)
    800027d0:	0e013e83          	ld	t4,224(sp)
    800027d4:	0e813f03          	ld	t5,232(sp)
    800027d8:	0f013f83          	ld	t6,240(sp)
    800027dc:	10010113          	addi	sp,sp,256
    800027e0:	10200073          	sret
    800027e4:	00000013          	nop
    800027e8:	00000013          	nop
    800027ec:	00000013          	nop

00000000800027f0 <timervec>:
    800027f0:	34051573          	csrrw	a0,mscratch,a0
    800027f4:	00b53023          	sd	a1,0(a0)
    800027f8:	00c53423          	sd	a2,8(a0)
    800027fc:	00d53823          	sd	a3,16(a0)
    80002800:	01853583          	ld	a1,24(a0)
    80002804:	02053603          	ld	a2,32(a0)
    80002808:	0005b683          	ld	a3,0(a1)
    8000280c:	00c686b3          	add	a3,a3,a2
    80002810:	00d5b023          	sd	a3,0(a1)
    80002814:	00200593          	li	a1,2
    80002818:	14459073          	csrw	sip,a1
    8000281c:	01053683          	ld	a3,16(a0)
    80002820:	00853603          	ld	a2,8(a0)
    80002824:	00053583          	ld	a1,0(a0)
    80002828:	34051573          	csrrw	a0,mscratch,a0
    8000282c:	30200073          	mret

0000000080002830 <plicinit>:
    80002830:	ff010113          	addi	sp,sp,-16
    80002834:	00813423          	sd	s0,8(sp)
    80002838:	01010413          	addi	s0,sp,16
    8000283c:	00813403          	ld	s0,8(sp)
    80002840:	0c0007b7          	lui	a5,0xc000
    80002844:	00100713          	li	a4,1
    80002848:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000284c:	00e7a223          	sw	a4,4(a5)
    80002850:	01010113          	addi	sp,sp,16
    80002854:	00008067          	ret

0000000080002858 <plicinithart>:
    80002858:	ff010113          	addi	sp,sp,-16
    8000285c:	00813023          	sd	s0,0(sp)
    80002860:	00113423          	sd	ra,8(sp)
    80002864:	01010413          	addi	s0,sp,16
    80002868:	00000097          	auipc	ra,0x0
    8000286c:	a4c080e7          	jalr	-1460(ra) # 800022b4 <cpuid>
    80002870:	0085171b          	slliw	a4,a0,0x8
    80002874:	0c0027b7          	lui	a5,0xc002
    80002878:	00e787b3          	add	a5,a5,a4
    8000287c:	40200713          	li	a4,1026
    80002880:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80002884:	00813083          	ld	ra,8(sp)
    80002888:	00013403          	ld	s0,0(sp)
    8000288c:	00d5151b          	slliw	a0,a0,0xd
    80002890:	0c2017b7          	lui	a5,0xc201
    80002894:	00a78533          	add	a0,a5,a0
    80002898:	00052023          	sw	zero,0(a0)
    8000289c:	01010113          	addi	sp,sp,16
    800028a0:	00008067          	ret

00000000800028a4 <plic_claim>:
    800028a4:	ff010113          	addi	sp,sp,-16
    800028a8:	00813023          	sd	s0,0(sp)
    800028ac:	00113423          	sd	ra,8(sp)
    800028b0:	01010413          	addi	s0,sp,16
    800028b4:	00000097          	auipc	ra,0x0
    800028b8:	a00080e7          	jalr	-1536(ra) # 800022b4 <cpuid>
    800028bc:	00813083          	ld	ra,8(sp)
    800028c0:	00013403          	ld	s0,0(sp)
    800028c4:	00d5151b          	slliw	a0,a0,0xd
    800028c8:	0c2017b7          	lui	a5,0xc201
    800028cc:	00a78533          	add	a0,a5,a0
    800028d0:	00452503          	lw	a0,4(a0)
    800028d4:	01010113          	addi	sp,sp,16
    800028d8:	00008067          	ret

00000000800028dc <plic_complete>:
    800028dc:	fe010113          	addi	sp,sp,-32
    800028e0:	00813823          	sd	s0,16(sp)
    800028e4:	00913423          	sd	s1,8(sp)
    800028e8:	00113c23          	sd	ra,24(sp)
    800028ec:	02010413          	addi	s0,sp,32
    800028f0:	00050493          	mv	s1,a0
    800028f4:	00000097          	auipc	ra,0x0
    800028f8:	9c0080e7          	jalr	-1600(ra) # 800022b4 <cpuid>
    800028fc:	01813083          	ld	ra,24(sp)
    80002900:	01013403          	ld	s0,16(sp)
    80002904:	00d5179b          	slliw	a5,a0,0xd
    80002908:	0c201737          	lui	a4,0xc201
    8000290c:	00f707b3          	add	a5,a4,a5
    80002910:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80002914:	00813483          	ld	s1,8(sp)
    80002918:	02010113          	addi	sp,sp,32
    8000291c:	00008067          	ret

0000000080002920 <consolewrite>:
    80002920:	fb010113          	addi	sp,sp,-80
    80002924:	04813023          	sd	s0,64(sp)
    80002928:	04113423          	sd	ra,72(sp)
    8000292c:	02913c23          	sd	s1,56(sp)
    80002930:	03213823          	sd	s2,48(sp)
    80002934:	03313423          	sd	s3,40(sp)
    80002938:	03413023          	sd	s4,32(sp)
    8000293c:	01513c23          	sd	s5,24(sp)
    80002940:	05010413          	addi	s0,sp,80
    80002944:	06c05c63          	blez	a2,800029bc <consolewrite+0x9c>
    80002948:	00060993          	mv	s3,a2
    8000294c:	00050a13          	mv	s4,a0
    80002950:	00058493          	mv	s1,a1
    80002954:	00000913          	li	s2,0
    80002958:	fff00a93          	li	s5,-1
    8000295c:	01c0006f          	j	80002978 <consolewrite+0x58>
    80002960:	fbf44503          	lbu	a0,-65(s0)
    80002964:	0019091b          	addiw	s2,s2,1
    80002968:	00148493          	addi	s1,s1,1
    8000296c:	00001097          	auipc	ra,0x1
    80002970:	a9c080e7          	jalr	-1380(ra) # 80003408 <uartputc>
    80002974:	03298063          	beq	s3,s2,80002994 <consolewrite+0x74>
    80002978:	00048613          	mv	a2,s1
    8000297c:	00100693          	li	a3,1
    80002980:	000a0593          	mv	a1,s4
    80002984:	fbf40513          	addi	a0,s0,-65
    80002988:	00000097          	auipc	ra,0x0
    8000298c:	9e4080e7          	jalr	-1564(ra) # 8000236c <either_copyin>
    80002990:	fd5518e3          	bne	a0,s5,80002960 <consolewrite+0x40>
    80002994:	04813083          	ld	ra,72(sp)
    80002998:	04013403          	ld	s0,64(sp)
    8000299c:	03813483          	ld	s1,56(sp)
    800029a0:	02813983          	ld	s3,40(sp)
    800029a4:	02013a03          	ld	s4,32(sp)
    800029a8:	01813a83          	ld	s5,24(sp)
    800029ac:	00090513          	mv	a0,s2
    800029b0:	03013903          	ld	s2,48(sp)
    800029b4:	05010113          	addi	sp,sp,80
    800029b8:	00008067          	ret
    800029bc:	00000913          	li	s2,0
    800029c0:	fd5ff06f          	j	80002994 <consolewrite+0x74>

00000000800029c4 <consoleread>:
    800029c4:	f9010113          	addi	sp,sp,-112
    800029c8:	06813023          	sd	s0,96(sp)
    800029cc:	04913c23          	sd	s1,88(sp)
    800029d0:	05213823          	sd	s2,80(sp)
    800029d4:	05313423          	sd	s3,72(sp)
    800029d8:	05413023          	sd	s4,64(sp)
    800029dc:	03513c23          	sd	s5,56(sp)
    800029e0:	03613823          	sd	s6,48(sp)
    800029e4:	03713423          	sd	s7,40(sp)
    800029e8:	03813023          	sd	s8,32(sp)
    800029ec:	06113423          	sd	ra,104(sp)
    800029f0:	01913c23          	sd	s9,24(sp)
    800029f4:	07010413          	addi	s0,sp,112
    800029f8:	00060b93          	mv	s7,a2
    800029fc:	00050913          	mv	s2,a0
    80002a00:	00058c13          	mv	s8,a1
    80002a04:	00060b1b          	sext.w	s6,a2
    80002a08:	00004497          	auipc	s1,0x4
    80002a0c:	0f048493          	addi	s1,s1,240 # 80006af8 <cons>
    80002a10:	00400993          	li	s3,4
    80002a14:	fff00a13          	li	s4,-1
    80002a18:	00a00a93          	li	s5,10
    80002a1c:	05705e63          	blez	s7,80002a78 <consoleread+0xb4>
    80002a20:	09c4a703          	lw	a4,156(s1)
    80002a24:	0984a783          	lw	a5,152(s1)
    80002a28:	0007071b          	sext.w	a4,a4
    80002a2c:	08e78463          	beq	a5,a4,80002ab4 <consoleread+0xf0>
    80002a30:	07f7f713          	andi	a4,a5,127
    80002a34:	00e48733          	add	a4,s1,a4
    80002a38:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80002a3c:	0017869b          	addiw	a3,a5,1
    80002a40:	08d4ac23          	sw	a3,152(s1)
    80002a44:	00070c9b          	sext.w	s9,a4
    80002a48:	0b370663          	beq	a4,s3,80002af4 <consoleread+0x130>
    80002a4c:	00100693          	li	a3,1
    80002a50:	f9f40613          	addi	a2,s0,-97
    80002a54:	000c0593          	mv	a1,s8
    80002a58:	00090513          	mv	a0,s2
    80002a5c:	f8e40fa3          	sb	a4,-97(s0)
    80002a60:	00000097          	auipc	ra,0x0
    80002a64:	8c0080e7          	jalr	-1856(ra) # 80002320 <either_copyout>
    80002a68:	01450863          	beq	a0,s4,80002a78 <consoleread+0xb4>
    80002a6c:	001c0c13          	addi	s8,s8,1
    80002a70:	fffb8b9b          	addiw	s7,s7,-1
    80002a74:	fb5c94e3          	bne	s9,s5,80002a1c <consoleread+0x58>
    80002a78:	000b851b          	sext.w	a0,s7
    80002a7c:	06813083          	ld	ra,104(sp)
    80002a80:	06013403          	ld	s0,96(sp)
    80002a84:	05813483          	ld	s1,88(sp)
    80002a88:	05013903          	ld	s2,80(sp)
    80002a8c:	04813983          	ld	s3,72(sp)
    80002a90:	04013a03          	ld	s4,64(sp)
    80002a94:	03813a83          	ld	s5,56(sp)
    80002a98:	02813b83          	ld	s7,40(sp)
    80002a9c:	02013c03          	ld	s8,32(sp)
    80002aa0:	01813c83          	ld	s9,24(sp)
    80002aa4:	40ab053b          	subw	a0,s6,a0
    80002aa8:	03013b03          	ld	s6,48(sp)
    80002aac:	07010113          	addi	sp,sp,112
    80002ab0:	00008067          	ret
    80002ab4:	00001097          	auipc	ra,0x1
    80002ab8:	1d8080e7          	jalr	472(ra) # 80003c8c <push_on>
    80002abc:	0984a703          	lw	a4,152(s1)
    80002ac0:	09c4a783          	lw	a5,156(s1)
    80002ac4:	0007879b          	sext.w	a5,a5
    80002ac8:	fef70ce3          	beq	a4,a5,80002ac0 <consoleread+0xfc>
    80002acc:	00001097          	auipc	ra,0x1
    80002ad0:	234080e7          	jalr	564(ra) # 80003d00 <pop_on>
    80002ad4:	0984a783          	lw	a5,152(s1)
    80002ad8:	07f7f713          	andi	a4,a5,127
    80002adc:	00e48733          	add	a4,s1,a4
    80002ae0:	01874703          	lbu	a4,24(a4)
    80002ae4:	0017869b          	addiw	a3,a5,1
    80002ae8:	08d4ac23          	sw	a3,152(s1)
    80002aec:	00070c9b          	sext.w	s9,a4
    80002af0:	f5371ee3          	bne	a4,s3,80002a4c <consoleread+0x88>
    80002af4:	000b851b          	sext.w	a0,s7
    80002af8:	f96bf2e3          	bgeu	s7,s6,80002a7c <consoleread+0xb8>
    80002afc:	08f4ac23          	sw	a5,152(s1)
    80002b00:	f7dff06f          	j	80002a7c <consoleread+0xb8>

0000000080002b04 <consputc>:
    80002b04:	10000793          	li	a5,256
    80002b08:	00f50663          	beq	a0,a5,80002b14 <consputc+0x10>
    80002b0c:	00001317          	auipc	t1,0x1
    80002b10:	9f430067          	jr	-1548(t1) # 80003500 <uartputc_sync>
    80002b14:	ff010113          	addi	sp,sp,-16
    80002b18:	00113423          	sd	ra,8(sp)
    80002b1c:	00813023          	sd	s0,0(sp)
    80002b20:	01010413          	addi	s0,sp,16
    80002b24:	00800513          	li	a0,8
    80002b28:	00001097          	auipc	ra,0x1
    80002b2c:	9d8080e7          	jalr	-1576(ra) # 80003500 <uartputc_sync>
    80002b30:	02000513          	li	a0,32
    80002b34:	00001097          	auipc	ra,0x1
    80002b38:	9cc080e7          	jalr	-1588(ra) # 80003500 <uartputc_sync>
    80002b3c:	00013403          	ld	s0,0(sp)
    80002b40:	00813083          	ld	ra,8(sp)
    80002b44:	00800513          	li	a0,8
    80002b48:	01010113          	addi	sp,sp,16
    80002b4c:	00001317          	auipc	t1,0x1
    80002b50:	9b430067          	jr	-1612(t1) # 80003500 <uartputc_sync>

0000000080002b54 <consoleintr>:
    80002b54:	fe010113          	addi	sp,sp,-32
    80002b58:	00813823          	sd	s0,16(sp)
    80002b5c:	00913423          	sd	s1,8(sp)
    80002b60:	01213023          	sd	s2,0(sp)
    80002b64:	00113c23          	sd	ra,24(sp)
    80002b68:	02010413          	addi	s0,sp,32
    80002b6c:	00004917          	auipc	s2,0x4
    80002b70:	f8c90913          	addi	s2,s2,-116 # 80006af8 <cons>
    80002b74:	00050493          	mv	s1,a0
    80002b78:	00090513          	mv	a0,s2
    80002b7c:	00001097          	auipc	ra,0x1
    80002b80:	e40080e7          	jalr	-448(ra) # 800039bc <acquire>
    80002b84:	02048c63          	beqz	s1,80002bbc <consoleintr+0x68>
    80002b88:	0a092783          	lw	a5,160(s2)
    80002b8c:	09892703          	lw	a4,152(s2)
    80002b90:	07f00693          	li	a3,127
    80002b94:	40e7873b          	subw	a4,a5,a4
    80002b98:	02e6e263          	bltu	a3,a4,80002bbc <consoleintr+0x68>
    80002b9c:	00d00713          	li	a4,13
    80002ba0:	04e48063          	beq	s1,a4,80002be0 <consoleintr+0x8c>
    80002ba4:	07f7f713          	andi	a4,a5,127
    80002ba8:	00e90733          	add	a4,s2,a4
    80002bac:	0017879b          	addiw	a5,a5,1
    80002bb0:	0af92023          	sw	a5,160(s2)
    80002bb4:	00970c23          	sb	s1,24(a4)
    80002bb8:	08f92e23          	sw	a5,156(s2)
    80002bbc:	01013403          	ld	s0,16(sp)
    80002bc0:	01813083          	ld	ra,24(sp)
    80002bc4:	00813483          	ld	s1,8(sp)
    80002bc8:	00013903          	ld	s2,0(sp)
    80002bcc:	00004517          	auipc	a0,0x4
    80002bd0:	f2c50513          	addi	a0,a0,-212 # 80006af8 <cons>
    80002bd4:	02010113          	addi	sp,sp,32
    80002bd8:	00001317          	auipc	t1,0x1
    80002bdc:	eb030067          	jr	-336(t1) # 80003a88 <release>
    80002be0:	00a00493          	li	s1,10
    80002be4:	fc1ff06f          	j	80002ba4 <consoleintr+0x50>

0000000080002be8 <consoleinit>:
    80002be8:	fe010113          	addi	sp,sp,-32
    80002bec:	00113c23          	sd	ra,24(sp)
    80002bf0:	00813823          	sd	s0,16(sp)
    80002bf4:	00913423          	sd	s1,8(sp)
    80002bf8:	02010413          	addi	s0,sp,32
    80002bfc:	00004497          	auipc	s1,0x4
    80002c00:	efc48493          	addi	s1,s1,-260 # 80006af8 <cons>
    80002c04:	00048513          	mv	a0,s1
    80002c08:	00002597          	auipc	a1,0x2
    80002c0c:	71858593          	addi	a1,a1,1816 # 80005320 <_ZZ12printIntegermE6digits+0x300>
    80002c10:	00001097          	auipc	ra,0x1
    80002c14:	d88080e7          	jalr	-632(ra) # 80003998 <initlock>
    80002c18:	00000097          	auipc	ra,0x0
    80002c1c:	7ac080e7          	jalr	1964(ra) # 800033c4 <uartinit>
    80002c20:	01813083          	ld	ra,24(sp)
    80002c24:	01013403          	ld	s0,16(sp)
    80002c28:	00000797          	auipc	a5,0x0
    80002c2c:	d9c78793          	addi	a5,a5,-612 # 800029c4 <consoleread>
    80002c30:	0af4bc23          	sd	a5,184(s1)
    80002c34:	00000797          	auipc	a5,0x0
    80002c38:	cec78793          	addi	a5,a5,-788 # 80002920 <consolewrite>
    80002c3c:	0cf4b023          	sd	a5,192(s1)
    80002c40:	00813483          	ld	s1,8(sp)
    80002c44:	02010113          	addi	sp,sp,32
    80002c48:	00008067          	ret

0000000080002c4c <console_read>:
    80002c4c:	ff010113          	addi	sp,sp,-16
    80002c50:	00813423          	sd	s0,8(sp)
    80002c54:	01010413          	addi	s0,sp,16
    80002c58:	00813403          	ld	s0,8(sp)
    80002c5c:	00004317          	auipc	t1,0x4
    80002c60:	f5433303          	ld	t1,-172(t1) # 80006bb0 <devsw+0x10>
    80002c64:	01010113          	addi	sp,sp,16
    80002c68:	00030067          	jr	t1

0000000080002c6c <console_write>:
    80002c6c:	ff010113          	addi	sp,sp,-16
    80002c70:	00813423          	sd	s0,8(sp)
    80002c74:	01010413          	addi	s0,sp,16
    80002c78:	00813403          	ld	s0,8(sp)
    80002c7c:	00004317          	auipc	t1,0x4
    80002c80:	f3c33303          	ld	t1,-196(t1) # 80006bb8 <devsw+0x18>
    80002c84:	01010113          	addi	sp,sp,16
    80002c88:	00030067          	jr	t1

0000000080002c8c <panic>:
    80002c8c:	fe010113          	addi	sp,sp,-32
    80002c90:	00113c23          	sd	ra,24(sp)
    80002c94:	00813823          	sd	s0,16(sp)
    80002c98:	00913423          	sd	s1,8(sp)
    80002c9c:	02010413          	addi	s0,sp,32
    80002ca0:	00050493          	mv	s1,a0
    80002ca4:	00002517          	auipc	a0,0x2
    80002ca8:	68450513          	addi	a0,a0,1668 # 80005328 <_ZZ12printIntegermE6digits+0x308>
    80002cac:	00004797          	auipc	a5,0x4
    80002cb0:	fa07a623          	sw	zero,-84(a5) # 80006c58 <pr+0x18>
    80002cb4:	00000097          	auipc	ra,0x0
    80002cb8:	034080e7          	jalr	52(ra) # 80002ce8 <__printf>
    80002cbc:	00048513          	mv	a0,s1
    80002cc0:	00000097          	auipc	ra,0x0
    80002cc4:	028080e7          	jalr	40(ra) # 80002ce8 <__printf>
    80002cc8:	00002517          	auipc	a0,0x2
    80002ccc:	64050513          	addi	a0,a0,1600 # 80005308 <_ZZ12printIntegermE6digits+0x2e8>
    80002cd0:	00000097          	auipc	ra,0x0
    80002cd4:	018080e7          	jalr	24(ra) # 80002ce8 <__printf>
    80002cd8:	00100793          	li	a5,1
    80002cdc:	00003717          	auipc	a4,0x3
    80002ce0:	cef72623          	sw	a5,-788(a4) # 800059c8 <panicked>
    80002ce4:	0000006f          	j	80002ce4 <panic+0x58>

0000000080002ce8 <__printf>:
    80002ce8:	f3010113          	addi	sp,sp,-208
    80002cec:	08813023          	sd	s0,128(sp)
    80002cf0:	07313423          	sd	s3,104(sp)
    80002cf4:	09010413          	addi	s0,sp,144
    80002cf8:	05813023          	sd	s8,64(sp)
    80002cfc:	08113423          	sd	ra,136(sp)
    80002d00:	06913c23          	sd	s1,120(sp)
    80002d04:	07213823          	sd	s2,112(sp)
    80002d08:	07413023          	sd	s4,96(sp)
    80002d0c:	05513c23          	sd	s5,88(sp)
    80002d10:	05613823          	sd	s6,80(sp)
    80002d14:	05713423          	sd	s7,72(sp)
    80002d18:	03913c23          	sd	s9,56(sp)
    80002d1c:	03a13823          	sd	s10,48(sp)
    80002d20:	03b13423          	sd	s11,40(sp)
    80002d24:	00004317          	auipc	t1,0x4
    80002d28:	f1c30313          	addi	t1,t1,-228 # 80006c40 <pr>
    80002d2c:	01832c03          	lw	s8,24(t1)
    80002d30:	00b43423          	sd	a1,8(s0)
    80002d34:	00c43823          	sd	a2,16(s0)
    80002d38:	00d43c23          	sd	a3,24(s0)
    80002d3c:	02e43023          	sd	a4,32(s0)
    80002d40:	02f43423          	sd	a5,40(s0)
    80002d44:	03043823          	sd	a6,48(s0)
    80002d48:	03143c23          	sd	a7,56(s0)
    80002d4c:	00050993          	mv	s3,a0
    80002d50:	4a0c1663          	bnez	s8,800031fc <__printf+0x514>
    80002d54:	60098c63          	beqz	s3,8000336c <__printf+0x684>
    80002d58:	0009c503          	lbu	a0,0(s3)
    80002d5c:	00840793          	addi	a5,s0,8
    80002d60:	f6f43c23          	sd	a5,-136(s0)
    80002d64:	00000493          	li	s1,0
    80002d68:	22050063          	beqz	a0,80002f88 <__printf+0x2a0>
    80002d6c:	00002a37          	lui	s4,0x2
    80002d70:	00018ab7          	lui	s5,0x18
    80002d74:	000f4b37          	lui	s6,0xf4
    80002d78:	00989bb7          	lui	s7,0x989
    80002d7c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80002d80:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80002d84:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80002d88:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80002d8c:	00148c9b          	addiw	s9,s1,1
    80002d90:	02500793          	li	a5,37
    80002d94:	01998933          	add	s2,s3,s9
    80002d98:	38f51263          	bne	a0,a5,8000311c <__printf+0x434>
    80002d9c:	00094783          	lbu	a5,0(s2)
    80002da0:	00078c9b          	sext.w	s9,a5
    80002da4:	1e078263          	beqz	a5,80002f88 <__printf+0x2a0>
    80002da8:	0024849b          	addiw	s1,s1,2
    80002dac:	07000713          	li	a4,112
    80002db0:	00998933          	add	s2,s3,s1
    80002db4:	38e78a63          	beq	a5,a4,80003148 <__printf+0x460>
    80002db8:	20f76863          	bltu	a4,a5,80002fc8 <__printf+0x2e0>
    80002dbc:	42a78863          	beq	a5,a0,800031ec <__printf+0x504>
    80002dc0:	06400713          	li	a4,100
    80002dc4:	40e79663          	bne	a5,a4,800031d0 <__printf+0x4e8>
    80002dc8:	f7843783          	ld	a5,-136(s0)
    80002dcc:	0007a603          	lw	a2,0(a5)
    80002dd0:	00878793          	addi	a5,a5,8
    80002dd4:	f6f43c23          	sd	a5,-136(s0)
    80002dd8:	42064a63          	bltz	a2,8000320c <__printf+0x524>
    80002ddc:	00a00713          	li	a4,10
    80002de0:	02e677bb          	remuw	a5,a2,a4
    80002de4:	00002d97          	auipc	s11,0x2
    80002de8:	56cd8d93          	addi	s11,s11,1388 # 80005350 <digits>
    80002dec:	00900593          	li	a1,9
    80002df0:	0006051b          	sext.w	a0,a2
    80002df4:	00000c93          	li	s9,0
    80002df8:	02079793          	slli	a5,a5,0x20
    80002dfc:	0207d793          	srli	a5,a5,0x20
    80002e00:	00fd87b3          	add	a5,s11,a5
    80002e04:	0007c783          	lbu	a5,0(a5)
    80002e08:	02e656bb          	divuw	a3,a2,a4
    80002e0c:	f8f40023          	sb	a5,-128(s0)
    80002e10:	14c5d863          	bge	a1,a2,80002f60 <__printf+0x278>
    80002e14:	06300593          	li	a1,99
    80002e18:	00100c93          	li	s9,1
    80002e1c:	02e6f7bb          	remuw	a5,a3,a4
    80002e20:	02079793          	slli	a5,a5,0x20
    80002e24:	0207d793          	srli	a5,a5,0x20
    80002e28:	00fd87b3          	add	a5,s11,a5
    80002e2c:	0007c783          	lbu	a5,0(a5)
    80002e30:	02e6d73b          	divuw	a4,a3,a4
    80002e34:	f8f400a3          	sb	a5,-127(s0)
    80002e38:	12a5f463          	bgeu	a1,a0,80002f60 <__printf+0x278>
    80002e3c:	00a00693          	li	a3,10
    80002e40:	00900593          	li	a1,9
    80002e44:	02d777bb          	remuw	a5,a4,a3
    80002e48:	02079793          	slli	a5,a5,0x20
    80002e4c:	0207d793          	srli	a5,a5,0x20
    80002e50:	00fd87b3          	add	a5,s11,a5
    80002e54:	0007c503          	lbu	a0,0(a5)
    80002e58:	02d757bb          	divuw	a5,a4,a3
    80002e5c:	f8a40123          	sb	a0,-126(s0)
    80002e60:	48e5f263          	bgeu	a1,a4,800032e4 <__printf+0x5fc>
    80002e64:	06300513          	li	a0,99
    80002e68:	02d7f5bb          	remuw	a1,a5,a3
    80002e6c:	02059593          	slli	a1,a1,0x20
    80002e70:	0205d593          	srli	a1,a1,0x20
    80002e74:	00bd85b3          	add	a1,s11,a1
    80002e78:	0005c583          	lbu	a1,0(a1)
    80002e7c:	02d7d7bb          	divuw	a5,a5,a3
    80002e80:	f8b401a3          	sb	a1,-125(s0)
    80002e84:	48e57263          	bgeu	a0,a4,80003308 <__printf+0x620>
    80002e88:	3e700513          	li	a0,999
    80002e8c:	02d7f5bb          	remuw	a1,a5,a3
    80002e90:	02059593          	slli	a1,a1,0x20
    80002e94:	0205d593          	srli	a1,a1,0x20
    80002e98:	00bd85b3          	add	a1,s11,a1
    80002e9c:	0005c583          	lbu	a1,0(a1)
    80002ea0:	02d7d7bb          	divuw	a5,a5,a3
    80002ea4:	f8b40223          	sb	a1,-124(s0)
    80002ea8:	46e57663          	bgeu	a0,a4,80003314 <__printf+0x62c>
    80002eac:	02d7f5bb          	remuw	a1,a5,a3
    80002eb0:	02059593          	slli	a1,a1,0x20
    80002eb4:	0205d593          	srli	a1,a1,0x20
    80002eb8:	00bd85b3          	add	a1,s11,a1
    80002ebc:	0005c583          	lbu	a1,0(a1)
    80002ec0:	02d7d7bb          	divuw	a5,a5,a3
    80002ec4:	f8b402a3          	sb	a1,-123(s0)
    80002ec8:	46ea7863          	bgeu	s4,a4,80003338 <__printf+0x650>
    80002ecc:	02d7f5bb          	remuw	a1,a5,a3
    80002ed0:	02059593          	slli	a1,a1,0x20
    80002ed4:	0205d593          	srli	a1,a1,0x20
    80002ed8:	00bd85b3          	add	a1,s11,a1
    80002edc:	0005c583          	lbu	a1,0(a1)
    80002ee0:	02d7d7bb          	divuw	a5,a5,a3
    80002ee4:	f8b40323          	sb	a1,-122(s0)
    80002ee8:	3eeaf863          	bgeu	s5,a4,800032d8 <__printf+0x5f0>
    80002eec:	02d7f5bb          	remuw	a1,a5,a3
    80002ef0:	02059593          	slli	a1,a1,0x20
    80002ef4:	0205d593          	srli	a1,a1,0x20
    80002ef8:	00bd85b3          	add	a1,s11,a1
    80002efc:	0005c583          	lbu	a1,0(a1)
    80002f00:	02d7d7bb          	divuw	a5,a5,a3
    80002f04:	f8b403a3          	sb	a1,-121(s0)
    80002f08:	42eb7e63          	bgeu	s6,a4,80003344 <__printf+0x65c>
    80002f0c:	02d7f5bb          	remuw	a1,a5,a3
    80002f10:	02059593          	slli	a1,a1,0x20
    80002f14:	0205d593          	srli	a1,a1,0x20
    80002f18:	00bd85b3          	add	a1,s11,a1
    80002f1c:	0005c583          	lbu	a1,0(a1)
    80002f20:	02d7d7bb          	divuw	a5,a5,a3
    80002f24:	f8b40423          	sb	a1,-120(s0)
    80002f28:	42ebfc63          	bgeu	s7,a4,80003360 <__printf+0x678>
    80002f2c:	02079793          	slli	a5,a5,0x20
    80002f30:	0207d793          	srli	a5,a5,0x20
    80002f34:	00fd8db3          	add	s11,s11,a5
    80002f38:	000dc703          	lbu	a4,0(s11)
    80002f3c:	00a00793          	li	a5,10
    80002f40:	00900c93          	li	s9,9
    80002f44:	f8e404a3          	sb	a4,-119(s0)
    80002f48:	00065c63          	bgez	a2,80002f60 <__printf+0x278>
    80002f4c:	f9040713          	addi	a4,s0,-112
    80002f50:	00f70733          	add	a4,a4,a5
    80002f54:	02d00693          	li	a3,45
    80002f58:	fed70823          	sb	a3,-16(a4)
    80002f5c:	00078c93          	mv	s9,a5
    80002f60:	f8040793          	addi	a5,s0,-128
    80002f64:	01978cb3          	add	s9,a5,s9
    80002f68:	f7f40d13          	addi	s10,s0,-129
    80002f6c:	000cc503          	lbu	a0,0(s9)
    80002f70:	fffc8c93          	addi	s9,s9,-1
    80002f74:	00000097          	auipc	ra,0x0
    80002f78:	b90080e7          	jalr	-1136(ra) # 80002b04 <consputc>
    80002f7c:	ffac98e3          	bne	s9,s10,80002f6c <__printf+0x284>
    80002f80:	00094503          	lbu	a0,0(s2)
    80002f84:	e00514e3          	bnez	a0,80002d8c <__printf+0xa4>
    80002f88:	1a0c1663          	bnez	s8,80003134 <__printf+0x44c>
    80002f8c:	08813083          	ld	ra,136(sp)
    80002f90:	08013403          	ld	s0,128(sp)
    80002f94:	07813483          	ld	s1,120(sp)
    80002f98:	07013903          	ld	s2,112(sp)
    80002f9c:	06813983          	ld	s3,104(sp)
    80002fa0:	06013a03          	ld	s4,96(sp)
    80002fa4:	05813a83          	ld	s5,88(sp)
    80002fa8:	05013b03          	ld	s6,80(sp)
    80002fac:	04813b83          	ld	s7,72(sp)
    80002fb0:	04013c03          	ld	s8,64(sp)
    80002fb4:	03813c83          	ld	s9,56(sp)
    80002fb8:	03013d03          	ld	s10,48(sp)
    80002fbc:	02813d83          	ld	s11,40(sp)
    80002fc0:	0d010113          	addi	sp,sp,208
    80002fc4:	00008067          	ret
    80002fc8:	07300713          	li	a4,115
    80002fcc:	1ce78a63          	beq	a5,a4,800031a0 <__printf+0x4b8>
    80002fd0:	07800713          	li	a4,120
    80002fd4:	1ee79e63          	bne	a5,a4,800031d0 <__printf+0x4e8>
    80002fd8:	f7843783          	ld	a5,-136(s0)
    80002fdc:	0007a703          	lw	a4,0(a5)
    80002fe0:	00878793          	addi	a5,a5,8
    80002fe4:	f6f43c23          	sd	a5,-136(s0)
    80002fe8:	28074263          	bltz	a4,8000326c <__printf+0x584>
    80002fec:	00002d97          	auipc	s11,0x2
    80002ff0:	364d8d93          	addi	s11,s11,868 # 80005350 <digits>
    80002ff4:	00f77793          	andi	a5,a4,15
    80002ff8:	00fd87b3          	add	a5,s11,a5
    80002ffc:	0007c683          	lbu	a3,0(a5)
    80003000:	00f00613          	li	a2,15
    80003004:	0007079b          	sext.w	a5,a4
    80003008:	f8d40023          	sb	a3,-128(s0)
    8000300c:	0047559b          	srliw	a1,a4,0x4
    80003010:	0047569b          	srliw	a3,a4,0x4
    80003014:	00000c93          	li	s9,0
    80003018:	0ee65063          	bge	a2,a4,800030f8 <__printf+0x410>
    8000301c:	00f6f693          	andi	a3,a3,15
    80003020:	00dd86b3          	add	a3,s11,a3
    80003024:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80003028:	0087d79b          	srliw	a5,a5,0x8
    8000302c:	00100c93          	li	s9,1
    80003030:	f8d400a3          	sb	a3,-127(s0)
    80003034:	0cb67263          	bgeu	a2,a1,800030f8 <__printf+0x410>
    80003038:	00f7f693          	andi	a3,a5,15
    8000303c:	00dd86b3          	add	a3,s11,a3
    80003040:	0006c583          	lbu	a1,0(a3)
    80003044:	00f00613          	li	a2,15
    80003048:	0047d69b          	srliw	a3,a5,0x4
    8000304c:	f8b40123          	sb	a1,-126(s0)
    80003050:	0047d593          	srli	a1,a5,0x4
    80003054:	28f67e63          	bgeu	a2,a5,800032f0 <__printf+0x608>
    80003058:	00f6f693          	andi	a3,a3,15
    8000305c:	00dd86b3          	add	a3,s11,a3
    80003060:	0006c503          	lbu	a0,0(a3)
    80003064:	0087d813          	srli	a6,a5,0x8
    80003068:	0087d69b          	srliw	a3,a5,0x8
    8000306c:	f8a401a3          	sb	a0,-125(s0)
    80003070:	28b67663          	bgeu	a2,a1,800032fc <__printf+0x614>
    80003074:	00f6f693          	andi	a3,a3,15
    80003078:	00dd86b3          	add	a3,s11,a3
    8000307c:	0006c583          	lbu	a1,0(a3)
    80003080:	00c7d513          	srli	a0,a5,0xc
    80003084:	00c7d69b          	srliw	a3,a5,0xc
    80003088:	f8b40223          	sb	a1,-124(s0)
    8000308c:	29067a63          	bgeu	a2,a6,80003320 <__printf+0x638>
    80003090:	00f6f693          	andi	a3,a3,15
    80003094:	00dd86b3          	add	a3,s11,a3
    80003098:	0006c583          	lbu	a1,0(a3)
    8000309c:	0107d813          	srli	a6,a5,0x10
    800030a0:	0107d69b          	srliw	a3,a5,0x10
    800030a4:	f8b402a3          	sb	a1,-123(s0)
    800030a8:	28a67263          	bgeu	a2,a0,8000332c <__printf+0x644>
    800030ac:	00f6f693          	andi	a3,a3,15
    800030b0:	00dd86b3          	add	a3,s11,a3
    800030b4:	0006c683          	lbu	a3,0(a3)
    800030b8:	0147d79b          	srliw	a5,a5,0x14
    800030bc:	f8d40323          	sb	a3,-122(s0)
    800030c0:	21067663          	bgeu	a2,a6,800032cc <__printf+0x5e4>
    800030c4:	02079793          	slli	a5,a5,0x20
    800030c8:	0207d793          	srli	a5,a5,0x20
    800030cc:	00fd8db3          	add	s11,s11,a5
    800030d0:	000dc683          	lbu	a3,0(s11)
    800030d4:	00800793          	li	a5,8
    800030d8:	00700c93          	li	s9,7
    800030dc:	f8d403a3          	sb	a3,-121(s0)
    800030e0:	00075c63          	bgez	a4,800030f8 <__printf+0x410>
    800030e4:	f9040713          	addi	a4,s0,-112
    800030e8:	00f70733          	add	a4,a4,a5
    800030ec:	02d00693          	li	a3,45
    800030f0:	fed70823          	sb	a3,-16(a4)
    800030f4:	00078c93          	mv	s9,a5
    800030f8:	f8040793          	addi	a5,s0,-128
    800030fc:	01978cb3          	add	s9,a5,s9
    80003100:	f7f40d13          	addi	s10,s0,-129
    80003104:	000cc503          	lbu	a0,0(s9)
    80003108:	fffc8c93          	addi	s9,s9,-1
    8000310c:	00000097          	auipc	ra,0x0
    80003110:	9f8080e7          	jalr	-1544(ra) # 80002b04 <consputc>
    80003114:	ff9d18e3          	bne	s10,s9,80003104 <__printf+0x41c>
    80003118:	0100006f          	j	80003128 <__printf+0x440>
    8000311c:	00000097          	auipc	ra,0x0
    80003120:	9e8080e7          	jalr	-1560(ra) # 80002b04 <consputc>
    80003124:	000c8493          	mv	s1,s9
    80003128:	00094503          	lbu	a0,0(s2)
    8000312c:	c60510e3          	bnez	a0,80002d8c <__printf+0xa4>
    80003130:	e40c0ee3          	beqz	s8,80002f8c <__printf+0x2a4>
    80003134:	00004517          	auipc	a0,0x4
    80003138:	b0c50513          	addi	a0,a0,-1268 # 80006c40 <pr>
    8000313c:	00001097          	auipc	ra,0x1
    80003140:	94c080e7          	jalr	-1716(ra) # 80003a88 <release>
    80003144:	e49ff06f          	j	80002f8c <__printf+0x2a4>
    80003148:	f7843783          	ld	a5,-136(s0)
    8000314c:	03000513          	li	a0,48
    80003150:	01000d13          	li	s10,16
    80003154:	00878713          	addi	a4,a5,8
    80003158:	0007bc83          	ld	s9,0(a5)
    8000315c:	f6e43c23          	sd	a4,-136(s0)
    80003160:	00000097          	auipc	ra,0x0
    80003164:	9a4080e7          	jalr	-1628(ra) # 80002b04 <consputc>
    80003168:	07800513          	li	a0,120
    8000316c:	00000097          	auipc	ra,0x0
    80003170:	998080e7          	jalr	-1640(ra) # 80002b04 <consputc>
    80003174:	00002d97          	auipc	s11,0x2
    80003178:	1dcd8d93          	addi	s11,s11,476 # 80005350 <digits>
    8000317c:	03ccd793          	srli	a5,s9,0x3c
    80003180:	00fd87b3          	add	a5,s11,a5
    80003184:	0007c503          	lbu	a0,0(a5)
    80003188:	fffd0d1b          	addiw	s10,s10,-1
    8000318c:	004c9c93          	slli	s9,s9,0x4
    80003190:	00000097          	auipc	ra,0x0
    80003194:	974080e7          	jalr	-1676(ra) # 80002b04 <consputc>
    80003198:	fe0d12e3          	bnez	s10,8000317c <__printf+0x494>
    8000319c:	f8dff06f          	j	80003128 <__printf+0x440>
    800031a0:	f7843783          	ld	a5,-136(s0)
    800031a4:	0007bc83          	ld	s9,0(a5)
    800031a8:	00878793          	addi	a5,a5,8
    800031ac:	f6f43c23          	sd	a5,-136(s0)
    800031b0:	000c9a63          	bnez	s9,800031c4 <__printf+0x4dc>
    800031b4:	1080006f          	j	800032bc <__printf+0x5d4>
    800031b8:	001c8c93          	addi	s9,s9,1
    800031bc:	00000097          	auipc	ra,0x0
    800031c0:	948080e7          	jalr	-1720(ra) # 80002b04 <consputc>
    800031c4:	000cc503          	lbu	a0,0(s9)
    800031c8:	fe0518e3          	bnez	a0,800031b8 <__printf+0x4d0>
    800031cc:	f5dff06f          	j	80003128 <__printf+0x440>
    800031d0:	02500513          	li	a0,37
    800031d4:	00000097          	auipc	ra,0x0
    800031d8:	930080e7          	jalr	-1744(ra) # 80002b04 <consputc>
    800031dc:	000c8513          	mv	a0,s9
    800031e0:	00000097          	auipc	ra,0x0
    800031e4:	924080e7          	jalr	-1756(ra) # 80002b04 <consputc>
    800031e8:	f41ff06f          	j	80003128 <__printf+0x440>
    800031ec:	02500513          	li	a0,37
    800031f0:	00000097          	auipc	ra,0x0
    800031f4:	914080e7          	jalr	-1772(ra) # 80002b04 <consputc>
    800031f8:	f31ff06f          	j	80003128 <__printf+0x440>
    800031fc:	00030513          	mv	a0,t1
    80003200:	00000097          	auipc	ra,0x0
    80003204:	7bc080e7          	jalr	1980(ra) # 800039bc <acquire>
    80003208:	b4dff06f          	j	80002d54 <__printf+0x6c>
    8000320c:	40c0053b          	negw	a0,a2
    80003210:	00a00713          	li	a4,10
    80003214:	02e576bb          	remuw	a3,a0,a4
    80003218:	00002d97          	auipc	s11,0x2
    8000321c:	138d8d93          	addi	s11,s11,312 # 80005350 <digits>
    80003220:	ff700593          	li	a1,-9
    80003224:	02069693          	slli	a3,a3,0x20
    80003228:	0206d693          	srli	a3,a3,0x20
    8000322c:	00dd86b3          	add	a3,s11,a3
    80003230:	0006c683          	lbu	a3,0(a3)
    80003234:	02e557bb          	divuw	a5,a0,a4
    80003238:	f8d40023          	sb	a3,-128(s0)
    8000323c:	10b65e63          	bge	a2,a1,80003358 <__printf+0x670>
    80003240:	06300593          	li	a1,99
    80003244:	02e7f6bb          	remuw	a3,a5,a4
    80003248:	02069693          	slli	a3,a3,0x20
    8000324c:	0206d693          	srli	a3,a3,0x20
    80003250:	00dd86b3          	add	a3,s11,a3
    80003254:	0006c683          	lbu	a3,0(a3)
    80003258:	02e7d73b          	divuw	a4,a5,a4
    8000325c:	00200793          	li	a5,2
    80003260:	f8d400a3          	sb	a3,-127(s0)
    80003264:	bca5ece3          	bltu	a1,a0,80002e3c <__printf+0x154>
    80003268:	ce5ff06f          	j	80002f4c <__printf+0x264>
    8000326c:	40e007bb          	negw	a5,a4
    80003270:	00002d97          	auipc	s11,0x2
    80003274:	0e0d8d93          	addi	s11,s11,224 # 80005350 <digits>
    80003278:	00f7f693          	andi	a3,a5,15
    8000327c:	00dd86b3          	add	a3,s11,a3
    80003280:	0006c583          	lbu	a1,0(a3)
    80003284:	ff100613          	li	a2,-15
    80003288:	0047d69b          	srliw	a3,a5,0x4
    8000328c:	f8b40023          	sb	a1,-128(s0)
    80003290:	0047d59b          	srliw	a1,a5,0x4
    80003294:	0ac75e63          	bge	a4,a2,80003350 <__printf+0x668>
    80003298:	00f6f693          	andi	a3,a3,15
    8000329c:	00dd86b3          	add	a3,s11,a3
    800032a0:	0006c603          	lbu	a2,0(a3)
    800032a4:	00f00693          	li	a3,15
    800032a8:	0087d79b          	srliw	a5,a5,0x8
    800032ac:	f8c400a3          	sb	a2,-127(s0)
    800032b0:	d8b6e4e3          	bltu	a3,a1,80003038 <__printf+0x350>
    800032b4:	00200793          	li	a5,2
    800032b8:	e2dff06f          	j	800030e4 <__printf+0x3fc>
    800032bc:	00002c97          	auipc	s9,0x2
    800032c0:	074c8c93          	addi	s9,s9,116 # 80005330 <_ZZ12printIntegermE6digits+0x310>
    800032c4:	02800513          	li	a0,40
    800032c8:	ef1ff06f          	j	800031b8 <__printf+0x4d0>
    800032cc:	00700793          	li	a5,7
    800032d0:	00600c93          	li	s9,6
    800032d4:	e0dff06f          	j	800030e0 <__printf+0x3f8>
    800032d8:	00700793          	li	a5,7
    800032dc:	00600c93          	li	s9,6
    800032e0:	c69ff06f          	j	80002f48 <__printf+0x260>
    800032e4:	00300793          	li	a5,3
    800032e8:	00200c93          	li	s9,2
    800032ec:	c5dff06f          	j	80002f48 <__printf+0x260>
    800032f0:	00300793          	li	a5,3
    800032f4:	00200c93          	li	s9,2
    800032f8:	de9ff06f          	j	800030e0 <__printf+0x3f8>
    800032fc:	00400793          	li	a5,4
    80003300:	00300c93          	li	s9,3
    80003304:	dddff06f          	j	800030e0 <__printf+0x3f8>
    80003308:	00400793          	li	a5,4
    8000330c:	00300c93          	li	s9,3
    80003310:	c39ff06f          	j	80002f48 <__printf+0x260>
    80003314:	00500793          	li	a5,5
    80003318:	00400c93          	li	s9,4
    8000331c:	c2dff06f          	j	80002f48 <__printf+0x260>
    80003320:	00500793          	li	a5,5
    80003324:	00400c93          	li	s9,4
    80003328:	db9ff06f          	j	800030e0 <__printf+0x3f8>
    8000332c:	00600793          	li	a5,6
    80003330:	00500c93          	li	s9,5
    80003334:	dadff06f          	j	800030e0 <__printf+0x3f8>
    80003338:	00600793          	li	a5,6
    8000333c:	00500c93          	li	s9,5
    80003340:	c09ff06f          	j	80002f48 <__printf+0x260>
    80003344:	00800793          	li	a5,8
    80003348:	00700c93          	li	s9,7
    8000334c:	bfdff06f          	j	80002f48 <__printf+0x260>
    80003350:	00100793          	li	a5,1
    80003354:	d91ff06f          	j	800030e4 <__printf+0x3fc>
    80003358:	00100793          	li	a5,1
    8000335c:	bf1ff06f          	j	80002f4c <__printf+0x264>
    80003360:	00900793          	li	a5,9
    80003364:	00800c93          	li	s9,8
    80003368:	be1ff06f          	j	80002f48 <__printf+0x260>
    8000336c:	00002517          	auipc	a0,0x2
    80003370:	fcc50513          	addi	a0,a0,-52 # 80005338 <_ZZ12printIntegermE6digits+0x318>
    80003374:	00000097          	auipc	ra,0x0
    80003378:	918080e7          	jalr	-1768(ra) # 80002c8c <panic>

000000008000337c <printfinit>:
    8000337c:	fe010113          	addi	sp,sp,-32
    80003380:	00813823          	sd	s0,16(sp)
    80003384:	00913423          	sd	s1,8(sp)
    80003388:	00113c23          	sd	ra,24(sp)
    8000338c:	02010413          	addi	s0,sp,32
    80003390:	00004497          	auipc	s1,0x4
    80003394:	8b048493          	addi	s1,s1,-1872 # 80006c40 <pr>
    80003398:	00048513          	mv	a0,s1
    8000339c:	00002597          	auipc	a1,0x2
    800033a0:	fac58593          	addi	a1,a1,-84 # 80005348 <_ZZ12printIntegermE6digits+0x328>
    800033a4:	00000097          	auipc	ra,0x0
    800033a8:	5f4080e7          	jalr	1524(ra) # 80003998 <initlock>
    800033ac:	01813083          	ld	ra,24(sp)
    800033b0:	01013403          	ld	s0,16(sp)
    800033b4:	0004ac23          	sw	zero,24(s1)
    800033b8:	00813483          	ld	s1,8(sp)
    800033bc:	02010113          	addi	sp,sp,32
    800033c0:	00008067          	ret

00000000800033c4 <uartinit>:
    800033c4:	ff010113          	addi	sp,sp,-16
    800033c8:	00813423          	sd	s0,8(sp)
    800033cc:	01010413          	addi	s0,sp,16
    800033d0:	100007b7          	lui	a5,0x10000
    800033d4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    800033d8:	f8000713          	li	a4,-128
    800033dc:	00e781a3          	sb	a4,3(a5)
    800033e0:	00300713          	li	a4,3
    800033e4:	00e78023          	sb	a4,0(a5)
    800033e8:	000780a3          	sb	zero,1(a5)
    800033ec:	00e781a3          	sb	a4,3(a5)
    800033f0:	00700693          	li	a3,7
    800033f4:	00d78123          	sb	a3,2(a5)
    800033f8:	00e780a3          	sb	a4,1(a5)
    800033fc:	00813403          	ld	s0,8(sp)
    80003400:	01010113          	addi	sp,sp,16
    80003404:	00008067          	ret

0000000080003408 <uartputc>:
    80003408:	00002797          	auipc	a5,0x2
    8000340c:	5c07a783          	lw	a5,1472(a5) # 800059c8 <panicked>
    80003410:	00078463          	beqz	a5,80003418 <uartputc+0x10>
    80003414:	0000006f          	j	80003414 <uartputc+0xc>
    80003418:	fd010113          	addi	sp,sp,-48
    8000341c:	02813023          	sd	s0,32(sp)
    80003420:	00913c23          	sd	s1,24(sp)
    80003424:	01213823          	sd	s2,16(sp)
    80003428:	01313423          	sd	s3,8(sp)
    8000342c:	02113423          	sd	ra,40(sp)
    80003430:	03010413          	addi	s0,sp,48
    80003434:	00002917          	auipc	s2,0x2
    80003438:	59c90913          	addi	s2,s2,1436 # 800059d0 <uart_tx_r>
    8000343c:	00093783          	ld	a5,0(s2)
    80003440:	00002497          	auipc	s1,0x2
    80003444:	59848493          	addi	s1,s1,1432 # 800059d8 <uart_tx_w>
    80003448:	0004b703          	ld	a4,0(s1)
    8000344c:	02078693          	addi	a3,a5,32
    80003450:	00050993          	mv	s3,a0
    80003454:	02e69c63          	bne	a3,a4,8000348c <uartputc+0x84>
    80003458:	00001097          	auipc	ra,0x1
    8000345c:	834080e7          	jalr	-1996(ra) # 80003c8c <push_on>
    80003460:	00093783          	ld	a5,0(s2)
    80003464:	0004b703          	ld	a4,0(s1)
    80003468:	02078793          	addi	a5,a5,32
    8000346c:	00e79463          	bne	a5,a4,80003474 <uartputc+0x6c>
    80003470:	0000006f          	j	80003470 <uartputc+0x68>
    80003474:	00001097          	auipc	ra,0x1
    80003478:	88c080e7          	jalr	-1908(ra) # 80003d00 <pop_on>
    8000347c:	00093783          	ld	a5,0(s2)
    80003480:	0004b703          	ld	a4,0(s1)
    80003484:	02078693          	addi	a3,a5,32
    80003488:	fce688e3          	beq	a3,a4,80003458 <uartputc+0x50>
    8000348c:	01f77693          	andi	a3,a4,31
    80003490:	00003597          	auipc	a1,0x3
    80003494:	7d058593          	addi	a1,a1,2000 # 80006c60 <uart_tx_buf>
    80003498:	00d586b3          	add	a3,a1,a3
    8000349c:	00170713          	addi	a4,a4,1
    800034a0:	01368023          	sb	s3,0(a3)
    800034a4:	00e4b023          	sd	a4,0(s1)
    800034a8:	10000637          	lui	a2,0x10000
    800034ac:	02f71063          	bne	a4,a5,800034cc <uartputc+0xc4>
    800034b0:	0340006f          	j	800034e4 <uartputc+0xdc>
    800034b4:	00074703          	lbu	a4,0(a4)
    800034b8:	00f93023          	sd	a5,0(s2)
    800034bc:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    800034c0:	00093783          	ld	a5,0(s2)
    800034c4:	0004b703          	ld	a4,0(s1)
    800034c8:	00f70e63          	beq	a4,a5,800034e4 <uartputc+0xdc>
    800034cc:	00564683          	lbu	a3,5(a2)
    800034d0:	01f7f713          	andi	a4,a5,31
    800034d4:	00e58733          	add	a4,a1,a4
    800034d8:	0206f693          	andi	a3,a3,32
    800034dc:	00178793          	addi	a5,a5,1
    800034e0:	fc069ae3          	bnez	a3,800034b4 <uartputc+0xac>
    800034e4:	02813083          	ld	ra,40(sp)
    800034e8:	02013403          	ld	s0,32(sp)
    800034ec:	01813483          	ld	s1,24(sp)
    800034f0:	01013903          	ld	s2,16(sp)
    800034f4:	00813983          	ld	s3,8(sp)
    800034f8:	03010113          	addi	sp,sp,48
    800034fc:	00008067          	ret

0000000080003500 <uartputc_sync>:
    80003500:	ff010113          	addi	sp,sp,-16
    80003504:	00813423          	sd	s0,8(sp)
    80003508:	01010413          	addi	s0,sp,16
    8000350c:	00002717          	auipc	a4,0x2
    80003510:	4bc72703          	lw	a4,1212(a4) # 800059c8 <panicked>
    80003514:	02071663          	bnez	a4,80003540 <uartputc_sync+0x40>
    80003518:	00050793          	mv	a5,a0
    8000351c:	100006b7          	lui	a3,0x10000
    80003520:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80003524:	02077713          	andi	a4,a4,32
    80003528:	fe070ce3          	beqz	a4,80003520 <uartputc_sync+0x20>
    8000352c:	0ff7f793          	andi	a5,a5,255
    80003530:	00f68023          	sb	a5,0(a3)
    80003534:	00813403          	ld	s0,8(sp)
    80003538:	01010113          	addi	sp,sp,16
    8000353c:	00008067          	ret
    80003540:	0000006f          	j	80003540 <uartputc_sync+0x40>

0000000080003544 <uartstart>:
    80003544:	ff010113          	addi	sp,sp,-16
    80003548:	00813423          	sd	s0,8(sp)
    8000354c:	01010413          	addi	s0,sp,16
    80003550:	00002617          	auipc	a2,0x2
    80003554:	48060613          	addi	a2,a2,1152 # 800059d0 <uart_tx_r>
    80003558:	00002517          	auipc	a0,0x2
    8000355c:	48050513          	addi	a0,a0,1152 # 800059d8 <uart_tx_w>
    80003560:	00063783          	ld	a5,0(a2)
    80003564:	00053703          	ld	a4,0(a0)
    80003568:	04f70263          	beq	a4,a5,800035ac <uartstart+0x68>
    8000356c:	100005b7          	lui	a1,0x10000
    80003570:	00003817          	auipc	a6,0x3
    80003574:	6f080813          	addi	a6,a6,1776 # 80006c60 <uart_tx_buf>
    80003578:	01c0006f          	j	80003594 <uartstart+0x50>
    8000357c:	0006c703          	lbu	a4,0(a3)
    80003580:	00f63023          	sd	a5,0(a2)
    80003584:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80003588:	00063783          	ld	a5,0(a2)
    8000358c:	00053703          	ld	a4,0(a0)
    80003590:	00f70e63          	beq	a4,a5,800035ac <uartstart+0x68>
    80003594:	01f7f713          	andi	a4,a5,31
    80003598:	00e806b3          	add	a3,a6,a4
    8000359c:	0055c703          	lbu	a4,5(a1)
    800035a0:	00178793          	addi	a5,a5,1
    800035a4:	02077713          	andi	a4,a4,32
    800035a8:	fc071ae3          	bnez	a4,8000357c <uartstart+0x38>
    800035ac:	00813403          	ld	s0,8(sp)
    800035b0:	01010113          	addi	sp,sp,16
    800035b4:	00008067          	ret

00000000800035b8 <uartgetc>:
    800035b8:	ff010113          	addi	sp,sp,-16
    800035bc:	00813423          	sd	s0,8(sp)
    800035c0:	01010413          	addi	s0,sp,16
    800035c4:	10000737          	lui	a4,0x10000
    800035c8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    800035cc:	0017f793          	andi	a5,a5,1
    800035d0:	00078c63          	beqz	a5,800035e8 <uartgetc+0x30>
    800035d4:	00074503          	lbu	a0,0(a4)
    800035d8:	0ff57513          	andi	a0,a0,255
    800035dc:	00813403          	ld	s0,8(sp)
    800035e0:	01010113          	addi	sp,sp,16
    800035e4:	00008067          	ret
    800035e8:	fff00513          	li	a0,-1
    800035ec:	ff1ff06f          	j	800035dc <uartgetc+0x24>

00000000800035f0 <uartintr>:
    800035f0:	100007b7          	lui	a5,0x10000
    800035f4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    800035f8:	0017f793          	andi	a5,a5,1
    800035fc:	0a078463          	beqz	a5,800036a4 <uartintr+0xb4>
    80003600:	fe010113          	addi	sp,sp,-32
    80003604:	00813823          	sd	s0,16(sp)
    80003608:	00913423          	sd	s1,8(sp)
    8000360c:	00113c23          	sd	ra,24(sp)
    80003610:	02010413          	addi	s0,sp,32
    80003614:	100004b7          	lui	s1,0x10000
    80003618:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000361c:	0ff57513          	andi	a0,a0,255
    80003620:	fffff097          	auipc	ra,0xfffff
    80003624:	534080e7          	jalr	1332(ra) # 80002b54 <consoleintr>
    80003628:	0054c783          	lbu	a5,5(s1)
    8000362c:	0017f793          	andi	a5,a5,1
    80003630:	fe0794e3          	bnez	a5,80003618 <uartintr+0x28>
    80003634:	00002617          	auipc	a2,0x2
    80003638:	39c60613          	addi	a2,a2,924 # 800059d0 <uart_tx_r>
    8000363c:	00002517          	auipc	a0,0x2
    80003640:	39c50513          	addi	a0,a0,924 # 800059d8 <uart_tx_w>
    80003644:	00063783          	ld	a5,0(a2)
    80003648:	00053703          	ld	a4,0(a0)
    8000364c:	04f70263          	beq	a4,a5,80003690 <uartintr+0xa0>
    80003650:	100005b7          	lui	a1,0x10000
    80003654:	00003817          	auipc	a6,0x3
    80003658:	60c80813          	addi	a6,a6,1548 # 80006c60 <uart_tx_buf>
    8000365c:	01c0006f          	j	80003678 <uartintr+0x88>
    80003660:	0006c703          	lbu	a4,0(a3)
    80003664:	00f63023          	sd	a5,0(a2)
    80003668:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000366c:	00063783          	ld	a5,0(a2)
    80003670:	00053703          	ld	a4,0(a0)
    80003674:	00f70e63          	beq	a4,a5,80003690 <uartintr+0xa0>
    80003678:	01f7f713          	andi	a4,a5,31
    8000367c:	00e806b3          	add	a3,a6,a4
    80003680:	0055c703          	lbu	a4,5(a1)
    80003684:	00178793          	addi	a5,a5,1
    80003688:	02077713          	andi	a4,a4,32
    8000368c:	fc071ae3          	bnez	a4,80003660 <uartintr+0x70>
    80003690:	01813083          	ld	ra,24(sp)
    80003694:	01013403          	ld	s0,16(sp)
    80003698:	00813483          	ld	s1,8(sp)
    8000369c:	02010113          	addi	sp,sp,32
    800036a0:	00008067          	ret
    800036a4:	00002617          	auipc	a2,0x2
    800036a8:	32c60613          	addi	a2,a2,812 # 800059d0 <uart_tx_r>
    800036ac:	00002517          	auipc	a0,0x2
    800036b0:	32c50513          	addi	a0,a0,812 # 800059d8 <uart_tx_w>
    800036b4:	00063783          	ld	a5,0(a2)
    800036b8:	00053703          	ld	a4,0(a0)
    800036bc:	04f70263          	beq	a4,a5,80003700 <uartintr+0x110>
    800036c0:	100005b7          	lui	a1,0x10000
    800036c4:	00003817          	auipc	a6,0x3
    800036c8:	59c80813          	addi	a6,a6,1436 # 80006c60 <uart_tx_buf>
    800036cc:	01c0006f          	j	800036e8 <uartintr+0xf8>
    800036d0:	0006c703          	lbu	a4,0(a3)
    800036d4:	00f63023          	sd	a5,0(a2)
    800036d8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800036dc:	00063783          	ld	a5,0(a2)
    800036e0:	00053703          	ld	a4,0(a0)
    800036e4:	02f70063          	beq	a4,a5,80003704 <uartintr+0x114>
    800036e8:	01f7f713          	andi	a4,a5,31
    800036ec:	00e806b3          	add	a3,a6,a4
    800036f0:	0055c703          	lbu	a4,5(a1)
    800036f4:	00178793          	addi	a5,a5,1
    800036f8:	02077713          	andi	a4,a4,32
    800036fc:	fc071ae3          	bnez	a4,800036d0 <uartintr+0xe0>
    80003700:	00008067          	ret
    80003704:	00008067          	ret

0000000080003708 <kinit>:
    80003708:	fc010113          	addi	sp,sp,-64
    8000370c:	02913423          	sd	s1,40(sp)
    80003710:	fffff7b7          	lui	a5,0xfffff
    80003714:	00004497          	auipc	s1,0x4
    80003718:	56b48493          	addi	s1,s1,1387 # 80007c7f <end+0xfff>
    8000371c:	02813823          	sd	s0,48(sp)
    80003720:	01313c23          	sd	s3,24(sp)
    80003724:	00f4f4b3          	and	s1,s1,a5
    80003728:	02113c23          	sd	ra,56(sp)
    8000372c:	03213023          	sd	s2,32(sp)
    80003730:	01413823          	sd	s4,16(sp)
    80003734:	01513423          	sd	s5,8(sp)
    80003738:	04010413          	addi	s0,sp,64
    8000373c:	000017b7          	lui	a5,0x1
    80003740:	01100993          	li	s3,17
    80003744:	00f487b3          	add	a5,s1,a5
    80003748:	01b99993          	slli	s3,s3,0x1b
    8000374c:	06f9e063          	bltu	s3,a5,800037ac <kinit+0xa4>
    80003750:	00003a97          	auipc	s5,0x3
    80003754:	530a8a93          	addi	s5,s5,1328 # 80006c80 <end>
    80003758:	0754ec63          	bltu	s1,s5,800037d0 <kinit+0xc8>
    8000375c:	0734fa63          	bgeu	s1,s3,800037d0 <kinit+0xc8>
    80003760:	00088a37          	lui	s4,0x88
    80003764:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80003768:	00002917          	auipc	s2,0x2
    8000376c:	27890913          	addi	s2,s2,632 # 800059e0 <kmem>
    80003770:	00ca1a13          	slli	s4,s4,0xc
    80003774:	0140006f          	j	80003788 <kinit+0x80>
    80003778:	000017b7          	lui	a5,0x1
    8000377c:	00f484b3          	add	s1,s1,a5
    80003780:	0554e863          	bltu	s1,s5,800037d0 <kinit+0xc8>
    80003784:	0534f663          	bgeu	s1,s3,800037d0 <kinit+0xc8>
    80003788:	00001637          	lui	a2,0x1
    8000378c:	00100593          	li	a1,1
    80003790:	00048513          	mv	a0,s1
    80003794:	00000097          	auipc	ra,0x0
    80003798:	5e4080e7          	jalr	1508(ra) # 80003d78 <__memset>
    8000379c:	00093783          	ld	a5,0(s2)
    800037a0:	00f4b023          	sd	a5,0(s1)
    800037a4:	00993023          	sd	s1,0(s2)
    800037a8:	fd4498e3          	bne	s1,s4,80003778 <kinit+0x70>
    800037ac:	03813083          	ld	ra,56(sp)
    800037b0:	03013403          	ld	s0,48(sp)
    800037b4:	02813483          	ld	s1,40(sp)
    800037b8:	02013903          	ld	s2,32(sp)
    800037bc:	01813983          	ld	s3,24(sp)
    800037c0:	01013a03          	ld	s4,16(sp)
    800037c4:	00813a83          	ld	s5,8(sp)
    800037c8:	04010113          	addi	sp,sp,64
    800037cc:	00008067          	ret
    800037d0:	00002517          	auipc	a0,0x2
    800037d4:	b9850513          	addi	a0,a0,-1128 # 80005368 <digits+0x18>
    800037d8:	fffff097          	auipc	ra,0xfffff
    800037dc:	4b4080e7          	jalr	1204(ra) # 80002c8c <panic>

00000000800037e0 <freerange>:
    800037e0:	fc010113          	addi	sp,sp,-64
    800037e4:	000017b7          	lui	a5,0x1
    800037e8:	02913423          	sd	s1,40(sp)
    800037ec:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    800037f0:	009504b3          	add	s1,a0,s1
    800037f4:	fffff537          	lui	a0,0xfffff
    800037f8:	02813823          	sd	s0,48(sp)
    800037fc:	02113c23          	sd	ra,56(sp)
    80003800:	03213023          	sd	s2,32(sp)
    80003804:	01313c23          	sd	s3,24(sp)
    80003808:	01413823          	sd	s4,16(sp)
    8000380c:	01513423          	sd	s5,8(sp)
    80003810:	01613023          	sd	s6,0(sp)
    80003814:	04010413          	addi	s0,sp,64
    80003818:	00a4f4b3          	and	s1,s1,a0
    8000381c:	00f487b3          	add	a5,s1,a5
    80003820:	06f5e463          	bltu	a1,a5,80003888 <freerange+0xa8>
    80003824:	00003a97          	auipc	s5,0x3
    80003828:	45ca8a93          	addi	s5,s5,1116 # 80006c80 <end>
    8000382c:	0954e263          	bltu	s1,s5,800038b0 <freerange+0xd0>
    80003830:	01100993          	li	s3,17
    80003834:	01b99993          	slli	s3,s3,0x1b
    80003838:	0734fc63          	bgeu	s1,s3,800038b0 <freerange+0xd0>
    8000383c:	00058a13          	mv	s4,a1
    80003840:	00002917          	auipc	s2,0x2
    80003844:	1a090913          	addi	s2,s2,416 # 800059e0 <kmem>
    80003848:	00002b37          	lui	s6,0x2
    8000384c:	0140006f          	j	80003860 <freerange+0x80>
    80003850:	000017b7          	lui	a5,0x1
    80003854:	00f484b3          	add	s1,s1,a5
    80003858:	0554ec63          	bltu	s1,s5,800038b0 <freerange+0xd0>
    8000385c:	0534fa63          	bgeu	s1,s3,800038b0 <freerange+0xd0>
    80003860:	00001637          	lui	a2,0x1
    80003864:	00100593          	li	a1,1
    80003868:	00048513          	mv	a0,s1
    8000386c:	00000097          	auipc	ra,0x0
    80003870:	50c080e7          	jalr	1292(ra) # 80003d78 <__memset>
    80003874:	00093703          	ld	a4,0(s2)
    80003878:	016487b3          	add	a5,s1,s6
    8000387c:	00e4b023          	sd	a4,0(s1)
    80003880:	00993023          	sd	s1,0(s2)
    80003884:	fcfa76e3          	bgeu	s4,a5,80003850 <freerange+0x70>
    80003888:	03813083          	ld	ra,56(sp)
    8000388c:	03013403          	ld	s0,48(sp)
    80003890:	02813483          	ld	s1,40(sp)
    80003894:	02013903          	ld	s2,32(sp)
    80003898:	01813983          	ld	s3,24(sp)
    8000389c:	01013a03          	ld	s4,16(sp)
    800038a0:	00813a83          	ld	s5,8(sp)
    800038a4:	00013b03          	ld	s6,0(sp)
    800038a8:	04010113          	addi	sp,sp,64
    800038ac:	00008067          	ret
    800038b0:	00002517          	auipc	a0,0x2
    800038b4:	ab850513          	addi	a0,a0,-1352 # 80005368 <digits+0x18>
    800038b8:	fffff097          	auipc	ra,0xfffff
    800038bc:	3d4080e7          	jalr	980(ra) # 80002c8c <panic>

00000000800038c0 <kfree>:
    800038c0:	fe010113          	addi	sp,sp,-32
    800038c4:	00813823          	sd	s0,16(sp)
    800038c8:	00113c23          	sd	ra,24(sp)
    800038cc:	00913423          	sd	s1,8(sp)
    800038d0:	02010413          	addi	s0,sp,32
    800038d4:	03451793          	slli	a5,a0,0x34
    800038d8:	04079c63          	bnez	a5,80003930 <kfree+0x70>
    800038dc:	00003797          	auipc	a5,0x3
    800038e0:	3a478793          	addi	a5,a5,932 # 80006c80 <end>
    800038e4:	00050493          	mv	s1,a0
    800038e8:	04f56463          	bltu	a0,a5,80003930 <kfree+0x70>
    800038ec:	01100793          	li	a5,17
    800038f0:	01b79793          	slli	a5,a5,0x1b
    800038f4:	02f57e63          	bgeu	a0,a5,80003930 <kfree+0x70>
    800038f8:	00001637          	lui	a2,0x1
    800038fc:	00100593          	li	a1,1
    80003900:	00000097          	auipc	ra,0x0
    80003904:	478080e7          	jalr	1144(ra) # 80003d78 <__memset>
    80003908:	00002797          	auipc	a5,0x2
    8000390c:	0d878793          	addi	a5,a5,216 # 800059e0 <kmem>
    80003910:	0007b703          	ld	a4,0(a5)
    80003914:	01813083          	ld	ra,24(sp)
    80003918:	01013403          	ld	s0,16(sp)
    8000391c:	00e4b023          	sd	a4,0(s1)
    80003920:	0097b023          	sd	s1,0(a5)
    80003924:	00813483          	ld	s1,8(sp)
    80003928:	02010113          	addi	sp,sp,32
    8000392c:	00008067          	ret
    80003930:	00002517          	auipc	a0,0x2
    80003934:	a3850513          	addi	a0,a0,-1480 # 80005368 <digits+0x18>
    80003938:	fffff097          	auipc	ra,0xfffff
    8000393c:	354080e7          	jalr	852(ra) # 80002c8c <panic>

0000000080003940 <kalloc>:
    80003940:	fe010113          	addi	sp,sp,-32
    80003944:	00813823          	sd	s0,16(sp)
    80003948:	00913423          	sd	s1,8(sp)
    8000394c:	00113c23          	sd	ra,24(sp)
    80003950:	02010413          	addi	s0,sp,32
    80003954:	00002797          	auipc	a5,0x2
    80003958:	08c78793          	addi	a5,a5,140 # 800059e0 <kmem>
    8000395c:	0007b483          	ld	s1,0(a5)
    80003960:	02048063          	beqz	s1,80003980 <kalloc+0x40>
    80003964:	0004b703          	ld	a4,0(s1)
    80003968:	00001637          	lui	a2,0x1
    8000396c:	00500593          	li	a1,5
    80003970:	00048513          	mv	a0,s1
    80003974:	00e7b023          	sd	a4,0(a5)
    80003978:	00000097          	auipc	ra,0x0
    8000397c:	400080e7          	jalr	1024(ra) # 80003d78 <__memset>
    80003980:	01813083          	ld	ra,24(sp)
    80003984:	01013403          	ld	s0,16(sp)
    80003988:	00048513          	mv	a0,s1
    8000398c:	00813483          	ld	s1,8(sp)
    80003990:	02010113          	addi	sp,sp,32
    80003994:	00008067          	ret

0000000080003998 <initlock>:
    80003998:	ff010113          	addi	sp,sp,-16
    8000399c:	00813423          	sd	s0,8(sp)
    800039a0:	01010413          	addi	s0,sp,16
    800039a4:	00813403          	ld	s0,8(sp)
    800039a8:	00b53423          	sd	a1,8(a0)
    800039ac:	00052023          	sw	zero,0(a0)
    800039b0:	00053823          	sd	zero,16(a0)
    800039b4:	01010113          	addi	sp,sp,16
    800039b8:	00008067          	ret

00000000800039bc <acquire>:
    800039bc:	fe010113          	addi	sp,sp,-32
    800039c0:	00813823          	sd	s0,16(sp)
    800039c4:	00913423          	sd	s1,8(sp)
    800039c8:	00113c23          	sd	ra,24(sp)
    800039cc:	01213023          	sd	s2,0(sp)
    800039d0:	02010413          	addi	s0,sp,32
    800039d4:	00050493          	mv	s1,a0
    800039d8:	10002973          	csrr	s2,sstatus
    800039dc:	100027f3          	csrr	a5,sstatus
    800039e0:	ffd7f793          	andi	a5,a5,-3
    800039e4:	10079073          	csrw	sstatus,a5
    800039e8:	fffff097          	auipc	ra,0xfffff
    800039ec:	8ec080e7          	jalr	-1812(ra) # 800022d4 <mycpu>
    800039f0:	07852783          	lw	a5,120(a0)
    800039f4:	06078e63          	beqz	a5,80003a70 <acquire+0xb4>
    800039f8:	fffff097          	auipc	ra,0xfffff
    800039fc:	8dc080e7          	jalr	-1828(ra) # 800022d4 <mycpu>
    80003a00:	07852783          	lw	a5,120(a0)
    80003a04:	0004a703          	lw	a4,0(s1)
    80003a08:	0017879b          	addiw	a5,a5,1
    80003a0c:	06f52c23          	sw	a5,120(a0)
    80003a10:	04071063          	bnez	a4,80003a50 <acquire+0x94>
    80003a14:	00100713          	li	a4,1
    80003a18:	00070793          	mv	a5,a4
    80003a1c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80003a20:	0007879b          	sext.w	a5,a5
    80003a24:	fe079ae3          	bnez	a5,80003a18 <acquire+0x5c>
    80003a28:	0ff0000f          	fence
    80003a2c:	fffff097          	auipc	ra,0xfffff
    80003a30:	8a8080e7          	jalr	-1880(ra) # 800022d4 <mycpu>
    80003a34:	01813083          	ld	ra,24(sp)
    80003a38:	01013403          	ld	s0,16(sp)
    80003a3c:	00a4b823          	sd	a0,16(s1)
    80003a40:	00013903          	ld	s2,0(sp)
    80003a44:	00813483          	ld	s1,8(sp)
    80003a48:	02010113          	addi	sp,sp,32
    80003a4c:	00008067          	ret
    80003a50:	0104b903          	ld	s2,16(s1)
    80003a54:	fffff097          	auipc	ra,0xfffff
    80003a58:	880080e7          	jalr	-1920(ra) # 800022d4 <mycpu>
    80003a5c:	faa91ce3          	bne	s2,a0,80003a14 <acquire+0x58>
    80003a60:	00002517          	auipc	a0,0x2
    80003a64:	91050513          	addi	a0,a0,-1776 # 80005370 <digits+0x20>
    80003a68:	fffff097          	auipc	ra,0xfffff
    80003a6c:	224080e7          	jalr	548(ra) # 80002c8c <panic>
    80003a70:	00195913          	srli	s2,s2,0x1
    80003a74:	fffff097          	auipc	ra,0xfffff
    80003a78:	860080e7          	jalr	-1952(ra) # 800022d4 <mycpu>
    80003a7c:	00197913          	andi	s2,s2,1
    80003a80:	07252e23          	sw	s2,124(a0)
    80003a84:	f75ff06f          	j	800039f8 <acquire+0x3c>

0000000080003a88 <release>:
    80003a88:	fe010113          	addi	sp,sp,-32
    80003a8c:	00813823          	sd	s0,16(sp)
    80003a90:	00113c23          	sd	ra,24(sp)
    80003a94:	00913423          	sd	s1,8(sp)
    80003a98:	01213023          	sd	s2,0(sp)
    80003a9c:	02010413          	addi	s0,sp,32
    80003aa0:	00052783          	lw	a5,0(a0)
    80003aa4:	00079a63          	bnez	a5,80003ab8 <release+0x30>
    80003aa8:	00002517          	auipc	a0,0x2
    80003aac:	8d050513          	addi	a0,a0,-1840 # 80005378 <digits+0x28>
    80003ab0:	fffff097          	auipc	ra,0xfffff
    80003ab4:	1dc080e7          	jalr	476(ra) # 80002c8c <panic>
    80003ab8:	01053903          	ld	s2,16(a0)
    80003abc:	00050493          	mv	s1,a0
    80003ac0:	fffff097          	auipc	ra,0xfffff
    80003ac4:	814080e7          	jalr	-2028(ra) # 800022d4 <mycpu>
    80003ac8:	fea910e3          	bne	s2,a0,80003aa8 <release+0x20>
    80003acc:	0004b823          	sd	zero,16(s1)
    80003ad0:	0ff0000f          	fence
    80003ad4:	0f50000f          	fence	iorw,ow
    80003ad8:	0804a02f          	amoswap.w	zero,zero,(s1)
    80003adc:	ffffe097          	auipc	ra,0xffffe
    80003ae0:	7f8080e7          	jalr	2040(ra) # 800022d4 <mycpu>
    80003ae4:	100027f3          	csrr	a5,sstatus
    80003ae8:	0027f793          	andi	a5,a5,2
    80003aec:	04079a63          	bnez	a5,80003b40 <release+0xb8>
    80003af0:	07852783          	lw	a5,120(a0)
    80003af4:	02f05e63          	blez	a5,80003b30 <release+0xa8>
    80003af8:	fff7871b          	addiw	a4,a5,-1
    80003afc:	06e52c23          	sw	a4,120(a0)
    80003b00:	00071c63          	bnez	a4,80003b18 <release+0x90>
    80003b04:	07c52783          	lw	a5,124(a0)
    80003b08:	00078863          	beqz	a5,80003b18 <release+0x90>
    80003b0c:	100027f3          	csrr	a5,sstatus
    80003b10:	0027e793          	ori	a5,a5,2
    80003b14:	10079073          	csrw	sstatus,a5
    80003b18:	01813083          	ld	ra,24(sp)
    80003b1c:	01013403          	ld	s0,16(sp)
    80003b20:	00813483          	ld	s1,8(sp)
    80003b24:	00013903          	ld	s2,0(sp)
    80003b28:	02010113          	addi	sp,sp,32
    80003b2c:	00008067          	ret
    80003b30:	00002517          	auipc	a0,0x2
    80003b34:	86850513          	addi	a0,a0,-1944 # 80005398 <digits+0x48>
    80003b38:	fffff097          	auipc	ra,0xfffff
    80003b3c:	154080e7          	jalr	340(ra) # 80002c8c <panic>
    80003b40:	00002517          	auipc	a0,0x2
    80003b44:	84050513          	addi	a0,a0,-1984 # 80005380 <digits+0x30>
    80003b48:	fffff097          	auipc	ra,0xfffff
    80003b4c:	144080e7          	jalr	324(ra) # 80002c8c <panic>

0000000080003b50 <holding>:
    80003b50:	00052783          	lw	a5,0(a0)
    80003b54:	00079663          	bnez	a5,80003b60 <holding+0x10>
    80003b58:	00000513          	li	a0,0
    80003b5c:	00008067          	ret
    80003b60:	fe010113          	addi	sp,sp,-32
    80003b64:	00813823          	sd	s0,16(sp)
    80003b68:	00913423          	sd	s1,8(sp)
    80003b6c:	00113c23          	sd	ra,24(sp)
    80003b70:	02010413          	addi	s0,sp,32
    80003b74:	01053483          	ld	s1,16(a0)
    80003b78:	ffffe097          	auipc	ra,0xffffe
    80003b7c:	75c080e7          	jalr	1884(ra) # 800022d4 <mycpu>
    80003b80:	01813083          	ld	ra,24(sp)
    80003b84:	01013403          	ld	s0,16(sp)
    80003b88:	40a48533          	sub	a0,s1,a0
    80003b8c:	00153513          	seqz	a0,a0
    80003b90:	00813483          	ld	s1,8(sp)
    80003b94:	02010113          	addi	sp,sp,32
    80003b98:	00008067          	ret

0000000080003b9c <push_off>:
    80003b9c:	fe010113          	addi	sp,sp,-32
    80003ba0:	00813823          	sd	s0,16(sp)
    80003ba4:	00113c23          	sd	ra,24(sp)
    80003ba8:	00913423          	sd	s1,8(sp)
    80003bac:	02010413          	addi	s0,sp,32
    80003bb0:	100024f3          	csrr	s1,sstatus
    80003bb4:	100027f3          	csrr	a5,sstatus
    80003bb8:	ffd7f793          	andi	a5,a5,-3
    80003bbc:	10079073          	csrw	sstatus,a5
    80003bc0:	ffffe097          	auipc	ra,0xffffe
    80003bc4:	714080e7          	jalr	1812(ra) # 800022d4 <mycpu>
    80003bc8:	07852783          	lw	a5,120(a0)
    80003bcc:	02078663          	beqz	a5,80003bf8 <push_off+0x5c>
    80003bd0:	ffffe097          	auipc	ra,0xffffe
    80003bd4:	704080e7          	jalr	1796(ra) # 800022d4 <mycpu>
    80003bd8:	07852783          	lw	a5,120(a0)
    80003bdc:	01813083          	ld	ra,24(sp)
    80003be0:	01013403          	ld	s0,16(sp)
    80003be4:	0017879b          	addiw	a5,a5,1
    80003be8:	06f52c23          	sw	a5,120(a0)
    80003bec:	00813483          	ld	s1,8(sp)
    80003bf0:	02010113          	addi	sp,sp,32
    80003bf4:	00008067          	ret
    80003bf8:	0014d493          	srli	s1,s1,0x1
    80003bfc:	ffffe097          	auipc	ra,0xffffe
    80003c00:	6d8080e7          	jalr	1752(ra) # 800022d4 <mycpu>
    80003c04:	0014f493          	andi	s1,s1,1
    80003c08:	06952e23          	sw	s1,124(a0)
    80003c0c:	fc5ff06f          	j	80003bd0 <push_off+0x34>

0000000080003c10 <pop_off>:
    80003c10:	ff010113          	addi	sp,sp,-16
    80003c14:	00813023          	sd	s0,0(sp)
    80003c18:	00113423          	sd	ra,8(sp)
    80003c1c:	01010413          	addi	s0,sp,16
    80003c20:	ffffe097          	auipc	ra,0xffffe
    80003c24:	6b4080e7          	jalr	1716(ra) # 800022d4 <mycpu>
    80003c28:	100027f3          	csrr	a5,sstatus
    80003c2c:	0027f793          	andi	a5,a5,2
    80003c30:	04079663          	bnez	a5,80003c7c <pop_off+0x6c>
    80003c34:	07852783          	lw	a5,120(a0)
    80003c38:	02f05a63          	blez	a5,80003c6c <pop_off+0x5c>
    80003c3c:	fff7871b          	addiw	a4,a5,-1
    80003c40:	06e52c23          	sw	a4,120(a0)
    80003c44:	00071c63          	bnez	a4,80003c5c <pop_off+0x4c>
    80003c48:	07c52783          	lw	a5,124(a0)
    80003c4c:	00078863          	beqz	a5,80003c5c <pop_off+0x4c>
    80003c50:	100027f3          	csrr	a5,sstatus
    80003c54:	0027e793          	ori	a5,a5,2
    80003c58:	10079073          	csrw	sstatus,a5
    80003c5c:	00813083          	ld	ra,8(sp)
    80003c60:	00013403          	ld	s0,0(sp)
    80003c64:	01010113          	addi	sp,sp,16
    80003c68:	00008067          	ret
    80003c6c:	00001517          	auipc	a0,0x1
    80003c70:	72c50513          	addi	a0,a0,1836 # 80005398 <digits+0x48>
    80003c74:	fffff097          	auipc	ra,0xfffff
    80003c78:	018080e7          	jalr	24(ra) # 80002c8c <panic>
    80003c7c:	00001517          	auipc	a0,0x1
    80003c80:	70450513          	addi	a0,a0,1796 # 80005380 <digits+0x30>
    80003c84:	fffff097          	auipc	ra,0xfffff
    80003c88:	008080e7          	jalr	8(ra) # 80002c8c <panic>

0000000080003c8c <push_on>:
    80003c8c:	fe010113          	addi	sp,sp,-32
    80003c90:	00813823          	sd	s0,16(sp)
    80003c94:	00113c23          	sd	ra,24(sp)
    80003c98:	00913423          	sd	s1,8(sp)
    80003c9c:	02010413          	addi	s0,sp,32
    80003ca0:	100024f3          	csrr	s1,sstatus
    80003ca4:	100027f3          	csrr	a5,sstatus
    80003ca8:	0027e793          	ori	a5,a5,2
    80003cac:	10079073          	csrw	sstatus,a5
    80003cb0:	ffffe097          	auipc	ra,0xffffe
    80003cb4:	624080e7          	jalr	1572(ra) # 800022d4 <mycpu>
    80003cb8:	07852783          	lw	a5,120(a0)
    80003cbc:	02078663          	beqz	a5,80003ce8 <push_on+0x5c>
    80003cc0:	ffffe097          	auipc	ra,0xffffe
    80003cc4:	614080e7          	jalr	1556(ra) # 800022d4 <mycpu>
    80003cc8:	07852783          	lw	a5,120(a0)
    80003ccc:	01813083          	ld	ra,24(sp)
    80003cd0:	01013403          	ld	s0,16(sp)
    80003cd4:	0017879b          	addiw	a5,a5,1
    80003cd8:	06f52c23          	sw	a5,120(a0)
    80003cdc:	00813483          	ld	s1,8(sp)
    80003ce0:	02010113          	addi	sp,sp,32
    80003ce4:	00008067          	ret
    80003ce8:	0014d493          	srli	s1,s1,0x1
    80003cec:	ffffe097          	auipc	ra,0xffffe
    80003cf0:	5e8080e7          	jalr	1512(ra) # 800022d4 <mycpu>
    80003cf4:	0014f493          	andi	s1,s1,1
    80003cf8:	06952e23          	sw	s1,124(a0)
    80003cfc:	fc5ff06f          	j	80003cc0 <push_on+0x34>

0000000080003d00 <pop_on>:
    80003d00:	ff010113          	addi	sp,sp,-16
    80003d04:	00813023          	sd	s0,0(sp)
    80003d08:	00113423          	sd	ra,8(sp)
    80003d0c:	01010413          	addi	s0,sp,16
    80003d10:	ffffe097          	auipc	ra,0xffffe
    80003d14:	5c4080e7          	jalr	1476(ra) # 800022d4 <mycpu>
    80003d18:	100027f3          	csrr	a5,sstatus
    80003d1c:	0027f793          	andi	a5,a5,2
    80003d20:	04078463          	beqz	a5,80003d68 <pop_on+0x68>
    80003d24:	07852783          	lw	a5,120(a0)
    80003d28:	02f05863          	blez	a5,80003d58 <pop_on+0x58>
    80003d2c:	fff7879b          	addiw	a5,a5,-1
    80003d30:	06f52c23          	sw	a5,120(a0)
    80003d34:	07853783          	ld	a5,120(a0)
    80003d38:	00079863          	bnez	a5,80003d48 <pop_on+0x48>
    80003d3c:	100027f3          	csrr	a5,sstatus
    80003d40:	ffd7f793          	andi	a5,a5,-3
    80003d44:	10079073          	csrw	sstatus,a5
    80003d48:	00813083          	ld	ra,8(sp)
    80003d4c:	00013403          	ld	s0,0(sp)
    80003d50:	01010113          	addi	sp,sp,16
    80003d54:	00008067          	ret
    80003d58:	00001517          	auipc	a0,0x1
    80003d5c:	66850513          	addi	a0,a0,1640 # 800053c0 <digits+0x70>
    80003d60:	fffff097          	auipc	ra,0xfffff
    80003d64:	f2c080e7          	jalr	-212(ra) # 80002c8c <panic>
    80003d68:	00001517          	auipc	a0,0x1
    80003d6c:	63850513          	addi	a0,a0,1592 # 800053a0 <digits+0x50>
    80003d70:	fffff097          	auipc	ra,0xfffff
    80003d74:	f1c080e7          	jalr	-228(ra) # 80002c8c <panic>

0000000080003d78 <__memset>:
    80003d78:	ff010113          	addi	sp,sp,-16
    80003d7c:	00813423          	sd	s0,8(sp)
    80003d80:	01010413          	addi	s0,sp,16
    80003d84:	1a060e63          	beqz	a2,80003f40 <__memset+0x1c8>
    80003d88:	40a007b3          	neg	a5,a0
    80003d8c:	0077f793          	andi	a5,a5,7
    80003d90:	00778693          	addi	a3,a5,7
    80003d94:	00b00813          	li	a6,11
    80003d98:	0ff5f593          	andi	a1,a1,255
    80003d9c:	fff6071b          	addiw	a4,a2,-1
    80003da0:	1b06e663          	bltu	a3,a6,80003f4c <__memset+0x1d4>
    80003da4:	1cd76463          	bltu	a4,a3,80003f6c <__memset+0x1f4>
    80003da8:	1a078e63          	beqz	a5,80003f64 <__memset+0x1ec>
    80003dac:	00b50023          	sb	a1,0(a0)
    80003db0:	00100713          	li	a4,1
    80003db4:	1ae78463          	beq	a5,a4,80003f5c <__memset+0x1e4>
    80003db8:	00b500a3          	sb	a1,1(a0)
    80003dbc:	00200713          	li	a4,2
    80003dc0:	1ae78a63          	beq	a5,a4,80003f74 <__memset+0x1fc>
    80003dc4:	00b50123          	sb	a1,2(a0)
    80003dc8:	00300713          	li	a4,3
    80003dcc:	18e78463          	beq	a5,a4,80003f54 <__memset+0x1dc>
    80003dd0:	00b501a3          	sb	a1,3(a0)
    80003dd4:	00400713          	li	a4,4
    80003dd8:	1ae78263          	beq	a5,a4,80003f7c <__memset+0x204>
    80003ddc:	00b50223          	sb	a1,4(a0)
    80003de0:	00500713          	li	a4,5
    80003de4:	1ae78063          	beq	a5,a4,80003f84 <__memset+0x20c>
    80003de8:	00b502a3          	sb	a1,5(a0)
    80003dec:	00700713          	li	a4,7
    80003df0:	18e79e63          	bne	a5,a4,80003f8c <__memset+0x214>
    80003df4:	00b50323          	sb	a1,6(a0)
    80003df8:	00700e93          	li	t4,7
    80003dfc:	00859713          	slli	a4,a1,0x8
    80003e00:	00e5e733          	or	a4,a1,a4
    80003e04:	01059e13          	slli	t3,a1,0x10
    80003e08:	01c76e33          	or	t3,a4,t3
    80003e0c:	01859313          	slli	t1,a1,0x18
    80003e10:	006e6333          	or	t1,t3,t1
    80003e14:	02059893          	slli	a7,a1,0x20
    80003e18:	40f60e3b          	subw	t3,a2,a5
    80003e1c:	011368b3          	or	a7,t1,a7
    80003e20:	02859813          	slli	a6,a1,0x28
    80003e24:	0108e833          	or	a6,a7,a6
    80003e28:	03059693          	slli	a3,a1,0x30
    80003e2c:	003e589b          	srliw	a7,t3,0x3
    80003e30:	00d866b3          	or	a3,a6,a3
    80003e34:	03859713          	slli	a4,a1,0x38
    80003e38:	00389813          	slli	a6,a7,0x3
    80003e3c:	00f507b3          	add	a5,a0,a5
    80003e40:	00e6e733          	or	a4,a3,a4
    80003e44:	000e089b          	sext.w	a7,t3
    80003e48:	00f806b3          	add	a3,a6,a5
    80003e4c:	00e7b023          	sd	a4,0(a5)
    80003e50:	00878793          	addi	a5,a5,8
    80003e54:	fed79ce3          	bne	a5,a3,80003e4c <__memset+0xd4>
    80003e58:	ff8e7793          	andi	a5,t3,-8
    80003e5c:	0007871b          	sext.w	a4,a5
    80003e60:	01d787bb          	addw	a5,a5,t4
    80003e64:	0ce88e63          	beq	a7,a4,80003f40 <__memset+0x1c8>
    80003e68:	00f50733          	add	a4,a0,a5
    80003e6c:	00b70023          	sb	a1,0(a4)
    80003e70:	0017871b          	addiw	a4,a5,1
    80003e74:	0cc77663          	bgeu	a4,a2,80003f40 <__memset+0x1c8>
    80003e78:	00e50733          	add	a4,a0,a4
    80003e7c:	00b70023          	sb	a1,0(a4)
    80003e80:	0027871b          	addiw	a4,a5,2
    80003e84:	0ac77e63          	bgeu	a4,a2,80003f40 <__memset+0x1c8>
    80003e88:	00e50733          	add	a4,a0,a4
    80003e8c:	00b70023          	sb	a1,0(a4)
    80003e90:	0037871b          	addiw	a4,a5,3
    80003e94:	0ac77663          	bgeu	a4,a2,80003f40 <__memset+0x1c8>
    80003e98:	00e50733          	add	a4,a0,a4
    80003e9c:	00b70023          	sb	a1,0(a4)
    80003ea0:	0047871b          	addiw	a4,a5,4
    80003ea4:	08c77e63          	bgeu	a4,a2,80003f40 <__memset+0x1c8>
    80003ea8:	00e50733          	add	a4,a0,a4
    80003eac:	00b70023          	sb	a1,0(a4)
    80003eb0:	0057871b          	addiw	a4,a5,5
    80003eb4:	08c77663          	bgeu	a4,a2,80003f40 <__memset+0x1c8>
    80003eb8:	00e50733          	add	a4,a0,a4
    80003ebc:	00b70023          	sb	a1,0(a4)
    80003ec0:	0067871b          	addiw	a4,a5,6
    80003ec4:	06c77e63          	bgeu	a4,a2,80003f40 <__memset+0x1c8>
    80003ec8:	00e50733          	add	a4,a0,a4
    80003ecc:	00b70023          	sb	a1,0(a4)
    80003ed0:	0077871b          	addiw	a4,a5,7
    80003ed4:	06c77663          	bgeu	a4,a2,80003f40 <__memset+0x1c8>
    80003ed8:	00e50733          	add	a4,a0,a4
    80003edc:	00b70023          	sb	a1,0(a4)
    80003ee0:	0087871b          	addiw	a4,a5,8
    80003ee4:	04c77e63          	bgeu	a4,a2,80003f40 <__memset+0x1c8>
    80003ee8:	00e50733          	add	a4,a0,a4
    80003eec:	00b70023          	sb	a1,0(a4)
    80003ef0:	0097871b          	addiw	a4,a5,9
    80003ef4:	04c77663          	bgeu	a4,a2,80003f40 <__memset+0x1c8>
    80003ef8:	00e50733          	add	a4,a0,a4
    80003efc:	00b70023          	sb	a1,0(a4)
    80003f00:	00a7871b          	addiw	a4,a5,10
    80003f04:	02c77e63          	bgeu	a4,a2,80003f40 <__memset+0x1c8>
    80003f08:	00e50733          	add	a4,a0,a4
    80003f0c:	00b70023          	sb	a1,0(a4)
    80003f10:	00b7871b          	addiw	a4,a5,11
    80003f14:	02c77663          	bgeu	a4,a2,80003f40 <__memset+0x1c8>
    80003f18:	00e50733          	add	a4,a0,a4
    80003f1c:	00b70023          	sb	a1,0(a4)
    80003f20:	00c7871b          	addiw	a4,a5,12
    80003f24:	00c77e63          	bgeu	a4,a2,80003f40 <__memset+0x1c8>
    80003f28:	00e50733          	add	a4,a0,a4
    80003f2c:	00b70023          	sb	a1,0(a4)
    80003f30:	00d7879b          	addiw	a5,a5,13
    80003f34:	00c7f663          	bgeu	a5,a2,80003f40 <__memset+0x1c8>
    80003f38:	00f507b3          	add	a5,a0,a5
    80003f3c:	00b78023          	sb	a1,0(a5)
    80003f40:	00813403          	ld	s0,8(sp)
    80003f44:	01010113          	addi	sp,sp,16
    80003f48:	00008067          	ret
    80003f4c:	00b00693          	li	a3,11
    80003f50:	e55ff06f          	j	80003da4 <__memset+0x2c>
    80003f54:	00300e93          	li	t4,3
    80003f58:	ea5ff06f          	j	80003dfc <__memset+0x84>
    80003f5c:	00100e93          	li	t4,1
    80003f60:	e9dff06f          	j	80003dfc <__memset+0x84>
    80003f64:	00000e93          	li	t4,0
    80003f68:	e95ff06f          	j	80003dfc <__memset+0x84>
    80003f6c:	00000793          	li	a5,0
    80003f70:	ef9ff06f          	j	80003e68 <__memset+0xf0>
    80003f74:	00200e93          	li	t4,2
    80003f78:	e85ff06f          	j	80003dfc <__memset+0x84>
    80003f7c:	00400e93          	li	t4,4
    80003f80:	e7dff06f          	j	80003dfc <__memset+0x84>
    80003f84:	00500e93          	li	t4,5
    80003f88:	e75ff06f          	j	80003dfc <__memset+0x84>
    80003f8c:	00600e93          	li	t4,6
    80003f90:	e6dff06f          	j	80003dfc <__memset+0x84>

0000000080003f94 <__memmove>:
    80003f94:	ff010113          	addi	sp,sp,-16
    80003f98:	00813423          	sd	s0,8(sp)
    80003f9c:	01010413          	addi	s0,sp,16
    80003fa0:	0e060863          	beqz	a2,80004090 <__memmove+0xfc>
    80003fa4:	fff6069b          	addiw	a3,a2,-1
    80003fa8:	0006881b          	sext.w	a6,a3
    80003fac:	0ea5e863          	bltu	a1,a0,8000409c <__memmove+0x108>
    80003fb0:	00758713          	addi	a4,a1,7
    80003fb4:	00a5e7b3          	or	a5,a1,a0
    80003fb8:	40a70733          	sub	a4,a4,a0
    80003fbc:	0077f793          	andi	a5,a5,7
    80003fc0:	00f73713          	sltiu	a4,a4,15
    80003fc4:	00174713          	xori	a4,a4,1
    80003fc8:	0017b793          	seqz	a5,a5
    80003fcc:	00e7f7b3          	and	a5,a5,a4
    80003fd0:	10078863          	beqz	a5,800040e0 <__memmove+0x14c>
    80003fd4:	00900793          	li	a5,9
    80003fd8:	1107f463          	bgeu	a5,a6,800040e0 <__memmove+0x14c>
    80003fdc:	0036581b          	srliw	a6,a2,0x3
    80003fe0:	fff8081b          	addiw	a6,a6,-1
    80003fe4:	02081813          	slli	a6,a6,0x20
    80003fe8:	01d85893          	srli	a7,a6,0x1d
    80003fec:	00858813          	addi	a6,a1,8
    80003ff0:	00058793          	mv	a5,a1
    80003ff4:	00050713          	mv	a4,a0
    80003ff8:	01088833          	add	a6,a7,a6
    80003ffc:	0007b883          	ld	a7,0(a5)
    80004000:	00878793          	addi	a5,a5,8
    80004004:	00870713          	addi	a4,a4,8
    80004008:	ff173c23          	sd	a7,-8(a4)
    8000400c:	ff0798e3          	bne	a5,a6,80003ffc <__memmove+0x68>
    80004010:	ff867713          	andi	a4,a2,-8
    80004014:	02071793          	slli	a5,a4,0x20
    80004018:	0207d793          	srli	a5,a5,0x20
    8000401c:	00f585b3          	add	a1,a1,a5
    80004020:	40e686bb          	subw	a3,a3,a4
    80004024:	00f507b3          	add	a5,a0,a5
    80004028:	06e60463          	beq	a2,a4,80004090 <__memmove+0xfc>
    8000402c:	0005c703          	lbu	a4,0(a1)
    80004030:	00e78023          	sb	a4,0(a5)
    80004034:	04068e63          	beqz	a3,80004090 <__memmove+0xfc>
    80004038:	0015c603          	lbu	a2,1(a1)
    8000403c:	00100713          	li	a4,1
    80004040:	00c780a3          	sb	a2,1(a5)
    80004044:	04e68663          	beq	a3,a4,80004090 <__memmove+0xfc>
    80004048:	0025c603          	lbu	a2,2(a1)
    8000404c:	00200713          	li	a4,2
    80004050:	00c78123          	sb	a2,2(a5)
    80004054:	02e68e63          	beq	a3,a4,80004090 <__memmove+0xfc>
    80004058:	0035c603          	lbu	a2,3(a1)
    8000405c:	00300713          	li	a4,3
    80004060:	00c781a3          	sb	a2,3(a5)
    80004064:	02e68663          	beq	a3,a4,80004090 <__memmove+0xfc>
    80004068:	0045c603          	lbu	a2,4(a1)
    8000406c:	00400713          	li	a4,4
    80004070:	00c78223          	sb	a2,4(a5)
    80004074:	00e68e63          	beq	a3,a4,80004090 <__memmove+0xfc>
    80004078:	0055c603          	lbu	a2,5(a1)
    8000407c:	00500713          	li	a4,5
    80004080:	00c782a3          	sb	a2,5(a5)
    80004084:	00e68663          	beq	a3,a4,80004090 <__memmove+0xfc>
    80004088:	0065c703          	lbu	a4,6(a1)
    8000408c:	00e78323          	sb	a4,6(a5)
    80004090:	00813403          	ld	s0,8(sp)
    80004094:	01010113          	addi	sp,sp,16
    80004098:	00008067          	ret
    8000409c:	02061713          	slli	a4,a2,0x20
    800040a0:	02075713          	srli	a4,a4,0x20
    800040a4:	00e587b3          	add	a5,a1,a4
    800040a8:	f0f574e3          	bgeu	a0,a5,80003fb0 <__memmove+0x1c>
    800040ac:	02069613          	slli	a2,a3,0x20
    800040b0:	02065613          	srli	a2,a2,0x20
    800040b4:	fff64613          	not	a2,a2
    800040b8:	00e50733          	add	a4,a0,a4
    800040bc:	00c78633          	add	a2,a5,a2
    800040c0:	fff7c683          	lbu	a3,-1(a5)
    800040c4:	fff78793          	addi	a5,a5,-1
    800040c8:	fff70713          	addi	a4,a4,-1
    800040cc:	00d70023          	sb	a3,0(a4)
    800040d0:	fec798e3          	bne	a5,a2,800040c0 <__memmove+0x12c>
    800040d4:	00813403          	ld	s0,8(sp)
    800040d8:	01010113          	addi	sp,sp,16
    800040dc:	00008067          	ret
    800040e0:	02069713          	slli	a4,a3,0x20
    800040e4:	02075713          	srli	a4,a4,0x20
    800040e8:	00170713          	addi	a4,a4,1
    800040ec:	00e50733          	add	a4,a0,a4
    800040f0:	00050793          	mv	a5,a0
    800040f4:	0005c683          	lbu	a3,0(a1)
    800040f8:	00178793          	addi	a5,a5,1
    800040fc:	00158593          	addi	a1,a1,1
    80004100:	fed78fa3          	sb	a3,-1(a5)
    80004104:	fee798e3          	bne	a5,a4,800040f4 <__memmove+0x160>
    80004108:	f89ff06f          	j	80004090 <__memmove+0xfc>

000000008000410c <__putc>:
    8000410c:	fe010113          	addi	sp,sp,-32
    80004110:	00813823          	sd	s0,16(sp)
    80004114:	00113c23          	sd	ra,24(sp)
    80004118:	02010413          	addi	s0,sp,32
    8000411c:	00050793          	mv	a5,a0
    80004120:	fef40593          	addi	a1,s0,-17
    80004124:	00100613          	li	a2,1
    80004128:	00000513          	li	a0,0
    8000412c:	fef407a3          	sb	a5,-17(s0)
    80004130:	fffff097          	auipc	ra,0xfffff
    80004134:	b3c080e7          	jalr	-1220(ra) # 80002c6c <console_write>
    80004138:	01813083          	ld	ra,24(sp)
    8000413c:	01013403          	ld	s0,16(sp)
    80004140:	02010113          	addi	sp,sp,32
    80004144:	00008067          	ret

0000000080004148 <__getc>:
    80004148:	fe010113          	addi	sp,sp,-32
    8000414c:	00813823          	sd	s0,16(sp)
    80004150:	00113c23          	sd	ra,24(sp)
    80004154:	02010413          	addi	s0,sp,32
    80004158:	fe840593          	addi	a1,s0,-24
    8000415c:	00100613          	li	a2,1
    80004160:	00000513          	li	a0,0
    80004164:	fffff097          	auipc	ra,0xfffff
    80004168:	ae8080e7          	jalr	-1304(ra) # 80002c4c <console_read>
    8000416c:	fe844503          	lbu	a0,-24(s0)
    80004170:	01813083          	ld	ra,24(sp)
    80004174:	01013403          	ld	s0,16(sp)
    80004178:	02010113          	addi	sp,sp,32
    8000417c:	00008067          	ret

0000000080004180 <console_handler>:
    80004180:	fe010113          	addi	sp,sp,-32
    80004184:	00813823          	sd	s0,16(sp)
    80004188:	00113c23          	sd	ra,24(sp)
    8000418c:	00913423          	sd	s1,8(sp)
    80004190:	02010413          	addi	s0,sp,32
    80004194:	14202773          	csrr	a4,scause
    80004198:	100027f3          	csrr	a5,sstatus
    8000419c:	0027f793          	andi	a5,a5,2
    800041a0:	06079e63          	bnez	a5,8000421c <console_handler+0x9c>
    800041a4:	00074c63          	bltz	a4,800041bc <console_handler+0x3c>
    800041a8:	01813083          	ld	ra,24(sp)
    800041ac:	01013403          	ld	s0,16(sp)
    800041b0:	00813483          	ld	s1,8(sp)
    800041b4:	02010113          	addi	sp,sp,32
    800041b8:	00008067          	ret
    800041bc:	0ff77713          	andi	a4,a4,255
    800041c0:	00900793          	li	a5,9
    800041c4:	fef712e3          	bne	a4,a5,800041a8 <console_handler+0x28>
    800041c8:	ffffe097          	auipc	ra,0xffffe
    800041cc:	6dc080e7          	jalr	1756(ra) # 800028a4 <plic_claim>
    800041d0:	00a00793          	li	a5,10
    800041d4:	00050493          	mv	s1,a0
    800041d8:	02f50c63          	beq	a0,a5,80004210 <console_handler+0x90>
    800041dc:	fc0506e3          	beqz	a0,800041a8 <console_handler+0x28>
    800041e0:	00050593          	mv	a1,a0
    800041e4:	00001517          	auipc	a0,0x1
    800041e8:	0e450513          	addi	a0,a0,228 # 800052c8 <_ZZ12printIntegermE6digits+0x2a8>
    800041ec:	fffff097          	auipc	ra,0xfffff
    800041f0:	afc080e7          	jalr	-1284(ra) # 80002ce8 <__printf>
    800041f4:	01013403          	ld	s0,16(sp)
    800041f8:	01813083          	ld	ra,24(sp)
    800041fc:	00048513          	mv	a0,s1
    80004200:	00813483          	ld	s1,8(sp)
    80004204:	02010113          	addi	sp,sp,32
    80004208:	ffffe317          	auipc	t1,0xffffe
    8000420c:	6d430067          	jr	1748(t1) # 800028dc <plic_complete>
    80004210:	fffff097          	auipc	ra,0xfffff
    80004214:	3e0080e7          	jalr	992(ra) # 800035f0 <uartintr>
    80004218:	fddff06f          	j	800041f4 <console_handler+0x74>
    8000421c:	00001517          	auipc	a0,0x1
    80004220:	1ac50513          	addi	a0,a0,428 # 800053c8 <digits+0x78>
    80004224:	fffff097          	auipc	ra,0xfffff
    80004228:	a68080e7          	jalr	-1432(ra) # 80002c8c <panic>
	...
