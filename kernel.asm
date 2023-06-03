
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00006117          	auipc	sp,0x6
    80000004:	f6813103          	ld	sp,-152(sp) # 80005f68 <_GLOBAL_OFFSET_TABLE_+0x18>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	6dc020ef          	jal	ra,800026f8 <start>

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
    80001184:	7ac000ef          	jal	ra,80001930 <interruptRoutine>

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

0000000080001224 <_Z9mem_allocm>:

inline void scall() {
	__asm__ volatile("ecall");
}

void* mem_alloc(size_t size) {
    80001224:	ff010113          	addi	sp,sp,-16
    80001228:	00813423          	sd	s0,8(sp)
    8000122c:	01010413          	addi	s0,sp,16
	//na size moramo dodati zaglavlje segmenta
	size += sizeof(MemoryAllocator::UsedMemSegment);
    80001230:	01050513          	addi	a0,a0,16
	//size je u bajtovima, pretvara se u blokove
	size = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
    80001234:	00655313          	srli	t1,a0,0x6
    80001238:	03f57513          	andi	a0,a0,63
    8000123c:	00050463          	beqz	a0,80001244 <_Z9mem_allocm+0x20>
    80001240:	00100513          	li	a0,1
    80001244:	00a30333          	add	t1,t1,a0

	//stavljanje argumenata za sistemski poziv
	__asm__ volatile("mv a1, %[size]": :[size] "r"(size):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001248:	00030593          	mv	a1,t1
	__asm__ volatile("li a0, 0x01");
    8000124c:	00100513          	li	a0,1
	__asm__ volatile("ecall");
    80001250:	00000073          	ecall
	//a1 = broj blokova velicine MEM_BLOCK_SIZE za alokaciju

	scall();

	void* ret;
	__asm__ volatile("mv %[ptr], a0":[ptr] "=r"(ret));
    80001254:	00050513          	mv	a0,a0
	return ret;
}
    80001258:	00813403          	ld	s0,8(sp)
    8000125c:	01010113          	addi	sp,sp,16
    80001260:	00008067          	ret

0000000080001264 <_Z8mem_freePv>:

int mem_free(void* ptr) {
    80001264:	ff010113          	addi	sp,sp,-16
    80001268:	00813423          	sd	s0,8(sp)
    8000126c:	01010413          	addi	s0,sp,16
    80001270:	00050313          	mv	t1,a0
	//stavljanje argumenata za sistemski poziv
	__asm__ volatile("mv a1, %[ptr]": :[ptr] "r"(ptr):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001274:	00030593          	mv	a1,t1
	__asm__ volatile("li a0, 0x02");
    80001278:	00200513          	li	a0,2
	__asm__ volatile("ecall");
    8000127c:	00000073          	ecall
	//a1 = pokazivac na memoriju koju treba dealocirati

	scall();

	int status;
	__asm__ volatile("mv %[status], a0":[status] "=r"(status));
    80001280:	00050513          	mv	a0,a0
	return status;
}
    80001284:	0005051b          	sext.w	a0,a0
    80001288:	00813403          	ld	s0,8(sp)
    8000128c:	01010113          	addi	sp,sp,16
    80001290:	00008067          	ret

0000000080001294 <_Z13thread_createPP3TCBPFvPvES2_>:

int thread_create(thread_t* handle, void (* start_routine)(void*), void* arg) {
    80001294:	fd010113          	addi	sp,sp,-48
    80001298:	02113423          	sd	ra,40(sp)
    8000129c:	02813023          	sd	s0,32(sp)
    800012a0:	00913c23          	sd	s1,24(sp)
    800012a4:	01213823          	sd	s2,16(sp)
    800012a8:	01313423          	sd	s3,8(sp)
    800012ac:	03010413          	addi	s0,sp,48
    800012b0:	00050913          	mv	s2,a0
    800012b4:	00058493          	mv	s1,a1
    800012b8:	00060993          	mv	s3,a2
	//stvaranje steka ako se ne radi o main kernel niti, posto ona automatski ima stek
	uint64* stack = nullptr;
	if (start_routine != nullptr) {
    800012bc:	04058863          	beqz	a1,8000130c <_Z13thread_createPP3TCBPFvPvES2_+0x78>
		stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE);
    800012c0:	00001537          	lui	a0,0x1
    800012c4:	00000097          	auipc	ra,0x0
    800012c8:	f60080e7          	jalr	-160(ra) # 80001224 <_Z9mem_allocm>
    800012cc:	00050313          	mv	t1,a0
	}
	//uint64* stack = (start_routine != nullptr ? (uint64*)MemoryAllocator::kmalloc(DEFAULT_STACK_SIZE) : nullptr);
	//stavljanje argumenata za sistemski poziv
	__asm__ volatile("mv a4, %[sp]": :[sp] "r"(stack):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800012d0:	00030713          	mv	a4,t1
	__asm__ volatile("mv a3, %[arg]": :[arg] "r"(arg):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800012d4:	00098693          	mv	a3,s3
	__asm__ volatile("mv a2, %[function]": :[function] "r"(
			start_routine):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800012d8:	00048613          	mv	a2,s1
	__asm__ volatile("mv a1, %[handle]": :[handle] "r"(handle):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800012dc:	00090593          	mv	a1,s2
	__asm__ volatile("li a0, 0x11");
    800012e0:	01100513          	li	a0,17
	__asm__ volatile("ecall");
    800012e4:	00000073          	ecall
	//a4 = pokazivac na najnizu adresu steka (stek raste ka nizim adresama, pokazuje na poslednju zauzetu)

	scall();

	int status;
	__asm__ volatile("mv %[status], a0":[status] "=r"(status));
    800012e8:	00050513          	mv	a0,a0
	return status;
}
    800012ec:	0005051b          	sext.w	a0,a0
    800012f0:	02813083          	ld	ra,40(sp)
    800012f4:	02013403          	ld	s0,32(sp)
    800012f8:	01813483          	ld	s1,24(sp)
    800012fc:	01013903          	ld	s2,16(sp)
    80001300:	00813983          	ld	s3,8(sp)
    80001304:	03010113          	addi	sp,sp,48
    80001308:	00008067          	ret
	uint64* stack = nullptr;
    8000130c:	00000313          	li	t1,0
    80001310:	fc1ff06f          	j	800012d0 <_Z13thread_createPP3TCBPFvPvES2_+0x3c>

0000000080001314 <_Z11thread_exitv>:

int thread_exit() {
    80001314:	ff010113          	addi	sp,sp,-16
    80001318:	00813423          	sd	s0,8(sp)
    8000131c:	01010413          	addi	s0,sp,16
	//nema argumenata, samo kod sistemskog poziva
	__asm__ volatile("li a0, 0x12");
    80001320:	01200513          	li	a0,18
	__asm__ volatile("ecall");
    80001324:	00000073          	ecall

	scall();

	int status;
	__asm__ volatile("mv %[status], a0":[status] "=r"(status));
    80001328:	00050513          	mv	a0,a0
	return status;
}
    8000132c:	0005051b          	sext.w	a0,a0
    80001330:	00813403          	ld	s0,8(sp)
    80001334:	01010113          	addi	sp,sp,16
    80001338:	00008067          	ret

000000008000133c <_Z15thread_dispatchv>:

void thread_dispatch() {
    8000133c:	ff010113          	addi	sp,sp,-16
    80001340:	00813423          	sd	s0,8(sp)
    80001344:	01010413          	addi	s0,sp,16
	//nema argumenata, samo kod sistemskog poziva
	__asm__ volatile("li a0, 0x13");
    80001348:	01300513          	li	a0,19
	__asm__ volatile("ecall");
    8000134c:	00000073          	ecall

	scall();
	//nema povratne vrednosti
}
    80001350:	00813403          	ld	s0,8(sp)
    80001354:	01010113          	addi	sp,sp,16
    80001358:	00008067          	ret

000000008000135c <_Z11thread_joinP3TCB>:

void thread_join(thread_t handle) {
    8000135c:	ff010113          	addi	sp,sp,-16
    80001360:	00813423          	sd	s0,8(sp)
    80001364:	01010413          	addi	s0,sp,16

}
    80001368:	00813403          	ld	s0,8(sp)
    8000136c:	01010113          	addi	sp,sp,16
    80001370:	00008067          	ret

0000000080001374 <_Z10time_sleepm>:

int time_sleep(time_t) {
    80001374:	ff010113          	addi	sp,sp,-16
    80001378:	00813423          	sd	s0,8(sp)
    8000137c:	01010413          	addi	s0,sp,16
	return 0;
}
    80001380:	00000513          	li	a0,0
    80001384:	00813403          	ld	s0,8(sp)
    80001388:	01010113          	addi	sp,sp,16
    8000138c:	00008067          	ret

0000000080001390 <_Z8sem_openPP4_semj>:

int sem_open(sem_t* handle, unsigned int init) {
    80001390:	ff010113          	addi	sp,sp,-16
    80001394:	00813423          	sd	s0,8(sp)
    80001398:	01010413          	addi	s0,sp,16
	return 0;
}
    8000139c:	00000513          	li	a0,0
    800013a0:	00813403          	ld	s0,8(sp)
    800013a4:	01010113          	addi	sp,sp,16
    800013a8:	00008067          	ret

00000000800013ac <_Z9sem_closeP4_sem>:

int sem_close(sem_t handle) {
    800013ac:	ff010113          	addi	sp,sp,-16
    800013b0:	00813423          	sd	s0,8(sp)
    800013b4:	01010413          	addi	s0,sp,16
	return 0;
}
    800013b8:	00000513          	li	a0,0
    800013bc:	00813403          	ld	s0,8(sp)
    800013c0:	01010113          	addi	sp,sp,16
    800013c4:	00008067          	ret

00000000800013c8 <_Z8sem_waitP4_sem>:

int sem_wait(sem_t id) {
    800013c8:	ff010113          	addi	sp,sp,-16
    800013cc:	00813423          	sd	s0,8(sp)
    800013d0:	01010413          	addi	s0,sp,16
	return 0;
}
    800013d4:	00000513          	li	a0,0
    800013d8:	00813403          	ld	s0,8(sp)
    800013dc:	01010113          	addi	sp,sp,16
    800013e0:	00008067          	ret

00000000800013e4 <_Z10sem_signalP4_sem>:

int sem_signal(sem_t id) {
    800013e4:	ff010113          	addi	sp,sp,-16
    800013e8:	00813423          	sd	s0,8(sp)
    800013ec:	01010413          	addi	s0,sp,16
	return 0;
}
    800013f0:	00000513          	li	a0,0
    800013f4:	00813403          	ld	s0,8(sp)
    800013f8:	01010113          	addi	sp,sp,16
    800013fc:	00008067          	ret

0000000080001400 <_Z4getcv>:

char getc() {
    80001400:	ff010113          	addi	sp,sp,-16
    80001404:	00113423          	sd	ra,8(sp)
    80001408:	00813023          	sd	s0,0(sp)
    8000140c:	01010413          	addi	s0,sp,16
	return __getc();
    80001410:	00003097          	auipc	ra,0x3
    80001414:	3e8080e7          	jalr	1000(ra) # 800047f8 <__getc>
}
    80001418:	00813083          	ld	ra,8(sp)
    8000141c:	00013403          	ld	s0,0(sp)
    80001420:	01010113          	addi	sp,sp,16
    80001424:	00008067          	ret

0000000080001428 <_Z4putcc>:

void putc(char c) {
    80001428:	ff010113          	addi	sp,sp,-16
    8000142c:	00113423          	sd	ra,8(sp)
    80001430:	00813023          	sd	s0,0(sp)
    80001434:	01010413          	addi	s0,sp,16
	__putc(c);
    80001438:	00003097          	auipc	ra,0x3
    8000143c:	384080e7          	jalr	900(ra) # 800047bc <__putc>
}
    80001440:	00813083          	ld	ra,8(sp)
    80001444:	00013403          	ld	s0,0(sp)
    80001448:	01010113          	addi	sp,sp,16
    8000144c:	00008067          	ret

0000000080001450 <_Z11printStringPKc>:
#include "../h/helper.hpp"
#include "../lib/console.h"
#include "../h/Riscv.hpp"
//#include "../h/syscall_c.hpp"

void printString(char const* string) {
    80001450:	ff010113          	addi	sp,sp,-16
    80001454:	00813423          	sd	s0,8(sp)
    80001458:	01010413          	addi	s0,sp,16
    8000145c:	00050313          	mv	t1,a0

	//stavljanje argumenata za sistemski poziv
	__asm__ volatile("mv a1, %[ptr]": :[ptr] "r"(string):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001460:	00030593          	mv	a1,t1
	__asm__ volatile("li a0, 0x90");
    80001464:	09000513          	li	a0,144

	__asm__ volatile("ecall");
    80001468:	00000073          	ecall


}
    8000146c:	00813403          	ld	s0,8(sp)
    80001470:	01010113          	addi	sp,sp,16
    80001474:	00008067          	ret

0000000080001478 <_Z12printIntegerm>:
//void println(char const *string) {
//    printString(string);
//    __putc('\n');
//}

void printInteger(uint64 integer) {
    80001478:	ff010113          	addi	sp,sp,-16
    8000147c:	00813423          	sd	s0,8(sp)
    80001480:	01010413          	addi	s0,sp,16
    80001484:	00050313          	mv	t1,a0
	//stavljanje argumenata za sistemski poziv
	__asm__ volatile("mv a1, %[ptr]": :[ptr] "r"(integer):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001488:	00030593          	mv	a1,t1
	__asm__ volatile("li a0, 0x91");
    8000148c:	09100513          	li	a0,145

	__asm__ volatile("ecall");
    80001490:	00000073          	ecall
}
    80001494:	00813403          	ld	s0,8(sp)
    80001498:	01010113          	addi	sp,sp,16
    8000149c:	00008067          	ret

00000000800014a0 <_ZN9Scheduler3putEP3TCB>:

//Scheduler* Scheduler::singleton = nullptr;
TCB* Scheduler::head = nullptr;
TCB* Scheduler::tail = nullptr;

void Scheduler::put(TCB* tcb) {
    800014a0:	ff010113          	addi	sp,sp,-16
    800014a4:	00813423          	sd	s0,8(sp)
    800014a8:	01010413          	addi	s0,sp,16
	if (tail == nullptr) {
    800014ac:	00005797          	auipc	a5,0x5
    800014b0:	b247b783          	ld	a5,-1244(a5) # 80005fd0 <_ZN9Scheduler4tailE>
    800014b4:	00078e63          	beqz	a5,800014d0 <_ZN9Scheduler3putEP3TCB+0x30>
		head = tail = tcb;
	} else {
		tail->nextInScheduler = tcb;
    800014b8:	02a7bc23          	sd	a0,56(a5)
		tail = tcb;
    800014bc:	00005797          	auipc	a5,0x5
    800014c0:	b0a7ba23          	sd	a0,-1260(a5) # 80005fd0 <_ZN9Scheduler4tailE>
	}
}
    800014c4:	00813403          	ld	s0,8(sp)
    800014c8:	01010113          	addi	sp,sp,16
    800014cc:	00008067          	ret
		head = tail = tcb;
    800014d0:	00005797          	auipc	a5,0x5
    800014d4:	b0078793          	addi	a5,a5,-1280 # 80005fd0 <_ZN9Scheduler4tailE>
    800014d8:	00a7b023          	sd	a0,0(a5)
    800014dc:	00a7b423          	sd	a0,8(a5)
    800014e0:	fe5ff06f          	j	800014c4 <_ZN9Scheduler3putEP3TCB+0x24>

00000000800014e4 <_ZN9Scheduler3getEv>:

TCB* Scheduler::get() {
    800014e4:	ff010113          	addi	sp,sp,-16
    800014e8:	00813423          	sd	s0,8(sp)
    800014ec:	01010413          	addi	s0,sp,16
	TCB* firstThread = head;
    800014f0:	00005717          	auipc	a4,0x5
    800014f4:	ae070713          	addi	a4,a4,-1312 # 80005fd0 <_ZN9Scheduler4tailE>
    800014f8:	00873503          	ld	a0,8(a4)
	head = head->nextInScheduler;
    800014fc:	03853783          	ld	a5,56(a0) # 1038 <_entry-0x7fffefc8>
    80001500:	00f73423          	sd	a5,8(a4)
	if (head == nullptr) {
    80001504:	00078863          	beqz	a5,80001514 <_ZN9Scheduler3getEv+0x30>
		tail = head = nullptr;
	}
	return firstThread;
    80001508:	00813403          	ld	s0,8(sp)
    8000150c:	01010113          	addi	sp,sp,16
    80001510:	00008067          	ret
		tail = head = nullptr;
    80001514:	00073423          	sd	zero,8(a4)
    80001518:	00073023          	sd	zero,0(a4)
	return firstThread;
    8000151c:	fedff06f          	j	80001508 <_ZN9Scheduler3getEv+0x24>

0000000080001520 <main>:
	printInteger(*(uint64*)arg2);
	printString("\nGotova nit 2\n");
}
#pragma GCC optimize("O0")

int main() {
    80001520:	fd010113          	addi	sp,sp,-48
    80001524:	02113423          	sd	ra,40(sp)
    80001528:	02813023          	sd	s0,32(sp)
    8000152c:	03010413          	addi	s0,sp,48

	//zabrani prekide
	Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    80001530:	00200513          	li	a0,2
    80001534:	00000097          	auipc	ra,0x0
    80001538:	3c4080e7          	jalr	964(ra) # 800018f8 <_ZN5Riscv10mc_sstatusEm>

	//postavi adresu prekidne rutine u stvec
	Riscv::w_stvec((uint64)&interruptHandler);
    8000153c:	00005797          	auipc	a5,0x5
    80001540:	a447b783          	ld	a5,-1468(a5) # 80005f80 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001544:	00078513          	mv	a0,a5
    80001548:	00000097          	auipc	ra,0x0
    8000154c:	378080e7          	jalr	888(ra) # 800018c0 <_ZN5Riscv7w_stvecEm>
//	printInteger(*(lista->peekFirst()));
//	delete lista;
//	println("");

	//testiranje kreiranja niti
	thread_t glavnaNit = nullptr;
    80001550:	fe043023          	sd	zero,-32(s0)
	thread_t nit1 = nullptr;
    80001554:	fc043c23          	sd	zero,-40(s0)
	thread_t nit2 = nullptr;
    80001558:	fc043823          	sd	zero,-48(s0)
	thread_create(&glavnaNit, nullptr, nullptr);
    8000155c:	fe040793          	addi	a5,s0,-32
    80001560:	00000613          	li	a2,0
    80001564:	00000593          	li	a1,0
    80001568:	00078513          	mv	a0,a5
    8000156c:	00000097          	auipc	ra,0x0
    80001570:	d28080e7          	jalr	-728(ra) # 80001294 <_Z13thread_createPP3TCBPFvPvES2_>
	TCB::running = glavnaNit;
    80001574:	fe043703          	ld	a4,-32(s0)
    80001578:	00005797          	auipc	a5,0x5
    8000157c:	9f87b783          	ld	a5,-1544(a5) # 80005f70 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001580:	00e7b023          	sd	a4,0(a5)
	uint64* arg = new uint64;
    80001584:	00800513          	li	a0,8
    80001588:	00001097          	auipc	ra,0x1
    8000158c:	87c080e7          	jalr	-1924(ra) # 80001e04 <_Znwm>
    80001590:	00050793          	mv	a5,a0
    80001594:	fef43423          	sd	a5,-24(s0)
	*arg = 666;
    80001598:	fe843783          	ld	a5,-24(s0)
    8000159c:	29a00713          	li	a4,666
    800015a0:	00e7b023          	sd	a4,0(a5)
	thread_create(&nit1, nit1f, nullptr);
    800015a4:	fd840793          	addi	a5,s0,-40
    800015a8:	00000613          	li	a2,0
    800015ac:	00000597          	auipc	a1,0x0
    800015b0:	0dc58593          	addi	a1,a1,220 # 80001688 <_Z5nit1fPv>
    800015b4:	00078513          	mv	a0,a5
    800015b8:	00000097          	auipc	ra,0x0
    800015bc:	cdc080e7          	jalr	-804(ra) # 80001294 <_Z13thread_createPP3TCBPFvPvES2_>
	thread_create(&nit2, nit2f, arg);
    800015c0:	fd040793          	addi	a5,s0,-48
    800015c4:	fe843603          	ld	a2,-24(s0)
    800015c8:	00000597          	auipc	a1,0x0
    800015cc:	19458593          	addi	a1,a1,404 # 8000175c <_Z5nit2fPv>
    800015d0:	00078513          	mv	a0,a5
    800015d4:	00000097          	auipc	ra,0x0
    800015d8:	cc0080e7          	jalr	-832(ra) # 80001294 <_Z13thread_createPP3TCBPFvPvES2_>

	//omoguci prekide
	Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
    800015dc:	00200513          	li	a0,2
    800015e0:	00000097          	auipc	ra,0x0
    800015e4:	2fc080e7          	jalr	764(ra) # 800018dc <_ZN5Riscv10ms_sstatusEm>

	while(!nit1->isFinished() || !nit2->isFinished()){
    800015e8:	fd843783          	ld	a5,-40(s0)
    800015ec:	00078513          	mv	a0,a5
    800015f0:	00000097          	auipc	ra,0x0
    800015f4:	324080e7          	jalr	804(ra) # 80001914 <_ZN3TCB10isFinishedEv>
    800015f8:	00050793          	mv	a5,a0
    800015fc:	0017c793          	xori	a5,a5,1
    80001600:	0ff7f793          	andi	a5,a5,255
    80001604:	02079263          	bnez	a5,80001628 <main+0x108>
    80001608:	fd043783          	ld	a5,-48(s0)
    8000160c:	00078513          	mv	a0,a5
    80001610:	00000097          	auipc	ra,0x0
    80001614:	304080e7          	jalr	772(ra) # 80001914 <_ZN3TCB10isFinishedEv>
    80001618:	00050793          	mv	a5,a0
    8000161c:	0017c793          	xori	a5,a5,1
    80001620:	0ff7f793          	andi	a5,a5,255
    80001624:	00078663          	beqz	a5,80001630 <main+0x110>
    80001628:	00100793          	li	a5,1
    8000162c:	0080006f          	j	80001634 <main+0x114>
    80001630:	00000793          	li	a5,0
    80001634:	00078863          	beqz	a5,80001644 <main+0x124>
		thread_dispatch();
    80001638:	00000097          	auipc	ra,0x0
    8000163c:	d04080e7          	jalr	-764(ra) # 8000133c <_Z15thread_dispatchv>
	while(!nit1->isFinished() || !nit2->isFinished()){
    80001640:	fa9ff06f          	j	800015e8 <main+0xc8>
	}
	printString("\nProsao while\n");
    80001644:	00004517          	auipc	a0,0x4
    80001648:	9dc50513          	addi	a0,a0,-1572 # 80005020 <CONSOLE_STATUS+0x10>
    8000164c:	00000097          	auipc	ra,0x0
    80001650:	e04080e7          	jalr	-508(ra) # 80001450 <_Z11printStringPKc>

	//zabrani prekide
	Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    80001654:	00200513          	li	a0,2
    80001658:	00000097          	auipc	ra,0x0
    8000165c:	2a0080e7          	jalr	672(ra) # 800018f8 <_ZN5Riscv10mc_sstatusEm>
	printString("\nSad cu da izadjem\n");
    80001660:	00004517          	auipc	a0,0x4
    80001664:	9d050513          	addi	a0,a0,-1584 # 80005030 <CONSOLE_STATUS+0x20>
    80001668:	00000097          	auipc	ra,0x0
    8000166c:	de8080e7          	jalr	-536(ra) # 80001450 <_Z11printStringPKc>
//	thread_create(&userHandle, (TCB::Body)userMain, nullptr);
//	while (!userHandle->isFinished()) {
//		thread_dispatch();
//	}
//	Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
	return 0;
    80001670:	00000793          	li	a5,0
    80001674:	00078513          	mv	a0,a5
    80001678:	02813083          	ld	ra,40(sp)
    8000167c:	02013403          	ld	s0,32(sp)
    80001680:	03010113          	addi	sp,sp,48
    80001684:	00008067          	ret

0000000080001688 <_Z5nit1fPv>:
void nit1f(void*) {
    80001688:	fd010113          	addi	sp,sp,-48
    8000168c:	02113423          	sd	ra,40(sp)
    80001690:	02813023          	sd	s0,32(sp)
    80001694:	00913c23          	sd	s1,24(sp)
    80001698:	03010413          	addi	s0,sp,48
	printString("\nusao u nit 1\n");
    8000169c:	00004517          	auipc	a0,0x4
    800016a0:	9ac50513          	addi	a0,a0,-1620 # 80005048 <CONSOLE_STATUS+0x38>
    800016a4:	00000097          	auipc	ra,0x0
    800016a8:	dac080e7          	jalr	-596(ra) # 80001450 <_Z11printStringPKc>
	__asm__ volatile("li t1, 100");
    800016ac:	06400313          	li	t1,100
	__asm__ volatile("mv %0, t1":"=r"(t1));
    800016b0:	00030793          	mv	a5,t1
    800016b4:	fcf43c23          	sd	a5,-40(s0)
	printString("\nopet u niti 1\n");
    800016b8:	00004517          	auipc	a0,0x4
    800016bc:	9a050513          	addi	a0,a0,-1632 # 80005058 <CONSOLE_STATUS+0x48>
    800016c0:	00000097          	auipc	ra,0x0
    800016c4:	d90080e7          	jalr	-624(ra) # 80001450 <_Z11printStringPKc>
	printString("\nt1 = ");
    800016c8:	00004517          	auipc	a0,0x4
    800016cc:	9a050513          	addi	a0,a0,-1632 # 80005068 <CONSOLE_STATUS+0x58>
    800016d0:	00000097          	auipc	ra,0x0
    800016d4:	d80080e7          	jalr	-640(ra) # 80001450 <_Z11printStringPKc>
	printInteger(t1);
    800016d8:	fd843503          	ld	a0,-40(s0)
    800016dc:	00000097          	auipc	ra,0x0
    800016e0:	d9c080e7          	jalr	-612(ra) # 80001478 <_Z12printIntegerm>
	for(int i=0;i<1000000;i++){
    800016e4:	00000493          	li	s1,0
    800016e8:	0340006f          	j	8000171c <_Z5nit1fPv+0x94>
			printString("Nit1: ");
    800016ec:	00004517          	auipc	a0,0x4
    800016f0:	98450513          	addi	a0,a0,-1660 # 80005070 <CONSOLE_STATUS+0x60>
    800016f4:	00000097          	auipc	ra,0x0
    800016f8:	d5c080e7          	jalr	-676(ra) # 80001450 <_Z11printStringPKc>
			printInteger(i);
    800016fc:	00048513          	mv	a0,s1
    80001700:	00000097          	auipc	ra,0x0
    80001704:	d78080e7          	jalr	-648(ra) # 80001478 <_Z12printIntegerm>
			printString("\n");
    80001708:	00004517          	auipc	a0,0x4
    8000170c:	97050513          	addi	a0,a0,-1680 # 80005078 <CONSOLE_STATUS+0x68>
    80001710:	00000097          	auipc	ra,0x0
    80001714:	d40080e7          	jalr	-704(ra) # 80001450 <_Z11printStringPKc>
	for(int i=0;i<1000000;i++){
    80001718:	0014849b          	addiw	s1,s1,1
    8000171c:	000f47b7          	lui	a5,0xf4
    80001720:	23f78793          	addi	a5,a5,575 # f423f <_entry-0x7ff0bdc1>
    80001724:	0097ca63          	blt	a5,s1,80001738 <_Z5nit1fPv+0xb0>
		if(i%1200==0) {
    80001728:	4b000793          	li	a5,1200
    8000172c:	02f4e7bb          	remw	a5,s1,a5
    80001730:	fe0794e3          	bnez	a5,80001718 <_Z5nit1fPv+0x90>
    80001734:	fb9ff06f          	j	800016ec <_Z5nit1fPv+0x64>
	printString("\nGotova nit 1\n");
    80001738:	00004517          	auipc	a0,0x4
    8000173c:	94850513          	addi	a0,a0,-1720 # 80005080 <CONSOLE_STATUS+0x70>
    80001740:	00000097          	auipc	ra,0x0
    80001744:	d10080e7          	jalr	-752(ra) # 80001450 <_Z11printStringPKc>
}
    80001748:	02813083          	ld	ra,40(sp)
    8000174c:	02013403          	ld	s0,32(sp)
    80001750:	01813483          	ld	s1,24(sp)
    80001754:	03010113          	addi	sp,sp,48
    80001758:	00008067          	ret

000000008000175c <_Z5nit2fPv>:
void nit2f(void* arg2) {
    8000175c:	fd010113          	addi	sp,sp,-48
    80001760:	02113423          	sd	ra,40(sp)
    80001764:	02813023          	sd	s0,32(sp)
    80001768:	00913c23          	sd	s1,24(sp)
    8000176c:	01213823          	sd	s2,16(sp)
    80001770:	03010413          	addi	s0,sp,48
    80001774:	00050913          	mv	s2,a0
	printString("\nusao u nit 2\n");
    80001778:	00004517          	auipc	a0,0x4
    8000177c:	91850513          	addi	a0,a0,-1768 # 80005090 <CONSOLE_STATUS+0x80>
    80001780:	00000097          	auipc	ra,0x0
    80001784:	cd0080e7          	jalr	-816(ra) # 80001450 <_Z11printStringPKc>
	printInteger(*(uint64*)arg2);
    80001788:	00093503          	ld	a0,0(s2)
    8000178c:	00000097          	auipc	ra,0x0
    80001790:	cec080e7          	jalr	-788(ra) # 80001478 <_Z12printIntegerm>
	*(uint64*)arg2+=10;
    80001794:	00093783          	ld	a5,0(s2)
    80001798:	00a78793          	addi	a5,a5,10
    8000179c:	00f93023          	sd	a5,0(s2)
	__asm__ volatile("li t1, 200");
    800017a0:	0c800313          	li	t1,200
	__asm__ volatile("mv %0, t1":"=r"(t1));
    800017a4:	00030793          	mv	a5,t1
    800017a8:	fcf43c23          	sd	a5,-40(s0)
	printString("\nopet u niti 2\n");
    800017ac:	00004517          	auipc	a0,0x4
    800017b0:	8f450513          	addi	a0,a0,-1804 # 800050a0 <CONSOLE_STATUS+0x90>
    800017b4:	00000097          	auipc	ra,0x0
    800017b8:	c9c080e7          	jalr	-868(ra) # 80001450 <_Z11printStringPKc>
	printString("\nt1 = ");
    800017bc:	00004517          	auipc	a0,0x4
    800017c0:	8ac50513          	addi	a0,a0,-1876 # 80005068 <CONSOLE_STATUS+0x58>
    800017c4:	00000097          	auipc	ra,0x0
    800017c8:	c8c080e7          	jalr	-884(ra) # 80001450 <_Z11printStringPKc>
	printInteger(t1);
    800017cc:	fd843503          	ld	a0,-40(s0)
    800017d0:	00000097          	auipc	ra,0x0
    800017d4:	ca8080e7          	jalr	-856(ra) # 80001478 <_Z12printIntegerm>
	printString("\n");
    800017d8:	00004517          	auipc	a0,0x4
    800017dc:	8a050513          	addi	a0,a0,-1888 # 80005078 <CONSOLE_STATUS+0x68>
    800017e0:	00000097          	auipc	ra,0x0
    800017e4:	c70080e7          	jalr	-912(ra) # 80001450 <_Z11printStringPKc>
	for(int i=0;i<1000000;i++){
    800017e8:	00000493          	li	s1,0
    800017ec:	0440006f          	j	80001830 <_Z5nit2fPv+0xd4>
			printString("Nit2: ");
    800017f0:	00004517          	auipc	a0,0x4
    800017f4:	8c050513          	addi	a0,a0,-1856 # 800050b0 <CONSOLE_STATUS+0xa0>
    800017f8:	00000097          	auipc	ra,0x0
    800017fc:	c58080e7          	jalr	-936(ra) # 80001450 <_Z11printStringPKc>
			printInteger(i);
    80001800:	00048513          	mv	a0,s1
    80001804:	00000097          	auipc	ra,0x0
    80001808:	c74080e7          	jalr	-908(ra) # 80001478 <_Z12printIntegerm>
			printString("\n");
    8000180c:	00004517          	auipc	a0,0x4
    80001810:	86c50513          	addi	a0,a0,-1940 # 80005078 <CONSOLE_STATUS+0x68>
    80001814:	00000097          	auipc	ra,0x0
    80001818:	c3c080e7          	jalr	-964(ra) # 80001450 <_Z11printStringPKc>
		if(i%54203==0){
    8000181c:	0000d7b7          	lui	a5,0xd
    80001820:	3bb7879b          	addiw	a5,a5,955
    80001824:	02f4e7bb          	remw	a5,s1,a5
    80001828:	02078463          	beqz	a5,80001850 <_Z5nit2fPv+0xf4>
	for(int i=0;i<1000000;i++){
    8000182c:	0014849b          	addiw	s1,s1,1
    80001830:	000f47b7          	lui	a5,0xf4
    80001834:	23f78793          	addi	a5,a5,575 # f423f <_entry-0x7ff0bdc1>
    80001838:	0297ca63          	blt	a5,s1,8000186c <_Z5nit2fPv+0x110>
		if(i%3500==0) {
    8000183c:	000017b7          	lui	a5,0x1
    80001840:	dac7879b          	addiw	a5,a5,-596
    80001844:	02f4e7bb          	remw	a5,s1,a5
    80001848:	fc079ae3          	bnez	a5,8000181c <_Z5nit2fPv+0xc0>
    8000184c:	fa5ff06f          	j	800017f0 <_Z5nit2fPv+0x94>
			printString("\nyield n2\n");
    80001850:	00004517          	auipc	a0,0x4
    80001854:	86850513          	addi	a0,a0,-1944 # 800050b8 <CONSOLE_STATUS+0xa8>
    80001858:	00000097          	auipc	ra,0x0
    8000185c:	bf8080e7          	jalr	-1032(ra) # 80001450 <_Z11printStringPKc>
			thread_dispatch();
    80001860:	00000097          	auipc	ra,0x0
    80001864:	adc080e7          	jalr	-1316(ra) # 8000133c <_Z15thread_dispatchv>
    80001868:	fc5ff06f          	j	8000182c <_Z5nit2fPv+0xd0>
	printString("\nPokusavam da ugasim nit 2\n");
    8000186c:	00004517          	auipc	a0,0x4
    80001870:	85c50513          	addi	a0,a0,-1956 # 800050c8 <CONSOLE_STATUS+0xb8>
    80001874:	00000097          	auipc	ra,0x0
    80001878:	bdc080e7          	jalr	-1060(ra) # 80001450 <_Z11printStringPKc>
	printString("\nNisam uspeo da ugasim nit 2\n");
    8000187c:	00004517          	auipc	a0,0x4
    80001880:	86c50513          	addi	a0,a0,-1940 # 800050e8 <CONSOLE_STATUS+0xd8>
    80001884:	00000097          	auipc	ra,0x0
    80001888:	bcc080e7          	jalr	-1076(ra) # 80001450 <_Z11printStringPKc>
	printInteger(*(uint64*)arg2);
    8000188c:	00093503          	ld	a0,0(s2)
    80001890:	00000097          	auipc	ra,0x0
    80001894:	be8080e7          	jalr	-1048(ra) # 80001478 <_Z12printIntegerm>
	printString("\nGotova nit 2\n");
    80001898:	00004517          	auipc	a0,0x4
    8000189c:	87050513          	addi	a0,a0,-1936 # 80005108 <CONSOLE_STATUS+0xf8>
    800018a0:	00000097          	auipc	ra,0x0
    800018a4:	bb0080e7          	jalr	-1104(ra) # 80001450 <_Z11printStringPKc>
}
    800018a8:	02813083          	ld	ra,40(sp)
    800018ac:	02013403          	ld	s0,32(sp)
    800018b0:	01813483          	ld	s1,24(sp)
    800018b4:	01013903          	ld	s2,16(sp)
    800018b8:	03010113          	addi	sp,sp,48
    800018bc:	00008067          	ret

00000000800018c0 <_ZN5Riscv7w_stvecEm>:
	uint64 volatile stvec;
	__asm__ volatile("csrr %[stvec], stvec": [stvec] "=r"(stvec));
	return stvec;
}

inline void Riscv::w_stvec(uint64 stvec) {
    800018c0:	ff010113          	addi	sp,sp,-16
    800018c4:	00813423          	sd	s0,8(sp)
    800018c8:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrw stvec, %[stvec]": :[stvec] "r"(stvec));
    800018cc:	10551073          	csrw	stvec,a0
}
    800018d0:	00813403          	ld	s0,8(sp)
    800018d4:	01010113          	addi	sp,sp,16
    800018d8:	00008067          	ret

00000000800018dc <_ZN5Riscv10ms_sstatusEm>:

inline void Riscv::w_sip(uint64 sip) {
	__asm__ volatile("csrw sip, %[sip]": :[sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask) {
    800018dc:	ff010113          	addi	sp,sp,-16
    800018e0:	00813423          	sd	s0,8(sp)
    800018e4:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    800018e8:	10052073          	csrs	sstatus,a0
}
    800018ec:	00813403          	ld	s0,8(sp)
    800018f0:	01010113          	addi	sp,sp,16
    800018f4:	00008067          	ret

00000000800018f8 <_ZN5Riscv10mc_sstatusEm>:

inline void Riscv::mc_sstatus(uint64 mask) {
    800018f8:	ff010113          	addi	sp,sp,-16
    800018fc:	00813423          	sd	s0,8(sp)
    80001900:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80001904:	10053073          	csrc	sstatus,a0
}
    80001908:	00813403          	ld	s0,8(sp)
    8000190c:	01010113          	addi	sp,sp,16
    80001910:	00008067          	ret

0000000080001914 <_ZN3TCB10isFinishedEv>:
	friend class Scheduler;
	using Body = void (*)(void*);

	static TCB* createThread(Body function, void* args, uint64* stack);

	bool isFinished() { return finished; }
    80001914:	ff010113          	addi	sp,sp,-16
    80001918:	00813423          	sd	s0,8(sp)
    8000191c:	01010413          	addi	s0,sp,16
    80001920:	03054503          	lbu	a0,48(a0)
    80001924:	00813403          	ld	s0,8(sp)
    80001928:	01010113          	addi	sp,sp,16
    8000192c:	00008067          	ret

0000000080001930 <interruptRoutine>:
#include "../h/Riscv.hpp"
#include "../h/syscall_c.hpp"
#include "../h/TCB.hpp"

#pragma GCC optimize("O0")
extern "C" void interruptRoutine() {
    80001930:	f3010113          	addi	sp,sp,-208
    80001934:	0c113423          	sd	ra,200(sp)
    80001938:	0c813023          	sd	s0,192(sp)
    8000193c:	0d010413          	addi	s0,sp,208
	uint64 scause, sepc, sstatus;
	__asm__ volatile("csrr %[scause], scause":[scause] "=r"(scause): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001940:	14202373          	csrr	t1,scause
    80001944:	fc643c23          	sd	t1,-40(s0)
	__asm__ volatile("csrr %[sepc], sepc":[sepc] "=r"(sepc): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001948:	14102373          	csrr	t1,sepc
    8000194c:	fc643823          	sd	t1,-48(s0)
	__asm__ volatile("csrr %[status], sstatus":[status] "=r"(
			sstatus): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001950:	10002373          	csrr	t1,sstatus
    80001954:	fc643423          	sd	t1,-56(s0)
	uint64 a0, a1, a2, a3, a4, a5, a6, a7;
	__asm__ volatile("mv %[ax], a0":[ax] "=r"(a0): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001958:	00050313          	mv	t1,a0
    8000195c:	fc643023          	sd	t1,-64(s0)
	__asm__ volatile("mv %[ax], a1":[ax] "=r"(a1): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001960:	00058313          	mv	t1,a1
    80001964:	fa643c23          	sd	t1,-72(s0)
	__asm__ volatile("mv %[ax], a2":[ax] "=r"(a2): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001968:	00060313          	mv	t1,a2
    8000196c:	fa643823          	sd	t1,-80(s0)
	__asm__ volatile("mv %[ax], a3":[ax] "=r"(a3): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001970:	00068313          	mv	t1,a3
    80001974:	fa643423          	sd	t1,-88(s0)
	__asm__ volatile("mv %[ax], a4":[ax] "=r"(a4): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001978:	00070313          	mv	t1,a4
    8000197c:	fa643023          	sd	t1,-96(s0)
	__asm__ volatile("mv %[ax], a5":[ax] "=r"(a5): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001980:	00078313          	mv	t1,a5
    80001984:	f8643c23          	sd	t1,-104(s0)
	__asm__ volatile("mv %[ax], a6":[ax] "=r"(a6): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001988:	00080313          	mv	t1,a6
    8000198c:	f8643823          	sd	t1,-112(s0)
	__asm__ volatile("mv %[ax], a7":[ax] "=r"(a7): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001990:	00088313          	mv	t1,a7
    80001994:	f8643423          	sd	t1,-120(s0)

	if (scause == 0x09 || scause == 0x08) {
    80001998:	fd843703          	ld	a4,-40(s0)
    8000199c:	00900793          	li	a5,9
    800019a0:	00f70863          	beq	a4,a5,800019b0 <interruptRoutine+0x80>
    800019a4:	fd843703          	ld	a4,-40(s0)
    800019a8:	00800793          	li	a5,8
    800019ac:	2af71463          	bne	a4,a5,80001c54 <interruptRoutine+0x324>
		//prekid zbog poziva ecall
		uint64 opCode = a0;
    800019b0:	fc043783          	ld	a5,-64(s0)
    800019b4:	f8f43023          	sd	a5,-128(s0)
		switch (opCode) {
    800019b8:	f8043703          	ld	a4,-128(s0)
    800019bc:	09100793          	li	a5,145
    800019c0:	16f70e63          	beq	a4,a5,80001b3c <interruptRoutine+0x20c>
    800019c4:	f8043703          	ld	a4,-128(s0)
    800019c8:	09100793          	li	a5,145
    800019cc:	24e7ec63          	bltu	a5,a4,80001c24 <interruptRoutine+0x2f4>
    800019d0:	f8043703          	ld	a4,-128(s0)
    800019d4:	04200793          	li	a5,66
    800019d8:	04e7e263          	bltu	a5,a4,80001a1c <interruptRoutine+0xec>
    800019dc:	f8043783          	ld	a5,-128(s0)
    800019e0:	24078263          	beqz	a5,80001c24 <interruptRoutine+0x2f4>
    800019e4:	f8043703          	ld	a4,-128(s0)
    800019e8:	04200793          	li	a5,66
    800019ec:	22e7ec63          	bltu	a5,a4,80001c24 <interruptRoutine+0x2f4>
    800019f0:	f8043783          	ld	a5,-128(s0)
    800019f4:	00279713          	slli	a4,a5,0x2
    800019f8:	00003797          	auipc	a5,0x3
    800019fc:	74c78793          	addi	a5,a5,1868 # 80005144 <CONSOLE_STATUS+0x134>
    80001a00:	00f707b3          	add	a5,a4,a5
    80001a04:	0007a783          	lw	a5,0(a5)
    80001a08:	0007871b          	sext.w	a4,a5
    80001a0c:	00003797          	auipc	a5,0x3
    80001a10:	73878793          	addi	a5,a5,1848 # 80005144 <CONSOLE_STATUS+0x134>
    80001a14:	00f707b3          	add	a5,a4,a5
    80001a18:	00078067          	jr	a5
    80001a1c:	f8043703          	ld	a4,-128(s0)
    80001a20:	09000793          	li	a5,144
    80001a24:	0ef70063          	beq	a4,a5,80001b04 <interruptRoutine+0x1d4>
//				printInteger(opCode);
//				printString("\nscause: ");
//				printInteger(scause);
//				printString("\nsepc: ");
//				printInteger(sepc);
				break;
    80001a28:	1fc0006f          	j	80001c24 <interruptRoutine+0x2f4>
				size = (size_t)a1;
    80001a2c:	fb843783          	ld	a5,-72(s0)
    80001a30:	f4f43023          	sd	a5,-192(s0)
				size = size * MEM_BLOCK_SIZE;
    80001a34:	f4043783          	ld	a5,-192(s0)
    80001a38:	00679793          	slli	a5,a5,0x6
    80001a3c:	f4f43023          	sd	a5,-192(s0)
				MemoryAllocator::kmalloc(size);
    80001a40:	f4043503          	ld	a0,-192(s0)
    80001a44:	00001097          	auipc	ra,0x1
    80001a48:	918080e7          	jalr	-1768(ra) # 8000235c <_ZN15MemoryAllocator7kmallocEm>
				__asm__ volatile("sd a0, 80(s0)");
    80001a4c:	04a43823          	sd	a0,80(s0)
				break;
    80001a50:	1e80006f          	j	80001c38 <interruptRoutine+0x308>
				ptr = (void*)a1;
    80001a54:	fb843783          	ld	a5,-72(s0)
    80001a58:	f4f43423          	sd	a5,-184(s0)
				MemoryAllocator::kfree(ptr);
    80001a5c:	f4843503          	ld	a0,-184(s0)
    80001a60:	00001097          	auipc	ra,0x1
    80001a64:	aa4080e7          	jalr	-1372(ra) # 80002504 <_ZN15MemoryAllocator5kfreeEPv>
				__asm__ volatile("sd a0, 80(s0)");
    80001a68:	04a43823          	sd	a0,80(s0)
				break;
    80001a6c:	1cc0006f          	j	80001c38 <interruptRoutine+0x308>
				handle = (thread_t*)a1;
    80001a70:	fb843783          	ld	a5,-72(s0)
    80001a74:	f6f43423          	sd	a5,-152(s0)
				function = (void (*)(void*))a2;
    80001a78:	fb043783          	ld	a5,-80(s0)
    80001a7c:	f6f43023          	sd	a5,-160(s0)
				args = (void*)a3;
    80001a80:	fa843783          	ld	a5,-88(s0)
    80001a84:	f4f43c23          	sd	a5,-168(s0)
				sp = (uint64*)a4;
    80001a88:	fa043783          	ld	a5,-96(s0)
    80001a8c:	f4f43823          	sd	a5,-176(s0)
				*handle = TCB::createThread(function, args, sp);
    80001a90:	f5043603          	ld	a2,-176(s0)
    80001a94:	f5843583          	ld	a1,-168(s0)
    80001a98:	f6043503          	ld	a0,-160(s0)
    80001a9c:	00000097          	auipc	ra,0x0
    80001aa0:	7b8080e7          	jalr	1976(ra) # 80002254 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80001aa4:	00050713          	mv	a4,a0
    80001aa8:	f6843783          	ld	a5,-152(s0)
    80001aac:	00e7b023          	sd	a4,0(a5)
				if (*handle != nullptr) {
    80001ab0:	f6843783          	ld	a5,-152(s0)
    80001ab4:	0007b783          	ld	a5,0(a5)
    80001ab8:	00078663          	beqz	a5,80001ac4 <interruptRoutine+0x194>
					__asm__ volatile("li a0, 0");
    80001abc:	00000513          	li	a0,0
    80001ac0:	0080006f          	j	80001ac8 <interruptRoutine+0x198>
					__asm__ volatile("li a0, -1");
    80001ac4:	fff00513          	li	a0,-1
				__asm__ volatile("sd a0, 80(s0)");
    80001ac8:	04a43823          	sd	a0,80(s0)
				break;
    80001acc:	16c0006f          	j	80001c38 <interruptRoutine+0x308>
				TCB::running->setFinished(true);
    80001ad0:	00004797          	auipc	a5,0x4
    80001ad4:	4a07b783          	ld	a5,1184(a5) # 80005f70 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001ad8:	0007b783          	ld	a5,0(a5)
    80001adc:	00100593          	li	a1,1
    80001ae0:	00078513          	mv	a0,a5
    80001ae4:	00000097          	auipc	ra,0x0
    80001ae8:	2b8080e7          	jalr	696(ra) # 80001d9c <_ZN3TCB11setFinishedEb>
				TCB::yield();
    80001aec:	00000097          	auipc	ra,0x0
    80001af0:	704080e7          	jalr	1796(ra) # 800021f0 <_ZN3TCB5yieldEv>
				break;
    80001af4:	1440006f          	j	80001c38 <interruptRoutine+0x308>
				TCB::yield();
    80001af8:	00000097          	auipc	ra,0x0
    80001afc:	6f8080e7          	jalr	1784(ra) # 800021f0 <_ZN3TCB5yieldEv>
				break;
    80001b00:	1380006f          	j	80001c38 <interruptRoutine+0x308>
				string = (const char*)a1;
    80001b04:	fb843783          	ld	a5,-72(s0)
    80001b08:	fef43423          	sd	a5,-24(s0)
				while (*string != '\0') {
    80001b0c:	fe843783          	ld	a5,-24(s0)
    80001b10:	0007c783          	lbu	a5,0(a5)
    80001b14:	10078c63          	beqz	a5,80001c2c <interruptRoutine+0x2fc>
					__putc(*string);
    80001b18:	fe843783          	ld	a5,-24(s0)
    80001b1c:	0007c783          	lbu	a5,0(a5)
    80001b20:	00078513          	mv	a0,a5
    80001b24:	00003097          	auipc	ra,0x3
    80001b28:	c98080e7          	jalr	-872(ra) # 800047bc <__putc>
					string++;
    80001b2c:	fe843783          	ld	a5,-24(s0)
    80001b30:	00178793          	addi	a5,a5,1
    80001b34:	fef43423          	sd	a5,-24(s0)
				while (*string != '\0') {
    80001b38:	fd5ff06f          	j	80001b0c <interruptRoutine+0x1dc>
				integer = a1;
    80001b3c:	fb843783          	ld	a5,-72(s0)
    80001b40:	f6f43c23          	sd	a5,-136(s0)
				neg = 0;
    80001b44:	f6042a23          	sw	zero,-140(s0)
					x = integer;
    80001b48:	f7843783          	ld	a5,-136(s0)
    80001b4c:	fef42023          	sw	a5,-32(s0)
				i = 0;
    80001b50:	fe042223          	sw	zero,-28(s0)
					buf[i++] = digits[x % 10];
    80001b54:	fe042703          	lw	a4,-32(s0)
    80001b58:	00a00793          	li	a5,10
    80001b5c:	02f777bb          	remuw	a5,a4,a5
    80001b60:	0007861b          	sext.w	a2,a5
    80001b64:	fe442783          	lw	a5,-28(s0)
    80001b68:	0017871b          	addiw	a4,a5,1
    80001b6c:	fee42223          	sw	a4,-28(s0)
    80001b70:	00004697          	auipc	a3,0x4
    80001b74:	35068693          	addi	a3,a3,848 # 80005ec0 <_ZZ16interruptRoutineE6digits>
    80001b78:	02061713          	slli	a4,a2,0x20
    80001b7c:	02075713          	srli	a4,a4,0x20
    80001b80:	00e68733          	add	a4,a3,a4
    80001b84:	00074703          	lbu	a4,0(a4)
    80001b88:	ff040693          	addi	a3,s0,-16
    80001b8c:	00f687b3          	add	a5,a3,a5
    80001b90:	f4e78023          	sb	a4,-192(a5)
				} while ((x /= 10) != 0);
    80001b94:	fe042703          	lw	a4,-32(s0)
    80001b98:	00a00793          	li	a5,10
    80001b9c:	02f757bb          	divuw	a5,a4,a5
    80001ba0:	fef42023          	sw	a5,-32(s0)
    80001ba4:	fe042783          	lw	a5,-32(s0)
    80001ba8:	0007879b          	sext.w	a5,a5
    80001bac:	00f037b3          	snez	a5,a5
    80001bb0:	0ff7f793          	andi	a5,a5,255
    80001bb4:	00078463          	beqz	a5,80001bbc <interruptRoutine+0x28c>
				do {
    80001bb8:	f9dff06f          	j	80001b54 <interruptRoutine+0x224>
				if (neg) buf[i++] = '-';
    80001bbc:	f7442783          	lw	a5,-140(s0)
    80001bc0:	0007879b          	sext.w	a5,a5
    80001bc4:	02078063          	beqz	a5,80001be4 <interruptRoutine+0x2b4>
    80001bc8:	fe442783          	lw	a5,-28(s0)
    80001bcc:	0017871b          	addiw	a4,a5,1
    80001bd0:	fee42223          	sw	a4,-28(s0)
    80001bd4:	ff040713          	addi	a4,s0,-16
    80001bd8:	00f707b3          	add	a5,a4,a5
    80001bdc:	02d00713          	li	a4,45
    80001be0:	f4e78023          	sb	a4,-192(a5)
				while (--i >= 0) {
    80001be4:	fe442783          	lw	a5,-28(s0)
    80001be8:	fff7879b          	addiw	a5,a5,-1
    80001bec:	fef42223          	sw	a5,-28(s0)
    80001bf0:	fe442783          	lw	a5,-28(s0)
    80001bf4:	fff7c793          	not	a5,a5
    80001bf8:	01f7d79b          	srliw	a5,a5,0x1f
    80001bfc:	0ff7f793          	andi	a5,a5,255
    80001c00:	02078a63          	beqz	a5,80001c34 <interruptRoutine+0x304>
					__putc(buf[i]);
    80001c04:	fe442783          	lw	a5,-28(s0)
    80001c08:	ff040713          	addi	a4,s0,-16
    80001c0c:	00f707b3          	add	a5,a4,a5
    80001c10:	f407c783          	lbu	a5,-192(a5)
    80001c14:	00078513          	mv	a0,a5
    80001c18:	00003097          	auipc	ra,0x3
    80001c1c:	ba4080e7          	jalr	-1116(ra) # 800047bc <__putc>
				while (--i >= 0) {
    80001c20:	fc5ff06f          	j	80001be4 <interruptRoutine+0x2b4>
				break;
    80001c24:	00000013          	nop
    80001c28:	0100006f          	j	80001c38 <interruptRoutine+0x308>
				break;
    80001c2c:	00000013          	nop
    80001c30:	0080006f          	j	80001c38 <interruptRoutine+0x308>
				break;
    80001c34:	00000013          	nop
		}
		//sepc pokazuje na ecall instrukciju, treba preci na sledecu instrukciju
		//sepc += 4;
		__asm__ volatile("addi %[dst], %[src], 0x4":[dst]"=r"(sepc):[src]"r"(
				sepc):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001c38:	fd043303          	ld	t1,-48(s0)
    80001c3c:	00430313          	addi	t1,t1,4
    80001c40:	fc643823          	sd	t1,-48(s0)
		__asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001c44:	fd043303          	ld	t1,-48(s0)
    80001c48:	14131073          	csrw	sepc,t1
    80001c4c:	00000013          	nop
//		printString("scause: ");
//		printInteger(scause);
//		printString("\nsepc: ");
//		printInteger(sepc);
	}
}
    80001c50:	0e40006f          	j	80001d34 <interruptRoutine+0x404>
	} else if (scause == (1UL << 63 | 9)) {
    80001c54:	fd843703          	ld	a4,-40(s0)
    80001c58:	fff00793          	li	a5,-1
    80001c5c:	03f79793          	slli	a5,a5,0x3f
    80001c60:	00978793          	addi	a5,a5,9
    80001c64:	00f71863          	bne	a4,a5,80001c74 <interruptRoutine+0x344>
		console_handler();
    80001c68:	00003097          	auipc	ra,0x3
    80001c6c:	bc8080e7          	jalr	-1080(ra) # 80004830 <console_handler>
}
    80001c70:	0c40006f          	j	80001d34 <interruptRoutine+0x404>
	} else if (scause == (1UL << 63 | 1)) {
    80001c74:	fd843703          	ld	a4,-40(s0)
    80001c78:	fff00793          	li	a5,-1
    80001c7c:	03f79793          	slli	a5,a5,0x3f
    80001c80:	00178793          	addi	a5,a5,1
    80001c84:	0af71863          	bne	a4,a5,80001d34 <interruptRoutine+0x404>
		printString("\nPrekid od tajmera\n");
    80001c88:	00003517          	auipc	a0,0x3
    80001c8c:	49050513          	addi	a0,a0,1168 # 80005118 <CONSOLE_STATUS+0x108>
    80001c90:	fffff097          	auipc	ra,0xfffff
    80001c94:	7c0080e7          	jalr	1984(ra) # 80001450 <_Z11printStringPKc>
		TCB::runningTimeSlice++;
    80001c98:	00004797          	auipc	a5,0x4
    80001c9c:	2c07b783          	ld	a5,704(a5) # 80005f58 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001ca0:	0007b783          	ld	a5,0(a5)
    80001ca4:	00178713          	addi	a4,a5,1
    80001ca8:	00004797          	auipc	a5,0x4
    80001cac:	2b07b783          	ld	a5,688(a5) # 80005f58 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001cb0:	00e7b023          	sd	a4,0(a5)
		if (TCB::runningTimeSlice >= TCB::running->getTimeSlice()) {
    80001cb4:	00004797          	auipc	a5,0x4
    80001cb8:	2bc7b783          	ld	a5,700(a5) # 80005f70 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001cbc:	0007b783          	ld	a5,0(a5)
    80001cc0:	00078513          	mv	a0,a5
    80001cc4:	00000097          	auipc	ra,0x0
    80001cc8:	0f4080e7          	jalr	244(ra) # 80001db8 <_ZN3TCB12getTimeSliceEv>
    80001ccc:	00050713          	mv	a4,a0
    80001cd0:	00004797          	auipc	a5,0x4
    80001cd4:	2887b783          	ld	a5,648(a5) # 80005f58 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001cd8:	0007b783          	ld	a5,0(a5)
    80001cdc:	00e7b7b3          	sltu	a5,a5,a4
    80001ce0:	0017c793          	xori	a5,a5,1
    80001ce4:	0ff7f793          	andi	a5,a5,255
    80001ce8:	02078463          	beqz	a5,80001d10 <interruptRoutine+0x3e0>
			printString("\nMenjam kontekst\n");
    80001cec:	00003517          	auipc	a0,0x3
    80001cf0:	44450513          	addi	a0,a0,1092 # 80005130 <CONSOLE_STATUS+0x120>
    80001cf4:	fffff097          	auipc	ra,0xfffff
    80001cf8:	75c080e7          	jalr	1884(ra) # 80001450 <_Z11printStringPKc>
			TCB::yield();
    80001cfc:	00000097          	auipc	ra,0x0
    80001d00:	4f4080e7          	jalr	1268(ra) # 800021f0 <_ZN3TCB5yieldEv>
			TCB::runningTimeSlice = 0;
    80001d04:	00004797          	auipc	a5,0x4
    80001d08:	2547b783          	ld	a5,596(a5) # 80005f58 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001d0c:	0007b023          	sd	zero,0(a5)
		Riscv::w_sepc(sepc);
    80001d10:	fd043503          	ld	a0,-48(s0)
    80001d14:	00000097          	auipc	ra,0x0
    80001d18:	034080e7          	jalr	52(ra) # 80001d48 <_ZN5Riscv6w_sepcEm>
		Riscv::w_sstatus(sstatus);
    80001d1c:	fc843503          	ld	a0,-56(s0)
    80001d20:	00000097          	auipc	ra,0x0
    80001d24:	060080e7          	jalr	96(ra) # 80001d80 <_ZN5Riscv9w_sstatusEm>
		Riscv::mc_sip(Riscv::SIP_SSIP);
    80001d28:	00200513          	li	a0,2
    80001d2c:	00000097          	auipc	ra,0x0
    80001d30:	038080e7          	jalr	56(ra) # 80001d64 <_ZN5Riscv6mc_sipEm>
}
    80001d34:	00000013          	nop
    80001d38:	0c813083          	ld	ra,200(sp)
    80001d3c:	0c013403          	ld	s0,192(sp)
    80001d40:	0d010113          	addi	sp,sp,208
    80001d44:	00008067          	ret

0000000080001d48 <_ZN5Riscv6w_sepcEm>:
inline void Riscv::w_sepc(uint64 sepc) {
    80001d48:	ff010113          	addi	sp,sp,-16
    80001d4c:	00813423          	sd	s0,8(sp)
    80001d50:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    80001d54:	14151073          	csrw	sepc,a0
}
    80001d58:	00813403          	ld	s0,8(sp)
    80001d5c:	01010113          	addi	sp,sp,16
    80001d60:	00008067          	ret

0000000080001d64 <_ZN5Riscv6mc_sipEm>:
inline void Riscv::mc_sip(uint64 mask) {
    80001d64:	ff010113          	addi	sp,sp,-16
    80001d68:	00813423          	sd	s0,8(sp)
    80001d6c:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sip, %[mask]": :[mask] "r"(mask));
    80001d70:	14453073          	csrc	sip,a0
}
    80001d74:	00813403          	ld	s0,8(sp)
    80001d78:	01010113          	addi	sp,sp,16
    80001d7c:	00008067          	ret

0000000080001d80 <_ZN5Riscv9w_sstatusEm>:
	uint64 volatile sstatus;
	__asm__ volatile("csrr %[sstatus], sstatus": [sstatus] "=r"(sstatus));
	return sstatus;
}

inline void Riscv::w_sstatus(uint64 sstatus) {
    80001d80:	ff010113          	addi	sp,sp,-16
    80001d84:	00813423          	sd	s0,8(sp)
    80001d88:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrw sstatus, %[sstatus]": :[sstatus] "r"(sstatus));
    80001d8c:	10051073          	csrw	sstatus,a0
}
    80001d90:	00813403          	ld	s0,8(sp)
    80001d94:	01010113          	addi	sp,sp,16
    80001d98:	00008067          	ret

0000000080001d9c <_ZN3TCB11setFinishedEb>:

	void setFinished(bool finish) { this->finished = finish; }
    80001d9c:	ff010113          	addi	sp,sp,-16
    80001da0:	00813423          	sd	s0,8(sp)
    80001da4:	01010413          	addi	s0,sp,16
    80001da8:	02b50823          	sb	a1,48(a0)
    80001dac:	00813403          	ld	s0,8(sp)
    80001db0:	01010113          	addi	sp,sp,16
    80001db4:	00008067          	ret

0000000080001db8 <_ZN3TCB12getTimeSliceEv>:

	bool isBlocked() { return blocked; }

	void setBlocked(bool block) { this->blocked = block; }

	uint64 getTimeSlice() { return timeSlice; }
    80001db8:	ff010113          	addi	sp,sp,-16
    80001dbc:	00813423          	sd	s0,8(sp)
    80001dc0:	01010413          	addi	s0,sp,16
    80001dc4:	02853503          	ld	a0,40(a0)
    80001dc8:	00813403          	ld	s0,8(sp)
    80001dcc:	01010113          	addi	sp,sp,16
    80001dd0:	00008067          	ret

0000000080001dd4 <_ZN6ThreadD1Ev>:

Thread::Thread(void (* body)(void*), void* arg) {

}

Thread::~Thread() {
    80001dd4:	ff010113          	addi	sp,sp,-16
    80001dd8:	00813423          	sd	s0,8(sp)
    80001ddc:	01010413          	addi	s0,sp,16

}
    80001de0:	00813403          	ld	s0,8(sp)
    80001de4:	01010113          	addi	sp,sp,16
    80001de8:	00008067          	ret

0000000080001dec <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned int init) {

}

Semaphore::~Semaphore() {
    80001dec:	ff010113          	addi	sp,sp,-16
    80001df0:	00813423          	sd	s0,8(sp)
    80001df4:	01010413          	addi	s0,sp,16

}
    80001df8:	00813403          	ld	s0,8(sp)
    80001dfc:	01010113          	addi	sp,sp,16
    80001e00:	00008067          	ret

0000000080001e04 <_Znwm>:
void* operator new(size_t size) {
    80001e04:	ff010113          	addi	sp,sp,-16
    80001e08:	00113423          	sd	ra,8(sp)
    80001e0c:	00813023          	sd	s0,0(sp)
    80001e10:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    80001e14:	fffff097          	auipc	ra,0xfffff
    80001e18:	410080e7          	jalr	1040(ra) # 80001224 <_Z9mem_allocm>
}
    80001e1c:	00813083          	ld	ra,8(sp)
    80001e20:	00013403          	ld	s0,0(sp)
    80001e24:	01010113          	addi	sp,sp,16
    80001e28:	00008067          	ret

0000000080001e2c <_Znam>:
void* operator new[](size_t size) {
    80001e2c:	ff010113          	addi	sp,sp,-16
    80001e30:	00113423          	sd	ra,8(sp)
    80001e34:	00813023          	sd	s0,0(sp)
    80001e38:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    80001e3c:	fffff097          	auipc	ra,0xfffff
    80001e40:	3e8080e7          	jalr	1000(ra) # 80001224 <_Z9mem_allocm>
}
    80001e44:	00813083          	ld	ra,8(sp)
    80001e48:	00013403          	ld	s0,0(sp)
    80001e4c:	01010113          	addi	sp,sp,16
    80001e50:	00008067          	ret

0000000080001e54 <_ZdlPv>:
void operator delete(void* ptr)noexcept {
    80001e54:	ff010113          	addi	sp,sp,-16
    80001e58:	00113423          	sd	ra,8(sp)
    80001e5c:	00813023          	sd	s0,0(sp)
    80001e60:	01010413          	addi	s0,sp,16
mem_free(ptr);
    80001e64:	fffff097          	auipc	ra,0xfffff
    80001e68:	400080e7          	jalr	1024(ra) # 80001264 <_Z8mem_freePv>
}
    80001e6c:	00813083          	ld	ra,8(sp)
    80001e70:	00013403          	ld	s0,0(sp)
    80001e74:	01010113          	addi	sp,sp,16
    80001e78:	00008067          	ret

0000000080001e7c <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    80001e7c:	ff010113          	addi	sp,sp,-16
    80001e80:	00113423          	sd	ra,8(sp)
    80001e84:	00813023          	sd	s0,0(sp)
    80001e88:	01010413          	addi	s0,sp,16
}
    80001e8c:	00000097          	auipc	ra,0x0
    80001e90:	fc8080e7          	jalr	-56(ra) # 80001e54 <_ZdlPv>
    80001e94:	00813083          	ld	ra,8(sp)
    80001e98:	00013403          	ld	s0,0(sp)
    80001e9c:	01010113          	addi	sp,sp,16
    80001ea0:	00008067          	ret

0000000080001ea4 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    80001ea4:	ff010113          	addi	sp,sp,-16
    80001ea8:	00113423          	sd	ra,8(sp)
    80001eac:	00813023          	sd	s0,0(sp)
    80001eb0:	01010413          	addi	s0,sp,16
}
    80001eb4:	00000097          	auipc	ra,0x0
    80001eb8:	fa0080e7          	jalr	-96(ra) # 80001e54 <_ZdlPv>
    80001ebc:	00813083          	ld	ra,8(sp)
    80001ec0:	00013403          	ld	s0,0(sp)
    80001ec4:	01010113          	addi	sp,sp,16
    80001ec8:	00008067          	ret

0000000080001ecc <_ZdaPv>:
void operator delete[](void* ptr)noexcept {
    80001ecc:	ff010113          	addi	sp,sp,-16
    80001ed0:	00113423          	sd	ra,8(sp)
    80001ed4:	00813023          	sd	s0,0(sp)
    80001ed8:	01010413          	addi	s0,sp,16
mem_free(ptr);
    80001edc:	fffff097          	auipc	ra,0xfffff
    80001ee0:	388080e7          	jalr	904(ra) # 80001264 <_Z8mem_freePv>
}
    80001ee4:	00813083          	ld	ra,8(sp)
    80001ee8:	00013403          	ld	s0,0(sp)
    80001eec:	01010113          	addi	sp,sp,16
    80001ef0:	00008067          	ret

0000000080001ef4 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (* body)(void*), void* arg) {
    80001ef4:	ff010113          	addi	sp,sp,-16
    80001ef8:	00813423          	sd	s0,8(sp)
    80001efc:	01010413          	addi	s0,sp,16
    80001f00:	00004797          	auipc	a5,0x4
    80001f04:	01078793          	addi	a5,a5,16 # 80005f10 <_ZTV6Thread+0x10>
    80001f08:	00f53023          	sd	a5,0(a0)
}
    80001f0c:	00813403          	ld	s0,8(sp)
    80001f10:	01010113          	addi	sp,sp,16
    80001f14:	00008067          	ret

0000000080001f18 <_ZN6Thread5startEv>:
int Thread::start() {
    80001f18:	ff010113          	addi	sp,sp,-16
    80001f1c:	00813423          	sd	s0,8(sp)
    80001f20:	01010413          	addi	s0,sp,16
}
    80001f24:	00000513          	li	a0,0
    80001f28:	00813403          	ld	s0,8(sp)
    80001f2c:	01010113          	addi	sp,sp,16
    80001f30:	00008067          	ret

0000000080001f34 <_ZN6Thread4joinEv>:
void Thread::join() {
    80001f34:	ff010113          	addi	sp,sp,-16
    80001f38:	00813423          	sd	s0,8(sp)
    80001f3c:	01010413          	addi	s0,sp,16
}
    80001f40:	00813403          	ld	s0,8(sp)
    80001f44:	01010113          	addi	sp,sp,16
    80001f48:	00008067          	ret

0000000080001f4c <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    80001f4c:	ff010113          	addi	sp,sp,-16
    80001f50:	00813423          	sd	s0,8(sp)
    80001f54:	01010413          	addi	s0,sp,16
}
    80001f58:	00813403          	ld	s0,8(sp)
    80001f5c:	01010113          	addi	sp,sp,16
    80001f60:	00008067          	ret

0000000080001f64 <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t) {
    80001f64:	ff010113          	addi	sp,sp,-16
    80001f68:	00813423          	sd	s0,8(sp)
    80001f6c:	01010413          	addi	s0,sp,16
}
    80001f70:	00000513          	li	a0,0
    80001f74:	00813403          	ld	s0,8(sp)
    80001f78:	01010113          	addi	sp,sp,16
    80001f7c:	00008067          	ret

0000000080001f80 <_ZN6ThreadC1Ev>:
Thread::Thread() {
    80001f80:	ff010113          	addi	sp,sp,-16
    80001f84:	00813423          	sd	s0,8(sp)
    80001f88:	01010413          	addi	s0,sp,16
    80001f8c:	00004797          	auipc	a5,0x4
    80001f90:	f8478793          	addi	a5,a5,-124 # 80005f10 <_ZTV6Thread+0x10>
    80001f94:	00f53023          	sd	a5,0(a0)
}
    80001f98:	00813403          	ld	s0,8(sp)
    80001f9c:	01010113          	addi	sp,sp,16
    80001fa0:	00008067          	ret

0000000080001fa4 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    80001fa4:	ff010113          	addi	sp,sp,-16
    80001fa8:	00813423          	sd	s0,8(sp)
    80001fac:	01010413          	addi	s0,sp,16
    80001fb0:	00004797          	auipc	a5,0x4
    80001fb4:	f8878793          	addi	a5,a5,-120 # 80005f38 <_ZTV9Semaphore+0x10>
    80001fb8:	00f53023          	sd	a5,0(a0)
}
    80001fbc:	00813403          	ld	s0,8(sp)
    80001fc0:	01010113          	addi	sp,sp,16
    80001fc4:	00008067          	ret

0000000080001fc8 <_ZN9Semaphore4waitEv>:

int Semaphore::wait() {
    80001fc8:	ff010113          	addi	sp,sp,-16
    80001fcc:	00813423          	sd	s0,8(sp)
    80001fd0:	01010413          	addi	s0,sp,16
	return 0;
}
    80001fd4:	00000513          	li	a0,0
    80001fd8:	00813403          	ld	s0,8(sp)
    80001fdc:	01010113          	addi	sp,sp,16
    80001fe0:	00008067          	ret

0000000080001fe4 <_ZN9Semaphore6signalEv>:

int Semaphore::signal() {
    80001fe4:	ff010113          	addi	sp,sp,-16
    80001fe8:	00813423          	sd	s0,8(sp)
    80001fec:	01010413          	addi	s0,sp,16
	return 0;
}
    80001ff0:	00000513          	li	a0,0
    80001ff4:	00813403          	ld	s0,8(sp)
    80001ff8:	01010113          	addi	sp,sp,16
    80001ffc:	00008067          	ret

0000000080002000 <_ZN14PeriodicThread9terminateEv>:

void PeriodicThread::terminate() {
    80002000:	ff010113          	addi	sp,sp,-16
    80002004:	00813423          	sd	s0,8(sp)
    80002008:	01010413          	addi	s0,sp,16

}
    8000200c:	00813403          	ld	s0,8(sp)
    80002010:	01010113          	addi	sp,sp,16
    80002014:	00008067          	ret

0000000080002018 <_ZN14PeriodicThreadC1Em>:

PeriodicThread::PeriodicThread(time_t period) {
    80002018:	fe010113          	addi	sp,sp,-32
    8000201c:	00113c23          	sd	ra,24(sp)
    80002020:	00813823          	sd	s0,16(sp)
    80002024:	00913423          	sd	s1,8(sp)
    80002028:	02010413          	addi	s0,sp,32
    8000202c:	00050493          	mv	s1,a0
    80002030:	00000097          	auipc	ra,0x0
    80002034:	f50080e7          	jalr	-176(ra) # 80001f80 <_ZN6ThreadC1Ev>
    80002038:	00004797          	auipc	a5,0x4
    8000203c:	ea878793          	addi	a5,a5,-344 # 80005ee0 <_ZTV14PeriodicThread+0x10>
    80002040:	00f4b023          	sd	a5,0(s1)

}
    80002044:	01813083          	ld	ra,24(sp)
    80002048:	01013403          	ld	s0,16(sp)
    8000204c:	00813483          	ld	s1,8(sp)
    80002050:	02010113          	addi	sp,sp,32
    80002054:	00008067          	ret

0000000080002058 <_ZN7Console4getcEv>:

char Console::getc() {
    80002058:	ff010113          	addi	sp,sp,-16
    8000205c:	00813423          	sd	s0,8(sp)
    80002060:	01010413          	addi	s0,sp,16
	return 0;
}
    80002064:	00000513          	li	a0,0
    80002068:	00813403          	ld	s0,8(sp)
    8000206c:	01010113          	addi	sp,sp,16
    80002070:	00008067          	ret

0000000080002074 <_ZN7Console4putcEc>:

void Console::putc(char) {
    80002074:	ff010113          	addi	sp,sp,-16
    80002078:	00813423          	sd	s0,8(sp)
    8000207c:	01010413          	addi	s0,sp,16

}
    80002080:	00813403          	ld	s0,8(sp)
    80002084:	01010113          	addi	sp,sp,16
    80002088:	00008067          	ret

000000008000208c <_ZN6Thread3runEv>:
    static void dispatch ();
    static int sleep (time_t);

protected:
    Thread ();
    virtual void run () {}
    8000208c:	ff010113          	addi	sp,sp,-16
    80002090:	00813423          	sd	s0,8(sp)
    80002094:	01010413          	addi	s0,sp,16
    80002098:	00813403          	ld	s0,8(sp)
    8000209c:	01010113          	addi	sp,sp,16
    800020a0:	00008067          	ret

00000000800020a4 <_ZN14PeriodicThread18periodicActivationEv>:
public:
    void terminate ();

protected:
    PeriodicThread (time_t period);
    virtual void periodicActivation () {}
    800020a4:	ff010113          	addi	sp,sp,-16
    800020a8:	00813423          	sd	s0,8(sp)
    800020ac:	01010413          	addi	s0,sp,16
    800020b0:	00813403          	ld	s0,8(sp)
    800020b4:	01010113          	addi	sp,sp,16
    800020b8:	00008067          	ret

00000000800020bc <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    800020bc:	ff010113          	addi	sp,sp,-16
    800020c0:	00813423          	sd	s0,8(sp)
    800020c4:	01010413          	addi	s0,sp,16
    800020c8:	00004797          	auipc	a5,0x4
    800020cc:	e1878793          	addi	a5,a5,-488 # 80005ee0 <_ZTV14PeriodicThread+0x10>
    800020d0:	00f53023          	sd	a5,0(a0)
    800020d4:	00813403          	ld	s0,8(sp)
    800020d8:	01010113          	addi	sp,sp,16
    800020dc:	00008067          	ret

00000000800020e0 <_ZN14PeriodicThreadD0Ev>:
    800020e0:	ff010113          	addi	sp,sp,-16
    800020e4:	00113423          	sd	ra,8(sp)
    800020e8:	00813023          	sd	s0,0(sp)
    800020ec:	01010413          	addi	s0,sp,16
    800020f0:	00004797          	auipc	a5,0x4
    800020f4:	df078793          	addi	a5,a5,-528 # 80005ee0 <_ZTV14PeriodicThread+0x10>
    800020f8:	00f53023          	sd	a5,0(a0)
    800020fc:	00000097          	auipc	ra,0x0
    80002100:	d58080e7          	jalr	-680(ra) # 80001e54 <_ZdlPv>
    80002104:	00813083          	ld	ra,8(sp)
    80002108:	00013403          	ld	s0,0(sp)
    8000210c:	01010113          	addi	sp,sp,16
    80002110:	00008067          	ret

0000000080002114 <_ZN3TCB7wrapperEv>:
	Riscv::pushRegisters();
	TCB::dispatch();
	Riscv::popRegisters();
}

void TCB::wrapper() {
    80002114:	ff010113          	addi	sp,sp,-16
    80002118:	00113423          	sd	ra,8(sp)
    8000211c:	00813023          	sd	s0,0(sp)
    80002120:	01010413          	addi	s0,sp,16
	//pocetak wrappera se izvrsava u supervisor modu,
	//jer nismo izasli iz prekidne rutine prilikom promene konteksta (dispatch/yield)
	Riscv::popSppSpie();
    80002124:	00000097          	auipc	ra,0x0
    80002128:	218080e7          	jalr	536(ra) # 8000233c <_ZN5Riscv10popSppSpieEv>
	//na dalje se izvrsavamo u user modu
	running->threadFunction(running->args);
    8000212c:	00004797          	auipc	a5,0x4
    80002130:	eb47b783          	ld	a5,-332(a5) # 80005fe0 <_ZN3TCB7runningE>
    80002134:	0107b703          	ld	a4,16(a5)
    80002138:	0207b503          	ld	a0,32(a5)
    8000213c:	000700e7          	jalr	a4
	//running->finished = true;
	//i dalje smo u user modu, moramo promenu niti vrsiti sistemskim pozivom
	thread_exit();
    80002140:	fffff097          	auipc	ra,0xfffff
    80002144:	1d4080e7          	jalr	468(ra) # 80001314 <_Z11thread_exitv>
}
    80002148:	00813083          	ld	ra,8(sp)
    8000214c:	00013403          	ld	s0,0(sp)
    80002150:	01010113          	addi	sp,sp,16
    80002154:	00008067          	ret

0000000080002158 <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    80002158:	fe010113          	addi	sp,sp,-32
    8000215c:	00113c23          	sd	ra,24(sp)
    80002160:	00813823          	sd	s0,16(sp)
    80002164:	00913423          	sd	s1,8(sp)
    80002168:	02010413          	addi	s0,sp,32
	TCB* old = TCB::running;
    8000216c:	00004497          	auipc	s1,0x4
    80002170:	e744b483          	ld	s1,-396(s1) # 80005fe0 <_ZN3TCB7runningE>
	if (!old->finished && !old->blocked) {
    80002174:	0304c783          	lbu	a5,48(s1)
    80002178:	00079663          	bnez	a5,80002184 <_ZN3TCB8dispatchEv+0x2c>
    8000217c:	0314c783          	lbu	a5,49(s1)
    80002180:	04078a63          	beqz	a5,800021d4 <_ZN3TCB8dispatchEv+0x7c>
	TCB::running = Scheduler::get();
    80002184:	fffff097          	auipc	ra,0xfffff
    80002188:	360080e7          	jalr	864(ra) # 800014e4 <_ZN9Scheduler3getEv>
    8000218c:	00050593          	mv	a1,a0
    80002190:	00004797          	auipc	a5,0x4
    80002194:	e5078793          	addi	a5,a5,-432 # 80005fe0 <_ZN3TCB7runningE>
    80002198:	00a7b023          	sd	a0,0(a5)
	TCB::runningTimeSlice = 0;
    8000219c:	0007b423          	sd	zero,8(a5)
	if (TCB::running->threadFunction == nullptr) {
    800021a0:	01053783          	ld	a5,16(a0)
    800021a4:	04078063          	beqz	a5,800021e4 <_ZN3TCB8dispatchEv+0x8c>
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    800021a8:	10000793          	li	a5,256
    800021ac:	1007b073          	csrc	sstatus,a5
	if (old != TCB::running) TCB::contextSwitch(&old->context, &running->context);
    800021b0:	00b48863          	beq	s1,a1,800021c0 <_ZN3TCB8dispatchEv+0x68>
    800021b4:	00048513          	mv	a0,s1
    800021b8:	fffff097          	auipc	ra,0xfffff
    800021bc:	058080e7          	jalr	88(ra) # 80001210 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    800021c0:	01813083          	ld	ra,24(sp)
    800021c4:	01013403          	ld	s0,16(sp)
    800021c8:	00813483          	ld	s1,8(sp)
    800021cc:	02010113          	addi	sp,sp,32
    800021d0:	00008067          	ret
		Scheduler::put(old);
    800021d4:	00048513          	mv	a0,s1
    800021d8:	fffff097          	auipc	ra,0xfffff
    800021dc:	2c8080e7          	jalr	712(ra) # 800014a0 <_ZN9Scheduler3putEP3TCB>
    800021e0:	fa5ff06f          	j	80002184 <_ZN3TCB8dispatchEv+0x2c>
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    800021e4:	10000793          	li	a5,256
    800021e8:	1007a073          	csrs	sstatus,a5
}
    800021ec:	fc5ff06f          	j	800021b0 <_ZN3TCB8dispatchEv+0x58>

00000000800021f0 <_ZN3TCB5yieldEv>:
void TCB::yield() {
    800021f0:	ff010113          	addi	sp,sp,-16
    800021f4:	00113423          	sd	ra,8(sp)
    800021f8:	00813023          	sd	s0,0(sp)
    800021fc:	01010413          	addi	s0,sp,16
	Riscv::pushRegisters();
    80002200:	fffff097          	auipc	ra,0xfffff
    80002204:	e00080e7          	jalr	-512(ra) # 80001000 <_ZN5Riscv13pushRegistersEv>
	TCB::dispatch();
    80002208:	00000097          	auipc	ra,0x0
    8000220c:	f50080e7          	jalr	-176(ra) # 80002158 <_ZN3TCB8dispatchEv>
	Riscv::popRegisters();
    80002210:	fffff097          	auipc	ra,0xfffff
    80002214:	e6c080e7          	jalr	-404(ra) # 8000107c <_ZN5Riscv12popRegistersEv>
}
    80002218:	00813083          	ld	ra,8(sp)
    8000221c:	00013403          	ld	s0,0(sp)
    80002220:	01010113          	addi	sp,sp,16
    80002224:	00008067          	ret

0000000080002228 <_ZN3TCBnwEm>:

void* TCB::operator new(size_t size) {
    80002228:	ff010113          	addi	sp,sp,-16
    8000222c:	00113423          	sd	ra,8(sp)
    80002230:	00813023          	sd	s0,0(sp)
    80002234:	01010413          	addi	s0,sp,16
	return MemoryAllocator::kmalloc(size + sizeof(MemoryAllocator::UsedMemSegment));
    80002238:	01050513          	addi	a0,a0,16
    8000223c:	00000097          	auipc	ra,0x0
    80002240:	120080e7          	jalr	288(ra) # 8000235c <_ZN15MemoryAllocator7kmallocEm>
}
    80002244:	00813083          	ld	ra,8(sp)
    80002248:	00013403          	ld	s0,0(sp)
    8000224c:	01010113          	addi	sp,sp,16
    80002250:	00008067          	ret

0000000080002254 <_ZN3TCB12createThreadEPFvPvES0_Pm>:
TCB* TCB::createThread(TCB::Body function, void* args, uint64* stack) {
    80002254:	fd010113          	addi	sp,sp,-48
    80002258:	02113423          	sd	ra,40(sp)
    8000225c:	02813023          	sd	s0,32(sp)
    80002260:	00913c23          	sd	s1,24(sp)
    80002264:	01213823          	sd	s2,16(sp)
    80002268:	01313423          	sd	s3,8(sp)
    8000226c:	01413023          	sd	s4,0(sp)
    80002270:	03010413          	addi	s0,sp,48
    80002274:	00050993          	mv	s3,a0
    80002278:	00058a13          	mv	s4,a1
    8000227c:	00060913          	mv	s2,a2
	TCB* newThread = new TCB(function, args, stack);
    80002280:	04000513          	li	a0,64
    80002284:	00000097          	auipc	ra,0x0
    80002288:	fa4080e7          	jalr	-92(ra) # 80002228 <_ZN3TCBnwEm>
    8000228c:	00050493          	mv	s1,a0
	bool blocked;            //da li je nit blokirana
	TCB* nextInScheduler;    // pokazivac na sledecu nit u Scheduler-u

	TCB(Body function, void* args, uint64* stack) : threadFunction(function), stack(stack), args(args),
													timeSlice(DEFAULT_TIME_SLICE), finished(false), blocked(false),
													nextInScheduler(nullptr) {
    80002290:	01353823          	sd	s3,16(a0)
    80002294:	01253c23          	sd	s2,24(a0)
    80002298:	03453023          	sd	s4,32(a0)
    8000229c:	00200793          	li	a5,2
    800022a0:	02f53423          	sd	a5,40(a0)
    800022a4:	02050823          	sb	zero,48(a0)
    800022a8:	020508a3          	sb	zero,49(a0)
    800022ac:	02053c23          	sd	zero,56(a0)
		//formiranje pocetnog konteksta; specijalni uslovi za main funkciju kojoj se pocetni kontekst automatski formira
		uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
    800022b0:	04098a63          	beqz	s3,80002304 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xb0>
    800022b4:	00000797          	auipc	a5,0x0
    800022b8:	e6078793          	addi	a5,a5,-416 # 80002114 <_ZN3TCB7wrapperEv>
		uint64 startSp = stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0;
    800022bc:	04090863          	beqz	s2,8000230c <_ZN3TCB12createThreadEPFvPvES0_Pm+0xb8>
    800022c0:	00008637          	lui	a2,0x8
    800022c4:	00c90933          	add	s2,s2,a2
		this->context.ra = startRa;
    800022c8:	00f4b023          	sd	a5,0(s1)
		this->context.sp = startSp;
    800022cc:	0124b423          	sd	s2,8(s1)
	if (function != nullptr) Scheduler::put(newThread);
    800022d0:	00098863          	beqz	s3,800022e0 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x8c>
    800022d4:	00048513          	mv	a0,s1
    800022d8:	fffff097          	auipc	ra,0xfffff
    800022dc:	1c8080e7          	jalr	456(ra) # 800014a0 <_ZN9Scheduler3putEP3TCB>
}
    800022e0:	00048513          	mv	a0,s1
    800022e4:	02813083          	ld	ra,40(sp)
    800022e8:	02013403          	ld	s0,32(sp)
    800022ec:	01813483          	ld	s1,24(sp)
    800022f0:	01013903          	ld	s2,16(sp)
    800022f4:	00813983          	ld	s3,8(sp)
    800022f8:	00013a03          	ld	s4,0(sp)
    800022fc:	03010113          	addi	sp,sp,48
    80002300:	00008067          	ret
		uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
    80002304:	00000793          	li	a5,0
    80002308:	fb5ff06f          	j	800022bc <_ZN3TCB12createThreadEPFvPvES0_Pm+0x68>
		uint64 startSp = stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0;
    8000230c:	00000913          	li	s2,0
    80002310:	fb9ff06f          	j	800022c8 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x74>

0000000080002314 <_ZN3TCBdlEPv>:

void TCB::operator delete(void* ptr) {
    80002314:	ff010113          	addi	sp,sp,-16
    80002318:	00113423          	sd	ra,8(sp)
    8000231c:	00813023          	sd	s0,0(sp)
    80002320:	01010413          	addi	s0,sp,16
	MemoryAllocator::kfree(ptr);
    80002324:	00000097          	auipc	ra,0x0
    80002328:	1e0080e7          	jalr	480(ra) # 80002504 <_ZN15MemoryAllocator5kfreeEPv>
}
    8000232c:	00813083          	ld	ra,8(sp)
    80002330:	00013403          	ld	s0,0(sp)
    80002334:	01010113          	addi	sp,sp,16
    80002338:	00008067          	ret

000000008000233c <_ZN5Riscv10popSppSpieEv>:
// Created by os on 5/17/23.
//

#include "../h/Riscv.hpp"

void Riscv::popSppSpie() {
    8000233c:	ff010113          	addi	sp,sp,-16
    80002340:	00813423          	sd	s0,8(sp)
    80002344:	01010413          	addi	s0,sp,16
	//ra pokazuje iza ove funkcije na nastavak wrappera
	__asm__ volatile("csrw sepc, ra");
    80002348:	14109073          	csrw	sepc,ra
	__asm__ volatile("sret");
    8000234c:	10200073          	sret
    80002350:	00813403          	ld	s0,8(sp)
    80002354:	01010113          	addi	sp,sp,16
    80002358:	00008067          	ret

000000008000235c <_ZN15MemoryAllocator7kmallocEm>:

bool MemoryAllocator::initialized = false;
MemoryAllocator::FreeMemSegment* MemoryAllocator::freeMemHead = nullptr;
MemoryAllocator::UsedMemSegment* MemoryAllocator::usedMemHead = nullptr;

void* MemoryAllocator::kmalloc(size_t size) {
    8000235c:	ff010113          	addi	sp,sp,-16
    80002360:	00813423          	sd	s0,8(sp)
    80002364:	01010413          	addi	s0,sp,16
	if (size <= 0) return nullptr;
    80002368:	12050663          	beqz	a0,80002494 <_ZN15MemoryAllocator7kmallocEm+0x138>

	//pocetna inicijalizacija
	if (!initialized) {
    8000236c:	00004797          	auipc	a5,0x4
    80002370:	c847c783          	lbu	a5,-892(a5) # 80005ff0 <_ZN15MemoryAllocator11initializedE>
    80002374:	04079863          	bnez	a5,800023c4 <_ZN15MemoryAllocator7kmallocEm+0x68>
		freeMemHead = (FreeMemSegment*)HEAP_START_ADDR;
    80002378:	00004617          	auipc	a2,0x4
    8000237c:	be863603          	ld	a2,-1048(a2) # 80005f60 <_GLOBAL_OFFSET_TABLE_+0x10>
    80002380:	00063783          	ld	a5,0(a2)
    80002384:	00004717          	auipc	a4,0x4
    80002388:	c6c70713          	addi	a4,a4,-916 # 80005ff0 <_ZN15MemoryAllocator11initializedE>
    8000238c:	00f73423          	sd	a5,8(a4)
		freeMemHead->next = nullptr;
    80002390:	0007b023          	sd	zero,0(a5)
		freeMemHead->prev = nullptr;
    80002394:	00873683          	ld	a3,8(a4)
    80002398:	0006b423          	sd	zero,8(a3)
		freeMemHead->size = (char*)HEAP_END_ADDR - (char*)HEAP_START_ADDR - sizeof(FreeMemSegment);
    8000239c:	00004797          	auipc	a5,0x4
    800023a0:	bdc7b783          	ld	a5,-1060(a5) # 80005f78 <_GLOBAL_OFFSET_TABLE_+0x28>
    800023a4:	0007b783          	ld	a5,0(a5)
    800023a8:	00063603          	ld	a2,0(a2)
    800023ac:	40c787b3          	sub	a5,a5,a2
    800023b0:	fe878793          	addi	a5,a5,-24
    800023b4:	00f6b823          	sd	a5,16(a3)
		usedMemHead = nullptr;
    800023b8:	00073823          	sd	zero,16(a4)

		initialized = true;
    800023bc:	00100793          	li	a5,1
    800023c0:	00f70023          	sb	a5,0(a4)
	}

	//alokacija uvek zaokruzena na blokove
	//size += sizeof(UsedMemSegment); ;prebaceno u mem_alloc
	size_t blocks = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
    800023c4:	00655793          	srli	a5,a0,0x6
    800023c8:	03f57513          	andi	a0,a0,63
    800023cc:	00050463          	beqz	a0,800023d4 <_ZN15MemoryAllocator7kmallocEm+0x78>
    800023d0:	00100513          	li	a0,1
    800023d4:	00a78533          	add	a0,a5,a0
	size = blocks * MEM_BLOCK_SIZE;
    800023d8:	00651793          	slli	a5,a0,0x6

	//trazenje slobodnog segmenta po first-fit algoritmu
	for (FreeMemSegment* current = freeMemHead; current; current = current->next) {
    800023dc:	00004517          	auipc	a0,0x4
    800023e0:	c1c53503          	ld	a0,-996(a0) # 80005ff8 <_ZN15MemoryAllocator11freeMemHeadE>
    800023e4:	08050a63          	beqz	a0,80002478 <_ZN15MemoryAllocator7kmallocEm+0x11c>
		if (current->size < size) continue;
    800023e8:	01053703          	ld	a4,16(a0)
    800023ec:	06f76263          	bltu	a4,a5,80002450 <_ZN15MemoryAllocator7kmallocEm+0xf4>

		//pravljenje novog slobodnog fragmenta od ostatka fragmenta
		FreeMemSegment* remainderFree = (FreeMemSegment*)((char*)current + size);
    800023f0:	00f506b3          	add	a3,a0,a5
		remainderFree->size = current->size - size;
    800023f4:	40f70733          	sub	a4,a4,a5
    800023f8:	00e6b823          	sd	a4,16(a3)
		remainderFree->prev = current->prev;
    800023fc:	00853703          	ld	a4,8(a0)
    80002400:	00e6b423          	sd	a4,8(a3)
		if (current->prev) current->prev->next = remainderFree;
    80002404:	00070463          	beqz	a4,8000240c <_ZN15MemoryAllocator7kmallocEm+0xb0>
    80002408:	00d73023          	sd	a3,0(a4)
		remainderFree->next = current->next;
    8000240c:	00053703          	ld	a4,0(a0)
    80002410:	00e6b023          	sd	a4,0(a3)
		if (current->next) current->next->prev = remainderFree;
    80002414:	00070463          	beqz	a4,8000241c <_ZN15MemoryAllocator7kmallocEm+0xc0>
    80002418:	00d73423          	sd	a3,8(a4)
		if (freeMemHead == current) freeMemHead = remainderFree;
    8000241c:	00004717          	auipc	a4,0x4
    80002420:	bdc73703          	ld	a4,-1060(a4) # 80005ff8 <_ZN15MemoryAllocator11freeMemHeadE>
    80002424:	02a70a63          	beq	a4,a0,80002458 <_ZN15MemoryAllocator7kmallocEm+0xfc>

		//ubacivanje novog fragmenta u listu zauzetih fragmenata
		UsedMemSegment* newFragment = (UsedMemSegment*)current;
		newFragment->size = size;
    80002428:	00f53423          	sd	a5,8(a0)
		UsedMemSegment* prevUsed = nullptr;
		for (UsedMemSegment* cur = usedMemHead; cur && cur < newFragment; prevUsed = cur, cur = cur->next);
    8000242c:	00004697          	auipc	a3,0x4
    80002430:	bd46b683          	ld	a3,-1068(a3) # 80006000 <_ZN15MemoryAllocator11usedMemHeadE>
    80002434:	00068793          	mv	a5,a3
		UsedMemSegment* prevUsed = nullptr;
    80002438:	00000713          	li	a4,0
		for (UsedMemSegment* cur = usedMemHead; cur && cur < newFragment; prevUsed = cur, cur = cur->next);
    8000243c:	02078463          	beqz	a5,80002464 <_ZN15MemoryAllocator7kmallocEm+0x108>
    80002440:	02a7f263          	bgeu	a5,a0,80002464 <_ZN15MemoryAllocator7kmallocEm+0x108>
    80002444:	00078713          	mv	a4,a5
    80002448:	0007b783          	ld	a5,0(a5)
    8000244c:	ff1ff06f          	j	8000243c <_ZN15MemoryAllocator7kmallocEm+0xe0>
	for (FreeMemSegment* current = freeMemHead; current; current = current->next) {
    80002450:	00053503          	ld	a0,0(a0)
    80002454:	f91ff06f          	j	800023e4 <_ZN15MemoryAllocator7kmallocEm+0x88>
		if (freeMemHead == current) freeMemHead = remainderFree;
    80002458:	00004717          	auipc	a4,0x4
    8000245c:	bad73023          	sd	a3,-1120(a4) # 80005ff8 <_ZN15MemoryAllocator11freeMemHeadE>
    80002460:	fc9ff06f          	j	80002428 <_ZN15MemoryAllocator7kmallocEm+0xcc>
		if (!prevUsed) {
    80002464:	02070063          	beqz	a4,80002484 <_ZN15MemoryAllocator7kmallocEm+0x128>
			newFragment->next = usedMemHead;
			usedMemHead = newFragment;
		} else {
			newFragment->next = prevUsed->next;
    80002468:	00073783          	ld	a5,0(a4)
    8000246c:	00f53023          	sd	a5,0(a0)
			prevUsed->next = newFragment;
    80002470:	00a73023          	sd	a0,0(a4)
		}
		return (char*)newFragment + sizeof(UsedMemSegment);
    80002474:	01050513          	addi	a0,a0,16
	}
	return nullptr;
}
    80002478:	00813403          	ld	s0,8(sp)
    8000247c:	01010113          	addi	sp,sp,16
    80002480:	00008067          	ret
			newFragment->next = usedMemHead;
    80002484:	00d53023          	sd	a3,0(a0)
			usedMemHead = newFragment;
    80002488:	00004797          	auipc	a5,0x4
    8000248c:	b6a7bc23          	sd	a0,-1160(a5) # 80006000 <_ZN15MemoryAllocator11usedMemHeadE>
    80002490:	fe5ff06f          	j	80002474 <_ZN15MemoryAllocator7kmallocEm+0x118>
	if (size <= 0) return nullptr;
    80002494:	00000513          	li	a0,0
    80002498:	fe1ff06f          	j	80002478 <_ZN15MemoryAllocator7kmallocEm+0x11c>

000000008000249c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>:
	tryToJoin(newFree);
	tryToJoin(prevFree);
	return 0;
}

int MemoryAllocator::tryToJoin(MemoryAllocator::FreeMemSegment* current) {
    8000249c:	ff010113          	addi	sp,sp,-16
    800024a0:	00813423          	sd	s0,8(sp)
    800024a4:	01010413          	addi	s0,sp,16
	if (!current) return 0;
    800024a8:	04050663          	beqz	a0,800024f4 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x58>
	bool nextExists = current->next != nullptr;
    800024ac:	00053783          	ld	a5,0(a0)
	char* nextAddr = (char*)current + current->size;
    800024b0:	01053703          	ld	a4,16(a0)
    800024b4:	00e506b3          	add	a3,a0,a4
	char* cnext = (char*)current->next;
	bool nextIsConnected = (nextAddr == cnext);
	if (nextExists && nextIsConnected) {
    800024b8:	04078263          	beqz	a5,800024fc <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x60>
    800024bc:	00d78a63          	beq	a5,a3,800024d0 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x34>
		current->size += current->next->size;
		current->next = current->next->next;
		if (current->next) current->next->prev = current;
		return 1;
	} else return 0;
    800024c0:	00000513          	li	a0,0
}
    800024c4:	00813403          	ld	s0,8(sp)
    800024c8:	01010113          	addi	sp,sp,16
    800024cc:	00008067          	ret
		current->size += current->next->size;
    800024d0:	0107b683          	ld	a3,16(a5)
    800024d4:	00d70733          	add	a4,a4,a3
    800024d8:	00e53823          	sd	a4,16(a0)
		current->next = current->next->next;
    800024dc:	0007b783          	ld	a5,0(a5)
    800024e0:	00f53023          	sd	a5,0(a0)
		if (current->next) current->next->prev = current;
    800024e4:	00078463          	beqz	a5,800024ec <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x50>
    800024e8:	00a7b423          	sd	a0,8(a5)
		return 1;
    800024ec:	00100513          	li	a0,1
    800024f0:	fd5ff06f          	j	800024c4 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>
	if (!current) return 0;
    800024f4:	00000513          	li	a0,0
    800024f8:	fcdff06f          	j	800024c4 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>
	} else return 0;
    800024fc:	00000513          	li	a0,0
    80002500:	fc5ff06f          	j	800024c4 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>

0000000080002504 <_ZN15MemoryAllocator5kfreeEPv>:
	if (!ptr) return 0;
    80002504:	10050463          	beqz	a0,8000260c <_ZN15MemoryAllocator5kfreeEPv+0x108>
    80002508:	00050693          	mv	a3,a0
	if (!usedMemHead) return -1;
    8000250c:	00004797          	auipc	a5,0x4
    80002510:	af47b783          	ld	a5,-1292(a5) # 80006000 <_ZN15MemoryAllocator11usedMemHeadE>
    80002514:	10078063          	beqz	a5,80002614 <_ZN15MemoryAllocator5kfreeEPv+0x110>
	ptr = (char*)ptr - sizeof(UsedMemSegment);
    80002518:	ff050513          	addi	a0,a0,-16
	UsedMemSegment* prevUsed = nullptr;
    8000251c:	00000713          	li	a4,0
	for (; currentUsed && currentUsed != ptr; prevUsed = currentUsed, currentUsed = currentUsed->next);
    80002520:	00078a63          	beqz	a5,80002534 <_ZN15MemoryAllocator5kfreeEPv+0x30>
    80002524:	00a78863          	beq	a5,a0,80002534 <_ZN15MemoryAllocator5kfreeEPv+0x30>
    80002528:	00078713          	mv	a4,a5
    8000252c:	0007b783          	ld	a5,0(a5)
    80002530:	ff1ff06f          	j	80002520 <_ZN15MemoryAllocator5kfreeEPv+0x1c>
	if (currentUsed != ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    80002534:	0ea79463          	bne	a5,a0,8000261c <_ZN15MemoryAllocator5kfreeEPv+0x118>
int MemoryAllocator::kfree(void* ptr) {
    80002538:	fe010113          	addi	sp,sp,-32
    8000253c:	00113c23          	sd	ra,24(sp)
    80002540:	00813823          	sd	s0,16(sp)
    80002544:	00913423          	sd	s1,8(sp)
    80002548:	02010413          	addi	s0,sp,32
	if (prevUsed) prevUsed->next = currentUsed->next;
    8000254c:	02070863          	beqz	a4,8000257c <_ZN15MemoryAllocator5kfreeEPv+0x78>
    80002550:	0007b783          	ld	a5,0(a5)
    80002554:	00f73023          	sd	a5,0(a4)
	if (!freeMemHead || ptr < (char*)freeMemHead) {
    80002558:	00004797          	auipc	a5,0x4
    8000255c:	aa07b783          	ld	a5,-1376(a5) # 80005ff8 <_ZN15MemoryAllocator11freeMemHeadE>
    80002560:	02078663          	beqz	a5,8000258c <_ZN15MemoryAllocator5kfreeEPv+0x88>
    80002564:	02f56863          	bltu	a0,a5,80002594 <_ZN15MemoryAllocator5kfreeEPv+0x90>
			 prevFree->next != nullptr && ptr > (char*)(prevFree->next); prevFree = prevFree->next);
    80002568:	00078493          	mv	s1,a5
    8000256c:	0007b783          	ld	a5,0(a5)
    80002570:	02078463          	beqz	a5,80002598 <_ZN15MemoryAllocator5kfreeEPv+0x94>
    80002574:	fea7eae3          	bltu	a5,a0,80002568 <_ZN15MemoryAllocator5kfreeEPv+0x64>
    80002578:	0200006f          	j	80002598 <_ZN15MemoryAllocator5kfreeEPv+0x94>
	else usedMemHead = currentUsed->next;
    8000257c:	0007b783          	ld	a5,0(a5)
    80002580:	00004717          	auipc	a4,0x4
    80002584:	a8f73023          	sd	a5,-1408(a4) # 80006000 <_ZN15MemoryAllocator11usedMemHeadE>
    80002588:	fd1ff06f          	j	80002558 <_ZN15MemoryAllocator5kfreeEPv+0x54>
		prevFree = nullptr;
    8000258c:	00078493          	mv	s1,a5
    80002590:	0080006f          	j	80002598 <_ZN15MemoryAllocator5kfreeEPv+0x94>
    80002594:	00000493          	li	s1,0
	size_t segmentSize = ((UsedMemSegment*)ptr)->size;
    80002598:	ff86b783          	ld	a5,-8(a3)
	newFree->size = segmentSize;
    8000259c:	00f6b023          	sd	a5,0(a3)
	newFree->prev = prevFree;
    800025a0:	fe96bc23          	sd	s1,-8(a3)
	if (prevFree) newFree->next = prevFree->next;
    800025a4:	04048663          	beqz	s1,800025f0 <_ZN15MemoryAllocator5kfreeEPv+0xec>
    800025a8:	0004b783          	ld	a5,0(s1)
    800025ac:	fef6b823          	sd	a5,-16(a3)
	if (newFree->next) newFree->next->prev = newFree;
    800025b0:	ff06b783          	ld	a5,-16(a3)
    800025b4:	00078463          	beqz	a5,800025bc <_ZN15MemoryAllocator5kfreeEPv+0xb8>
    800025b8:	00a7b423          	sd	a0,8(a5)
	if (prevFree) prevFree->next = newFree;
    800025bc:	04048263          	beqz	s1,80002600 <_ZN15MemoryAllocator5kfreeEPv+0xfc>
    800025c0:	00a4b023          	sd	a0,0(s1)
	tryToJoin(newFree);
    800025c4:	00000097          	auipc	ra,0x0
    800025c8:	ed8080e7          	jalr	-296(ra) # 8000249c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
	tryToJoin(prevFree);
    800025cc:	00048513          	mv	a0,s1
    800025d0:	00000097          	auipc	ra,0x0
    800025d4:	ecc080e7          	jalr	-308(ra) # 8000249c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
	return 0;
    800025d8:	00000513          	li	a0,0
}
    800025dc:	01813083          	ld	ra,24(sp)
    800025e0:	01013403          	ld	s0,16(sp)
    800025e4:	00813483          	ld	s1,8(sp)
    800025e8:	02010113          	addi	sp,sp,32
    800025ec:	00008067          	ret
	else newFree->next = freeMemHead;
    800025f0:	00004797          	auipc	a5,0x4
    800025f4:	a087b783          	ld	a5,-1528(a5) # 80005ff8 <_ZN15MemoryAllocator11freeMemHeadE>
    800025f8:	fef6b823          	sd	a5,-16(a3)
    800025fc:	fb5ff06f          	j	800025b0 <_ZN15MemoryAllocator5kfreeEPv+0xac>
	else freeMemHead = newFree;
    80002600:	00004797          	auipc	a5,0x4
    80002604:	9ea7bc23          	sd	a0,-1544(a5) # 80005ff8 <_ZN15MemoryAllocator11freeMemHeadE>
    80002608:	fbdff06f          	j	800025c4 <_ZN15MemoryAllocator5kfreeEPv+0xc0>
	if (!ptr) return 0;
    8000260c:	00000513          	li	a0,0
    80002610:	00008067          	ret
	if (!usedMemHead) return -1;
    80002614:	fff00513          	li	a0,-1
    80002618:	00008067          	ret
	if (currentUsed != ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    8000261c:	fff00513          	li	a0,-1
}
    80002620:	00008067          	ret

0000000080002624 <_Z10testMemoryv>:
// Created by os on 5/29/23.
//
#include "../h/MemoryAllocator.hpp"
#include "../h/helper.hpp"

void testMemory() {
    80002624:	81010113          	addi	sp,sp,-2032
    80002628:	7e113423          	sd	ra,2024(sp)
    8000262c:	7e813023          	sd	s0,2016(sp)
    80002630:	7c913c23          	sd	s1,2008(sp)
    80002634:	7f010413          	addi	s0,sp,2032
    80002638:	83010113          	addi	sp,sp,-2000
	const uint64 NumAllocations = 500;    //zasto nece za preko 500????
	const uint64 AllocationSize = 16;

	// Allocate and initialize pointers
	int* allocations[NumAllocations];
	for (uint64 i = 0; i < NumAllocations; ++i)
    8000263c:	00000713          	li	a4,0
    80002640:	1f300793          	li	a5,499
    80002644:	02e7e263          	bltu	a5,a4,80002668 <_Z10testMemoryv+0x44>
		allocations[i] = nullptr;
    80002648:	fffff7b7          	lui	a5,0xfffff
    8000264c:	00371693          	slli	a3,a4,0x3
    80002650:	fe040613          	addi	a2,s0,-32
    80002654:	00f607b3          	add	a5,a2,a5
    80002658:	00d787b3          	add	a5,a5,a3
    8000265c:	0607b023          	sd	zero,96(a5) # fffffffffffff060 <end+0xffffffff7fff7df0>
	for (uint64 i = 0; i < NumAllocations; ++i)
    80002660:	00170713          	addi	a4,a4,1
    80002664:	fddff06f          	j	80002640 <_Z10testMemoryv+0x1c>

	// Allocate memory
	for (uint64 i = 0; i < NumAllocations; ++i) {
    80002668:	00000493          	li	s1,0
    8000266c:	1f300793          	li	a5,499
    80002670:	0297ea63          	bltu	a5,s1,800026a4 <_Z10testMemoryv+0x80>
		allocations[i] = static_cast<int*>(MemoryAllocator::kmalloc(AllocationSize));
    80002674:	01000513          	li	a0,16
    80002678:	00000097          	auipc	ra,0x0
    8000267c:	ce4080e7          	jalr	-796(ra) # 8000235c <_ZN15MemoryAllocator7kmallocEm>
    80002680:	fffff737          	lui	a4,0xfffff
    80002684:	00349793          	slli	a5,s1,0x3
    80002688:	fe040693          	addi	a3,s0,-32
    8000268c:	00e68733          	add	a4,a3,a4
    80002690:	00f707b3          	add	a5,a4,a5
    80002694:	06a7b023          	sd	a0,96(a5)
		if (allocations[i] == nullptr) {
    80002698:	00050663          	beqz	a0,800026a4 <_Z10testMemoryv+0x80>
	for (uint64 i = 0; i < NumAllocations; ++i) {
    8000269c:	00148493          	addi	s1,s1,1
    800026a0:	fcdff06f          	j	8000266c <_Z10testMemoryv+0x48>
    800026a4:	00000493          	li	s1,0
    800026a8:	0100006f          	j	800026b8 <_Z10testMemoryv+0x94>
	}

	// Free memory
	for (uint64 i = 0; i < NumAllocations; ++i) {
		if (allocations[i] != nullptr) {
			if (MemoryAllocator::kfree(allocations[i]) != 0) {
    800026ac:	00000097          	auipc	ra,0x0
    800026b0:	e58080e7          	jalr	-424(ra) # 80002504 <_ZN15MemoryAllocator5kfreeEPv>
	for (uint64 i = 0; i < NumAllocations; ++i) {
    800026b4:	00148493          	addi	s1,s1,1
    800026b8:	1f300793          	li	a5,499
    800026bc:	0297e263          	bltu	a5,s1,800026e0 <_Z10testMemoryv+0xbc>
		if (allocations[i] != nullptr) {
    800026c0:	fffff737          	lui	a4,0xfffff
    800026c4:	00349793          	slli	a5,s1,0x3
    800026c8:	fe040693          	addi	a3,s0,-32
    800026cc:	00e68733          	add	a4,a3,a4
    800026d0:	00f707b3          	add	a5,a4,a5
    800026d4:	0607b503          	ld	a0,96(a5)
    800026d8:	fc051ae3          	bnez	a0,800026ac <_Z10testMemoryv+0x88>
    800026dc:	fd9ff06f          	j	800026b4 <_Z10testMemoryv+0x90>
//				printString("\nDeallocation failed for index ");
//				printInteger(i);
			}
		}
	}
    800026e0:	7d010113          	addi	sp,sp,2000
    800026e4:	7e813083          	ld	ra,2024(sp)
    800026e8:	7e013403          	ld	s0,2016(sp)
    800026ec:	7d813483          	ld	s1,2008(sp)
    800026f0:	7f010113          	addi	sp,sp,2032
    800026f4:	00008067          	ret

00000000800026f8 <start>:
    800026f8:	ff010113          	addi	sp,sp,-16
    800026fc:	00813423          	sd	s0,8(sp)
    80002700:	01010413          	addi	s0,sp,16
    80002704:	300027f3          	csrr	a5,mstatus
    80002708:	ffffe737          	lui	a4,0xffffe
    8000270c:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff758f>
    80002710:	00e7f7b3          	and	a5,a5,a4
    80002714:	00001737          	lui	a4,0x1
    80002718:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    8000271c:	00e7e7b3          	or	a5,a5,a4
    80002720:	30079073          	csrw	mstatus,a5
    80002724:	00000797          	auipc	a5,0x0
    80002728:	16078793          	addi	a5,a5,352 # 80002884 <system_main>
    8000272c:	34179073          	csrw	mepc,a5
    80002730:	00000793          	li	a5,0
    80002734:	18079073          	csrw	satp,a5
    80002738:	000107b7          	lui	a5,0x10
    8000273c:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80002740:	30279073          	csrw	medeleg,a5
    80002744:	30379073          	csrw	mideleg,a5
    80002748:	104027f3          	csrr	a5,sie
    8000274c:	2227e793          	ori	a5,a5,546
    80002750:	10479073          	csrw	sie,a5
    80002754:	fff00793          	li	a5,-1
    80002758:	00a7d793          	srli	a5,a5,0xa
    8000275c:	3b079073          	csrw	pmpaddr0,a5
    80002760:	00f00793          	li	a5,15
    80002764:	3a079073          	csrw	pmpcfg0,a5
    80002768:	f14027f3          	csrr	a5,mhartid
    8000276c:	0200c737          	lui	a4,0x200c
    80002770:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80002774:	0007869b          	sext.w	a3,a5
    80002778:	00269713          	slli	a4,a3,0x2
    8000277c:	000f4637          	lui	a2,0xf4
    80002780:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80002784:	00d70733          	add	a4,a4,a3
    80002788:	0037979b          	slliw	a5,a5,0x3
    8000278c:	020046b7          	lui	a3,0x2004
    80002790:	00d787b3          	add	a5,a5,a3
    80002794:	00c585b3          	add	a1,a1,a2
    80002798:	00371693          	slli	a3,a4,0x3
    8000279c:	00004717          	auipc	a4,0x4
    800027a0:	87470713          	addi	a4,a4,-1932 # 80006010 <timer_scratch>
    800027a4:	00b7b023          	sd	a1,0(a5)
    800027a8:	00d70733          	add	a4,a4,a3
    800027ac:	00f73c23          	sd	a5,24(a4)
    800027b0:	02c73023          	sd	a2,32(a4)
    800027b4:	34071073          	csrw	mscratch,a4
    800027b8:	00000797          	auipc	a5,0x0
    800027bc:	6e878793          	addi	a5,a5,1768 # 80002ea0 <timervec>
    800027c0:	30579073          	csrw	mtvec,a5
    800027c4:	300027f3          	csrr	a5,mstatus
    800027c8:	0087e793          	ori	a5,a5,8
    800027cc:	30079073          	csrw	mstatus,a5
    800027d0:	304027f3          	csrr	a5,mie
    800027d4:	0807e793          	ori	a5,a5,128
    800027d8:	30479073          	csrw	mie,a5
    800027dc:	f14027f3          	csrr	a5,mhartid
    800027e0:	0007879b          	sext.w	a5,a5
    800027e4:	00078213          	mv	tp,a5
    800027e8:	30200073          	mret
    800027ec:	00813403          	ld	s0,8(sp)
    800027f0:	01010113          	addi	sp,sp,16
    800027f4:	00008067          	ret

00000000800027f8 <timerinit>:
    800027f8:	ff010113          	addi	sp,sp,-16
    800027fc:	00813423          	sd	s0,8(sp)
    80002800:	01010413          	addi	s0,sp,16
    80002804:	f14027f3          	csrr	a5,mhartid
    80002808:	0200c737          	lui	a4,0x200c
    8000280c:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80002810:	0007869b          	sext.w	a3,a5
    80002814:	00269713          	slli	a4,a3,0x2
    80002818:	000f4637          	lui	a2,0xf4
    8000281c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80002820:	00d70733          	add	a4,a4,a3
    80002824:	0037979b          	slliw	a5,a5,0x3
    80002828:	020046b7          	lui	a3,0x2004
    8000282c:	00d787b3          	add	a5,a5,a3
    80002830:	00c585b3          	add	a1,a1,a2
    80002834:	00371693          	slli	a3,a4,0x3
    80002838:	00003717          	auipc	a4,0x3
    8000283c:	7d870713          	addi	a4,a4,2008 # 80006010 <timer_scratch>
    80002840:	00b7b023          	sd	a1,0(a5)
    80002844:	00d70733          	add	a4,a4,a3
    80002848:	00f73c23          	sd	a5,24(a4)
    8000284c:	02c73023          	sd	a2,32(a4)
    80002850:	34071073          	csrw	mscratch,a4
    80002854:	00000797          	auipc	a5,0x0
    80002858:	64c78793          	addi	a5,a5,1612 # 80002ea0 <timervec>
    8000285c:	30579073          	csrw	mtvec,a5
    80002860:	300027f3          	csrr	a5,mstatus
    80002864:	0087e793          	ori	a5,a5,8
    80002868:	30079073          	csrw	mstatus,a5
    8000286c:	304027f3          	csrr	a5,mie
    80002870:	0807e793          	ori	a5,a5,128
    80002874:	30479073          	csrw	mie,a5
    80002878:	00813403          	ld	s0,8(sp)
    8000287c:	01010113          	addi	sp,sp,16
    80002880:	00008067          	ret

0000000080002884 <system_main>:
    80002884:	fe010113          	addi	sp,sp,-32
    80002888:	00813823          	sd	s0,16(sp)
    8000288c:	00913423          	sd	s1,8(sp)
    80002890:	00113c23          	sd	ra,24(sp)
    80002894:	02010413          	addi	s0,sp,32
    80002898:	00000097          	auipc	ra,0x0
    8000289c:	0c4080e7          	jalr	196(ra) # 8000295c <cpuid>
    800028a0:	00003497          	auipc	s1,0x3
    800028a4:	70048493          	addi	s1,s1,1792 # 80005fa0 <started>
    800028a8:	02050263          	beqz	a0,800028cc <system_main+0x48>
    800028ac:	0004a783          	lw	a5,0(s1)
    800028b0:	0007879b          	sext.w	a5,a5
    800028b4:	fe078ce3          	beqz	a5,800028ac <system_main+0x28>
    800028b8:	0ff0000f          	fence
    800028bc:	00003517          	auipc	a0,0x3
    800028c0:	9c450513          	addi	a0,a0,-1596 # 80005280 <CONSOLE_STATUS+0x270>
    800028c4:	00001097          	auipc	ra,0x1
    800028c8:	a78080e7          	jalr	-1416(ra) # 8000333c <panic>
    800028cc:	00001097          	auipc	ra,0x1
    800028d0:	9cc080e7          	jalr	-1588(ra) # 80003298 <consoleinit>
    800028d4:	00001097          	auipc	ra,0x1
    800028d8:	158080e7          	jalr	344(ra) # 80003a2c <printfinit>
    800028dc:	00003517          	auipc	a0,0x3
    800028e0:	a8450513          	addi	a0,a0,-1404 # 80005360 <CONSOLE_STATUS+0x350>
    800028e4:	00001097          	auipc	ra,0x1
    800028e8:	ab4080e7          	jalr	-1356(ra) # 80003398 <__printf>
    800028ec:	00003517          	auipc	a0,0x3
    800028f0:	96450513          	addi	a0,a0,-1692 # 80005250 <CONSOLE_STATUS+0x240>
    800028f4:	00001097          	auipc	ra,0x1
    800028f8:	aa4080e7          	jalr	-1372(ra) # 80003398 <__printf>
    800028fc:	00003517          	auipc	a0,0x3
    80002900:	a6450513          	addi	a0,a0,-1436 # 80005360 <CONSOLE_STATUS+0x350>
    80002904:	00001097          	auipc	ra,0x1
    80002908:	a94080e7          	jalr	-1388(ra) # 80003398 <__printf>
    8000290c:	00001097          	auipc	ra,0x1
    80002910:	4ac080e7          	jalr	1196(ra) # 80003db8 <kinit>
    80002914:	00000097          	auipc	ra,0x0
    80002918:	148080e7          	jalr	328(ra) # 80002a5c <trapinit>
    8000291c:	00000097          	auipc	ra,0x0
    80002920:	16c080e7          	jalr	364(ra) # 80002a88 <trapinithart>
    80002924:	00000097          	auipc	ra,0x0
    80002928:	5bc080e7          	jalr	1468(ra) # 80002ee0 <plicinit>
    8000292c:	00000097          	auipc	ra,0x0
    80002930:	5dc080e7          	jalr	1500(ra) # 80002f08 <plicinithart>
    80002934:	00000097          	auipc	ra,0x0
    80002938:	078080e7          	jalr	120(ra) # 800029ac <userinit>
    8000293c:	0ff0000f          	fence
    80002940:	00100793          	li	a5,1
    80002944:	00003517          	auipc	a0,0x3
    80002948:	92450513          	addi	a0,a0,-1756 # 80005268 <CONSOLE_STATUS+0x258>
    8000294c:	00f4a023          	sw	a5,0(s1)
    80002950:	00001097          	auipc	ra,0x1
    80002954:	a48080e7          	jalr	-1464(ra) # 80003398 <__printf>
    80002958:	0000006f          	j	80002958 <system_main+0xd4>

000000008000295c <cpuid>:
    8000295c:	ff010113          	addi	sp,sp,-16
    80002960:	00813423          	sd	s0,8(sp)
    80002964:	01010413          	addi	s0,sp,16
    80002968:	00020513          	mv	a0,tp
    8000296c:	00813403          	ld	s0,8(sp)
    80002970:	0005051b          	sext.w	a0,a0
    80002974:	01010113          	addi	sp,sp,16
    80002978:	00008067          	ret

000000008000297c <mycpu>:
    8000297c:	ff010113          	addi	sp,sp,-16
    80002980:	00813423          	sd	s0,8(sp)
    80002984:	01010413          	addi	s0,sp,16
    80002988:	00020793          	mv	a5,tp
    8000298c:	00813403          	ld	s0,8(sp)
    80002990:	0007879b          	sext.w	a5,a5
    80002994:	00779793          	slli	a5,a5,0x7
    80002998:	00004517          	auipc	a0,0x4
    8000299c:	6a850513          	addi	a0,a0,1704 # 80007040 <cpus>
    800029a0:	00f50533          	add	a0,a0,a5
    800029a4:	01010113          	addi	sp,sp,16
    800029a8:	00008067          	ret

00000000800029ac <userinit>:
    800029ac:	ff010113          	addi	sp,sp,-16
    800029b0:	00813423          	sd	s0,8(sp)
    800029b4:	01010413          	addi	s0,sp,16
    800029b8:	00813403          	ld	s0,8(sp)
    800029bc:	01010113          	addi	sp,sp,16
    800029c0:	fffff317          	auipc	t1,0xfffff
    800029c4:	b6030067          	jr	-1184(t1) # 80001520 <main>

00000000800029c8 <either_copyout>:
    800029c8:	ff010113          	addi	sp,sp,-16
    800029cc:	00813023          	sd	s0,0(sp)
    800029d0:	00113423          	sd	ra,8(sp)
    800029d4:	01010413          	addi	s0,sp,16
    800029d8:	02051663          	bnez	a0,80002a04 <either_copyout+0x3c>
    800029dc:	00058513          	mv	a0,a1
    800029e0:	00060593          	mv	a1,a2
    800029e4:	0006861b          	sext.w	a2,a3
    800029e8:	00002097          	auipc	ra,0x2
    800029ec:	c5c080e7          	jalr	-932(ra) # 80004644 <__memmove>
    800029f0:	00813083          	ld	ra,8(sp)
    800029f4:	00013403          	ld	s0,0(sp)
    800029f8:	00000513          	li	a0,0
    800029fc:	01010113          	addi	sp,sp,16
    80002a00:	00008067          	ret
    80002a04:	00003517          	auipc	a0,0x3
    80002a08:	8a450513          	addi	a0,a0,-1884 # 800052a8 <CONSOLE_STATUS+0x298>
    80002a0c:	00001097          	auipc	ra,0x1
    80002a10:	930080e7          	jalr	-1744(ra) # 8000333c <panic>

0000000080002a14 <either_copyin>:
    80002a14:	ff010113          	addi	sp,sp,-16
    80002a18:	00813023          	sd	s0,0(sp)
    80002a1c:	00113423          	sd	ra,8(sp)
    80002a20:	01010413          	addi	s0,sp,16
    80002a24:	02059463          	bnez	a1,80002a4c <either_copyin+0x38>
    80002a28:	00060593          	mv	a1,a2
    80002a2c:	0006861b          	sext.w	a2,a3
    80002a30:	00002097          	auipc	ra,0x2
    80002a34:	c14080e7          	jalr	-1004(ra) # 80004644 <__memmove>
    80002a38:	00813083          	ld	ra,8(sp)
    80002a3c:	00013403          	ld	s0,0(sp)
    80002a40:	00000513          	li	a0,0
    80002a44:	01010113          	addi	sp,sp,16
    80002a48:	00008067          	ret
    80002a4c:	00003517          	auipc	a0,0x3
    80002a50:	88450513          	addi	a0,a0,-1916 # 800052d0 <CONSOLE_STATUS+0x2c0>
    80002a54:	00001097          	auipc	ra,0x1
    80002a58:	8e8080e7          	jalr	-1816(ra) # 8000333c <panic>

0000000080002a5c <trapinit>:
    80002a5c:	ff010113          	addi	sp,sp,-16
    80002a60:	00813423          	sd	s0,8(sp)
    80002a64:	01010413          	addi	s0,sp,16
    80002a68:	00813403          	ld	s0,8(sp)
    80002a6c:	00003597          	auipc	a1,0x3
    80002a70:	88c58593          	addi	a1,a1,-1908 # 800052f8 <CONSOLE_STATUS+0x2e8>
    80002a74:	00004517          	auipc	a0,0x4
    80002a78:	64c50513          	addi	a0,a0,1612 # 800070c0 <tickslock>
    80002a7c:	01010113          	addi	sp,sp,16
    80002a80:	00001317          	auipc	t1,0x1
    80002a84:	5c830067          	jr	1480(t1) # 80004048 <initlock>

0000000080002a88 <trapinithart>:
    80002a88:	ff010113          	addi	sp,sp,-16
    80002a8c:	00813423          	sd	s0,8(sp)
    80002a90:	01010413          	addi	s0,sp,16
    80002a94:	00000797          	auipc	a5,0x0
    80002a98:	2fc78793          	addi	a5,a5,764 # 80002d90 <kernelvec>
    80002a9c:	10579073          	csrw	stvec,a5
    80002aa0:	00813403          	ld	s0,8(sp)
    80002aa4:	01010113          	addi	sp,sp,16
    80002aa8:	00008067          	ret

0000000080002aac <usertrap>:
    80002aac:	ff010113          	addi	sp,sp,-16
    80002ab0:	00813423          	sd	s0,8(sp)
    80002ab4:	01010413          	addi	s0,sp,16
    80002ab8:	00813403          	ld	s0,8(sp)
    80002abc:	01010113          	addi	sp,sp,16
    80002ac0:	00008067          	ret

0000000080002ac4 <usertrapret>:
    80002ac4:	ff010113          	addi	sp,sp,-16
    80002ac8:	00813423          	sd	s0,8(sp)
    80002acc:	01010413          	addi	s0,sp,16
    80002ad0:	00813403          	ld	s0,8(sp)
    80002ad4:	01010113          	addi	sp,sp,16
    80002ad8:	00008067          	ret

0000000080002adc <kerneltrap>:
    80002adc:	fe010113          	addi	sp,sp,-32
    80002ae0:	00813823          	sd	s0,16(sp)
    80002ae4:	00113c23          	sd	ra,24(sp)
    80002ae8:	00913423          	sd	s1,8(sp)
    80002aec:	02010413          	addi	s0,sp,32
    80002af0:	142025f3          	csrr	a1,scause
    80002af4:	100027f3          	csrr	a5,sstatus
    80002af8:	0027f793          	andi	a5,a5,2
    80002afc:	10079c63          	bnez	a5,80002c14 <kerneltrap+0x138>
    80002b00:	142027f3          	csrr	a5,scause
    80002b04:	0207ce63          	bltz	a5,80002b40 <kerneltrap+0x64>
    80002b08:	00003517          	auipc	a0,0x3
    80002b0c:	83850513          	addi	a0,a0,-1992 # 80005340 <CONSOLE_STATUS+0x330>
    80002b10:	00001097          	auipc	ra,0x1
    80002b14:	888080e7          	jalr	-1912(ra) # 80003398 <__printf>
    80002b18:	141025f3          	csrr	a1,sepc
    80002b1c:	14302673          	csrr	a2,stval
    80002b20:	00003517          	auipc	a0,0x3
    80002b24:	83050513          	addi	a0,a0,-2000 # 80005350 <CONSOLE_STATUS+0x340>
    80002b28:	00001097          	auipc	ra,0x1
    80002b2c:	870080e7          	jalr	-1936(ra) # 80003398 <__printf>
    80002b30:	00003517          	auipc	a0,0x3
    80002b34:	83850513          	addi	a0,a0,-1992 # 80005368 <CONSOLE_STATUS+0x358>
    80002b38:	00001097          	auipc	ra,0x1
    80002b3c:	804080e7          	jalr	-2044(ra) # 8000333c <panic>
    80002b40:	0ff7f713          	andi	a4,a5,255
    80002b44:	00900693          	li	a3,9
    80002b48:	04d70063          	beq	a4,a3,80002b88 <kerneltrap+0xac>
    80002b4c:	fff00713          	li	a4,-1
    80002b50:	03f71713          	slli	a4,a4,0x3f
    80002b54:	00170713          	addi	a4,a4,1
    80002b58:	fae798e3          	bne	a5,a4,80002b08 <kerneltrap+0x2c>
    80002b5c:	00000097          	auipc	ra,0x0
    80002b60:	e00080e7          	jalr	-512(ra) # 8000295c <cpuid>
    80002b64:	06050663          	beqz	a0,80002bd0 <kerneltrap+0xf4>
    80002b68:	144027f3          	csrr	a5,sip
    80002b6c:	ffd7f793          	andi	a5,a5,-3
    80002b70:	14479073          	csrw	sip,a5
    80002b74:	01813083          	ld	ra,24(sp)
    80002b78:	01013403          	ld	s0,16(sp)
    80002b7c:	00813483          	ld	s1,8(sp)
    80002b80:	02010113          	addi	sp,sp,32
    80002b84:	00008067          	ret
    80002b88:	00000097          	auipc	ra,0x0
    80002b8c:	3cc080e7          	jalr	972(ra) # 80002f54 <plic_claim>
    80002b90:	00a00793          	li	a5,10
    80002b94:	00050493          	mv	s1,a0
    80002b98:	06f50863          	beq	a0,a5,80002c08 <kerneltrap+0x12c>
    80002b9c:	fc050ce3          	beqz	a0,80002b74 <kerneltrap+0x98>
    80002ba0:	00050593          	mv	a1,a0
    80002ba4:	00002517          	auipc	a0,0x2
    80002ba8:	77c50513          	addi	a0,a0,1916 # 80005320 <CONSOLE_STATUS+0x310>
    80002bac:	00000097          	auipc	ra,0x0
    80002bb0:	7ec080e7          	jalr	2028(ra) # 80003398 <__printf>
    80002bb4:	01013403          	ld	s0,16(sp)
    80002bb8:	01813083          	ld	ra,24(sp)
    80002bbc:	00048513          	mv	a0,s1
    80002bc0:	00813483          	ld	s1,8(sp)
    80002bc4:	02010113          	addi	sp,sp,32
    80002bc8:	00000317          	auipc	t1,0x0
    80002bcc:	3c430067          	jr	964(t1) # 80002f8c <plic_complete>
    80002bd0:	00004517          	auipc	a0,0x4
    80002bd4:	4f050513          	addi	a0,a0,1264 # 800070c0 <tickslock>
    80002bd8:	00001097          	auipc	ra,0x1
    80002bdc:	494080e7          	jalr	1172(ra) # 8000406c <acquire>
    80002be0:	00003717          	auipc	a4,0x3
    80002be4:	3c470713          	addi	a4,a4,964 # 80005fa4 <ticks>
    80002be8:	00072783          	lw	a5,0(a4)
    80002bec:	00004517          	auipc	a0,0x4
    80002bf0:	4d450513          	addi	a0,a0,1236 # 800070c0 <tickslock>
    80002bf4:	0017879b          	addiw	a5,a5,1
    80002bf8:	00f72023          	sw	a5,0(a4)
    80002bfc:	00001097          	auipc	ra,0x1
    80002c00:	53c080e7          	jalr	1340(ra) # 80004138 <release>
    80002c04:	f65ff06f          	j	80002b68 <kerneltrap+0x8c>
    80002c08:	00001097          	auipc	ra,0x1
    80002c0c:	098080e7          	jalr	152(ra) # 80003ca0 <uartintr>
    80002c10:	fa5ff06f          	j	80002bb4 <kerneltrap+0xd8>
    80002c14:	00002517          	auipc	a0,0x2
    80002c18:	6ec50513          	addi	a0,a0,1772 # 80005300 <CONSOLE_STATUS+0x2f0>
    80002c1c:	00000097          	auipc	ra,0x0
    80002c20:	720080e7          	jalr	1824(ra) # 8000333c <panic>

0000000080002c24 <clockintr>:
    80002c24:	fe010113          	addi	sp,sp,-32
    80002c28:	00813823          	sd	s0,16(sp)
    80002c2c:	00913423          	sd	s1,8(sp)
    80002c30:	00113c23          	sd	ra,24(sp)
    80002c34:	02010413          	addi	s0,sp,32
    80002c38:	00004497          	auipc	s1,0x4
    80002c3c:	48848493          	addi	s1,s1,1160 # 800070c0 <tickslock>
    80002c40:	00048513          	mv	a0,s1
    80002c44:	00001097          	auipc	ra,0x1
    80002c48:	428080e7          	jalr	1064(ra) # 8000406c <acquire>
    80002c4c:	00003717          	auipc	a4,0x3
    80002c50:	35870713          	addi	a4,a4,856 # 80005fa4 <ticks>
    80002c54:	00072783          	lw	a5,0(a4)
    80002c58:	01013403          	ld	s0,16(sp)
    80002c5c:	01813083          	ld	ra,24(sp)
    80002c60:	00048513          	mv	a0,s1
    80002c64:	0017879b          	addiw	a5,a5,1
    80002c68:	00813483          	ld	s1,8(sp)
    80002c6c:	00f72023          	sw	a5,0(a4)
    80002c70:	02010113          	addi	sp,sp,32
    80002c74:	00001317          	auipc	t1,0x1
    80002c78:	4c430067          	jr	1220(t1) # 80004138 <release>

0000000080002c7c <devintr>:
    80002c7c:	142027f3          	csrr	a5,scause
    80002c80:	00000513          	li	a0,0
    80002c84:	0007c463          	bltz	a5,80002c8c <devintr+0x10>
    80002c88:	00008067          	ret
    80002c8c:	fe010113          	addi	sp,sp,-32
    80002c90:	00813823          	sd	s0,16(sp)
    80002c94:	00113c23          	sd	ra,24(sp)
    80002c98:	00913423          	sd	s1,8(sp)
    80002c9c:	02010413          	addi	s0,sp,32
    80002ca0:	0ff7f713          	andi	a4,a5,255
    80002ca4:	00900693          	li	a3,9
    80002ca8:	04d70c63          	beq	a4,a3,80002d00 <devintr+0x84>
    80002cac:	fff00713          	li	a4,-1
    80002cb0:	03f71713          	slli	a4,a4,0x3f
    80002cb4:	00170713          	addi	a4,a4,1
    80002cb8:	00e78c63          	beq	a5,a4,80002cd0 <devintr+0x54>
    80002cbc:	01813083          	ld	ra,24(sp)
    80002cc0:	01013403          	ld	s0,16(sp)
    80002cc4:	00813483          	ld	s1,8(sp)
    80002cc8:	02010113          	addi	sp,sp,32
    80002ccc:	00008067          	ret
    80002cd0:	00000097          	auipc	ra,0x0
    80002cd4:	c8c080e7          	jalr	-884(ra) # 8000295c <cpuid>
    80002cd8:	06050663          	beqz	a0,80002d44 <devintr+0xc8>
    80002cdc:	144027f3          	csrr	a5,sip
    80002ce0:	ffd7f793          	andi	a5,a5,-3
    80002ce4:	14479073          	csrw	sip,a5
    80002ce8:	01813083          	ld	ra,24(sp)
    80002cec:	01013403          	ld	s0,16(sp)
    80002cf0:	00813483          	ld	s1,8(sp)
    80002cf4:	00200513          	li	a0,2
    80002cf8:	02010113          	addi	sp,sp,32
    80002cfc:	00008067          	ret
    80002d00:	00000097          	auipc	ra,0x0
    80002d04:	254080e7          	jalr	596(ra) # 80002f54 <plic_claim>
    80002d08:	00a00793          	li	a5,10
    80002d0c:	00050493          	mv	s1,a0
    80002d10:	06f50663          	beq	a0,a5,80002d7c <devintr+0x100>
    80002d14:	00100513          	li	a0,1
    80002d18:	fa0482e3          	beqz	s1,80002cbc <devintr+0x40>
    80002d1c:	00048593          	mv	a1,s1
    80002d20:	00002517          	auipc	a0,0x2
    80002d24:	60050513          	addi	a0,a0,1536 # 80005320 <CONSOLE_STATUS+0x310>
    80002d28:	00000097          	auipc	ra,0x0
    80002d2c:	670080e7          	jalr	1648(ra) # 80003398 <__printf>
    80002d30:	00048513          	mv	a0,s1
    80002d34:	00000097          	auipc	ra,0x0
    80002d38:	258080e7          	jalr	600(ra) # 80002f8c <plic_complete>
    80002d3c:	00100513          	li	a0,1
    80002d40:	f7dff06f          	j	80002cbc <devintr+0x40>
    80002d44:	00004517          	auipc	a0,0x4
    80002d48:	37c50513          	addi	a0,a0,892 # 800070c0 <tickslock>
    80002d4c:	00001097          	auipc	ra,0x1
    80002d50:	320080e7          	jalr	800(ra) # 8000406c <acquire>
    80002d54:	00003717          	auipc	a4,0x3
    80002d58:	25070713          	addi	a4,a4,592 # 80005fa4 <ticks>
    80002d5c:	00072783          	lw	a5,0(a4)
    80002d60:	00004517          	auipc	a0,0x4
    80002d64:	36050513          	addi	a0,a0,864 # 800070c0 <tickslock>
    80002d68:	0017879b          	addiw	a5,a5,1
    80002d6c:	00f72023          	sw	a5,0(a4)
    80002d70:	00001097          	auipc	ra,0x1
    80002d74:	3c8080e7          	jalr	968(ra) # 80004138 <release>
    80002d78:	f65ff06f          	j	80002cdc <devintr+0x60>
    80002d7c:	00001097          	auipc	ra,0x1
    80002d80:	f24080e7          	jalr	-220(ra) # 80003ca0 <uartintr>
    80002d84:	fadff06f          	j	80002d30 <devintr+0xb4>
	...

0000000080002d90 <kernelvec>:
    80002d90:	f0010113          	addi	sp,sp,-256
    80002d94:	00113023          	sd	ra,0(sp)
    80002d98:	00213423          	sd	sp,8(sp)
    80002d9c:	00313823          	sd	gp,16(sp)
    80002da0:	00413c23          	sd	tp,24(sp)
    80002da4:	02513023          	sd	t0,32(sp)
    80002da8:	02613423          	sd	t1,40(sp)
    80002dac:	02713823          	sd	t2,48(sp)
    80002db0:	02813c23          	sd	s0,56(sp)
    80002db4:	04913023          	sd	s1,64(sp)
    80002db8:	04a13423          	sd	a0,72(sp)
    80002dbc:	04b13823          	sd	a1,80(sp)
    80002dc0:	04c13c23          	sd	a2,88(sp)
    80002dc4:	06d13023          	sd	a3,96(sp)
    80002dc8:	06e13423          	sd	a4,104(sp)
    80002dcc:	06f13823          	sd	a5,112(sp)
    80002dd0:	07013c23          	sd	a6,120(sp)
    80002dd4:	09113023          	sd	a7,128(sp)
    80002dd8:	09213423          	sd	s2,136(sp)
    80002ddc:	09313823          	sd	s3,144(sp)
    80002de0:	09413c23          	sd	s4,152(sp)
    80002de4:	0b513023          	sd	s5,160(sp)
    80002de8:	0b613423          	sd	s6,168(sp)
    80002dec:	0b713823          	sd	s7,176(sp)
    80002df0:	0b813c23          	sd	s8,184(sp)
    80002df4:	0d913023          	sd	s9,192(sp)
    80002df8:	0da13423          	sd	s10,200(sp)
    80002dfc:	0db13823          	sd	s11,208(sp)
    80002e00:	0dc13c23          	sd	t3,216(sp)
    80002e04:	0fd13023          	sd	t4,224(sp)
    80002e08:	0fe13423          	sd	t5,232(sp)
    80002e0c:	0ff13823          	sd	t6,240(sp)
    80002e10:	ccdff0ef          	jal	ra,80002adc <kerneltrap>
    80002e14:	00013083          	ld	ra,0(sp)
    80002e18:	00813103          	ld	sp,8(sp)
    80002e1c:	01013183          	ld	gp,16(sp)
    80002e20:	02013283          	ld	t0,32(sp)
    80002e24:	02813303          	ld	t1,40(sp)
    80002e28:	03013383          	ld	t2,48(sp)
    80002e2c:	03813403          	ld	s0,56(sp)
    80002e30:	04013483          	ld	s1,64(sp)
    80002e34:	04813503          	ld	a0,72(sp)
    80002e38:	05013583          	ld	a1,80(sp)
    80002e3c:	05813603          	ld	a2,88(sp)
    80002e40:	06013683          	ld	a3,96(sp)
    80002e44:	06813703          	ld	a4,104(sp)
    80002e48:	07013783          	ld	a5,112(sp)
    80002e4c:	07813803          	ld	a6,120(sp)
    80002e50:	08013883          	ld	a7,128(sp)
    80002e54:	08813903          	ld	s2,136(sp)
    80002e58:	09013983          	ld	s3,144(sp)
    80002e5c:	09813a03          	ld	s4,152(sp)
    80002e60:	0a013a83          	ld	s5,160(sp)
    80002e64:	0a813b03          	ld	s6,168(sp)
    80002e68:	0b013b83          	ld	s7,176(sp)
    80002e6c:	0b813c03          	ld	s8,184(sp)
    80002e70:	0c013c83          	ld	s9,192(sp)
    80002e74:	0c813d03          	ld	s10,200(sp)
    80002e78:	0d013d83          	ld	s11,208(sp)
    80002e7c:	0d813e03          	ld	t3,216(sp)
    80002e80:	0e013e83          	ld	t4,224(sp)
    80002e84:	0e813f03          	ld	t5,232(sp)
    80002e88:	0f013f83          	ld	t6,240(sp)
    80002e8c:	10010113          	addi	sp,sp,256
    80002e90:	10200073          	sret
    80002e94:	00000013          	nop
    80002e98:	00000013          	nop
    80002e9c:	00000013          	nop

0000000080002ea0 <timervec>:
    80002ea0:	34051573          	csrrw	a0,mscratch,a0
    80002ea4:	00b53023          	sd	a1,0(a0)
    80002ea8:	00c53423          	sd	a2,8(a0)
    80002eac:	00d53823          	sd	a3,16(a0)
    80002eb0:	01853583          	ld	a1,24(a0)
    80002eb4:	02053603          	ld	a2,32(a0)
    80002eb8:	0005b683          	ld	a3,0(a1)
    80002ebc:	00c686b3          	add	a3,a3,a2
    80002ec0:	00d5b023          	sd	a3,0(a1)
    80002ec4:	00200593          	li	a1,2
    80002ec8:	14459073          	csrw	sip,a1
    80002ecc:	01053683          	ld	a3,16(a0)
    80002ed0:	00853603          	ld	a2,8(a0)
    80002ed4:	00053583          	ld	a1,0(a0)
    80002ed8:	34051573          	csrrw	a0,mscratch,a0
    80002edc:	30200073          	mret

0000000080002ee0 <plicinit>:
    80002ee0:	ff010113          	addi	sp,sp,-16
    80002ee4:	00813423          	sd	s0,8(sp)
    80002ee8:	01010413          	addi	s0,sp,16
    80002eec:	00813403          	ld	s0,8(sp)
    80002ef0:	0c0007b7          	lui	a5,0xc000
    80002ef4:	00100713          	li	a4,1
    80002ef8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    80002efc:	00e7a223          	sw	a4,4(a5)
    80002f00:	01010113          	addi	sp,sp,16
    80002f04:	00008067          	ret

0000000080002f08 <plicinithart>:
    80002f08:	ff010113          	addi	sp,sp,-16
    80002f0c:	00813023          	sd	s0,0(sp)
    80002f10:	00113423          	sd	ra,8(sp)
    80002f14:	01010413          	addi	s0,sp,16
    80002f18:	00000097          	auipc	ra,0x0
    80002f1c:	a44080e7          	jalr	-1468(ra) # 8000295c <cpuid>
    80002f20:	0085171b          	slliw	a4,a0,0x8
    80002f24:	0c0027b7          	lui	a5,0xc002
    80002f28:	00e787b3          	add	a5,a5,a4
    80002f2c:	40200713          	li	a4,1026
    80002f30:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80002f34:	00813083          	ld	ra,8(sp)
    80002f38:	00013403          	ld	s0,0(sp)
    80002f3c:	00d5151b          	slliw	a0,a0,0xd
    80002f40:	0c2017b7          	lui	a5,0xc201
    80002f44:	00a78533          	add	a0,a5,a0
    80002f48:	00052023          	sw	zero,0(a0)
    80002f4c:	01010113          	addi	sp,sp,16
    80002f50:	00008067          	ret

0000000080002f54 <plic_claim>:
    80002f54:	ff010113          	addi	sp,sp,-16
    80002f58:	00813023          	sd	s0,0(sp)
    80002f5c:	00113423          	sd	ra,8(sp)
    80002f60:	01010413          	addi	s0,sp,16
    80002f64:	00000097          	auipc	ra,0x0
    80002f68:	9f8080e7          	jalr	-1544(ra) # 8000295c <cpuid>
    80002f6c:	00813083          	ld	ra,8(sp)
    80002f70:	00013403          	ld	s0,0(sp)
    80002f74:	00d5151b          	slliw	a0,a0,0xd
    80002f78:	0c2017b7          	lui	a5,0xc201
    80002f7c:	00a78533          	add	a0,a5,a0
    80002f80:	00452503          	lw	a0,4(a0)
    80002f84:	01010113          	addi	sp,sp,16
    80002f88:	00008067          	ret

0000000080002f8c <plic_complete>:
    80002f8c:	fe010113          	addi	sp,sp,-32
    80002f90:	00813823          	sd	s0,16(sp)
    80002f94:	00913423          	sd	s1,8(sp)
    80002f98:	00113c23          	sd	ra,24(sp)
    80002f9c:	02010413          	addi	s0,sp,32
    80002fa0:	00050493          	mv	s1,a0
    80002fa4:	00000097          	auipc	ra,0x0
    80002fa8:	9b8080e7          	jalr	-1608(ra) # 8000295c <cpuid>
    80002fac:	01813083          	ld	ra,24(sp)
    80002fb0:	01013403          	ld	s0,16(sp)
    80002fb4:	00d5179b          	slliw	a5,a0,0xd
    80002fb8:	0c201737          	lui	a4,0xc201
    80002fbc:	00f707b3          	add	a5,a4,a5
    80002fc0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80002fc4:	00813483          	ld	s1,8(sp)
    80002fc8:	02010113          	addi	sp,sp,32
    80002fcc:	00008067          	ret

0000000080002fd0 <consolewrite>:
    80002fd0:	fb010113          	addi	sp,sp,-80
    80002fd4:	04813023          	sd	s0,64(sp)
    80002fd8:	04113423          	sd	ra,72(sp)
    80002fdc:	02913c23          	sd	s1,56(sp)
    80002fe0:	03213823          	sd	s2,48(sp)
    80002fe4:	03313423          	sd	s3,40(sp)
    80002fe8:	03413023          	sd	s4,32(sp)
    80002fec:	01513c23          	sd	s5,24(sp)
    80002ff0:	05010413          	addi	s0,sp,80
    80002ff4:	06c05c63          	blez	a2,8000306c <consolewrite+0x9c>
    80002ff8:	00060993          	mv	s3,a2
    80002ffc:	00050a13          	mv	s4,a0
    80003000:	00058493          	mv	s1,a1
    80003004:	00000913          	li	s2,0
    80003008:	fff00a93          	li	s5,-1
    8000300c:	01c0006f          	j	80003028 <consolewrite+0x58>
    80003010:	fbf44503          	lbu	a0,-65(s0)
    80003014:	0019091b          	addiw	s2,s2,1
    80003018:	00148493          	addi	s1,s1,1
    8000301c:	00001097          	auipc	ra,0x1
    80003020:	a9c080e7          	jalr	-1380(ra) # 80003ab8 <uartputc>
    80003024:	03298063          	beq	s3,s2,80003044 <consolewrite+0x74>
    80003028:	00048613          	mv	a2,s1
    8000302c:	00100693          	li	a3,1
    80003030:	000a0593          	mv	a1,s4
    80003034:	fbf40513          	addi	a0,s0,-65
    80003038:	00000097          	auipc	ra,0x0
    8000303c:	9dc080e7          	jalr	-1572(ra) # 80002a14 <either_copyin>
    80003040:	fd5518e3          	bne	a0,s5,80003010 <consolewrite+0x40>
    80003044:	04813083          	ld	ra,72(sp)
    80003048:	04013403          	ld	s0,64(sp)
    8000304c:	03813483          	ld	s1,56(sp)
    80003050:	02813983          	ld	s3,40(sp)
    80003054:	02013a03          	ld	s4,32(sp)
    80003058:	01813a83          	ld	s5,24(sp)
    8000305c:	00090513          	mv	a0,s2
    80003060:	03013903          	ld	s2,48(sp)
    80003064:	05010113          	addi	sp,sp,80
    80003068:	00008067          	ret
    8000306c:	00000913          	li	s2,0
    80003070:	fd5ff06f          	j	80003044 <consolewrite+0x74>

0000000080003074 <consoleread>:
    80003074:	f9010113          	addi	sp,sp,-112
    80003078:	06813023          	sd	s0,96(sp)
    8000307c:	04913c23          	sd	s1,88(sp)
    80003080:	05213823          	sd	s2,80(sp)
    80003084:	05313423          	sd	s3,72(sp)
    80003088:	05413023          	sd	s4,64(sp)
    8000308c:	03513c23          	sd	s5,56(sp)
    80003090:	03613823          	sd	s6,48(sp)
    80003094:	03713423          	sd	s7,40(sp)
    80003098:	03813023          	sd	s8,32(sp)
    8000309c:	06113423          	sd	ra,104(sp)
    800030a0:	01913c23          	sd	s9,24(sp)
    800030a4:	07010413          	addi	s0,sp,112
    800030a8:	00060b93          	mv	s7,a2
    800030ac:	00050913          	mv	s2,a0
    800030b0:	00058c13          	mv	s8,a1
    800030b4:	00060b1b          	sext.w	s6,a2
    800030b8:	00004497          	auipc	s1,0x4
    800030bc:	03048493          	addi	s1,s1,48 # 800070e8 <cons>
    800030c0:	00400993          	li	s3,4
    800030c4:	fff00a13          	li	s4,-1
    800030c8:	00a00a93          	li	s5,10
    800030cc:	05705e63          	blez	s7,80003128 <consoleread+0xb4>
    800030d0:	09c4a703          	lw	a4,156(s1)
    800030d4:	0984a783          	lw	a5,152(s1)
    800030d8:	0007071b          	sext.w	a4,a4
    800030dc:	08e78463          	beq	a5,a4,80003164 <consoleread+0xf0>
    800030e0:	07f7f713          	andi	a4,a5,127
    800030e4:	00e48733          	add	a4,s1,a4
    800030e8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    800030ec:	0017869b          	addiw	a3,a5,1
    800030f0:	08d4ac23          	sw	a3,152(s1)
    800030f4:	00070c9b          	sext.w	s9,a4
    800030f8:	0b370663          	beq	a4,s3,800031a4 <consoleread+0x130>
    800030fc:	00100693          	li	a3,1
    80003100:	f9f40613          	addi	a2,s0,-97
    80003104:	000c0593          	mv	a1,s8
    80003108:	00090513          	mv	a0,s2
    8000310c:	f8e40fa3          	sb	a4,-97(s0)
    80003110:	00000097          	auipc	ra,0x0
    80003114:	8b8080e7          	jalr	-1864(ra) # 800029c8 <either_copyout>
    80003118:	01450863          	beq	a0,s4,80003128 <consoleread+0xb4>
    8000311c:	001c0c13          	addi	s8,s8,1
    80003120:	fffb8b9b          	addiw	s7,s7,-1
    80003124:	fb5c94e3          	bne	s9,s5,800030cc <consoleread+0x58>
    80003128:	000b851b          	sext.w	a0,s7
    8000312c:	06813083          	ld	ra,104(sp)
    80003130:	06013403          	ld	s0,96(sp)
    80003134:	05813483          	ld	s1,88(sp)
    80003138:	05013903          	ld	s2,80(sp)
    8000313c:	04813983          	ld	s3,72(sp)
    80003140:	04013a03          	ld	s4,64(sp)
    80003144:	03813a83          	ld	s5,56(sp)
    80003148:	02813b83          	ld	s7,40(sp)
    8000314c:	02013c03          	ld	s8,32(sp)
    80003150:	01813c83          	ld	s9,24(sp)
    80003154:	40ab053b          	subw	a0,s6,a0
    80003158:	03013b03          	ld	s6,48(sp)
    8000315c:	07010113          	addi	sp,sp,112
    80003160:	00008067          	ret
    80003164:	00001097          	auipc	ra,0x1
    80003168:	1d8080e7          	jalr	472(ra) # 8000433c <push_on>
    8000316c:	0984a703          	lw	a4,152(s1)
    80003170:	09c4a783          	lw	a5,156(s1)
    80003174:	0007879b          	sext.w	a5,a5
    80003178:	fef70ce3          	beq	a4,a5,80003170 <consoleread+0xfc>
    8000317c:	00001097          	auipc	ra,0x1
    80003180:	234080e7          	jalr	564(ra) # 800043b0 <pop_on>
    80003184:	0984a783          	lw	a5,152(s1)
    80003188:	07f7f713          	andi	a4,a5,127
    8000318c:	00e48733          	add	a4,s1,a4
    80003190:	01874703          	lbu	a4,24(a4)
    80003194:	0017869b          	addiw	a3,a5,1
    80003198:	08d4ac23          	sw	a3,152(s1)
    8000319c:	00070c9b          	sext.w	s9,a4
    800031a0:	f5371ee3          	bne	a4,s3,800030fc <consoleread+0x88>
    800031a4:	000b851b          	sext.w	a0,s7
    800031a8:	f96bf2e3          	bgeu	s7,s6,8000312c <consoleread+0xb8>
    800031ac:	08f4ac23          	sw	a5,152(s1)
    800031b0:	f7dff06f          	j	8000312c <consoleread+0xb8>

00000000800031b4 <consputc>:
    800031b4:	10000793          	li	a5,256
    800031b8:	00f50663          	beq	a0,a5,800031c4 <consputc+0x10>
    800031bc:	00001317          	auipc	t1,0x1
    800031c0:	9f430067          	jr	-1548(t1) # 80003bb0 <uartputc_sync>
    800031c4:	ff010113          	addi	sp,sp,-16
    800031c8:	00113423          	sd	ra,8(sp)
    800031cc:	00813023          	sd	s0,0(sp)
    800031d0:	01010413          	addi	s0,sp,16
    800031d4:	00800513          	li	a0,8
    800031d8:	00001097          	auipc	ra,0x1
    800031dc:	9d8080e7          	jalr	-1576(ra) # 80003bb0 <uartputc_sync>
    800031e0:	02000513          	li	a0,32
    800031e4:	00001097          	auipc	ra,0x1
    800031e8:	9cc080e7          	jalr	-1588(ra) # 80003bb0 <uartputc_sync>
    800031ec:	00013403          	ld	s0,0(sp)
    800031f0:	00813083          	ld	ra,8(sp)
    800031f4:	00800513          	li	a0,8
    800031f8:	01010113          	addi	sp,sp,16
    800031fc:	00001317          	auipc	t1,0x1
    80003200:	9b430067          	jr	-1612(t1) # 80003bb0 <uartputc_sync>

0000000080003204 <consoleintr>:
    80003204:	fe010113          	addi	sp,sp,-32
    80003208:	00813823          	sd	s0,16(sp)
    8000320c:	00913423          	sd	s1,8(sp)
    80003210:	01213023          	sd	s2,0(sp)
    80003214:	00113c23          	sd	ra,24(sp)
    80003218:	02010413          	addi	s0,sp,32
    8000321c:	00004917          	auipc	s2,0x4
    80003220:	ecc90913          	addi	s2,s2,-308 # 800070e8 <cons>
    80003224:	00050493          	mv	s1,a0
    80003228:	00090513          	mv	a0,s2
    8000322c:	00001097          	auipc	ra,0x1
    80003230:	e40080e7          	jalr	-448(ra) # 8000406c <acquire>
    80003234:	02048c63          	beqz	s1,8000326c <consoleintr+0x68>
    80003238:	0a092783          	lw	a5,160(s2)
    8000323c:	09892703          	lw	a4,152(s2)
    80003240:	07f00693          	li	a3,127
    80003244:	40e7873b          	subw	a4,a5,a4
    80003248:	02e6e263          	bltu	a3,a4,8000326c <consoleintr+0x68>
    8000324c:	00d00713          	li	a4,13
    80003250:	04e48063          	beq	s1,a4,80003290 <consoleintr+0x8c>
    80003254:	07f7f713          	andi	a4,a5,127
    80003258:	00e90733          	add	a4,s2,a4
    8000325c:	0017879b          	addiw	a5,a5,1
    80003260:	0af92023          	sw	a5,160(s2)
    80003264:	00970c23          	sb	s1,24(a4)
    80003268:	08f92e23          	sw	a5,156(s2)
    8000326c:	01013403          	ld	s0,16(sp)
    80003270:	01813083          	ld	ra,24(sp)
    80003274:	00813483          	ld	s1,8(sp)
    80003278:	00013903          	ld	s2,0(sp)
    8000327c:	00004517          	auipc	a0,0x4
    80003280:	e6c50513          	addi	a0,a0,-404 # 800070e8 <cons>
    80003284:	02010113          	addi	sp,sp,32
    80003288:	00001317          	auipc	t1,0x1
    8000328c:	eb030067          	jr	-336(t1) # 80004138 <release>
    80003290:	00a00493          	li	s1,10
    80003294:	fc1ff06f          	j	80003254 <consoleintr+0x50>

0000000080003298 <consoleinit>:
    80003298:	fe010113          	addi	sp,sp,-32
    8000329c:	00113c23          	sd	ra,24(sp)
    800032a0:	00813823          	sd	s0,16(sp)
    800032a4:	00913423          	sd	s1,8(sp)
    800032a8:	02010413          	addi	s0,sp,32
    800032ac:	00004497          	auipc	s1,0x4
    800032b0:	e3c48493          	addi	s1,s1,-452 # 800070e8 <cons>
    800032b4:	00048513          	mv	a0,s1
    800032b8:	00002597          	auipc	a1,0x2
    800032bc:	0c058593          	addi	a1,a1,192 # 80005378 <CONSOLE_STATUS+0x368>
    800032c0:	00001097          	auipc	ra,0x1
    800032c4:	d88080e7          	jalr	-632(ra) # 80004048 <initlock>
    800032c8:	00000097          	auipc	ra,0x0
    800032cc:	7ac080e7          	jalr	1964(ra) # 80003a74 <uartinit>
    800032d0:	01813083          	ld	ra,24(sp)
    800032d4:	01013403          	ld	s0,16(sp)
    800032d8:	00000797          	auipc	a5,0x0
    800032dc:	d9c78793          	addi	a5,a5,-612 # 80003074 <consoleread>
    800032e0:	0af4bc23          	sd	a5,184(s1)
    800032e4:	00000797          	auipc	a5,0x0
    800032e8:	cec78793          	addi	a5,a5,-788 # 80002fd0 <consolewrite>
    800032ec:	0cf4b023          	sd	a5,192(s1)
    800032f0:	00813483          	ld	s1,8(sp)
    800032f4:	02010113          	addi	sp,sp,32
    800032f8:	00008067          	ret

00000000800032fc <console_read>:
    800032fc:	ff010113          	addi	sp,sp,-16
    80003300:	00813423          	sd	s0,8(sp)
    80003304:	01010413          	addi	s0,sp,16
    80003308:	00813403          	ld	s0,8(sp)
    8000330c:	00004317          	auipc	t1,0x4
    80003310:	e9433303          	ld	t1,-364(t1) # 800071a0 <devsw+0x10>
    80003314:	01010113          	addi	sp,sp,16
    80003318:	00030067          	jr	t1

000000008000331c <console_write>:
    8000331c:	ff010113          	addi	sp,sp,-16
    80003320:	00813423          	sd	s0,8(sp)
    80003324:	01010413          	addi	s0,sp,16
    80003328:	00813403          	ld	s0,8(sp)
    8000332c:	00004317          	auipc	t1,0x4
    80003330:	e7c33303          	ld	t1,-388(t1) # 800071a8 <devsw+0x18>
    80003334:	01010113          	addi	sp,sp,16
    80003338:	00030067          	jr	t1

000000008000333c <panic>:
    8000333c:	fe010113          	addi	sp,sp,-32
    80003340:	00113c23          	sd	ra,24(sp)
    80003344:	00813823          	sd	s0,16(sp)
    80003348:	00913423          	sd	s1,8(sp)
    8000334c:	02010413          	addi	s0,sp,32
    80003350:	00050493          	mv	s1,a0
    80003354:	00002517          	auipc	a0,0x2
    80003358:	02c50513          	addi	a0,a0,44 # 80005380 <CONSOLE_STATUS+0x370>
    8000335c:	00004797          	auipc	a5,0x4
    80003360:	ee07a623          	sw	zero,-276(a5) # 80007248 <pr+0x18>
    80003364:	00000097          	auipc	ra,0x0
    80003368:	034080e7          	jalr	52(ra) # 80003398 <__printf>
    8000336c:	00048513          	mv	a0,s1
    80003370:	00000097          	auipc	ra,0x0
    80003374:	028080e7          	jalr	40(ra) # 80003398 <__printf>
    80003378:	00002517          	auipc	a0,0x2
    8000337c:	fe850513          	addi	a0,a0,-24 # 80005360 <CONSOLE_STATUS+0x350>
    80003380:	00000097          	auipc	ra,0x0
    80003384:	018080e7          	jalr	24(ra) # 80003398 <__printf>
    80003388:	00100793          	li	a5,1
    8000338c:	00003717          	auipc	a4,0x3
    80003390:	c0f72e23          	sw	a5,-996(a4) # 80005fa8 <panicked>
    80003394:	0000006f          	j	80003394 <panic+0x58>

0000000080003398 <__printf>:
    80003398:	f3010113          	addi	sp,sp,-208
    8000339c:	08813023          	sd	s0,128(sp)
    800033a0:	07313423          	sd	s3,104(sp)
    800033a4:	09010413          	addi	s0,sp,144
    800033a8:	05813023          	sd	s8,64(sp)
    800033ac:	08113423          	sd	ra,136(sp)
    800033b0:	06913c23          	sd	s1,120(sp)
    800033b4:	07213823          	sd	s2,112(sp)
    800033b8:	07413023          	sd	s4,96(sp)
    800033bc:	05513c23          	sd	s5,88(sp)
    800033c0:	05613823          	sd	s6,80(sp)
    800033c4:	05713423          	sd	s7,72(sp)
    800033c8:	03913c23          	sd	s9,56(sp)
    800033cc:	03a13823          	sd	s10,48(sp)
    800033d0:	03b13423          	sd	s11,40(sp)
    800033d4:	00004317          	auipc	t1,0x4
    800033d8:	e5c30313          	addi	t1,t1,-420 # 80007230 <pr>
    800033dc:	01832c03          	lw	s8,24(t1)
    800033e0:	00b43423          	sd	a1,8(s0)
    800033e4:	00c43823          	sd	a2,16(s0)
    800033e8:	00d43c23          	sd	a3,24(s0)
    800033ec:	02e43023          	sd	a4,32(s0)
    800033f0:	02f43423          	sd	a5,40(s0)
    800033f4:	03043823          	sd	a6,48(s0)
    800033f8:	03143c23          	sd	a7,56(s0)
    800033fc:	00050993          	mv	s3,a0
    80003400:	4a0c1663          	bnez	s8,800038ac <__printf+0x514>
    80003404:	60098c63          	beqz	s3,80003a1c <__printf+0x684>
    80003408:	0009c503          	lbu	a0,0(s3)
    8000340c:	00840793          	addi	a5,s0,8
    80003410:	f6f43c23          	sd	a5,-136(s0)
    80003414:	00000493          	li	s1,0
    80003418:	22050063          	beqz	a0,80003638 <__printf+0x2a0>
    8000341c:	00002a37          	lui	s4,0x2
    80003420:	00018ab7          	lui	s5,0x18
    80003424:	000f4b37          	lui	s6,0xf4
    80003428:	00989bb7          	lui	s7,0x989
    8000342c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80003430:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80003434:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80003438:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    8000343c:	00148c9b          	addiw	s9,s1,1
    80003440:	02500793          	li	a5,37
    80003444:	01998933          	add	s2,s3,s9
    80003448:	38f51263          	bne	a0,a5,800037cc <__printf+0x434>
    8000344c:	00094783          	lbu	a5,0(s2)
    80003450:	00078c9b          	sext.w	s9,a5
    80003454:	1e078263          	beqz	a5,80003638 <__printf+0x2a0>
    80003458:	0024849b          	addiw	s1,s1,2
    8000345c:	07000713          	li	a4,112
    80003460:	00998933          	add	s2,s3,s1
    80003464:	38e78a63          	beq	a5,a4,800037f8 <__printf+0x460>
    80003468:	20f76863          	bltu	a4,a5,80003678 <__printf+0x2e0>
    8000346c:	42a78863          	beq	a5,a0,8000389c <__printf+0x504>
    80003470:	06400713          	li	a4,100
    80003474:	40e79663          	bne	a5,a4,80003880 <__printf+0x4e8>
    80003478:	f7843783          	ld	a5,-136(s0)
    8000347c:	0007a603          	lw	a2,0(a5)
    80003480:	00878793          	addi	a5,a5,8
    80003484:	f6f43c23          	sd	a5,-136(s0)
    80003488:	42064a63          	bltz	a2,800038bc <__printf+0x524>
    8000348c:	00a00713          	li	a4,10
    80003490:	02e677bb          	remuw	a5,a2,a4
    80003494:	00002d97          	auipc	s11,0x2
    80003498:	f14d8d93          	addi	s11,s11,-236 # 800053a8 <digits>
    8000349c:	00900593          	li	a1,9
    800034a0:	0006051b          	sext.w	a0,a2
    800034a4:	00000c93          	li	s9,0
    800034a8:	02079793          	slli	a5,a5,0x20
    800034ac:	0207d793          	srli	a5,a5,0x20
    800034b0:	00fd87b3          	add	a5,s11,a5
    800034b4:	0007c783          	lbu	a5,0(a5)
    800034b8:	02e656bb          	divuw	a3,a2,a4
    800034bc:	f8f40023          	sb	a5,-128(s0)
    800034c0:	14c5d863          	bge	a1,a2,80003610 <__printf+0x278>
    800034c4:	06300593          	li	a1,99
    800034c8:	00100c93          	li	s9,1
    800034cc:	02e6f7bb          	remuw	a5,a3,a4
    800034d0:	02079793          	slli	a5,a5,0x20
    800034d4:	0207d793          	srli	a5,a5,0x20
    800034d8:	00fd87b3          	add	a5,s11,a5
    800034dc:	0007c783          	lbu	a5,0(a5)
    800034e0:	02e6d73b          	divuw	a4,a3,a4
    800034e4:	f8f400a3          	sb	a5,-127(s0)
    800034e8:	12a5f463          	bgeu	a1,a0,80003610 <__printf+0x278>
    800034ec:	00a00693          	li	a3,10
    800034f0:	00900593          	li	a1,9
    800034f4:	02d777bb          	remuw	a5,a4,a3
    800034f8:	02079793          	slli	a5,a5,0x20
    800034fc:	0207d793          	srli	a5,a5,0x20
    80003500:	00fd87b3          	add	a5,s11,a5
    80003504:	0007c503          	lbu	a0,0(a5)
    80003508:	02d757bb          	divuw	a5,a4,a3
    8000350c:	f8a40123          	sb	a0,-126(s0)
    80003510:	48e5f263          	bgeu	a1,a4,80003994 <__printf+0x5fc>
    80003514:	06300513          	li	a0,99
    80003518:	02d7f5bb          	remuw	a1,a5,a3
    8000351c:	02059593          	slli	a1,a1,0x20
    80003520:	0205d593          	srli	a1,a1,0x20
    80003524:	00bd85b3          	add	a1,s11,a1
    80003528:	0005c583          	lbu	a1,0(a1)
    8000352c:	02d7d7bb          	divuw	a5,a5,a3
    80003530:	f8b401a3          	sb	a1,-125(s0)
    80003534:	48e57263          	bgeu	a0,a4,800039b8 <__printf+0x620>
    80003538:	3e700513          	li	a0,999
    8000353c:	02d7f5bb          	remuw	a1,a5,a3
    80003540:	02059593          	slli	a1,a1,0x20
    80003544:	0205d593          	srli	a1,a1,0x20
    80003548:	00bd85b3          	add	a1,s11,a1
    8000354c:	0005c583          	lbu	a1,0(a1)
    80003550:	02d7d7bb          	divuw	a5,a5,a3
    80003554:	f8b40223          	sb	a1,-124(s0)
    80003558:	46e57663          	bgeu	a0,a4,800039c4 <__printf+0x62c>
    8000355c:	02d7f5bb          	remuw	a1,a5,a3
    80003560:	02059593          	slli	a1,a1,0x20
    80003564:	0205d593          	srli	a1,a1,0x20
    80003568:	00bd85b3          	add	a1,s11,a1
    8000356c:	0005c583          	lbu	a1,0(a1)
    80003570:	02d7d7bb          	divuw	a5,a5,a3
    80003574:	f8b402a3          	sb	a1,-123(s0)
    80003578:	46ea7863          	bgeu	s4,a4,800039e8 <__printf+0x650>
    8000357c:	02d7f5bb          	remuw	a1,a5,a3
    80003580:	02059593          	slli	a1,a1,0x20
    80003584:	0205d593          	srli	a1,a1,0x20
    80003588:	00bd85b3          	add	a1,s11,a1
    8000358c:	0005c583          	lbu	a1,0(a1)
    80003590:	02d7d7bb          	divuw	a5,a5,a3
    80003594:	f8b40323          	sb	a1,-122(s0)
    80003598:	3eeaf863          	bgeu	s5,a4,80003988 <__printf+0x5f0>
    8000359c:	02d7f5bb          	remuw	a1,a5,a3
    800035a0:	02059593          	slli	a1,a1,0x20
    800035a4:	0205d593          	srli	a1,a1,0x20
    800035a8:	00bd85b3          	add	a1,s11,a1
    800035ac:	0005c583          	lbu	a1,0(a1)
    800035b0:	02d7d7bb          	divuw	a5,a5,a3
    800035b4:	f8b403a3          	sb	a1,-121(s0)
    800035b8:	42eb7e63          	bgeu	s6,a4,800039f4 <__printf+0x65c>
    800035bc:	02d7f5bb          	remuw	a1,a5,a3
    800035c0:	02059593          	slli	a1,a1,0x20
    800035c4:	0205d593          	srli	a1,a1,0x20
    800035c8:	00bd85b3          	add	a1,s11,a1
    800035cc:	0005c583          	lbu	a1,0(a1)
    800035d0:	02d7d7bb          	divuw	a5,a5,a3
    800035d4:	f8b40423          	sb	a1,-120(s0)
    800035d8:	42ebfc63          	bgeu	s7,a4,80003a10 <__printf+0x678>
    800035dc:	02079793          	slli	a5,a5,0x20
    800035e0:	0207d793          	srli	a5,a5,0x20
    800035e4:	00fd8db3          	add	s11,s11,a5
    800035e8:	000dc703          	lbu	a4,0(s11)
    800035ec:	00a00793          	li	a5,10
    800035f0:	00900c93          	li	s9,9
    800035f4:	f8e404a3          	sb	a4,-119(s0)
    800035f8:	00065c63          	bgez	a2,80003610 <__printf+0x278>
    800035fc:	f9040713          	addi	a4,s0,-112
    80003600:	00f70733          	add	a4,a4,a5
    80003604:	02d00693          	li	a3,45
    80003608:	fed70823          	sb	a3,-16(a4)
    8000360c:	00078c93          	mv	s9,a5
    80003610:	f8040793          	addi	a5,s0,-128
    80003614:	01978cb3          	add	s9,a5,s9
    80003618:	f7f40d13          	addi	s10,s0,-129
    8000361c:	000cc503          	lbu	a0,0(s9)
    80003620:	fffc8c93          	addi	s9,s9,-1
    80003624:	00000097          	auipc	ra,0x0
    80003628:	b90080e7          	jalr	-1136(ra) # 800031b4 <consputc>
    8000362c:	ffac98e3          	bne	s9,s10,8000361c <__printf+0x284>
    80003630:	00094503          	lbu	a0,0(s2)
    80003634:	e00514e3          	bnez	a0,8000343c <__printf+0xa4>
    80003638:	1a0c1663          	bnez	s8,800037e4 <__printf+0x44c>
    8000363c:	08813083          	ld	ra,136(sp)
    80003640:	08013403          	ld	s0,128(sp)
    80003644:	07813483          	ld	s1,120(sp)
    80003648:	07013903          	ld	s2,112(sp)
    8000364c:	06813983          	ld	s3,104(sp)
    80003650:	06013a03          	ld	s4,96(sp)
    80003654:	05813a83          	ld	s5,88(sp)
    80003658:	05013b03          	ld	s6,80(sp)
    8000365c:	04813b83          	ld	s7,72(sp)
    80003660:	04013c03          	ld	s8,64(sp)
    80003664:	03813c83          	ld	s9,56(sp)
    80003668:	03013d03          	ld	s10,48(sp)
    8000366c:	02813d83          	ld	s11,40(sp)
    80003670:	0d010113          	addi	sp,sp,208
    80003674:	00008067          	ret
    80003678:	07300713          	li	a4,115
    8000367c:	1ce78a63          	beq	a5,a4,80003850 <__printf+0x4b8>
    80003680:	07800713          	li	a4,120
    80003684:	1ee79e63          	bne	a5,a4,80003880 <__printf+0x4e8>
    80003688:	f7843783          	ld	a5,-136(s0)
    8000368c:	0007a703          	lw	a4,0(a5)
    80003690:	00878793          	addi	a5,a5,8
    80003694:	f6f43c23          	sd	a5,-136(s0)
    80003698:	28074263          	bltz	a4,8000391c <__printf+0x584>
    8000369c:	00002d97          	auipc	s11,0x2
    800036a0:	d0cd8d93          	addi	s11,s11,-756 # 800053a8 <digits>
    800036a4:	00f77793          	andi	a5,a4,15
    800036a8:	00fd87b3          	add	a5,s11,a5
    800036ac:	0007c683          	lbu	a3,0(a5)
    800036b0:	00f00613          	li	a2,15
    800036b4:	0007079b          	sext.w	a5,a4
    800036b8:	f8d40023          	sb	a3,-128(s0)
    800036bc:	0047559b          	srliw	a1,a4,0x4
    800036c0:	0047569b          	srliw	a3,a4,0x4
    800036c4:	00000c93          	li	s9,0
    800036c8:	0ee65063          	bge	a2,a4,800037a8 <__printf+0x410>
    800036cc:	00f6f693          	andi	a3,a3,15
    800036d0:	00dd86b3          	add	a3,s11,a3
    800036d4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    800036d8:	0087d79b          	srliw	a5,a5,0x8
    800036dc:	00100c93          	li	s9,1
    800036e0:	f8d400a3          	sb	a3,-127(s0)
    800036e4:	0cb67263          	bgeu	a2,a1,800037a8 <__printf+0x410>
    800036e8:	00f7f693          	andi	a3,a5,15
    800036ec:	00dd86b3          	add	a3,s11,a3
    800036f0:	0006c583          	lbu	a1,0(a3)
    800036f4:	00f00613          	li	a2,15
    800036f8:	0047d69b          	srliw	a3,a5,0x4
    800036fc:	f8b40123          	sb	a1,-126(s0)
    80003700:	0047d593          	srli	a1,a5,0x4
    80003704:	28f67e63          	bgeu	a2,a5,800039a0 <__printf+0x608>
    80003708:	00f6f693          	andi	a3,a3,15
    8000370c:	00dd86b3          	add	a3,s11,a3
    80003710:	0006c503          	lbu	a0,0(a3)
    80003714:	0087d813          	srli	a6,a5,0x8
    80003718:	0087d69b          	srliw	a3,a5,0x8
    8000371c:	f8a401a3          	sb	a0,-125(s0)
    80003720:	28b67663          	bgeu	a2,a1,800039ac <__printf+0x614>
    80003724:	00f6f693          	andi	a3,a3,15
    80003728:	00dd86b3          	add	a3,s11,a3
    8000372c:	0006c583          	lbu	a1,0(a3)
    80003730:	00c7d513          	srli	a0,a5,0xc
    80003734:	00c7d69b          	srliw	a3,a5,0xc
    80003738:	f8b40223          	sb	a1,-124(s0)
    8000373c:	29067a63          	bgeu	a2,a6,800039d0 <__printf+0x638>
    80003740:	00f6f693          	andi	a3,a3,15
    80003744:	00dd86b3          	add	a3,s11,a3
    80003748:	0006c583          	lbu	a1,0(a3)
    8000374c:	0107d813          	srli	a6,a5,0x10
    80003750:	0107d69b          	srliw	a3,a5,0x10
    80003754:	f8b402a3          	sb	a1,-123(s0)
    80003758:	28a67263          	bgeu	a2,a0,800039dc <__printf+0x644>
    8000375c:	00f6f693          	andi	a3,a3,15
    80003760:	00dd86b3          	add	a3,s11,a3
    80003764:	0006c683          	lbu	a3,0(a3)
    80003768:	0147d79b          	srliw	a5,a5,0x14
    8000376c:	f8d40323          	sb	a3,-122(s0)
    80003770:	21067663          	bgeu	a2,a6,8000397c <__printf+0x5e4>
    80003774:	02079793          	slli	a5,a5,0x20
    80003778:	0207d793          	srli	a5,a5,0x20
    8000377c:	00fd8db3          	add	s11,s11,a5
    80003780:	000dc683          	lbu	a3,0(s11)
    80003784:	00800793          	li	a5,8
    80003788:	00700c93          	li	s9,7
    8000378c:	f8d403a3          	sb	a3,-121(s0)
    80003790:	00075c63          	bgez	a4,800037a8 <__printf+0x410>
    80003794:	f9040713          	addi	a4,s0,-112
    80003798:	00f70733          	add	a4,a4,a5
    8000379c:	02d00693          	li	a3,45
    800037a0:	fed70823          	sb	a3,-16(a4)
    800037a4:	00078c93          	mv	s9,a5
    800037a8:	f8040793          	addi	a5,s0,-128
    800037ac:	01978cb3          	add	s9,a5,s9
    800037b0:	f7f40d13          	addi	s10,s0,-129
    800037b4:	000cc503          	lbu	a0,0(s9)
    800037b8:	fffc8c93          	addi	s9,s9,-1
    800037bc:	00000097          	auipc	ra,0x0
    800037c0:	9f8080e7          	jalr	-1544(ra) # 800031b4 <consputc>
    800037c4:	ff9d18e3          	bne	s10,s9,800037b4 <__printf+0x41c>
    800037c8:	0100006f          	j	800037d8 <__printf+0x440>
    800037cc:	00000097          	auipc	ra,0x0
    800037d0:	9e8080e7          	jalr	-1560(ra) # 800031b4 <consputc>
    800037d4:	000c8493          	mv	s1,s9
    800037d8:	00094503          	lbu	a0,0(s2)
    800037dc:	c60510e3          	bnez	a0,8000343c <__printf+0xa4>
    800037e0:	e40c0ee3          	beqz	s8,8000363c <__printf+0x2a4>
    800037e4:	00004517          	auipc	a0,0x4
    800037e8:	a4c50513          	addi	a0,a0,-1460 # 80007230 <pr>
    800037ec:	00001097          	auipc	ra,0x1
    800037f0:	94c080e7          	jalr	-1716(ra) # 80004138 <release>
    800037f4:	e49ff06f          	j	8000363c <__printf+0x2a4>
    800037f8:	f7843783          	ld	a5,-136(s0)
    800037fc:	03000513          	li	a0,48
    80003800:	01000d13          	li	s10,16
    80003804:	00878713          	addi	a4,a5,8
    80003808:	0007bc83          	ld	s9,0(a5)
    8000380c:	f6e43c23          	sd	a4,-136(s0)
    80003810:	00000097          	auipc	ra,0x0
    80003814:	9a4080e7          	jalr	-1628(ra) # 800031b4 <consputc>
    80003818:	07800513          	li	a0,120
    8000381c:	00000097          	auipc	ra,0x0
    80003820:	998080e7          	jalr	-1640(ra) # 800031b4 <consputc>
    80003824:	00002d97          	auipc	s11,0x2
    80003828:	b84d8d93          	addi	s11,s11,-1148 # 800053a8 <digits>
    8000382c:	03ccd793          	srli	a5,s9,0x3c
    80003830:	00fd87b3          	add	a5,s11,a5
    80003834:	0007c503          	lbu	a0,0(a5)
    80003838:	fffd0d1b          	addiw	s10,s10,-1
    8000383c:	004c9c93          	slli	s9,s9,0x4
    80003840:	00000097          	auipc	ra,0x0
    80003844:	974080e7          	jalr	-1676(ra) # 800031b4 <consputc>
    80003848:	fe0d12e3          	bnez	s10,8000382c <__printf+0x494>
    8000384c:	f8dff06f          	j	800037d8 <__printf+0x440>
    80003850:	f7843783          	ld	a5,-136(s0)
    80003854:	0007bc83          	ld	s9,0(a5)
    80003858:	00878793          	addi	a5,a5,8
    8000385c:	f6f43c23          	sd	a5,-136(s0)
    80003860:	000c9a63          	bnez	s9,80003874 <__printf+0x4dc>
    80003864:	1080006f          	j	8000396c <__printf+0x5d4>
    80003868:	001c8c93          	addi	s9,s9,1
    8000386c:	00000097          	auipc	ra,0x0
    80003870:	948080e7          	jalr	-1720(ra) # 800031b4 <consputc>
    80003874:	000cc503          	lbu	a0,0(s9)
    80003878:	fe0518e3          	bnez	a0,80003868 <__printf+0x4d0>
    8000387c:	f5dff06f          	j	800037d8 <__printf+0x440>
    80003880:	02500513          	li	a0,37
    80003884:	00000097          	auipc	ra,0x0
    80003888:	930080e7          	jalr	-1744(ra) # 800031b4 <consputc>
    8000388c:	000c8513          	mv	a0,s9
    80003890:	00000097          	auipc	ra,0x0
    80003894:	924080e7          	jalr	-1756(ra) # 800031b4 <consputc>
    80003898:	f41ff06f          	j	800037d8 <__printf+0x440>
    8000389c:	02500513          	li	a0,37
    800038a0:	00000097          	auipc	ra,0x0
    800038a4:	914080e7          	jalr	-1772(ra) # 800031b4 <consputc>
    800038a8:	f31ff06f          	j	800037d8 <__printf+0x440>
    800038ac:	00030513          	mv	a0,t1
    800038b0:	00000097          	auipc	ra,0x0
    800038b4:	7bc080e7          	jalr	1980(ra) # 8000406c <acquire>
    800038b8:	b4dff06f          	j	80003404 <__printf+0x6c>
    800038bc:	40c0053b          	negw	a0,a2
    800038c0:	00a00713          	li	a4,10
    800038c4:	02e576bb          	remuw	a3,a0,a4
    800038c8:	00002d97          	auipc	s11,0x2
    800038cc:	ae0d8d93          	addi	s11,s11,-1312 # 800053a8 <digits>
    800038d0:	ff700593          	li	a1,-9
    800038d4:	02069693          	slli	a3,a3,0x20
    800038d8:	0206d693          	srli	a3,a3,0x20
    800038dc:	00dd86b3          	add	a3,s11,a3
    800038e0:	0006c683          	lbu	a3,0(a3)
    800038e4:	02e557bb          	divuw	a5,a0,a4
    800038e8:	f8d40023          	sb	a3,-128(s0)
    800038ec:	10b65e63          	bge	a2,a1,80003a08 <__printf+0x670>
    800038f0:	06300593          	li	a1,99
    800038f4:	02e7f6bb          	remuw	a3,a5,a4
    800038f8:	02069693          	slli	a3,a3,0x20
    800038fc:	0206d693          	srli	a3,a3,0x20
    80003900:	00dd86b3          	add	a3,s11,a3
    80003904:	0006c683          	lbu	a3,0(a3)
    80003908:	02e7d73b          	divuw	a4,a5,a4
    8000390c:	00200793          	li	a5,2
    80003910:	f8d400a3          	sb	a3,-127(s0)
    80003914:	bca5ece3          	bltu	a1,a0,800034ec <__printf+0x154>
    80003918:	ce5ff06f          	j	800035fc <__printf+0x264>
    8000391c:	40e007bb          	negw	a5,a4
    80003920:	00002d97          	auipc	s11,0x2
    80003924:	a88d8d93          	addi	s11,s11,-1400 # 800053a8 <digits>
    80003928:	00f7f693          	andi	a3,a5,15
    8000392c:	00dd86b3          	add	a3,s11,a3
    80003930:	0006c583          	lbu	a1,0(a3)
    80003934:	ff100613          	li	a2,-15
    80003938:	0047d69b          	srliw	a3,a5,0x4
    8000393c:	f8b40023          	sb	a1,-128(s0)
    80003940:	0047d59b          	srliw	a1,a5,0x4
    80003944:	0ac75e63          	bge	a4,a2,80003a00 <__printf+0x668>
    80003948:	00f6f693          	andi	a3,a3,15
    8000394c:	00dd86b3          	add	a3,s11,a3
    80003950:	0006c603          	lbu	a2,0(a3)
    80003954:	00f00693          	li	a3,15
    80003958:	0087d79b          	srliw	a5,a5,0x8
    8000395c:	f8c400a3          	sb	a2,-127(s0)
    80003960:	d8b6e4e3          	bltu	a3,a1,800036e8 <__printf+0x350>
    80003964:	00200793          	li	a5,2
    80003968:	e2dff06f          	j	80003794 <__printf+0x3fc>
    8000396c:	00002c97          	auipc	s9,0x2
    80003970:	a1cc8c93          	addi	s9,s9,-1508 # 80005388 <CONSOLE_STATUS+0x378>
    80003974:	02800513          	li	a0,40
    80003978:	ef1ff06f          	j	80003868 <__printf+0x4d0>
    8000397c:	00700793          	li	a5,7
    80003980:	00600c93          	li	s9,6
    80003984:	e0dff06f          	j	80003790 <__printf+0x3f8>
    80003988:	00700793          	li	a5,7
    8000398c:	00600c93          	li	s9,6
    80003990:	c69ff06f          	j	800035f8 <__printf+0x260>
    80003994:	00300793          	li	a5,3
    80003998:	00200c93          	li	s9,2
    8000399c:	c5dff06f          	j	800035f8 <__printf+0x260>
    800039a0:	00300793          	li	a5,3
    800039a4:	00200c93          	li	s9,2
    800039a8:	de9ff06f          	j	80003790 <__printf+0x3f8>
    800039ac:	00400793          	li	a5,4
    800039b0:	00300c93          	li	s9,3
    800039b4:	dddff06f          	j	80003790 <__printf+0x3f8>
    800039b8:	00400793          	li	a5,4
    800039bc:	00300c93          	li	s9,3
    800039c0:	c39ff06f          	j	800035f8 <__printf+0x260>
    800039c4:	00500793          	li	a5,5
    800039c8:	00400c93          	li	s9,4
    800039cc:	c2dff06f          	j	800035f8 <__printf+0x260>
    800039d0:	00500793          	li	a5,5
    800039d4:	00400c93          	li	s9,4
    800039d8:	db9ff06f          	j	80003790 <__printf+0x3f8>
    800039dc:	00600793          	li	a5,6
    800039e0:	00500c93          	li	s9,5
    800039e4:	dadff06f          	j	80003790 <__printf+0x3f8>
    800039e8:	00600793          	li	a5,6
    800039ec:	00500c93          	li	s9,5
    800039f0:	c09ff06f          	j	800035f8 <__printf+0x260>
    800039f4:	00800793          	li	a5,8
    800039f8:	00700c93          	li	s9,7
    800039fc:	bfdff06f          	j	800035f8 <__printf+0x260>
    80003a00:	00100793          	li	a5,1
    80003a04:	d91ff06f          	j	80003794 <__printf+0x3fc>
    80003a08:	00100793          	li	a5,1
    80003a0c:	bf1ff06f          	j	800035fc <__printf+0x264>
    80003a10:	00900793          	li	a5,9
    80003a14:	00800c93          	li	s9,8
    80003a18:	be1ff06f          	j	800035f8 <__printf+0x260>
    80003a1c:	00002517          	auipc	a0,0x2
    80003a20:	97450513          	addi	a0,a0,-1676 # 80005390 <CONSOLE_STATUS+0x380>
    80003a24:	00000097          	auipc	ra,0x0
    80003a28:	918080e7          	jalr	-1768(ra) # 8000333c <panic>

0000000080003a2c <printfinit>:
    80003a2c:	fe010113          	addi	sp,sp,-32
    80003a30:	00813823          	sd	s0,16(sp)
    80003a34:	00913423          	sd	s1,8(sp)
    80003a38:	00113c23          	sd	ra,24(sp)
    80003a3c:	02010413          	addi	s0,sp,32
    80003a40:	00003497          	auipc	s1,0x3
    80003a44:	7f048493          	addi	s1,s1,2032 # 80007230 <pr>
    80003a48:	00048513          	mv	a0,s1
    80003a4c:	00002597          	auipc	a1,0x2
    80003a50:	95458593          	addi	a1,a1,-1708 # 800053a0 <CONSOLE_STATUS+0x390>
    80003a54:	00000097          	auipc	ra,0x0
    80003a58:	5f4080e7          	jalr	1524(ra) # 80004048 <initlock>
    80003a5c:	01813083          	ld	ra,24(sp)
    80003a60:	01013403          	ld	s0,16(sp)
    80003a64:	0004ac23          	sw	zero,24(s1)
    80003a68:	00813483          	ld	s1,8(sp)
    80003a6c:	02010113          	addi	sp,sp,32
    80003a70:	00008067          	ret

0000000080003a74 <uartinit>:
    80003a74:	ff010113          	addi	sp,sp,-16
    80003a78:	00813423          	sd	s0,8(sp)
    80003a7c:	01010413          	addi	s0,sp,16
    80003a80:	100007b7          	lui	a5,0x10000
    80003a84:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80003a88:	f8000713          	li	a4,-128
    80003a8c:	00e781a3          	sb	a4,3(a5)
    80003a90:	00300713          	li	a4,3
    80003a94:	00e78023          	sb	a4,0(a5)
    80003a98:	000780a3          	sb	zero,1(a5)
    80003a9c:	00e781a3          	sb	a4,3(a5)
    80003aa0:	00700693          	li	a3,7
    80003aa4:	00d78123          	sb	a3,2(a5)
    80003aa8:	00e780a3          	sb	a4,1(a5)
    80003aac:	00813403          	ld	s0,8(sp)
    80003ab0:	01010113          	addi	sp,sp,16
    80003ab4:	00008067          	ret

0000000080003ab8 <uartputc>:
    80003ab8:	00002797          	auipc	a5,0x2
    80003abc:	4f07a783          	lw	a5,1264(a5) # 80005fa8 <panicked>
    80003ac0:	00078463          	beqz	a5,80003ac8 <uartputc+0x10>
    80003ac4:	0000006f          	j	80003ac4 <uartputc+0xc>
    80003ac8:	fd010113          	addi	sp,sp,-48
    80003acc:	02813023          	sd	s0,32(sp)
    80003ad0:	00913c23          	sd	s1,24(sp)
    80003ad4:	01213823          	sd	s2,16(sp)
    80003ad8:	01313423          	sd	s3,8(sp)
    80003adc:	02113423          	sd	ra,40(sp)
    80003ae0:	03010413          	addi	s0,sp,48
    80003ae4:	00002917          	auipc	s2,0x2
    80003ae8:	4cc90913          	addi	s2,s2,1228 # 80005fb0 <uart_tx_r>
    80003aec:	00093783          	ld	a5,0(s2)
    80003af0:	00002497          	auipc	s1,0x2
    80003af4:	4c848493          	addi	s1,s1,1224 # 80005fb8 <uart_tx_w>
    80003af8:	0004b703          	ld	a4,0(s1)
    80003afc:	02078693          	addi	a3,a5,32
    80003b00:	00050993          	mv	s3,a0
    80003b04:	02e69c63          	bne	a3,a4,80003b3c <uartputc+0x84>
    80003b08:	00001097          	auipc	ra,0x1
    80003b0c:	834080e7          	jalr	-1996(ra) # 8000433c <push_on>
    80003b10:	00093783          	ld	a5,0(s2)
    80003b14:	0004b703          	ld	a4,0(s1)
    80003b18:	02078793          	addi	a5,a5,32
    80003b1c:	00e79463          	bne	a5,a4,80003b24 <uartputc+0x6c>
    80003b20:	0000006f          	j	80003b20 <uartputc+0x68>
    80003b24:	00001097          	auipc	ra,0x1
    80003b28:	88c080e7          	jalr	-1908(ra) # 800043b0 <pop_on>
    80003b2c:	00093783          	ld	a5,0(s2)
    80003b30:	0004b703          	ld	a4,0(s1)
    80003b34:	02078693          	addi	a3,a5,32
    80003b38:	fce688e3          	beq	a3,a4,80003b08 <uartputc+0x50>
    80003b3c:	01f77693          	andi	a3,a4,31
    80003b40:	00003597          	auipc	a1,0x3
    80003b44:	71058593          	addi	a1,a1,1808 # 80007250 <uart_tx_buf>
    80003b48:	00d586b3          	add	a3,a1,a3
    80003b4c:	00170713          	addi	a4,a4,1
    80003b50:	01368023          	sb	s3,0(a3)
    80003b54:	00e4b023          	sd	a4,0(s1)
    80003b58:	10000637          	lui	a2,0x10000
    80003b5c:	02f71063          	bne	a4,a5,80003b7c <uartputc+0xc4>
    80003b60:	0340006f          	j	80003b94 <uartputc+0xdc>
    80003b64:	00074703          	lbu	a4,0(a4)
    80003b68:	00f93023          	sd	a5,0(s2)
    80003b6c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80003b70:	00093783          	ld	a5,0(s2)
    80003b74:	0004b703          	ld	a4,0(s1)
    80003b78:	00f70e63          	beq	a4,a5,80003b94 <uartputc+0xdc>
    80003b7c:	00564683          	lbu	a3,5(a2)
    80003b80:	01f7f713          	andi	a4,a5,31
    80003b84:	00e58733          	add	a4,a1,a4
    80003b88:	0206f693          	andi	a3,a3,32
    80003b8c:	00178793          	addi	a5,a5,1
    80003b90:	fc069ae3          	bnez	a3,80003b64 <uartputc+0xac>
    80003b94:	02813083          	ld	ra,40(sp)
    80003b98:	02013403          	ld	s0,32(sp)
    80003b9c:	01813483          	ld	s1,24(sp)
    80003ba0:	01013903          	ld	s2,16(sp)
    80003ba4:	00813983          	ld	s3,8(sp)
    80003ba8:	03010113          	addi	sp,sp,48
    80003bac:	00008067          	ret

0000000080003bb0 <uartputc_sync>:
    80003bb0:	ff010113          	addi	sp,sp,-16
    80003bb4:	00813423          	sd	s0,8(sp)
    80003bb8:	01010413          	addi	s0,sp,16
    80003bbc:	00002717          	auipc	a4,0x2
    80003bc0:	3ec72703          	lw	a4,1004(a4) # 80005fa8 <panicked>
    80003bc4:	02071663          	bnez	a4,80003bf0 <uartputc_sync+0x40>
    80003bc8:	00050793          	mv	a5,a0
    80003bcc:	100006b7          	lui	a3,0x10000
    80003bd0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80003bd4:	02077713          	andi	a4,a4,32
    80003bd8:	fe070ce3          	beqz	a4,80003bd0 <uartputc_sync+0x20>
    80003bdc:	0ff7f793          	andi	a5,a5,255
    80003be0:	00f68023          	sb	a5,0(a3)
    80003be4:	00813403          	ld	s0,8(sp)
    80003be8:	01010113          	addi	sp,sp,16
    80003bec:	00008067          	ret
    80003bf0:	0000006f          	j	80003bf0 <uartputc_sync+0x40>

0000000080003bf4 <uartstart>:
    80003bf4:	ff010113          	addi	sp,sp,-16
    80003bf8:	00813423          	sd	s0,8(sp)
    80003bfc:	01010413          	addi	s0,sp,16
    80003c00:	00002617          	auipc	a2,0x2
    80003c04:	3b060613          	addi	a2,a2,944 # 80005fb0 <uart_tx_r>
    80003c08:	00002517          	auipc	a0,0x2
    80003c0c:	3b050513          	addi	a0,a0,944 # 80005fb8 <uart_tx_w>
    80003c10:	00063783          	ld	a5,0(a2)
    80003c14:	00053703          	ld	a4,0(a0)
    80003c18:	04f70263          	beq	a4,a5,80003c5c <uartstart+0x68>
    80003c1c:	100005b7          	lui	a1,0x10000
    80003c20:	00003817          	auipc	a6,0x3
    80003c24:	63080813          	addi	a6,a6,1584 # 80007250 <uart_tx_buf>
    80003c28:	01c0006f          	j	80003c44 <uartstart+0x50>
    80003c2c:	0006c703          	lbu	a4,0(a3)
    80003c30:	00f63023          	sd	a5,0(a2)
    80003c34:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80003c38:	00063783          	ld	a5,0(a2)
    80003c3c:	00053703          	ld	a4,0(a0)
    80003c40:	00f70e63          	beq	a4,a5,80003c5c <uartstart+0x68>
    80003c44:	01f7f713          	andi	a4,a5,31
    80003c48:	00e806b3          	add	a3,a6,a4
    80003c4c:	0055c703          	lbu	a4,5(a1)
    80003c50:	00178793          	addi	a5,a5,1
    80003c54:	02077713          	andi	a4,a4,32
    80003c58:	fc071ae3          	bnez	a4,80003c2c <uartstart+0x38>
    80003c5c:	00813403          	ld	s0,8(sp)
    80003c60:	01010113          	addi	sp,sp,16
    80003c64:	00008067          	ret

0000000080003c68 <uartgetc>:
    80003c68:	ff010113          	addi	sp,sp,-16
    80003c6c:	00813423          	sd	s0,8(sp)
    80003c70:	01010413          	addi	s0,sp,16
    80003c74:	10000737          	lui	a4,0x10000
    80003c78:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80003c7c:	0017f793          	andi	a5,a5,1
    80003c80:	00078c63          	beqz	a5,80003c98 <uartgetc+0x30>
    80003c84:	00074503          	lbu	a0,0(a4)
    80003c88:	0ff57513          	andi	a0,a0,255
    80003c8c:	00813403          	ld	s0,8(sp)
    80003c90:	01010113          	addi	sp,sp,16
    80003c94:	00008067          	ret
    80003c98:	fff00513          	li	a0,-1
    80003c9c:	ff1ff06f          	j	80003c8c <uartgetc+0x24>

0000000080003ca0 <uartintr>:
    80003ca0:	100007b7          	lui	a5,0x10000
    80003ca4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80003ca8:	0017f793          	andi	a5,a5,1
    80003cac:	0a078463          	beqz	a5,80003d54 <uartintr+0xb4>
    80003cb0:	fe010113          	addi	sp,sp,-32
    80003cb4:	00813823          	sd	s0,16(sp)
    80003cb8:	00913423          	sd	s1,8(sp)
    80003cbc:	00113c23          	sd	ra,24(sp)
    80003cc0:	02010413          	addi	s0,sp,32
    80003cc4:	100004b7          	lui	s1,0x10000
    80003cc8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    80003ccc:	0ff57513          	andi	a0,a0,255
    80003cd0:	fffff097          	auipc	ra,0xfffff
    80003cd4:	534080e7          	jalr	1332(ra) # 80003204 <consoleintr>
    80003cd8:	0054c783          	lbu	a5,5(s1)
    80003cdc:	0017f793          	andi	a5,a5,1
    80003ce0:	fe0794e3          	bnez	a5,80003cc8 <uartintr+0x28>
    80003ce4:	00002617          	auipc	a2,0x2
    80003ce8:	2cc60613          	addi	a2,a2,716 # 80005fb0 <uart_tx_r>
    80003cec:	00002517          	auipc	a0,0x2
    80003cf0:	2cc50513          	addi	a0,a0,716 # 80005fb8 <uart_tx_w>
    80003cf4:	00063783          	ld	a5,0(a2)
    80003cf8:	00053703          	ld	a4,0(a0)
    80003cfc:	04f70263          	beq	a4,a5,80003d40 <uartintr+0xa0>
    80003d00:	100005b7          	lui	a1,0x10000
    80003d04:	00003817          	auipc	a6,0x3
    80003d08:	54c80813          	addi	a6,a6,1356 # 80007250 <uart_tx_buf>
    80003d0c:	01c0006f          	j	80003d28 <uartintr+0x88>
    80003d10:	0006c703          	lbu	a4,0(a3)
    80003d14:	00f63023          	sd	a5,0(a2)
    80003d18:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80003d1c:	00063783          	ld	a5,0(a2)
    80003d20:	00053703          	ld	a4,0(a0)
    80003d24:	00f70e63          	beq	a4,a5,80003d40 <uartintr+0xa0>
    80003d28:	01f7f713          	andi	a4,a5,31
    80003d2c:	00e806b3          	add	a3,a6,a4
    80003d30:	0055c703          	lbu	a4,5(a1)
    80003d34:	00178793          	addi	a5,a5,1
    80003d38:	02077713          	andi	a4,a4,32
    80003d3c:	fc071ae3          	bnez	a4,80003d10 <uartintr+0x70>
    80003d40:	01813083          	ld	ra,24(sp)
    80003d44:	01013403          	ld	s0,16(sp)
    80003d48:	00813483          	ld	s1,8(sp)
    80003d4c:	02010113          	addi	sp,sp,32
    80003d50:	00008067          	ret
    80003d54:	00002617          	auipc	a2,0x2
    80003d58:	25c60613          	addi	a2,a2,604 # 80005fb0 <uart_tx_r>
    80003d5c:	00002517          	auipc	a0,0x2
    80003d60:	25c50513          	addi	a0,a0,604 # 80005fb8 <uart_tx_w>
    80003d64:	00063783          	ld	a5,0(a2)
    80003d68:	00053703          	ld	a4,0(a0)
    80003d6c:	04f70263          	beq	a4,a5,80003db0 <uartintr+0x110>
    80003d70:	100005b7          	lui	a1,0x10000
    80003d74:	00003817          	auipc	a6,0x3
    80003d78:	4dc80813          	addi	a6,a6,1244 # 80007250 <uart_tx_buf>
    80003d7c:	01c0006f          	j	80003d98 <uartintr+0xf8>
    80003d80:	0006c703          	lbu	a4,0(a3)
    80003d84:	00f63023          	sd	a5,0(a2)
    80003d88:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80003d8c:	00063783          	ld	a5,0(a2)
    80003d90:	00053703          	ld	a4,0(a0)
    80003d94:	02f70063          	beq	a4,a5,80003db4 <uartintr+0x114>
    80003d98:	01f7f713          	andi	a4,a5,31
    80003d9c:	00e806b3          	add	a3,a6,a4
    80003da0:	0055c703          	lbu	a4,5(a1)
    80003da4:	00178793          	addi	a5,a5,1
    80003da8:	02077713          	andi	a4,a4,32
    80003dac:	fc071ae3          	bnez	a4,80003d80 <uartintr+0xe0>
    80003db0:	00008067          	ret
    80003db4:	00008067          	ret

0000000080003db8 <kinit>:
    80003db8:	fc010113          	addi	sp,sp,-64
    80003dbc:	02913423          	sd	s1,40(sp)
    80003dc0:	fffff7b7          	lui	a5,0xfffff
    80003dc4:	00004497          	auipc	s1,0x4
    80003dc8:	4ab48493          	addi	s1,s1,1195 # 8000826f <end+0xfff>
    80003dcc:	02813823          	sd	s0,48(sp)
    80003dd0:	01313c23          	sd	s3,24(sp)
    80003dd4:	00f4f4b3          	and	s1,s1,a5
    80003dd8:	02113c23          	sd	ra,56(sp)
    80003ddc:	03213023          	sd	s2,32(sp)
    80003de0:	01413823          	sd	s4,16(sp)
    80003de4:	01513423          	sd	s5,8(sp)
    80003de8:	04010413          	addi	s0,sp,64
    80003dec:	000017b7          	lui	a5,0x1
    80003df0:	01100993          	li	s3,17
    80003df4:	00f487b3          	add	a5,s1,a5
    80003df8:	01b99993          	slli	s3,s3,0x1b
    80003dfc:	06f9e063          	bltu	s3,a5,80003e5c <kinit+0xa4>
    80003e00:	00003a97          	auipc	s5,0x3
    80003e04:	470a8a93          	addi	s5,s5,1136 # 80007270 <end>
    80003e08:	0754ec63          	bltu	s1,s5,80003e80 <kinit+0xc8>
    80003e0c:	0734fa63          	bgeu	s1,s3,80003e80 <kinit+0xc8>
    80003e10:	00088a37          	lui	s4,0x88
    80003e14:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80003e18:	00002917          	auipc	s2,0x2
    80003e1c:	1a890913          	addi	s2,s2,424 # 80005fc0 <kmem>
    80003e20:	00ca1a13          	slli	s4,s4,0xc
    80003e24:	0140006f          	j	80003e38 <kinit+0x80>
    80003e28:	000017b7          	lui	a5,0x1
    80003e2c:	00f484b3          	add	s1,s1,a5
    80003e30:	0554e863          	bltu	s1,s5,80003e80 <kinit+0xc8>
    80003e34:	0534f663          	bgeu	s1,s3,80003e80 <kinit+0xc8>
    80003e38:	00001637          	lui	a2,0x1
    80003e3c:	00100593          	li	a1,1
    80003e40:	00048513          	mv	a0,s1
    80003e44:	00000097          	auipc	ra,0x0
    80003e48:	5e4080e7          	jalr	1508(ra) # 80004428 <__memset>
    80003e4c:	00093783          	ld	a5,0(s2)
    80003e50:	00f4b023          	sd	a5,0(s1)
    80003e54:	00993023          	sd	s1,0(s2)
    80003e58:	fd4498e3          	bne	s1,s4,80003e28 <kinit+0x70>
    80003e5c:	03813083          	ld	ra,56(sp)
    80003e60:	03013403          	ld	s0,48(sp)
    80003e64:	02813483          	ld	s1,40(sp)
    80003e68:	02013903          	ld	s2,32(sp)
    80003e6c:	01813983          	ld	s3,24(sp)
    80003e70:	01013a03          	ld	s4,16(sp)
    80003e74:	00813a83          	ld	s5,8(sp)
    80003e78:	04010113          	addi	sp,sp,64
    80003e7c:	00008067          	ret
    80003e80:	00001517          	auipc	a0,0x1
    80003e84:	54050513          	addi	a0,a0,1344 # 800053c0 <digits+0x18>
    80003e88:	fffff097          	auipc	ra,0xfffff
    80003e8c:	4b4080e7          	jalr	1204(ra) # 8000333c <panic>

0000000080003e90 <freerange>:
    80003e90:	fc010113          	addi	sp,sp,-64
    80003e94:	000017b7          	lui	a5,0x1
    80003e98:	02913423          	sd	s1,40(sp)
    80003e9c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80003ea0:	009504b3          	add	s1,a0,s1
    80003ea4:	fffff537          	lui	a0,0xfffff
    80003ea8:	02813823          	sd	s0,48(sp)
    80003eac:	02113c23          	sd	ra,56(sp)
    80003eb0:	03213023          	sd	s2,32(sp)
    80003eb4:	01313c23          	sd	s3,24(sp)
    80003eb8:	01413823          	sd	s4,16(sp)
    80003ebc:	01513423          	sd	s5,8(sp)
    80003ec0:	01613023          	sd	s6,0(sp)
    80003ec4:	04010413          	addi	s0,sp,64
    80003ec8:	00a4f4b3          	and	s1,s1,a0
    80003ecc:	00f487b3          	add	a5,s1,a5
    80003ed0:	06f5e463          	bltu	a1,a5,80003f38 <freerange+0xa8>
    80003ed4:	00003a97          	auipc	s5,0x3
    80003ed8:	39ca8a93          	addi	s5,s5,924 # 80007270 <end>
    80003edc:	0954e263          	bltu	s1,s5,80003f60 <freerange+0xd0>
    80003ee0:	01100993          	li	s3,17
    80003ee4:	01b99993          	slli	s3,s3,0x1b
    80003ee8:	0734fc63          	bgeu	s1,s3,80003f60 <freerange+0xd0>
    80003eec:	00058a13          	mv	s4,a1
    80003ef0:	00002917          	auipc	s2,0x2
    80003ef4:	0d090913          	addi	s2,s2,208 # 80005fc0 <kmem>
    80003ef8:	00002b37          	lui	s6,0x2
    80003efc:	0140006f          	j	80003f10 <freerange+0x80>
    80003f00:	000017b7          	lui	a5,0x1
    80003f04:	00f484b3          	add	s1,s1,a5
    80003f08:	0554ec63          	bltu	s1,s5,80003f60 <freerange+0xd0>
    80003f0c:	0534fa63          	bgeu	s1,s3,80003f60 <freerange+0xd0>
    80003f10:	00001637          	lui	a2,0x1
    80003f14:	00100593          	li	a1,1
    80003f18:	00048513          	mv	a0,s1
    80003f1c:	00000097          	auipc	ra,0x0
    80003f20:	50c080e7          	jalr	1292(ra) # 80004428 <__memset>
    80003f24:	00093703          	ld	a4,0(s2)
    80003f28:	016487b3          	add	a5,s1,s6
    80003f2c:	00e4b023          	sd	a4,0(s1)
    80003f30:	00993023          	sd	s1,0(s2)
    80003f34:	fcfa76e3          	bgeu	s4,a5,80003f00 <freerange+0x70>
    80003f38:	03813083          	ld	ra,56(sp)
    80003f3c:	03013403          	ld	s0,48(sp)
    80003f40:	02813483          	ld	s1,40(sp)
    80003f44:	02013903          	ld	s2,32(sp)
    80003f48:	01813983          	ld	s3,24(sp)
    80003f4c:	01013a03          	ld	s4,16(sp)
    80003f50:	00813a83          	ld	s5,8(sp)
    80003f54:	00013b03          	ld	s6,0(sp)
    80003f58:	04010113          	addi	sp,sp,64
    80003f5c:	00008067          	ret
    80003f60:	00001517          	auipc	a0,0x1
    80003f64:	46050513          	addi	a0,a0,1120 # 800053c0 <digits+0x18>
    80003f68:	fffff097          	auipc	ra,0xfffff
    80003f6c:	3d4080e7          	jalr	980(ra) # 8000333c <panic>

0000000080003f70 <kfree>:
    80003f70:	fe010113          	addi	sp,sp,-32
    80003f74:	00813823          	sd	s0,16(sp)
    80003f78:	00113c23          	sd	ra,24(sp)
    80003f7c:	00913423          	sd	s1,8(sp)
    80003f80:	02010413          	addi	s0,sp,32
    80003f84:	03451793          	slli	a5,a0,0x34
    80003f88:	04079c63          	bnez	a5,80003fe0 <kfree+0x70>
    80003f8c:	00003797          	auipc	a5,0x3
    80003f90:	2e478793          	addi	a5,a5,740 # 80007270 <end>
    80003f94:	00050493          	mv	s1,a0
    80003f98:	04f56463          	bltu	a0,a5,80003fe0 <kfree+0x70>
    80003f9c:	01100793          	li	a5,17
    80003fa0:	01b79793          	slli	a5,a5,0x1b
    80003fa4:	02f57e63          	bgeu	a0,a5,80003fe0 <kfree+0x70>
    80003fa8:	00001637          	lui	a2,0x1
    80003fac:	00100593          	li	a1,1
    80003fb0:	00000097          	auipc	ra,0x0
    80003fb4:	478080e7          	jalr	1144(ra) # 80004428 <__memset>
    80003fb8:	00002797          	auipc	a5,0x2
    80003fbc:	00878793          	addi	a5,a5,8 # 80005fc0 <kmem>
    80003fc0:	0007b703          	ld	a4,0(a5)
    80003fc4:	01813083          	ld	ra,24(sp)
    80003fc8:	01013403          	ld	s0,16(sp)
    80003fcc:	00e4b023          	sd	a4,0(s1)
    80003fd0:	0097b023          	sd	s1,0(a5)
    80003fd4:	00813483          	ld	s1,8(sp)
    80003fd8:	02010113          	addi	sp,sp,32
    80003fdc:	00008067          	ret
    80003fe0:	00001517          	auipc	a0,0x1
    80003fe4:	3e050513          	addi	a0,a0,992 # 800053c0 <digits+0x18>
    80003fe8:	fffff097          	auipc	ra,0xfffff
    80003fec:	354080e7          	jalr	852(ra) # 8000333c <panic>

0000000080003ff0 <kalloc>:
    80003ff0:	fe010113          	addi	sp,sp,-32
    80003ff4:	00813823          	sd	s0,16(sp)
    80003ff8:	00913423          	sd	s1,8(sp)
    80003ffc:	00113c23          	sd	ra,24(sp)
    80004000:	02010413          	addi	s0,sp,32
    80004004:	00002797          	auipc	a5,0x2
    80004008:	fbc78793          	addi	a5,a5,-68 # 80005fc0 <kmem>
    8000400c:	0007b483          	ld	s1,0(a5)
    80004010:	02048063          	beqz	s1,80004030 <kalloc+0x40>
    80004014:	0004b703          	ld	a4,0(s1)
    80004018:	00001637          	lui	a2,0x1
    8000401c:	00500593          	li	a1,5
    80004020:	00048513          	mv	a0,s1
    80004024:	00e7b023          	sd	a4,0(a5)
    80004028:	00000097          	auipc	ra,0x0
    8000402c:	400080e7          	jalr	1024(ra) # 80004428 <__memset>
    80004030:	01813083          	ld	ra,24(sp)
    80004034:	01013403          	ld	s0,16(sp)
    80004038:	00048513          	mv	a0,s1
    8000403c:	00813483          	ld	s1,8(sp)
    80004040:	02010113          	addi	sp,sp,32
    80004044:	00008067          	ret

0000000080004048 <initlock>:
    80004048:	ff010113          	addi	sp,sp,-16
    8000404c:	00813423          	sd	s0,8(sp)
    80004050:	01010413          	addi	s0,sp,16
    80004054:	00813403          	ld	s0,8(sp)
    80004058:	00b53423          	sd	a1,8(a0)
    8000405c:	00052023          	sw	zero,0(a0)
    80004060:	00053823          	sd	zero,16(a0)
    80004064:	01010113          	addi	sp,sp,16
    80004068:	00008067          	ret

000000008000406c <acquire>:
    8000406c:	fe010113          	addi	sp,sp,-32
    80004070:	00813823          	sd	s0,16(sp)
    80004074:	00913423          	sd	s1,8(sp)
    80004078:	00113c23          	sd	ra,24(sp)
    8000407c:	01213023          	sd	s2,0(sp)
    80004080:	02010413          	addi	s0,sp,32
    80004084:	00050493          	mv	s1,a0
    80004088:	10002973          	csrr	s2,sstatus
    8000408c:	100027f3          	csrr	a5,sstatus
    80004090:	ffd7f793          	andi	a5,a5,-3
    80004094:	10079073          	csrw	sstatus,a5
    80004098:	fffff097          	auipc	ra,0xfffff
    8000409c:	8e4080e7          	jalr	-1820(ra) # 8000297c <mycpu>
    800040a0:	07852783          	lw	a5,120(a0)
    800040a4:	06078e63          	beqz	a5,80004120 <acquire+0xb4>
    800040a8:	fffff097          	auipc	ra,0xfffff
    800040ac:	8d4080e7          	jalr	-1836(ra) # 8000297c <mycpu>
    800040b0:	07852783          	lw	a5,120(a0)
    800040b4:	0004a703          	lw	a4,0(s1)
    800040b8:	0017879b          	addiw	a5,a5,1
    800040bc:	06f52c23          	sw	a5,120(a0)
    800040c0:	04071063          	bnez	a4,80004100 <acquire+0x94>
    800040c4:	00100713          	li	a4,1
    800040c8:	00070793          	mv	a5,a4
    800040cc:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    800040d0:	0007879b          	sext.w	a5,a5
    800040d4:	fe079ae3          	bnez	a5,800040c8 <acquire+0x5c>
    800040d8:	0ff0000f          	fence
    800040dc:	fffff097          	auipc	ra,0xfffff
    800040e0:	8a0080e7          	jalr	-1888(ra) # 8000297c <mycpu>
    800040e4:	01813083          	ld	ra,24(sp)
    800040e8:	01013403          	ld	s0,16(sp)
    800040ec:	00a4b823          	sd	a0,16(s1)
    800040f0:	00013903          	ld	s2,0(sp)
    800040f4:	00813483          	ld	s1,8(sp)
    800040f8:	02010113          	addi	sp,sp,32
    800040fc:	00008067          	ret
    80004100:	0104b903          	ld	s2,16(s1)
    80004104:	fffff097          	auipc	ra,0xfffff
    80004108:	878080e7          	jalr	-1928(ra) # 8000297c <mycpu>
    8000410c:	faa91ce3          	bne	s2,a0,800040c4 <acquire+0x58>
    80004110:	00001517          	auipc	a0,0x1
    80004114:	2b850513          	addi	a0,a0,696 # 800053c8 <digits+0x20>
    80004118:	fffff097          	auipc	ra,0xfffff
    8000411c:	224080e7          	jalr	548(ra) # 8000333c <panic>
    80004120:	00195913          	srli	s2,s2,0x1
    80004124:	fffff097          	auipc	ra,0xfffff
    80004128:	858080e7          	jalr	-1960(ra) # 8000297c <mycpu>
    8000412c:	00197913          	andi	s2,s2,1
    80004130:	07252e23          	sw	s2,124(a0)
    80004134:	f75ff06f          	j	800040a8 <acquire+0x3c>

0000000080004138 <release>:
    80004138:	fe010113          	addi	sp,sp,-32
    8000413c:	00813823          	sd	s0,16(sp)
    80004140:	00113c23          	sd	ra,24(sp)
    80004144:	00913423          	sd	s1,8(sp)
    80004148:	01213023          	sd	s2,0(sp)
    8000414c:	02010413          	addi	s0,sp,32
    80004150:	00052783          	lw	a5,0(a0)
    80004154:	00079a63          	bnez	a5,80004168 <release+0x30>
    80004158:	00001517          	auipc	a0,0x1
    8000415c:	27850513          	addi	a0,a0,632 # 800053d0 <digits+0x28>
    80004160:	fffff097          	auipc	ra,0xfffff
    80004164:	1dc080e7          	jalr	476(ra) # 8000333c <panic>
    80004168:	01053903          	ld	s2,16(a0)
    8000416c:	00050493          	mv	s1,a0
    80004170:	fffff097          	auipc	ra,0xfffff
    80004174:	80c080e7          	jalr	-2036(ra) # 8000297c <mycpu>
    80004178:	fea910e3          	bne	s2,a0,80004158 <release+0x20>
    8000417c:	0004b823          	sd	zero,16(s1)
    80004180:	0ff0000f          	fence
    80004184:	0f50000f          	fence	iorw,ow
    80004188:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000418c:	ffffe097          	auipc	ra,0xffffe
    80004190:	7f0080e7          	jalr	2032(ra) # 8000297c <mycpu>
    80004194:	100027f3          	csrr	a5,sstatus
    80004198:	0027f793          	andi	a5,a5,2
    8000419c:	04079a63          	bnez	a5,800041f0 <release+0xb8>
    800041a0:	07852783          	lw	a5,120(a0)
    800041a4:	02f05e63          	blez	a5,800041e0 <release+0xa8>
    800041a8:	fff7871b          	addiw	a4,a5,-1
    800041ac:	06e52c23          	sw	a4,120(a0)
    800041b0:	00071c63          	bnez	a4,800041c8 <release+0x90>
    800041b4:	07c52783          	lw	a5,124(a0)
    800041b8:	00078863          	beqz	a5,800041c8 <release+0x90>
    800041bc:	100027f3          	csrr	a5,sstatus
    800041c0:	0027e793          	ori	a5,a5,2
    800041c4:	10079073          	csrw	sstatus,a5
    800041c8:	01813083          	ld	ra,24(sp)
    800041cc:	01013403          	ld	s0,16(sp)
    800041d0:	00813483          	ld	s1,8(sp)
    800041d4:	00013903          	ld	s2,0(sp)
    800041d8:	02010113          	addi	sp,sp,32
    800041dc:	00008067          	ret
    800041e0:	00001517          	auipc	a0,0x1
    800041e4:	21050513          	addi	a0,a0,528 # 800053f0 <digits+0x48>
    800041e8:	fffff097          	auipc	ra,0xfffff
    800041ec:	154080e7          	jalr	340(ra) # 8000333c <panic>
    800041f0:	00001517          	auipc	a0,0x1
    800041f4:	1e850513          	addi	a0,a0,488 # 800053d8 <digits+0x30>
    800041f8:	fffff097          	auipc	ra,0xfffff
    800041fc:	144080e7          	jalr	324(ra) # 8000333c <panic>

0000000080004200 <holding>:
    80004200:	00052783          	lw	a5,0(a0)
    80004204:	00079663          	bnez	a5,80004210 <holding+0x10>
    80004208:	00000513          	li	a0,0
    8000420c:	00008067          	ret
    80004210:	fe010113          	addi	sp,sp,-32
    80004214:	00813823          	sd	s0,16(sp)
    80004218:	00913423          	sd	s1,8(sp)
    8000421c:	00113c23          	sd	ra,24(sp)
    80004220:	02010413          	addi	s0,sp,32
    80004224:	01053483          	ld	s1,16(a0)
    80004228:	ffffe097          	auipc	ra,0xffffe
    8000422c:	754080e7          	jalr	1876(ra) # 8000297c <mycpu>
    80004230:	01813083          	ld	ra,24(sp)
    80004234:	01013403          	ld	s0,16(sp)
    80004238:	40a48533          	sub	a0,s1,a0
    8000423c:	00153513          	seqz	a0,a0
    80004240:	00813483          	ld	s1,8(sp)
    80004244:	02010113          	addi	sp,sp,32
    80004248:	00008067          	ret

000000008000424c <push_off>:
    8000424c:	fe010113          	addi	sp,sp,-32
    80004250:	00813823          	sd	s0,16(sp)
    80004254:	00113c23          	sd	ra,24(sp)
    80004258:	00913423          	sd	s1,8(sp)
    8000425c:	02010413          	addi	s0,sp,32
    80004260:	100024f3          	csrr	s1,sstatus
    80004264:	100027f3          	csrr	a5,sstatus
    80004268:	ffd7f793          	andi	a5,a5,-3
    8000426c:	10079073          	csrw	sstatus,a5
    80004270:	ffffe097          	auipc	ra,0xffffe
    80004274:	70c080e7          	jalr	1804(ra) # 8000297c <mycpu>
    80004278:	07852783          	lw	a5,120(a0)
    8000427c:	02078663          	beqz	a5,800042a8 <push_off+0x5c>
    80004280:	ffffe097          	auipc	ra,0xffffe
    80004284:	6fc080e7          	jalr	1788(ra) # 8000297c <mycpu>
    80004288:	07852783          	lw	a5,120(a0)
    8000428c:	01813083          	ld	ra,24(sp)
    80004290:	01013403          	ld	s0,16(sp)
    80004294:	0017879b          	addiw	a5,a5,1
    80004298:	06f52c23          	sw	a5,120(a0)
    8000429c:	00813483          	ld	s1,8(sp)
    800042a0:	02010113          	addi	sp,sp,32
    800042a4:	00008067          	ret
    800042a8:	0014d493          	srli	s1,s1,0x1
    800042ac:	ffffe097          	auipc	ra,0xffffe
    800042b0:	6d0080e7          	jalr	1744(ra) # 8000297c <mycpu>
    800042b4:	0014f493          	andi	s1,s1,1
    800042b8:	06952e23          	sw	s1,124(a0)
    800042bc:	fc5ff06f          	j	80004280 <push_off+0x34>

00000000800042c0 <pop_off>:
    800042c0:	ff010113          	addi	sp,sp,-16
    800042c4:	00813023          	sd	s0,0(sp)
    800042c8:	00113423          	sd	ra,8(sp)
    800042cc:	01010413          	addi	s0,sp,16
    800042d0:	ffffe097          	auipc	ra,0xffffe
    800042d4:	6ac080e7          	jalr	1708(ra) # 8000297c <mycpu>
    800042d8:	100027f3          	csrr	a5,sstatus
    800042dc:	0027f793          	andi	a5,a5,2
    800042e0:	04079663          	bnez	a5,8000432c <pop_off+0x6c>
    800042e4:	07852783          	lw	a5,120(a0)
    800042e8:	02f05a63          	blez	a5,8000431c <pop_off+0x5c>
    800042ec:	fff7871b          	addiw	a4,a5,-1
    800042f0:	06e52c23          	sw	a4,120(a0)
    800042f4:	00071c63          	bnez	a4,8000430c <pop_off+0x4c>
    800042f8:	07c52783          	lw	a5,124(a0)
    800042fc:	00078863          	beqz	a5,8000430c <pop_off+0x4c>
    80004300:	100027f3          	csrr	a5,sstatus
    80004304:	0027e793          	ori	a5,a5,2
    80004308:	10079073          	csrw	sstatus,a5
    8000430c:	00813083          	ld	ra,8(sp)
    80004310:	00013403          	ld	s0,0(sp)
    80004314:	01010113          	addi	sp,sp,16
    80004318:	00008067          	ret
    8000431c:	00001517          	auipc	a0,0x1
    80004320:	0d450513          	addi	a0,a0,212 # 800053f0 <digits+0x48>
    80004324:	fffff097          	auipc	ra,0xfffff
    80004328:	018080e7          	jalr	24(ra) # 8000333c <panic>
    8000432c:	00001517          	auipc	a0,0x1
    80004330:	0ac50513          	addi	a0,a0,172 # 800053d8 <digits+0x30>
    80004334:	fffff097          	auipc	ra,0xfffff
    80004338:	008080e7          	jalr	8(ra) # 8000333c <panic>

000000008000433c <push_on>:
    8000433c:	fe010113          	addi	sp,sp,-32
    80004340:	00813823          	sd	s0,16(sp)
    80004344:	00113c23          	sd	ra,24(sp)
    80004348:	00913423          	sd	s1,8(sp)
    8000434c:	02010413          	addi	s0,sp,32
    80004350:	100024f3          	csrr	s1,sstatus
    80004354:	100027f3          	csrr	a5,sstatus
    80004358:	0027e793          	ori	a5,a5,2
    8000435c:	10079073          	csrw	sstatus,a5
    80004360:	ffffe097          	auipc	ra,0xffffe
    80004364:	61c080e7          	jalr	1564(ra) # 8000297c <mycpu>
    80004368:	07852783          	lw	a5,120(a0)
    8000436c:	02078663          	beqz	a5,80004398 <push_on+0x5c>
    80004370:	ffffe097          	auipc	ra,0xffffe
    80004374:	60c080e7          	jalr	1548(ra) # 8000297c <mycpu>
    80004378:	07852783          	lw	a5,120(a0)
    8000437c:	01813083          	ld	ra,24(sp)
    80004380:	01013403          	ld	s0,16(sp)
    80004384:	0017879b          	addiw	a5,a5,1
    80004388:	06f52c23          	sw	a5,120(a0)
    8000438c:	00813483          	ld	s1,8(sp)
    80004390:	02010113          	addi	sp,sp,32
    80004394:	00008067          	ret
    80004398:	0014d493          	srli	s1,s1,0x1
    8000439c:	ffffe097          	auipc	ra,0xffffe
    800043a0:	5e0080e7          	jalr	1504(ra) # 8000297c <mycpu>
    800043a4:	0014f493          	andi	s1,s1,1
    800043a8:	06952e23          	sw	s1,124(a0)
    800043ac:	fc5ff06f          	j	80004370 <push_on+0x34>

00000000800043b0 <pop_on>:
    800043b0:	ff010113          	addi	sp,sp,-16
    800043b4:	00813023          	sd	s0,0(sp)
    800043b8:	00113423          	sd	ra,8(sp)
    800043bc:	01010413          	addi	s0,sp,16
    800043c0:	ffffe097          	auipc	ra,0xffffe
    800043c4:	5bc080e7          	jalr	1468(ra) # 8000297c <mycpu>
    800043c8:	100027f3          	csrr	a5,sstatus
    800043cc:	0027f793          	andi	a5,a5,2
    800043d0:	04078463          	beqz	a5,80004418 <pop_on+0x68>
    800043d4:	07852783          	lw	a5,120(a0)
    800043d8:	02f05863          	blez	a5,80004408 <pop_on+0x58>
    800043dc:	fff7879b          	addiw	a5,a5,-1
    800043e0:	06f52c23          	sw	a5,120(a0)
    800043e4:	07853783          	ld	a5,120(a0)
    800043e8:	00079863          	bnez	a5,800043f8 <pop_on+0x48>
    800043ec:	100027f3          	csrr	a5,sstatus
    800043f0:	ffd7f793          	andi	a5,a5,-3
    800043f4:	10079073          	csrw	sstatus,a5
    800043f8:	00813083          	ld	ra,8(sp)
    800043fc:	00013403          	ld	s0,0(sp)
    80004400:	01010113          	addi	sp,sp,16
    80004404:	00008067          	ret
    80004408:	00001517          	auipc	a0,0x1
    8000440c:	01050513          	addi	a0,a0,16 # 80005418 <digits+0x70>
    80004410:	fffff097          	auipc	ra,0xfffff
    80004414:	f2c080e7          	jalr	-212(ra) # 8000333c <panic>
    80004418:	00001517          	auipc	a0,0x1
    8000441c:	fe050513          	addi	a0,a0,-32 # 800053f8 <digits+0x50>
    80004420:	fffff097          	auipc	ra,0xfffff
    80004424:	f1c080e7          	jalr	-228(ra) # 8000333c <panic>

0000000080004428 <__memset>:
    80004428:	ff010113          	addi	sp,sp,-16
    8000442c:	00813423          	sd	s0,8(sp)
    80004430:	01010413          	addi	s0,sp,16
    80004434:	1a060e63          	beqz	a2,800045f0 <__memset+0x1c8>
    80004438:	40a007b3          	neg	a5,a0
    8000443c:	0077f793          	andi	a5,a5,7
    80004440:	00778693          	addi	a3,a5,7
    80004444:	00b00813          	li	a6,11
    80004448:	0ff5f593          	andi	a1,a1,255
    8000444c:	fff6071b          	addiw	a4,a2,-1
    80004450:	1b06e663          	bltu	a3,a6,800045fc <__memset+0x1d4>
    80004454:	1cd76463          	bltu	a4,a3,8000461c <__memset+0x1f4>
    80004458:	1a078e63          	beqz	a5,80004614 <__memset+0x1ec>
    8000445c:	00b50023          	sb	a1,0(a0)
    80004460:	00100713          	li	a4,1
    80004464:	1ae78463          	beq	a5,a4,8000460c <__memset+0x1e4>
    80004468:	00b500a3          	sb	a1,1(a0)
    8000446c:	00200713          	li	a4,2
    80004470:	1ae78a63          	beq	a5,a4,80004624 <__memset+0x1fc>
    80004474:	00b50123          	sb	a1,2(a0)
    80004478:	00300713          	li	a4,3
    8000447c:	18e78463          	beq	a5,a4,80004604 <__memset+0x1dc>
    80004480:	00b501a3          	sb	a1,3(a0)
    80004484:	00400713          	li	a4,4
    80004488:	1ae78263          	beq	a5,a4,8000462c <__memset+0x204>
    8000448c:	00b50223          	sb	a1,4(a0)
    80004490:	00500713          	li	a4,5
    80004494:	1ae78063          	beq	a5,a4,80004634 <__memset+0x20c>
    80004498:	00b502a3          	sb	a1,5(a0)
    8000449c:	00700713          	li	a4,7
    800044a0:	18e79e63          	bne	a5,a4,8000463c <__memset+0x214>
    800044a4:	00b50323          	sb	a1,6(a0)
    800044a8:	00700e93          	li	t4,7
    800044ac:	00859713          	slli	a4,a1,0x8
    800044b0:	00e5e733          	or	a4,a1,a4
    800044b4:	01059e13          	slli	t3,a1,0x10
    800044b8:	01c76e33          	or	t3,a4,t3
    800044bc:	01859313          	slli	t1,a1,0x18
    800044c0:	006e6333          	or	t1,t3,t1
    800044c4:	02059893          	slli	a7,a1,0x20
    800044c8:	40f60e3b          	subw	t3,a2,a5
    800044cc:	011368b3          	or	a7,t1,a7
    800044d0:	02859813          	slli	a6,a1,0x28
    800044d4:	0108e833          	or	a6,a7,a6
    800044d8:	03059693          	slli	a3,a1,0x30
    800044dc:	003e589b          	srliw	a7,t3,0x3
    800044e0:	00d866b3          	or	a3,a6,a3
    800044e4:	03859713          	slli	a4,a1,0x38
    800044e8:	00389813          	slli	a6,a7,0x3
    800044ec:	00f507b3          	add	a5,a0,a5
    800044f0:	00e6e733          	or	a4,a3,a4
    800044f4:	000e089b          	sext.w	a7,t3
    800044f8:	00f806b3          	add	a3,a6,a5
    800044fc:	00e7b023          	sd	a4,0(a5)
    80004500:	00878793          	addi	a5,a5,8
    80004504:	fed79ce3          	bne	a5,a3,800044fc <__memset+0xd4>
    80004508:	ff8e7793          	andi	a5,t3,-8
    8000450c:	0007871b          	sext.w	a4,a5
    80004510:	01d787bb          	addw	a5,a5,t4
    80004514:	0ce88e63          	beq	a7,a4,800045f0 <__memset+0x1c8>
    80004518:	00f50733          	add	a4,a0,a5
    8000451c:	00b70023          	sb	a1,0(a4)
    80004520:	0017871b          	addiw	a4,a5,1
    80004524:	0cc77663          	bgeu	a4,a2,800045f0 <__memset+0x1c8>
    80004528:	00e50733          	add	a4,a0,a4
    8000452c:	00b70023          	sb	a1,0(a4)
    80004530:	0027871b          	addiw	a4,a5,2
    80004534:	0ac77e63          	bgeu	a4,a2,800045f0 <__memset+0x1c8>
    80004538:	00e50733          	add	a4,a0,a4
    8000453c:	00b70023          	sb	a1,0(a4)
    80004540:	0037871b          	addiw	a4,a5,3
    80004544:	0ac77663          	bgeu	a4,a2,800045f0 <__memset+0x1c8>
    80004548:	00e50733          	add	a4,a0,a4
    8000454c:	00b70023          	sb	a1,0(a4)
    80004550:	0047871b          	addiw	a4,a5,4
    80004554:	08c77e63          	bgeu	a4,a2,800045f0 <__memset+0x1c8>
    80004558:	00e50733          	add	a4,a0,a4
    8000455c:	00b70023          	sb	a1,0(a4)
    80004560:	0057871b          	addiw	a4,a5,5
    80004564:	08c77663          	bgeu	a4,a2,800045f0 <__memset+0x1c8>
    80004568:	00e50733          	add	a4,a0,a4
    8000456c:	00b70023          	sb	a1,0(a4)
    80004570:	0067871b          	addiw	a4,a5,6
    80004574:	06c77e63          	bgeu	a4,a2,800045f0 <__memset+0x1c8>
    80004578:	00e50733          	add	a4,a0,a4
    8000457c:	00b70023          	sb	a1,0(a4)
    80004580:	0077871b          	addiw	a4,a5,7
    80004584:	06c77663          	bgeu	a4,a2,800045f0 <__memset+0x1c8>
    80004588:	00e50733          	add	a4,a0,a4
    8000458c:	00b70023          	sb	a1,0(a4)
    80004590:	0087871b          	addiw	a4,a5,8
    80004594:	04c77e63          	bgeu	a4,a2,800045f0 <__memset+0x1c8>
    80004598:	00e50733          	add	a4,a0,a4
    8000459c:	00b70023          	sb	a1,0(a4)
    800045a0:	0097871b          	addiw	a4,a5,9
    800045a4:	04c77663          	bgeu	a4,a2,800045f0 <__memset+0x1c8>
    800045a8:	00e50733          	add	a4,a0,a4
    800045ac:	00b70023          	sb	a1,0(a4)
    800045b0:	00a7871b          	addiw	a4,a5,10
    800045b4:	02c77e63          	bgeu	a4,a2,800045f0 <__memset+0x1c8>
    800045b8:	00e50733          	add	a4,a0,a4
    800045bc:	00b70023          	sb	a1,0(a4)
    800045c0:	00b7871b          	addiw	a4,a5,11
    800045c4:	02c77663          	bgeu	a4,a2,800045f0 <__memset+0x1c8>
    800045c8:	00e50733          	add	a4,a0,a4
    800045cc:	00b70023          	sb	a1,0(a4)
    800045d0:	00c7871b          	addiw	a4,a5,12
    800045d4:	00c77e63          	bgeu	a4,a2,800045f0 <__memset+0x1c8>
    800045d8:	00e50733          	add	a4,a0,a4
    800045dc:	00b70023          	sb	a1,0(a4)
    800045e0:	00d7879b          	addiw	a5,a5,13
    800045e4:	00c7f663          	bgeu	a5,a2,800045f0 <__memset+0x1c8>
    800045e8:	00f507b3          	add	a5,a0,a5
    800045ec:	00b78023          	sb	a1,0(a5)
    800045f0:	00813403          	ld	s0,8(sp)
    800045f4:	01010113          	addi	sp,sp,16
    800045f8:	00008067          	ret
    800045fc:	00b00693          	li	a3,11
    80004600:	e55ff06f          	j	80004454 <__memset+0x2c>
    80004604:	00300e93          	li	t4,3
    80004608:	ea5ff06f          	j	800044ac <__memset+0x84>
    8000460c:	00100e93          	li	t4,1
    80004610:	e9dff06f          	j	800044ac <__memset+0x84>
    80004614:	00000e93          	li	t4,0
    80004618:	e95ff06f          	j	800044ac <__memset+0x84>
    8000461c:	00000793          	li	a5,0
    80004620:	ef9ff06f          	j	80004518 <__memset+0xf0>
    80004624:	00200e93          	li	t4,2
    80004628:	e85ff06f          	j	800044ac <__memset+0x84>
    8000462c:	00400e93          	li	t4,4
    80004630:	e7dff06f          	j	800044ac <__memset+0x84>
    80004634:	00500e93          	li	t4,5
    80004638:	e75ff06f          	j	800044ac <__memset+0x84>
    8000463c:	00600e93          	li	t4,6
    80004640:	e6dff06f          	j	800044ac <__memset+0x84>

0000000080004644 <__memmove>:
    80004644:	ff010113          	addi	sp,sp,-16
    80004648:	00813423          	sd	s0,8(sp)
    8000464c:	01010413          	addi	s0,sp,16
    80004650:	0e060863          	beqz	a2,80004740 <__memmove+0xfc>
    80004654:	fff6069b          	addiw	a3,a2,-1
    80004658:	0006881b          	sext.w	a6,a3
    8000465c:	0ea5e863          	bltu	a1,a0,8000474c <__memmove+0x108>
    80004660:	00758713          	addi	a4,a1,7
    80004664:	00a5e7b3          	or	a5,a1,a0
    80004668:	40a70733          	sub	a4,a4,a0
    8000466c:	0077f793          	andi	a5,a5,7
    80004670:	00f73713          	sltiu	a4,a4,15
    80004674:	00174713          	xori	a4,a4,1
    80004678:	0017b793          	seqz	a5,a5
    8000467c:	00e7f7b3          	and	a5,a5,a4
    80004680:	10078863          	beqz	a5,80004790 <__memmove+0x14c>
    80004684:	00900793          	li	a5,9
    80004688:	1107f463          	bgeu	a5,a6,80004790 <__memmove+0x14c>
    8000468c:	0036581b          	srliw	a6,a2,0x3
    80004690:	fff8081b          	addiw	a6,a6,-1
    80004694:	02081813          	slli	a6,a6,0x20
    80004698:	01d85893          	srli	a7,a6,0x1d
    8000469c:	00858813          	addi	a6,a1,8
    800046a0:	00058793          	mv	a5,a1
    800046a4:	00050713          	mv	a4,a0
    800046a8:	01088833          	add	a6,a7,a6
    800046ac:	0007b883          	ld	a7,0(a5)
    800046b0:	00878793          	addi	a5,a5,8
    800046b4:	00870713          	addi	a4,a4,8
    800046b8:	ff173c23          	sd	a7,-8(a4)
    800046bc:	ff0798e3          	bne	a5,a6,800046ac <__memmove+0x68>
    800046c0:	ff867713          	andi	a4,a2,-8
    800046c4:	02071793          	slli	a5,a4,0x20
    800046c8:	0207d793          	srli	a5,a5,0x20
    800046cc:	00f585b3          	add	a1,a1,a5
    800046d0:	40e686bb          	subw	a3,a3,a4
    800046d4:	00f507b3          	add	a5,a0,a5
    800046d8:	06e60463          	beq	a2,a4,80004740 <__memmove+0xfc>
    800046dc:	0005c703          	lbu	a4,0(a1)
    800046e0:	00e78023          	sb	a4,0(a5)
    800046e4:	04068e63          	beqz	a3,80004740 <__memmove+0xfc>
    800046e8:	0015c603          	lbu	a2,1(a1)
    800046ec:	00100713          	li	a4,1
    800046f0:	00c780a3          	sb	a2,1(a5)
    800046f4:	04e68663          	beq	a3,a4,80004740 <__memmove+0xfc>
    800046f8:	0025c603          	lbu	a2,2(a1)
    800046fc:	00200713          	li	a4,2
    80004700:	00c78123          	sb	a2,2(a5)
    80004704:	02e68e63          	beq	a3,a4,80004740 <__memmove+0xfc>
    80004708:	0035c603          	lbu	a2,3(a1)
    8000470c:	00300713          	li	a4,3
    80004710:	00c781a3          	sb	a2,3(a5)
    80004714:	02e68663          	beq	a3,a4,80004740 <__memmove+0xfc>
    80004718:	0045c603          	lbu	a2,4(a1)
    8000471c:	00400713          	li	a4,4
    80004720:	00c78223          	sb	a2,4(a5)
    80004724:	00e68e63          	beq	a3,a4,80004740 <__memmove+0xfc>
    80004728:	0055c603          	lbu	a2,5(a1)
    8000472c:	00500713          	li	a4,5
    80004730:	00c782a3          	sb	a2,5(a5)
    80004734:	00e68663          	beq	a3,a4,80004740 <__memmove+0xfc>
    80004738:	0065c703          	lbu	a4,6(a1)
    8000473c:	00e78323          	sb	a4,6(a5)
    80004740:	00813403          	ld	s0,8(sp)
    80004744:	01010113          	addi	sp,sp,16
    80004748:	00008067          	ret
    8000474c:	02061713          	slli	a4,a2,0x20
    80004750:	02075713          	srli	a4,a4,0x20
    80004754:	00e587b3          	add	a5,a1,a4
    80004758:	f0f574e3          	bgeu	a0,a5,80004660 <__memmove+0x1c>
    8000475c:	02069613          	slli	a2,a3,0x20
    80004760:	02065613          	srli	a2,a2,0x20
    80004764:	fff64613          	not	a2,a2
    80004768:	00e50733          	add	a4,a0,a4
    8000476c:	00c78633          	add	a2,a5,a2
    80004770:	fff7c683          	lbu	a3,-1(a5)
    80004774:	fff78793          	addi	a5,a5,-1
    80004778:	fff70713          	addi	a4,a4,-1
    8000477c:	00d70023          	sb	a3,0(a4)
    80004780:	fec798e3          	bne	a5,a2,80004770 <__memmove+0x12c>
    80004784:	00813403          	ld	s0,8(sp)
    80004788:	01010113          	addi	sp,sp,16
    8000478c:	00008067          	ret
    80004790:	02069713          	slli	a4,a3,0x20
    80004794:	02075713          	srli	a4,a4,0x20
    80004798:	00170713          	addi	a4,a4,1
    8000479c:	00e50733          	add	a4,a0,a4
    800047a0:	00050793          	mv	a5,a0
    800047a4:	0005c683          	lbu	a3,0(a1)
    800047a8:	00178793          	addi	a5,a5,1
    800047ac:	00158593          	addi	a1,a1,1
    800047b0:	fed78fa3          	sb	a3,-1(a5)
    800047b4:	fee798e3          	bne	a5,a4,800047a4 <__memmove+0x160>
    800047b8:	f89ff06f          	j	80004740 <__memmove+0xfc>

00000000800047bc <__putc>:
    800047bc:	fe010113          	addi	sp,sp,-32
    800047c0:	00813823          	sd	s0,16(sp)
    800047c4:	00113c23          	sd	ra,24(sp)
    800047c8:	02010413          	addi	s0,sp,32
    800047cc:	00050793          	mv	a5,a0
    800047d0:	fef40593          	addi	a1,s0,-17
    800047d4:	00100613          	li	a2,1
    800047d8:	00000513          	li	a0,0
    800047dc:	fef407a3          	sb	a5,-17(s0)
    800047e0:	fffff097          	auipc	ra,0xfffff
    800047e4:	b3c080e7          	jalr	-1220(ra) # 8000331c <console_write>
    800047e8:	01813083          	ld	ra,24(sp)
    800047ec:	01013403          	ld	s0,16(sp)
    800047f0:	02010113          	addi	sp,sp,32
    800047f4:	00008067          	ret

00000000800047f8 <__getc>:
    800047f8:	fe010113          	addi	sp,sp,-32
    800047fc:	00813823          	sd	s0,16(sp)
    80004800:	00113c23          	sd	ra,24(sp)
    80004804:	02010413          	addi	s0,sp,32
    80004808:	fe840593          	addi	a1,s0,-24
    8000480c:	00100613          	li	a2,1
    80004810:	00000513          	li	a0,0
    80004814:	fffff097          	auipc	ra,0xfffff
    80004818:	ae8080e7          	jalr	-1304(ra) # 800032fc <console_read>
    8000481c:	fe844503          	lbu	a0,-24(s0)
    80004820:	01813083          	ld	ra,24(sp)
    80004824:	01013403          	ld	s0,16(sp)
    80004828:	02010113          	addi	sp,sp,32
    8000482c:	00008067          	ret

0000000080004830 <console_handler>:
    80004830:	fe010113          	addi	sp,sp,-32
    80004834:	00813823          	sd	s0,16(sp)
    80004838:	00113c23          	sd	ra,24(sp)
    8000483c:	00913423          	sd	s1,8(sp)
    80004840:	02010413          	addi	s0,sp,32
    80004844:	14202773          	csrr	a4,scause
    80004848:	100027f3          	csrr	a5,sstatus
    8000484c:	0027f793          	andi	a5,a5,2
    80004850:	06079e63          	bnez	a5,800048cc <console_handler+0x9c>
    80004854:	00074c63          	bltz	a4,8000486c <console_handler+0x3c>
    80004858:	01813083          	ld	ra,24(sp)
    8000485c:	01013403          	ld	s0,16(sp)
    80004860:	00813483          	ld	s1,8(sp)
    80004864:	02010113          	addi	sp,sp,32
    80004868:	00008067          	ret
    8000486c:	0ff77713          	andi	a4,a4,255
    80004870:	00900793          	li	a5,9
    80004874:	fef712e3          	bne	a4,a5,80004858 <console_handler+0x28>
    80004878:	ffffe097          	auipc	ra,0xffffe
    8000487c:	6dc080e7          	jalr	1756(ra) # 80002f54 <plic_claim>
    80004880:	00a00793          	li	a5,10
    80004884:	00050493          	mv	s1,a0
    80004888:	02f50c63          	beq	a0,a5,800048c0 <console_handler+0x90>
    8000488c:	fc0506e3          	beqz	a0,80004858 <console_handler+0x28>
    80004890:	00050593          	mv	a1,a0
    80004894:	00001517          	auipc	a0,0x1
    80004898:	a8c50513          	addi	a0,a0,-1396 # 80005320 <CONSOLE_STATUS+0x310>
    8000489c:	fffff097          	auipc	ra,0xfffff
    800048a0:	afc080e7          	jalr	-1284(ra) # 80003398 <__printf>
    800048a4:	01013403          	ld	s0,16(sp)
    800048a8:	01813083          	ld	ra,24(sp)
    800048ac:	00048513          	mv	a0,s1
    800048b0:	00813483          	ld	s1,8(sp)
    800048b4:	02010113          	addi	sp,sp,32
    800048b8:	ffffe317          	auipc	t1,0xffffe
    800048bc:	6d430067          	jr	1748(t1) # 80002f8c <plic_complete>
    800048c0:	fffff097          	auipc	ra,0xfffff
    800048c4:	3e0080e7          	jalr	992(ra) # 80003ca0 <uartintr>
    800048c8:	fddff06f          	j	800048a4 <console_handler+0x74>
    800048cc:	00001517          	auipc	a0,0x1
    800048d0:	b5450513          	addi	a0,a0,-1196 # 80005420 <digits+0x78>
    800048d4:	fffff097          	auipc	ra,0xfffff
    800048d8:	a68080e7          	jalr	-1432(ra) # 8000333c <panic>
	...
