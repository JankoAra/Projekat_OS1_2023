
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00006117          	auipc	sp,0x6
    80000004:	a7813103          	ld	sp,-1416(sp) # 80005a78 <_GLOBAL_OFFSET_TABLE_+0x10>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	020020ef          	jal	ra,8000203c <start>

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
    80001184:	5ec000ef          	jal	ra,80001770 <interruptRoutine>
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
    800012cc:	99c080e7          	jalr	-1636(ra) # 80001c64 <_ZN15MemoryAllocator7kmallocEm>
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
    80001448:	cb8080e7          	jalr	-840(ra) # 800040fc <__putc>
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
    80001488:	c78080e7          	jalr	-904(ra) # 800040fc <__putc>
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
    80001510:	bf0080e7          	jalr	-1040(ra) # 800040fc <__putc>
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
    8000153c:	5a87b783          	ld	a5,1448(a5) # 80005ae0 <_ZN9Scheduler4tailE>
    80001540:	00078e63          	beqz	a5,8000155c <_ZN9Scheduler3putEP3TCB+0x30>
		head = tail = tcb;
	} else {
		tail->nextInScheduler = tcb;
    80001544:	02a7bc23          	sd	a0,56(a5)
		tail = tcb;
    80001548:	00004797          	auipc	a5,0x4
    8000154c:	58a7bc23          	sd	a0,1432(a5) # 80005ae0 <_ZN9Scheduler4tailE>
	}
}
    80001550:	00813403          	ld	s0,8(sp)
    80001554:	01010113          	addi	sp,sp,16
    80001558:	00008067          	ret
		head = tail = tcb;
    8000155c:	00004797          	auipc	a5,0x4
    80001560:	58478793          	addi	a5,a5,1412 # 80005ae0 <_ZN9Scheduler4tailE>
    80001564:	00a7b023          	sd	a0,0(a5)
    80001568:	00a7b423          	sd	a0,8(a5)
    8000156c:	fe5ff06f          	j	80001550 <_ZN9Scheduler3putEP3TCB+0x24>

0000000080001570 <_ZN9Scheduler3getEv>:

TCB* Scheduler::get() {
    80001570:	ff010113          	addi	sp,sp,-16
    80001574:	00813423          	sd	s0,8(sp)
    80001578:	01010413          	addi	s0,sp,16
	TCB* firstThread = head;
    8000157c:	00004717          	auipc	a4,0x4
    80001580:	56470713          	addi	a4,a4,1380 # 80005ae0 <_ZN9Scheduler4tailE>
    80001584:	00873503          	ld	a0,8(a4)
	head = head->nextInScheduler;
    80001588:	03853783          	ld	a5,56(a0) # 1038 <_entry-0x7fffefc8>
    8000158c:	00f73423          	sd	a5,8(a4)
	if (head == nullptr) {
    80001590:	00078863          	beqz	a5,800015a0 <_ZN9Scheduler3getEv+0x30>
		tail = head = nullptr;
	}
	return firstThread;
    80001594:	00813403          	ld	s0,8(sp)
    80001598:	01010113          	addi	sp,sp,16
    8000159c:	00008067          	ret
		tail = head = nullptr;
    800015a0:	00073423          	sd	zero,8(a4)
    800015a4:	00073023          	sd	zero,0(a4)
	return firstThread;
    800015a8:	fedff06f          	j	80001594 <_ZN9Scheduler3getEv+0x24>

00000000800015ac <main>:
	TCB::yield();
	println("opet u niti 1");
}
uint64 sstatus;
#pragma GCC optimize("O0")
int main() {
    800015ac:	fe010113          	addi	sp,sp,-32
    800015b0:	00113c23          	sd	ra,24(sp)
    800015b4:	00813823          	sd	s0,16(sp)
    800015b8:	02010413          	addi	s0,sp,32

	__asm__ volatile("csrr %[status], sstatus":[status] "=r"(
			sstatus): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800015bc:	10002373          	csrr	t1,sstatus
    800015c0:	00004797          	auipc	a5,0x4
    800015c4:	53078793          	addi	a5,a5,1328 # 80005af0 <sstatus>
    800015c8:	0067b023          	sd	t1,0(a5)
	//zabrani prekide
	Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    800015cc:	00200513          	li	a0,2
    800015d0:	00000097          	auipc	ra,0x0
    800015d4:	168080e7          	jalr	360(ra) # 80001738 <_ZN5Riscv10mc_sstatusEm>
	__asm__ volatile("csrr %[status], sstatus":[status] "=r"(
			sstatus): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800015d8:	10002373          	csrr	t1,sstatus
    800015dc:	00004797          	auipc	a5,0x4
    800015e0:	51478793          	addi	a5,a5,1300 # 80005af0 <sstatus>
    800015e4:	0067b023          	sd	t1,0(a5)
	//postavi adresu prekidne rutine u stvec
	Riscv::w_stvec((uint64)&interruptHandler);
    800015e8:	00004797          	auipc	a5,0x4
    800015ec:	4a87b783          	ld	a5,1192(a5) # 80005a90 <_GLOBAL_OFFSET_TABLE_+0x28>
    800015f0:	00078513          	mv	a0,a5
    800015f4:	00000097          	auipc	ra,0x0
    800015f8:	10c080e7          	jalr	268(ra) # 80001700 <_ZN5Riscv7w_stvecEm>
	__asm__ volatile("csrr %[status], sstatus":[status] "=r"(
			sstatus): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800015fc:	10002373          	csrr	t1,sstatus
    80001600:	00004797          	auipc	a5,0x4
    80001604:	4f078793          	addi	a5,a5,1264 # 80005af0 <sstatus>
    80001608:	0067b023          	sd	t1,0(a5)
//	printInteger(*(lista->peekFirst()));
//	delete lista;
//	println("");

	//testiranje kreiranja niti
	thread_t glavnaNit = nullptr;
    8000160c:	fe043423          	sd	zero,-24(s0)
	thread_t nit1 = nullptr;
    80001610:	fe043023          	sd	zero,-32(s0)
	thread_create(&glavnaNit, nullptr, nullptr);
    80001614:	fe840793          	addi	a5,s0,-24
    80001618:	00000613          	li	a2,0
    8000161c:	00000593          	li	a1,0
    80001620:	00078513          	mv	a0,a5
    80001624:	00000097          	auipc	ra,0x0
    80001628:	c74080e7          	jalr	-908(ra) # 80001298 <_Z13thread_createPP3TCBPFvPvES2_>
	TCB::running = glavnaNit;
    8000162c:	fe843703          	ld	a4,-24(s0)
    80001630:	00004797          	auipc	a5,0x4
    80001634:	4507b783          	ld	a5,1104(a5) # 80005a80 <_GLOBAL_OFFSET_TABLE_+0x18>
    80001638:	00e7b023          	sd	a4,0(a5)
	thread_create(&nit1, nit1f, nullptr);
    8000163c:	fe040793          	addi	a5,s0,-32
    80001640:	00000613          	li	a2,0
    80001644:	00000597          	auipc	a1,0x0
    80001648:	07458593          	addi	a1,a1,116 # 800016b8 <_Z5nit1fPv>
    8000164c:	00078513          	mv	a0,a5
    80001650:	00000097          	auipc	ra,0x0
    80001654:	c48080e7          	jalr	-952(ra) # 80001298 <_Z13thread_createPP3TCBPFvPvES2_>
	while(!nit1->isFinished()){
    80001658:	fe043783          	ld	a5,-32(s0)
    8000165c:	00078513          	mv	a0,a5
    80001660:	00000097          	auipc	ra,0x0
    80001664:	0f4080e7          	jalr	244(ra) # 80001754 <_ZN3TCB10isFinishedEv>
    80001668:	00050793          	mv	a5,a0
    8000166c:	0017c793          	xori	a5,a5,1
    80001670:	0ff7f793          	andi	a5,a5,255
    80001674:	00078863          	beqz	a5,80001684 <main+0xd8>
		TCB::yield();
    80001678:	00000097          	auipc	ra,0x0
    8000167c:	560080e7          	jalr	1376(ra) # 80001bd8 <_ZN3TCB5yieldEv>
	while(!nit1->isFinished()){
    80001680:	fd9ff06f          	j	80001658 <main+0xac>
	}
	println("\nProsao while");
    80001684:	00004517          	auipc	a0,0x4
    80001688:	9ac50513          	addi	a0,a0,-1620 # 80005030 <_ZZ12printIntegermE6digits+0x10>
    8000168c:	00000097          	auipc	ra,0x0
    80001690:	ddc080e7          	jalr	-548(ra) # 80001468 <_Z7printlnPKc>

	//omoguci prekide
	Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
    80001694:	00200513          	li	a0,2
    80001698:	00000097          	auipc	ra,0x0
    8000169c:	084080e7          	jalr	132(ra) # 8000171c <_ZN5Riscv10ms_sstatusEm>
	return 0;
    800016a0:	00000793          	li	a5,0
    800016a4:	00078513          	mv	a0,a5
    800016a8:	01813083          	ld	ra,24(sp)
    800016ac:	01013403          	ld	s0,16(sp)
    800016b0:	02010113          	addi	sp,sp,32
    800016b4:	00008067          	ret

00000000800016b8 <_Z5nit1fPv>:
void nit1f(void*) {
    800016b8:	ff010113          	addi	sp,sp,-16
    800016bc:	00113423          	sd	ra,8(sp)
    800016c0:	00813023          	sd	s0,0(sp)
    800016c4:	01010413          	addi	s0,sp,16
	println("usao u nit 1");
    800016c8:	00004517          	auipc	a0,0x4
    800016cc:	97850513          	addi	a0,a0,-1672 # 80005040 <_ZZ12printIntegermE6digits+0x20>
    800016d0:	00000097          	auipc	ra,0x0
    800016d4:	d98080e7          	jalr	-616(ra) # 80001468 <_Z7printlnPKc>
	TCB::yield();
    800016d8:	00000097          	auipc	ra,0x0
    800016dc:	500080e7          	jalr	1280(ra) # 80001bd8 <_ZN3TCB5yieldEv>
	println("opet u niti 1");
    800016e0:	00004517          	auipc	a0,0x4
    800016e4:	97050513          	addi	a0,a0,-1680 # 80005050 <_ZZ12printIntegermE6digits+0x30>
    800016e8:	00000097          	auipc	ra,0x0
    800016ec:	d80080e7          	jalr	-640(ra) # 80001468 <_Z7printlnPKc>
}
    800016f0:	00813083          	ld	ra,8(sp)
    800016f4:	00013403          	ld	s0,0(sp)
    800016f8:	01010113          	addi	sp,sp,16
    800016fc:	00008067          	ret

0000000080001700 <_ZN5Riscv7w_stvecEm>:
	uint64 volatile stvec;
	__asm__ volatile("csrr %[stvec], stvec": [stvec] "=r"(stvec));
	return stvec;
}

inline void Riscv::w_stvec(uint64 stvec) {
    80001700:	ff010113          	addi	sp,sp,-16
    80001704:	00813423          	sd	s0,8(sp)
    80001708:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrw stvec, %[stvec]": :[stvec] "r"(stvec));
    8000170c:	10551073          	csrw	stvec,a0
}
    80001710:	00813403          	ld	s0,8(sp)
    80001714:	01010113          	addi	sp,sp,16
    80001718:	00008067          	ret

000000008000171c <_ZN5Riscv10ms_sstatusEm>:

inline void Riscv::w_sip(uint64 sip) {
	__asm__ volatile("csrw sip, %[sip]": :[sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask) {
    8000171c:	ff010113          	addi	sp,sp,-16
    80001720:	00813423          	sd	s0,8(sp)
    80001724:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80001728:	10052073          	csrs	sstatus,a0
}
    8000172c:	00813403          	ld	s0,8(sp)
    80001730:	01010113          	addi	sp,sp,16
    80001734:	00008067          	ret

0000000080001738 <_ZN5Riscv10mc_sstatusEm>:

inline void Riscv::mc_sstatus(uint64 mask) {
    80001738:	ff010113          	addi	sp,sp,-16
    8000173c:	00813423          	sd	s0,8(sp)
    80001740:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80001744:	10053073          	csrc	sstatus,a0
}
    80001748:	00813403          	ld	s0,8(sp)
    8000174c:	01010113          	addi	sp,sp,16
    80001750:	00008067          	ret

0000000080001754 <_ZN3TCB10isFinishedEv>:
	friend class Scheduler;
	using Body = void (*)(void*);

	static TCB* createThread(Body function, void* args, uint64* stack);

	bool isFinished() { return finished; }
    80001754:	ff010113          	addi	sp,sp,-16
    80001758:	00813423          	sd	s0,8(sp)
    8000175c:	01010413          	addi	s0,sp,16
    80001760:	03054503          	lbu	a0,48(a0)
    80001764:	00813403          	ld	s0,8(sp)
    80001768:	01010113          	addi	sp,sp,16
    8000176c:	00008067          	ret

0000000080001770 <interruptRoutine>:
#include "../h/syscall_c.hpp"
#include "../h/TCB.hpp"

#pragma GCC optimize("O0")

extern "C" void interruptRoutine() {
    80001770:	f6010113          	addi	sp,sp,-160
    80001774:	08113c23          	sd	ra,152(sp)
    80001778:	08813823          	sd	s0,144(sp)
    8000177c:	0a010413          	addi	s0,sp,160
	//uint64 scause = Riscv::r_scause();
	//uint64 sepc = Riscv::r_sepc();
	uint64 scause, sepc, sstatus;
	__asm__ volatile("csrr %[scause], scause":[scause] "=r"(scause): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001780:	14202373          	csrr	t1,scause
    80001784:	fe643423          	sd	t1,-24(s0)
	__asm__ volatile("csrr %[sepc], sepc":[sepc] "=r"(sepc): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001788:	14102373          	csrr	t1,sepc
    8000178c:	fe643023          	sd	t1,-32(s0)
	__asm__ volatile("csrr %[status], sstatus":[status] "=r"(
			sstatus): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001790:	10002373          	csrr	t1,sstatus
    80001794:	fc643c23          	sd	t1,-40(s0)
	uint64 a0, a1, a2, a3, a4, a5, a6, a7;
	__asm__ volatile("mv %[ax], a0":[ax] "=r"(a0): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001798:	00050313          	mv	t1,a0
    8000179c:	fc643823          	sd	t1,-48(s0)
	__asm__ volatile("mv %[ax], a1":[ax] "=r"(a1): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800017a0:	00058313          	mv	t1,a1
    800017a4:	fc643423          	sd	t1,-56(s0)
	__asm__ volatile("mv %[ax], a2":[ax] "=r"(a2): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800017a8:	00060313          	mv	t1,a2
    800017ac:	fc643023          	sd	t1,-64(s0)
	__asm__ volatile("mv %[ax], a3":[ax] "=r"(a3): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800017b0:	00068313          	mv	t1,a3
    800017b4:	fa643c23          	sd	t1,-72(s0)
	__asm__ volatile("mv %[ax], a4":[ax] "=r"(a4): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800017b8:	00070313          	mv	t1,a4
    800017bc:	fa643823          	sd	t1,-80(s0)
	__asm__ volatile("mv %[ax], a5":[ax] "=r"(a5): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800017c0:	00078313          	mv	t1,a5
    800017c4:	fa643423          	sd	t1,-88(s0)
	__asm__ volatile("mv %[ax], a6":[ax] "=r"(a6): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800017c8:	00080313          	mv	t1,a6
    800017cc:	fa643023          	sd	t1,-96(s0)
	__asm__ volatile("mv %[ax], a7":[ax] "=r"(a7): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800017d0:	00088313          	mv	t1,a7
    800017d4:	f8643c23          	sd	t1,-104(s0)

	if (scause == 0x09 || scause == 0x08) {
    800017d8:	fe843703          	ld	a4,-24(s0)
    800017dc:	00900793          	li	a5,9
    800017e0:	00f70863          	beq	a4,a5,800017f0 <interruptRoutine+0x80>
    800017e4:	fe843703          	ld	a4,-24(s0)
    800017e8:	00800793          	li	a5,8
    800017ec:	16f71063          	bne	a4,a5,8000194c <interruptRoutine+0x1dc>
		//prekid zbog poziva ecall
		uint64 opCode = a0;
    800017f0:	fd043783          	ld	a5,-48(s0)
    800017f4:	f8f43823          	sd	a5,-112(s0)

		switch (opCode) {
    800017f8:	f9043703          	ld	a4,-112(s0)
    800017fc:	04200793          	li	a5,66
    80001800:	0ce7ea63          	bltu	a5,a4,800018d4 <interruptRoutine+0x164>
    80001804:	f9043783          	ld	a5,-112(s0)
    80001808:	00279713          	slli	a4,a5,0x2
    8000180c:	00004797          	auipc	a5,0x4
    80001810:	8b078793          	addi	a5,a5,-1872 # 800050bc <_ZZ12printIntegermE6digits+0x9c>
    80001814:	00f707b3          	add	a5,a4,a5
    80001818:	0007a783          	lw	a5,0(a5)
    8000181c:	0007871b          	sext.w	a4,a5
    80001820:	00004797          	auipc	a5,0x4
    80001824:	89c78793          	addi	a5,a5,-1892 # 800050bc <_ZZ12printIntegermE6digits+0x9c>
    80001828:	00f707b3          	add	a5,a4,a5
    8000182c:	00078067          	jr	a5
			case 0x01:
				//mem_alloc
				size_t size;
				size = (size_t)a1;
    80001830:	fc843783          	ld	a5,-56(s0)
    80001834:	f6f43023          	sd	a5,-160(s0)
				//__asm__ volatile("mv %[size], a1":[size] "=r"(size));
				size = size * MEM_BLOCK_SIZE;
    80001838:	f6043783          	ld	a5,-160(s0)
    8000183c:	00679793          	slli	a5,a5,0x6
    80001840:	f6f43023          	sd	a5,-160(s0)
				MemoryAllocator::kmalloc(size);
    80001844:	f6043503          	ld	a0,-160(s0)
    80001848:	00000097          	auipc	ra,0x0
    8000184c:	41c080e7          	jalr	1052(ra) # 80001c64 <_ZN15MemoryAllocator7kmallocEm>
				__asm__ volatile("sd a0, 80(s0)");
    80001850:	04a43823          	sd	a0,80(s0)
				break;
    80001854:	0dc0006f          	j	80001930 <interruptRoutine+0x1c0>
			case 0x02:
				//mem_free
				void* ptr;
				ptr = (void*)a1;
    80001858:	fc843783          	ld	a5,-56(s0)
    8000185c:	f6f43423          	sd	a5,-152(s0)
				//__asm__ volatile("mv %[ptr], a1" :[ptr]"=r"(ptr));
				MemoryAllocator::kfree(ptr);
    80001860:	f6843503          	ld	a0,-152(s0)
    80001864:	00000097          	auipc	ra,0x0
    80001868:	5a8080e7          	jalr	1448(ra) # 80001e0c <_ZN15MemoryAllocator5kfreeEPv>
				__asm__ volatile("sd a0, 80(s0)");
    8000186c:	04a43823          	sd	a0,80(s0)
				break;
    80001870:	0c00006f          	j	80001930 <interruptRoutine+0x1c0>
			case 0x11:
				//thread_create
				thread_t* handle;
				handle = (thread_t*)a1;
    80001874:	fc843783          	ld	a5,-56(s0)
    80001878:	f8f43423          	sd	a5,-120(s0)
				void (* function)(void*);
				function = (void (*)(void*))a2;
    8000187c:	fc043783          	ld	a5,-64(s0)
    80001880:	f8f43023          	sd	a5,-128(s0)
				void* args;
				args = (void*)a3;
    80001884:	fb843783          	ld	a5,-72(s0)
    80001888:	f6f43c23          	sd	a5,-136(s0)
				uint64* sp;
				sp = (uint64*)a4;
    8000188c:	fb043783          	ld	a5,-80(s0)
    80001890:	f6f43823          	sd	a5,-144(s0)

				*handle = TCB::createThread(function, args, sp);
    80001894:	f7043603          	ld	a2,-144(s0)
    80001898:	f7843583          	ld	a1,-136(s0)
    8000189c:	f8043503          	ld	a0,-128(s0)
    800018a0:	00000097          	auipc	ra,0x0
    800018a4:	208080e7          	jalr	520(ra) # 80001aa8 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    800018a8:	00050713          	mv	a4,a0
    800018ac:	f8843783          	ld	a5,-120(s0)
    800018b0:	00e7b023          	sd	a4,0(a5)
				if (*handle != nullptr) {
    800018b4:	f8843783          	ld	a5,-120(s0)
    800018b8:	0007b783          	ld	a5,0(a5)
    800018bc:	00078663          	beqz	a5,800018c8 <interruptRoutine+0x158>
					__asm__ volatile("li a0, 0");
    800018c0:	00000513          	li	a0,0
    800018c4:	0080006f          	j	800018cc <interruptRoutine+0x15c>
				} else {
					__asm__ volatile("li a0, -1");
    800018c8:	fff00513          	li	a0,-1
				}
				__asm__ volatile("sd a0, 80(s0)");
    800018cc:	04a43823          	sd	a0,80(s0)
				break;
    800018d0:	0600006f          	j	80001930 <interruptRoutine+0x1c0>
				break;
			case 0x42:
				//putc
				break;
			default:
				printString("\nNepostojeci op code: ");
    800018d4:	00003517          	auipc	a0,0x3
    800018d8:	78c50513          	addi	a0,a0,1932 # 80005060 <_ZZ12printIntegermE6digits+0x40>
    800018dc:	00000097          	auipc	ra,0x0
    800018e0:	b48080e7          	jalr	-1208(ra) # 80001424 <_Z11printStringPKc>
				printInteger(opCode);
    800018e4:	f9043503          	ld	a0,-112(s0)
    800018e8:	00000097          	auipc	ra,0x0
    800018ec:	bb4080e7          	jalr	-1100(ra) # 8000149c <_Z12printIntegerm>
				printString("\nscause: ");
    800018f0:	00003517          	auipc	a0,0x3
    800018f4:	78850513          	addi	a0,a0,1928 # 80005078 <_ZZ12printIntegermE6digits+0x58>
    800018f8:	00000097          	auipc	ra,0x0
    800018fc:	b2c080e7          	jalr	-1236(ra) # 80001424 <_Z11printStringPKc>
				printInteger(scause);
    80001900:	fe843503          	ld	a0,-24(s0)
    80001904:	00000097          	auipc	ra,0x0
    80001908:	b98080e7          	jalr	-1128(ra) # 8000149c <_Z12printIntegerm>
				printString("\nsepc: ");
    8000190c:	00003517          	auipc	a0,0x3
    80001910:	77c50513          	addi	a0,a0,1916 # 80005088 <_ZZ12printIntegermE6digits+0x68>
    80001914:	00000097          	auipc	ra,0x0
    80001918:	b10080e7          	jalr	-1264(ra) # 80001424 <_Z11printStringPKc>
				printInteger(sepc);
    8000191c:	fe043503          	ld	a0,-32(s0)
    80001920:	00000097          	auipc	ra,0x0
    80001924:	b7c080e7          	jalr	-1156(ra) # 8000149c <_Z12printIntegerm>
				break;
    80001928:	0080006f          	j	80001930 <interruptRoutine+0x1c0>
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
    80001948:	0900006f          	j	800019d8 <interruptRoutine+0x268>
	} else if (scause == (1UL << 63 | 9)) {
    8000194c:	fe843703          	ld	a4,-24(s0)
    80001950:	fff00793          	li	a5,-1
    80001954:	03f79793          	slli	a5,a5,0x3f
    80001958:	00978793          	addi	a5,a5,9
    8000195c:	00f71863          	bne	a4,a5,8000196c <interruptRoutine+0x1fc>
		console_handler();
    80001960:	00003097          	auipc	ra,0x3
    80001964:	810080e7          	jalr	-2032(ra) # 80004170 <console_handler>
}
    80001968:	0700006f          	j	800019d8 <interruptRoutine+0x268>
	} else if (scause == (1UL << 63 | 1)) {
    8000196c:	fe843703          	ld	a4,-24(s0)
    80001970:	fff00793          	li	a5,-1
    80001974:	03f79793          	slli	a5,a5,0x3f
    80001978:	00178793          	addi	a5,a5,1
    8000197c:	00f71a63          	bne	a4,a5,80001990 <interruptRoutine+0x220>
		Riscv::mc_sip(Riscv::SIP_SSIP);
    80001980:	00200513          	li	a0,2
    80001984:	00000097          	auipc	ra,0x0
    80001988:	068080e7          	jalr	104(ra) # 800019ec <_ZN5Riscv6mc_sipEm>
}
    8000198c:	04c0006f          	j	800019d8 <interruptRoutine+0x268>
		println("\nGreska u prekidnoj rutini");
    80001990:	00003517          	auipc	a0,0x3
    80001994:	70050513          	addi	a0,a0,1792 # 80005090 <_ZZ12printIntegermE6digits+0x70>
    80001998:	00000097          	auipc	ra,0x0
    8000199c:	ad0080e7          	jalr	-1328(ra) # 80001468 <_Z7printlnPKc>
		printString("scause: ");
    800019a0:	00003517          	auipc	a0,0x3
    800019a4:	71050513          	addi	a0,a0,1808 # 800050b0 <_ZZ12printIntegermE6digits+0x90>
    800019a8:	00000097          	auipc	ra,0x0
    800019ac:	a7c080e7          	jalr	-1412(ra) # 80001424 <_Z11printStringPKc>
		printInteger(scause);
    800019b0:	fe843503          	ld	a0,-24(s0)
    800019b4:	00000097          	auipc	ra,0x0
    800019b8:	ae8080e7          	jalr	-1304(ra) # 8000149c <_Z12printIntegerm>
		printString("\nsepc: ");
    800019bc:	00003517          	auipc	a0,0x3
    800019c0:	6cc50513          	addi	a0,a0,1740 # 80005088 <_ZZ12printIntegermE6digits+0x68>
    800019c4:	00000097          	auipc	ra,0x0
    800019c8:	a60080e7          	jalr	-1440(ra) # 80001424 <_Z11printStringPKc>
		printInteger(sepc);
    800019cc:	fe043503          	ld	a0,-32(s0)
    800019d0:	00000097          	auipc	ra,0x0
    800019d4:	acc080e7          	jalr	-1332(ra) # 8000149c <_Z12printIntegerm>
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
    80001a1c:	810080e7          	jalr	-2032(ra) # 80001228 <_Z9mem_allocm>
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
    80001a44:	7e8080e7          	jalr	2024(ra) # 80001228 <_Z9mem_allocm>
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
    80001a6c:	800080e7          	jalr	-2048(ra) # 80001268 <_Z8mem_freePv>
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
    80001a94:	7d8080e7          	jalr	2008(ra) # 80001268 <_Z8mem_freePv>
    80001a98:	00813083          	ld	ra,8(sp)
    80001a9c:	00013403          	ld	s0,0(sp)
    80001aa0:	01010113          	addi	sp,sp,16
    80001aa4:	00008067          	ret

0000000080001aa8 <_ZN3TCB12createThreadEPFvPvES0_Pm>:
#include "../h/Scheduler.hpp"

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
    80001ad4:	04000513          	li	a0,64
    80001ad8:	00000097          	auipc	ra,0x0
    80001adc:	f30080e7          	jalr	-208(ra) # 80001a08 <_Znwm>
    80001ae0:	00050493          	mv	s1,a0
	bool blocked;            //da li je nit blokirana
	TCB* nextInScheduler;    // pokazivac na sledecu nit u Scheduler-u

	TCB(Body function, void* args, uint64* stack) : threadFunction(function), stack(stack), args(args),
													timeSlice(DEFAULT_TIME_SLICE), finished(false), blocked(false),
													nextInScheduler(nullptr) {
    80001ae4:	01353823          	sd	s3,16(a0)
    80001ae8:	01253c23          	sd	s2,24(a0)
    80001aec:	03453023          	sd	s4,32(a0)
    80001af0:	00200793          	li	a5,2
    80001af4:	02f53423          	sd	a5,40(a0)
    80001af8:	02050823          	sb	zero,48(a0)
    80001afc:	020508a3          	sb	zero,49(a0)
    80001b00:	02053c23          	sd	zero,56(a0)
		//formiranje pocetnog konteksta; specijalni uslovi za main funkciju kojoj se pocetni kontekst automatski formira
		uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
    80001b04:	04098a63          	beqz	s3,80001b58 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xb0>
    80001b08:	00000797          	auipc	a5,0x0
    80001b0c:	10878793          	addi	a5,a5,264 # 80001c10 <_ZN3TCB7wrapperEv>
		uint64 startSp = stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0;
    80001b10:	04090863          	beqz	s2,80001b60 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xb8>
    80001b14:	00008637          	lui	a2,0x8
    80001b18:	00c90933          	add	s2,s2,a2
		this->context.ra = startRa;
    80001b1c:	00f4b023          	sd	a5,0(s1)
		this->context.sp = startSp;
    80001b20:	0124b423          	sd	s2,8(s1)
	if (function != nullptr) Scheduler::put(newThread);
    80001b24:	00098863          	beqz	s3,80001b34 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x8c>
    80001b28:	00048513          	mv	a0,s1
    80001b2c:	00000097          	auipc	ra,0x0
    80001b30:	a00080e7          	jalr	-1536(ra) # 8000152c <_ZN9Scheduler3putEP3TCB>
	return newThread;
}
    80001b34:	00048513          	mv	a0,s1
    80001b38:	02813083          	ld	ra,40(sp)
    80001b3c:	02013403          	ld	s0,32(sp)
    80001b40:	01813483          	ld	s1,24(sp)
    80001b44:	01013903          	ld	s2,16(sp)
    80001b48:	00813983          	ld	s3,8(sp)
    80001b4c:	00013a03          	ld	s4,0(sp)
    80001b50:	03010113          	addi	sp,sp,48
    80001b54:	00008067          	ret
		uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
    80001b58:	00000793          	li	a5,0
    80001b5c:	fb5ff06f          	j	80001b10 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x68>
		uint64 startSp = stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0;
    80001b60:	00000913          	li	s2,0
    80001b64:	fb9ff06f          	j	80001b1c <_ZN3TCB12createThreadEPFvPvES0_Pm+0x74>

0000000080001b68 <_ZN3TCB8dispatchEv>:

void TCB::dispatch() {
    80001b68:	fe010113          	addi	sp,sp,-32
    80001b6c:	00113c23          	sd	ra,24(sp)
    80001b70:	00813823          	sd	s0,16(sp)
    80001b74:	00913423          	sd	s1,8(sp)
    80001b78:	02010413          	addi	s0,sp,32
	TCB* old = TCB::running;
    80001b7c:	00004497          	auipc	s1,0x4
    80001b80:	f7c4b483          	ld	s1,-132(s1) # 80005af8 <_ZN3TCB7runningE>
	bool isFinished() { return finished; }
    80001b84:	0304c783          	lbu	a5,48(s1)
	if (!old->isFinished() && !old->isBlocked()) {
    80001b88:	00079663          	bnez	a5,80001b94 <_ZN3TCB8dispatchEv+0x2c>
	bool isBlocked() { return blocked; }
    80001b8c:	0314c783          	lbu	a5,49(s1)
    80001b90:	02078c63          	beqz	a5,80001bc8 <_ZN3TCB8dispatchEv+0x60>
		Scheduler::put(old);
	}
	TCB::running = Scheduler::get();
    80001b94:	00000097          	auipc	ra,0x0
    80001b98:	9dc080e7          	jalr	-1572(ra) # 80001570 <_ZN9Scheduler3getEv>
    80001b9c:	00050593          	mv	a1,a0
    80001ba0:	00004797          	auipc	a5,0x4
    80001ba4:	f4a7bc23          	sd	a0,-168(a5) # 80005af8 <_ZN3TCB7runningE>
	TCB::contextSwitch(&old->context, &running->context);
    80001ba8:	00048513          	mv	a0,s1
    80001bac:	fffff097          	auipc	ra,0xfffff
    80001bb0:	668080e7          	jalr	1640(ra) # 80001214 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80001bb4:	01813083          	ld	ra,24(sp)
    80001bb8:	01013403          	ld	s0,16(sp)
    80001bbc:	00813483          	ld	s1,8(sp)
    80001bc0:	02010113          	addi	sp,sp,32
    80001bc4:	00008067          	ret
		Scheduler::put(old);
    80001bc8:	00048513          	mv	a0,s1
    80001bcc:	00000097          	auipc	ra,0x0
    80001bd0:	960080e7          	jalr	-1696(ra) # 8000152c <_ZN9Scheduler3putEP3TCB>
    80001bd4:	fc1ff06f          	j	80001b94 <_ZN3TCB8dispatchEv+0x2c>

0000000080001bd8 <_ZN3TCB5yieldEv>:

void TCB::yield() {
    80001bd8:	ff010113          	addi	sp,sp,-16
    80001bdc:	00113423          	sd	ra,8(sp)
    80001be0:	00813023          	sd	s0,0(sp)
    80001be4:	01010413          	addi	s0,sp,16
	Riscv::pushRegisters();
    80001be8:	fffff097          	auipc	ra,0xfffff
    80001bec:	418080e7          	jalr	1048(ra) # 80001000 <_ZN5Riscv13pushRegistersEv>
	TCB::dispatch();
    80001bf0:	00000097          	auipc	ra,0x0
    80001bf4:	f78080e7          	jalr	-136(ra) # 80001b68 <_ZN3TCB8dispatchEv>
	Riscv::popRegisters();
    80001bf8:	fffff097          	auipc	ra,0xfffff
    80001bfc:	484080e7          	jalr	1156(ra) # 8000107c <_ZN5Riscv12popRegistersEv>
}
    80001c00:	00813083          	ld	ra,8(sp)
    80001c04:	00013403          	ld	s0,0(sp)
    80001c08:	01010113          	addi	sp,sp,16
    80001c0c:	00008067          	ret

0000000080001c10 <_ZN3TCB7wrapperEv>:

void TCB::wrapper() {
    80001c10:	fe010113          	addi	sp,sp,-32
    80001c14:	00113c23          	sd	ra,24(sp)
    80001c18:	00813823          	sd	s0,16(sp)
    80001c1c:	00913423          	sd	s1,8(sp)
    80001c20:	02010413          	addi	s0,sp,32
	running->threadFunction(running->args);
    80001c24:	00004497          	auipc	s1,0x4
    80001c28:	ed448493          	addi	s1,s1,-300 # 80005af8 <_ZN3TCB7runningE>
    80001c2c:	0004b783          	ld	a5,0(s1)
    80001c30:	0107b703          	ld	a4,16(a5)
    80001c34:	0207b503          	ld	a0,32(a5)
    80001c38:	000700e7          	jalr	a4
	running->finished = true;
    80001c3c:	0004b783          	ld	a5,0(s1)
    80001c40:	00100713          	li	a4,1
    80001c44:	02e78823          	sb	a4,48(a5)
	TCB::yield();
    80001c48:	00000097          	auipc	ra,0x0
    80001c4c:	f90080e7          	jalr	-112(ra) # 80001bd8 <_ZN3TCB5yieldEv>
}
    80001c50:	01813083          	ld	ra,24(sp)
    80001c54:	01013403          	ld	s0,16(sp)
    80001c58:	00813483          	ld	s1,8(sp)
    80001c5c:	02010113          	addi	sp,sp,32
    80001c60:	00008067          	ret

0000000080001c64 <_ZN15MemoryAllocator7kmallocEm>:

bool MemoryAllocator::initialized = false;
MemoryAllocator::FreeMemSegment* MemoryAllocator::freeMemHead = nullptr;
MemoryAllocator::UsedMemSegment* MemoryAllocator::usedMemHead = nullptr;

void* MemoryAllocator::kmalloc(size_t size) {
    80001c64:	ff010113          	addi	sp,sp,-16
    80001c68:	00813423          	sd	s0,8(sp)
    80001c6c:	01010413          	addi	s0,sp,16
	if (size <= 0) return nullptr;
    80001c70:	12050663          	beqz	a0,80001d9c <_ZN15MemoryAllocator7kmallocEm+0x138>

	//pocetna inicijalizacija
	if (!initialized) {
    80001c74:	00004797          	auipc	a5,0x4
    80001c78:	e947c783          	lbu	a5,-364(a5) # 80005b08 <_ZN15MemoryAllocator11initializedE>
    80001c7c:	04079863          	bnez	a5,80001ccc <_ZN15MemoryAllocator7kmallocEm+0x68>
		freeMemHead = (FreeMemSegment*)HEAP_START_ADDR;
    80001c80:	00004617          	auipc	a2,0x4
    80001c84:	df063603          	ld	a2,-528(a2) # 80005a70 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001c88:	00063783          	ld	a5,0(a2)
    80001c8c:	00004717          	auipc	a4,0x4
    80001c90:	e7c70713          	addi	a4,a4,-388 # 80005b08 <_ZN15MemoryAllocator11initializedE>
    80001c94:	00f73423          	sd	a5,8(a4)
		freeMemHead->next = nullptr;
    80001c98:	0007b023          	sd	zero,0(a5)
		freeMemHead->prev = nullptr;
    80001c9c:	00873683          	ld	a3,8(a4)
    80001ca0:	0006b423          	sd	zero,8(a3)
		freeMemHead->size = (char*)HEAP_END_ADDR - (char*)HEAP_START_ADDR - sizeof(FreeMemSegment);
    80001ca4:	00004797          	auipc	a5,0x4
    80001ca8:	de47b783          	ld	a5,-540(a5) # 80005a88 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001cac:	0007b783          	ld	a5,0(a5)
    80001cb0:	00063603          	ld	a2,0(a2)
    80001cb4:	40c787b3          	sub	a5,a5,a2
    80001cb8:	fe878793          	addi	a5,a5,-24
    80001cbc:	00f6b823          	sd	a5,16(a3)
		usedMemHead = nullptr;
    80001cc0:	00073823          	sd	zero,16(a4)

		initialized = true;
    80001cc4:	00100793          	li	a5,1
    80001cc8:	00f70023          	sb	a5,0(a4)
	}

	//alokacija uvek zaokruzena na blokove
	//size += sizeof(UsedMemSegment); ;prebaceno u mem_alloc
	size_t blocks = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
    80001ccc:	00655793          	srli	a5,a0,0x6
    80001cd0:	03f57513          	andi	a0,a0,63
    80001cd4:	00050463          	beqz	a0,80001cdc <_ZN15MemoryAllocator7kmallocEm+0x78>
    80001cd8:	00100513          	li	a0,1
    80001cdc:	00a78533          	add	a0,a5,a0
	size = blocks * MEM_BLOCK_SIZE;
    80001ce0:	00651793          	slli	a5,a0,0x6

	//trazenje slobodnog segmenta po first-fit algoritmu
	for (FreeMemSegment* current = freeMemHead; current; current = current->next) {
    80001ce4:	00004517          	auipc	a0,0x4
    80001ce8:	e2c53503          	ld	a0,-468(a0) # 80005b10 <_ZN15MemoryAllocator11freeMemHeadE>
    80001cec:	08050a63          	beqz	a0,80001d80 <_ZN15MemoryAllocator7kmallocEm+0x11c>
		if (current->size < size) continue;
    80001cf0:	01053703          	ld	a4,16(a0)
    80001cf4:	06f76263          	bltu	a4,a5,80001d58 <_ZN15MemoryAllocator7kmallocEm+0xf4>

		//pravljenje novog slobodnog fragmenta od ostatka fragmenta
		FreeMemSegment* remainderFree = (FreeMemSegment*)((char*)current + size);
    80001cf8:	00f506b3          	add	a3,a0,a5
		remainderFree->size = current->size - size;
    80001cfc:	40f70733          	sub	a4,a4,a5
    80001d00:	00e6b823          	sd	a4,16(a3)
		remainderFree->prev = current->prev;
    80001d04:	00853703          	ld	a4,8(a0)
    80001d08:	00e6b423          	sd	a4,8(a3)
		if (current->prev) current->prev->next = remainderFree;
    80001d0c:	00070463          	beqz	a4,80001d14 <_ZN15MemoryAllocator7kmallocEm+0xb0>
    80001d10:	00d73023          	sd	a3,0(a4)
		remainderFree->next = current->next;
    80001d14:	00053703          	ld	a4,0(a0)
    80001d18:	00e6b023          	sd	a4,0(a3)
		if (current->next) current->next->prev = remainderFree;
    80001d1c:	00070463          	beqz	a4,80001d24 <_ZN15MemoryAllocator7kmallocEm+0xc0>
    80001d20:	00d73423          	sd	a3,8(a4)
		if (freeMemHead == current) freeMemHead = remainderFree;
    80001d24:	00004717          	auipc	a4,0x4
    80001d28:	dec73703          	ld	a4,-532(a4) # 80005b10 <_ZN15MemoryAllocator11freeMemHeadE>
    80001d2c:	02a70a63          	beq	a4,a0,80001d60 <_ZN15MemoryAllocator7kmallocEm+0xfc>

		//ubacivanje novog fragmenta u listu zauzetih fragmenata
		UsedMemSegment* newFragment = (UsedMemSegment*)current;
		newFragment->size = size;
    80001d30:	00f53423          	sd	a5,8(a0)
		UsedMemSegment* prevUsed = nullptr;
		for (UsedMemSegment* cur = usedMemHead; cur && cur < newFragment; prevUsed = cur, cur = cur->next);
    80001d34:	00004697          	auipc	a3,0x4
    80001d38:	de46b683          	ld	a3,-540(a3) # 80005b18 <_ZN15MemoryAllocator11usedMemHeadE>
    80001d3c:	00068793          	mv	a5,a3
		UsedMemSegment* prevUsed = nullptr;
    80001d40:	00000713          	li	a4,0
		for (UsedMemSegment* cur = usedMemHead; cur && cur < newFragment; prevUsed = cur, cur = cur->next);
    80001d44:	02078463          	beqz	a5,80001d6c <_ZN15MemoryAllocator7kmallocEm+0x108>
    80001d48:	02a7f263          	bgeu	a5,a0,80001d6c <_ZN15MemoryAllocator7kmallocEm+0x108>
    80001d4c:	00078713          	mv	a4,a5
    80001d50:	0007b783          	ld	a5,0(a5)
    80001d54:	ff1ff06f          	j	80001d44 <_ZN15MemoryAllocator7kmallocEm+0xe0>
	for (FreeMemSegment* current = freeMemHead; current; current = current->next) {
    80001d58:	00053503          	ld	a0,0(a0)
    80001d5c:	f91ff06f          	j	80001cec <_ZN15MemoryAllocator7kmallocEm+0x88>
		if (freeMemHead == current) freeMemHead = remainderFree;
    80001d60:	00004717          	auipc	a4,0x4
    80001d64:	dad73823          	sd	a3,-592(a4) # 80005b10 <_ZN15MemoryAllocator11freeMemHeadE>
    80001d68:	fc9ff06f          	j	80001d30 <_ZN15MemoryAllocator7kmallocEm+0xcc>
		if (!prevUsed) {
    80001d6c:	02070063          	beqz	a4,80001d8c <_ZN15MemoryAllocator7kmallocEm+0x128>
			newFragment->next = usedMemHead;
			usedMemHead = newFragment;
		} else {
			newFragment->next = prevUsed->next;
    80001d70:	00073783          	ld	a5,0(a4)
    80001d74:	00f53023          	sd	a5,0(a0)
			prevUsed->next = newFragment;
    80001d78:	00a73023          	sd	a0,0(a4)
		}
		return (char*)newFragment + sizeof(UsedMemSegment);
    80001d7c:	01050513          	addi	a0,a0,16
	}
	return nullptr;
}
    80001d80:	00813403          	ld	s0,8(sp)
    80001d84:	01010113          	addi	sp,sp,16
    80001d88:	00008067          	ret
			newFragment->next = usedMemHead;
    80001d8c:	00d53023          	sd	a3,0(a0)
			usedMemHead = newFragment;
    80001d90:	00004797          	auipc	a5,0x4
    80001d94:	d8a7b423          	sd	a0,-632(a5) # 80005b18 <_ZN15MemoryAllocator11usedMemHeadE>
    80001d98:	fe5ff06f          	j	80001d7c <_ZN15MemoryAllocator7kmallocEm+0x118>
	if (size <= 0) return nullptr;
    80001d9c:	00000513          	li	a0,0
    80001da0:	fe1ff06f          	j	80001d80 <_ZN15MemoryAllocator7kmallocEm+0x11c>

0000000080001da4 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>:
	tryToJoin(newFree);
	tryToJoin(prevFree);
	return 0;
}

int MemoryAllocator::tryToJoin(MemoryAllocator::FreeMemSegment* current) {
    80001da4:	ff010113          	addi	sp,sp,-16
    80001da8:	00813423          	sd	s0,8(sp)
    80001dac:	01010413          	addi	s0,sp,16
	if (!current) return 0;
    80001db0:	04050663          	beqz	a0,80001dfc <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x58>
	bool nextExists = current->next != nullptr;
    80001db4:	00053783          	ld	a5,0(a0)
	char* nextAddr = (char*)current + current->size;
    80001db8:	01053703          	ld	a4,16(a0)
    80001dbc:	00e506b3          	add	a3,a0,a4
	char* cnext = (char*)current->next;
	bool nextIsConnected = (nextAddr == cnext);
	if (nextExists && nextIsConnected) {
    80001dc0:	04078263          	beqz	a5,80001e04 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x60>
    80001dc4:	00d78a63          	beq	a5,a3,80001dd8 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x34>
		current->size += current->next->size;
		current->next = current->next->next;
		if (current->next) current->next->prev = current;
		return 1;
	} else return 0;
    80001dc8:	00000513          	li	a0,0
}
    80001dcc:	00813403          	ld	s0,8(sp)
    80001dd0:	01010113          	addi	sp,sp,16
    80001dd4:	00008067          	ret
		current->size += current->next->size;
    80001dd8:	0107b683          	ld	a3,16(a5)
    80001ddc:	00d70733          	add	a4,a4,a3
    80001de0:	00e53823          	sd	a4,16(a0)
		current->next = current->next->next;
    80001de4:	0007b783          	ld	a5,0(a5)
    80001de8:	00f53023          	sd	a5,0(a0)
		if (current->next) current->next->prev = current;
    80001dec:	00078463          	beqz	a5,80001df4 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x50>
    80001df0:	00a7b423          	sd	a0,8(a5)
		return 1;
    80001df4:	00100513          	li	a0,1
    80001df8:	fd5ff06f          	j	80001dcc <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>
	if (!current) return 0;
    80001dfc:	00000513          	li	a0,0
    80001e00:	fcdff06f          	j	80001dcc <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>
	} else return 0;
    80001e04:	00000513          	li	a0,0
    80001e08:	fc5ff06f          	j	80001dcc <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>

0000000080001e0c <_ZN15MemoryAllocator5kfreeEPv>:
	if (!ptr) return 0;
    80001e0c:	10050463          	beqz	a0,80001f14 <_ZN15MemoryAllocator5kfreeEPv+0x108>
    80001e10:	00050693          	mv	a3,a0
	if (!usedMemHead) return -1;
    80001e14:	00004797          	auipc	a5,0x4
    80001e18:	d047b783          	ld	a5,-764(a5) # 80005b18 <_ZN15MemoryAllocator11usedMemHeadE>
    80001e1c:	10078063          	beqz	a5,80001f1c <_ZN15MemoryAllocator5kfreeEPv+0x110>
	ptr = (char*)ptr - sizeof(UsedMemSegment);
    80001e20:	ff050513          	addi	a0,a0,-16
	UsedMemSegment* prevUsed = nullptr;
    80001e24:	00000713          	li	a4,0
	for (; currentUsed && currentUsed != ptr; prevUsed = currentUsed, currentUsed = currentUsed->next);
    80001e28:	00078a63          	beqz	a5,80001e3c <_ZN15MemoryAllocator5kfreeEPv+0x30>
    80001e2c:	00a78863          	beq	a5,a0,80001e3c <_ZN15MemoryAllocator5kfreeEPv+0x30>
    80001e30:	00078713          	mv	a4,a5
    80001e34:	0007b783          	ld	a5,0(a5)
    80001e38:	ff1ff06f          	j	80001e28 <_ZN15MemoryAllocator5kfreeEPv+0x1c>
	if (currentUsed != ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    80001e3c:	0ea79463          	bne	a5,a0,80001f24 <_ZN15MemoryAllocator5kfreeEPv+0x118>
int MemoryAllocator::kfree(void* ptr) {
    80001e40:	fe010113          	addi	sp,sp,-32
    80001e44:	00113c23          	sd	ra,24(sp)
    80001e48:	00813823          	sd	s0,16(sp)
    80001e4c:	00913423          	sd	s1,8(sp)
    80001e50:	02010413          	addi	s0,sp,32
	if (prevUsed) prevUsed->next = currentUsed->next;
    80001e54:	02070863          	beqz	a4,80001e84 <_ZN15MemoryAllocator5kfreeEPv+0x78>
    80001e58:	0007b783          	ld	a5,0(a5)
    80001e5c:	00f73023          	sd	a5,0(a4)
	if (!freeMemHead || ptr < (char*)freeMemHead) {
    80001e60:	00004797          	auipc	a5,0x4
    80001e64:	cb07b783          	ld	a5,-848(a5) # 80005b10 <_ZN15MemoryAllocator11freeMemHeadE>
    80001e68:	02078663          	beqz	a5,80001e94 <_ZN15MemoryAllocator5kfreeEPv+0x88>
    80001e6c:	02f56863          	bltu	a0,a5,80001e9c <_ZN15MemoryAllocator5kfreeEPv+0x90>
			 prevFree->next != nullptr && ptr > (char*)(prevFree->next); prevFree = prevFree->next);
    80001e70:	00078493          	mv	s1,a5
    80001e74:	0007b783          	ld	a5,0(a5)
    80001e78:	02078463          	beqz	a5,80001ea0 <_ZN15MemoryAllocator5kfreeEPv+0x94>
    80001e7c:	fea7eae3          	bltu	a5,a0,80001e70 <_ZN15MemoryAllocator5kfreeEPv+0x64>
    80001e80:	0200006f          	j	80001ea0 <_ZN15MemoryAllocator5kfreeEPv+0x94>
	else usedMemHead = currentUsed->next;
    80001e84:	0007b783          	ld	a5,0(a5)
    80001e88:	00004717          	auipc	a4,0x4
    80001e8c:	c8f73823          	sd	a5,-880(a4) # 80005b18 <_ZN15MemoryAllocator11usedMemHeadE>
    80001e90:	fd1ff06f          	j	80001e60 <_ZN15MemoryAllocator5kfreeEPv+0x54>
		prevFree = nullptr;
    80001e94:	00078493          	mv	s1,a5
    80001e98:	0080006f          	j	80001ea0 <_ZN15MemoryAllocator5kfreeEPv+0x94>
    80001e9c:	00000493          	li	s1,0
	size_t segmentSize = ((UsedMemSegment*)ptr)->size;
    80001ea0:	ff86b783          	ld	a5,-8(a3)
	newFree->size = segmentSize;
    80001ea4:	00f6b023          	sd	a5,0(a3)
	newFree->prev = prevFree;
    80001ea8:	fe96bc23          	sd	s1,-8(a3)
	if (prevFree) newFree->next = prevFree->next;
    80001eac:	04048663          	beqz	s1,80001ef8 <_ZN15MemoryAllocator5kfreeEPv+0xec>
    80001eb0:	0004b783          	ld	a5,0(s1)
    80001eb4:	fef6b823          	sd	a5,-16(a3)
	if (newFree->next) newFree->next->prev = newFree;
    80001eb8:	ff06b783          	ld	a5,-16(a3)
    80001ebc:	00078463          	beqz	a5,80001ec4 <_ZN15MemoryAllocator5kfreeEPv+0xb8>
    80001ec0:	00a7b423          	sd	a0,8(a5)
	if (prevFree) prevFree->next = newFree;
    80001ec4:	04048263          	beqz	s1,80001f08 <_ZN15MemoryAllocator5kfreeEPv+0xfc>
    80001ec8:	00a4b023          	sd	a0,0(s1)
	tryToJoin(newFree);
    80001ecc:	00000097          	auipc	ra,0x0
    80001ed0:	ed8080e7          	jalr	-296(ra) # 80001da4 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
	tryToJoin(prevFree);
    80001ed4:	00048513          	mv	a0,s1
    80001ed8:	00000097          	auipc	ra,0x0
    80001edc:	ecc080e7          	jalr	-308(ra) # 80001da4 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
	return 0;
    80001ee0:	00000513          	li	a0,0
}
    80001ee4:	01813083          	ld	ra,24(sp)
    80001ee8:	01013403          	ld	s0,16(sp)
    80001eec:	00813483          	ld	s1,8(sp)
    80001ef0:	02010113          	addi	sp,sp,32
    80001ef4:	00008067          	ret
	else newFree->next = freeMemHead;
    80001ef8:	00004797          	auipc	a5,0x4
    80001efc:	c187b783          	ld	a5,-1000(a5) # 80005b10 <_ZN15MemoryAllocator11freeMemHeadE>
    80001f00:	fef6b823          	sd	a5,-16(a3)
    80001f04:	fb5ff06f          	j	80001eb8 <_ZN15MemoryAllocator5kfreeEPv+0xac>
	else freeMemHead = newFree;
    80001f08:	00004797          	auipc	a5,0x4
    80001f0c:	c0a7b423          	sd	a0,-1016(a5) # 80005b10 <_ZN15MemoryAllocator11freeMemHeadE>
    80001f10:	fbdff06f          	j	80001ecc <_ZN15MemoryAllocator5kfreeEPv+0xc0>
	if (!ptr) return 0;
    80001f14:	00000513          	li	a0,0
    80001f18:	00008067          	ret
	if (!usedMemHead) return -1;
    80001f1c:	fff00513          	li	a0,-1
    80001f20:	00008067          	ret
	if (currentUsed != ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    80001f24:	fff00513          	li	a0,-1
}
    80001f28:	00008067          	ret

0000000080001f2c <_Z10testMemoryv>:
// Created by os on 5/29/23.
//
#include "../h/MemoryAllocator.hpp"
#include "../h/helper.hpp"

void testMemory() {
    80001f2c:	81010113          	addi	sp,sp,-2032
    80001f30:	7e113423          	sd	ra,2024(sp)
    80001f34:	7e813023          	sd	s0,2016(sp)
    80001f38:	7c913c23          	sd	s1,2008(sp)
    80001f3c:	7f010413          	addi	s0,sp,2032
    80001f40:	83010113          	addi	sp,sp,-2000
	const uint64 NumAllocations = 500;    //zasto nece za preko 500????
	const uint64 AllocationSize = 16;

	// Allocate and initialize pointers
	int* allocations[NumAllocations];
	for (uint64 i = 0; i < NumAllocations; ++i)
    80001f44:	00000713          	li	a4,0
    80001f48:	1f300793          	li	a5,499
    80001f4c:	02e7e263          	bltu	a5,a4,80001f70 <_Z10testMemoryv+0x44>
		allocations[i] = nullptr;
    80001f50:	fffff7b7          	lui	a5,0xfffff
    80001f54:	00371693          	slli	a3,a4,0x3
    80001f58:	fe040613          	addi	a2,s0,-32
    80001f5c:	00f607b3          	add	a5,a2,a5
    80001f60:	00d787b3          	add	a5,a5,a3
    80001f64:	0607b023          	sd	zero,96(a5) # fffffffffffff060 <end+0xffffffff7fff82e0>
	for (uint64 i = 0; i < NumAllocations; ++i)
    80001f68:	00170713          	addi	a4,a4,1
    80001f6c:	fddff06f          	j	80001f48 <_Z10testMemoryv+0x1c>

	// Allocate memory
	for (uint64 i = 0; i < NumAllocations; ++i) {
    80001f70:	00000493          	li	s1,0
    80001f74:	1f300793          	li	a5,499
    80001f78:	0497e863          	bltu	a5,s1,80001fc8 <_Z10testMemoryv+0x9c>
		allocations[i] = static_cast<int*>(MemoryAllocator::kmalloc(AllocationSize));
    80001f7c:	01000513          	li	a0,16
    80001f80:	00000097          	auipc	ra,0x0
    80001f84:	ce4080e7          	jalr	-796(ra) # 80001c64 <_ZN15MemoryAllocator7kmallocEm>
    80001f88:	fffff737          	lui	a4,0xfffff
    80001f8c:	00349793          	slli	a5,s1,0x3
    80001f90:	fe040693          	addi	a3,s0,-32
    80001f94:	00e68733          	add	a4,a3,a4
    80001f98:	00f707b3          	add	a5,a4,a5
    80001f9c:	06a7b023          	sd	a0,96(a5)
		if (allocations[i] == nullptr) {
    80001fa0:	00050663          	beqz	a0,80001fac <_Z10testMemoryv+0x80>
	for (uint64 i = 0; i < NumAllocations; ++i) {
    80001fa4:	00148493          	addi	s1,s1,1
    80001fa8:	fcdff06f          	j	80001f74 <_Z10testMemoryv+0x48>
			printString("\nAllocation failed for index ");
    80001fac:	00003517          	auipc	a0,0x3
    80001fb0:	21c50513          	addi	a0,a0,540 # 800051c8 <_ZZ12printIntegermE6digits+0x1a8>
    80001fb4:	fffff097          	auipc	ra,0xfffff
    80001fb8:	470080e7          	jalr	1136(ra) # 80001424 <_Z11printStringPKc>
			printInteger(i);
    80001fbc:	00048513          	mv	a0,s1
    80001fc0:	fffff097          	auipc	ra,0xfffff
    80001fc4:	4dc080e7          	jalr	1244(ra) # 8000149c <_Z12printIntegerm>
	for (uint64 i = 0; i < NumAllocations; ++i) {
    80001fc8:	00000493          	li	s1,0
    80001fcc:	0240006f          	j	80001ff0 <_Z10testMemoryv+0xc4>

	// Free memory
	for (uint64 i = 0; i < NumAllocations; ++i) {
		if (allocations[i] != nullptr) {
			if (MemoryAllocator::kfree(allocations[i]) != 0) {
				printString("\nDeallocation failed for index ");
    80001fd0:	00003517          	auipc	a0,0x3
    80001fd4:	21850513          	addi	a0,a0,536 # 800051e8 <_ZZ12printIntegermE6digits+0x1c8>
    80001fd8:	fffff097          	auipc	ra,0xfffff
    80001fdc:	44c080e7          	jalr	1100(ra) # 80001424 <_Z11printStringPKc>
				printInteger(i);
    80001fe0:	00048513          	mv	a0,s1
    80001fe4:	fffff097          	auipc	ra,0xfffff
    80001fe8:	4b8080e7          	jalr	1208(ra) # 8000149c <_Z12printIntegerm>
	for (uint64 i = 0; i < NumAllocations; ++i) {
    80001fec:	00148493          	addi	s1,s1,1
    80001ff0:	1f300793          	li	a5,499
    80001ff4:	0297e863          	bltu	a5,s1,80002024 <_Z10testMemoryv+0xf8>
		if (allocations[i] != nullptr) {
    80001ff8:	fffff737          	lui	a4,0xfffff
    80001ffc:	00349793          	slli	a5,s1,0x3
    80002000:	fe040693          	addi	a3,s0,-32
    80002004:	00e68733          	add	a4,a3,a4
    80002008:	00f707b3          	add	a5,a4,a5
    8000200c:	0607b503          	ld	a0,96(a5)
    80002010:	fc050ee3          	beqz	a0,80001fec <_Z10testMemoryv+0xc0>
			if (MemoryAllocator::kfree(allocations[i]) != 0) {
    80002014:	00000097          	auipc	ra,0x0
    80002018:	df8080e7          	jalr	-520(ra) # 80001e0c <_ZN15MemoryAllocator5kfreeEPv>
    8000201c:	fc0508e3          	beqz	a0,80001fec <_Z10testMemoryv+0xc0>
    80002020:	fb1ff06f          	j	80001fd0 <_Z10testMemoryv+0xa4>
			}
		}
	}
    80002024:	7d010113          	addi	sp,sp,2000
    80002028:	7e813083          	ld	ra,2024(sp)
    8000202c:	7e013403          	ld	s0,2016(sp)
    80002030:	7d813483          	ld	s1,2008(sp)
    80002034:	7f010113          	addi	sp,sp,2032
    80002038:	00008067          	ret

000000008000203c <start>:
    8000203c:	ff010113          	addi	sp,sp,-16
    80002040:	00813423          	sd	s0,8(sp)
    80002044:	01010413          	addi	s0,sp,16
    80002048:	300027f3          	csrr	a5,mstatus
    8000204c:	ffffe737          	lui	a4,0xffffe
    80002050:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff7a7f>
    80002054:	00e7f7b3          	and	a5,a5,a4
    80002058:	00001737          	lui	a4,0x1
    8000205c:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80002060:	00e7e7b3          	or	a5,a5,a4
    80002064:	30079073          	csrw	mstatus,a5
    80002068:	00000797          	auipc	a5,0x0
    8000206c:	16078793          	addi	a5,a5,352 # 800021c8 <system_main>
    80002070:	34179073          	csrw	mepc,a5
    80002074:	00000793          	li	a5,0
    80002078:	18079073          	csrw	satp,a5
    8000207c:	000107b7          	lui	a5,0x10
    80002080:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80002084:	30279073          	csrw	medeleg,a5
    80002088:	30379073          	csrw	mideleg,a5
    8000208c:	104027f3          	csrr	a5,sie
    80002090:	2227e793          	ori	a5,a5,546
    80002094:	10479073          	csrw	sie,a5
    80002098:	fff00793          	li	a5,-1
    8000209c:	00a7d793          	srli	a5,a5,0xa
    800020a0:	3b079073          	csrw	pmpaddr0,a5
    800020a4:	00f00793          	li	a5,15
    800020a8:	3a079073          	csrw	pmpcfg0,a5
    800020ac:	f14027f3          	csrr	a5,mhartid
    800020b0:	0200c737          	lui	a4,0x200c
    800020b4:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800020b8:	0007869b          	sext.w	a3,a5
    800020bc:	00269713          	slli	a4,a3,0x2
    800020c0:	000f4637          	lui	a2,0xf4
    800020c4:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800020c8:	00d70733          	add	a4,a4,a3
    800020cc:	0037979b          	slliw	a5,a5,0x3
    800020d0:	020046b7          	lui	a3,0x2004
    800020d4:	00d787b3          	add	a5,a5,a3
    800020d8:	00c585b3          	add	a1,a1,a2
    800020dc:	00371693          	slli	a3,a4,0x3
    800020e0:	00004717          	auipc	a4,0x4
    800020e4:	a4070713          	addi	a4,a4,-1472 # 80005b20 <timer_scratch>
    800020e8:	00b7b023          	sd	a1,0(a5)
    800020ec:	00d70733          	add	a4,a4,a3
    800020f0:	00f73c23          	sd	a5,24(a4)
    800020f4:	02c73023          	sd	a2,32(a4)
    800020f8:	34071073          	csrw	mscratch,a4
    800020fc:	00000797          	auipc	a5,0x0
    80002100:	6e478793          	addi	a5,a5,1764 # 800027e0 <timervec>
    80002104:	30579073          	csrw	mtvec,a5
    80002108:	300027f3          	csrr	a5,mstatus
    8000210c:	0087e793          	ori	a5,a5,8
    80002110:	30079073          	csrw	mstatus,a5
    80002114:	304027f3          	csrr	a5,mie
    80002118:	0807e793          	ori	a5,a5,128
    8000211c:	30479073          	csrw	mie,a5
    80002120:	f14027f3          	csrr	a5,mhartid
    80002124:	0007879b          	sext.w	a5,a5
    80002128:	00078213          	mv	tp,a5
    8000212c:	30200073          	mret
    80002130:	00813403          	ld	s0,8(sp)
    80002134:	01010113          	addi	sp,sp,16
    80002138:	00008067          	ret

000000008000213c <timerinit>:
    8000213c:	ff010113          	addi	sp,sp,-16
    80002140:	00813423          	sd	s0,8(sp)
    80002144:	01010413          	addi	s0,sp,16
    80002148:	f14027f3          	csrr	a5,mhartid
    8000214c:	0200c737          	lui	a4,0x200c
    80002150:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80002154:	0007869b          	sext.w	a3,a5
    80002158:	00269713          	slli	a4,a3,0x2
    8000215c:	000f4637          	lui	a2,0xf4
    80002160:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80002164:	00d70733          	add	a4,a4,a3
    80002168:	0037979b          	slliw	a5,a5,0x3
    8000216c:	020046b7          	lui	a3,0x2004
    80002170:	00d787b3          	add	a5,a5,a3
    80002174:	00c585b3          	add	a1,a1,a2
    80002178:	00371693          	slli	a3,a4,0x3
    8000217c:	00004717          	auipc	a4,0x4
    80002180:	9a470713          	addi	a4,a4,-1628 # 80005b20 <timer_scratch>
    80002184:	00b7b023          	sd	a1,0(a5)
    80002188:	00d70733          	add	a4,a4,a3
    8000218c:	00f73c23          	sd	a5,24(a4)
    80002190:	02c73023          	sd	a2,32(a4)
    80002194:	34071073          	csrw	mscratch,a4
    80002198:	00000797          	auipc	a5,0x0
    8000219c:	64878793          	addi	a5,a5,1608 # 800027e0 <timervec>
    800021a0:	30579073          	csrw	mtvec,a5
    800021a4:	300027f3          	csrr	a5,mstatus
    800021a8:	0087e793          	ori	a5,a5,8
    800021ac:	30079073          	csrw	mstatus,a5
    800021b0:	304027f3          	csrr	a5,mie
    800021b4:	0807e793          	ori	a5,a5,128
    800021b8:	30479073          	csrw	mie,a5
    800021bc:	00813403          	ld	s0,8(sp)
    800021c0:	01010113          	addi	sp,sp,16
    800021c4:	00008067          	ret

00000000800021c8 <system_main>:
    800021c8:	fe010113          	addi	sp,sp,-32
    800021cc:	00813823          	sd	s0,16(sp)
    800021d0:	00913423          	sd	s1,8(sp)
    800021d4:	00113c23          	sd	ra,24(sp)
    800021d8:	02010413          	addi	s0,sp,32
    800021dc:	00000097          	auipc	ra,0x0
    800021e0:	0c4080e7          	jalr	196(ra) # 800022a0 <cpuid>
    800021e4:	00004497          	auipc	s1,0x4
    800021e8:	8cc48493          	addi	s1,s1,-1844 # 80005ab0 <started>
    800021ec:	02050263          	beqz	a0,80002210 <system_main+0x48>
    800021f0:	0004a783          	lw	a5,0(s1)
    800021f4:	0007879b          	sext.w	a5,a5
    800021f8:	fe078ce3          	beqz	a5,800021f0 <system_main+0x28>
    800021fc:	0ff0000f          	fence
    80002200:	00003517          	auipc	a0,0x3
    80002204:	03850513          	addi	a0,a0,56 # 80005238 <_ZZ12printIntegermE6digits+0x218>
    80002208:	00001097          	auipc	ra,0x1
    8000220c:	a74080e7          	jalr	-1420(ra) # 80002c7c <panic>
    80002210:	00001097          	auipc	ra,0x1
    80002214:	9c8080e7          	jalr	-1592(ra) # 80002bd8 <consoleinit>
    80002218:	00001097          	auipc	ra,0x1
    8000221c:	154080e7          	jalr	340(ra) # 8000336c <printfinit>
    80002220:	00003517          	auipc	a0,0x3
    80002224:	0f850513          	addi	a0,a0,248 # 80005318 <_ZZ12printIntegermE6digits+0x2f8>
    80002228:	00001097          	auipc	ra,0x1
    8000222c:	ab0080e7          	jalr	-1360(ra) # 80002cd8 <__printf>
    80002230:	00003517          	auipc	a0,0x3
    80002234:	fd850513          	addi	a0,a0,-40 # 80005208 <_ZZ12printIntegermE6digits+0x1e8>
    80002238:	00001097          	auipc	ra,0x1
    8000223c:	aa0080e7          	jalr	-1376(ra) # 80002cd8 <__printf>
    80002240:	00003517          	auipc	a0,0x3
    80002244:	0d850513          	addi	a0,a0,216 # 80005318 <_ZZ12printIntegermE6digits+0x2f8>
    80002248:	00001097          	auipc	ra,0x1
    8000224c:	a90080e7          	jalr	-1392(ra) # 80002cd8 <__printf>
    80002250:	00001097          	auipc	ra,0x1
    80002254:	4a8080e7          	jalr	1192(ra) # 800036f8 <kinit>
    80002258:	00000097          	auipc	ra,0x0
    8000225c:	148080e7          	jalr	328(ra) # 800023a0 <trapinit>
    80002260:	00000097          	auipc	ra,0x0
    80002264:	16c080e7          	jalr	364(ra) # 800023cc <trapinithart>
    80002268:	00000097          	auipc	ra,0x0
    8000226c:	5b8080e7          	jalr	1464(ra) # 80002820 <plicinit>
    80002270:	00000097          	auipc	ra,0x0
    80002274:	5d8080e7          	jalr	1496(ra) # 80002848 <plicinithart>
    80002278:	00000097          	auipc	ra,0x0
    8000227c:	078080e7          	jalr	120(ra) # 800022f0 <userinit>
    80002280:	0ff0000f          	fence
    80002284:	00100793          	li	a5,1
    80002288:	00003517          	auipc	a0,0x3
    8000228c:	f9850513          	addi	a0,a0,-104 # 80005220 <_ZZ12printIntegermE6digits+0x200>
    80002290:	00f4a023          	sw	a5,0(s1)
    80002294:	00001097          	auipc	ra,0x1
    80002298:	a44080e7          	jalr	-1468(ra) # 80002cd8 <__printf>
    8000229c:	0000006f          	j	8000229c <system_main+0xd4>

00000000800022a0 <cpuid>:
    800022a0:	ff010113          	addi	sp,sp,-16
    800022a4:	00813423          	sd	s0,8(sp)
    800022a8:	01010413          	addi	s0,sp,16
    800022ac:	00020513          	mv	a0,tp
    800022b0:	00813403          	ld	s0,8(sp)
    800022b4:	0005051b          	sext.w	a0,a0
    800022b8:	01010113          	addi	sp,sp,16
    800022bc:	00008067          	ret

00000000800022c0 <mycpu>:
    800022c0:	ff010113          	addi	sp,sp,-16
    800022c4:	00813423          	sd	s0,8(sp)
    800022c8:	01010413          	addi	s0,sp,16
    800022cc:	00020793          	mv	a5,tp
    800022d0:	00813403          	ld	s0,8(sp)
    800022d4:	0007879b          	sext.w	a5,a5
    800022d8:	00779793          	slli	a5,a5,0x7
    800022dc:	00005517          	auipc	a0,0x5
    800022e0:	87450513          	addi	a0,a0,-1932 # 80006b50 <cpus>
    800022e4:	00f50533          	add	a0,a0,a5
    800022e8:	01010113          	addi	sp,sp,16
    800022ec:	00008067          	ret

00000000800022f0 <userinit>:
    800022f0:	ff010113          	addi	sp,sp,-16
    800022f4:	00813423          	sd	s0,8(sp)
    800022f8:	01010413          	addi	s0,sp,16
    800022fc:	00813403          	ld	s0,8(sp)
    80002300:	01010113          	addi	sp,sp,16
    80002304:	fffff317          	auipc	t1,0xfffff
    80002308:	2a830067          	jr	680(t1) # 800015ac <main>

000000008000230c <either_copyout>:
    8000230c:	ff010113          	addi	sp,sp,-16
    80002310:	00813023          	sd	s0,0(sp)
    80002314:	00113423          	sd	ra,8(sp)
    80002318:	01010413          	addi	s0,sp,16
    8000231c:	02051663          	bnez	a0,80002348 <either_copyout+0x3c>
    80002320:	00058513          	mv	a0,a1
    80002324:	00060593          	mv	a1,a2
    80002328:	0006861b          	sext.w	a2,a3
    8000232c:	00002097          	auipc	ra,0x2
    80002330:	c58080e7          	jalr	-936(ra) # 80003f84 <__memmove>
    80002334:	00813083          	ld	ra,8(sp)
    80002338:	00013403          	ld	s0,0(sp)
    8000233c:	00000513          	li	a0,0
    80002340:	01010113          	addi	sp,sp,16
    80002344:	00008067          	ret
    80002348:	00003517          	auipc	a0,0x3
    8000234c:	f1850513          	addi	a0,a0,-232 # 80005260 <_ZZ12printIntegermE6digits+0x240>
    80002350:	00001097          	auipc	ra,0x1
    80002354:	92c080e7          	jalr	-1748(ra) # 80002c7c <panic>

0000000080002358 <either_copyin>:
    80002358:	ff010113          	addi	sp,sp,-16
    8000235c:	00813023          	sd	s0,0(sp)
    80002360:	00113423          	sd	ra,8(sp)
    80002364:	01010413          	addi	s0,sp,16
    80002368:	02059463          	bnez	a1,80002390 <either_copyin+0x38>
    8000236c:	00060593          	mv	a1,a2
    80002370:	0006861b          	sext.w	a2,a3
    80002374:	00002097          	auipc	ra,0x2
    80002378:	c10080e7          	jalr	-1008(ra) # 80003f84 <__memmove>
    8000237c:	00813083          	ld	ra,8(sp)
    80002380:	00013403          	ld	s0,0(sp)
    80002384:	00000513          	li	a0,0
    80002388:	01010113          	addi	sp,sp,16
    8000238c:	00008067          	ret
    80002390:	00003517          	auipc	a0,0x3
    80002394:	ef850513          	addi	a0,a0,-264 # 80005288 <_ZZ12printIntegermE6digits+0x268>
    80002398:	00001097          	auipc	ra,0x1
    8000239c:	8e4080e7          	jalr	-1820(ra) # 80002c7c <panic>

00000000800023a0 <trapinit>:
    800023a0:	ff010113          	addi	sp,sp,-16
    800023a4:	00813423          	sd	s0,8(sp)
    800023a8:	01010413          	addi	s0,sp,16
    800023ac:	00813403          	ld	s0,8(sp)
    800023b0:	00003597          	auipc	a1,0x3
    800023b4:	f0058593          	addi	a1,a1,-256 # 800052b0 <_ZZ12printIntegermE6digits+0x290>
    800023b8:	00005517          	auipc	a0,0x5
    800023bc:	81850513          	addi	a0,a0,-2024 # 80006bd0 <tickslock>
    800023c0:	01010113          	addi	sp,sp,16
    800023c4:	00001317          	auipc	t1,0x1
    800023c8:	5c430067          	jr	1476(t1) # 80003988 <initlock>

00000000800023cc <trapinithart>:
    800023cc:	ff010113          	addi	sp,sp,-16
    800023d0:	00813423          	sd	s0,8(sp)
    800023d4:	01010413          	addi	s0,sp,16
    800023d8:	00000797          	auipc	a5,0x0
    800023dc:	2f878793          	addi	a5,a5,760 # 800026d0 <kernelvec>
    800023e0:	10579073          	csrw	stvec,a5
    800023e4:	00813403          	ld	s0,8(sp)
    800023e8:	01010113          	addi	sp,sp,16
    800023ec:	00008067          	ret

00000000800023f0 <usertrap>:
    800023f0:	ff010113          	addi	sp,sp,-16
    800023f4:	00813423          	sd	s0,8(sp)
    800023f8:	01010413          	addi	s0,sp,16
    800023fc:	00813403          	ld	s0,8(sp)
    80002400:	01010113          	addi	sp,sp,16
    80002404:	00008067          	ret

0000000080002408 <usertrapret>:
    80002408:	ff010113          	addi	sp,sp,-16
    8000240c:	00813423          	sd	s0,8(sp)
    80002410:	01010413          	addi	s0,sp,16
    80002414:	00813403          	ld	s0,8(sp)
    80002418:	01010113          	addi	sp,sp,16
    8000241c:	00008067          	ret

0000000080002420 <kerneltrap>:
    80002420:	fe010113          	addi	sp,sp,-32
    80002424:	00813823          	sd	s0,16(sp)
    80002428:	00113c23          	sd	ra,24(sp)
    8000242c:	00913423          	sd	s1,8(sp)
    80002430:	02010413          	addi	s0,sp,32
    80002434:	142025f3          	csrr	a1,scause
    80002438:	100027f3          	csrr	a5,sstatus
    8000243c:	0027f793          	andi	a5,a5,2
    80002440:	10079c63          	bnez	a5,80002558 <kerneltrap+0x138>
    80002444:	142027f3          	csrr	a5,scause
    80002448:	0207ce63          	bltz	a5,80002484 <kerneltrap+0x64>
    8000244c:	00003517          	auipc	a0,0x3
    80002450:	eac50513          	addi	a0,a0,-340 # 800052f8 <_ZZ12printIntegermE6digits+0x2d8>
    80002454:	00001097          	auipc	ra,0x1
    80002458:	884080e7          	jalr	-1916(ra) # 80002cd8 <__printf>
    8000245c:	141025f3          	csrr	a1,sepc
    80002460:	14302673          	csrr	a2,stval
    80002464:	00003517          	auipc	a0,0x3
    80002468:	ea450513          	addi	a0,a0,-348 # 80005308 <_ZZ12printIntegermE6digits+0x2e8>
    8000246c:	00001097          	auipc	ra,0x1
    80002470:	86c080e7          	jalr	-1940(ra) # 80002cd8 <__printf>
    80002474:	00003517          	auipc	a0,0x3
    80002478:	eac50513          	addi	a0,a0,-340 # 80005320 <_ZZ12printIntegermE6digits+0x300>
    8000247c:	00001097          	auipc	ra,0x1
    80002480:	800080e7          	jalr	-2048(ra) # 80002c7c <panic>
    80002484:	0ff7f713          	andi	a4,a5,255
    80002488:	00900693          	li	a3,9
    8000248c:	04d70063          	beq	a4,a3,800024cc <kerneltrap+0xac>
    80002490:	fff00713          	li	a4,-1
    80002494:	03f71713          	slli	a4,a4,0x3f
    80002498:	00170713          	addi	a4,a4,1
    8000249c:	fae798e3          	bne	a5,a4,8000244c <kerneltrap+0x2c>
    800024a0:	00000097          	auipc	ra,0x0
    800024a4:	e00080e7          	jalr	-512(ra) # 800022a0 <cpuid>
    800024a8:	06050663          	beqz	a0,80002514 <kerneltrap+0xf4>
    800024ac:	144027f3          	csrr	a5,sip
    800024b0:	ffd7f793          	andi	a5,a5,-3
    800024b4:	14479073          	csrw	sip,a5
    800024b8:	01813083          	ld	ra,24(sp)
    800024bc:	01013403          	ld	s0,16(sp)
    800024c0:	00813483          	ld	s1,8(sp)
    800024c4:	02010113          	addi	sp,sp,32
    800024c8:	00008067          	ret
    800024cc:	00000097          	auipc	ra,0x0
    800024d0:	3c8080e7          	jalr	968(ra) # 80002894 <plic_claim>
    800024d4:	00a00793          	li	a5,10
    800024d8:	00050493          	mv	s1,a0
    800024dc:	06f50863          	beq	a0,a5,8000254c <kerneltrap+0x12c>
    800024e0:	fc050ce3          	beqz	a0,800024b8 <kerneltrap+0x98>
    800024e4:	00050593          	mv	a1,a0
    800024e8:	00003517          	auipc	a0,0x3
    800024ec:	df050513          	addi	a0,a0,-528 # 800052d8 <_ZZ12printIntegermE6digits+0x2b8>
    800024f0:	00000097          	auipc	ra,0x0
    800024f4:	7e8080e7          	jalr	2024(ra) # 80002cd8 <__printf>
    800024f8:	01013403          	ld	s0,16(sp)
    800024fc:	01813083          	ld	ra,24(sp)
    80002500:	00048513          	mv	a0,s1
    80002504:	00813483          	ld	s1,8(sp)
    80002508:	02010113          	addi	sp,sp,32
    8000250c:	00000317          	auipc	t1,0x0
    80002510:	3c030067          	jr	960(t1) # 800028cc <plic_complete>
    80002514:	00004517          	auipc	a0,0x4
    80002518:	6bc50513          	addi	a0,a0,1724 # 80006bd0 <tickslock>
    8000251c:	00001097          	auipc	ra,0x1
    80002520:	490080e7          	jalr	1168(ra) # 800039ac <acquire>
    80002524:	00003717          	auipc	a4,0x3
    80002528:	59070713          	addi	a4,a4,1424 # 80005ab4 <ticks>
    8000252c:	00072783          	lw	a5,0(a4)
    80002530:	00004517          	auipc	a0,0x4
    80002534:	6a050513          	addi	a0,a0,1696 # 80006bd0 <tickslock>
    80002538:	0017879b          	addiw	a5,a5,1
    8000253c:	00f72023          	sw	a5,0(a4)
    80002540:	00001097          	auipc	ra,0x1
    80002544:	538080e7          	jalr	1336(ra) # 80003a78 <release>
    80002548:	f65ff06f          	j	800024ac <kerneltrap+0x8c>
    8000254c:	00001097          	auipc	ra,0x1
    80002550:	094080e7          	jalr	148(ra) # 800035e0 <uartintr>
    80002554:	fa5ff06f          	j	800024f8 <kerneltrap+0xd8>
    80002558:	00003517          	auipc	a0,0x3
    8000255c:	d6050513          	addi	a0,a0,-672 # 800052b8 <_ZZ12printIntegermE6digits+0x298>
    80002560:	00000097          	auipc	ra,0x0
    80002564:	71c080e7          	jalr	1820(ra) # 80002c7c <panic>

0000000080002568 <clockintr>:
    80002568:	fe010113          	addi	sp,sp,-32
    8000256c:	00813823          	sd	s0,16(sp)
    80002570:	00913423          	sd	s1,8(sp)
    80002574:	00113c23          	sd	ra,24(sp)
    80002578:	02010413          	addi	s0,sp,32
    8000257c:	00004497          	auipc	s1,0x4
    80002580:	65448493          	addi	s1,s1,1620 # 80006bd0 <tickslock>
    80002584:	00048513          	mv	a0,s1
    80002588:	00001097          	auipc	ra,0x1
    8000258c:	424080e7          	jalr	1060(ra) # 800039ac <acquire>
    80002590:	00003717          	auipc	a4,0x3
    80002594:	52470713          	addi	a4,a4,1316 # 80005ab4 <ticks>
    80002598:	00072783          	lw	a5,0(a4)
    8000259c:	01013403          	ld	s0,16(sp)
    800025a0:	01813083          	ld	ra,24(sp)
    800025a4:	00048513          	mv	a0,s1
    800025a8:	0017879b          	addiw	a5,a5,1
    800025ac:	00813483          	ld	s1,8(sp)
    800025b0:	00f72023          	sw	a5,0(a4)
    800025b4:	02010113          	addi	sp,sp,32
    800025b8:	00001317          	auipc	t1,0x1
    800025bc:	4c030067          	jr	1216(t1) # 80003a78 <release>

00000000800025c0 <devintr>:
    800025c0:	142027f3          	csrr	a5,scause
    800025c4:	00000513          	li	a0,0
    800025c8:	0007c463          	bltz	a5,800025d0 <devintr+0x10>
    800025cc:	00008067          	ret
    800025d0:	fe010113          	addi	sp,sp,-32
    800025d4:	00813823          	sd	s0,16(sp)
    800025d8:	00113c23          	sd	ra,24(sp)
    800025dc:	00913423          	sd	s1,8(sp)
    800025e0:	02010413          	addi	s0,sp,32
    800025e4:	0ff7f713          	andi	a4,a5,255
    800025e8:	00900693          	li	a3,9
    800025ec:	04d70c63          	beq	a4,a3,80002644 <devintr+0x84>
    800025f0:	fff00713          	li	a4,-1
    800025f4:	03f71713          	slli	a4,a4,0x3f
    800025f8:	00170713          	addi	a4,a4,1
    800025fc:	00e78c63          	beq	a5,a4,80002614 <devintr+0x54>
    80002600:	01813083          	ld	ra,24(sp)
    80002604:	01013403          	ld	s0,16(sp)
    80002608:	00813483          	ld	s1,8(sp)
    8000260c:	02010113          	addi	sp,sp,32
    80002610:	00008067          	ret
    80002614:	00000097          	auipc	ra,0x0
    80002618:	c8c080e7          	jalr	-884(ra) # 800022a0 <cpuid>
    8000261c:	06050663          	beqz	a0,80002688 <devintr+0xc8>
    80002620:	144027f3          	csrr	a5,sip
    80002624:	ffd7f793          	andi	a5,a5,-3
    80002628:	14479073          	csrw	sip,a5
    8000262c:	01813083          	ld	ra,24(sp)
    80002630:	01013403          	ld	s0,16(sp)
    80002634:	00813483          	ld	s1,8(sp)
    80002638:	00200513          	li	a0,2
    8000263c:	02010113          	addi	sp,sp,32
    80002640:	00008067          	ret
    80002644:	00000097          	auipc	ra,0x0
    80002648:	250080e7          	jalr	592(ra) # 80002894 <plic_claim>
    8000264c:	00a00793          	li	a5,10
    80002650:	00050493          	mv	s1,a0
    80002654:	06f50663          	beq	a0,a5,800026c0 <devintr+0x100>
    80002658:	00100513          	li	a0,1
    8000265c:	fa0482e3          	beqz	s1,80002600 <devintr+0x40>
    80002660:	00048593          	mv	a1,s1
    80002664:	00003517          	auipc	a0,0x3
    80002668:	c7450513          	addi	a0,a0,-908 # 800052d8 <_ZZ12printIntegermE6digits+0x2b8>
    8000266c:	00000097          	auipc	ra,0x0
    80002670:	66c080e7          	jalr	1644(ra) # 80002cd8 <__printf>
    80002674:	00048513          	mv	a0,s1
    80002678:	00000097          	auipc	ra,0x0
    8000267c:	254080e7          	jalr	596(ra) # 800028cc <plic_complete>
    80002680:	00100513          	li	a0,1
    80002684:	f7dff06f          	j	80002600 <devintr+0x40>
    80002688:	00004517          	auipc	a0,0x4
    8000268c:	54850513          	addi	a0,a0,1352 # 80006bd0 <tickslock>
    80002690:	00001097          	auipc	ra,0x1
    80002694:	31c080e7          	jalr	796(ra) # 800039ac <acquire>
    80002698:	00003717          	auipc	a4,0x3
    8000269c:	41c70713          	addi	a4,a4,1052 # 80005ab4 <ticks>
    800026a0:	00072783          	lw	a5,0(a4)
    800026a4:	00004517          	auipc	a0,0x4
    800026a8:	52c50513          	addi	a0,a0,1324 # 80006bd0 <tickslock>
    800026ac:	0017879b          	addiw	a5,a5,1
    800026b0:	00f72023          	sw	a5,0(a4)
    800026b4:	00001097          	auipc	ra,0x1
    800026b8:	3c4080e7          	jalr	964(ra) # 80003a78 <release>
    800026bc:	f65ff06f          	j	80002620 <devintr+0x60>
    800026c0:	00001097          	auipc	ra,0x1
    800026c4:	f20080e7          	jalr	-224(ra) # 800035e0 <uartintr>
    800026c8:	fadff06f          	j	80002674 <devintr+0xb4>
    800026cc:	0000                	unimp
	...

00000000800026d0 <kernelvec>:
    800026d0:	f0010113          	addi	sp,sp,-256
    800026d4:	00113023          	sd	ra,0(sp)
    800026d8:	00213423          	sd	sp,8(sp)
    800026dc:	00313823          	sd	gp,16(sp)
    800026e0:	00413c23          	sd	tp,24(sp)
    800026e4:	02513023          	sd	t0,32(sp)
    800026e8:	02613423          	sd	t1,40(sp)
    800026ec:	02713823          	sd	t2,48(sp)
    800026f0:	02813c23          	sd	s0,56(sp)
    800026f4:	04913023          	sd	s1,64(sp)
    800026f8:	04a13423          	sd	a0,72(sp)
    800026fc:	04b13823          	sd	a1,80(sp)
    80002700:	04c13c23          	sd	a2,88(sp)
    80002704:	06d13023          	sd	a3,96(sp)
    80002708:	06e13423          	sd	a4,104(sp)
    8000270c:	06f13823          	sd	a5,112(sp)
    80002710:	07013c23          	sd	a6,120(sp)
    80002714:	09113023          	sd	a7,128(sp)
    80002718:	09213423          	sd	s2,136(sp)
    8000271c:	09313823          	sd	s3,144(sp)
    80002720:	09413c23          	sd	s4,152(sp)
    80002724:	0b513023          	sd	s5,160(sp)
    80002728:	0b613423          	sd	s6,168(sp)
    8000272c:	0b713823          	sd	s7,176(sp)
    80002730:	0b813c23          	sd	s8,184(sp)
    80002734:	0d913023          	sd	s9,192(sp)
    80002738:	0da13423          	sd	s10,200(sp)
    8000273c:	0db13823          	sd	s11,208(sp)
    80002740:	0dc13c23          	sd	t3,216(sp)
    80002744:	0fd13023          	sd	t4,224(sp)
    80002748:	0fe13423          	sd	t5,232(sp)
    8000274c:	0ff13823          	sd	t6,240(sp)
    80002750:	cd1ff0ef          	jal	ra,80002420 <kerneltrap>
    80002754:	00013083          	ld	ra,0(sp)
    80002758:	00813103          	ld	sp,8(sp)
    8000275c:	01013183          	ld	gp,16(sp)
    80002760:	02013283          	ld	t0,32(sp)
    80002764:	02813303          	ld	t1,40(sp)
    80002768:	03013383          	ld	t2,48(sp)
    8000276c:	03813403          	ld	s0,56(sp)
    80002770:	04013483          	ld	s1,64(sp)
    80002774:	04813503          	ld	a0,72(sp)
    80002778:	05013583          	ld	a1,80(sp)
    8000277c:	05813603          	ld	a2,88(sp)
    80002780:	06013683          	ld	a3,96(sp)
    80002784:	06813703          	ld	a4,104(sp)
    80002788:	07013783          	ld	a5,112(sp)
    8000278c:	07813803          	ld	a6,120(sp)
    80002790:	08013883          	ld	a7,128(sp)
    80002794:	08813903          	ld	s2,136(sp)
    80002798:	09013983          	ld	s3,144(sp)
    8000279c:	09813a03          	ld	s4,152(sp)
    800027a0:	0a013a83          	ld	s5,160(sp)
    800027a4:	0a813b03          	ld	s6,168(sp)
    800027a8:	0b013b83          	ld	s7,176(sp)
    800027ac:	0b813c03          	ld	s8,184(sp)
    800027b0:	0c013c83          	ld	s9,192(sp)
    800027b4:	0c813d03          	ld	s10,200(sp)
    800027b8:	0d013d83          	ld	s11,208(sp)
    800027bc:	0d813e03          	ld	t3,216(sp)
    800027c0:	0e013e83          	ld	t4,224(sp)
    800027c4:	0e813f03          	ld	t5,232(sp)
    800027c8:	0f013f83          	ld	t6,240(sp)
    800027cc:	10010113          	addi	sp,sp,256
    800027d0:	10200073          	sret
    800027d4:	00000013          	nop
    800027d8:	00000013          	nop
    800027dc:	00000013          	nop

00000000800027e0 <timervec>:
    800027e0:	34051573          	csrrw	a0,mscratch,a0
    800027e4:	00b53023          	sd	a1,0(a0)
    800027e8:	00c53423          	sd	a2,8(a0)
    800027ec:	00d53823          	sd	a3,16(a0)
    800027f0:	01853583          	ld	a1,24(a0)
    800027f4:	02053603          	ld	a2,32(a0)
    800027f8:	0005b683          	ld	a3,0(a1)
    800027fc:	00c686b3          	add	a3,a3,a2
    80002800:	00d5b023          	sd	a3,0(a1)
    80002804:	00200593          	li	a1,2
    80002808:	14459073          	csrw	sip,a1
    8000280c:	01053683          	ld	a3,16(a0)
    80002810:	00853603          	ld	a2,8(a0)
    80002814:	00053583          	ld	a1,0(a0)
    80002818:	34051573          	csrrw	a0,mscratch,a0
    8000281c:	30200073          	mret

0000000080002820 <plicinit>:
    80002820:	ff010113          	addi	sp,sp,-16
    80002824:	00813423          	sd	s0,8(sp)
    80002828:	01010413          	addi	s0,sp,16
    8000282c:	00813403          	ld	s0,8(sp)
    80002830:	0c0007b7          	lui	a5,0xc000
    80002834:	00100713          	li	a4,1
    80002838:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000283c:	00e7a223          	sw	a4,4(a5)
    80002840:	01010113          	addi	sp,sp,16
    80002844:	00008067          	ret

0000000080002848 <plicinithart>:
    80002848:	ff010113          	addi	sp,sp,-16
    8000284c:	00813023          	sd	s0,0(sp)
    80002850:	00113423          	sd	ra,8(sp)
    80002854:	01010413          	addi	s0,sp,16
    80002858:	00000097          	auipc	ra,0x0
    8000285c:	a48080e7          	jalr	-1464(ra) # 800022a0 <cpuid>
    80002860:	0085171b          	slliw	a4,a0,0x8
    80002864:	0c0027b7          	lui	a5,0xc002
    80002868:	00e787b3          	add	a5,a5,a4
    8000286c:	40200713          	li	a4,1026
    80002870:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80002874:	00813083          	ld	ra,8(sp)
    80002878:	00013403          	ld	s0,0(sp)
    8000287c:	00d5151b          	slliw	a0,a0,0xd
    80002880:	0c2017b7          	lui	a5,0xc201
    80002884:	00a78533          	add	a0,a5,a0
    80002888:	00052023          	sw	zero,0(a0)
    8000288c:	01010113          	addi	sp,sp,16
    80002890:	00008067          	ret

0000000080002894 <plic_claim>:
    80002894:	ff010113          	addi	sp,sp,-16
    80002898:	00813023          	sd	s0,0(sp)
    8000289c:	00113423          	sd	ra,8(sp)
    800028a0:	01010413          	addi	s0,sp,16
    800028a4:	00000097          	auipc	ra,0x0
    800028a8:	9fc080e7          	jalr	-1540(ra) # 800022a0 <cpuid>
    800028ac:	00813083          	ld	ra,8(sp)
    800028b0:	00013403          	ld	s0,0(sp)
    800028b4:	00d5151b          	slliw	a0,a0,0xd
    800028b8:	0c2017b7          	lui	a5,0xc201
    800028bc:	00a78533          	add	a0,a5,a0
    800028c0:	00452503          	lw	a0,4(a0)
    800028c4:	01010113          	addi	sp,sp,16
    800028c8:	00008067          	ret

00000000800028cc <plic_complete>:
    800028cc:	fe010113          	addi	sp,sp,-32
    800028d0:	00813823          	sd	s0,16(sp)
    800028d4:	00913423          	sd	s1,8(sp)
    800028d8:	00113c23          	sd	ra,24(sp)
    800028dc:	02010413          	addi	s0,sp,32
    800028e0:	00050493          	mv	s1,a0
    800028e4:	00000097          	auipc	ra,0x0
    800028e8:	9bc080e7          	jalr	-1604(ra) # 800022a0 <cpuid>
    800028ec:	01813083          	ld	ra,24(sp)
    800028f0:	01013403          	ld	s0,16(sp)
    800028f4:	00d5179b          	slliw	a5,a0,0xd
    800028f8:	0c201737          	lui	a4,0xc201
    800028fc:	00f707b3          	add	a5,a4,a5
    80002900:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80002904:	00813483          	ld	s1,8(sp)
    80002908:	02010113          	addi	sp,sp,32
    8000290c:	00008067          	ret

0000000080002910 <consolewrite>:
    80002910:	fb010113          	addi	sp,sp,-80
    80002914:	04813023          	sd	s0,64(sp)
    80002918:	04113423          	sd	ra,72(sp)
    8000291c:	02913c23          	sd	s1,56(sp)
    80002920:	03213823          	sd	s2,48(sp)
    80002924:	03313423          	sd	s3,40(sp)
    80002928:	03413023          	sd	s4,32(sp)
    8000292c:	01513c23          	sd	s5,24(sp)
    80002930:	05010413          	addi	s0,sp,80
    80002934:	06c05c63          	blez	a2,800029ac <consolewrite+0x9c>
    80002938:	00060993          	mv	s3,a2
    8000293c:	00050a13          	mv	s4,a0
    80002940:	00058493          	mv	s1,a1
    80002944:	00000913          	li	s2,0
    80002948:	fff00a93          	li	s5,-1
    8000294c:	01c0006f          	j	80002968 <consolewrite+0x58>
    80002950:	fbf44503          	lbu	a0,-65(s0)
    80002954:	0019091b          	addiw	s2,s2,1
    80002958:	00148493          	addi	s1,s1,1
    8000295c:	00001097          	auipc	ra,0x1
    80002960:	a9c080e7          	jalr	-1380(ra) # 800033f8 <uartputc>
    80002964:	03298063          	beq	s3,s2,80002984 <consolewrite+0x74>
    80002968:	00048613          	mv	a2,s1
    8000296c:	00100693          	li	a3,1
    80002970:	000a0593          	mv	a1,s4
    80002974:	fbf40513          	addi	a0,s0,-65
    80002978:	00000097          	auipc	ra,0x0
    8000297c:	9e0080e7          	jalr	-1568(ra) # 80002358 <either_copyin>
    80002980:	fd5518e3          	bne	a0,s5,80002950 <consolewrite+0x40>
    80002984:	04813083          	ld	ra,72(sp)
    80002988:	04013403          	ld	s0,64(sp)
    8000298c:	03813483          	ld	s1,56(sp)
    80002990:	02813983          	ld	s3,40(sp)
    80002994:	02013a03          	ld	s4,32(sp)
    80002998:	01813a83          	ld	s5,24(sp)
    8000299c:	00090513          	mv	a0,s2
    800029a0:	03013903          	ld	s2,48(sp)
    800029a4:	05010113          	addi	sp,sp,80
    800029a8:	00008067          	ret
    800029ac:	00000913          	li	s2,0
    800029b0:	fd5ff06f          	j	80002984 <consolewrite+0x74>

00000000800029b4 <consoleread>:
    800029b4:	f9010113          	addi	sp,sp,-112
    800029b8:	06813023          	sd	s0,96(sp)
    800029bc:	04913c23          	sd	s1,88(sp)
    800029c0:	05213823          	sd	s2,80(sp)
    800029c4:	05313423          	sd	s3,72(sp)
    800029c8:	05413023          	sd	s4,64(sp)
    800029cc:	03513c23          	sd	s5,56(sp)
    800029d0:	03613823          	sd	s6,48(sp)
    800029d4:	03713423          	sd	s7,40(sp)
    800029d8:	03813023          	sd	s8,32(sp)
    800029dc:	06113423          	sd	ra,104(sp)
    800029e0:	01913c23          	sd	s9,24(sp)
    800029e4:	07010413          	addi	s0,sp,112
    800029e8:	00060b93          	mv	s7,a2
    800029ec:	00050913          	mv	s2,a0
    800029f0:	00058c13          	mv	s8,a1
    800029f4:	00060b1b          	sext.w	s6,a2
    800029f8:	00004497          	auipc	s1,0x4
    800029fc:	20048493          	addi	s1,s1,512 # 80006bf8 <cons>
    80002a00:	00400993          	li	s3,4
    80002a04:	fff00a13          	li	s4,-1
    80002a08:	00a00a93          	li	s5,10
    80002a0c:	05705e63          	blez	s7,80002a68 <consoleread+0xb4>
    80002a10:	09c4a703          	lw	a4,156(s1)
    80002a14:	0984a783          	lw	a5,152(s1)
    80002a18:	0007071b          	sext.w	a4,a4
    80002a1c:	08e78463          	beq	a5,a4,80002aa4 <consoleread+0xf0>
    80002a20:	07f7f713          	andi	a4,a5,127
    80002a24:	00e48733          	add	a4,s1,a4
    80002a28:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80002a2c:	0017869b          	addiw	a3,a5,1
    80002a30:	08d4ac23          	sw	a3,152(s1)
    80002a34:	00070c9b          	sext.w	s9,a4
    80002a38:	0b370663          	beq	a4,s3,80002ae4 <consoleread+0x130>
    80002a3c:	00100693          	li	a3,1
    80002a40:	f9f40613          	addi	a2,s0,-97
    80002a44:	000c0593          	mv	a1,s8
    80002a48:	00090513          	mv	a0,s2
    80002a4c:	f8e40fa3          	sb	a4,-97(s0)
    80002a50:	00000097          	auipc	ra,0x0
    80002a54:	8bc080e7          	jalr	-1860(ra) # 8000230c <either_copyout>
    80002a58:	01450863          	beq	a0,s4,80002a68 <consoleread+0xb4>
    80002a5c:	001c0c13          	addi	s8,s8,1
    80002a60:	fffb8b9b          	addiw	s7,s7,-1
    80002a64:	fb5c94e3          	bne	s9,s5,80002a0c <consoleread+0x58>
    80002a68:	000b851b          	sext.w	a0,s7
    80002a6c:	06813083          	ld	ra,104(sp)
    80002a70:	06013403          	ld	s0,96(sp)
    80002a74:	05813483          	ld	s1,88(sp)
    80002a78:	05013903          	ld	s2,80(sp)
    80002a7c:	04813983          	ld	s3,72(sp)
    80002a80:	04013a03          	ld	s4,64(sp)
    80002a84:	03813a83          	ld	s5,56(sp)
    80002a88:	02813b83          	ld	s7,40(sp)
    80002a8c:	02013c03          	ld	s8,32(sp)
    80002a90:	01813c83          	ld	s9,24(sp)
    80002a94:	40ab053b          	subw	a0,s6,a0
    80002a98:	03013b03          	ld	s6,48(sp)
    80002a9c:	07010113          	addi	sp,sp,112
    80002aa0:	00008067          	ret
    80002aa4:	00001097          	auipc	ra,0x1
    80002aa8:	1d8080e7          	jalr	472(ra) # 80003c7c <push_on>
    80002aac:	0984a703          	lw	a4,152(s1)
    80002ab0:	09c4a783          	lw	a5,156(s1)
    80002ab4:	0007879b          	sext.w	a5,a5
    80002ab8:	fef70ce3          	beq	a4,a5,80002ab0 <consoleread+0xfc>
    80002abc:	00001097          	auipc	ra,0x1
    80002ac0:	234080e7          	jalr	564(ra) # 80003cf0 <pop_on>
    80002ac4:	0984a783          	lw	a5,152(s1)
    80002ac8:	07f7f713          	andi	a4,a5,127
    80002acc:	00e48733          	add	a4,s1,a4
    80002ad0:	01874703          	lbu	a4,24(a4)
    80002ad4:	0017869b          	addiw	a3,a5,1
    80002ad8:	08d4ac23          	sw	a3,152(s1)
    80002adc:	00070c9b          	sext.w	s9,a4
    80002ae0:	f5371ee3          	bne	a4,s3,80002a3c <consoleread+0x88>
    80002ae4:	000b851b          	sext.w	a0,s7
    80002ae8:	f96bf2e3          	bgeu	s7,s6,80002a6c <consoleread+0xb8>
    80002aec:	08f4ac23          	sw	a5,152(s1)
    80002af0:	f7dff06f          	j	80002a6c <consoleread+0xb8>

0000000080002af4 <consputc>:
    80002af4:	10000793          	li	a5,256
    80002af8:	00f50663          	beq	a0,a5,80002b04 <consputc+0x10>
    80002afc:	00001317          	auipc	t1,0x1
    80002b00:	9f430067          	jr	-1548(t1) # 800034f0 <uartputc_sync>
    80002b04:	ff010113          	addi	sp,sp,-16
    80002b08:	00113423          	sd	ra,8(sp)
    80002b0c:	00813023          	sd	s0,0(sp)
    80002b10:	01010413          	addi	s0,sp,16
    80002b14:	00800513          	li	a0,8
    80002b18:	00001097          	auipc	ra,0x1
    80002b1c:	9d8080e7          	jalr	-1576(ra) # 800034f0 <uartputc_sync>
    80002b20:	02000513          	li	a0,32
    80002b24:	00001097          	auipc	ra,0x1
    80002b28:	9cc080e7          	jalr	-1588(ra) # 800034f0 <uartputc_sync>
    80002b2c:	00013403          	ld	s0,0(sp)
    80002b30:	00813083          	ld	ra,8(sp)
    80002b34:	00800513          	li	a0,8
    80002b38:	01010113          	addi	sp,sp,16
    80002b3c:	00001317          	auipc	t1,0x1
    80002b40:	9b430067          	jr	-1612(t1) # 800034f0 <uartputc_sync>

0000000080002b44 <consoleintr>:
    80002b44:	fe010113          	addi	sp,sp,-32
    80002b48:	00813823          	sd	s0,16(sp)
    80002b4c:	00913423          	sd	s1,8(sp)
    80002b50:	01213023          	sd	s2,0(sp)
    80002b54:	00113c23          	sd	ra,24(sp)
    80002b58:	02010413          	addi	s0,sp,32
    80002b5c:	00004917          	auipc	s2,0x4
    80002b60:	09c90913          	addi	s2,s2,156 # 80006bf8 <cons>
    80002b64:	00050493          	mv	s1,a0
    80002b68:	00090513          	mv	a0,s2
    80002b6c:	00001097          	auipc	ra,0x1
    80002b70:	e40080e7          	jalr	-448(ra) # 800039ac <acquire>
    80002b74:	02048c63          	beqz	s1,80002bac <consoleintr+0x68>
    80002b78:	0a092783          	lw	a5,160(s2)
    80002b7c:	09892703          	lw	a4,152(s2)
    80002b80:	07f00693          	li	a3,127
    80002b84:	40e7873b          	subw	a4,a5,a4
    80002b88:	02e6e263          	bltu	a3,a4,80002bac <consoleintr+0x68>
    80002b8c:	00d00713          	li	a4,13
    80002b90:	04e48063          	beq	s1,a4,80002bd0 <consoleintr+0x8c>
    80002b94:	07f7f713          	andi	a4,a5,127
    80002b98:	00e90733          	add	a4,s2,a4
    80002b9c:	0017879b          	addiw	a5,a5,1
    80002ba0:	0af92023          	sw	a5,160(s2)
    80002ba4:	00970c23          	sb	s1,24(a4)
    80002ba8:	08f92e23          	sw	a5,156(s2)
    80002bac:	01013403          	ld	s0,16(sp)
    80002bb0:	01813083          	ld	ra,24(sp)
    80002bb4:	00813483          	ld	s1,8(sp)
    80002bb8:	00013903          	ld	s2,0(sp)
    80002bbc:	00004517          	auipc	a0,0x4
    80002bc0:	03c50513          	addi	a0,a0,60 # 80006bf8 <cons>
    80002bc4:	02010113          	addi	sp,sp,32
    80002bc8:	00001317          	auipc	t1,0x1
    80002bcc:	eb030067          	jr	-336(t1) # 80003a78 <release>
    80002bd0:	00a00493          	li	s1,10
    80002bd4:	fc1ff06f          	j	80002b94 <consoleintr+0x50>

0000000080002bd8 <consoleinit>:
    80002bd8:	fe010113          	addi	sp,sp,-32
    80002bdc:	00113c23          	sd	ra,24(sp)
    80002be0:	00813823          	sd	s0,16(sp)
    80002be4:	00913423          	sd	s1,8(sp)
    80002be8:	02010413          	addi	s0,sp,32
    80002bec:	00004497          	auipc	s1,0x4
    80002bf0:	00c48493          	addi	s1,s1,12 # 80006bf8 <cons>
    80002bf4:	00048513          	mv	a0,s1
    80002bf8:	00002597          	auipc	a1,0x2
    80002bfc:	73858593          	addi	a1,a1,1848 # 80005330 <_ZZ12printIntegermE6digits+0x310>
    80002c00:	00001097          	auipc	ra,0x1
    80002c04:	d88080e7          	jalr	-632(ra) # 80003988 <initlock>
    80002c08:	00000097          	auipc	ra,0x0
    80002c0c:	7ac080e7          	jalr	1964(ra) # 800033b4 <uartinit>
    80002c10:	01813083          	ld	ra,24(sp)
    80002c14:	01013403          	ld	s0,16(sp)
    80002c18:	00000797          	auipc	a5,0x0
    80002c1c:	d9c78793          	addi	a5,a5,-612 # 800029b4 <consoleread>
    80002c20:	0af4bc23          	sd	a5,184(s1)
    80002c24:	00000797          	auipc	a5,0x0
    80002c28:	cec78793          	addi	a5,a5,-788 # 80002910 <consolewrite>
    80002c2c:	0cf4b023          	sd	a5,192(s1)
    80002c30:	00813483          	ld	s1,8(sp)
    80002c34:	02010113          	addi	sp,sp,32
    80002c38:	00008067          	ret

0000000080002c3c <console_read>:
    80002c3c:	ff010113          	addi	sp,sp,-16
    80002c40:	00813423          	sd	s0,8(sp)
    80002c44:	01010413          	addi	s0,sp,16
    80002c48:	00813403          	ld	s0,8(sp)
    80002c4c:	00004317          	auipc	t1,0x4
    80002c50:	06433303          	ld	t1,100(t1) # 80006cb0 <devsw+0x10>
    80002c54:	01010113          	addi	sp,sp,16
    80002c58:	00030067          	jr	t1

0000000080002c5c <console_write>:
    80002c5c:	ff010113          	addi	sp,sp,-16
    80002c60:	00813423          	sd	s0,8(sp)
    80002c64:	01010413          	addi	s0,sp,16
    80002c68:	00813403          	ld	s0,8(sp)
    80002c6c:	00004317          	auipc	t1,0x4
    80002c70:	04c33303          	ld	t1,76(t1) # 80006cb8 <devsw+0x18>
    80002c74:	01010113          	addi	sp,sp,16
    80002c78:	00030067          	jr	t1

0000000080002c7c <panic>:
    80002c7c:	fe010113          	addi	sp,sp,-32
    80002c80:	00113c23          	sd	ra,24(sp)
    80002c84:	00813823          	sd	s0,16(sp)
    80002c88:	00913423          	sd	s1,8(sp)
    80002c8c:	02010413          	addi	s0,sp,32
    80002c90:	00050493          	mv	s1,a0
    80002c94:	00002517          	auipc	a0,0x2
    80002c98:	6a450513          	addi	a0,a0,1700 # 80005338 <_ZZ12printIntegermE6digits+0x318>
    80002c9c:	00004797          	auipc	a5,0x4
    80002ca0:	0a07ae23          	sw	zero,188(a5) # 80006d58 <pr+0x18>
    80002ca4:	00000097          	auipc	ra,0x0
    80002ca8:	034080e7          	jalr	52(ra) # 80002cd8 <__printf>
    80002cac:	00048513          	mv	a0,s1
    80002cb0:	00000097          	auipc	ra,0x0
    80002cb4:	028080e7          	jalr	40(ra) # 80002cd8 <__printf>
    80002cb8:	00002517          	auipc	a0,0x2
    80002cbc:	66050513          	addi	a0,a0,1632 # 80005318 <_ZZ12printIntegermE6digits+0x2f8>
    80002cc0:	00000097          	auipc	ra,0x0
    80002cc4:	018080e7          	jalr	24(ra) # 80002cd8 <__printf>
    80002cc8:	00100793          	li	a5,1
    80002ccc:	00003717          	auipc	a4,0x3
    80002cd0:	def72623          	sw	a5,-532(a4) # 80005ab8 <panicked>
    80002cd4:	0000006f          	j	80002cd4 <panic+0x58>

0000000080002cd8 <__printf>:
    80002cd8:	f3010113          	addi	sp,sp,-208
    80002cdc:	08813023          	sd	s0,128(sp)
    80002ce0:	07313423          	sd	s3,104(sp)
    80002ce4:	09010413          	addi	s0,sp,144
    80002ce8:	05813023          	sd	s8,64(sp)
    80002cec:	08113423          	sd	ra,136(sp)
    80002cf0:	06913c23          	sd	s1,120(sp)
    80002cf4:	07213823          	sd	s2,112(sp)
    80002cf8:	07413023          	sd	s4,96(sp)
    80002cfc:	05513c23          	sd	s5,88(sp)
    80002d00:	05613823          	sd	s6,80(sp)
    80002d04:	05713423          	sd	s7,72(sp)
    80002d08:	03913c23          	sd	s9,56(sp)
    80002d0c:	03a13823          	sd	s10,48(sp)
    80002d10:	03b13423          	sd	s11,40(sp)
    80002d14:	00004317          	auipc	t1,0x4
    80002d18:	02c30313          	addi	t1,t1,44 # 80006d40 <pr>
    80002d1c:	01832c03          	lw	s8,24(t1)
    80002d20:	00b43423          	sd	a1,8(s0)
    80002d24:	00c43823          	sd	a2,16(s0)
    80002d28:	00d43c23          	sd	a3,24(s0)
    80002d2c:	02e43023          	sd	a4,32(s0)
    80002d30:	02f43423          	sd	a5,40(s0)
    80002d34:	03043823          	sd	a6,48(s0)
    80002d38:	03143c23          	sd	a7,56(s0)
    80002d3c:	00050993          	mv	s3,a0
    80002d40:	4a0c1663          	bnez	s8,800031ec <__printf+0x514>
    80002d44:	60098c63          	beqz	s3,8000335c <__printf+0x684>
    80002d48:	0009c503          	lbu	a0,0(s3)
    80002d4c:	00840793          	addi	a5,s0,8
    80002d50:	f6f43c23          	sd	a5,-136(s0)
    80002d54:	00000493          	li	s1,0
    80002d58:	22050063          	beqz	a0,80002f78 <__printf+0x2a0>
    80002d5c:	00002a37          	lui	s4,0x2
    80002d60:	00018ab7          	lui	s5,0x18
    80002d64:	000f4b37          	lui	s6,0xf4
    80002d68:	00989bb7          	lui	s7,0x989
    80002d6c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80002d70:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80002d74:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80002d78:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80002d7c:	00148c9b          	addiw	s9,s1,1
    80002d80:	02500793          	li	a5,37
    80002d84:	01998933          	add	s2,s3,s9
    80002d88:	38f51263          	bne	a0,a5,8000310c <__printf+0x434>
    80002d8c:	00094783          	lbu	a5,0(s2)
    80002d90:	00078c9b          	sext.w	s9,a5
    80002d94:	1e078263          	beqz	a5,80002f78 <__printf+0x2a0>
    80002d98:	0024849b          	addiw	s1,s1,2
    80002d9c:	07000713          	li	a4,112
    80002da0:	00998933          	add	s2,s3,s1
    80002da4:	38e78a63          	beq	a5,a4,80003138 <__printf+0x460>
    80002da8:	20f76863          	bltu	a4,a5,80002fb8 <__printf+0x2e0>
    80002dac:	42a78863          	beq	a5,a0,800031dc <__printf+0x504>
    80002db0:	06400713          	li	a4,100
    80002db4:	40e79663          	bne	a5,a4,800031c0 <__printf+0x4e8>
    80002db8:	f7843783          	ld	a5,-136(s0)
    80002dbc:	0007a603          	lw	a2,0(a5)
    80002dc0:	00878793          	addi	a5,a5,8
    80002dc4:	f6f43c23          	sd	a5,-136(s0)
    80002dc8:	42064a63          	bltz	a2,800031fc <__printf+0x524>
    80002dcc:	00a00713          	li	a4,10
    80002dd0:	02e677bb          	remuw	a5,a2,a4
    80002dd4:	00002d97          	auipc	s11,0x2
    80002dd8:	58cd8d93          	addi	s11,s11,1420 # 80005360 <digits>
    80002ddc:	00900593          	li	a1,9
    80002de0:	0006051b          	sext.w	a0,a2
    80002de4:	00000c93          	li	s9,0
    80002de8:	02079793          	slli	a5,a5,0x20
    80002dec:	0207d793          	srli	a5,a5,0x20
    80002df0:	00fd87b3          	add	a5,s11,a5
    80002df4:	0007c783          	lbu	a5,0(a5)
    80002df8:	02e656bb          	divuw	a3,a2,a4
    80002dfc:	f8f40023          	sb	a5,-128(s0)
    80002e00:	14c5d863          	bge	a1,a2,80002f50 <__printf+0x278>
    80002e04:	06300593          	li	a1,99
    80002e08:	00100c93          	li	s9,1
    80002e0c:	02e6f7bb          	remuw	a5,a3,a4
    80002e10:	02079793          	slli	a5,a5,0x20
    80002e14:	0207d793          	srli	a5,a5,0x20
    80002e18:	00fd87b3          	add	a5,s11,a5
    80002e1c:	0007c783          	lbu	a5,0(a5)
    80002e20:	02e6d73b          	divuw	a4,a3,a4
    80002e24:	f8f400a3          	sb	a5,-127(s0)
    80002e28:	12a5f463          	bgeu	a1,a0,80002f50 <__printf+0x278>
    80002e2c:	00a00693          	li	a3,10
    80002e30:	00900593          	li	a1,9
    80002e34:	02d777bb          	remuw	a5,a4,a3
    80002e38:	02079793          	slli	a5,a5,0x20
    80002e3c:	0207d793          	srli	a5,a5,0x20
    80002e40:	00fd87b3          	add	a5,s11,a5
    80002e44:	0007c503          	lbu	a0,0(a5)
    80002e48:	02d757bb          	divuw	a5,a4,a3
    80002e4c:	f8a40123          	sb	a0,-126(s0)
    80002e50:	48e5f263          	bgeu	a1,a4,800032d4 <__printf+0x5fc>
    80002e54:	06300513          	li	a0,99
    80002e58:	02d7f5bb          	remuw	a1,a5,a3
    80002e5c:	02059593          	slli	a1,a1,0x20
    80002e60:	0205d593          	srli	a1,a1,0x20
    80002e64:	00bd85b3          	add	a1,s11,a1
    80002e68:	0005c583          	lbu	a1,0(a1)
    80002e6c:	02d7d7bb          	divuw	a5,a5,a3
    80002e70:	f8b401a3          	sb	a1,-125(s0)
    80002e74:	48e57263          	bgeu	a0,a4,800032f8 <__printf+0x620>
    80002e78:	3e700513          	li	a0,999
    80002e7c:	02d7f5bb          	remuw	a1,a5,a3
    80002e80:	02059593          	slli	a1,a1,0x20
    80002e84:	0205d593          	srli	a1,a1,0x20
    80002e88:	00bd85b3          	add	a1,s11,a1
    80002e8c:	0005c583          	lbu	a1,0(a1)
    80002e90:	02d7d7bb          	divuw	a5,a5,a3
    80002e94:	f8b40223          	sb	a1,-124(s0)
    80002e98:	46e57663          	bgeu	a0,a4,80003304 <__printf+0x62c>
    80002e9c:	02d7f5bb          	remuw	a1,a5,a3
    80002ea0:	02059593          	slli	a1,a1,0x20
    80002ea4:	0205d593          	srli	a1,a1,0x20
    80002ea8:	00bd85b3          	add	a1,s11,a1
    80002eac:	0005c583          	lbu	a1,0(a1)
    80002eb0:	02d7d7bb          	divuw	a5,a5,a3
    80002eb4:	f8b402a3          	sb	a1,-123(s0)
    80002eb8:	46ea7863          	bgeu	s4,a4,80003328 <__printf+0x650>
    80002ebc:	02d7f5bb          	remuw	a1,a5,a3
    80002ec0:	02059593          	slli	a1,a1,0x20
    80002ec4:	0205d593          	srli	a1,a1,0x20
    80002ec8:	00bd85b3          	add	a1,s11,a1
    80002ecc:	0005c583          	lbu	a1,0(a1)
    80002ed0:	02d7d7bb          	divuw	a5,a5,a3
    80002ed4:	f8b40323          	sb	a1,-122(s0)
    80002ed8:	3eeaf863          	bgeu	s5,a4,800032c8 <__printf+0x5f0>
    80002edc:	02d7f5bb          	remuw	a1,a5,a3
    80002ee0:	02059593          	slli	a1,a1,0x20
    80002ee4:	0205d593          	srli	a1,a1,0x20
    80002ee8:	00bd85b3          	add	a1,s11,a1
    80002eec:	0005c583          	lbu	a1,0(a1)
    80002ef0:	02d7d7bb          	divuw	a5,a5,a3
    80002ef4:	f8b403a3          	sb	a1,-121(s0)
    80002ef8:	42eb7e63          	bgeu	s6,a4,80003334 <__printf+0x65c>
    80002efc:	02d7f5bb          	remuw	a1,a5,a3
    80002f00:	02059593          	slli	a1,a1,0x20
    80002f04:	0205d593          	srli	a1,a1,0x20
    80002f08:	00bd85b3          	add	a1,s11,a1
    80002f0c:	0005c583          	lbu	a1,0(a1)
    80002f10:	02d7d7bb          	divuw	a5,a5,a3
    80002f14:	f8b40423          	sb	a1,-120(s0)
    80002f18:	42ebfc63          	bgeu	s7,a4,80003350 <__printf+0x678>
    80002f1c:	02079793          	slli	a5,a5,0x20
    80002f20:	0207d793          	srli	a5,a5,0x20
    80002f24:	00fd8db3          	add	s11,s11,a5
    80002f28:	000dc703          	lbu	a4,0(s11)
    80002f2c:	00a00793          	li	a5,10
    80002f30:	00900c93          	li	s9,9
    80002f34:	f8e404a3          	sb	a4,-119(s0)
    80002f38:	00065c63          	bgez	a2,80002f50 <__printf+0x278>
    80002f3c:	f9040713          	addi	a4,s0,-112
    80002f40:	00f70733          	add	a4,a4,a5
    80002f44:	02d00693          	li	a3,45
    80002f48:	fed70823          	sb	a3,-16(a4)
    80002f4c:	00078c93          	mv	s9,a5
    80002f50:	f8040793          	addi	a5,s0,-128
    80002f54:	01978cb3          	add	s9,a5,s9
    80002f58:	f7f40d13          	addi	s10,s0,-129
    80002f5c:	000cc503          	lbu	a0,0(s9)
    80002f60:	fffc8c93          	addi	s9,s9,-1
    80002f64:	00000097          	auipc	ra,0x0
    80002f68:	b90080e7          	jalr	-1136(ra) # 80002af4 <consputc>
    80002f6c:	ffac98e3          	bne	s9,s10,80002f5c <__printf+0x284>
    80002f70:	00094503          	lbu	a0,0(s2)
    80002f74:	e00514e3          	bnez	a0,80002d7c <__printf+0xa4>
    80002f78:	1a0c1663          	bnez	s8,80003124 <__printf+0x44c>
    80002f7c:	08813083          	ld	ra,136(sp)
    80002f80:	08013403          	ld	s0,128(sp)
    80002f84:	07813483          	ld	s1,120(sp)
    80002f88:	07013903          	ld	s2,112(sp)
    80002f8c:	06813983          	ld	s3,104(sp)
    80002f90:	06013a03          	ld	s4,96(sp)
    80002f94:	05813a83          	ld	s5,88(sp)
    80002f98:	05013b03          	ld	s6,80(sp)
    80002f9c:	04813b83          	ld	s7,72(sp)
    80002fa0:	04013c03          	ld	s8,64(sp)
    80002fa4:	03813c83          	ld	s9,56(sp)
    80002fa8:	03013d03          	ld	s10,48(sp)
    80002fac:	02813d83          	ld	s11,40(sp)
    80002fb0:	0d010113          	addi	sp,sp,208
    80002fb4:	00008067          	ret
    80002fb8:	07300713          	li	a4,115
    80002fbc:	1ce78a63          	beq	a5,a4,80003190 <__printf+0x4b8>
    80002fc0:	07800713          	li	a4,120
    80002fc4:	1ee79e63          	bne	a5,a4,800031c0 <__printf+0x4e8>
    80002fc8:	f7843783          	ld	a5,-136(s0)
    80002fcc:	0007a703          	lw	a4,0(a5)
    80002fd0:	00878793          	addi	a5,a5,8
    80002fd4:	f6f43c23          	sd	a5,-136(s0)
    80002fd8:	28074263          	bltz	a4,8000325c <__printf+0x584>
    80002fdc:	00002d97          	auipc	s11,0x2
    80002fe0:	384d8d93          	addi	s11,s11,900 # 80005360 <digits>
    80002fe4:	00f77793          	andi	a5,a4,15
    80002fe8:	00fd87b3          	add	a5,s11,a5
    80002fec:	0007c683          	lbu	a3,0(a5)
    80002ff0:	00f00613          	li	a2,15
    80002ff4:	0007079b          	sext.w	a5,a4
    80002ff8:	f8d40023          	sb	a3,-128(s0)
    80002ffc:	0047559b          	srliw	a1,a4,0x4
    80003000:	0047569b          	srliw	a3,a4,0x4
    80003004:	00000c93          	li	s9,0
    80003008:	0ee65063          	bge	a2,a4,800030e8 <__printf+0x410>
    8000300c:	00f6f693          	andi	a3,a3,15
    80003010:	00dd86b3          	add	a3,s11,a3
    80003014:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80003018:	0087d79b          	srliw	a5,a5,0x8
    8000301c:	00100c93          	li	s9,1
    80003020:	f8d400a3          	sb	a3,-127(s0)
    80003024:	0cb67263          	bgeu	a2,a1,800030e8 <__printf+0x410>
    80003028:	00f7f693          	andi	a3,a5,15
    8000302c:	00dd86b3          	add	a3,s11,a3
    80003030:	0006c583          	lbu	a1,0(a3)
    80003034:	00f00613          	li	a2,15
    80003038:	0047d69b          	srliw	a3,a5,0x4
    8000303c:	f8b40123          	sb	a1,-126(s0)
    80003040:	0047d593          	srli	a1,a5,0x4
    80003044:	28f67e63          	bgeu	a2,a5,800032e0 <__printf+0x608>
    80003048:	00f6f693          	andi	a3,a3,15
    8000304c:	00dd86b3          	add	a3,s11,a3
    80003050:	0006c503          	lbu	a0,0(a3)
    80003054:	0087d813          	srli	a6,a5,0x8
    80003058:	0087d69b          	srliw	a3,a5,0x8
    8000305c:	f8a401a3          	sb	a0,-125(s0)
    80003060:	28b67663          	bgeu	a2,a1,800032ec <__printf+0x614>
    80003064:	00f6f693          	andi	a3,a3,15
    80003068:	00dd86b3          	add	a3,s11,a3
    8000306c:	0006c583          	lbu	a1,0(a3)
    80003070:	00c7d513          	srli	a0,a5,0xc
    80003074:	00c7d69b          	srliw	a3,a5,0xc
    80003078:	f8b40223          	sb	a1,-124(s0)
    8000307c:	29067a63          	bgeu	a2,a6,80003310 <__printf+0x638>
    80003080:	00f6f693          	andi	a3,a3,15
    80003084:	00dd86b3          	add	a3,s11,a3
    80003088:	0006c583          	lbu	a1,0(a3)
    8000308c:	0107d813          	srli	a6,a5,0x10
    80003090:	0107d69b          	srliw	a3,a5,0x10
    80003094:	f8b402a3          	sb	a1,-123(s0)
    80003098:	28a67263          	bgeu	a2,a0,8000331c <__printf+0x644>
    8000309c:	00f6f693          	andi	a3,a3,15
    800030a0:	00dd86b3          	add	a3,s11,a3
    800030a4:	0006c683          	lbu	a3,0(a3)
    800030a8:	0147d79b          	srliw	a5,a5,0x14
    800030ac:	f8d40323          	sb	a3,-122(s0)
    800030b0:	21067663          	bgeu	a2,a6,800032bc <__printf+0x5e4>
    800030b4:	02079793          	slli	a5,a5,0x20
    800030b8:	0207d793          	srli	a5,a5,0x20
    800030bc:	00fd8db3          	add	s11,s11,a5
    800030c0:	000dc683          	lbu	a3,0(s11)
    800030c4:	00800793          	li	a5,8
    800030c8:	00700c93          	li	s9,7
    800030cc:	f8d403a3          	sb	a3,-121(s0)
    800030d0:	00075c63          	bgez	a4,800030e8 <__printf+0x410>
    800030d4:	f9040713          	addi	a4,s0,-112
    800030d8:	00f70733          	add	a4,a4,a5
    800030dc:	02d00693          	li	a3,45
    800030e0:	fed70823          	sb	a3,-16(a4)
    800030e4:	00078c93          	mv	s9,a5
    800030e8:	f8040793          	addi	a5,s0,-128
    800030ec:	01978cb3          	add	s9,a5,s9
    800030f0:	f7f40d13          	addi	s10,s0,-129
    800030f4:	000cc503          	lbu	a0,0(s9)
    800030f8:	fffc8c93          	addi	s9,s9,-1
    800030fc:	00000097          	auipc	ra,0x0
    80003100:	9f8080e7          	jalr	-1544(ra) # 80002af4 <consputc>
    80003104:	ff9d18e3          	bne	s10,s9,800030f4 <__printf+0x41c>
    80003108:	0100006f          	j	80003118 <__printf+0x440>
    8000310c:	00000097          	auipc	ra,0x0
    80003110:	9e8080e7          	jalr	-1560(ra) # 80002af4 <consputc>
    80003114:	000c8493          	mv	s1,s9
    80003118:	00094503          	lbu	a0,0(s2)
    8000311c:	c60510e3          	bnez	a0,80002d7c <__printf+0xa4>
    80003120:	e40c0ee3          	beqz	s8,80002f7c <__printf+0x2a4>
    80003124:	00004517          	auipc	a0,0x4
    80003128:	c1c50513          	addi	a0,a0,-996 # 80006d40 <pr>
    8000312c:	00001097          	auipc	ra,0x1
    80003130:	94c080e7          	jalr	-1716(ra) # 80003a78 <release>
    80003134:	e49ff06f          	j	80002f7c <__printf+0x2a4>
    80003138:	f7843783          	ld	a5,-136(s0)
    8000313c:	03000513          	li	a0,48
    80003140:	01000d13          	li	s10,16
    80003144:	00878713          	addi	a4,a5,8
    80003148:	0007bc83          	ld	s9,0(a5)
    8000314c:	f6e43c23          	sd	a4,-136(s0)
    80003150:	00000097          	auipc	ra,0x0
    80003154:	9a4080e7          	jalr	-1628(ra) # 80002af4 <consputc>
    80003158:	07800513          	li	a0,120
    8000315c:	00000097          	auipc	ra,0x0
    80003160:	998080e7          	jalr	-1640(ra) # 80002af4 <consputc>
    80003164:	00002d97          	auipc	s11,0x2
    80003168:	1fcd8d93          	addi	s11,s11,508 # 80005360 <digits>
    8000316c:	03ccd793          	srli	a5,s9,0x3c
    80003170:	00fd87b3          	add	a5,s11,a5
    80003174:	0007c503          	lbu	a0,0(a5)
    80003178:	fffd0d1b          	addiw	s10,s10,-1
    8000317c:	004c9c93          	slli	s9,s9,0x4
    80003180:	00000097          	auipc	ra,0x0
    80003184:	974080e7          	jalr	-1676(ra) # 80002af4 <consputc>
    80003188:	fe0d12e3          	bnez	s10,8000316c <__printf+0x494>
    8000318c:	f8dff06f          	j	80003118 <__printf+0x440>
    80003190:	f7843783          	ld	a5,-136(s0)
    80003194:	0007bc83          	ld	s9,0(a5)
    80003198:	00878793          	addi	a5,a5,8
    8000319c:	f6f43c23          	sd	a5,-136(s0)
    800031a0:	000c9a63          	bnez	s9,800031b4 <__printf+0x4dc>
    800031a4:	1080006f          	j	800032ac <__printf+0x5d4>
    800031a8:	001c8c93          	addi	s9,s9,1
    800031ac:	00000097          	auipc	ra,0x0
    800031b0:	948080e7          	jalr	-1720(ra) # 80002af4 <consputc>
    800031b4:	000cc503          	lbu	a0,0(s9)
    800031b8:	fe0518e3          	bnez	a0,800031a8 <__printf+0x4d0>
    800031bc:	f5dff06f          	j	80003118 <__printf+0x440>
    800031c0:	02500513          	li	a0,37
    800031c4:	00000097          	auipc	ra,0x0
    800031c8:	930080e7          	jalr	-1744(ra) # 80002af4 <consputc>
    800031cc:	000c8513          	mv	a0,s9
    800031d0:	00000097          	auipc	ra,0x0
    800031d4:	924080e7          	jalr	-1756(ra) # 80002af4 <consputc>
    800031d8:	f41ff06f          	j	80003118 <__printf+0x440>
    800031dc:	02500513          	li	a0,37
    800031e0:	00000097          	auipc	ra,0x0
    800031e4:	914080e7          	jalr	-1772(ra) # 80002af4 <consputc>
    800031e8:	f31ff06f          	j	80003118 <__printf+0x440>
    800031ec:	00030513          	mv	a0,t1
    800031f0:	00000097          	auipc	ra,0x0
    800031f4:	7bc080e7          	jalr	1980(ra) # 800039ac <acquire>
    800031f8:	b4dff06f          	j	80002d44 <__printf+0x6c>
    800031fc:	40c0053b          	negw	a0,a2
    80003200:	00a00713          	li	a4,10
    80003204:	02e576bb          	remuw	a3,a0,a4
    80003208:	00002d97          	auipc	s11,0x2
    8000320c:	158d8d93          	addi	s11,s11,344 # 80005360 <digits>
    80003210:	ff700593          	li	a1,-9
    80003214:	02069693          	slli	a3,a3,0x20
    80003218:	0206d693          	srli	a3,a3,0x20
    8000321c:	00dd86b3          	add	a3,s11,a3
    80003220:	0006c683          	lbu	a3,0(a3)
    80003224:	02e557bb          	divuw	a5,a0,a4
    80003228:	f8d40023          	sb	a3,-128(s0)
    8000322c:	10b65e63          	bge	a2,a1,80003348 <__printf+0x670>
    80003230:	06300593          	li	a1,99
    80003234:	02e7f6bb          	remuw	a3,a5,a4
    80003238:	02069693          	slli	a3,a3,0x20
    8000323c:	0206d693          	srli	a3,a3,0x20
    80003240:	00dd86b3          	add	a3,s11,a3
    80003244:	0006c683          	lbu	a3,0(a3)
    80003248:	02e7d73b          	divuw	a4,a5,a4
    8000324c:	00200793          	li	a5,2
    80003250:	f8d400a3          	sb	a3,-127(s0)
    80003254:	bca5ece3          	bltu	a1,a0,80002e2c <__printf+0x154>
    80003258:	ce5ff06f          	j	80002f3c <__printf+0x264>
    8000325c:	40e007bb          	negw	a5,a4
    80003260:	00002d97          	auipc	s11,0x2
    80003264:	100d8d93          	addi	s11,s11,256 # 80005360 <digits>
    80003268:	00f7f693          	andi	a3,a5,15
    8000326c:	00dd86b3          	add	a3,s11,a3
    80003270:	0006c583          	lbu	a1,0(a3)
    80003274:	ff100613          	li	a2,-15
    80003278:	0047d69b          	srliw	a3,a5,0x4
    8000327c:	f8b40023          	sb	a1,-128(s0)
    80003280:	0047d59b          	srliw	a1,a5,0x4
    80003284:	0ac75e63          	bge	a4,a2,80003340 <__printf+0x668>
    80003288:	00f6f693          	andi	a3,a3,15
    8000328c:	00dd86b3          	add	a3,s11,a3
    80003290:	0006c603          	lbu	a2,0(a3)
    80003294:	00f00693          	li	a3,15
    80003298:	0087d79b          	srliw	a5,a5,0x8
    8000329c:	f8c400a3          	sb	a2,-127(s0)
    800032a0:	d8b6e4e3          	bltu	a3,a1,80003028 <__printf+0x350>
    800032a4:	00200793          	li	a5,2
    800032a8:	e2dff06f          	j	800030d4 <__printf+0x3fc>
    800032ac:	00002c97          	auipc	s9,0x2
    800032b0:	094c8c93          	addi	s9,s9,148 # 80005340 <_ZZ12printIntegermE6digits+0x320>
    800032b4:	02800513          	li	a0,40
    800032b8:	ef1ff06f          	j	800031a8 <__printf+0x4d0>
    800032bc:	00700793          	li	a5,7
    800032c0:	00600c93          	li	s9,6
    800032c4:	e0dff06f          	j	800030d0 <__printf+0x3f8>
    800032c8:	00700793          	li	a5,7
    800032cc:	00600c93          	li	s9,6
    800032d0:	c69ff06f          	j	80002f38 <__printf+0x260>
    800032d4:	00300793          	li	a5,3
    800032d8:	00200c93          	li	s9,2
    800032dc:	c5dff06f          	j	80002f38 <__printf+0x260>
    800032e0:	00300793          	li	a5,3
    800032e4:	00200c93          	li	s9,2
    800032e8:	de9ff06f          	j	800030d0 <__printf+0x3f8>
    800032ec:	00400793          	li	a5,4
    800032f0:	00300c93          	li	s9,3
    800032f4:	dddff06f          	j	800030d0 <__printf+0x3f8>
    800032f8:	00400793          	li	a5,4
    800032fc:	00300c93          	li	s9,3
    80003300:	c39ff06f          	j	80002f38 <__printf+0x260>
    80003304:	00500793          	li	a5,5
    80003308:	00400c93          	li	s9,4
    8000330c:	c2dff06f          	j	80002f38 <__printf+0x260>
    80003310:	00500793          	li	a5,5
    80003314:	00400c93          	li	s9,4
    80003318:	db9ff06f          	j	800030d0 <__printf+0x3f8>
    8000331c:	00600793          	li	a5,6
    80003320:	00500c93          	li	s9,5
    80003324:	dadff06f          	j	800030d0 <__printf+0x3f8>
    80003328:	00600793          	li	a5,6
    8000332c:	00500c93          	li	s9,5
    80003330:	c09ff06f          	j	80002f38 <__printf+0x260>
    80003334:	00800793          	li	a5,8
    80003338:	00700c93          	li	s9,7
    8000333c:	bfdff06f          	j	80002f38 <__printf+0x260>
    80003340:	00100793          	li	a5,1
    80003344:	d91ff06f          	j	800030d4 <__printf+0x3fc>
    80003348:	00100793          	li	a5,1
    8000334c:	bf1ff06f          	j	80002f3c <__printf+0x264>
    80003350:	00900793          	li	a5,9
    80003354:	00800c93          	li	s9,8
    80003358:	be1ff06f          	j	80002f38 <__printf+0x260>
    8000335c:	00002517          	auipc	a0,0x2
    80003360:	fec50513          	addi	a0,a0,-20 # 80005348 <_ZZ12printIntegermE6digits+0x328>
    80003364:	00000097          	auipc	ra,0x0
    80003368:	918080e7          	jalr	-1768(ra) # 80002c7c <panic>

000000008000336c <printfinit>:
    8000336c:	fe010113          	addi	sp,sp,-32
    80003370:	00813823          	sd	s0,16(sp)
    80003374:	00913423          	sd	s1,8(sp)
    80003378:	00113c23          	sd	ra,24(sp)
    8000337c:	02010413          	addi	s0,sp,32
    80003380:	00004497          	auipc	s1,0x4
    80003384:	9c048493          	addi	s1,s1,-1600 # 80006d40 <pr>
    80003388:	00048513          	mv	a0,s1
    8000338c:	00002597          	auipc	a1,0x2
    80003390:	fcc58593          	addi	a1,a1,-52 # 80005358 <_ZZ12printIntegermE6digits+0x338>
    80003394:	00000097          	auipc	ra,0x0
    80003398:	5f4080e7          	jalr	1524(ra) # 80003988 <initlock>
    8000339c:	01813083          	ld	ra,24(sp)
    800033a0:	01013403          	ld	s0,16(sp)
    800033a4:	0004ac23          	sw	zero,24(s1)
    800033a8:	00813483          	ld	s1,8(sp)
    800033ac:	02010113          	addi	sp,sp,32
    800033b0:	00008067          	ret

00000000800033b4 <uartinit>:
    800033b4:	ff010113          	addi	sp,sp,-16
    800033b8:	00813423          	sd	s0,8(sp)
    800033bc:	01010413          	addi	s0,sp,16
    800033c0:	100007b7          	lui	a5,0x10000
    800033c4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    800033c8:	f8000713          	li	a4,-128
    800033cc:	00e781a3          	sb	a4,3(a5)
    800033d0:	00300713          	li	a4,3
    800033d4:	00e78023          	sb	a4,0(a5)
    800033d8:	000780a3          	sb	zero,1(a5)
    800033dc:	00e781a3          	sb	a4,3(a5)
    800033e0:	00700693          	li	a3,7
    800033e4:	00d78123          	sb	a3,2(a5)
    800033e8:	00e780a3          	sb	a4,1(a5)
    800033ec:	00813403          	ld	s0,8(sp)
    800033f0:	01010113          	addi	sp,sp,16
    800033f4:	00008067          	ret

00000000800033f8 <uartputc>:
    800033f8:	00002797          	auipc	a5,0x2
    800033fc:	6c07a783          	lw	a5,1728(a5) # 80005ab8 <panicked>
    80003400:	00078463          	beqz	a5,80003408 <uartputc+0x10>
    80003404:	0000006f          	j	80003404 <uartputc+0xc>
    80003408:	fd010113          	addi	sp,sp,-48
    8000340c:	02813023          	sd	s0,32(sp)
    80003410:	00913c23          	sd	s1,24(sp)
    80003414:	01213823          	sd	s2,16(sp)
    80003418:	01313423          	sd	s3,8(sp)
    8000341c:	02113423          	sd	ra,40(sp)
    80003420:	03010413          	addi	s0,sp,48
    80003424:	00002917          	auipc	s2,0x2
    80003428:	69c90913          	addi	s2,s2,1692 # 80005ac0 <uart_tx_r>
    8000342c:	00093783          	ld	a5,0(s2)
    80003430:	00002497          	auipc	s1,0x2
    80003434:	69848493          	addi	s1,s1,1688 # 80005ac8 <uart_tx_w>
    80003438:	0004b703          	ld	a4,0(s1)
    8000343c:	02078693          	addi	a3,a5,32
    80003440:	00050993          	mv	s3,a0
    80003444:	02e69c63          	bne	a3,a4,8000347c <uartputc+0x84>
    80003448:	00001097          	auipc	ra,0x1
    8000344c:	834080e7          	jalr	-1996(ra) # 80003c7c <push_on>
    80003450:	00093783          	ld	a5,0(s2)
    80003454:	0004b703          	ld	a4,0(s1)
    80003458:	02078793          	addi	a5,a5,32
    8000345c:	00e79463          	bne	a5,a4,80003464 <uartputc+0x6c>
    80003460:	0000006f          	j	80003460 <uartputc+0x68>
    80003464:	00001097          	auipc	ra,0x1
    80003468:	88c080e7          	jalr	-1908(ra) # 80003cf0 <pop_on>
    8000346c:	00093783          	ld	a5,0(s2)
    80003470:	0004b703          	ld	a4,0(s1)
    80003474:	02078693          	addi	a3,a5,32
    80003478:	fce688e3          	beq	a3,a4,80003448 <uartputc+0x50>
    8000347c:	01f77693          	andi	a3,a4,31
    80003480:	00004597          	auipc	a1,0x4
    80003484:	8e058593          	addi	a1,a1,-1824 # 80006d60 <uart_tx_buf>
    80003488:	00d586b3          	add	a3,a1,a3
    8000348c:	00170713          	addi	a4,a4,1
    80003490:	01368023          	sb	s3,0(a3)
    80003494:	00e4b023          	sd	a4,0(s1)
    80003498:	10000637          	lui	a2,0x10000
    8000349c:	02f71063          	bne	a4,a5,800034bc <uartputc+0xc4>
    800034a0:	0340006f          	j	800034d4 <uartputc+0xdc>
    800034a4:	00074703          	lbu	a4,0(a4)
    800034a8:	00f93023          	sd	a5,0(s2)
    800034ac:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    800034b0:	00093783          	ld	a5,0(s2)
    800034b4:	0004b703          	ld	a4,0(s1)
    800034b8:	00f70e63          	beq	a4,a5,800034d4 <uartputc+0xdc>
    800034bc:	00564683          	lbu	a3,5(a2)
    800034c0:	01f7f713          	andi	a4,a5,31
    800034c4:	00e58733          	add	a4,a1,a4
    800034c8:	0206f693          	andi	a3,a3,32
    800034cc:	00178793          	addi	a5,a5,1
    800034d0:	fc069ae3          	bnez	a3,800034a4 <uartputc+0xac>
    800034d4:	02813083          	ld	ra,40(sp)
    800034d8:	02013403          	ld	s0,32(sp)
    800034dc:	01813483          	ld	s1,24(sp)
    800034e0:	01013903          	ld	s2,16(sp)
    800034e4:	00813983          	ld	s3,8(sp)
    800034e8:	03010113          	addi	sp,sp,48
    800034ec:	00008067          	ret

00000000800034f0 <uartputc_sync>:
    800034f0:	ff010113          	addi	sp,sp,-16
    800034f4:	00813423          	sd	s0,8(sp)
    800034f8:	01010413          	addi	s0,sp,16
    800034fc:	00002717          	auipc	a4,0x2
    80003500:	5bc72703          	lw	a4,1468(a4) # 80005ab8 <panicked>
    80003504:	02071663          	bnez	a4,80003530 <uartputc_sync+0x40>
    80003508:	00050793          	mv	a5,a0
    8000350c:	100006b7          	lui	a3,0x10000
    80003510:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80003514:	02077713          	andi	a4,a4,32
    80003518:	fe070ce3          	beqz	a4,80003510 <uartputc_sync+0x20>
    8000351c:	0ff7f793          	andi	a5,a5,255
    80003520:	00f68023          	sb	a5,0(a3)
    80003524:	00813403          	ld	s0,8(sp)
    80003528:	01010113          	addi	sp,sp,16
    8000352c:	00008067          	ret
    80003530:	0000006f          	j	80003530 <uartputc_sync+0x40>

0000000080003534 <uartstart>:
    80003534:	ff010113          	addi	sp,sp,-16
    80003538:	00813423          	sd	s0,8(sp)
    8000353c:	01010413          	addi	s0,sp,16
    80003540:	00002617          	auipc	a2,0x2
    80003544:	58060613          	addi	a2,a2,1408 # 80005ac0 <uart_tx_r>
    80003548:	00002517          	auipc	a0,0x2
    8000354c:	58050513          	addi	a0,a0,1408 # 80005ac8 <uart_tx_w>
    80003550:	00063783          	ld	a5,0(a2)
    80003554:	00053703          	ld	a4,0(a0)
    80003558:	04f70263          	beq	a4,a5,8000359c <uartstart+0x68>
    8000355c:	100005b7          	lui	a1,0x10000
    80003560:	00004817          	auipc	a6,0x4
    80003564:	80080813          	addi	a6,a6,-2048 # 80006d60 <uart_tx_buf>
    80003568:	01c0006f          	j	80003584 <uartstart+0x50>
    8000356c:	0006c703          	lbu	a4,0(a3)
    80003570:	00f63023          	sd	a5,0(a2)
    80003574:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80003578:	00063783          	ld	a5,0(a2)
    8000357c:	00053703          	ld	a4,0(a0)
    80003580:	00f70e63          	beq	a4,a5,8000359c <uartstart+0x68>
    80003584:	01f7f713          	andi	a4,a5,31
    80003588:	00e806b3          	add	a3,a6,a4
    8000358c:	0055c703          	lbu	a4,5(a1)
    80003590:	00178793          	addi	a5,a5,1
    80003594:	02077713          	andi	a4,a4,32
    80003598:	fc071ae3          	bnez	a4,8000356c <uartstart+0x38>
    8000359c:	00813403          	ld	s0,8(sp)
    800035a0:	01010113          	addi	sp,sp,16
    800035a4:	00008067          	ret

00000000800035a8 <uartgetc>:
    800035a8:	ff010113          	addi	sp,sp,-16
    800035ac:	00813423          	sd	s0,8(sp)
    800035b0:	01010413          	addi	s0,sp,16
    800035b4:	10000737          	lui	a4,0x10000
    800035b8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    800035bc:	0017f793          	andi	a5,a5,1
    800035c0:	00078c63          	beqz	a5,800035d8 <uartgetc+0x30>
    800035c4:	00074503          	lbu	a0,0(a4)
    800035c8:	0ff57513          	andi	a0,a0,255
    800035cc:	00813403          	ld	s0,8(sp)
    800035d0:	01010113          	addi	sp,sp,16
    800035d4:	00008067          	ret
    800035d8:	fff00513          	li	a0,-1
    800035dc:	ff1ff06f          	j	800035cc <uartgetc+0x24>

00000000800035e0 <uartintr>:
    800035e0:	100007b7          	lui	a5,0x10000
    800035e4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    800035e8:	0017f793          	andi	a5,a5,1
    800035ec:	0a078463          	beqz	a5,80003694 <uartintr+0xb4>
    800035f0:	fe010113          	addi	sp,sp,-32
    800035f4:	00813823          	sd	s0,16(sp)
    800035f8:	00913423          	sd	s1,8(sp)
    800035fc:	00113c23          	sd	ra,24(sp)
    80003600:	02010413          	addi	s0,sp,32
    80003604:	100004b7          	lui	s1,0x10000
    80003608:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000360c:	0ff57513          	andi	a0,a0,255
    80003610:	fffff097          	auipc	ra,0xfffff
    80003614:	534080e7          	jalr	1332(ra) # 80002b44 <consoleintr>
    80003618:	0054c783          	lbu	a5,5(s1)
    8000361c:	0017f793          	andi	a5,a5,1
    80003620:	fe0794e3          	bnez	a5,80003608 <uartintr+0x28>
    80003624:	00002617          	auipc	a2,0x2
    80003628:	49c60613          	addi	a2,a2,1180 # 80005ac0 <uart_tx_r>
    8000362c:	00002517          	auipc	a0,0x2
    80003630:	49c50513          	addi	a0,a0,1180 # 80005ac8 <uart_tx_w>
    80003634:	00063783          	ld	a5,0(a2)
    80003638:	00053703          	ld	a4,0(a0)
    8000363c:	04f70263          	beq	a4,a5,80003680 <uartintr+0xa0>
    80003640:	100005b7          	lui	a1,0x10000
    80003644:	00003817          	auipc	a6,0x3
    80003648:	71c80813          	addi	a6,a6,1820 # 80006d60 <uart_tx_buf>
    8000364c:	01c0006f          	j	80003668 <uartintr+0x88>
    80003650:	0006c703          	lbu	a4,0(a3)
    80003654:	00f63023          	sd	a5,0(a2)
    80003658:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000365c:	00063783          	ld	a5,0(a2)
    80003660:	00053703          	ld	a4,0(a0)
    80003664:	00f70e63          	beq	a4,a5,80003680 <uartintr+0xa0>
    80003668:	01f7f713          	andi	a4,a5,31
    8000366c:	00e806b3          	add	a3,a6,a4
    80003670:	0055c703          	lbu	a4,5(a1)
    80003674:	00178793          	addi	a5,a5,1
    80003678:	02077713          	andi	a4,a4,32
    8000367c:	fc071ae3          	bnez	a4,80003650 <uartintr+0x70>
    80003680:	01813083          	ld	ra,24(sp)
    80003684:	01013403          	ld	s0,16(sp)
    80003688:	00813483          	ld	s1,8(sp)
    8000368c:	02010113          	addi	sp,sp,32
    80003690:	00008067          	ret
    80003694:	00002617          	auipc	a2,0x2
    80003698:	42c60613          	addi	a2,a2,1068 # 80005ac0 <uart_tx_r>
    8000369c:	00002517          	auipc	a0,0x2
    800036a0:	42c50513          	addi	a0,a0,1068 # 80005ac8 <uart_tx_w>
    800036a4:	00063783          	ld	a5,0(a2)
    800036a8:	00053703          	ld	a4,0(a0)
    800036ac:	04f70263          	beq	a4,a5,800036f0 <uartintr+0x110>
    800036b0:	100005b7          	lui	a1,0x10000
    800036b4:	00003817          	auipc	a6,0x3
    800036b8:	6ac80813          	addi	a6,a6,1708 # 80006d60 <uart_tx_buf>
    800036bc:	01c0006f          	j	800036d8 <uartintr+0xf8>
    800036c0:	0006c703          	lbu	a4,0(a3)
    800036c4:	00f63023          	sd	a5,0(a2)
    800036c8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800036cc:	00063783          	ld	a5,0(a2)
    800036d0:	00053703          	ld	a4,0(a0)
    800036d4:	02f70063          	beq	a4,a5,800036f4 <uartintr+0x114>
    800036d8:	01f7f713          	andi	a4,a5,31
    800036dc:	00e806b3          	add	a3,a6,a4
    800036e0:	0055c703          	lbu	a4,5(a1)
    800036e4:	00178793          	addi	a5,a5,1
    800036e8:	02077713          	andi	a4,a4,32
    800036ec:	fc071ae3          	bnez	a4,800036c0 <uartintr+0xe0>
    800036f0:	00008067          	ret
    800036f4:	00008067          	ret

00000000800036f8 <kinit>:
    800036f8:	fc010113          	addi	sp,sp,-64
    800036fc:	02913423          	sd	s1,40(sp)
    80003700:	fffff7b7          	lui	a5,0xfffff
    80003704:	00004497          	auipc	s1,0x4
    80003708:	67b48493          	addi	s1,s1,1659 # 80007d7f <end+0xfff>
    8000370c:	02813823          	sd	s0,48(sp)
    80003710:	01313c23          	sd	s3,24(sp)
    80003714:	00f4f4b3          	and	s1,s1,a5
    80003718:	02113c23          	sd	ra,56(sp)
    8000371c:	03213023          	sd	s2,32(sp)
    80003720:	01413823          	sd	s4,16(sp)
    80003724:	01513423          	sd	s5,8(sp)
    80003728:	04010413          	addi	s0,sp,64
    8000372c:	000017b7          	lui	a5,0x1
    80003730:	01100993          	li	s3,17
    80003734:	00f487b3          	add	a5,s1,a5
    80003738:	01b99993          	slli	s3,s3,0x1b
    8000373c:	06f9e063          	bltu	s3,a5,8000379c <kinit+0xa4>
    80003740:	00003a97          	auipc	s5,0x3
    80003744:	640a8a93          	addi	s5,s5,1600 # 80006d80 <end>
    80003748:	0754ec63          	bltu	s1,s5,800037c0 <kinit+0xc8>
    8000374c:	0734fa63          	bgeu	s1,s3,800037c0 <kinit+0xc8>
    80003750:	00088a37          	lui	s4,0x88
    80003754:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80003758:	00002917          	auipc	s2,0x2
    8000375c:	37890913          	addi	s2,s2,888 # 80005ad0 <kmem>
    80003760:	00ca1a13          	slli	s4,s4,0xc
    80003764:	0140006f          	j	80003778 <kinit+0x80>
    80003768:	000017b7          	lui	a5,0x1
    8000376c:	00f484b3          	add	s1,s1,a5
    80003770:	0554e863          	bltu	s1,s5,800037c0 <kinit+0xc8>
    80003774:	0534f663          	bgeu	s1,s3,800037c0 <kinit+0xc8>
    80003778:	00001637          	lui	a2,0x1
    8000377c:	00100593          	li	a1,1
    80003780:	00048513          	mv	a0,s1
    80003784:	00000097          	auipc	ra,0x0
    80003788:	5e4080e7          	jalr	1508(ra) # 80003d68 <__memset>
    8000378c:	00093783          	ld	a5,0(s2)
    80003790:	00f4b023          	sd	a5,0(s1)
    80003794:	00993023          	sd	s1,0(s2)
    80003798:	fd4498e3          	bne	s1,s4,80003768 <kinit+0x70>
    8000379c:	03813083          	ld	ra,56(sp)
    800037a0:	03013403          	ld	s0,48(sp)
    800037a4:	02813483          	ld	s1,40(sp)
    800037a8:	02013903          	ld	s2,32(sp)
    800037ac:	01813983          	ld	s3,24(sp)
    800037b0:	01013a03          	ld	s4,16(sp)
    800037b4:	00813a83          	ld	s5,8(sp)
    800037b8:	04010113          	addi	sp,sp,64
    800037bc:	00008067          	ret
    800037c0:	00002517          	auipc	a0,0x2
    800037c4:	bb850513          	addi	a0,a0,-1096 # 80005378 <digits+0x18>
    800037c8:	fffff097          	auipc	ra,0xfffff
    800037cc:	4b4080e7          	jalr	1204(ra) # 80002c7c <panic>

00000000800037d0 <freerange>:
    800037d0:	fc010113          	addi	sp,sp,-64
    800037d4:	000017b7          	lui	a5,0x1
    800037d8:	02913423          	sd	s1,40(sp)
    800037dc:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    800037e0:	009504b3          	add	s1,a0,s1
    800037e4:	fffff537          	lui	a0,0xfffff
    800037e8:	02813823          	sd	s0,48(sp)
    800037ec:	02113c23          	sd	ra,56(sp)
    800037f0:	03213023          	sd	s2,32(sp)
    800037f4:	01313c23          	sd	s3,24(sp)
    800037f8:	01413823          	sd	s4,16(sp)
    800037fc:	01513423          	sd	s5,8(sp)
    80003800:	01613023          	sd	s6,0(sp)
    80003804:	04010413          	addi	s0,sp,64
    80003808:	00a4f4b3          	and	s1,s1,a0
    8000380c:	00f487b3          	add	a5,s1,a5
    80003810:	06f5e463          	bltu	a1,a5,80003878 <freerange+0xa8>
    80003814:	00003a97          	auipc	s5,0x3
    80003818:	56ca8a93          	addi	s5,s5,1388 # 80006d80 <end>
    8000381c:	0954e263          	bltu	s1,s5,800038a0 <freerange+0xd0>
    80003820:	01100993          	li	s3,17
    80003824:	01b99993          	slli	s3,s3,0x1b
    80003828:	0734fc63          	bgeu	s1,s3,800038a0 <freerange+0xd0>
    8000382c:	00058a13          	mv	s4,a1
    80003830:	00002917          	auipc	s2,0x2
    80003834:	2a090913          	addi	s2,s2,672 # 80005ad0 <kmem>
    80003838:	00002b37          	lui	s6,0x2
    8000383c:	0140006f          	j	80003850 <freerange+0x80>
    80003840:	000017b7          	lui	a5,0x1
    80003844:	00f484b3          	add	s1,s1,a5
    80003848:	0554ec63          	bltu	s1,s5,800038a0 <freerange+0xd0>
    8000384c:	0534fa63          	bgeu	s1,s3,800038a0 <freerange+0xd0>
    80003850:	00001637          	lui	a2,0x1
    80003854:	00100593          	li	a1,1
    80003858:	00048513          	mv	a0,s1
    8000385c:	00000097          	auipc	ra,0x0
    80003860:	50c080e7          	jalr	1292(ra) # 80003d68 <__memset>
    80003864:	00093703          	ld	a4,0(s2)
    80003868:	016487b3          	add	a5,s1,s6
    8000386c:	00e4b023          	sd	a4,0(s1)
    80003870:	00993023          	sd	s1,0(s2)
    80003874:	fcfa76e3          	bgeu	s4,a5,80003840 <freerange+0x70>
    80003878:	03813083          	ld	ra,56(sp)
    8000387c:	03013403          	ld	s0,48(sp)
    80003880:	02813483          	ld	s1,40(sp)
    80003884:	02013903          	ld	s2,32(sp)
    80003888:	01813983          	ld	s3,24(sp)
    8000388c:	01013a03          	ld	s4,16(sp)
    80003890:	00813a83          	ld	s5,8(sp)
    80003894:	00013b03          	ld	s6,0(sp)
    80003898:	04010113          	addi	sp,sp,64
    8000389c:	00008067          	ret
    800038a0:	00002517          	auipc	a0,0x2
    800038a4:	ad850513          	addi	a0,a0,-1320 # 80005378 <digits+0x18>
    800038a8:	fffff097          	auipc	ra,0xfffff
    800038ac:	3d4080e7          	jalr	980(ra) # 80002c7c <panic>

00000000800038b0 <kfree>:
    800038b0:	fe010113          	addi	sp,sp,-32
    800038b4:	00813823          	sd	s0,16(sp)
    800038b8:	00113c23          	sd	ra,24(sp)
    800038bc:	00913423          	sd	s1,8(sp)
    800038c0:	02010413          	addi	s0,sp,32
    800038c4:	03451793          	slli	a5,a0,0x34
    800038c8:	04079c63          	bnez	a5,80003920 <kfree+0x70>
    800038cc:	00003797          	auipc	a5,0x3
    800038d0:	4b478793          	addi	a5,a5,1204 # 80006d80 <end>
    800038d4:	00050493          	mv	s1,a0
    800038d8:	04f56463          	bltu	a0,a5,80003920 <kfree+0x70>
    800038dc:	01100793          	li	a5,17
    800038e0:	01b79793          	slli	a5,a5,0x1b
    800038e4:	02f57e63          	bgeu	a0,a5,80003920 <kfree+0x70>
    800038e8:	00001637          	lui	a2,0x1
    800038ec:	00100593          	li	a1,1
    800038f0:	00000097          	auipc	ra,0x0
    800038f4:	478080e7          	jalr	1144(ra) # 80003d68 <__memset>
    800038f8:	00002797          	auipc	a5,0x2
    800038fc:	1d878793          	addi	a5,a5,472 # 80005ad0 <kmem>
    80003900:	0007b703          	ld	a4,0(a5)
    80003904:	01813083          	ld	ra,24(sp)
    80003908:	01013403          	ld	s0,16(sp)
    8000390c:	00e4b023          	sd	a4,0(s1)
    80003910:	0097b023          	sd	s1,0(a5)
    80003914:	00813483          	ld	s1,8(sp)
    80003918:	02010113          	addi	sp,sp,32
    8000391c:	00008067          	ret
    80003920:	00002517          	auipc	a0,0x2
    80003924:	a5850513          	addi	a0,a0,-1448 # 80005378 <digits+0x18>
    80003928:	fffff097          	auipc	ra,0xfffff
    8000392c:	354080e7          	jalr	852(ra) # 80002c7c <panic>

0000000080003930 <kalloc>:
    80003930:	fe010113          	addi	sp,sp,-32
    80003934:	00813823          	sd	s0,16(sp)
    80003938:	00913423          	sd	s1,8(sp)
    8000393c:	00113c23          	sd	ra,24(sp)
    80003940:	02010413          	addi	s0,sp,32
    80003944:	00002797          	auipc	a5,0x2
    80003948:	18c78793          	addi	a5,a5,396 # 80005ad0 <kmem>
    8000394c:	0007b483          	ld	s1,0(a5)
    80003950:	02048063          	beqz	s1,80003970 <kalloc+0x40>
    80003954:	0004b703          	ld	a4,0(s1)
    80003958:	00001637          	lui	a2,0x1
    8000395c:	00500593          	li	a1,5
    80003960:	00048513          	mv	a0,s1
    80003964:	00e7b023          	sd	a4,0(a5)
    80003968:	00000097          	auipc	ra,0x0
    8000396c:	400080e7          	jalr	1024(ra) # 80003d68 <__memset>
    80003970:	01813083          	ld	ra,24(sp)
    80003974:	01013403          	ld	s0,16(sp)
    80003978:	00048513          	mv	a0,s1
    8000397c:	00813483          	ld	s1,8(sp)
    80003980:	02010113          	addi	sp,sp,32
    80003984:	00008067          	ret

0000000080003988 <initlock>:
    80003988:	ff010113          	addi	sp,sp,-16
    8000398c:	00813423          	sd	s0,8(sp)
    80003990:	01010413          	addi	s0,sp,16
    80003994:	00813403          	ld	s0,8(sp)
    80003998:	00b53423          	sd	a1,8(a0)
    8000399c:	00052023          	sw	zero,0(a0)
    800039a0:	00053823          	sd	zero,16(a0)
    800039a4:	01010113          	addi	sp,sp,16
    800039a8:	00008067          	ret

00000000800039ac <acquire>:
    800039ac:	fe010113          	addi	sp,sp,-32
    800039b0:	00813823          	sd	s0,16(sp)
    800039b4:	00913423          	sd	s1,8(sp)
    800039b8:	00113c23          	sd	ra,24(sp)
    800039bc:	01213023          	sd	s2,0(sp)
    800039c0:	02010413          	addi	s0,sp,32
    800039c4:	00050493          	mv	s1,a0
    800039c8:	10002973          	csrr	s2,sstatus
    800039cc:	100027f3          	csrr	a5,sstatus
    800039d0:	ffd7f793          	andi	a5,a5,-3
    800039d4:	10079073          	csrw	sstatus,a5
    800039d8:	fffff097          	auipc	ra,0xfffff
    800039dc:	8e8080e7          	jalr	-1816(ra) # 800022c0 <mycpu>
    800039e0:	07852783          	lw	a5,120(a0)
    800039e4:	06078e63          	beqz	a5,80003a60 <acquire+0xb4>
    800039e8:	fffff097          	auipc	ra,0xfffff
    800039ec:	8d8080e7          	jalr	-1832(ra) # 800022c0 <mycpu>
    800039f0:	07852783          	lw	a5,120(a0)
    800039f4:	0004a703          	lw	a4,0(s1)
    800039f8:	0017879b          	addiw	a5,a5,1
    800039fc:	06f52c23          	sw	a5,120(a0)
    80003a00:	04071063          	bnez	a4,80003a40 <acquire+0x94>
    80003a04:	00100713          	li	a4,1
    80003a08:	00070793          	mv	a5,a4
    80003a0c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80003a10:	0007879b          	sext.w	a5,a5
    80003a14:	fe079ae3          	bnez	a5,80003a08 <acquire+0x5c>
    80003a18:	0ff0000f          	fence
    80003a1c:	fffff097          	auipc	ra,0xfffff
    80003a20:	8a4080e7          	jalr	-1884(ra) # 800022c0 <mycpu>
    80003a24:	01813083          	ld	ra,24(sp)
    80003a28:	01013403          	ld	s0,16(sp)
    80003a2c:	00a4b823          	sd	a0,16(s1)
    80003a30:	00013903          	ld	s2,0(sp)
    80003a34:	00813483          	ld	s1,8(sp)
    80003a38:	02010113          	addi	sp,sp,32
    80003a3c:	00008067          	ret
    80003a40:	0104b903          	ld	s2,16(s1)
    80003a44:	fffff097          	auipc	ra,0xfffff
    80003a48:	87c080e7          	jalr	-1924(ra) # 800022c0 <mycpu>
    80003a4c:	faa91ce3          	bne	s2,a0,80003a04 <acquire+0x58>
    80003a50:	00002517          	auipc	a0,0x2
    80003a54:	93050513          	addi	a0,a0,-1744 # 80005380 <digits+0x20>
    80003a58:	fffff097          	auipc	ra,0xfffff
    80003a5c:	224080e7          	jalr	548(ra) # 80002c7c <panic>
    80003a60:	00195913          	srli	s2,s2,0x1
    80003a64:	fffff097          	auipc	ra,0xfffff
    80003a68:	85c080e7          	jalr	-1956(ra) # 800022c0 <mycpu>
    80003a6c:	00197913          	andi	s2,s2,1
    80003a70:	07252e23          	sw	s2,124(a0)
    80003a74:	f75ff06f          	j	800039e8 <acquire+0x3c>

0000000080003a78 <release>:
    80003a78:	fe010113          	addi	sp,sp,-32
    80003a7c:	00813823          	sd	s0,16(sp)
    80003a80:	00113c23          	sd	ra,24(sp)
    80003a84:	00913423          	sd	s1,8(sp)
    80003a88:	01213023          	sd	s2,0(sp)
    80003a8c:	02010413          	addi	s0,sp,32
    80003a90:	00052783          	lw	a5,0(a0)
    80003a94:	00079a63          	bnez	a5,80003aa8 <release+0x30>
    80003a98:	00002517          	auipc	a0,0x2
    80003a9c:	8f050513          	addi	a0,a0,-1808 # 80005388 <digits+0x28>
    80003aa0:	fffff097          	auipc	ra,0xfffff
    80003aa4:	1dc080e7          	jalr	476(ra) # 80002c7c <panic>
    80003aa8:	01053903          	ld	s2,16(a0)
    80003aac:	00050493          	mv	s1,a0
    80003ab0:	fffff097          	auipc	ra,0xfffff
    80003ab4:	810080e7          	jalr	-2032(ra) # 800022c0 <mycpu>
    80003ab8:	fea910e3          	bne	s2,a0,80003a98 <release+0x20>
    80003abc:	0004b823          	sd	zero,16(s1)
    80003ac0:	0ff0000f          	fence
    80003ac4:	0f50000f          	fence	iorw,ow
    80003ac8:	0804a02f          	amoswap.w	zero,zero,(s1)
    80003acc:	ffffe097          	auipc	ra,0xffffe
    80003ad0:	7f4080e7          	jalr	2036(ra) # 800022c0 <mycpu>
    80003ad4:	100027f3          	csrr	a5,sstatus
    80003ad8:	0027f793          	andi	a5,a5,2
    80003adc:	04079a63          	bnez	a5,80003b30 <release+0xb8>
    80003ae0:	07852783          	lw	a5,120(a0)
    80003ae4:	02f05e63          	blez	a5,80003b20 <release+0xa8>
    80003ae8:	fff7871b          	addiw	a4,a5,-1
    80003aec:	06e52c23          	sw	a4,120(a0)
    80003af0:	00071c63          	bnez	a4,80003b08 <release+0x90>
    80003af4:	07c52783          	lw	a5,124(a0)
    80003af8:	00078863          	beqz	a5,80003b08 <release+0x90>
    80003afc:	100027f3          	csrr	a5,sstatus
    80003b00:	0027e793          	ori	a5,a5,2
    80003b04:	10079073          	csrw	sstatus,a5
    80003b08:	01813083          	ld	ra,24(sp)
    80003b0c:	01013403          	ld	s0,16(sp)
    80003b10:	00813483          	ld	s1,8(sp)
    80003b14:	00013903          	ld	s2,0(sp)
    80003b18:	02010113          	addi	sp,sp,32
    80003b1c:	00008067          	ret
    80003b20:	00002517          	auipc	a0,0x2
    80003b24:	88850513          	addi	a0,a0,-1912 # 800053a8 <digits+0x48>
    80003b28:	fffff097          	auipc	ra,0xfffff
    80003b2c:	154080e7          	jalr	340(ra) # 80002c7c <panic>
    80003b30:	00002517          	auipc	a0,0x2
    80003b34:	86050513          	addi	a0,a0,-1952 # 80005390 <digits+0x30>
    80003b38:	fffff097          	auipc	ra,0xfffff
    80003b3c:	144080e7          	jalr	324(ra) # 80002c7c <panic>

0000000080003b40 <holding>:
    80003b40:	00052783          	lw	a5,0(a0)
    80003b44:	00079663          	bnez	a5,80003b50 <holding+0x10>
    80003b48:	00000513          	li	a0,0
    80003b4c:	00008067          	ret
    80003b50:	fe010113          	addi	sp,sp,-32
    80003b54:	00813823          	sd	s0,16(sp)
    80003b58:	00913423          	sd	s1,8(sp)
    80003b5c:	00113c23          	sd	ra,24(sp)
    80003b60:	02010413          	addi	s0,sp,32
    80003b64:	01053483          	ld	s1,16(a0)
    80003b68:	ffffe097          	auipc	ra,0xffffe
    80003b6c:	758080e7          	jalr	1880(ra) # 800022c0 <mycpu>
    80003b70:	01813083          	ld	ra,24(sp)
    80003b74:	01013403          	ld	s0,16(sp)
    80003b78:	40a48533          	sub	a0,s1,a0
    80003b7c:	00153513          	seqz	a0,a0
    80003b80:	00813483          	ld	s1,8(sp)
    80003b84:	02010113          	addi	sp,sp,32
    80003b88:	00008067          	ret

0000000080003b8c <push_off>:
    80003b8c:	fe010113          	addi	sp,sp,-32
    80003b90:	00813823          	sd	s0,16(sp)
    80003b94:	00113c23          	sd	ra,24(sp)
    80003b98:	00913423          	sd	s1,8(sp)
    80003b9c:	02010413          	addi	s0,sp,32
    80003ba0:	100024f3          	csrr	s1,sstatus
    80003ba4:	100027f3          	csrr	a5,sstatus
    80003ba8:	ffd7f793          	andi	a5,a5,-3
    80003bac:	10079073          	csrw	sstatus,a5
    80003bb0:	ffffe097          	auipc	ra,0xffffe
    80003bb4:	710080e7          	jalr	1808(ra) # 800022c0 <mycpu>
    80003bb8:	07852783          	lw	a5,120(a0)
    80003bbc:	02078663          	beqz	a5,80003be8 <push_off+0x5c>
    80003bc0:	ffffe097          	auipc	ra,0xffffe
    80003bc4:	700080e7          	jalr	1792(ra) # 800022c0 <mycpu>
    80003bc8:	07852783          	lw	a5,120(a0)
    80003bcc:	01813083          	ld	ra,24(sp)
    80003bd0:	01013403          	ld	s0,16(sp)
    80003bd4:	0017879b          	addiw	a5,a5,1
    80003bd8:	06f52c23          	sw	a5,120(a0)
    80003bdc:	00813483          	ld	s1,8(sp)
    80003be0:	02010113          	addi	sp,sp,32
    80003be4:	00008067          	ret
    80003be8:	0014d493          	srli	s1,s1,0x1
    80003bec:	ffffe097          	auipc	ra,0xffffe
    80003bf0:	6d4080e7          	jalr	1748(ra) # 800022c0 <mycpu>
    80003bf4:	0014f493          	andi	s1,s1,1
    80003bf8:	06952e23          	sw	s1,124(a0)
    80003bfc:	fc5ff06f          	j	80003bc0 <push_off+0x34>

0000000080003c00 <pop_off>:
    80003c00:	ff010113          	addi	sp,sp,-16
    80003c04:	00813023          	sd	s0,0(sp)
    80003c08:	00113423          	sd	ra,8(sp)
    80003c0c:	01010413          	addi	s0,sp,16
    80003c10:	ffffe097          	auipc	ra,0xffffe
    80003c14:	6b0080e7          	jalr	1712(ra) # 800022c0 <mycpu>
    80003c18:	100027f3          	csrr	a5,sstatus
    80003c1c:	0027f793          	andi	a5,a5,2
    80003c20:	04079663          	bnez	a5,80003c6c <pop_off+0x6c>
    80003c24:	07852783          	lw	a5,120(a0)
    80003c28:	02f05a63          	blez	a5,80003c5c <pop_off+0x5c>
    80003c2c:	fff7871b          	addiw	a4,a5,-1
    80003c30:	06e52c23          	sw	a4,120(a0)
    80003c34:	00071c63          	bnez	a4,80003c4c <pop_off+0x4c>
    80003c38:	07c52783          	lw	a5,124(a0)
    80003c3c:	00078863          	beqz	a5,80003c4c <pop_off+0x4c>
    80003c40:	100027f3          	csrr	a5,sstatus
    80003c44:	0027e793          	ori	a5,a5,2
    80003c48:	10079073          	csrw	sstatus,a5
    80003c4c:	00813083          	ld	ra,8(sp)
    80003c50:	00013403          	ld	s0,0(sp)
    80003c54:	01010113          	addi	sp,sp,16
    80003c58:	00008067          	ret
    80003c5c:	00001517          	auipc	a0,0x1
    80003c60:	74c50513          	addi	a0,a0,1868 # 800053a8 <digits+0x48>
    80003c64:	fffff097          	auipc	ra,0xfffff
    80003c68:	018080e7          	jalr	24(ra) # 80002c7c <panic>
    80003c6c:	00001517          	auipc	a0,0x1
    80003c70:	72450513          	addi	a0,a0,1828 # 80005390 <digits+0x30>
    80003c74:	fffff097          	auipc	ra,0xfffff
    80003c78:	008080e7          	jalr	8(ra) # 80002c7c <panic>

0000000080003c7c <push_on>:
    80003c7c:	fe010113          	addi	sp,sp,-32
    80003c80:	00813823          	sd	s0,16(sp)
    80003c84:	00113c23          	sd	ra,24(sp)
    80003c88:	00913423          	sd	s1,8(sp)
    80003c8c:	02010413          	addi	s0,sp,32
    80003c90:	100024f3          	csrr	s1,sstatus
    80003c94:	100027f3          	csrr	a5,sstatus
    80003c98:	0027e793          	ori	a5,a5,2
    80003c9c:	10079073          	csrw	sstatus,a5
    80003ca0:	ffffe097          	auipc	ra,0xffffe
    80003ca4:	620080e7          	jalr	1568(ra) # 800022c0 <mycpu>
    80003ca8:	07852783          	lw	a5,120(a0)
    80003cac:	02078663          	beqz	a5,80003cd8 <push_on+0x5c>
    80003cb0:	ffffe097          	auipc	ra,0xffffe
    80003cb4:	610080e7          	jalr	1552(ra) # 800022c0 <mycpu>
    80003cb8:	07852783          	lw	a5,120(a0)
    80003cbc:	01813083          	ld	ra,24(sp)
    80003cc0:	01013403          	ld	s0,16(sp)
    80003cc4:	0017879b          	addiw	a5,a5,1
    80003cc8:	06f52c23          	sw	a5,120(a0)
    80003ccc:	00813483          	ld	s1,8(sp)
    80003cd0:	02010113          	addi	sp,sp,32
    80003cd4:	00008067          	ret
    80003cd8:	0014d493          	srli	s1,s1,0x1
    80003cdc:	ffffe097          	auipc	ra,0xffffe
    80003ce0:	5e4080e7          	jalr	1508(ra) # 800022c0 <mycpu>
    80003ce4:	0014f493          	andi	s1,s1,1
    80003ce8:	06952e23          	sw	s1,124(a0)
    80003cec:	fc5ff06f          	j	80003cb0 <push_on+0x34>

0000000080003cf0 <pop_on>:
    80003cf0:	ff010113          	addi	sp,sp,-16
    80003cf4:	00813023          	sd	s0,0(sp)
    80003cf8:	00113423          	sd	ra,8(sp)
    80003cfc:	01010413          	addi	s0,sp,16
    80003d00:	ffffe097          	auipc	ra,0xffffe
    80003d04:	5c0080e7          	jalr	1472(ra) # 800022c0 <mycpu>
    80003d08:	100027f3          	csrr	a5,sstatus
    80003d0c:	0027f793          	andi	a5,a5,2
    80003d10:	04078463          	beqz	a5,80003d58 <pop_on+0x68>
    80003d14:	07852783          	lw	a5,120(a0)
    80003d18:	02f05863          	blez	a5,80003d48 <pop_on+0x58>
    80003d1c:	fff7879b          	addiw	a5,a5,-1
    80003d20:	06f52c23          	sw	a5,120(a0)
    80003d24:	07853783          	ld	a5,120(a0)
    80003d28:	00079863          	bnez	a5,80003d38 <pop_on+0x48>
    80003d2c:	100027f3          	csrr	a5,sstatus
    80003d30:	ffd7f793          	andi	a5,a5,-3
    80003d34:	10079073          	csrw	sstatus,a5
    80003d38:	00813083          	ld	ra,8(sp)
    80003d3c:	00013403          	ld	s0,0(sp)
    80003d40:	01010113          	addi	sp,sp,16
    80003d44:	00008067          	ret
    80003d48:	00001517          	auipc	a0,0x1
    80003d4c:	68850513          	addi	a0,a0,1672 # 800053d0 <digits+0x70>
    80003d50:	fffff097          	auipc	ra,0xfffff
    80003d54:	f2c080e7          	jalr	-212(ra) # 80002c7c <panic>
    80003d58:	00001517          	auipc	a0,0x1
    80003d5c:	65850513          	addi	a0,a0,1624 # 800053b0 <digits+0x50>
    80003d60:	fffff097          	auipc	ra,0xfffff
    80003d64:	f1c080e7          	jalr	-228(ra) # 80002c7c <panic>

0000000080003d68 <__memset>:
    80003d68:	ff010113          	addi	sp,sp,-16
    80003d6c:	00813423          	sd	s0,8(sp)
    80003d70:	01010413          	addi	s0,sp,16
    80003d74:	1a060e63          	beqz	a2,80003f30 <__memset+0x1c8>
    80003d78:	40a007b3          	neg	a5,a0
    80003d7c:	0077f793          	andi	a5,a5,7
    80003d80:	00778693          	addi	a3,a5,7
    80003d84:	00b00813          	li	a6,11
    80003d88:	0ff5f593          	andi	a1,a1,255
    80003d8c:	fff6071b          	addiw	a4,a2,-1
    80003d90:	1b06e663          	bltu	a3,a6,80003f3c <__memset+0x1d4>
    80003d94:	1cd76463          	bltu	a4,a3,80003f5c <__memset+0x1f4>
    80003d98:	1a078e63          	beqz	a5,80003f54 <__memset+0x1ec>
    80003d9c:	00b50023          	sb	a1,0(a0)
    80003da0:	00100713          	li	a4,1
    80003da4:	1ae78463          	beq	a5,a4,80003f4c <__memset+0x1e4>
    80003da8:	00b500a3          	sb	a1,1(a0)
    80003dac:	00200713          	li	a4,2
    80003db0:	1ae78a63          	beq	a5,a4,80003f64 <__memset+0x1fc>
    80003db4:	00b50123          	sb	a1,2(a0)
    80003db8:	00300713          	li	a4,3
    80003dbc:	18e78463          	beq	a5,a4,80003f44 <__memset+0x1dc>
    80003dc0:	00b501a3          	sb	a1,3(a0)
    80003dc4:	00400713          	li	a4,4
    80003dc8:	1ae78263          	beq	a5,a4,80003f6c <__memset+0x204>
    80003dcc:	00b50223          	sb	a1,4(a0)
    80003dd0:	00500713          	li	a4,5
    80003dd4:	1ae78063          	beq	a5,a4,80003f74 <__memset+0x20c>
    80003dd8:	00b502a3          	sb	a1,5(a0)
    80003ddc:	00700713          	li	a4,7
    80003de0:	18e79e63          	bne	a5,a4,80003f7c <__memset+0x214>
    80003de4:	00b50323          	sb	a1,6(a0)
    80003de8:	00700e93          	li	t4,7
    80003dec:	00859713          	slli	a4,a1,0x8
    80003df0:	00e5e733          	or	a4,a1,a4
    80003df4:	01059e13          	slli	t3,a1,0x10
    80003df8:	01c76e33          	or	t3,a4,t3
    80003dfc:	01859313          	slli	t1,a1,0x18
    80003e00:	006e6333          	or	t1,t3,t1
    80003e04:	02059893          	slli	a7,a1,0x20
    80003e08:	40f60e3b          	subw	t3,a2,a5
    80003e0c:	011368b3          	or	a7,t1,a7
    80003e10:	02859813          	slli	a6,a1,0x28
    80003e14:	0108e833          	or	a6,a7,a6
    80003e18:	03059693          	slli	a3,a1,0x30
    80003e1c:	003e589b          	srliw	a7,t3,0x3
    80003e20:	00d866b3          	or	a3,a6,a3
    80003e24:	03859713          	slli	a4,a1,0x38
    80003e28:	00389813          	slli	a6,a7,0x3
    80003e2c:	00f507b3          	add	a5,a0,a5
    80003e30:	00e6e733          	or	a4,a3,a4
    80003e34:	000e089b          	sext.w	a7,t3
    80003e38:	00f806b3          	add	a3,a6,a5
    80003e3c:	00e7b023          	sd	a4,0(a5)
    80003e40:	00878793          	addi	a5,a5,8
    80003e44:	fed79ce3          	bne	a5,a3,80003e3c <__memset+0xd4>
    80003e48:	ff8e7793          	andi	a5,t3,-8
    80003e4c:	0007871b          	sext.w	a4,a5
    80003e50:	01d787bb          	addw	a5,a5,t4
    80003e54:	0ce88e63          	beq	a7,a4,80003f30 <__memset+0x1c8>
    80003e58:	00f50733          	add	a4,a0,a5
    80003e5c:	00b70023          	sb	a1,0(a4)
    80003e60:	0017871b          	addiw	a4,a5,1
    80003e64:	0cc77663          	bgeu	a4,a2,80003f30 <__memset+0x1c8>
    80003e68:	00e50733          	add	a4,a0,a4
    80003e6c:	00b70023          	sb	a1,0(a4)
    80003e70:	0027871b          	addiw	a4,a5,2
    80003e74:	0ac77e63          	bgeu	a4,a2,80003f30 <__memset+0x1c8>
    80003e78:	00e50733          	add	a4,a0,a4
    80003e7c:	00b70023          	sb	a1,0(a4)
    80003e80:	0037871b          	addiw	a4,a5,3
    80003e84:	0ac77663          	bgeu	a4,a2,80003f30 <__memset+0x1c8>
    80003e88:	00e50733          	add	a4,a0,a4
    80003e8c:	00b70023          	sb	a1,0(a4)
    80003e90:	0047871b          	addiw	a4,a5,4
    80003e94:	08c77e63          	bgeu	a4,a2,80003f30 <__memset+0x1c8>
    80003e98:	00e50733          	add	a4,a0,a4
    80003e9c:	00b70023          	sb	a1,0(a4)
    80003ea0:	0057871b          	addiw	a4,a5,5
    80003ea4:	08c77663          	bgeu	a4,a2,80003f30 <__memset+0x1c8>
    80003ea8:	00e50733          	add	a4,a0,a4
    80003eac:	00b70023          	sb	a1,0(a4)
    80003eb0:	0067871b          	addiw	a4,a5,6
    80003eb4:	06c77e63          	bgeu	a4,a2,80003f30 <__memset+0x1c8>
    80003eb8:	00e50733          	add	a4,a0,a4
    80003ebc:	00b70023          	sb	a1,0(a4)
    80003ec0:	0077871b          	addiw	a4,a5,7
    80003ec4:	06c77663          	bgeu	a4,a2,80003f30 <__memset+0x1c8>
    80003ec8:	00e50733          	add	a4,a0,a4
    80003ecc:	00b70023          	sb	a1,0(a4)
    80003ed0:	0087871b          	addiw	a4,a5,8
    80003ed4:	04c77e63          	bgeu	a4,a2,80003f30 <__memset+0x1c8>
    80003ed8:	00e50733          	add	a4,a0,a4
    80003edc:	00b70023          	sb	a1,0(a4)
    80003ee0:	0097871b          	addiw	a4,a5,9
    80003ee4:	04c77663          	bgeu	a4,a2,80003f30 <__memset+0x1c8>
    80003ee8:	00e50733          	add	a4,a0,a4
    80003eec:	00b70023          	sb	a1,0(a4)
    80003ef0:	00a7871b          	addiw	a4,a5,10
    80003ef4:	02c77e63          	bgeu	a4,a2,80003f30 <__memset+0x1c8>
    80003ef8:	00e50733          	add	a4,a0,a4
    80003efc:	00b70023          	sb	a1,0(a4)
    80003f00:	00b7871b          	addiw	a4,a5,11
    80003f04:	02c77663          	bgeu	a4,a2,80003f30 <__memset+0x1c8>
    80003f08:	00e50733          	add	a4,a0,a4
    80003f0c:	00b70023          	sb	a1,0(a4)
    80003f10:	00c7871b          	addiw	a4,a5,12
    80003f14:	00c77e63          	bgeu	a4,a2,80003f30 <__memset+0x1c8>
    80003f18:	00e50733          	add	a4,a0,a4
    80003f1c:	00b70023          	sb	a1,0(a4)
    80003f20:	00d7879b          	addiw	a5,a5,13
    80003f24:	00c7f663          	bgeu	a5,a2,80003f30 <__memset+0x1c8>
    80003f28:	00f507b3          	add	a5,a0,a5
    80003f2c:	00b78023          	sb	a1,0(a5)
    80003f30:	00813403          	ld	s0,8(sp)
    80003f34:	01010113          	addi	sp,sp,16
    80003f38:	00008067          	ret
    80003f3c:	00b00693          	li	a3,11
    80003f40:	e55ff06f          	j	80003d94 <__memset+0x2c>
    80003f44:	00300e93          	li	t4,3
    80003f48:	ea5ff06f          	j	80003dec <__memset+0x84>
    80003f4c:	00100e93          	li	t4,1
    80003f50:	e9dff06f          	j	80003dec <__memset+0x84>
    80003f54:	00000e93          	li	t4,0
    80003f58:	e95ff06f          	j	80003dec <__memset+0x84>
    80003f5c:	00000793          	li	a5,0
    80003f60:	ef9ff06f          	j	80003e58 <__memset+0xf0>
    80003f64:	00200e93          	li	t4,2
    80003f68:	e85ff06f          	j	80003dec <__memset+0x84>
    80003f6c:	00400e93          	li	t4,4
    80003f70:	e7dff06f          	j	80003dec <__memset+0x84>
    80003f74:	00500e93          	li	t4,5
    80003f78:	e75ff06f          	j	80003dec <__memset+0x84>
    80003f7c:	00600e93          	li	t4,6
    80003f80:	e6dff06f          	j	80003dec <__memset+0x84>

0000000080003f84 <__memmove>:
    80003f84:	ff010113          	addi	sp,sp,-16
    80003f88:	00813423          	sd	s0,8(sp)
    80003f8c:	01010413          	addi	s0,sp,16
    80003f90:	0e060863          	beqz	a2,80004080 <__memmove+0xfc>
    80003f94:	fff6069b          	addiw	a3,a2,-1
    80003f98:	0006881b          	sext.w	a6,a3
    80003f9c:	0ea5e863          	bltu	a1,a0,8000408c <__memmove+0x108>
    80003fa0:	00758713          	addi	a4,a1,7
    80003fa4:	00a5e7b3          	or	a5,a1,a0
    80003fa8:	40a70733          	sub	a4,a4,a0
    80003fac:	0077f793          	andi	a5,a5,7
    80003fb0:	00f73713          	sltiu	a4,a4,15
    80003fb4:	00174713          	xori	a4,a4,1
    80003fb8:	0017b793          	seqz	a5,a5
    80003fbc:	00e7f7b3          	and	a5,a5,a4
    80003fc0:	10078863          	beqz	a5,800040d0 <__memmove+0x14c>
    80003fc4:	00900793          	li	a5,9
    80003fc8:	1107f463          	bgeu	a5,a6,800040d0 <__memmove+0x14c>
    80003fcc:	0036581b          	srliw	a6,a2,0x3
    80003fd0:	fff8081b          	addiw	a6,a6,-1
    80003fd4:	02081813          	slli	a6,a6,0x20
    80003fd8:	01d85893          	srli	a7,a6,0x1d
    80003fdc:	00858813          	addi	a6,a1,8
    80003fe0:	00058793          	mv	a5,a1
    80003fe4:	00050713          	mv	a4,a0
    80003fe8:	01088833          	add	a6,a7,a6
    80003fec:	0007b883          	ld	a7,0(a5)
    80003ff0:	00878793          	addi	a5,a5,8
    80003ff4:	00870713          	addi	a4,a4,8
    80003ff8:	ff173c23          	sd	a7,-8(a4)
    80003ffc:	ff0798e3          	bne	a5,a6,80003fec <__memmove+0x68>
    80004000:	ff867713          	andi	a4,a2,-8
    80004004:	02071793          	slli	a5,a4,0x20
    80004008:	0207d793          	srli	a5,a5,0x20
    8000400c:	00f585b3          	add	a1,a1,a5
    80004010:	40e686bb          	subw	a3,a3,a4
    80004014:	00f507b3          	add	a5,a0,a5
    80004018:	06e60463          	beq	a2,a4,80004080 <__memmove+0xfc>
    8000401c:	0005c703          	lbu	a4,0(a1)
    80004020:	00e78023          	sb	a4,0(a5)
    80004024:	04068e63          	beqz	a3,80004080 <__memmove+0xfc>
    80004028:	0015c603          	lbu	a2,1(a1)
    8000402c:	00100713          	li	a4,1
    80004030:	00c780a3          	sb	a2,1(a5)
    80004034:	04e68663          	beq	a3,a4,80004080 <__memmove+0xfc>
    80004038:	0025c603          	lbu	a2,2(a1)
    8000403c:	00200713          	li	a4,2
    80004040:	00c78123          	sb	a2,2(a5)
    80004044:	02e68e63          	beq	a3,a4,80004080 <__memmove+0xfc>
    80004048:	0035c603          	lbu	a2,3(a1)
    8000404c:	00300713          	li	a4,3
    80004050:	00c781a3          	sb	a2,3(a5)
    80004054:	02e68663          	beq	a3,a4,80004080 <__memmove+0xfc>
    80004058:	0045c603          	lbu	a2,4(a1)
    8000405c:	00400713          	li	a4,4
    80004060:	00c78223          	sb	a2,4(a5)
    80004064:	00e68e63          	beq	a3,a4,80004080 <__memmove+0xfc>
    80004068:	0055c603          	lbu	a2,5(a1)
    8000406c:	00500713          	li	a4,5
    80004070:	00c782a3          	sb	a2,5(a5)
    80004074:	00e68663          	beq	a3,a4,80004080 <__memmove+0xfc>
    80004078:	0065c703          	lbu	a4,6(a1)
    8000407c:	00e78323          	sb	a4,6(a5)
    80004080:	00813403          	ld	s0,8(sp)
    80004084:	01010113          	addi	sp,sp,16
    80004088:	00008067          	ret
    8000408c:	02061713          	slli	a4,a2,0x20
    80004090:	02075713          	srli	a4,a4,0x20
    80004094:	00e587b3          	add	a5,a1,a4
    80004098:	f0f574e3          	bgeu	a0,a5,80003fa0 <__memmove+0x1c>
    8000409c:	02069613          	slli	a2,a3,0x20
    800040a0:	02065613          	srli	a2,a2,0x20
    800040a4:	fff64613          	not	a2,a2
    800040a8:	00e50733          	add	a4,a0,a4
    800040ac:	00c78633          	add	a2,a5,a2
    800040b0:	fff7c683          	lbu	a3,-1(a5)
    800040b4:	fff78793          	addi	a5,a5,-1
    800040b8:	fff70713          	addi	a4,a4,-1
    800040bc:	00d70023          	sb	a3,0(a4)
    800040c0:	fec798e3          	bne	a5,a2,800040b0 <__memmove+0x12c>
    800040c4:	00813403          	ld	s0,8(sp)
    800040c8:	01010113          	addi	sp,sp,16
    800040cc:	00008067          	ret
    800040d0:	02069713          	slli	a4,a3,0x20
    800040d4:	02075713          	srli	a4,a4,0x20
    800040d8:	00170713          	addi	a4,a4,1
    800040dc:	00e50733          	add	a4,a0,a4
    800040e0:	00050793          	mv	a5,a0
    800040e4:	0005c683          	lbu	a3,0(a1)
    800040e8:	00178793          	addi	a5,a5,1
    800040ec:	00158593          	addi	a1,a1,1
    800040f0:	fed78fa3          	sb	a3,-1(a5)
    800040f4:	fee798e3          	bne	a5,a4,800040e4 <__memmove+0x160>
    800040f8:	f89ff06f          	j	80004080 <__memmove+0xfc>

00000000800040fc <__putc>:
    800040fc:	fe010113          	addi	sp,sp,-32
    80004100:	00813823          	sd	s0,16(sp)
    80004104:	00113c23          	sd	ra,24(sp)
    80004108:	02010413          	addi	s0,sp,32
    8000410c:	00050793          	mv	a5,a0
    80004110:	fef40593          	addi	a1,s0,-17
    80004114:	00100613          	li	a2,1
    80004118:	00000513          	li	a0,0
    8000411c:	fef407a3          	sb	a5,-17(s0)
    80004120:	fffff097          	auipc	ra,0xfffff
    80004124:	b3c080e7          	jalr	-1220(ra) # 80002c5c <console_write>
    80004128:	01813083          	ld	ra,24(sp)
    8000412c:	01013403          	ld	s0,16(sp)
    80004130:	02010113          	addi	sp,sp,32
    80004134:	00008067          	ret

0000000080004138 <__getc>:
    80004138:	fe010113          	addi	sp,sp,-32
    8000413c:	00813823          	sd	s0,16(sp)
    80004140:	00113c23          	sd	ra,24(sp)
    80004144:	02010413          	addi	s0,sp,32
    80004148:	fe840593          	addi	a1,s0,-24
    8000414c:	00100613          	li	a2,1
    80004150:	00000513          	li	a0,0
    80004154:	fffff097          	auipc	ra,0xfffff
    80004158:	ae8080e7          	jalr	-1304(ra) # 80002c3c <console_read>
    8000415c:	fe844503          	lbu	a0,-24(s0)
    80004160:	01813083          	ld	ra,24(sp)
    80004164:	01013403          	ld	s0,16(sp)
    80004168:	02010113          	addi	sp,sp,32
    8000416c:	00008067          	ret

0000000080004170 <console_handler>:
    80004170:	fe010113          	addi	sp,sp,-32
    80004174:	00813823          	sd	s0,16(sp)
    80004178:	00113c23          	sd	ra,24(sp)
    8000417c:	00913423          	sd	s1,8(sp)
    80004180:	02010413          	addi	s0,sp,32
    80004184:	14202773          	csrr	a4,scause
    80004188:	100027f3          	csrr	a5,sstatus
    8000418c:	0027f793          	andi	a5,a5,2
    80004190:	06079e63          	bnez	a5,8000420c <console_handler+0x9c>
    80004194:	00074c63          	bltz	a4,800041ac <console_handler+0x3c>
    80004198:	01813083          	ld	ra,24(sp)
    8000419c:	01013403          	ld	s0,16(sp)
    800041a0:	00813483          	ld	s1,8(sp)
    800041a4:	02010113          	addi	sp,sp,32
    800041a8:	00008067          	ret
    800041ac:	0ff77713          	andi	a4,a4,255
    800041b0:	00900793          	li	a5,9
    800041b4:	fef712e3          	bne	a4,a5,80004198 <console_handler+0x28>
    800041b8:	ffffe097          	auipc	ra,0xffffe
    800041bc:	6dc080e7          	jalr	1756(ra) # 80002894 <plic_claim>
    800041c0:	00a00793          	li	a5,10
    800041c4:	00050493          	mv	s1,a0
    800041c8:	02f50c63          	beq	a0,a5,80004200 <console_handler+0x90>
    800041cc:	fc0506e3          	beqz	a0,80004198 <console_handler+0x28>
    800041d0:	00050593          	mv	a1,a0
    800041d4:	00001517          	auipc	a0,0x1
    800041d8:	10450513          	addi	a0,a0,260 # 800052d8 <_ZZ12printIntegermE6digits+0x2b8>
    800041dc:	fffff097          	auipc	ra,0xfffff
    800041e0:	afc080e7          	jalr	-1284(ra) # 80002cd8 <__printf>
    800041e4:	01013403          	ld	s0,16(sp)
    800041e8:	01813083          	ld	ra,24(sp)
    800041ec:	00048513          	mv	a0,s1
    800041f0:	00813483          	ld	s1,8(sp)
    800041f4:	02010113          	addi	sp,sp,32
    800041f8:	ffffe317          	auipc	t1,0xffffe
    800041fc:	6d430067          	jr	1748(t1) # 800028cc <plic_complete>
    80004200:	fffff097          	auipc	ra,0xfffff
    80004204:	3e0080e7          	jalr	992(ra) # 800035e0 <uartintr>
    80004208:	fddff06f          	j	800041e4 <console_handler+0x74>
    8000420c:	00001517          	auipc	a0,0x1
    80004210:	1cc50513          	addi	a0,a0,460 # 800053d8 <digits+0x78>
    80004214:	fffff097          	auipc	ra,0xfffff
    80004218:	a68080e7          	jalr	-1432(ra) # 80002c7c <panic>
	...
