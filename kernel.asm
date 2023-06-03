
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00006117          	auipc	sp,0x6
    80000004:	be813103          	ld	sp,-1048(sp) # 80005be8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	288020ef          	jal	ra,800022a4 <start>

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
    80001184:	778000ef          	jal	ra,800018fc <interruptRoutine>

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
    80001404:	00813423          	sd	s0,8(sp)
    80001408:	01010413          	addi	s0,sp,16
	return 0;
}
    8000140c:	00000513          	li	a0,0
    80001410:	00813403          	ld	s0,8(sp)
    80001414:	01010113          	addi	sp,sp,16
    80001418:	00008067          	ret

000000008000141c <_Z4putcc>:

void putc(char) {
    8000141c:	ff010113          	addi	sp,sp,-16
    80001420:	00813423          	sd	s0,8(sp)
    80001424:	01010413          	addi	s0,sp,16

}
    80001428:	00813403          	ld	s0,8(sp)
    8000142c:	01010113          	addi	sp,sp,16
    80001430:	00008067          	ret

0000000080001434 <_Z11printStringPKc>:
#include "../h/helper.hpp"
#include "../lib/console.h"
#include "../h/Riscv.hpp"

void printString(char const *string) {
    80001434:	fe010113          	addi	sp,sp,-32
    80001438:	00113c23          	sd	ra,24(sp)
    8000143c:	00813823          	sd	s0,16(sp)
    80001440:	00913423          	sd	s1,8(sp)
    80001444:	02010413          	addi	s0,sp,32
    80001448:	00050493          	mv	s1,a0
    while (*string != '\0') {
    8000144c:	0004c503          	lbu	a0,0(s1)
    80001450:	00050a63          	beqz	a0,80001464 <_Z11printStringPKc+0x30>
        __putc(*string);
    80001454:	00003097          	auipc	ra,0x3
    80001458:	f18080e7          	jalr	-232(ra) # 8000436c <__putc>
        string++;
    8000145c:	00148493          	addi	s1,s1,1
    while (*string != '\0') {
    80001460:	fedff06f          	j	8000144c <_Z11printStringPKc+0x18>
    }
}
    80001464:	01813083          	ld	ra,24(sp)
    80001468:	01013403          	ld	s0,16(sp)
    8000146c:	00813483          	ld	s1,8(sp)
    80001470:	02010113          	addi	sp,sp,32
    80001474:	00008067          	ret

0000000080001478 <_Z7printlnPKc>:

void println(char const *string) {
    80001478:	ff010113          	addi	sp,sp,-16
    8000147c:	00113423          	sd	ra,8(sp)
    80001480:	00813023          	sd	s0,0(sp)
    80001484:	01010413          	addi	s0,sp,16
    printString(string);
    80001488:	00000097          	auipc	ra,0x0
    8000148c:	fac080e7          	jalr	-84(ra) # 80001434 <_Z11printStringPKc>
    __putc('\n');
    80001490:	00a00513          	li	a0,10
    80001494:	00003097          	auipc	ra,0x3
    80001498:	ed8080e7          	jalr	-296(ra) # 8000436c <__putc>
}
    8000149c:	00813083          	ld	ra,8(sp)
    800014a0:	00013403          	ld	s0,0(sp)
    800014a4:	01010113          	addi	sp,sp,16
    800014a8:	00008067          	ret

00000000800014ac <_Z12printIntegerm>:

void printInteger(uint64 integer) {
    800014ac:	fd010113          	addi	sp,sp,-48
    800014b0:	02113423          	sd	ra,40(sp)
    800014b4:	02813023          	sd	s0,32(sp)
    800014b8:	00913c23          	sd	s1,24(sp)
    800014bc:	03010413          	addi	s0,sp,48
    neg = 0;
    if (integer < 0) {
        neg = 1;
        x = -integer;
    } else {
        x = integer;
    800014c0:	0005051b          	sext.w	a0,a0
    }

    i = 0;
    800014c4:	00000493          	li	s1,0
    do {
        buf[i++] = digits[x % 10];
    800014c8:	00a00613          	li	a2,10
    800014cc:	02c5773b          	remuw	a4,a0,a2
    800014d0:	02071693          	slli	a3,a4,0x20
    800014d4:	0206d693          	srli	a3,a3,0x20
    800014d8:	00004717          	auipc	a4,0x4
    800014dc:	b4870713          	addi	a4,a4,-1208 # 80005020 <_ZZ12printIntegermE6digits>
    800014e0:	00d70733          	add	a4,a4,a3
    800014e4:	00074703          	lbu	a4,0(a4)
    800014e8:	fe040693          	addi	a3,s0,-32
    800014ec:	009687b3          	add	a5,a3,s1
    800014f0:	0014849b          	addiw	s1,s1,1
    800014f4:	fee78823          	sb	a4,-16(a5)
    } while ((x /= 10) != 0);
    800014f8:	0005071b          	sext.w	a4,a0
    800014fc:	02c5553b          	divuw	a0,a0,a2
    80001500:	00900793          	li	a5,9
    80001504:	fce7e2e3          	bltu	a5,a4,800014c8 <_Z12printIntegerm+0x1c>
    if (neg) buf[i++] = '-';

    while (--i >= 0) {
    80001508:	fff4849b          	addiw	s1,s1,-1
    8000150c:	0004ce63          	bltz	s1,80001528 <_Z12printIntegerm+0x7c>
        __putc(buf[i]);
    80001510:	fe040793          	addi	a5,s0,-32
    80001514:	009787b3          	add	a5,a5,s1
    80001518:	ff07c503          	lbu	a0,-16(a5)
    8000151c:	00003097          	auipc	ra,0x3
    80001520:	e50080e7          	jalr	-432(ra) # 8000436c <__putc>
    80001524:	fe5ff06f          	j	80001508 <_Z12printIntegerm+0x5c>
    }
}
    80001528:	02813083          	ld	ra,40(sp)
    8000152c:	02013403          	ld	s0,32(sp)
    80001530:	01813483          	ld	s1,24(sp)
    80001534:	03010113          	addi	sp,sp,48
    80001538:	00008067          	ret

000000008000153c <_ZN9Scheduler3putEP3TCB>:

//Scheduler* Scheduler::singleton = nullptr;
TCB* Scheduler::head = nullptr;
TCB* Scheduler::tail = nullptr;

void Scheduler::put(TCB* tcb) {
    8000153c:	ff010113          	addi	sp,sp,-16
    80001540:	00813423          	sd	s0,8(sp)
    80001544:	01010413          	addi	s0,sp,16
	if (tail == nullptr) {
    80001548:	00004797          	auipc	a5,0x4
    8000154c:	7087b783          	ld	a5,1800(a5) # 80005c50 <_ZN9Scheduler4tailE>
    80001550:	00078e63          	beqz	a5,8000156c <_ZN9Scheduler3putEP3TCB+0x30>
		head = tail = tcb;
	} else {
		tail->nextInScheduler = tcb;
    80001554:	02a7bc23          	sd	a0,56(a5)
		tail = tcb;
    80001558:	00004797          	auipc	a5,0x4
    8000155c:	6ea7bc23          	sd	a0,1784(a5) # 80005c50 <_ZN9Scheduler4tailE>
	}
}
    80001560:	00813403          	ld	s0,8(sp)
    80001564:	01010113          	addi	sp,sp,16
    80001568:	00008067          	ret
		head = tail = tcb;
    8000156c:	00004797          	auipc	a5,0x4
    80001570:	6e478793          	addi	a5,a5,1764 # 80005c50 <_ZN9Scheduler4tailE>
    80001574:	00a7b023          	sd	a0,0(a5)
    80001578:	00a7b423          	sd	a0,8(a5)
    8000157c:	fe5ff06f          	j	80001560 <_ZN9Scheduler3putEP3TCB+0x24>

0000000080001580 <_ZN9Scheduler3getEv>:

TCB* Scheduler::get() {
    80001580:	ff010113          	addi	sp,sp,-16
    80001584:	00813423          	sd	s0,8(sp)
    80001588:	01010413          	addi	s0,sp,16
	TCB* firstThread = head;
    8000158c:	00004717          	auipc	a4,0x4
    80001590:	6c470713          	addi	a4,a4,1732 # 80005c50 <_ZN9Scheduler4tailE>
    80001594:	00873503          	ld	a0,8(a4)
	head = head->nextInScheduler;
    80001598:	03853783          	ld	a5,56(a0) # 1038 <_entry-0x7fffefc8>
    8000159c:	00f73423          	sd	a5,8(a4)
	if (head == nullptr) {
    800015a0:	00078863          	beqz	a5,800015b0 <_ZN9Scheduler3getEv+0x30>
		tail = head = nullptr;
	}
	return firstThread;
    800015a4:	00813403          	ld	s0,8(sp)
    800015a8:	01010113          	addi	sp,sp,16
    800015ac:	00008067          	ret
		tail = head = nullptr;
    800015b0:	00073423          	sd	zero,8(a4)
    800015b4:	00073023          	sd	zero,0(a4)
	return firstThread;
    800015b8:	fedff06f          	j	800015a4 <_ZN9Scheduler3getEv+0x24>

00000000800015bc <main>:
	println("Nisam uspeo da ugasim nit 2");
	printInteger(*(uint64*)arg2);
	println("Gotova nit 2");
}
#pragma GCC optimize("O0")
int main() {
    800015bc:	fd010113          	addi	sp,sp,-48
    800015c0:	02113423          	sd	ra,40(sp)
    800015c4:	02813023          	sd	s0,32(sp)
    800015c8:	03010413          	addi	s0,sp,48

	//zabrani prekide
	Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    800015cc:	00200513          	li	a0,2
    800015d0:	00000097          	auipc	ra,0x0
    800015d4:	2f4080e7          	jalr	756(ra) # 800018c4 <_ZN5Riscv10mc_sstatusEm>

	//postavi adresu prekidne rutine u stvec
	Riscv::w_stvec((uint64)&interruptHandler);
    800015d8:	00004797          	auipc	a5,0x4
    800015dc:	6287b783          	ld	a5,1576(a5) # 80005c00 <_GLOBAL_OFFSET_TABLE_+0x28>
    800015e0:	00078513          	mv	a0,a5
    800015e4:	00000097          	auipc	ra,0x0
    800015e8:	2a8080e7          	jalr	680(ra) # 8000188c <_ZN5Riscv7w_stvecEm>

	//omoguci prekide
	Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
    800015ec:	00200513          	li	a0,2
    800015f0:	00000097          	auipc	ra,0x0
    800015f4:	2b8080e7          	jalr	696(ra) # 800018a8 <_ZN5Riscv10ms_sstatusEm>
//	printInteger(*(lista->peekFirst()));
//	delete lista;
//	println("");

	//testiranje kreiranja niti
	thread_t glavnaNit = nullptr;
    800015f8:	fe043023          	sd	zero,-32(s0)
	thread_t nit1 = nullptr;
    800015fc:	fc043c23          	sd	zero,-40(s0)
	thread_t nit2 = nullptr;
    80001600:	fc043823          	sd	zero,-48(s0)
	thread_create(&glavnaNit, nullptr, nullptr);
    80001604:	fe040793          	addi	a5,s0,-32
    80001608:	00000613          	li	a2,0
    8000160c:	00000593          	li	a1,0
    80001610:	00078513          	mv	a0,a5
    80001614:	00000097          	auipc	ra,0x0
    80001618:	c80080e7          	jalr	-896(ra) # 80001294 <_Z13thread_createPP3TCBPFvPvES2_>
	TCB::running = glavnaNit;
    8000161c:	fe043703          	ld	a4,-32(s0)
    80001620:	00004797          	auipc	a5,0x4
    80001624:	5d07b783          	ld	a5,1488(a5) # 80005bf0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80001628:	00e7b023          	sd	a4,0(a5)
	uint64* arg = new uint64;
    8000162c:	00800513          	li	a0,8
    80001630:	00000097          	auipc	ra,0x0
    80001634:	5b4080e7          	jalr	1460(ra) # 80001be4 <_Znwm>
    80001638:	00050793          	mv	a5,a0
    8000163c:	fef43423          	sd	a5,-24(s0)
	*arg = 666;
    80001640:	fe843783          	ld	a5,-24(s0)
    80001644:	29a00713          	li	a4,666
    80001648:	00e7b023          	sd	a4,0(a5)
	thread_create(&nit1, nit1f, nullptr);
    8000164c:	fd840793          	addi	a5,s0,-40
    80001650:	00000613          	li	a2,0
    80001654:	00000597          	auipc	a1,0x0
    80001658:	0d058593          	addi	a1,a1,208 # 80001724 <_Z5nit1fPv>
    8000165c:	00078513          	mv	a0,a5
    80001660:	00000097          	auipc	ra,0x0
    80001664:	c34080e7          	jalr	-972(ra) # 80001294 <_Z13thread_createPP3TCBPFvPvES2_>
	thread_create(&nit2, nit2f, arg);
    80001668:	fd040793          	addi	a5,s0,-48
    8000166c:	fe843603          	ld	a2,-24(s0)
    80001670:	00000597          	auipc	a1,0x0
    80001674:	13458593          	addi	a1,a1,308 # 800017a4 <_Z5nit2fPv>
    80001678:	00078513          	mv	a0,a5
    8000167c:	00000097          	auipc	ra,0x0
    80001680:	c18080e7          	jalr	-1000(ra) # 80001294 <_Z13thread_createPP3TCBPFvPvES2_>
	while(!nit1->isFinished() && !nit2->isFinished()){
    80001684:	fd843783          	ld	a5,-40(s0)
    80001688:	00078513          	mv	a0,a5
    8000168c:	00000097          	auipc	ra,0x0
    80001690:	254080e7          	jalr	596(ra) # 800018e0 <_ZN3TCB10isFinishedEv>
    80001694:	00050793          	mv	a5,a0
    80001698:	0017c793          	xori	a5,a5,1
    8000169c:	0ff7f793          	andi	a5,a5,255
    800016a0:	02078663          	beqz	a5,800016cc <main+0x110>
    800016a4:	fd043783          	ld	a5,-48(s0)
    800016a8:	00078513          	mv	a0,a5
    800016ac:	00000097          	auipc	ra,0x0
    800016b0:	234080e7          	jalr	564(ra) # 800018e0 <_ZN3TCB10isFinishedEv>
    800016b4:	00050793          	mv	a5,a0
    800016b8:	0017c793          	xori	a5,a5,1
    800016bc:	0ff7f793          	andi	a5,a5,255
    800016c0:	00078663          	beqz	a5,800016cc <main+0x110>
    800016c4:	00100793          	li	a5,1
    800016c8:	0080006f          	j	800016d0 <main+0x114>
    800016cc:	00000793          	li	a5,0
    800016d0:	00078863          	beqz	a5,800016e0 <main+0x124>
		thread_dispatch();
    800016d4:	00000097          	auipc	ra,0x0
    800016d8:	c68080e7          	jalr	-920(ra) # 8000133c <_Z15thread_dispatchv>
	while(!nit1->isFinished() && !nit2->isFinished()){
    800016dc:	fa9ff06f          	j	80001684 <main+0xc8>
	}
	println("\nProsao while");
    800016e0:	00004517          	auipc	a0,0x4
    800016e4:	95050513          	addi	a0,a0,-1712 # 80005030 <_ZZ12printIntegermE6digits+0x10>
    800016e8:	00000097          	auipc	ra,0x0
    800016ec:	d90080e7          	jalr	-624(ra) # 80001478 <_Z7printlnPKc>

	//zabrani prekide
	Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    800016f0:	00200513          	li	a0,2
    800016f4:	00000097          	auipc	ra,0x0
    800016f8:	1d0080e7          	jalr	464(ra) # 800018c4 <_ZN5Riscv10mc_sstatusEm>
	println("\nSad cu da izadjem");
    800016fc:	00004517          	auipc	a0,0x4
    80001700:	94450513          	addi	a0,a0,-1724 # 80005040 <_ZZ12printIntegermE6digits+0x20>
    80001704:	00000097          	auipc	ra,0x0
    80001708:	d74080e7          	jalr	-652(ra) # 80001478 <_Z7printlnPKc>
	return 0;
    8000170c:	00000793          	li	a5,0
    80001710:	00078513          	mv	a0,a5
    80001714:	02813083          	ld	ra,40(sp)
    80001718:	02013403          	ld	s0,32(sp)
    8000171c:	03010113          	addi	sp,sp,48
    80001720:	00008067          	ret

0000000080001724 <_Z5nit1fPv>:
void nit1f(void*) {
    80001724:	fe010113          	addi	sp,sp,-32
    80001728:	00113c23          	sd	ra,24(sp)
    8000172c:	00813823          	sd	s0,16(sp)
    80001730:	02010413          	addi	s0,sp,32
	println("\nusao u nit 1");
    80001734:	00004517          	auipc	a0,0x4
    80001738:	92450513          	addi	a0,a0,-1756 # 80005058 <_ZZ12printIntegermE6digits+0x38>
    8000173c:	00000097          	auipc	ra,0x0
    80001740:	d3c080e7          	jalr	-708(ra) # 80001478 <_Z7printlnPKc>
	__asm__ volatile("li t1, 100");
    80001744:	06400313          	li	t1,100
	thread_dispatch();
    80001748:	00000097          	auipc	ra,0x0
    8000174c:	bf4080e7          	jalr	-1036(ra) # 8000133c <_Z15thread_dispatchv>
	__asm__ volatile("mv %0, t1":"=r"(t1));
    80001750:	00030793          	mv	a5,t1
    80001754:	fef43423          	sd	a5,-24(s0)
	println("\nopet u niti 1");
    80001758:	00004517          	auipc	a0,0x4
    8000175c:	91050513          	addi	a0,a0,-1776 # 80005068 <_ZZ12printIntegermE6digits+0x48>
    80001760:	00000097          	auipc	ra,0x0
    80001764:	d18080e7          	jalr	-744(ra) # 80001478 <_Z7printlnPKc>
	printString("\nt1 = ");
    80001768:	00004517          	auipc	a0,0x4
    8000176c:	91050513          	addi	a0,a0,-1776 # 80005078 <_ZZ12printIntegermE6digits+0x58>
    80001770:	00000097          	auipc	ra,0x0
    80001774:	cc4080e7          	jalr	-828(ra) # 80001434 <_Z11printStringPKc>
	printInteger(t1);
    80001778:	fe843503          	ld	a0,-24(s0)
    8000177c:	00000097          	auipc	ra,0x0
    80001780:	d30080e7          	jalr	-720(ra) # 800014ac <_Z12printIntegerm>
	println("Gotova nit 1");
    80001784:	00004517          	auipc	a0,0x4
    80001788:	8fc50513          	addi	a0,a0,-1796 # 80005080 <_ZZ12printIntegermE6digits+0x60>
    8000178c:	00000097          	auipc	ra,0x0
    80001790:	cec080e7          	jalr	-788(ra) # 80001478 <_Z7printlnPKc>
}
    80001794:	01813083          	ld	ra,24(sp)
    80001798:	01013403          	ld	s0,16(sp)
    8000179c:	02010113          	addi	sp,sp,32
    800017a0:	00008067          	ret

00000000800017a4 <_Z5nit2fPv>:
void nit2f(void* arg2) {
    800017a4:	fd010113          	addi	sp,sp,-48
    800017a8:	02113423          	sd	ra,40(sp)
    800017ac:	02813023          	sd	s0,32(sp)
    800017b0:	00913c23          	sd	s1,24(sp)
    800017b4:	03010413          	addi	s0,sp,48
    800017b8:	00050493          	mv	s1,a0
	println("\nusao u nit 2");
    800017bc:	00004517          	auipc	a0,0x4
    800017c0:	8d450513          	addi	a0,a0,-1836 # 80005090 <_ZZ12printIntegermE6digits+0x70>
    800017c4:	00000097          	auipc	ra,0x0
    800017c8:	cb4080e7          	jalr	-844(ra) # 80001478 <_Z7printlnPKc>
	printInteger(*(uint64*)arg2);
    800017cc:	0004b503          	ld	a0,0(s1)
    800017d0:	00000097          	auipc	ra,0x0
    800017d4:	cdc080e7          	jalr	-804(ra) # 800014ac <_Z12printIntegerm>
	*(uint64*)arg2+=10;
    800017d8:	0004b783          	ld	a5,0(s1)
    800017dc:	00a78793          	addi	a5,a5,10
    800017e0:	00f4b023          	sd	a5,0(s1)
	__asm__ volatile("li t1, 200");
    800017e4:	0c800313          	li	t1,200
	thread_dispatch();
    800017e8:	00000097          	auipc	ra,0x0
    800017ec:	b54080e7          	jalr	-1196(ra) # 8000133c <_Z15thread_dispatchv>
	__asm__ volatile("mv %0, t1":"=r"(t1));
    800017f0:	00030793          	mv	a5,t1
    800017f4:	fcf43c23          	sd	a5,-40(s0)
	println("\nopet u niti 2");
    800017f8:	00004517          	auipc	a0,0x4
    800017fc:	8a850513          	addi	a0,a0,-1880 # 800050a0 <_ZZ12printIntegermE6digits+0x80>
    80001800:	00000097          	auipc	ra,0x0
    80001804:	c78080e7          	jalr	-904(ra) # 80001478 <_Z7printlnPKc>
	printString("\nt1 = ");
    80001808:	00004517          	auipc	a0,0x4
    8000180c:	87050513          	addi	a0,a0,-1936 # 80005078 <_ZZ12printIntegermE6digits+0x58>
    80001810:	00000097          	auipc	ra,0x0
    80001814:	c24080e7          	jalr	-988(ra) # 80001434 <_Z11printStringPKc>
	printInteger(t1);
    80001818:	fd843503          	ld	a0,-40(s0)
    8000181c:	00000097          	auipc	ra,0x0
    80001820:	c90080e7          	jalr	-880(ra) # 800014ac <_Z12printIntegerm>
	println("");
    80001824:	00004517          	auipc	a0,0x4
    80001828:	88c50513          	addi	a0,a0,-1908 # 800050b0 <_ZZ12printIntegermE6digits+0x90>
    8000182c:	00000097          	auipc	ra,0x0
    80001830:	c4c080e7          	jalr	-948(ra) # 80001478 <_Z7printlnPKc>
	println("Pokusavam da ugasim nit 2");
    80001834:	00004517          	auipc	a0,0x4
    80001838:	88450513          	addi	a0,a0,-1916 # 800050b8 <_ZZ12printIntegermE6digits+0x98>
    8000183c:	00000097          	auipc	ra,0x0
    80001840:	c3c080e7          	jalr	-964(ra) # 80001478 <_Z7printlnPKc>
	thread_exit();
    80001844:	00000097          	auipc	ra,0x0
    80001848:	ad0080e7          	jalr	-1328(ra) # 80001314 <_Z11thread_exitv>
	println("Nisam uspeo da ugasim nit 2");
    8000184c:	00004517          	auipc	a0,0x4
    80001850:	88c50513          	addi	a0,a0,-1908 # 800050d8 <_ZZ12printIntegermE6digits+0xb8>
    80001854:	00000097          	auipc	ra,0x0
    80001858:	c24080e7          	jalr	-988(ra) # 80001478 <_Z7printlnPKc>
	printInteger(*(uint64*)arg2);
    8000185c:	0004b503          	ld	a0,0(s1)
    80001860:	00000097          	auipc	ra,0x0
    80001864:	c4c080e7          	jalr	-948(ra) # 800014ac <_Z12printIntegerm>
	println("Gotova nit 2");
    80001868:	00004517          	auipc	a0,0x4
    8000186c:	89050513          	addi	a0,a0,-1904 # 800050f8 <_ZZ12printIntegermE6digits+0xd8>
    80001870:	00000097          	auipc	ra,0x0
    80001874:	c08080e7          	jalr	-1016(ra) # 80001478 <_Z7printlnPKc>
}
    80001878:	02813083          	ld	ra,40(sp)
    8000187c:	02013403          	ld	s0,32(sp)
    80001880:	01813483          	ld	s1,24(sp)
    80001884:	03010113          	addi	sp,sp,48
    80001888:	00008067          	ret

000000008000188c <_ZN5Riscv7w_stvecEm>:
	uint64 volatile stvec;
	__asm__ volatile("csrr %[stvec], stvec": [stvec] "=r"(stvec));
	return stvec;
}

inline void Riscv::w_stvec(uint64 stvec) {
    8000188c:	ff010113          	addi	sp,sp,-16
    80001890:	00813423          	sd	s0,8(sp)
    80001894:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrw stvec, %[stvec]": :[stvec] "r"(stvec));
    80001898:	10551073          	csrw	stvec,a0
}
    8000189c:	00813403          	ld	s0,8(sp)
    800018a0:	01010113          	addi	sp,sp,16
    800018a4:	00008067          	ret

00000000800018a8 <_ZN5Riscv10ms_sstatusEm>:

inline void Riscv::w_sip(uint64 sip) {
	__asm__ volatile("csrw sip, %[sip]": :[sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask) {
    800018a8:	ff010113          	addi	sp,sp,-16
    800018ac:	00813423          	sd	s0,8(sp)
    800018b0:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    800018b4:	10052073          	csrs	sstatus,a0
}
    800018b8:	00813403          	ld	s0,8(sp)
    800018bc:	01010113          	addi	sp,sp,16
    800018c0:	00008067          	ret

00000000800018c4 <_ZN5Riscv10mc_sstatusEm>:

inline void Riscv::mc_sstatus(uint64 mask) {
    800018c4:	ff010113          	addi	sp,sp,-16
    800018c8:	00813423          	sd	s0,8(sp)
    800018cc:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    800018d0:	10053073          	csrc	sstatus,a0
}
    800018d4:	00813403          	ld	s0,8(sp)
    800018d8:	01010113          	addi	sp,sp,16
    800018dc:	00008067          	ret

00000000800018e0 <_ZN3TCB10isFinishedEv>:
	friend class Scheduler;
	using Body = void (*)(void*);

	static TCB* createThread(Body function, void* args, uint64* stack);

	bool isFinished() { return finished; }
    800018e0:	ff010113          	addi	sp,sp,-16
    800018e4:	00813423          	sd	s0,8(sp)
    800018e8:	01010413          	addi	s0,sp,16
    800018ec:	03054503          	lbu	a0,48(a0)
    800018f0:	00813403          	ld	s0,8(sp)
    800018f4:	01010113          	addi	sp,sp,16
    800018f8:	00008067          	ret

00000000800018fc <interruptRoutine>:
#include "../h/Riscv.hpp"
#include "../h/syscall_c.hpp"
#include "../h/TCB.hpp"

#pragma GCC optimize("O0")
extern "C" void interruptRoutine() {
    800018fc:	f6010113          	addi	sp,sp,-160
    80001900:	08113c23          	sd	ra,152(sp)
    80001904:	08813823          	sd	s0,144(sp)
    80001908:	0a010413          	addi	s0,sp,160
	uint64 scause, sepc, sstatus;
	__asm__ volatile("csrr %[scause], scause":[scause] "=r"(scause): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000190c:	14202373          	csrr	t1,scause
    80001910:	fe643423          	sd	t1,-24(s0)
	__asm__ volatile("csrr %[sepc], sepc":[sepc] "=r"(sepc): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001914:	14102373          	csrr	t1,sepc
    80001918:	fe643023          	sd	t1,-32(s0)
	__asm__ volatile("csrr %[status], sstatus":[status] "=r"(
			sstatus): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000191c:	10002373          	csrr	t1,sstatus
    80001920:	fc643c23          	sd	t1,-40(s0)
	uint64 a0, a1, a2, a3, a4, a5, a6, a7;
	__asm__ volatile("mv %[ax], a0":[ax] "=r"(a0): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001924:	00050313          	mv	t1,a0
    80001928:	fc643823          	sd	t1,-48(s0)
	__asm__ volatile("mv %[ax], a1":[ax] "=r"(a1): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000192c:	00058313          	mv	t1,a1
    80001930:	fc643423          	sd	t1,-56(s0)
	__asm__ volatile("mv %[ax], a2":[ax] "=r"(a2): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001934:	00060313          	mv	t1,a2
    80001938:	fc643023          	sd	t1,-64(s0)
	__asm__ volatile("mv %[ax], a3":[ax] "=r"(a3): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000193c:	00068313          	mv	t1,a3
    80001940:	fa643c23          	sd	t1,-72(s0)
	__asm__ volatile("mv %[ax], a4":[ax] "=r"(a4): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001944:	00070313          	mv	t1,a4
    80001948:	fa643823          	sd	t1,-80(s0)
	__asm__ volatile("mv %[ax], a5":[ax] "=r"(a5): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000194c:	00078313          	mv	t1,a5
    80001950:	fa643423          	sd	t1,-88(s0)
	__asm__ volatile("mv %[ax], a6":[ax] "=r"(a6): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001954:	00080313          	mv	t1,a6
    80001958:	fa643023          	sd	t1,-96(s0)
	__asm__ volatile("mv %[ax], a7":[ax] "=r"(a7): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000195c:	00088313          	mv	t1,a7
    80001960:	f8643c23          	sd	t1,-104(s0)

	if (scause == 0x09 || scause == 0x08) {
    80001964:	fe843703          	ld	a4,-24(s0)
    80001968:	00900793          	li	a5,9
    8000196c:	00f70863          	beq	a4,a5,8000197c <interruptRoutine+0x80>
    80001970:	fe843703          	ld	a4,-24(s0)
    80001974:	00800793          	li	a5,8
    80001978:	18f71a63          	bne	a4,a5,80001b0c <interruptRoutine+0x210>
		//prekid zbog poziva ecall
		uint64 opCode = a0;
    8000197c:	fd043783          	ld	a5,-48(s0)
    80001980:	f8f43823          	sd	a5,-112(s0)
		switch (opCode) {
    80001984:	f9043703          	ld	a4,-112(s0)
    80001988:	04200793          	li	a5,66
    8000198c:	10e7e463          	bltu	a5,a4,80001a94 <interruptRoutine+0x198>
    80001990:	f9043783          	ld	a5,-112(s0)
    80001994:	00279713          	slli	a4,a5,0x2
    80001998:	00003797          	auipc	a5,0x3
    8000199c:	7cc78793          	addi	a5,a5,1996 # 80005164 <_ZZ12printIntegermE6digits+0x144>
    800019a0:	00f707b3          	add	a5,a4,a5
    800019a4:	0007a783          	lw	a5,0(a5)
    800019a8:	0007871b          	sext.w	a4,a5
    800019ac:	00003797          	auipc	a5,0x3
    800019b0:	7b878793          	addi	a5,a5,1976 # 80005164 <_ZZ12printIntegermE6digits+0x144>
    800019b4:	00f707b3          	add	a5,a4,a5
    800019b8:	00078067          	jr	a5
			case 0x01:
				//mem_alloc
				size_t size;
				size = (size_t)a1;
    800019bc:	fc843783          	ld	a5,-56(s0)
    800019c0:	f6f43023          	sd	a5,-160(s0)
				//__asm__ volatile("mv %[size], a1":[size] "=r"(size));
				size = size * MEM_BLOCK_SIZE;
    800019c4:	f6043783          	ld	a5,-160(s0)
    800019c8:	00679793          	slli	a5,a5,0x6
    800019cc:	f6f43023          	sd	a5,-160(s0)
				MemoryAllocator::kmalloc(size);
    800019d0:	f6043503          	ld	a0,-160(s0)
    800019d4:	00000097          	auipc	ra,0x0
    800019d8:	4f8080e7          	jalr	1272(ra) # 80001ecc <_ZN15MemoryAllocator7kmallocEm>
				__asm__ volatile("sd a0, 80(s0)");
    800019dc:	04a43823          	sd	a0,80(s0)
				break;
    800019e0:	1100006f          	j	80001af0 <interruptRoutine+0x1f4>
			case 0x02:
				//mem_free
				void* ptr;
				ptr = (void*)a1;
    800019e4:	fc843783          	ld	a5,-56(s0)
    800019e8:	f6f43423          	sd	a5,-152(s0)
				//__asm__ volatile("mv %[ptr], a1" :[ptr]"=r"(ptr));
				MemoryAllocator::kfree(ptr);
    800019ec:	f6843503          	ld	a0,-152(s0)
    800019f0:	00000097          	auipc	ra,0x0
    800019f4:	684080e7          	jalr	1668(ra) # 80002074 <_ZN15MemoryAllocator5kfreeEPv>
				__asm__ volatile("sd a0, 80(s0)");
    800019f8:	04a43823          	sd	a0,80(s0)
				break;
    800019fc:	0f40006f          	j	80001af0 <interruptRoutine+0x1f4>
			case 0x11:
				//thread_create
				thread_t* handle;
				handle = (thread_t*)a1;
    80001a00:	fc843783          	ld	a5,-56(s0)
    80001a04:	f8f43423          	sd	a5,-120(s0)
				void (* function)(void*);
				function = (void (*)(void*))a2;
    80001a08:	fc043783          	ld	a5,-64(s0)
    80001a0c:	f8f43023          	sd	a5,-128(s0)
				void* args;
				args = (void*)a3;
    80001a10:	fb843783          	ld	a5,-72(s0)
    80001a14:	f6f43c23          	sd	a5,-136(s0)
				uint64* sp;
				sp = (uint64*)a4;
    80001a18:	fb043783          	ld	a5,-80(s0)
    80001a1c:	f6f43823          	sd	a5,-144(s0)

				*handle = TCB::createThread(function, args, sp);
    80001a20:	f7043603          	ld	a2,-144(s0)
    80001a24:	f7843583          	ld	a1,-136(s0)
    80001a28:	f8043503          	ld	a0,-128(s0)
    80001a2c:	00000097          	auipc	ra,0x0
    80001a30:	398080e7          	jalr	920(ra) # 80001dc4 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80001a34:	00050713          	mv	a4,a0
    80001a38:	f8843783          	ld	a5,-120(s0)
    80001a3c:	00e7b023          	sd	a4,0(a5)
				if (*handle != nullptr) {
    80001a40:	f8843783          	ld	a5,-120(s0)
    80001a44:	0007b783          	ld	a5,0(a5)
    80001a48:	00078663          	beqz	a5,80001a54 <interruptRoutine+0x158>
					__asm__ volatile("li a0, 0");
    80001a4c:	00000513          	li	a0,0
    80001a50:	0080006f          	j	80001a58 <interruptRoutine+0x15c>
				} else {
					__asm__ volatile("li a0, -1");
    80001a54:	fff00513          	li	a0,-1
				}
				__asm__ volatile("sd a0, 80(s0)");
    80001a58:	04a43823          	sd	a0,80(s0)
				break;
    80001a5c:	0940006f          	j	80001af0 <interruptRoutine+0x1f4>
			case 0x12:
				//thread_exit
				TCB::running->setFinished(true);
    80001a60:	00004797          	auipc	a5,0x4
    80001a64:	1907b783          	ld	a5,400(a5) # 80005bf0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80001a68:	0007b783          	ld	a5,0(a5)
    80001a6c:	00100593          	li	a1,1
    80001a70:	00078513          	mv	a0,a5
    80001a74:	00000097          	auipc	ra,0x0
    80001a78:	154080e7          	jalr	340(ra) # 80001bc8 <_ZN3TCB11setFinishedEb>
				TCB::yield();
    80001a7c:	00000097          	auipc	ra,0x0
    80001a80:	2e4080e7          	jalr	740(ra) # 80001d60 <_ZN3TCB5yieldEv>
				break;
    80001a84:	06c0006f          	j	80001af0 <interruptRoutine+0x1f4>
			case 0x13:
				//thread_dispatch
				TCB::yield();
    80001a88:	00000097          	auipc	ra,0x0
    80001a8c:	2d8080e7          	jalr	728(ra) # 80001d60 <_ZN3TCB5yieldEv>
				break;
    80001a90:	0600006f          	j	80001af0 <interruptRoutine+0x1f4>
				break;
			case 0x42:
				//putc
				break;
			default:
				printString("\nNepostojeci op code: ");
    80001a94:	00003517          	auipc	a0,0x3
    80001a98:	67450513          	addi	a0,a0,1652 # 80005108 <_ZZ12printIntegermE6digits+0xe8>
    80001a9c:	00000097          	auipc	ra,0x0
    80001aa0:	998080e7          	jalr	-1640(ra) # 80001434 <_Z11printStringPKc>
				printInteger(opCode);
    80001aa4:	f9043503          	ld	a0,-112(s0)
    80001aa8:	00000097          	auipc	ra,0x0
    80001aac:	a04080e7          	jalr	-1532(ra) # 800014ac <_Z12printIntegerm>
				printString("\nscause: ");
    80001ab0:	00003517          	auipc	a0,0x3
    80001ab4:	67050513          	addi	a0,a0,1648 # 80005120 <_ZZ12printIntegermE6digits+0x100>
    80001ab8:	00000097          	auipc	ra,0x0
    80001abc:	97c080e7          	jalr	-1668(ra) # 80001434 <_Z11printStringPKc>
				printInteger(scause);
    80001ac0:	fe843503          	ld	a0,-24(s0)
    80001ac4:	00000097          	auipc	ra,0x0
    80001ac8:	9e8080e7          	jalr	-1560(ra) # 800014ac <_Z12printIntegerm>
				printString("\nsepc: ");
    80001acc:	00003517          	auipc	a0,0x3
    80001ad0:	66450513          	addi	a0,a0,1636 # 80005130 <_ZZ12printIntegermE6digits+0x110>
    80001ad4:	00000097          	auipc	ra,0x0
    80001ad8:	960080e7          	jalr	-1696(ra) # 80001434 <_Z11printStringPKc>
				printInteger(sepc);
    80001adc:	fe043503          	ld	a0,-32(s0)
    80001ae0:	00000097          	auipc	ra,0x0
    80001ae4:	9cc080e7          	jalr	-1588(ra) # 800014ac <_Z12printIntegerm>
				break;
    80001ae8:	0080006f          	j	80001af0 <interruptRoutine+0x1f4>
				break;
    80001aec:	00000013          	nop
		}
		//sepc pokazuje na ecall instrukciju, treba preci na sledecu instrukciju
		//sepc += 4;
		__asm__ volatile("addi %[dst], %[src], 0x4":[dst]"=r"(sepc):[src]"r"(
				sepc):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001af0:	fe043303          	ld	t1,-32(s0)
    80001af4:	00430313          	addi	t1,t1,4
    80001af8:	fe643023          	sd	t1,-32(s0)
		__asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001afc:	fe043303          	ld	t1,-32(s0)
    80001b00:	14131073          	csrw	sepc,t1
    80001b04:	00000013          	nop
		printString("scause: ");
		printInteger(scause);
		printString("\nsepc: ");
		printInteger(sepc);
	}
}
    80001b08:	0900006f          	j	80001b98 <interruptRoutine+0x29c>
	} else if (scause == (1UL << 63 | 9)) {
    80001b0c:	fe843703          	ld	a4,-24(s0)
    80001b10:	fff00793          	li	a5,-1
    80001b14:	03f79793          	slli	a5,a5,0x3f
    80001b18:	00978793          	addi	a5,a5,9
    80001b1c:	00f71863          	bne	a4,a5,80001b2c <interruptRoutine+0x230>
		console_handler();
    80001b20:	00003097          	auipc	ra,0x3
    80001b24:	8c0080e7          	jalr	-1856(ra) # 800043e0 <console_handler>
}
    80001b28:	0700006f          	j	80001b98 <interruptRoutine+0x29c>
	} else if (scause == (1UL << 63 | 1)) {
    80001b2c:	fe843703          	ld	a4,-24(s0)
    80001b30:	fff00793          	li	a5,-1
    80001b34:	03f79793          	slli	a5,a5,0x3f
    80001b38:	00178793          	addi	a5,a5,1
    80001b3c:	00f71a63          	bne	a4,a5,80001b50 <interruptRoutine+0x254>
		Riscv::mc_sip(Riscv::SIP_SSIP);
    80001b40:	00200513          	li	a0,2
    80001b44:	00000097          	auipc	ra,0x0
    80001b48:	068080e7          	jalr	104(ra) # 80001bac <_ZN5Riscv6mc_sipEm>
}
    80001b4c:	04c0006f          	j	80001b98 <interruptRoutine+0x29c>
		println("\nGreska u prekidnoj rutini");
    80001b50:	00003517          	auipc	a0,0x3
    80001b54:	5e850513          	addi	a0,a0,1512 # 80005138 <_ZZ12printIntegermE6digits+0x118>
    80001b58:	00000097          	auipc	ra,0x0
    80001b5c:	920080e7          	jalr	-1760(ra) # 80001478 <_Z7printlnPKc>
		printString("scause: ");
    80001b60:	00003517          	auipc	a0,0x3
    80001b64:	5f850513          	addi	a0,a0,1528 # 80005158 <_ZZ12printIntegermE6digits+0x138>
    80001b68:	00000097          	auipc	ra,0x0
    80001b6c:	8cc080e7          	jalr	-1844(ra) # 80001434 <_Z11printStringPKc>
		printInteger(scause);
    80001b70:	fe843503          	ld	a0,-24(s0)
    80001b74:	00000097          	auipc	ra,0x0
    80001b78:	938080e7          	jalr	-1736(ra) # 800014ac <_Z12printIntegerm>
		printString("\nsepc: ");
    80001b7c:	00003517          	auipc	a0,0x3
    80001b80:	5b450513          	addi	a0,a0,1460 # 80005130 <_ZZ12printIntegermE6digits+0x110>
    80001b84:	00000097          	auipc	ra,0x0
    80001b88:	8b0080e7          	jalr	-1872(ra) # 80001434 <_Z11printStringPKc>
		printInteger(sepc);
    80001b8c:	fe043503          	ld	a0,-32(s0)
    80001b90:	00000097          	auipc	ra,0x0
    80001b94:	91c080e7          	jalr	-1764(ra) # 800014ac <_Z12printIntegerm>
}
    80001b98:	00000013          	nop
    80001b9c:	09813083          	ld	ra,152(sp)
    80001ba0:	09013403          	ld	s0,144(sp)
    80001ba4:	0a010113          	addi	sp,sp,160
    80001ba8:	00008067          	ret

0000000080001bac <_ZN5Riscv6mc_sipEm>:
inline void Riscv::mc_sip(uint64 mask) {
    80001bac:	ff010113          	addi	sp,sp,-16
    80001bb0:	00813423          	sd	s0,8(sp)
    80001bb4:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sip, %[mask]": :[mask] "r"(mask));
    80001bb8:	14453073          	csrc	sip,a0
}
    80001bbc:	00813403          	ld	s0,8(sp)
    80001bc0:	01010113          	addi	sp,sp,16
    80001bc4:	00008067          	ret

0000000080001bc8 <_ZN3TCB11setFinishedEb>:

	void setFinished(bool finish) { this->finished = finish; }
    80001bc8:	ff010113          	addi	sp,sp,-16
    80001bcc:	00813423          	sd	s0,8(sp)
    80001bd0:	01010413          	addi	s0,sp,16
    80001bd4:	02b50823          	sb	a1,48(a0)
    80001bd8:	00813403          	ld	s0,8(sp)
    80001bdc:	01010113          	addi	sp,sp,16
    80001be0:	00008067          	ret

0000000080001be4 <_Znwm>:
// Created by os on 5/29/23.
//
#include "../h/syscall_cpp.hpp"

//override globalnog new
void* operator new(size_t size) {
    80001be4:	ff010113          	addi	sp,sp,-16
    80001be8:	00113423          	sd	ra,8(sp)
    80001bec:	00813023          	sd	s0,0(sp)
    80001bf0:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    80001bf4:	fffff097          	auipc	ra,0xfffff
    80001bf8:	630080e7          	jalr	1584(ra) # 80001224 <_Z9mem_allocm>
}
    80001bfc:	00813083          	ld	ra,8(sp)
    80001c00:	00013403          	ld	s0,0(sp)
    80001c04:	01010113          	addi	sp,sp,16
    80001c08:	00008067          	ret

0000000080001c0c <_Znam>:

void* operator new[](size_t size) {
    80001c0c:	ff010113          	addi	sp,sp,-16
    80001c10:	00113423          	sd	ra,8(sp)
    80001c14:	00813023          	sd	s0,0(sp)
    80001c18:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    80001c1c:	fffff097          	auipc	ra,0xfffff
    80001c20:	608080e7          	jalr	1544(ra) # 80001224 <_Z9mem_allocm>
}
    80001c24:	00813083          	ld	ra,8(sp)
    80001c28:	00013403          	ld	s0,0(sp)
    80001c2c:	01010113          	addi	sp,sp,16
    80001c30:	00008067          	ret

0000000080001c34 <_ZdlPv>:

void operator delete(void* ptr)noexcept {
    80001c34:	ff010113          	addi	sp,sp,-16
    80001c38:	00113423          	sd	ra,8(sp)
    80001c3c:	00813023          	sd	s0,0(sp)
    80001c40:	01010413          	addi	s0,sp,16
mem_free(ptr);
    80001c44:	fffff097          	auipc	ra,0xfffff
    80001c48:	620080e7          	jalr	1568(ra) # 80001264 <_Z8mem_freePv>
}
    80001c4c:	00813083          	ld	ra,8(sp)
    80001c50:	00013403          	ld	s0,0(sp)
    80001c54:	01010113          	addi	sp,sp,16
    80001c58:	00008067          	ret

0000000080001c5c <_ZdaPv>:

void operator delete[](void* ptr)noexcept {
    80001c5c:	ff010113          	addi	sp,sp,-16
    80001c60:	00113423          	sd	ra,8(sp)
    80001c64:	00813023          	sd	s0,0(sp)
    80001c68:	01010413          	addi	s0,sp,16
mem_free(ptr);
    80001c6c:	fffff097          	auipc	ra,0xfffff
    80001c70:	5f8080e7          	jalr	1528(ra) # 80001264 <_Z8mem_freePv>
    80001c74:	00813083          	ld	ra,8(sp)
    80001c78:	00013403          	ld	s0,0(sp)
    80001c7c:	01010113          	addi	sp,sp,16
    80001c80:	00008067          	ret

0000000080001c84 <_ZN3TCB7wrapperEv>:
	Riscv::pushRegisters();
	TCB::dispatch();
	Riscv::popRegisters();
}

void TCB::wrapper() {
    80001c84:	ff010113          	addi	sp,sp,-16
    80001c88:	00113423          	sd	ra,8(sp)
    80001c8c:	00813023          	sd	s0,0(sp)
    80001c90:	01010413          	addi	s0,sp,16
	//pocetak wrappera se izvrsava u supervisor modu,
	//jer nismo izasli iz prekidne rutine prilikom promene konteksta (dispatch/yield)
	Riscv::popSppSpie();
    80001c94:	00000097          	auipc	ra,0x0
    80001c98:	218080e7          	jalr	536(ra) # 80001eac <_ZN5Riscv10popSppSpieEv>
	//na dalje se izvrsavamo u user modu
	running->threadFunction(running->args);
    80001c9c:	00004797          	auipc	a5,0x4
    80001ca0:	fc47b783          	ld	a5,-60(a5) # 80005c60 <_ZN3TCB7runningE>
    80001ca4:	0107b703          	ld	a4,16(a5)
    80001ca8:	0207b503          	ld	a0,32(a5)
    80001cac:	000700e7          	jalr	a4
	//running->finished = true;
	//i dalje smo u user modu, moramo promenu niti vrsiti sistemskim pozivom
	thread_exit();
    80001cb0:	fffff097          	auipc	ra,0xfffff
    80001cb4:	664080e7          	jalr	1636(ra) # 80001314 <_Z11thread_exitv>
}
    80001cb8:	00813083          	ld	ra,8(sp)
    80001cbc:	00013403          	ld	s0,0(sp)
    80001cc0:	01010113          	addi	sp,sp,16
    80001cc4:	00008067          	ret

0000000080001cc8 <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    80001cc8:	fe010113          	addi	sp,sp,-32
    80001ccc:	00113c23          	sd	ra,24(sp)
    80001cd0:	00813823          	sd	s0,16(sp)
    80001cd4:	00913423          	sd	s1,8(sp)
    80001cd8:	02010413          	addi	s0,sp,32
	TCB* old = TCB::running;
    80001cdc:	00004497          	auipc	s1,0x4
    80001ce0:	f844b483          	ld	s1,-124(s1) # 80005c60 <_ZN3TCB7runningE>
	if (!old->finished && !old->blocked) {
    80001ce4:	0304c783          	lbu	a5,48(s1)
    80001ce8:	00079663          	bnez	a5,80001cf4 <_ZN3TCB8dispatchEv+0x2c>
    80001cec:	0314c783          	lbu	a5,49(s1)
    80001cf0:	04078a63          	beqz	a5,80001d44 <_ZN3TCB8dispatchEv+0x7c>
	TCB::running = Scheduler::get();
    80001cf4:	00000097          	auipc	ra,0x0
    80001cf8:	88c080e7          	jalr	-1908(ra) # 80001580 <_ZN9Scheduler3getEv>
    80001cfc:	00050593          	mv	a1,a0
    80001d00:	00004797          	auipc	a5,0x4
    80001d04:	f6078793          	addi	a5,a5,-160 # 80005c60 <_ZN3TCB7runningE>
    80001d08:	00a7b023          	sd	a0,0(a5)
	TCB::runningTimeSlice = 0;
    80001d0c:	0007b423          	sd	zero,8(a5)
	if (TCB::running->threadFunction == nullptr) {
    80001d10:	01053783          	ld	a5,16(a0)
    80001d14:	04078063          	beqz	a5,80001d54 <_ZN3TCB8dispatchEv+0x8c>
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80001d18:	10000793          	li	a5,256
    80001d1c:	1007b073          	csrc	sstatus,a5
	if (old != TCB::running) TCB::contextSwitch(&old->context, &running->context);
    80001d20:	00b48863          	beq	s1,a1,80001d30 <_ZN3TCB8dispatchEv+0x68>
    80001d24:	00048513          	mv	a0,s1
    80001d28:	fffff097          	auipc	ra,0xfffff
    80001d2c:	4e8080e7          	jalr	1256(ra) # 80001210 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80001d30:	01813083          	ld	ra,24(sp)
    80001d34:	01013403          	ld	s0,16(sp)
    80001d38:	00813483          	ld	s1,8(sp)
    80001d3c:	02010113          	addi	sp,sp,32
    80001d40:	00008067          	ret
		Scheduler::put(old);
    80001d44:	00048513          	mv	a0,s1
    80001d48:	fffff097          	auipc	ra,0xfffff
    80001d4c:	7f4080e7          	jalr	2036(ra) # 8000153c <_ZN9Scheduler3putEP3TCB>
    80001d50:	fa5ff06f          	j	80001cf4 <_ZN3TCB8dispatchEv+0x2c>
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80001d54:	10000793          	li	a5,256
    80001d58:	1007a073          	csrs	sstatus,a5
}
    80001d5c:	fc5ff06f          	j	80001d20 <_ZN3TCB8dispatchEv+0x58>

0000000080001d60 <_ZN3TCB5yieldEv>:
void TCB::yield() {
    80001d60:	ff010113          	addi	sp,sp,-16
    80001d64:	00113423          	sd	ra,8(sp)
    80001d68:	00813023          	sd	s0,0(sp)
    80001d6c:	01010413          	addi	s0,sp,16
	Riscv::pushRegisters();
    80001d70:	fffff097          	auipc	ra,0xfffff
    80001d74:	290080e7          	jalr	656(ra) # 80001000 <_ZN5Riscv13pushRegistersEv>
	TCB::dispatch();
    80001d78:	00000097          	auipc	ra,0x0
    80001d7c:	f50080e7          	jalr	-176(ra) # 80001cc8 <_ZN3TCB8dispatchEv>
	Riscv::popRegisters();
    80001d80:	fffff097          	auipc	ra,0xfffff
    80001d84:	2fc080e7          	jalr	764(ra) # 8000107c <_ZN5Riscv12popRegistersEv>
}
    80001d88:	00813083          	ld	ra,8(sp)
    80001d8c:	00013403          	ld	s0,0(sp)
    80001d90:	01010113          	addi	sp,sp,16
    80001d94:	00008067          	ret

0000000080001d98 <_ZN3TCBnwEm>:

void* TCB::operator new(size_t size) {
    80001d98:	ff010113          	addi	sp,sp,-16
    80001d9c:	00113423          	sd	ra,8(sp)
    80001da0:	00813023          	sd	s0,0(sp)
    80001da4:	01010413          	addi	s0,sp,16
	return MemoryAllocator::kmalloc(size + sizeof(MemoryAllocator::UsedMemSegment));
    80001da8:	01050513          	addi	a0,a0,16
    80001dac:	00000097          	auipc	ra,0x0
    80001db0:	120080e7          	jalr	288(ra) # 80001ecc <_ZN15MemoryAllocator7kmallocEm>
}
    80001db4:	00813083          	ld	ra,8(sp)
    80001db8:	00013403          	ld	s0,0(sp)
    80001dbc:	01010113          	addi	sp,sp,16
    80001dc0:	00008067          	ret

0000000080001dc4 <_ZN3TCB12createThreadEPFvPvES0_Pm>:
TCB* TCB::createThread(TCB::Body function, void* args, uint64* stack) {
    80001dc4:	fd010113          	addi	sp,sp,-48
    80001dc8:	02113423          	sd	ra,40(sp)
    80001dcc:	02813023          	sd	s0,32(sp)
    80001dd0:	00913c23          	sd	s1,24(sp)
    80001dd4:	01213823          	sd	s2,16(sp)
    80001dd8:	01313423          	sd	s3,8(sp)
    80001ddc:	01413023          	sd	s4,0(sp)
    80001de0:	03010413          	addi	s0,sp,48
    80001de4:	00050993          	mv	s3,a0
    80001de8:	00058a13          	mv	s4,a1
    80001dec:	00060913          	mv	s2,a2
	TCB* newThread = new TCB(function, args, stack);
    80001df0:	04000513          	li	a0,64
    80001df4:	00000097          	auipc	ra,0x0
    80001df8:	fa4080e7          	jalr	-92(ra) # 80001d98 <_ZN3TCBnwEm>
    80001dfc:	00050493          	mv	s1,a0
	bool blocked;            //da li je nit blokirana
	TCB* nextInScheduler;    // pokazivac na sledecu nit u Scheduler-u

	TCB(Body function, void* args, uint64* stack) : threadFunction(function), stack(stack), args(args),
													timeSlice(DEFAULT_TIME_SLICE), finished(false), blocked(false),
													nextInScheduler(nullptr) {
    80001e00:	01353823          	sd	s3,16(a0)
    80001e04:	01253c23          	sd	s2,24(a0)
    80001e08:	03453023          	sd	s4,32(a0)
    80001e0c:	00200793          	li	a5,2
    80001e10:	02f53423          	sd	a5,40(a0)
    80001e14:	02050823          	sb	zero,48(a0)
    80001e18:	020508a3          	sb	zero,49(a0)
    80001e1c:	02053c23          	sd	zero,56(a0)
		//formiranje pocetnog konteksta; specijalni uslovi za main funkciju kojoj se pocetni kontekst automatski formira
		uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
    80001e20:	04098a63          	beqz	s3,80001e74 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xb0>
    80001e24:	00000797          	auipc	a5,0x0
    80001e28:	e6078793          	addi	a5,a5,-416 # 80001c84 <_ZN3TCB7wrapperEv>
		uint64 startSp = stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0;
    80001e2c:	04090863          	beqz	s2,80001e7c <_ZN3TCB12createThreadEPFvPvES0_Pm+0xb8>
    80001e30:	00008637          	lui	a2,0x8
    80001e34:	00c90933          	add	s2,s2,a2
		this->context.ra = startRa;
    80001e38:	00f4b023          	sd	a5,0(s1)
		this->context.sp = startSp;
    80001e3c:	0124b423          	sd	s2,8(s1)
	if (function != nullptr) Scheduler::put(newThread);
    80001e40:	00098863          	beqz	s3,80001e50 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x8c>
    80001e44:	00048513          	mv	a0,s1
    80001e48:	fffff097          	auipc	ra,0xfffff
    80001e4c:	6f4080e7          	jalr	1780(ra) # 8000153c <_ZN9Scheduler3putEP3TCB>
}
    80001e50:	00048513          	mv	a0,s1
    80001e54:	02813083          	ld	ra,40(sp)
    80001e58:	02013403          	ld	s0,32(sp)
    80001e5c:	01813483          	ld	s1,24(sp)
    80001e60:	01013903          	ld	s2,16(sp)
    80001e64:	00813983          	ld	s3,8(sp)
    80001e68:	00013a03          	ld	s4,0(sp)
    80001e6c:	03010113          	addi	sp,sp,48
    80001e70:	00008067          	ret
		uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
    80001e74:	00000793          	li	a5,0
    80001e78:	fb5ff06f          	j	80001e2c <_ZN3TCB12createThreadEPFvPvES0_Pm+0x68>
		uint64 startSp = stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0;
    80001e7c:	00000913          	li	s2,0
    80001e80:	fb9ff06f          	j	80001e38 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x74>

0000000080001e84 <_ZN3TCBdlEPv>:

void TCB::operator delete(void* ptr) {
    80001e84:	ff010113          	addi	sp,sp,-16
    80001e88:	00113423          	sd	ra,8(sp)
    80001e8c:	00813023          	sd	s0,0(sp)
    80001e90:	01010413          	addi	s0,sp,16
	MemoryAllocator::kfree(ptr);
    80001e94:	00000097          	auipc	ra,0x0
    80001e98:	1e0080e7          	jalr	480(ra) # 80002074 <_ZN15MemoryAllocator5kfreeEPv>
}
    80001e9c:	00813083          	ld	ra,8(sp)
    80001ea0:	00013403          	ld	s0,0(sp)
    80001ea4:	01010113          	addi	sp,sp,16
    80001ea8:	00008067          	ret

0000000080001eac <_ZN5Riscv10popSppSpieEv>:
// Created by os on 5/17/23.
//

#include "../h/Riscv.hpp"

void Riscv::popSppSpie() {
    80001eac:	ff010113          	addi	sp,sp,-16
    80001eb0:	00813423          	sd	s0,8(sp)
    80001eb4:	01010413          	addi	s0,sp,16
	//ra pokazuje iza ove funkcije na nastavak wrappera
	__asm__ volatile("csrw sepc, ra");
    80001eb8:	14109073          	csrw	sepc,ra
	__asm__ volatile("sret");
    80001ebc:	10200073          	sret
    80001ec0:	00813403          	ld	s0,8(sp)
    80001ec4:	01010113          	addi	sp,sp,16
    80001ec8:	00008067          	ret

0000000080001ecc <_ZN15MemoryAllocator7kmallocEm>:

bool MemoryAllocator::initialized = false;
MemoryAllocator::FreeMemSegment* MemoryAllocator::freeMemHead = nullptr;
MemoryAllocator::UsedMemSegment* MemoryAllocator::usedMemHead = nullptr;

void* MemoryAllocator::kmalloc(size_t size) {
    80001ecc:	ff010113          	addi	sp,sp,-16
    80001ed0:	00813423          	sd	s0,8(sp)
    80001ed4:	01010413          	addi	s0,sp,16
	if (size <= 0) return nullptr;
    80001ed8:	12050663          	beqz	a0,80002004 <_ZN15MemoryAllocator7kmallocEm+0x138>

	//pocetna inicijalizacija
	if (!initialized) {
    80001edc:	00004797          	auipc	a5,0x4
    80001ee0:	d947c783          	lbu	a5,-620(a5) # 80005c70 <_ZN15MemoryAllocator11initializedE>
    80001ee4:	04079863          	bnez	a5,80001f34 <_ZN15MemoryAllocator7kmallocEm+0x68>
		freeMemHead = (FreeMemSegment*)HEAP_START_ADDR;
    80001ee8:	00004617          	auipc	a2,0x4
    80001eec:	cf863603          	ld	a2,-776(a2) # 80005be0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001ef0:	00063783          	ld	a5,0(a2)
    80001ef4:	00004717          	auipc	a4,0x4
    80001ef8:	d7c70713          	addi	a4,a4,-644 # 80005c70 <_ZN15MemoryAllocator11initializedE>
    80001efc:	00f73423          	sd	a5,8(a4)
		freeMemHead->next = nullptr;
    80001f00:	0007b023          	sd	zero,0(a5)
		freeMemHead->prev = nullptr;
    80001f04:	00873683          	ld	a3,8(a4)
    80001f08:	0006b423          	sd	zero,8(a3)
		freeMemHead->size = (char*)HEAP_END_ADDR - (char*)HEAP_START_ADDR - sizeof(FreeMemSegment);
    80001f0c:	00004797          	auipc	a5,0x4
    80001f10:	cec7b783          	ld	a5,-788(a5) # 80005bf8 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001f14:	0007b783          	ld	a5,0(a5)
    80001f18:	00063603          	ld	a2,0(a2)
    80001f1c:	40c787b3          	sub	a5,a5,a2
    80001f20:	fe878793          	addi	a5,a5,-24
    80001f24:	00f6b823          	sd	a5,16(a3)
		usedMemHead = nullptr;
    80001f28:	00073823          	sd	zero,16(a4)

		initialized = true;
    80001f2c:	00100793          	li	a5,1
    80001f30:	00f70023          	sb	a5,0(a4)
	}

	//alokacija uvek zaokruzena na blokove
	//size += sizeof(UsedMemSegment); ;prebaceno u mem_alloc
	size_t blocks = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
    80001f34:	00655793          	srli	a5,a0,0x6
    80001f38:	03f57513          	andi	a0,a0,63
    80001f3c:	00050463          	beqz	a0,80001f44 <_ZN15MemoryAllocator7kmallocEm+0x78>
    80001f40:	00100513          	li	a0,1
    80001f44:	00a78533          	add	a0,a5,a0
	size = blocks * MEM_BLOCK_SIZE;
    80001f48:	00651793          	slli	a5,a0,0x6

	//trazenje slobodnog segmenta po first-fit algoritmu
	for (FreeMemSegment* current = freeMemHead; current; current = current->next) {
    80001f4c:	00004517          	auipc	a0,0x4
    80001f50:	d2c53503          	ld	a0,-724(a0) # 80005c78 <_ZN15MemoryAllocator11freeMemHeadE>
    80001f54:	08050a63          	beqz	a0,80001fe8 <_ZN15MemoryAllocator7kmallocEm+0x11c>
		if (current->size < size) continue;
    80001f58:	01053703          	ld	a4,16(a0)
    80001f5c:	06f76263          	bltu	a4,a5,80001fc0 <_ZN15MemoryAllocator7kmallocEm+0xf4>

		//pravljenje novog slobodnog fragmenta od ostatka fragmenta
		FreeMemSegment* remainderFree = (FreeMemSegment*)((char*)current + size);
    80001f60:	00f506b3          	add	a3,a0,a5
		remainderFree->size = current->size - size;
    80001f64:	40f70733          	sub	a4,a4,a5
    80001f68:	00e6b823          	sd	a4,16(a3)
		remainderFree->prev = current->prev;
    80001f6c:	00853703          	ld	a4,8(a0)
    80001f70:	00e6b423          	sd	a4,8(a3)
		if (current->prev) current->prev->next = remainderFree;
    80001f74:	00070463          	beqz	a4,80001f7c <_ZN15MemoryAllocator7kmallocEm+0xb0>
    80001f78:	00d73023          	sd	a3,0(a4)
		remainderFree->next = current->next;
    80001f7c:	00053703          	ld	a4,0(a0)
    80001f80:	00e6b023          	sd	a4,0(a3)
		if (current->next) current->next->prev = remainderFree;
    80001f84:	00070463          	beqz	a4,80001f8c <_ZN15MemoryAllocator7kmallocEm+0xc0>
    80001f88:	00d73423          	sd	a3,8(a4)
		if (freeMemHead == current) freeMemHead = remainderFree;
    80001f8c:	00004717          	auipc	a4,0x4
    80001f90:	cec73703          	ld	a4,-788(a4) # 80005c78 <_ZN15MemoryAllocator11freeMemHeadE>
    80001f94:	02a70a63          	beq	a4,a0,80001fc8 <_ZN15MemoryAllocator7kmallocEm+0xfc>

		//ubacivanje novog fragmenta u listu zauzetih fragmenata
		UsedMemSegment* newFragment = (UsedMemSegment*)current;
		newFragment->size = size;
    80001f98:	00f53423          	sd	a5,8(a0)
		UsedMemSegment* prevUsed = nullptr;
		for (UsedMemSegment* cur = usedMemHead; cur && cur < newFragment; prevUsed = cur, cur = cur->next);
    80001f9c:	00004697          	auipc	a3,0x4
    80001fa0:	ce46b683          	ld	a3,-796(a3) # 80005c80 <_ZN15MemoryAllocator11usedMemHeadE>
    80001fa4:	00068793          	mv	a5,a3
		UsedMemSegment* prevUsed = nullptr;
    80001fa8:	00000713          	li	a4,0
		for (UsedMemSegment* cur = usedMemHead; cur && cur < newFragment; prevUsed = cur, cur = cur->next);
    80001fac:	02078463          	beqz	a5,80001fd4 <_ZN15MemoryAllocator7kmallocEm+0x108>
    80001fb0:	02a7f263          	bgeu	a5,a0,80001fd4 <_ZN15MemoryAllocator7kmallocEm+0x108>
    80001fb4:	00078713          	mv	a4,a5
    80001fb8:	0007b783          	ld	a5,0(a5)
    80001fbc:	ff1ff06f          	j	80001fac <_ZN15MemoryAllocator7kmallocEm+0xe0>
	for (FreeMemSegment* current = freeMemHead; current; current = current->next) {
    80001fc0:	00053503          	ld	a0,0(a0)
    80001fc4:	f91ff06f          	j	80001f54 <_ZN15MemoryAllocator7kmallocEm+0x88>
		if (freeMemHead == current) freeMemHead = remainderFree;
    80001fc8:	00004717          	auipc	a4,0x4
    80001fcc:	cad73823          	sd	a3,-848(a4) # 80005c78 <_ZN15MemoryAllocator11freeMemHeadE>
    80001fd0:	fc9ff06f          	j	80001f98 <_ZN15MemoryAllocator7kmallocEm+0xcc>
		if (!prevUsed) {
    80001fd4:	02070063          	beqz	a4,80001ff4 <_ZN15MemoryAllocator7kmallocEm+0x128>
			newFragment->next = usedMemHead;
			usedMemHead = newFragment;
		} else {
			newFragment->next = prevUsed->next;
    80001fd8:	00073783          	ld	a5,0(a4)
    80001fdc:	00f53023          	sd	a5,0(a0)
			prevUsed->next = newFragment;
    80001fe0:	00a73023          	sd	a0,0(a4)
		}
		return (char*)newFragment + sizeof(UsedMemSegment);
    80001fe4:	01050513          	addi	a0,a0,16
	}
	return nullptr;
}
    80001fe8:	00813403          	ld	s0,8(sp)
    80001fec:	01010113          	addi	sp,sp,16
    80001ff0:	00008067          	ret
			newFragment->next = usedMemHead;
    80001ff4:	00d53023          	sd	a3,0(a0)
			usedMemHead = newFragment;
    80001ff8:	00004797          	auipc	a5,0x4
    80001ffc:	c8a7b423          	sd	a0,-888(a5) # 80005c80 <_ZN15MemoryAllocator11usedMemHeadE>
    80002000:	fe5ff06f          	j	80001fe4 <_ZN15MemoryAllocator7kmallocEm+0x118>
	if (size <= 0) return nullptr;
    80002004:	00000513          	li	a0,0
    80002008:	fe1ff06f          	j	80001fe8 <_ZN15MemoryAllocator7kmallocEm+0x11c>

000000008000200c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>:
	tryToJoin(newFree);
	tryToJoin(prevFree);
	return 0;
}

int MemoryAllocator::tryToJoin(MemoryAllocator::FreeMemSegment* current) {
    8000200c:	ff010113          	addi	sp,sp,-16
    80002010:	00813423          	sd	s0,8(sp)
    80002014:	01010413          	addi	s0,sp,16
	if (!current) return 0;
    80002018:	04050663          	beqz	a0,80002064 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x58>
	bool nextExists = current->next != nullptr;
    8000201c:	00053783          	ld	a5,0(a0)
	char* nextAddr = (char*)current + current->size;
    80002020:	01053703          	ld	a4,16(a0)
    80002024:	00e506b3          	add	a3,a0,a4
	char* cnext = (char*)current->next;
	bool nextIsConnected = (nextAddr == cnext);
	if (nextExists && nextIsConnected) {
    80002028:	04078263          	beqz	a5,8000206c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x60>
    8000202c:	00d78a63          	beq	a5,a3,80002040 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x34>
		current->size += current->next->size;
		current->next = current->next->next;
		if (current->next) current->next->prev = current;
		return 1;
	} else return 0;
    80002030:	00000513          	li	a0,0
}
    80002034:	00813403          	ld	s0,8(sp)
    80002038:	01010113          	addi	sp,sp,16
    8000203c:	00008067          	ret
		current->size += current->next->size;
    80002040:	0107b683          	ld	a3,16(a5)
    80002044:	00d70733          	add	a4,a4,a3
    80002048:	00e53823          	sd	a4,16(a0)
		current->next = current->next->next;
    8000204c:	0007b783          	ld	a5,0(a5)
    80002050:	00f53023          	sd	a5,0(a0)
		if (current->next) current->next->prev = current;
    80002054:	00078463          	beqz	a5,8000205c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x50>
    80002058:	00a7b423          	sd	a0,8(a5)
		return 1;
    8000205c:	00100513          	li	a0,1
    80002060:	fd5ff06f          	j	80002034 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>
	if (!current) return 0;
    80002064:	00000513          	li	a0,0
    80002068:	fcdff06f          	j	80002034 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>
	} else return 0;
    8000206c:	00000513          	li	a0,0
    80002070:	fc5ff06f          	j	80002034 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>

0000000080002074 <_ZN15MemoryAllocator5kfreeEPv>:
	if (!ptr) return 0;
    80002074:	10050463          	beqz	a0,8000217c <_ZN15MemoryAllocator5kfreeEPv+0x108>
    80002078:	00050693          	mv	a3,a0
	if (!usedMemHead) return -1;
    8000207c:	00004797          	auipc	a5,0x4
    80002080:	c047b783          	ld	a5,-1020(a5) # 80005c80 <_ZN15MemoryAllocator11usedMemHeadE>
    80002084:	10078063          	beqz	a5,80002184 <_ZN15MemoryAllocator5kfreeEPv+0x110>
	ptr = (char*)ptr - sizeof(UsedMemSegment);
    80002088:	ff050513          	addi	a0,a0,-16
	UsedMemSegment* prevUsed = nullptr;
    8000208c:	00000713          	li	a4,0
	for (; currentUsed && currentUsed != ptr; prevUsed = currentUsed, currentUsed = currentUsed->next);
    80002090:	00078a63          	beqz	a5,800020a4 <_ZN15MemoryAllocator5kfreeEPv+0x30>
    80002094:	00a78863          	beq	a5,a0,800020a4 <_ZN15MemoryAllocator5kfreeEPv+0x30>
    80002098:	00078713          	mv	a4,a5
    8000209c:	0007b783          	ld	a5,0(a5)
    800020a0:	ff1ff06f          	j	80002090 <_ZN15MemoryAllocator5kfreeEPv+0x1c>
	if (currentUsed != ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    800020a4:	0ea79463          	bne	a5,a0,8000218c <_ZN15MemoryAllocator5kfreeEPv+0x118>
int MemoryAllocator::kfree(void* ptr) {
    800020a8:	fe010113          	addi	sp,sp,-32
    800020ac:	00113c23          	sd	ra,24(sp)
    800020b0:	00813823          	sd	s0,16(sp)
    800020b4:	00913423          	sd	s1,8(sp)
    800020b8:	02010413          	addi	s0,sp,32
	if (prevUsed) prevUsed->next = currentUsed->next;
    800020bc:	02070863          	beqz	a4,800020ec <_ZN15MemoryAllocator5kfreeEPv+0x78>
    800020c0:	0007b783          	ld	a5,0(a5)
    800020c4:	00f73023          	sd	a5,0(a4)
	if (!freeMemHead || ptr < (char*)freeMemHead) {
    800020c8:	00004797          	auipc	a5,0x4
    800020cc:	bb07b783          	ld	a5,-1104(a5) # 80005c78 <_ZN15MemoryAllocator11freeMemHeadE>
    800020d0:	02078663          	beqz	a5,800020fc <_ZN15MemoryAllocator5kfreeEPv+0x88>
    800020d4:	02f56863          	bltu	a0,a5,80002104 <_ZN15MemoryAllocator5kfreeEPv+0x90>
			 prevFree->next != nullptr && ptr > (char*)(prevFree->next); prevFree = prevFree->next);
    800020d8:	00078493          	mv	s1,a5
    800020dc:	0007b783          	ld	a5,0(a5)
    800020e0:	02078463          	beqz	a5,80002108 <_ZN15MemoryAllocator5kfreeEPv+0x94>
    800020e4:	fea7eae3          	bltu	a5,a0,800020d8 <_ZN15MemoryAllocator5kfreeEPv+0x64>
    800020e8:	0200006f          	j	80002108 <_ZN15MemoryAllocator5kfreeEPv+0x94>
	else usedMemHead = currentUsed->next;
    800020ec:	0007b783          	ld	a5,0(a5)
    800020f0:	00004717          	auipc	a4,0x4
    800020f4:	b8f73823          	sd	a5,-1136(a4) # 80005c80 <_ZN15MemoryAllocator11usedMemHeadE>
    800020f8:	fd1ff06f          	j	800020c8 <_ZN15MemoryAllocator5kfreeEPv+0x54>
		prevFree = nullptr;
    800020fc:	00078493          	mv	s1,a5
    80002100:	0080006f          	j	80002108 <_ZN15MemoryAllocator5kfreeEPv+0x94>
    80002104:	00000493          	li	s1,0
	size_t segmentSize = ((UsedMemSegment*)ptr)->size;
    80002108:	ff86b783          	ld	a5,-8(a3)
	newFree->size = segmentSize;
    8000210c:	00f6b023          	sd	a5,0(a3)
	newFree->prev = prevFree;
    80002110:	fe96bc23          	sd	s1,-8(a3)
	if (prevFree) newFree->next = prevFree->next;
    80002114:	04048663          	beqz	s1,80002160 <_ZN15MemoryAllocator5kfreeEPv+0xec>
    80002118:	0004b783          	ld	a5,0(s1)
    8000211c:	fef6b823          	sd	a5,-16(a3)
	if (newFree->next) newFree->next->prev = newFree;
    80002120:	ff06b783          	ld	a5,-16(a3)
    80002124:	00078463          	beqz	a5,8000212c <_ZN15MemoryAllocator5kfreeEPv+0xb8>
    80002128:	00a7b423          	sd	a0,8(a5)
	if (prevFree) prevFree->next = newFree;
    8000212c:	04048263          	beqz	s1,80002170 <_ZN15MemoryAllocator5kfreeEPv+0xfc>
    80002130:	00a4b023          	sd	a0,0(s1)
	tryToJoin(newFree);
    80002134:	00000097          	auipc	ra,0x0
    80002138:	ed8080e7          	jalr	-296(ra) # 8000200c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
	tryToJoin(prevFree);
    8000213c:	00048513          	mv	a0,s1
    80002140:	00000097          	auipc	ra,0x0
    80002144:	ecc080e7          	jalr	-308(ra) # 8000200c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
	return 0;
    80002148:	00000513          	li	a0,0
}
    8000214c:	01813083          	ld	ra,24(sp)
    80002150:	01013403          	ld	s0,16(sp)
    80002154:	00813483          	ld	s1,8(sp)
    80002158:	02010113          	addi	sp,sp,32
    8000215c:	00008067          	ret
	else newFree->next = freeMemHead;
    80002160:	00004797          	auipc	a5,0x4
    80002164:	b187b783          	ld	a5,-1256(a5) # 80005c78 <_ZN15MemoryAllocator11freeMemHeadE>
    80002168:	fef6b823          	sd	a5,-16(a3)
    8000216c:	fb5ff06f          	j	80002120 <_ZN15MemoryAllocator5kfreeEPv+0xac>
	else freeMemHead = newFree;
    80002170:	00004797          	auipc	a5,0x4
    80002174:	b0a7b423          	sd	a0,-1272(a5) # 80005c78 <_ZN15MemoryAllocator11freeMemHeadE>
    80002178:	fbdff06f          	j	80002134 <_ZN15MemoryAllocator5kfreeEPv+0xc0>
	if (!ptr) return 0;
    8000217c:	00000513          	li	a0,0
    80002180:	00008067          	ret
	if (!usedMemHead) return -1;
    80002184:	fff00513          	li	a0,-1
    80002188:	00008067          	ret
	if (currentUsed != ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    8000218c:	fff00513          	li	a0,-1
}
    80002190:	00008067          	ret

0000000080002194 <_Z10testMemoryv>:
// Created by os on 5/29/23.
//
#include "../h/MemoryAllocator.hpp"
#include "../h/helper.hpp"

void testMemory() {
    80002194:	81010113          	addi	sp,sp,-2032
    80002198:	7e113423          	sd	ra,2024(sp)
    8000219c:	7e813023          	sd	s0,2016(sp)
    800021a0:	7c913c23          	sd	s1,2008(sp)
    800021a4:	7f010413          	addi	s0,sp,2032
    800021a8:	83010113          	addi	sp,sp,-2000
	const uint64 NumAllocations = 500;    //zasto nece za preko 500????
	const uint64 AllocationSize = 16;

	// Allocate and initialize pointers
	int* allocations[NumAllocations];
	for (uint64 i = 0; i < NumAllocations; ++i)
    800021ac:	00000713          	li	a4,0
    800021b0:	1f300793          	li	a5,499
    800021b4:	02e7e263          	bltu	a5,a4,800021d8 <_Z10testMemoryv+0x44>
		allocations[i] = nullptr;
    800021b8:	fffff7b7          	lui	a5,0xfffff
    800021bc:	00371693          	slli	a3,a4,0x3
    800021c0:	fe040613          	addi	a2,s0,-32
    800021c4:	00f607b3          	add	a5,a2,a5
    800021c8:	00d787b3          	add	a5,a5,a3
    800021cc:	0607b023          	sd	zero,96(a5) # fffffffffffff060 <end+0xffffffff7fff8170>
	for (uint64 i = 0; i < NumAllocations; ++i)
    800021d0:	00170713          	addi	a4,a4,1
    800021d4:	fddff06f          	j	800021b0 <_Z10testMemoryv+0x1c>

	// Allocate memory
	for (uint64 i = 0; i < NumAllocations; ++i) {
    800021d8:	00000493          	li	s1,0
    800021dc:	1f300793          	li	a5,499
    800021e0:	0497e863          	bltu	a5,s1,80002230 <_Z10testMemoryv+0x9c>
		allocations[i] = static_cast<int*>(MemoryAllocator::kmalloc(AllocationSize));
    800021e4:	01000513          	li	a0,16
    800021e8:	00000097          	auipc	ra,0x0
    800021ec:	ce4080e7          	jalr	-796(ra) # 80001ecc <_ZN15MemoryAllocator7kmallocEm>
    800021f0:	fffff737          	lui	a4,0xfffff
    800021f4:	00349793          	slli	a5,s1,0x3
    800021f8:	fe040693          	addi	a3,s0,-32
    800021fc:	00e68733          	add	a4,a3,a4
    80002200:	00f707b3          	add	a5,a4,a5
    80002204:	06a7b023          	sd	a0,96(a5)
		if (allocations[i] == nullptr) {
    80002208:	00050663          	beqz	a0,80002214 <_Z10testMemoryv+0x80>
	for (uint64 i = 0; i < NumAllocations; ++i) {
    8000220c:	00148493          	addi	s1,s1,1
    80002210:	fcdff06f          	j	800021dc <_Z10testMemoryv+0x48>
			printString("\nAllocation failed for index ");
    80002214:	00003517          	auipc	a0,0x3
    80002218:	05c50513          	addi	a0,a0,92 # 80005270 <_ZZ12printIntegermE6digits+0x250>
    8000221c:	fffff097          	auipc	ra,0xfffff
    80002220:	218080e7          	jalr	536(ra) # 80001434 <_Z11printStringPKc>
			printInteger(i);
    80002224:	00048513          	mv	a0,s1
    80002228:	fffff097          	auipc	ra,0xfffff
    8000222c:	284080e7          	jalr	644(ra) # 800014ac <_Z12printIntegerm>
	for (uint64 i = 0; i < NumAllocations; ++i) {
    80002230:	00000493          	li	s1,0
    80002234:	0240006f          	j	80002258 <_Z10testMemoryv+0xc4>

	// Free memory
	for (uint64 i = 0; i < NumAllocations; ++i) {
		if (allocations[i] != nullptr) {
			if (MemoryAllocator::kfree(allocations[i]) != 0) {
				printString("\nDeallocation failed for index ");
    80002238:	00003517          	auipc	a0,0x3
    8000223c:	05850513          	addi	a0,a0,88 # 80005290 <_ZZ12printIntegermE6digits+0x270>
    80002240:	fffff097          	auipc	ra,0xfffff
    80002244:	1f4080e7          	jalr	500(ra) # 80001434 <_Z11printStringPKc>
				printInteger(i);
    80002248:	00048513          	mv	a0,s1
    8000224c:	fffff097          	auipc	ra,0xfffff
    80002250:	260080e7          	jalr	608(ra) # 800014ac <_Z12printIntegerm>
	for (uint64 i = 0; i < NumAllocations; ++i) {
    80002254:	00148493          	addi	s1,s1,1
    80002258:	1f300793          	li	a5,499
    8000225c:	0297e863          	bltu	a5,s1,8000228c <_Z10testMemoryv+0xf8>
		if (allocations[i] != nullptr) {
    80002260:	fffff737          	lui	a4,0xfffff
    80002264:	00349793          	slli	a5,s1,0x3
    80002268:	fe040693          	addi	a3,s0,-32
    8000226c:	00e68733          	add	a4,a3,a4
    80002270:	00f707b3          	add	a5,a4,a5
    80002274:	0607b503          	ld	a0,96(a5)
    80002278:	fc050ee3          	beqz	a0,80002254 <_Z10testMemoryv+0xc0>
			if (MemoryAllocator::kfree(allocations[i]) != 0) {
    8000227c:	00000097          	auipc	ra,0x0
    80002280:	df8080e7          	jalr	-520(ra) # 80002074 <_ZN15MemoryAllocator5kfreeEPv>
    80002284:	fc0508e3          	beqz	a0,80002254 <_Z10testMemoryv+0xc0>
    80002288:	fb1ff06f          	j	80002238 <_Z10testMemoryv+0xa4>
			}
		}
	}
    8000228c:	7d010113          	addi	sp,sp,2000
    80002290:	7e813083          	ld	ra,2024(sp)
    80002294:	7e013403          	ld	s0,2016(sp)
    80002298:	7d813483          	ld	s1,2008(sp)
    8000229c:	7f010113          	addi	sp,sp,2032
    800022a0:	00008067          	ret

00000000800022a4 <start>:
    800022a4:	ff010113          	addi	sp,sp,-16
    800022a8:	00813423          	sd	s0,8(sp)
    800022ac:	01010413          	addi	s0,sp,16
    800022b0:	300027f3          	csrr	a5,mstatus
    800022b4:	ffffe737          	lui	a4,0xffffe
    800022b8:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff790f>
    800022bc:	00e7f7b3          	and	a5,a5,a4
    800022c0:	00001737          	lui	a4,0x1
    800022c4:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    800022c8:	00e7e7b3          	or	a5,a5,a4
    800022cc:	30079073          	csrw	mstatus,a5
    800022d0:	00000797          	auipc	a5,0x0
    800022d4:	16078793          	addi	a5,a5,352 # 80002430 <system_main>
    800022d8:	34179073          	csrw	mepc,a5
    800022dc:	00000793          	li	a5,0
    800022e0:	18079073          	csrw	satp,a5
    800022e4:	000107b7          	lui	a5,0x10
    800022e8:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    800022ec:	30279073          	csrw	medeleg,a5
    800022f0:	30379073          	csrw	mideleg,a5
    800022f4:	104027f3          	csrr	a5,sie
    800022f8:	2227e793          	ori	a5,a5,546
    800022fc:	10479073          	csrw	sie,a5
    80002300:	fff00793          	li	a5,-1
    80002304:	00a7d793          	srli	a5,a5,0xa
    80002308:	3b079073          	csrw	pmpaddr0,a5
    8000230c:	00f00793          	li	a5,15
    80002310:	3a079073          	csrw	pmpcfg0,a5
    80002314:	f14027f3          	csrr	a5,mhartid
    80002318:	0200c737          	lui	a4,0x200c
    8000231c:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80002320:	0007869b          	sext.w	a3,a5
    80002324:	00269713          	slli	a4,a3,0x2
    80002328:	000f4637          	lui	a2,0xf4
    8000232c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80002330:	00d70733          	add	a4,a4,a3
    80002334:	0037979b          	slliw	a5,a5,0x3
    80002338:	020046b7          	lui	a3,0x2004
    8000233c:	00d787b3          	add	a5,a5,a3
    80002340:	00c585b3          	add	a1,a1,a2
    80002344:	00371693          	slli	a3,a4,0x3
    80002348:	00004717          	auipc	a4,0x4
    8000234c:	94870713          	addi	a4,a4,-1720 # 80005c90 <timer_scratch>
    80002350:	00b7b023          	sd	a1,0(a5)
    80002354:	00d70733          	add	a4,a4,a3
    80002358:	00f73c23          	sd	a5,24(a4)
    8000235c:	02c73023          	sd	a2,32(a4)
    80002360:	34071073          	csrw	mscratch,a4
    80002364:	00000797          	auipc	a5,0x0
    80002368:	6ec78793          	addi	a5,a5,1772 # 80002a50 <timervec>
    8000236c:	30579073          	csrw	mtvec,a5
    80002370:	300027f3          	csrr	a5,mstatus
    80002374:	0087e793          	ori	a5,a5,8
    80002378:	30079073          	csrw	mstatus,a5
    8000237c:	304027f3          	csrr	a5,mie
    80002380:	0807e793          	ori	a5,a5,128
    80002384:	30479073          	csrw	mie,a5
    80002388:	f14027f3          	csrr	a5,mhartid
    8000238c:	0007879b          	sext.w	a5,a5
    80002390:	00078213          	mv	tp,a5
    80002394:	30200073          	mret
    80002398:	00813403          	ld	s0,8(sp)
    8000239c:	01010113          	addi	sp,sp,16
    800023a0:	00008067          	ret

00000000800023a4 <timerinit>:
    800023a4:	ff010113          	addi	sp,sp,-16
    800023a8:	00813423          	sd	s0,8(sp)
    800023ac:	01010413          	addi	s0,sp,16
    800023b0:	f14027f3          	csrr	a5,mhartid
    800023b4:	0200c737          	lui	a4,0x200c
    800023b8:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800023bc:	0007869b          	sext.w	a3,a5
    800023c0:	00269713          	slli	a4,a3,0x2
    800023c4:	000f4637          	lui	a2,0xf4
    800023c8:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800023cc:	00d70733          	add	a4,a4,a3
    800023d0:	0037979b          	slliw	a5,a5,0x3
    800023d4:	020046b7          	lui	a3,0x2004
    800023d8:	00d787b3          	add	a5,a5,a3
    800023dc:	00c585b3          	add	a1,a1,a2
    800023e0:	00371693          	slli	a3,a4,0x3
    800023e4:	00004717          	auipc	a4,0x4
    800023e8:	8ac70713          	addi	a4,a4,-1876 # 80005c90 <timer_scratch>
    800023ec:	00b7b023          	sd	a1,0(a5)
    800023f0:	00d70733          	add	a4,a4,a3
    800023f4:	00f73c23          	sd	a5,24(a4)
    800023f8:	02c73023          	sd	a2,32(a4)
    800023fc:	34071073          	csrw	mscratch,a4
    80002400:	00000797          	auipc	a5,0x0
    80002404:	65078793          	addi	a5,a5,1616 # 80002a50 <timervec>
    80002408:	30579073          	csrw	mtvec,a5
    8000240c:	300027f3          	csrr	a5,mstatus
    80002410:	0087e793          	ori	a5,a5,8
    80002414:	30079073          	csrw	mstatus,a5
    80002418:	304027f3          	csrr	a5,mie
    8000241c:	0807e793          	ori	a5,a5,128
    80002420:	30479073          	csrw	mie,a5
    80002424:	00813403          	ld	s0,8(sp)
    80002428:	01010113          	addi	sp,sp,16
    8000242c:	00008067          	ret

0000000080002430 <system_main>:
    80002430:	fe010113          	addi	sp,sp,-32
    80002434:	00813823          	sd	s0,16(sp)
    80002438:	00913423          	sd	s1,8(sp)
    8000243c:	00113c23          	sd	ra,24(sp)
    80002440:	02010413          	addi	s0,sp,32
    80002444:	00000097          	auipc	ra,0x0
    80002448:	0c4080e7          	jalr	196(ra) # 80002508 <cpuid>
    8000244c:	00003497          	auipc	s1,0x3
    80002450:	7d448493          	addi	s1,s1,2004 # 80005c20 <started>
    80002454:	02050263          	beqz	a0,80002478 <system_main+0x48>
    80002458:	0004a783          	lw	a5,0(s1)
    8000245c:	0007879b          	sext.w	a5,a5
    80002460:	fe078ce3          	beqz	a5,80002458 <system_main+0x28>
    80002464:	0ff0000f          	fence
    80002468:	00003517          	auipc	a0,0x3
    8000246c:	e7850513          	addi	a0,a0,-392 # 800052e0 <_ZZ12printIntegermE6digits+0x2c0>
    80002470:	00001097          	auipc	ra,0x1
    80002474:	a7c080e7          	jalr	-1412(ra) # 80002eec <panic>
    80002478:	00001097          	auipc	ra,0x1
    8000247c:	9d0080e7          	jalr	-1584(ra) # 80002e48 <consoleinit>
    80002480:	00001097          	auipc	ra,0x1
    80002484:	15c080e7          	jalr	348(ra) # 800035dc <printfinit>
    80002488:	00003517          	auipc	a0,0x3
    8000248c:	f3850513          	addi	a0,a0,-200 # 800053c0 <_ZZ12printIntegermE6digits+0x3a0>
    80002490:	00001097          	auipc	ra,0x1
    80002494:	ab8080e7          	jalr	-1352(ra) # 80002f48 <__printf>
    80002498:	00003517          	auipc	a0,0x3
    8000249c:	e1850513          	addi	a0,a0,-488 # 800052b0 <_ZZ12printIntegermE6digits+0x290>
    800024a0:	00001097          	auipc	ra,0x1
    800024a4:	aa8080e7          	jalr	-1368(ra) # 80002f48 <__printf>
    800024a8:	00003517          	auipc	a0,0x3
    800024ac:	f1850513          	addi	a0,a0,-232 # 800053c0 <_ZZ12printIntegermE6digits+0x3a0>
    800024b0:	00001097          	auipc	ra,0x1
    800024b4:	a98080e7          	jalr	-1384(ra) # 80002f48 <__printf>
    800024b8:	00001097          	auipc	ra,0x1
    800024bc:	4b0080e7          	jalr	1200(ra) # 80003968 <kinit>
    800024c0:	00000097          	auipc	ra,0x0
    800024c4:	148080e7          	jalr	328(ra) # 80002608 <trapinit>
    800024c8:	00000097          	auipc	ra,0x0
    800024cc:	16c080e7          	jalr	364(ra) # 80002634 <trapinithart>
    800024d0:	00000097          	auipc	ra,0x0
    800024d4:	5c0080e7          	jalr	1472(ra) # 80002a90 <plicinit>
    800024d8:	00000097          	auipc	ra,0x0
    800024dc:	5e0080e7          	jalr	1504(ra) # 80002ab8 <plicinithart>
    800024e0:	00000097          	auipc	ra,0x0
    800024e4:	078080e7          	jalr	120(ra) # 80002558 <userinit>
    800024e8:	0ff0000f          	fence
    800024ec:	00100793          	li	a5,1
    800024f0:	00003517          	auipc	a0,0x3
    800024f4:	dd850513          	addi	a0,a0,-552 # 800052c8 <_ZZ12printIntegermE6digits+0x2a8>
    800024f8:	00f4a023          	sw	a5,0(s1)
    800024fc:	00001097          	auipc	ra,0x1
    80002500:	a4c080e7          	jalr	-1460(ra) # 80002f48 <__printf>
    80002504:	0000006f          	j	80002504 <system_main+0xd4>

0000000080002508 <cpuid>:
    80002508:	ff010113          	addi	sp,sp,-16
    8000250c:	00813423          	sd	s0,8(sp)
    80002510:	01010413          	addi	s0,sp,16
    80002514:	00020513          	mv	a0,tp
    80002518:	00813403          	ld	s0,8(sp)
    8000251c:	0005051b          	sext.w	a0,a0
    80002520:	01010113          	addi	sp,sp,16
    80002524:	00008067          	ret

0000000080002528 <mycpu>:
    80002528:	ff010113          	addi	sp,sp,-16
    8000252c:	00813423          	sd	s0,8(sp)
    80002530:	01010413          	addi	s0,sp,16
    80002534:	00020793          	mv	a5,tp
    80002538:	00813403          	ld	s0,8(sp)
    8000253c:	0007879b          	sext.w	a5,a5
    80002540:	00779793          	slli	a5,a5,0x7
    80002544:	00004517          	auipc	a0,0x4
    80002548:	77c50513          	addi	a0,a0,1916 # 80006cc0 <cpus>
    8000254c:	00f50533          	add	a0,a0,a5
    80002550:	01010113          	addi	sp,sp,16
    80002554:	00008067          	ret

0000000080002558 <userinit>:
    80002558:	ff010113          	addi	sp,sp,-16
    8000255c:	00813423          	sd	s0,8(sp)
    80002560:	01010413          	addi	s0,sp,16
    80002564:	00813403          	ld	s0,8(sp)
    80002568:	01010113          	addi	sp,sp,16
    8000256c:	fffff317          	auipc	t1,0xfffff
    80002570:	05030067          	jr	80(t1) # 800015bc <main>

0000000080002574 <either_copyout>:
    80002574:	ff010113          	addi	sp,sp,-16
    80002578:	00813023          	sd	s0,0(sp)
    8000257c:	00113423          	sd	ra,8(sp)
    80002580:	01010413          	addi	s0,sp,16
    80002584:	02051663          	bnez	a0,800025b0 <either_copyout+0x3c>
    80002588:	00058513          	mv	a0,a1
    8000258c:	00060593          	mv	a1,a2
    80002590:	0006861b          	sext.w	a2,a3
    80002594:	00002097          	auipc	ra,0x2
    80002598:	c60080e7          	jalr	-928(ra) # 800041f4 <__memmove>
    8000259c:	00813083          	ld	ra,8(sp)
    800025a0:	00013403          	ld	s0,0(sp)
    800025a4:	00000513          	li	a0,0
    800025a8:	01010113          	addi	sp,sp,16
    800025ac:	00008067          	ret
    800025b0:	00003517          	auipc	a0,0x3
    800025b4:	d5850513          	addi	a0,a0,-680 # 80005308 <_ZZ12printIntegermE6digits+0x2e8>
    800025b8:	00001097          	auipc	ra,0x1
    800025bc:	934080e7          	jalr	-1740(ra) # 80002eec <panic>

00000000800025c0 <either_copyin>:
    800025c0:	ff010113          	addi	sp,sp,-16
    800025c4:	00813023          	sd	s0,0(sp)
    800025c8:	00113423          	sd	ra,8(sp)
    800025cc:	01010413          	addi	s0,sp,16
    800025d0:	02059463          	bnez	a1,800025f8 <either_copyin+0x38>
    800025d4:	00060593          	mv	a1,a2
    800025d8:	0006861b          	sext.w	a2,a3
    800025dc:	00002097          	auipc	ra,0x2
    800025e0:	c18080e7          	jalr	-1000(ra) # 800041f4 <__memmove>
    800025e4:	00813083          	ld	ra,8(sp)
    800025e8:	00013403          	ld	s0,0(sp)
    800025ec:	00000513          	li	a0,0
    800025f0:	01010113          	addi	sp,sp,16
    800025f4:	00008067          	ret
    800025f8:	00003517          	auipc	a0,0x3
    800025fc:	d3850513          	addi	a0,a0,-712 # 80005330 <_ZZ12printIntegermE6digits+0x310>
    80002600:	00001097          	auipc	ra,0x1
    80002604:	8ec080e7          	jalr	-1812(ra) # 80002eec <panic>

0000000080002608 <trapinit>:
    80002608:	ff010113          	addi	sp,sp,-16
    8000260c:	00813423          	sd	s0,8(sp)
    80002610:	01010413          	addi	s0,sp,16
    80002614:	00813403          	ld	s0,8(sp)
    80002618:	00003597          	auipc	a1,0x3
    8000261c:	d4058593          	addi	a1,a1,-704 # 80005358 <_ZZ12printIntegermE6digits+0x338>
    80002620:	00004517          	auipc	a0,0x4
    80002624:	72050513          	addi	a0,a0,1824 # 80006d40 <tickslock>
    80002628:	01010113          	addi	sp,sp,16
    8000262c:	00001317          	auipc	t1,0x1
    80002630:	5cc30067          	jr	1484(t1) # 80003bf8 <initlock>

0000000080002634 <trapinithart>:
    80002634:	ff010113          	addi	sp,sp,-16
    80002638:	00813423          	sd	s0,8(sp)
    8000263c:	01010413          	addi	s0,sp,16
    80002640:	00000797          	auipc	a5,0x0
    80002644:	30078793          	addi	a5,a5,768 # 80002940 <kernelvec>
    80002648:	10579073          	csrw	stvec,a5
    8000264c:	00813403          	ld	s0,8(sp)
    80002650:	01010113          	addi	sp,sp,16
    80002654:	00008067          	ret

0000000080002658 <usertrap>:
    80002658:	ff010113          	addi	sp,sp,-16
    8000265c:	00813423          	sd	s0,8(sp)
    80002660:	01010413          	addi	s0,sp,16
    80002664:	00813403          	ld	s0,8(sp)
    80002668:	01010113          	addi	sp,sp,16
    8000266c:	00008067          	ret

0000000080002670 <usertrapret>:
    80002670:	ff010113          	addi	sp,sp,-16
    80002674:	00813423          	sd	s0,8(sp)
    80002678:	01010413          	addi	s0,sp,16
    8000267c:	00813403          	ld	s0,8(sp)
    80002680:	01010113          	addi	sp,sp,16
    80002684:	00008067          	ret

0000000080002688 <kerneltrap>:
    80002688:	fe010113          	addi	sp,sp,-32
    8000268c:	00813823          	sd	s0,16(sp)
    80002690:	00113c23          	sd	ra,24(sp)
    80002694:	00913423          	sd	s1,8(sp)
    80002698:	02010413          	addi	s0,sp,32
    8000269c:	142025f3          	csrr	a1,scause
    800026a0:	100027f3          	csrr	a5,sstatus
    800026a4:	0027f793          	andi	a5,a5,2
    800026a8:	10079c63          	bnez	a5,800027c0 <kerneltrap+0x138>
    800026ac:	142027f3          	csrr	a5,scause
    800026b0:	0207ce63          	bltz	a5,800026ec <kerneltrap+0x64>
    800026b4:	00003517          	auipc	a0,0x3
    800026b8:	cec50513          	addi	a0,a0,-788 # 800053a0 <_ZZ12printIntegermE6digits+0x380>
    800026bc:	00001097          	auipc	ra,0x1
    800026c0:	88c080e7          	jalr	-1908(ra) # 80002f48 <__printf>
    800026c4:	141025f3          	csrr	a1,sepc
    800026c8:	14302673          	csrr	a2,stval
    800026cc:	00003517          	auipc	a0,0x3
    800026d0:	ce450513          	addi	a0,a0,-796 # 800053b0 <_ZZ12printIntegermE6digits+0x390>
    800026d4:	00001097          	auipc	ra,0x1
    800026d8:	874080e7          	jalr	-1932(ra) # 80002f48 <__printf>
    800026dc:	00003517          	auipc	a0,0x3
    800026e0:	cec50513          	addi	a0,a0,-788 # 800053c8 <_ZZ12printIntegermE6digits+0x3a8>
    800026e4:	00001097          	auipc	ra,0x1
    800026e8:	808080e7          	jalr	-2040(ra) # 80002eec <panic>
    800026ec:	0ff7f713          	andi	a4,a5,255
    800026f0:	00900693          	li	a3,9
    800026f4:	04d70063          	beq	a4,a3,80002734 <kerneltrap+0xac>
    800026f8:	fff00713          	li	a4,-1
    800026fc:	03f71713          	slli	a4,a4,0x3f
    80002700:	00170713          	addi	a4,a4,1
    80002704:	fae798e3          	bne	a5,a4,800026b4 <kerneltrap+0x2c>
    80002708:	00000097          	auipc	ra,0x0
    8000270c:	e00080e7          	jalr	-512(ra) # 80002508 <cpuid>
    80002710:	06050663          	beqz	a0,8000277c <kerneltrap+0xf4>
    80002714:	144027f3          	csrr	a5,sip
    80002718:	ffd7f793          	andi	a5,a5,-3
    8000271c:	14479073          	csrw	sip,a5
    80002720:	01813083          	ld	ra,24(sp)
    80002724:	01013403          	ld	s0,16(sp)
    80002728:	00813483          	ld	s1,8(sp)
    8000272c:	02010113          	addi	sp,sp,32
    80002730:	00008067          	ret
    80002734:	00000097          	auipc	ra,0x0
    80002738:	3d0080e7          	jalr	976(ra) # 80002b04 <plic_claim>
    8000273c:	00a00793          	li	a5,10
    80002740:	00050493          	mv	s1,a0
    80002744:	06f50863          	beq	a0,a5,800027b4 <kerneltrap+0x12c>
    80002748:	fc050ce3          	beqz	a0,80002720 <kerneltrap+0x98>
    8000274c:	00050593          	mv	a1,a0
    80002750:	00003517          	auipc	a0,0x3
    80002754:	c3050513          	addi	a0,a0,-976 # 80005380 <_ZZ12printIntegermE6digits+0x360>
    80002758:	00000097          	auipc	ra,0x0
    8000275c:	7f0080e7          	jalr	2032(ra) # 80002f48 <__printf>
    80002760:	01013403          	ld	s0,16(sp)
    80002764:	01813083          	ld	ra,24(sp)
    80002768:	00048513          	mv	a0,s1
    8000276c:	00813483          	ld	s1,8(sp)
    80002770:	02010113          	addi	sp,sp,32
    80002774:	00000317          	auipc	t1,0x0
    80002778:	3c830067          	jr	968(t1) # 80002b3c <plic_complete>
    8000277c:	00004517          	auipc	a0,0x4
    80002780:	5c450513          	addi	a0,a0,1476 # 80006d40 <tickslock>
    80002784:	00001097          	auipc	ra,0x1
    80002788:	498080e7          	jalr	1176(ra) # 80003c1c <acquire>
    8000278c:	00003717          	auipc	a4,0x3
    80002790:	49870713          	addi	a4,a4,1176 # 80005c24 <ticks>
    80002794:	00072783          	lw	a5,0(a4)
    80002798:	00004517          	auipc	a0,0x4
    8000279c:	5a850513          	addi	a0,a0,1448 # 80006d40 <tickslock>
    800027a0:	0017879b          	addiw	a5,a5,1
    800027a4:	00f72023          	sw	a5,0(a4)
    800027a8:	00001097          	auipc	ra,0x1
    800027ac:	540080e7          	jalr	1344(ra) # 80003ce8 <release>
    800027b0:	f65ff06f          	j	80002714 <kerneltrap+0x8c>
    800027b4:	00001097          	auipc	ra,0x1
    800027b8:	09c080e7          	jalr	156(ra) # 80003850 <uartintr>
    800027bc:	fa5ff06f          	j	80002760 <kerneltrap+0xd8>
    800027c0:	00003517          	auipc	a0,0x3
    800027c4:	ba050513          	addi	a0,a0,-1120 # 80005360 <_ZZ12printIntegermE6digits+0x340>
    800027c8:	00000097          	auipc	ra,0x0
    800027cc:	724080e7          	jalr	1828(ra) # 80002eec <panic>

00000000800027d0 <clockintr>:
    800027d0:	fe010113          	addi	sp,sp,-32
    800027d4:	00813823          	sd	s0,16(sp)
    800027d8:	00913423          	sd	s1,8(sp)
    800027dc:	00113c23          	sd	ra,24(sp)
    800027e0:	02010413          	addi	s0,sp,32
    800027e4:	00004497          	auipc	s1,0x4
    800027e8:	55c48493          	addi	s1,s1,1372 # 80006d40 <tickslock>
    800027ec:	00048513          	mv	a0,s1
    800027f0:	00001097          	auipc	ra,0x1
    800027f4:	42c080e7          	jalr	1068(ra) # 80003c1c <acquire>
    800027f8:	00003717          	auipc	a4,0x3
    800027fc:	42c70713          	addi	a4,a4,1068 # 80005c24 <ticks>
    80002800:	00072783          	lw	a5,0(a4)
    80002804:	01013403          	ld	s0,16(sp)
    80002808:	01813083          	ld	ra,24(sp)
    8000280c:	00048513          	mv	a0,s1
    80002810:	0017879b          	addiw	a5,a5,1
    80002814:	00813483          	ld	s1,8(sp)
    80002818:	00f72023          	sw	a5,0(a4)
    8000281c:	02010113          	addi	sp,sp,32
    80002820:	00001317          	auipc	t1,0x1
    80002824:	4c830067          	jr	1224(t1) # 80003ce8 <release>

0000000080002828 <devintr>:
    80002828:	142027f3          	csrr	a5,scause
    8000282c:	00000513          	li	a0,0
    80002830:	0007c463          	bltz	a5,80002838 <devintr+0x10>
    80002834:	00008067          	ret
    80002838:	fe010113          	addi	sp,sp,-32
    8000283c:	00813823          	sd	s0,16(sp)
    80002840:	00113c23          	sd	ra,24(sp)
    80002844:	00913423          	sd	s1,8(sp)
    80002848:	02010413          	addi	s0,sp,32
    8000284c:	0ff7f713          	andi	a4,a5,255
    80002850:	00900693          	li	a3,9
    80002854:	04d70c63          	beq	a4,a3,800028ac <devintr+0x84>
    80002858:	fff00713          	li	a4,-1
    8000285c:	03f71713          	slli	a4,a4,0x3f
    80002860:	00170713          	addi	a4,a4,1
    80002864:	00e78c63          	beq	a5,a4,8000287c <devintr+0x54>
    80002868:	01813083          	ld	ra,24(sp)
    8000286c:	01013403          	ld	s0,16(sp)
    80002870:	00813483          	ld	s1,8(sp)
    80002874:	02010113          	addi	sp,sp,32
    80002878:	00008067          	ret
    8000287c:	00000097          	auipc	ra,0x0
    80002880:	c8c080e7          	jalr	-884(ra) # 80002508 <cpuid>
    80002884:	06050663          	beqz	a0,800028f0 <devintr+0xc8>
    80002888:	144027f3          	csrr	a5,sip
    8000288c:	ffd7f793          	andi	a5,a5,-3
    80002890:	14479073          	csrw	sip,a5
    80002894:	01813083          	ld	ra,24(sp)
    80002898:	01013403          	ld	s0,16(sp)
    8000289c:	00813483          	ld	s1,8(sp)
    800028a0:	00200513          	li	a0,2
    800028a4:	02010113          	addi	sp,sp,32
    800028a8:	00008067          	ret
    800028ac:	00000097          	auipc	ra,0x0
    800028b0:	258080e7          	jalr	600(ra) # 80002b04 <plic_claim>
    800028b4:	00a00793          	li	a5,10
    800028b8:	00050493          	mv	s1,a0
    800028bc:	06f50663          	beq	a0,a5,80002928 <devintr+0x100>
    800028c0:	00100513          	li	a0,1
    800028c4:	fa0482e3          	beqz	s1,80002868 <devintr+0x40>
    800028c8:	00048593          	mv	a1,s1
    800028cc:	00003517          	auipc	a0,0x3
    800028d0:	ab450513          	addi	a0,a0,-1356 # 80005380 <_ZZ12printIntegermE6digits+0x360>
    800028d4:	00000097          	auipc	ra,0x0
    800028d8:	674080e7          	jalr	1652(ra) # 80002f48 <__printf>
    800028dc:	00048513          	mv	a0,s1
    800028e0:	00000097          	auipc	ra,0x0
    800028e4:	25c080e7          	jalr	604(ra) # 80002b3c <plic_complete>
    800028e8:	00100513          	li	a0,1
    800028ec:	f7dff06f          	j	80002868 <devintr+0x40>
    800028f0:	00004517          	auipc	a0,0x4
    800028f4:	45050513          	addi	a0,a0,1104 # 80006d40 <tickslock>
    800028f8:	00001097          	auipc	ra,0x1
    800028fc:	324080e7          	jalr	804(ra) # 80003c1c <acquire>
    80002900:	00003717          	auipc	a4,0x3
    80002904:	32470713          	addi	a4,a4,804 # 80005c24 <ticks>
    80002908:	00072783          	lw	a5,0(a4)
    8000290c:	00004517          	auipc	a0,0x4
    80002910:	43450513          	addi	a0,a0,1076 # 80006d40 <tickslock>
    80002914:	0017879b          	addiw	a5,a5,1
    80002918:	00f72023          	sw	a5,0(a4)
    8000291c:	00001097          	auipc	ra,0x1
    80002920:	3cc080e7          	jalr	972(ra) # 80003ce8 <release>
    80002924:	f65ff06f          	j	80002888 <devintr+0x60>
    80002928:	00001097          	auipc	ra,0x1
    8000292c:	f28080e7          	jalr	-216(ra) # 80003850 <uartintr>
    80002930:	fadff06f          	j	800028dc <devintr+0xb4>
	...

0000000080002940 <kernelvec>:
    80002940:	f0010113          	addi	sp,sp,-256
    80002944:	00113023          	sd	ra,0(sp)
    80002948:	00213423          	sd	sp,8(sp)
    8000294c:	00313823          	sd	gp,16(sp)
    80002950:	00413c23          	sd	tp,24(sp)
    80002954:	02513023          	sd	t0,32(sp)
    80002958:	02613423          	sd	t1,40(sp)
    8000295c:	02713823          	sd	t2,48(sp)
    80002960:	02813c23          	sd	s0,56(sp)
    80002964:	04913023          	sd	s1,64(sp)
    80002968:	04a13423          	sd	a0,72(sp)
    8000296c:	04b13823          	sd	a1,80(sp)
    80002970:	04c13c23          	sd	a2,88(sp)
    80002974:	06d13023          	sd	a3,96(sp)
    80002978:	06e13423          	sd	a4,104(sp)
    8000297c:	06f13823          	sd	a5,112(sp)
    80002980:	07013c23          	sd	a6,120(sp)
    80002984:	09113023          	sd	a7,128(sp)
    80002988:	09213423          	sd	s2,136(sp)
    8000298c:	09313823          	sd	s3,144(sp)
    80002990:	09413c23          	sd	s4,152(sp)
    80002994:	0b513023          	sd	s5,160(sp)
    80002998:	0b613423          	sd	s6,168(sp)
    8000299c:	0b713823          	sd	s7,176(sp)
    800029a0:	0b813c23          	sd	s8,184(sp)
    800029a4:	0d913023          	sd	s9,192(sp)
    800029a8:	0da13423          	sd	s10,200(sp)
    800029ac:	0db13823          	sd	s11,208(sp)
    800029b0:	0dc13c23          	sd	t3,216(sp)
    800029b4:	0fd13023          	sd	t4,224(sp)
    800029b8:	0fe13423          	sd	t5,232(sp)
    800029bc:	0ff13823          	sd	t6,240(sp)
    800029c0:	cc9ff0ef          	jal	ra,80002688 <kerneltrap>
    800029c4:	00013083          	ld	ra,0(sp)
    800029c8:	00813103          	ld	sp,8(sp)
    800029cc:	01013183          	ld	gp,16(sp)
    800029d0:	02013283          	ld	t0,32(sp)
    800029d4:	02813303          	ld	t1,40(sp)
    800029d8:	03013383          	ld	t2,48(sp)
    800029dc:	03813403          	ld	s0,56(sp)
    800029e0:	04013483          	ld	s1,64(sp)
    800029e4:	04813503          	ld	a0,72(sp)
    800029e8:	05013583          	ld	a1,80(sp)
    800029ec:	05813603          	ld	a2,88(sp)
    800029f0:	06013683          	ld	a3,96(sp)
    800029f4:	06813703          	ld	a4,104(sp)
    800029f8:	07013783          	ld	a5,112(sp)
    800029fc:	07813803          	ld	a6,120(sp)
    80002a00:	08013883          	ld	a7,128(sp)
    80002a04:	08813903          	ld	s2,136(sp)
    80002a08:	09013983          	ld	s3,144(sp)
    80002a0c:	09813a03          	ld	s4,152(sp)
    80002a10:	0a013a83          	ld	s5,160(sp)
    80002a14:	0a813b03          	ld	s6,168(sp)
    80002a18:	0b013b83          	ld	s7,176(sp)
    80002a1c:	0b813c03          	ld	s8,184(sp)
    80002a20:	0c013c83          	ld	s9,192(sp)
    80002a24:	0c813d03          	ld	s10,200(sp)
    80002a28:	0d013d83          	ld	s11,208(sp)
    80002a2c:	0d813e03          	ld	t3,216(sp)
    80002a30:	0e013e83          	ld	t4,224(sp)
    80002a34:	0e813f03          	ld	t5,232(sp)
    80002a38:	0f013f83          	ld	t6,240(sp)
    80002a3c:	10010113          	addi	sp,sp,256
    80002a40:	10200073          	sret
    80002a44:	00000013          	nop
    80002a48:	00000013          	nop
    80002a4c:	00000013          	nop

0000000080002a50 <timervec>:
    80002a50:	34051573          	csrrw	a0,mscratch,a0
    80002a54:	00b53023          	sd	a1,0(a0)
    80002a58:	00c53423          	sd	a2,8(a0)
    80002a5c:	00d53823          	sd	a3,16(a0)
    80002a60:	01853583          	ld	a1,24(a0)
    80002a64:	02053603          	ld	a2,32(a0)
    80002a68:	0005b683          	ld	a3,0(a1)
    80002a6c:	00c686b3          	add	a3,a3,a2
    80002a70:	00d5b023          	sd	a3,0(a1)
    80002a74:	00200593          	li	a1,2
    80002a78:	14459073          	csrw	sip,a1
    80002a7c:	01053683          	ld	a3,16(a0)
    80002a80:	00853603          	ld	a2,8(a0)
    80002a84:	00053583          	ld	a1,0(a0)
    80002a88:	34051573          	csrrw	a0,mscratch,a0
    80002a8c:	30200073          	mret

0000000080002a90 <plicinit>:
    80002a90:	ff010113          	addi	sp,sp,-16
    80002a94:	00813423          	sd	s0,8(sp)
    80002a98:	01010413          	addi	s0,sp,16
    80002a9c:	00813403          	ld	s0,8(sp)
    80002aa0:	0c0007b7          	lui	a5,0xc000
    80002aa4:	00100713          	li	a4,1
    80002aa8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    80002aac:	00e7a223          	sw	a4,4(a5)
    80002ab0:	01010113          	addi	sp,sp,16
    80002ab4:	00008067          	ret

0000000080002ab8 <plicinithart>:
    80002ab8:	ff010113          	addi	sp,sp,-16
    80002abc:	00813023          	sd	s0,0(sp)
    80002ac0:	00113423          	sd	ra,8(sp)
    80002ac4:	01010413          	addi	s0,sp,16
    80002ac8:	00000097          	auipc	ra,0x0
    80002acc:	a40080e7          	jalr	-1472(ra) # 80002508 <cpuid>
    80002ad0:	0085171b          	slliw	a4,a0,0x8
    80002ad4:	0c0027b7          	lui	a5,0xc002
    80002ad8:	00e787b3          	add	a5,a5,a4
    80002adc:	40200713          	li	a4,1026
    80002ae0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80002ae4:	00813083          	ld	ra,8(sp)
    80002ae8:	00013403          	ld	s0,0(sp)
    80002aec:	00d5151b          	slliw	a0,a0,0xd
    80002af0:	0c2017b7          	lui	a5,0xc201
    80002af4:	00a78533          	add	a0,a5,a0
    80002af8:	00052023          	sw	zero,0(a0)
    80002afc:	01010113          	addi	sp,sp,16
    80002b00:	00008067          	ret

0000000080002b04 <plic_claim>:
    80002b04:	ff010113          	addi	sp,sp,-16
    80002b08:	00813023          	sd	s0,0(sp)
    80002b0c:	00113423          	sd	ra,8(sp)
    80002b10:	01010413          	addi	s0,sp,16
    80002b14:	00000097          	auipc	ra,0x0
    80002b18:	9f4080e7          	jalr	-1548(ra) # 80002508 <cpuid>
    80002b1c:	00813083          	ld	ra,8(sp)
    80002b20:	00013403          	ld	s0,0(sp)
    80002b24:	00d5151b          	slliw	a0,a0,0xd
    80002b28:	0c2017b7          	lui	a5,0xc201
    80002b2c:	00a78533          	add	a0,a5,a0
    80002b30:	00452503          	lw	a0,4(a0)
    80002b34:	01010113          	addi	sp,sp,16
    80002b38:	00008067          	ret

0000000080002b3c <plic_complete>:
    80002b3c:	fe010113          	addi	sp,sp,-32
    80002b40:	00813823          	sd	s0,16(sp)
    80002b44:	00913423          	sd	s1,8(sp)
    80002b48:	00113c23          	sd	ra,24(sp)
    80002b4c:	02010413          	addi	s0,sp,32
    80002b50:	00050493          	mv	s1,a0
    80002b54:	00000097          	auipc	ra,0x0
    80002b58:	9b4080e7          	jalr	-1612(ra) # 80002508 <cpuid>
    80002b5c:	01813083          	ld	ra,24(sp)
    80002b60:	01013403          	ld	s0,16(sp)
    80002b64:	00d5179b          	slliw	a5,a0,0xd
    80002b68:	0c201737          	lui	a4,0xc201
    80002b6c:	00f707b3          	add	a5,a4,a5
    80002b70:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80002b74:	00813483          	ld	s1,8(sp)
    80002b78:	02010113          	addi	sp,sp,32
    80002b7c:	00008067          	ret

0000000080002b80 <consolewrite>:
    80002b80:	fb010113          	addi	sp,sp,-80
    80002b84:	04813023          	sd	s0,64(sp)
    80002b88:	04113423          	sd	ra,72(sp)
    80002b8c:	02913c23          	sd	s1,56(sp)
    80002b90:	03213823          	sd	s2,48(sp)
    80002b94:	03313423          	sd	s3,40(sp)
    80002b98:	03413023          	sd	s4,32(sp)
    80002b9c:	01513c23          	sd	s5,24(sp)
    80002ba0:	05010413          	addi	s0,sp,80
    80002ba4:	06c05c63          	blez	a2,80002c1c <consolewrite+0x9c>
    80002ba8:	00060993          	mv	s3,a2
    80002bac:	00050a13          	mv	s4,a0
    80002bb0:	00058493          	mv	s1,a1
    80002bb4:	00000913          	li	s2,0
    80002bb8:	fff00a93          	li	s5,-1
    80002bbc:	01c0006f          	j	80002bd8 <consolewrite+0x58>
    80002bc0:	fbf44503          	lbu	a0,-65(s0)
    80002bc4:	0019091b          	addiw	s2,s2,1
    80002bc8:	00148493          	addi	s1,s1,1
    80002bcc:	00001097          	auipc	ra,0x1
    80002bd0:	a9c080e7          	jalr	-1380(ra) # 80003668 <uartputc>
    80002bd4:	03298063          	beq	s3,s2,80002bf4 <consolewrite+0x74>
    80002bd8:	00048613          	mv	a2,s1
    80002bdc:	00100693          	li	a3,1
    80002be0:	000a0593          	mv	a1,s4
    80002be4:	fbf40513          	addi	a0,s0,-65
    80002be8:	00000097          	auipc	ra,0x0
    80002bec:	9d8080e7          	jalr	-1576(ra) # 800025c0 <either_copyin>
    80002bf0:	fd5518e3          	bne	a0,s5,80002bc0 <consolewrite+0x40>
    80002bf4:	04813083          	ld	ra,72(sp)
    80002bf8:	04013403          	ld	s0,64(sp)
    80002bfc:	03813483          	ld	s1,56(sp)
    80002c00:	02813983          	ld	s3,40(sp)
    80002c04:	02013a03          	ld	s4,32(sp)
    80002c08:	01813a83          	ld	s5,24(sp)
    80002c0c:	00090513          	mv	a0,s2
    80002c10:	03013903          	ld	s2,48(sp)
    80002c14:	05010113          	addi	sp,sp,80
    80002c18:	00008067          	ret
    80002c1c:	00000913          	li	s2,0
    80002c20:	fd5ff06f          	j	80002bf4 <consolewrite+0x74>

0000000080002c24 <consoleread>:
    80002c24:	f9010113          	addi	sp,sp,-112
    80002c28:	06813023          	sd	s0,96(sp)
    80002c2c:	04913c23          	sd	s1,88(sp)
    80002c30:	05213823          	sd	s2,80(sp)
    80002c34:	05313423          	sd	s3,72(sp)
    80002c38:	05413023          	sd	s4,64(sp)
    80002c3c:	03513c23          	sd	s5,56(sp)
    80002c40:	03613823          	sd	s6,48(sp)
    80002c44:	03713423          	sd	s7,40(sp)
    80002c48:	03813023          	sd	s8,32(sp)
    80002c4c:	06113423          	sd	ra,104(sp)
    80002c50:	01913c23          	sd	s9,24(sp)
    80002c54:	07010413          	addi	s0,sp,112
    80002c58:	00060b93          	mv	s7,a2
    80002c5c:	00050913          	mv	s2,a0
    80002c60:	00058c13          	mv	s8,a1
    80002c64:	00060b1b          	sext.w	s6,a2
    80002c68:	00004497          	auipc	s1,0x4
    80002c6c:	10048493          	addi	s1,s1,256 # 80006d68 <cons>
    80002c70:	00400993          	li	s3,4
    80002c74:	fff00a13          	li	s4,-1
    80002c78:	00a00a93          	li	s5,10
    80002c7c:	05705e63          	blez	s7,80002cd8 <consoleread+0xb4>
    80002c80:	09c4a703          	lw	a4,156(s1)
    80002c84:	0984a783          	lw	a5,152(s1)
    80002c88:	0007071b          	sext.w	a4,a4
    80002c8c:	08e78463          	beq	a5,a4,80002d14 <consoleread+0xf0>
    80002c90:	07f7f713          	andi	a4,a5,127
    80002c94:	00e48733          	add	a4,s1,a4
    80002c98:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80002c9c:	0017869b          	addiw	a3,a5,1
    80002ca0:	08d4ac23          	sw	a3,152(s1)
    80002ca4:	00070c9b          	sext.w	s9,a4
    80002ca8:	0b370663          	beq	a4,s3,80002d54 <consoleread+0x130>
    80002cac:	00100693          	li	a3,1
    80002cb0:	f9f40613          	addi	a2,s0,-97
    80002cb4:	000c0593          	mv	a1,s8
    80002cb8:	00090513          	mv	a0,s2
    80002cbc:	f8e40fa3          	sb	a4,-97(s0)
    80002cc0:	00000097          	auipc	ra,0x0
    80002cc4:	8b4080e7          	jalr	-1868(ra) # 80002574 <either_copyout>
    80002cc8:	01450863          	beq	a0,s4,80002cd8 <consoleread+0xb4>
    80002ccc:	001c0c13          	addi	s8,s8,1
    80002cd0:	fffb8b9b          	addiw	s7,s7,-1
    80002cd4:	fb5c94e3          	bne	s9,s5,80002c7c <consoleread+0x58>
    80002cd8:	000b851b          	sext.w	a0,s7
    80002cdc:	06813083          	ld	ra,104(sp)
    80002ce0:	06013403          	ld	s0,96(sp)
    80002ce4:	05813483          	ld	s1,88(sp)
    80002ce8:	05013903          	ld	s2,80(sp)
    80002cec:	04813983          	ld	s3,72(sp)
    80002cf0:	04013a03          	ld	s4,64(sp)
    80002cf4:	03813a83          	ld	s5,56(sp)
    80002cf8:	02813b83          	ld	s7,40(sp)
    80002cfc:	02013c03          	ld	s8,32(sp)
    80002d00:	01813c83          	ld	s9,24(sp)
    80002d04:	40ab053b          	subw	a0,s6,a0
    80002d08:	03013b03          	ld	s6,48(sp)
    80002d0c:	07010113          	addi	sp,sp,112
    80002d10:	00008067          	ret
    80002d14:	00001097          	auipc	ra,0x1
    80002d18:	1d8080e7          	jalr	472(ra) # 80003eec <push_on>
    80002d1c:	0984a703          	lw	a4,152(s1)
    80002d20:	09c4a783          	lw	a5,156(s1)
    80002d24:	0007879b          	sext.w	a5,a5
    80002d28:	fef70ce3          	beq	a4,a5,80002d20 <consoleread+0xfc>
    80002d2c:	00001097          	auipc	ra,0x1
    80002d30:	234080e7          	jalr	564(ra) # 80003f60 <pop_on>
    80002d34:	0984a783          	lw	a5,152(s1)
    80002d38:	07f7f713          	andi	a4,a5,127
    80002d3c:	00e48733          	add	a4,s1,a4
    80002d40:	01874703          	lbu	a4,24(a4)
    80002d44:	0017869b          	addiw	a3,a5,1
    80002d48:	08d4ac23          	sw	a3,152(s1)
    80002d4c:	00070c9b          	sext.w	s9,a4
    80002d50:	f5371ee3          	bne	a4,s3,80002cac <consoleread+0x88>
    80002d54:	000b851b          	sext.w	a0,s7
    80002d58:	f96bf2e3          	bgeu	s7,s6,80002cdc <consoleread+0xb8>
    80002d5c:	08f4ac23          	sw	a5,152(s1)
    80002d60:	f7dff06f          	j	80002cdc <consoleread+0xb8>

0000000080002d64 <consputc>:
    80002d64:	10000793          	li	a5,256
    80002d68:	00f50663          	beq	a0,a5,80002d74 <consputc+0x10>
    80002d6c:	00001317          	auipc	t1,0x1
    80002d70:	9f430067          	jr	-1548(t1) # 80003760 <uartputc_sync>
    80002d74:	ff010113          	addi	sp,sp,-16
    80002d78:	00113423          	sd	ra,8(sp)
    80002d7c:	00813023          	sd	s0,0(sp)
    80002d80:	01010413          	addi	s0,sp,16
    80002d84:	00800513          	li	a0,8
    80002d88:	00001097          	auipc	ra,0x1
    80002d8c:	9d8080e7          	jalr	-1576(ra) # 80003760 <uartputc_sync>
    80002d90:	02000513          	li	a0,32
    80002d94:	00001097          	auipc	ra,0x1
    80002d98:	9cc080e7          	jalr	-1588(ra) # 80003760 <uartputc_sync>
    80002d9c:	00013403          	ld	s0,0(sp)
    80002da0:	00813083          	ld	ra,8(sp)
    80002da4:	00800513          	li	a0,8
    80002da8:	01010113          	addi	sp,sp,16
    80002dac:	00001317          	auipc	t1,0x1
    80002db0:	9b430067          	jr	-1612(t1) # 80003760 <uartputc_sync>

0000000080002db4 <consoleintr>:
    80002db4:	fe010113          	addi	sp,sp,-32
    80002db8:	00813823          	sd	s0,16(sp)
    80002dbc:	00913423          	sd	s1,8(sp)
    80002dc0:	01213023          	sd	s2,0(sp)
    80002dc4:	00113c23          	sd	ra,24(sp)
    80002dc8:	02010413          	addi	s0,sp,32
    80002dcc:	00004917          	auipc	s2,0x4
    80002dd0:	f9c90913          	addi	s2,s2,-100 # 80006d68 <cons>
    80002dd4:	00050493          	mv	s1,a0
    80002dd8:	00090513          	mv	a0,s2
    80002ddc:	00001097          	auipc	ra,0x1
    80002de0:	e40080e7          	jalr	-448(ra) # 80003c1c <acquire>
    80002de4:	02048c63          	beqz	s1,80002e1c <consoleintr+0x68>
    80002de8:	0a092783          	lw	a5,160(s2)
    80002dec:	09892703          	lw	a4,152(s2)
    80002df0:	07f00693          	li	a3,127
    80002df4:	40e7873b          	subw	a4,a5,a4
    80002df8:	02e6e263          	bltu	a3,a4,80002e1c <consoleintr+0x68>
    80002dfc:	00d00713          	li	a4,13
    80002e00:	04e48063          	beq	s1,a4,80002e40 <consoleintr+0x8c>
    80002e04:	07f7f713          	andi	a4,a5,127
    80002e08:	00e90733          	add	a4,s2,a4
    80002e0c:	0017879b          	addiw	a5,a5,1
    80002e10:	0af92023          	sw	a5,160(s2)
    80002e14:	00970c23          	sb	s1,24(a4)
    80002e18:	08f92e23          	sw	a5,156(s2)
    80002e1c:	01013403          	ld	s0,16(sp)
    80002e20:	01813083          	ld	ra,24(sp)
    80002e24:	00813483          	ld	s1,8(sp)
    80002e28:	00013903          	ld	s2,0(sp)
    80002e2c:	00004517          	auipc	a0,0x4
    80002e30:	f3c50513          	addi	a0,a0,-196 # 80006d68 <cons>
    80002e34:	02010113          	addi	sp,sp,32
    80002e38:	00001317          	auipc	t1,0x1
    80002e3c:	eb030067          	jr	-336(t1) # 80003ce8 <release>
    80002e40:	00a00493          	li	s1,10
    80002e44:	fc1ff06f          	j	80002e04 <consoleintr+0x50>

0000000080002e48 <consoleinit>:
    80002e48:	fe010113          	addi	sp,sp,-32
    80002e4c:	00113c23          	sd	ra,24(sp)
    80002e50:	00813823          	sd	s0,16(sp)
    80002e54:	00913423          	sd	s1,8(sp)
    80002e58:	02010413          	addi	s0,sp,32
    80002e5c:	00004497          	auipc	s1,0x4
    80002e60:	f0c48493          	addi	s1,s1,-244 # 80006d68 <cons>
    80002e64:	00048513          	mv	a0,s1
    80002e68:	00002597          	auipc	a1,0x2
    80002e6c:	57058593          	addi	a1,a1,1392 # 800053d8 <_ZZ12printIntegermE6digits+0x3b8>
    80002e70:	00001097          	auipc	ra,0x1
    80002e74:	d88080e7          	jalr	-632(ra) # 80003bf8 <initlock>
    80002e78:	00000097          	auipc	ra,0x0
    80002e7c:	7ac080e7          	jalr	1964(ra) # 80003624 <uartinit>
    80002e80:	01813083          	ld	ra,24(sp)
    80002e84:	01013403          	ld	s0,16(sp)
    80002e88:	00000797          	auipc	a5,0x0
    80002e8c:	d9c78793          	addi	a5,a5,-612 # 80002c24 <consoleread>
    80002e90:	0af4bc23          	sd	a5,184(s1)
    80002e94:	00000797          	auipc	a5,0x0
    80002e98:	cec78793          	addi	a5,a5,-788 # 80002b80 <consolewrite>
    80002e9c:	0cf4b023          	sd	a5,192(s1)
    80002ea0:	00813483          	ld	s1,8(sp)
    80002ea4:	02010113          	addi	sp,sp,32
    80002ea8:	00008067          	ret

0000000080002eac <console_read>:
    80002eac:	ff010113          	addi	sp,sp,-16
    80002eb0:	00813423          	sd	s0,8(sp)
    80002eb4:	01010413          	addi	s0,sp,16
    80002eb8:	00813403          	ld	s0,8(sp)
    80002ebc:	00004317          	auipc	t1,0x4
    80002ec0:	f6433303          	ld	t1,-156(t1) # 80006e20 <devsw+0x10>
    80002ec4:	01010113          	addi	sp,sp,16
    80002ec8:	00030067          	jr	t1

0000000080002ecc <console_write>:
    80002ecc:	ff010113          	addi	sp,sp,-16
    80002ed0:	00813423          	sd	s0,8(sp)
    80002ed4:	01010413          	addi	s0,sp,16
    80002ed8:	00813403          	ld	s0,8(sp)
    80002edc:	00004317          	auipc	t1,0x4
    80002ee0:	f4c33303          	ld	t1,-180(t1) # 80006e28 <devsw+0x18>
    80002ee4:	01010113          	addi	sp,sp,16
    80002ee8:	00030067          	jr	t1

0000000080002eec <panic>:
    80002eec:	fe010113          	addi	sp,sp,-32
    80002ef0:	00113c23          	sd	ra,24(sp)
    80002ef4:	00813823          	sd	s0,16(sp)
    80002ef8:	00913423          	sd	s1,8(sp)
    80002efc:	02010413          	addi	s0,sp,32
    80002f00:	00050493          	mv	s1,a0
    80002f04:	00002517          	auipc	a0,0x2
    80002f08:	4dc50513          	addi	a0,a0,1244 # 800053e0 <_ZZ12printIntegermE6digits+0x3c0>
    80002f0c:	00004797          	auipc	a5,0x4
    80002f10:	fa07ae23          	sw	zero,-68(a5) # 80006ec8 <pr+0x18>
    80002f14:	00000097          	auipc	ra,0x0
    80002f18:	034080e7          	jalr	52(ra) # 80002f48 <__printf>
    80002f1c:	00048513          	mv	a0,s1
    80002f20:	00000097          	auipc	ra,0x0
    80002f24:	028080e7          	jalr	40(ra) # 80002f48 <__printf>
    80002f28:	00002517          	auipc	a0,0x2
    80002f2c:	49850513          	addi	a0,a0,1176 # 800053c0 <_ZZ12printIntegermE6digits+0x3a0>
    80002f30:	00000097          	auipc	ra,0x0
    80002f34:	018080e7          	jalr	24(ra) # 80002f48 <__printf>
    80002f38:	00100793          	li	a5,1
    80002f3c:	00003717          	auipc	a4,0x3
    80002f40:	cef72623          	sw	a5,-788(a4) # 80005c28 <panicked>
    80002f44:	0000006f          	j	80002f44 <panic+0x58>

0000000080002f48 <__printf>:
    80002f48:	f3010113          	addi	sp,sp,-208
    80002f4c:	08813023          	sd	s0,128(sp)
    80002f50:	07313423          	sd	s3,104(sp)
    80002f54:	09010413          	addi	s0,sp,144
    80002f58:	05813023          	sd	s8,64(sp)
    80002f5c:	08113423          	sd	ra,136(sp)
    80002f60:	06913c23          	sd	s1,120(sp)
    80002f64:	07213823          	sd	s2,112(sp)
    80002f68:	07413023          	sd	s4,96(sp)
    80002f6c:	05513c23          	sd	s5,88(sp)
    80002f70:	05613823          	sd	s6,80(sp)
    80002f74:	05713423          	sd	s7,72(sp)
    80002f78:	03913c23          	sd	s9,56(sp)
    80002f7c:	03a13823          	sd	s10,48(sp)
    80002f80:	03b13423          	sd	s11,40(sp)
    80002f84:	00004317          	auipc	t1,0x4
    80002f88:	f2c30313          	addi	t1,t1,-212 # 80006eb0 <pr>
    80002f8c:	01832c03          	lw	s8,24(t1)
    80002f90:	00b43423          	sd	a1,8(s0)
    80002f94:	00c43823          	sd	a2,16(s0)
    80002f98:	00d43c23          	sd	a3,24(s0)
    80002f9c:	02e43023          	sd	a4,32(s0)
    80002fa0:	02f43423          	sd	a5,40(s0)
    80002fa4:	03043823          	sd	a6,48(s0)
    80002fa8:	03143c23          	sd	a7,56(s0)
    80002fac:	00050993          	mv	s3,a0
    80002fb0:	4a0c1663          	bnez	s8,8000345c <__printf+0x514>
    80002fb4:	60098c63          	beqz	s3,800035cc <__printf+0x684>
    80002fb8:	0009c503          	lbu	a0,0(s3)
    80002fbc:	00840793          	addi	a5,s0,8
    80002fc0:	f6f43c23          	sd	a5,-136(s0)
    80002fc4:	00000493          	li	s1,0
    80002fc8:	22050063          	beqz	a0,800031e8 <__printf+0x2a0>
    80002fcc:	00002a37          	lui	s4,0x2
    80002fd0:	00018ab7          	lui	s5,0x18
    80002fd4:	000f4b37          	lui	s6,0xf4
    80002fd8:	00989bb7          	lui	s7,0x989
    80002fdc:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80002fe0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80002fe4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80002fe8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80002fec:	00148c9b          	addiw	s9,s1,1
    80002ff0:	02500793          	li	a5,37
    80002ff4:	01998933          	add	s2,s3,s9
    80002ff8:	38f51263          	bne	a0,a5,8000337c <__printf+0x434>
    80002ffc:	00094783          	lbu	a5,0(s2)
    80003000:	00078c9b          	sext.w	s9,a5
    80003004:	1e078263          	beqz	a5,800031e8 <__printf+0x2a0>
    80003008:	0024849b          	addiw	s1,s1,2
    8000300c:	07000713          	li	a4,112
    80003010:	00998933          	add	s2,s3,s1
    80003014:	38e78a63          	beq	a5,a4,800033a8 <__printf+0x460>
    80003018:	20f76863          	bltu	a4,a5,80003228 <__printf+0x2e0>
    8000301c:	42a78863          	beq	a5,a0,8000344c <__printf+0x504>
    80003020:	06400713          	li	a4,100
    80003024:	40e79663          	bne	a5,a4,80003430 <__printf+0x4e8>
    80003028:	f7843783          	ld	a5,-136(s0)
    8000302c:	0007a603          	lw	a2,0(a5)
    80003030:	00878793          	addi	a5,a5,8
    80003034:	f6f43c23          	sd	a5,-136(s0)
    80003038:	42064a63          	bltz	a2,8000346c <__printf+0x524>
    8000303c:	00a00713          	li	a4,10
    80003040:	02e677bb          	remuw	a5,a2,a4
    80003044:	00002d97          	auipc	s11,0x2
    80003048:	3c4d8d93          	addi	s11,s11,964 # 80005408 <digits>
    8000304c:	00900593          	li	a1,9
    80003050:	0006051b          	sext.w	a0,a2
    80003054:	00000c93          	li	s9,0
    80003058:	02079793          	slli	a5,a5,0x20
    8000305c:	0207d793          	srli	a5,a5,0x20
    80003060:	00fd87b3          	add	a5,s11,a5
    80003064:	0007c783          	lbu	a5,0(a5)
    80003068:	02e656bb          	divuw	a3,a2,a4
    8000306c:	f8f40023          	sb	a5,-128(s0)
    80003070:	14c5d863          	bge	a1,a2,800031c0 <__printf+0x278>
    80003074:	06300593          	li	a1,99
    80003078:	00100c93          	li	s9,1
    8000307c:	02e6f7bb          	remuw	a5,a3,a4
    80003080:	02079793          	slli	a5,a5,0x20
    80003084:	0207d793          	srli	a5,a5,0x20
    80003088:	00fd87b3          	add	a5,s11,a5
    8000308c:	0007c783          	lbu	a5,0(a5)
    80003090:	02e6d73b          	divuw	a4,a3,a4
    80003094:	f8f400a3          	sb	a5,-127(s0)
    80003098:	12a5f463          	bgeu	a1,a0,800031c0 <__printf+0x278>
    8000309c:	00a00693          	li	a3,10
    800030a0:	00900593          	li	a1,9
    800030a4:	02d777bb          	remuw	a5,a4,a3
    800030a8:	02079793          	slli	a5,a5,0x20
    800030ac:	0207d793          	srli	a5,a5,0x20
    800030b0:	00fd87b3          	add	a5,s11,a5
    800030b4:	0007c503          	lbu	a0,0(a5)
    800030b8:	02d757bb          	divuw	a5,a4,a3
    800030bc:	f8a40123          	sb	a0,-126(s0)
    800030c0:	48e5f263          	bgeu	a1,a4,80003544 <__printf+0x5fc>
    800030c4:	06300513          	li	a0,99
    800030c8:	02d7f5bb          	remuw	a1,a5,a3
    800030cc:	02059593          	slli	a1,a1,0x20
    800030d0:	0205d593          	srli	a1,a1,0x20
    800030d4:	00bd85b3          	add	a1,s11,a1
    800030d8:	0005c583          	lbu	a1,0(a1)
    800030dc:	02d7d7bb          	divuw	a5,a5,a3
    800030e0:	f8b401a3          	sb	a1,-125(s0)
    800030e4:	48e57263          	bgeu	a0,a4,80003568 <__printf+0x620>
    800030e8:	3e700513          	li	a0,999
    800030ec:	02d7f5bb          	remuw	a1,a5,a3
    800030f0:	02059593          	slli	a1,a1,0x20
    800030f4:	0205d593          	srli	a1,a1,0x20
    800030f8:	00bd85b3          	add	a1,s11,a1
    800030fc:	0005c583          	lbu	a1,0(a1)
    80003100:	02d7d7bb          	divuw	a5,a5,a3
    80003104:	f8b40223          	sb	a1,-124(s0)
    80003108:	46e57663          	bgeu	a0,a4,80003574 <__printf+0x62c>
    8000310c:	02d7f5bb          	remuw	a1,a5,a3
    80003110:	02059593          	slli	a1,a1,0x20
    80003114:	0205d593          	srli	a1,a1,0x20
    80003118:	00bd85b3          	add	a1,s11,a1
    8000311c:	0005c583          	lbu	a1,0(a1)
    80003120:	02d7d7bb          	divuw	a5,a5,a3
    80003124:	f8b402a3          	sb	a1,-123(s0)
    80003128:	46ea7863          	bgeu	s4,a4,80003598 <__printf+0x650>
    8000312c:	02d7f5bb          	remuw	a1,a5,a3
    80003130:	02059593          	slli	a1,a1,0x20
    80003134:	0205d593          	srli	a1,a1,0x20
    80003138:	00bd85b3          	add	a1,s11,a1
    8000313c:	0005c583          	lbu	a1,0(a1)
    80003140:	02d7d7bb          	divuw	a5,a5,a3
    80003144:	f8b40323          	sb	a1,-122(s0)
    80003148:	3eeaf863          	bgeu	s5,a4,80003538 <__printf+0x5f0>
    8000314c:	02d7f5bb          	remuw	a1,a5,a3
    80003150:	02059593          	slli	a1,a1,0x20
    80003154:	0205d593          	srli	a1,a1,0x20
    80003158:	00bd85b3          	add	a1,s11,a1
    8000315c:	0005c583          	lbu	a1,0(a1)
    80003160:	02d7d7bb          	divuw	a5,a5,a3
    80003164:	f8b403a3          	sb	a1,-121(s0)
    80003168:	42eb7e63          	bgeu	s6,a4,800035a4 <__printf+0x65c>
    8000316c:	02d7f5bb          	remuw	a1,a5,a3
    80003170:	02059593          	slli	a1,a1,0x20
    80003174:	0205d593          	srli	a1,a1,0x20
    80003178:	00bd85b3          	add	a1,s11,a1
    8000317c:	0005c583          	lbu	a1,0(a1)
    80003180:	02d7d7bb          	divuw	a5,a5,a3
    80003184:	f8b40423          	sb	a1,-120(s0)
    80003188:	42ebfc63          	bgeu	s7,a4,800035c0 <__printf+0x678>
    8000318c:	02079793          	slli	a5,a5,0x20
    80003190:	0207d793          	srli	a5,a5,0x20
    80003194:	00fd8db3          	add	s11,s11,a5
    80003198:	000dc703          	lbu	a4,0(s11)
    8000319c:	00a00793          	li	a5,10
    800031a0:	00900c93          	li	s9,9
    800031a4:	f8e404a3          	sb	a4,-119(s0)
    800031a8:	00065c63          	bgez	a2,800031c0 <__printf+0x278>
    800031ac:	f9040713          	addi	a4,s0,-112
    800031b0:	00f70733          	add	a4,a4,a5
    800031b4:	02d00693          	li	a3,45
    800031b8:	fed70823          	sb	a3,-16(a4)
    800031bc:	00078c93          	mv	s9,a5
    800031c0:	f8040793          	addi	a5,s0,-128
    800031c4:	01978cb3          	add	s9,a5,s9
    800031c8:	f7f40d13          	addi	s10,s0,-129
    800031cc:	000cc503          	lbu	a0,0(s9)
    800031d0:	fffc8c93          	addi	s9,s9,-1
    800031d4:	00000097          	auipc	ra,0x0
    800031d8:	b90080e7          	jalr	-1136(ra) # 80002d64 <consputc>
    800031dc:	ffac98e3          	bne	s9,s10,800031cc <__printf+0x284>
    800031e0:	00094503          	lbu	a0,0(s2)
    800031e4:	e00514e3          	bnez	a0,80002fec <__printf+0xa4>
    800031e8:	1a0c1663          	bnez	s8,80003394 <__printf+0x44c>
    800031ec:	08813083          	ld	ra,136(sp)
    800031f0:	08013403          	ld	s0,128(sp)
    800031f4:	07813483          	ld	s1,120(sp)
    800031f8:	07013903          	ld	s2,112(sp)
    800031fc:	06813983          	ld	s3,104(sp)
    80003200:	06013a03          	ld	s4,96(sp)
    80003204:	05813a83          	ld	s5,88(sp)
    80003208:	05013b03          	ld	s6,80(sp)
    8000320c:	04813b83          	ld	s7,72(sp)
    80003210:	04013c03          	ld	s8,64(sp)
    80003214:	03813c83          	ld	s9,56(sp)
    80003218:	03013d03          	ld	s10,48(sp)
    8000321c:	02813d83          	ld	s11,40(sp)
    80003220:	0d010113          	addi	sp,sp,208
    80003224:	00008067          	ret
    80003228:	07300713          	li	a4,115
    8000322c:	1ce78a63          	beq	a5,a4,80003400 <__printf+0x4b8>
    80003230:	07800713          	li	a4,120
    80003234:	1ee79e63          	bne	a5,a4,80003430 <__printf+0x4e8>
    80003238:	f7843783          	ld	a5,-136(s0)
    8000323c:	0007a703          	lw	a4,0(a5)
    80003240:	00878793          	addi	a5,a5,8
    80003244:	f6f43c23          	sd	a5,-136(s0)
    80003248:	28074263          	bltz	a4,800034cc <__printf+0x584>
    8000324c:	00002d97          	auipc	s11,0x2
    80003250:	1bcd8d93          	addi	s11,s11,444 # 80005408 <digits>
    80003254:	00f77793          	andi	a5,a4,15
    80003258:	00fd87b3          	add	a5,s11,a5
    8000325c:	0007c683          	lbu	a3,0(a5)
    80003260:	00f00613          	li	a2,15
    80003264:	0007079b          	sext.w	a5,a4
    80003268:	f8d40023          	sb	a3,-128(s0)
    8000326c:	0047559b          	srliw	a1,a4,0x4
    80003270:	0047569b          	srliw	a3,a4,0x4
    80003274:	00000c93          	li	s9,0
    80003278:	0ee65063          	bge	a2,a4,80003358 <__printf+0x410>
    8000327c:	00f6f693          	andi	a3,a3,15
    80003280:	00dd86b3          	add	a3,s11,a3
    80003284:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80003288:	0087d79b          	srliw	a5,a5,0x8
    8000328c:	00100c93          	li	s9,1
    80003290:	f8d400a3          	sb	a3,-127(s0)
    80003294:	0cb67263          	bgeu	a2,a1,80003358 <__printf+0x410>
    80003298:	00f7f693          	andi	a3,a5,15
    8000329c:	00dd86b3          	add	a3,s11,a3
    800032a0:	0006c583          	lbu	a1,0(a3)
    800032a4:	00f00613          	li	a2,15
    800032a8:	0047d69b          	srliw	a3,a5,0x4
    800032ac:	f8b40123          	sb	a1,-126(s0)
    800032b0:	0047d593          	srli	a1,a5,0x4
    800032b4:	28f67e63          	bgeu	a2,a5,80003550 <__printf+0x608>
    800032b8:	00f6f693          	andi	a3,a3,15
    800032bc:	00dd86b3          	add	a3,s11,a3
    800032c0:	0006c503          	lbu	a0,0(a3)
    800032c4:	0087d813          	srli	a6,a5,0x8
    800032c8:	0087d69b          	srliw	a3,a5,0x8
    800032cc:	f8a401a3          	sb	a0,-125(s0)
    800032d0:	28b67663          	bgeu	a2,a1,8000355c <__printf+0x614>
    800032d4:	00f6f693          	andi	a3,a3,15
    800032d8:	00dd86b3          	add	a3,s11,a3
    800032dc:	0006c583          	lbu	a1,0(a3)
    800032e0:	00c7d513          	srli	a0,a5,0xc
    800032e4:	00c7d69b          	srliw	a3,a5,0xc
    800032e8:	f8b40223          	sb	a1,-124(s0)
    800032ec:	29067a63          	bgeu	a2,a6,80003580 <__printf+0x638>
    800032f0:	00f6f693          	andi	a3,a3,15
    800032f4:	00dd86b3          	add	a3,s11,a3
    800032f8:	0006c583          	lbu	a1,0(a3)
    800032fc:	0107d813          	srli	a6,a5,0x10
    80003300:	0107d69b          	srliw	a3,a5,0x10
    80003304:	f8b402a3          	sb	a1,-123(s0)
    80003308:	28a67263          	bgeu	a2,a0,8000358c <__printf+0x644>
    8000330c:	00f6f693          	andi	a3,a3,15
    80003310:	00dd86b3          	add	a3,s11,a3
    80003314:	0006c683          	lbu	a3,0(a3)
    80003318:	0147d79b          	srliw	a5,a5,0x14
    8000331c:	f8d40323          	sb	a3,-122(s0)
    80003320:	21067663          	bgeu	a2,a6,8000352c <__printf+0x5e4>
    80003324:	02079793          	slli	a5,a5,0x20
    80003328:	0207d793          	srli	a5,a5,0x20
    8000332c:	00fd8db3          	add	s11,s11,a5
    80003330:	000dc683          	lbu	a3,0(s11)
    80003334:	00800793          	li	a5,8
    80003338:	00700c93          	li	s9,7
    8000333c:	f8d403a3          	sb	a3,-121(s0)
    80003340:	00075c63          	bgez	a4,80003358 <__printf+0x410>
    80003344:	f9040713          	addi	a4,s0,-112
    80003348:	00f70733          	add	a4,a4,a5
    8000334c:	02d00693          	li	a3,45
    80003350:	fed70823          	sb	a3,-16(a4)
    80003354:	00078c93          	mv	s9,a5
    80003358:	f8040793          	addi	a5,s0,-128
    8000335c:	01978cb3          	add	s9,a5,s9
    80003360:	f7f40d13          	addi	s10,s0,-129
    80003364:	000cc503          	lbu	a0,0(s9)
    80003368:	fffc8c93          	addi	s9,s9,-1
    8000336c:	00000097          	auipc	ra,0x0
    80003370:	9f8080e7          	jalr	-1544(ra) # 80002d64 <consputc>
    80003374:	ff9d18e3          	bne	s10,s9,80003364 <__printf+0x41c>
    80003378:	0100006f          	j	80003388 <__printf+0x440>
    8000337c:	00000097          	auipc	ra,0x0
    80003380:	9e8080e7          	jalr	-1560(ra) # 80002d64 <consputc>
    80003384:	000c8493          	mv	s1,s9
    80003388:	00094503          	lbu	a0,0(s2)
    8000338c:	c60510e3          	bnez	a0,80002fec <__printf+0xa4>
    80003390:	e40c0ee3          	beqz	s8,800031ec <__printf+0x2a4>
    80003394:	00004517          	auipc	a0,0x4
    80003398:	b1c50513          	addi	a0,a0,-1252 # 80006eb0 <pr>
    8000339c:	00001097          	auipc	ra,0x1
    800033a0:	94c080e7          	jalr	-1716(ra) # 80003ce8 <release>
    800033a4:	e49ff06f          	j	800031ec <__printf+0x2a4>
    800033a8:	f7843783          	ld	a5,-136(s0)
    800033ac:	03000513          	li	a0,48
    800033b0:	01000d13          	li	s10,16
    800033b4:	00878713          	addi	a4,a5,8
    800033b8:	0007bc83          	ld	s9,0(a5)
    800033bc:	f6e43c23          	sd	a4,-136(s0)
    800033c0:	00000097          	auipc	ra,0x0
    800033c4:	9a4080e7          	jalr	-1628(ra) # 80002d64 <consputc>
    800033c8:	07800513          	li	a0,120
    800033cc:	00000097          	auipc	ra,0x0
    800033d0:	998080e7          	jalr	-1640(ra) # 80002d64 <consputc>
    800033d4:	00002d97          	auipc	s11,0x2
    800033d8:	034d8d93          	addi	s11,s11,52 # 80005408 <digits>
    800033dc:	03ccd793          	srli	a5,s9,0x3c
    800033e0:	00fd87b3          	add	a5,s11,a5
    800033e4:	0007c503          	lbu	a0,0(a5)
    800033e8:	fffd0d1b          	addiw	s10,s10,-1
    800033ec:	004c9c93          	slli	s9,s9,0x4
    800033f0:	00000097          	auipc	ra,0x0
    800033f4:	974080e7          	jalr	-1676(ra) # 80002d64 <consputc>
    800033f8:	fe0d12e3          	bnez	s10,800033dc <__printf+0x494>
    800033fc:	f8dff06f          	j	80003388 <__printf+0x440>
    80003400:	f7843783          	ld	a5,-136(s0)
    80003404:	0007bc83          	ld	s9,0(a5)
    80003408:	00878793          	addi	a5,a5,8
    8000340c:	f6f43c23          	sd	a5,-136(s0)
    80003410:	000c9a63          	bnez	s9,80003424 <__printf+0x4dc>
    80003414:	1080006f          	j	8000351c <__printf+0x5d4>
    80003418:	001c8c93          	addi	s9,s9,1
    8000341c:	00000097          	auipc	ra,0x0
    80003420:	948080e7          	jalr	-1720(ra) # 80002d64 <consputc>
    80003424:	000cc503          	lbu	a0,0(s9)
    80003428:	fe0518e3          	bnez	a0,80003418 <__printf+0x4d0>
    8000342c:	f5dff06f          	j	80003388 <__printf+0x440>
    80003430:	02500513          	li	a0,37
    80003434:	00000097          	auipc	ra,0x0
    80003438:	930080e7          	jalr	-1744(ra) # 80002d64 <consputc>
    8000343c:	000c8513          	mv	a0,s9
    80003440:	00000097          	auipc	ra,0x0
    80003444:	924080e7          	jalr	-1756(ra) # 80002d64 <consputc>
    80003448:	f41ff06f          	j	80003388 <__printf+0x440>
    8000344c:	02500513          	li	a0,37
    80003450:	00000097          	auipc	ra,0x0
    80003454:	914080e7          	jalr	-1772(ra) # 80002d64 <consputc>
    80003458:	f31ff06f          	j	80003388 <__printf+0x440>
    8000345c:	00030513          	mv	a0,t1
    80003460:	00000097          	auipc	ra,0x0
    80003464:	7bc080e7          	jalr	1980(ra) # 80003c1c <acquire>
    80003468:	b4dff06f          	j	80002fb4 <__printf+0x6c>
    8000346c:	40c0053b          	negw	a0,a2
    80003470:	00a00713          	li	a4,10
    80003474:	02e576bb          	remuw	a3,a0,a4
    80003478:	00002d97          	auipc	s11,0x2
    8000347c:	f90d8d93          	addi	s11,s11,-112 # 80005408 <digits>
    80003480:	ff700593          	li	a1,-9
    80003484:	02069693          	slli	a3,a3,0x20
    80003488:	0206d693          	srli	a3,a3,0x20
    8000348c:	00dd86b3          	add	a3,s11,a3
    80003490:	0006c683          	lbu	a3,0(a3)
    80003494:	02e557bb          	divuw	a5,a0,a4
    80003498:	f8d40023          	sb	a3,-128(s0)
    8000349c:	10b65e63          	bge	a2,a1,800035b8 <__printf+0x670>
    800034a0:	06300593          	li	a1,99
    800034a4:	02e7f6bb          	remuw	a3,a5,a4
    800034a8:	02069693          	slli	a3,a3,0x20
    800034ac:	0206d693          	srli	a3,a3,0x20
    800034b0:	00dd86b3          	add	a3,s11,a3
    800034b4:	0006c683          	lbu	a3,0(a3)
    800034b8:	02e7d73b          	divuw	a4,a5,a4
    800034bc:	00200793          	li	a5,2
    800034c0:	f8d400a3          	sb	a3,-127(s0)
    800034c4:	bca5ece3          	bltu	a1,a0,8000309c <__printf+0x154>
    800034c8:	ce5ff06f          	j	800031ac <__printf+0x264>
    800034cc:	40e007bb          	negw	a5,a4
    800034d0:	00002d97          	auipc	s11,0x2
    800034d4:	f38d8d93          	addi	s11,s11,-200 # 80005408 <digits>
    800034d8:	00f7f693          	andi	a3,a5,15
    800034dc:	00dd86b3          	add	a3,s11,a3
    800034e0:	0006c583          	lbu	a1,0(a3)
    800034e4:	ff100613          	li	a2,-15
    800034e8:	0047d69b          	srliw	a3,a5,0x4
    800034ec:	f8b40023          	sb	a1,-128(s0)
    800034f0:	0047d59b          	srliw	a1,a5,0x4
    800034f4:	0ac75e63          	bge	a4,a2,800035b0 <__printf+0x668>
    800034f8:	00f6f693          	andi	a3,a3,15
    800034fc:	00dd86b3          	add	a3,s11,a3
    80003500:	0006c603          	lbu	a2,0(a3)
    80003504:	00f00693          	li	a3,15
    80003508:	0087d79b          	srliw	a5,a5,0x8
    8000350c:	f8c400a3          	sb	a2,-127(s0)
    80003510:	d8b6e4e3          	bltu	a3,a1,80003298 <__printf+0x350>
    80003514:	00200793          	li	a5,2
    80003518:	e2dff06f          	j	80003344 <__printf+0x3fc>
    8000351c:	00002c97          	auipc	s9,0x2
    80003520:	eccc8c93          	addi	s9,s9,-308 # 800053e8 <_ZZ12printIntegermE6digits+0x3c8>
    80003524:	02800513          	li	a0,40
    80003528:	ef1ff06f          	j	80003418 <__printf+0x4d0>
    8000352c:	00700793          	li	a5,7
    80003530:	00600c93          	li	s9,6
    80003534:	e0dff06f          	j	80003340 <__printf+0x3f8>
    80003538:	00700793          	li	a5,7
    8000353c:	00600c93          	li	s9,6
    80003540:	c69ff06f          	j	800031a8 <__printf+0x260>
    80003544:	00300793          	li	a5,3
    80003548:	00200c93          	li	s9,2
    8000354c:	c5dff06f          	j	800031a8 <__printf+0x260>
    80003550:	00300793          	li	a5,3
    80003554:	00200c93          	li	s9,2
    80003558:	de9ff06f          	j	80003340 <__printf+0x3f8>
    8000355c:	00400793          	li	a5,4
    80003560:	00300c93          	li	s9,3
    80003564:	dddff06f          	j	80003340 <__printf+0x3f8>
    80003568:	00400793          	li	a5,4
    8000356c:	00300c93          	li	s9,3
    80003570:	c39ff06f          	j	800031a8 <__printf+0x260>
    80003574:	00500793          	li	a5,5
    80003578:	00400c93          	li	s9,4
    8000357c:	c2dff06f          	j	800031a8 <__printf+0x260>
    80003580:	00500793          	li	a5,5
    80003584:	00400c93          	li	s9,4
    80003588:	db9ff06f          	j	80003340 <__printf+0x3f8>
    8000358c:	00600793          	li	a5,6
    80003590:	00500c93          	li	s9,5
    80003594:	dadff06f          	j	80003340 <__printf+0x3f8>
    80003598:	00600793          	li	a5,6
    8000359c:	00500c93          	li	s9,5
    800035a0:	c09ff06f          	j	800031a8 <__printf+0x260>
    800035a4:	00800793          	li	a5,8
    800035a8:	00700c93          	li	s9,7
    800035ac:	bfdff06f          	j	800031a8 <__printf+0x260>
    800035b0:	00100793          	li	a5,1
    800035b4:	d91ff06f          	j	80003344 <__printf+0x3fc>
    800035b8:	00100793          	li	a5,1
    800035bc:	bf1ff06f          	j	800031ac <__printf+0x264>
    800035c0:	00900793          	li	a5,9
    800035c4:	00800c93          	li	s9,8
    800035c8:	be1ff06f          	j	800031a8 <__printf+0x260>
    800035cc:	00002517          	auipc	a0,0x2
    800035d0:	e2450513          	addi	a0,a0,-476 # 800053f0 <_ZZ12printIntegermE6digits+0x3d0>
    800035d4:	00000097          	auipc	ra,0x0
    800035d8:	918080e7          	jalr	-1768(ra) # 80002eec <panic>

00000000800035dc <printfinit>:
    800035dc:	fe010113          	addi	sp,sp,-32
    800035e0:	00813823          	sd	s0,16(sp)
    800035e4:	00913423          	sd	s1,8(sp)
    800035e8:	00113c23          	sd	ra,24(sp)
    800035ec:	02010413          	addi	s0,sp,32
    800035f0:	00004497          	auipc	s1,0x4
    800035f4:	8c048493          	addi	s1,s1,-1856 # 80006eb0 <pr>
    800035f8:	00048513          	mv	a0,s1
    800035fc:	00002597          	auipc	a1,0x2
    80003600:	e0458593          	addi	a1,a1,-508 # 80005400 <_ZZ12printIntegermE6digits+0x3e0>
    80003604:	00000097          	auipc	ra,0x0
    80003608:	5f4080e7          	jalr	1524(ra) # 80003bf8 <initlock>
    8000360c:	01813083          	ld	ra,24(sp)
    80003610:	01013403          	ld	s0,16(sp)
    80003614:	0004ac23          	sw	zero,24(s1)
    80003618:	00813483          	ld	s1,8(sp)
    8000361c:	02010113          	addi	sp,sp,32
    80003620:	00008067          	ret

0000000080003624 <uartinit>:
    80003624:	ff010113          	addi	sp,sp,-16
    80003628:	00813423          	sd	s0,8(sp)
    8000362c:	01010413          	addi	s0,sp,16
    80003630:	100007b7          	lui	a5,0x10000
    80003634:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80003638:	f8000713          	li	a4,-128
    8000363c:	00e781a3          	sb	a4,3(a5)
    80003640:	00300713          	li	a4,3
    80003644:	00e78023          	sb	a4,0(a5)
    80003648:	000780a3          	sb	zero,1(a5)
    8000364c:	00e781a3          	sb	a4,3(a5)
    80003650:	00700693          	li	a3,7
    80003654:	00d78123          	sb	a3,2(a5)
    80003658:	00e780a3          	sb	a4,1(a5)
    8000365c:	00813403          	ld	s0,8(sp)
    80003660:	01010113          	addi	sp,sp,16
    80003664:	00008067          	ret

0000000080003668 <uartputc>:
    80003668:	00002797          	auipc	a5,0x2
    8000366c:	5c07a783          	lw	a5,1472(a5) # 80005c28 <panicked>
    80003670:	00078463          	beqz	a5,80003678 <uartputc+0x10>
    80003674:	0000006f          	j	80003674 <uartputc+0xc>
    80003678:	fd010113          	addi	sp,sp,-48
    8000367c:	02813023          	sd	s0,32(sp)
    80003680:	00913c23          	sd	s1,24(sp)
    80003684:	01213823          	sd	s2,16(sp)
    80003688:	01313423          	sd	s3,8(sp)
    8000368c:	02113423          	sd	ra,40(sp)
    80003690:	03010413          	addi	s0,sp,48
    80003694:	00002917          	auipc	s2,0x2
    80003698:	59c90913          	addi	s2,s2,1436 # 80005c30 <uart_tx_r>
    8000369c:	00093783          	ld	a5,0(s2)
    800036a0:	00002497          	auipc	s1,0x2
    800036a4:	59848493          	addi	s1,s1,1432 # 80005c38 <uart_tx_w>
    800036a8:	0004b703          	ld	a4,0(s1)
    800036ac:	02078693          	addi	a3,a5,32
    800036b0:	00050993          	mv	s3,a0
    800036b4:	02e69c63          	bne	a3,a4,800036ec <uartputc+0x84>
    800036b8:	00001097          	auipc	ra,0x1
    800036bc:	834080e7          	jalr	-1996(ra) # 80003eec <push_on>
    800036c0:	00093783          	ld	a5,0(s2)
    800036c4:	0004b703          	ld	a4,0(s1)
    800036c8:	02078793          	addi	a5,a5,32
    800036cc:	00e79463          	bne	a5,a4,800036d4 <uartputc+0x6c>
    800036d0:	0000006f          	j	800036d0 <uartputc+0x68>
    800036d4:	00001097          	auipc	ra,0x1
    800036d8:	88c080e7          	jalr	-1908(ra) # 80003f60 <pop_on>
    800036dc:	00093783          	ld	a5,0(s2)
    800036e0:	0004b703          	ld	a4,0(s1)
    800036e4:	02078693          	addi	a3,a5,32
    800036e8:	fce688e3          	beq	a3,a4,800036b8 <uartputc+0x50>
    800036ec:	01f77693          	andi	a3,a4,31
    800036f0:	00003597          	auipc	a1,0x3
    800036f4:	7e058593          	addi	a1,a1,2016 # 80006ed0 <uart_tx_buf>
    800036f8:	00d586b3          	add	a3,a1,a3
    800036fc:	00170713          	addi	a4,a4,1
    80003700:	01368023          	sb	s3,0(a3)
    80003704:	00e4b023          	sd	a4,0(s1)
    80003708:	10000637          	lui	a2,0x10000
    8000370c:	02f71063          	bne	a4,a5,8000372c <uartputc+0xc4>
    80003710:	0340006f          	j	80003744 <uartputc+0xdc>
    80003714:	00074703          	lbu	a4,0(a4)
    80003718:	00f93023          	sd	a5,0(s2)
    8000371c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80003720:	00093783          	ld	a5,0(s2)
    80003724:	0004b703          	ld	a4,0(s1)
    80003728:	00f70e63          	beq	a4,a5,80003744 <uartputc+0xdc>
    8000372c:	00564683          	lbu	a3,5(a2)
    80003730:	01f7f713          	andi	a4,a5,31
    80003734:	00e58733          	add	a4,a1,a4
    80003738:	0206f693          	andi	a3,a3,32
    8000373c:	00178793          	addi	a5,a5,1
    80003740:	fc069ae3          	bnez	a3,80003714 <uartputc+0xac>
    80003744:	02813083          	ld	ra,40(sp)
    80003748:	02013403          	ld	s0,32(sp)
    8000374c:	01813483          	ld	s1,24(sp)
    80003750:	01013903          	ld	s2,16(sp)
    80003754:	00813983          	ld	s3,8(sp)
    80003758:	03010113          	addi	sp,sp,48
    8000375c:	00008067          	ret

0000000080003760 <uartputc_sync>:
    80003760:	ff010113          	addi	sp,sp,-16
    80003764:	00813423          	sd	s0,8(sp)
    80003768:	01010413          	addi	s0,sp,16
    8000376c:	00002717          	auipc	a4,0x2
    80003770:	4bc72703          	lw	a4,1212(a4) # 80005c28 <panicked>
    80003774:	02071663          	bnez	a4,800037a0 <uartputc_sync+0x40>
    80003778:	00050793          	mv	a5,a0
    8000377c:	100006b7          	lui	a3,0x10000
    80003780:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80003784:	02077713          	andi	a4,a4,32
    80003788:	fe070ce3          	beqz	a4,80003780 <uartputc_sync+0x20>
    8000378c:	0ff7f793          	andi	a5,a5,255
    80003790:	00f68023          	sb	a5,0(a3)
    80003794:	00813403          	ld	s0,8(sp)
    80003798:	01010113          	addi	sp,sp,16
    8000379c:	00008067          	ret
    800037a0:	0000006f          	j	800037a0 <uartputc_sync+0x40>

00000000800037a4 <uartstart>:
    800037a4:	ff010113          	addi	sp,sp,-16
    800037a8:	00813423          	sd	s0,8(sp)
    800037ac:	01010413          	addi	s0,sp,16
    800037b0:	00002617          	auipc	a2,0x2
    800037b4:	48060613          	addi	a2,a2,1152 # 80005c30 <uart_tx_r>
    800037b8:	00002517          	auipc	a0,0x2
    800037bc:	48050513          	addi	a0,a0,1152 # 80005c38 <uart_tx_w>
    800037c0:	00063783          	ld	a5,0(a2)
    800037c4:	00053703          	ld	a4,0(a0)
    800037c8:	04f70263          	beq	a4,a5,8000380c <uartstart+0x68>
    800037cc:	100005b7          	lui	a1,0x10000
    800037d0:	00003817          	auipc	a6,0x3
    800037d4:	70080813          	addi	a6,a6,1792 # 80006ed0 <uart_tx_buf>
    800037d8:	01c0006f          	j	800037f4 <uartstart+0x50>
    800037dc:	0006c703          	lbu	a4,0(a3)
    800037e0:	00f63023          	sd	a5,0(a2)
    800037e4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800037e8:	00063783          	ld	a5,0(a2)
    800037ec:	00053703          	ld	a4,0(a0)
    800037f0:	00f70e63          	beq	a4,a5,8000380c <uartstart+0x68>
    800037f4:	01f7f713          	andi	a4,a5,31
    800037f8:	00e806b3          	add	a3,a6,a4
    800037fc:	0055c703          	lbu	a4,5(a1)
    80003800:	00178793          	addi	a5,a5,1
    80003804:	02077713          	andi	a4,a4,32
    80003808:	fc071ae3          	bnez	a4,800037dc <uartstart+0x38>
    8000380c:	00813403          	ld	s0,8(sp)
    80003810:	01010113          	addi	sp,sp,16
    80003814:	00008067          	ret

0000000080003818 <uartgetc>:
    80003818:	ff010113          	addi	sp,sp,-16
    8000381c:	00813423          	sd	s0,8(sp)
    80003820:	01010413          	addi	s0,sp,16
    80003824:	10000737          	lui	a4,0x10000
    80003828:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000382c:	0017f793          	andi	a5,a5,1
    80003830:	00078c63          	beqz	a5,80003848 <uartgetc+0x30>
    80003834:	00074503          	lbu	a0,0(a4)
    80003838:	0ff57513          	andi	a0,a0,255
    8000383c:	00813403          	ld	s0,8(sp)
    80003840:	01010113          	addi	sp,sp,16
    80003844:	00008067          	ret
    80003848:	fff00513          	li	a0,-1
    8000384c:	ff1ff06f          	j	8000383c <uartgetc+0x24>

0000000080003850 <uartintr>:
    80003850:	100007b7          	lui	a5,0x10000
    80003854:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80003858:	0017f793          	andi	a5,a5,1
    8000385c:	0a078463          	beqz	a5,80003904 <uartintr+0xb4>
    80003860:	fe010113          	addi	sp,sp,-32
    80003864:	00813823          	sd	s0,16(sp)
    80003868:	00913423          	sd	s1,8(sp)
    8000386c:	00113c23          	sd	ra,24(sp)
    80003870:	02010413          	addi	s0,sp,32
    80003874:	100004b7          	lui	s1,0x10000
    80003878:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000387c:	0ff57513          	andi	a0,a0,255
    80003880:	fffff097          	auipc	ra,0xfffff
    80003884:	534080e7          	jalr	1332(ra) # 80002db4 <consoleintr>
    80003888:	0054c783          	lbu	a5,5(s1)
    8000388c:	0017f793          	andi	a5,a5,1
    80003890:	fe0794e3          	bnez	a5,80003878 <uartintr+0x28>
    80003894:	00002617          	auipc	a2,0x2
    80003898:	39c60613          	addi	a2,a2,924 # 80005c30 <uart_tx_r>
    8000389c:	00002517          	auipc	a0,0x2
    800038a0:	39c50513          	addi	a0,a0,924 # 80005c38 <uart_tx_w>
    800038a4:	00063783          	ld	a5,0(a2)
    800038a8:	00053703          	ld	a4,0(a0)
    800038ac:	04f70263          	beq	a4,a5,800038f0 <uartintr+0xa0>
    800038b0:	100005b7          	lui	a1,0x10000
    800038b4:	00003817          	auipc	a6,0x3
    800038b8:	61c80813          	addi	a6,a6,1564 # 80006ed0 <uart_tx_buf>
    800038bc:	01c0006f          	j	800038d8 <uartintr+0x88>
    800038c0:	0006c703          	lbu	a4,0(a3)
    800038c4:	00f63023          	sd	a5,0(a2)
    800038c8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800038cc:	00063783          	ld	a5,0(a2)
    800038d0:	00053703          	ld	a4,0(a0)
    800038d4:	00f70e63          	beq	a4,a5,800038f0 <uartintr+0xa0>
    800038d8:	01f7f713          	andi	a4,a5,31
    800038dc:	00e806b3          	add	a3,a6,a4
    800038e0:	0055c703          	lbu	a4,5(a1)
    800038e4:	00178793          	addi	a5,a5,1
    800038e8:	02077713          	andi	a4,a4,32
    800038ec:	fc071ae3          	bnez	a4,800038c0 <uartintr+0x70>
    800038f0:	01813083          	ld	ra,24(sp)
    800038f4:	01013403          	ld	s0,16(sp)
    800038f8:	00813483          	ld	s1,8(sp)
    800038fc:	02010113          	addi	sp,sp,32
    80003900:	00008067          	ret
    80003904:	00002617          	auipc	a2,0x2
    80003908:	32c60613          	addi	a2,a2,812 # 80005c30 <uart_tx_r>
    8000390c:	00002517          	auipc	a0,0x2
    80003910:	32c50513          	addi	a0,a0,812 # 80005c38 <uart_tx_w>
    80003914:	00063783          	ld	a5,0(a2)
    80003918:	00053703          	ld	a4,0(a0)
    8000391c:	04f70263          	beq	a4,a5,80003960 <uartintr+0x110>
    80003920:	100005b7          	lui	a1,0x10000
    80003924:	00003817          	auipc	a6,0x3
    80003928:	5ac80813          	addi	a6,a6,1452 # 80006ed0 <uart_tx_buf>
    8000392c:	01c0006f          	j	80003948 <uartintr+0xf8>
    80003930:	0006c703          	lbu	a4,0(a3)
    80003934:	00f63023          	sd	a5,0(a2)
    80003938:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000393c:	00063783          	ld	a5,0(a2)
    80003940:	00053703          	ld	a4,0(a0)
    80003944:	02f70063          	beq	a4,a5,80003964 <uartintr+0x114>
    80003948:	01f7f713          	andi	a4,a5,31
    8000394c:	00e806b3          	add	a3,a6,a4
    80003950:	0055c703          	lbu	a4,5(a1)
    80003954:	00178793          	addi	a5,a5,1
    80003958:	02077713          	andi	a4,a4,32
    8000395c:	fc071ae3          	bnez	a4,80003930 <uartintr+0xe0>
    80003960:	00008067          	ret
    80003964:	00008067          	ret

0000000080003968 <kinit>:
    80003968:	fc010113          	addi	sp,sp,-64
    8000396c:	02913423          	sd	s1,40(sp)
    80003970:	fffff7b7          	lui	a5,0xfffff
    80003974:	00004497          	auipc	s1,0x4
    80003978:	57b48493          	addi	s1,s1,1403 # 80007eef <end+0xfff>
    8000397c:	02813823          	sd	s0,48(sp)
    80003980:	01313c23          	sd	s3,24(sp)
    80003984:	00f4f4b3          	and	s1,s1,a5
    80003988:	02113c23          	sd	ra,56(sp)
    8000398c:	03213023          	sd	s2,32(sp)
    80003990:	01413823          	sd	s4,16(sp)
    80003994:	01513423          	sd	s5,8(sp)
    80003998:	04010413          	addi	s0,sp,64
    8000399c:	000017b7          	lui	a5,0x1
    800039a0:	01100993          	li	s3,17
    800039a4:	00f487b3          	add	a5,s1,a5
    800039a8:	01b99993          	slli	s3,s3,0x1b
    800039ac:	06f9e063          	bltu	s3,a5,80003a0c <kinit+0xa4>
    800039b0:	00003a97          	auipc	s5,0x3
    800039b4:	540a8a93          	addi	s5,s5,1344 # 80006ef0 <end>
    800039b8:	0754ec63          	bltu	s1,s5,80003a30 <kinit+0xc8>
    800039bc:	0734fa63          	bgeu	s1,s3,80003a30 <kinit+0xc8>
    800039c0:	00088a37          	lui	s4,0x88
    800039c4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    800039c8:	00002917          	auipc	s2,0x2
    800039cc:	27890913          	addi	s2,s2,632 # 80005c40 <kmem>
    800039d0:	00ca1a13          	slli	s4,s4,0xc
    800039d4:	0140006f          	j	800039e8 <kinit+0x80>
    800039d8:	000017b7          	lui	a5,0x1
    800039dc:	00f484b3          	add	s1,s1,a5
    800039e0:	0554e863          	bltu	s1,s5,80003a30 <kinit+0xc8>
    800039e4:	0534f663          	bgeu	s1,s3,80003a30 <kinit+0xc8>
    800039e8:	00001637          	lui	a2,0x1
    800039ec:	00100593          	li	a1,1
    800039f0:	00048513          	mv	a0,s1
    800039f4:	00000097          	auipc	ra,0x0
    800039f8:	5e4080e7          	jalr	1508(ra) # 80003fd8 <__memset>
    800039fc:	00093783          	ld	a5,0(s2)
    80003a00:	00f4b023          	sd	a5,0(s1)
    80003a04:	00993023          	sd	s1,0(s2)
    80003a08:	fd4498e3          	bne	s1,s4,800039d8 <kinit+0x70>
    80003a0c:	03813083          	ld	ra,56(sp)
    80003a10:	03013403          	ld	s0,48(sp)
    80003a14:	02813483          	ld	s1,40(sp)
    80003a18:	02013903          	ld	s2,32(sp)
    80003a1c:	01813983          	ld	s3,24(sp)
    80003a20:	01013a03          	ld	s4,16(sp)
    80003a24:	00813a83          	ld	s5,8(sp)
    80003a28:	04010113          	addi	sp,sp,64
    80003a2c:	00008067          	ret
    80003a30:	00002517          	auipc	a0,0x2
    80003a34:	9f050513          	addi	a0,a0,-1552 # 80005420 <digits+0x18>
    80003a38:	fffff097          	auipc	ra,0xfffff
    80003a3c:	4b4080e7          	jalr	1204(ra) # 80002eec <panic>

0000000080003a40 <freerange>:
    80003a40:	fc010113          	addi	sp,sp,-64
    80003a44:	000017b7          	lui	a5,0x1
    80003a48:	02913423          	sd	s1,40(sp)
    80003a4c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80003a50:	009504b3          	add	s1,a0,s1
    80003a54:	fffff537          	lui	a0,0xfffff
    80003a58:	02813823          	sd	s0,48(sp)
    80003a5c:	02113c23          	sd	ra,56(sp)
    80003a60:	03213023          	sd	s2,32(sp)
    80003a64:	01313c23          	sd	s3,24(sp)
    80003a68:	01413823          	sd	s4,16(sp)
    80003a6c:	01513423          	sd	s5,8(sp)
    80003a70:	01613023          	sd	s6,0(sp)
    80003a74:	04010413          	addi	s0,sp,64
    80003a78:	00a4f4b3          	and	s1,s1,a0
    80003a7c:	00f487b3          	add	a5,s1,a5
    80003a80:	06f5e463          	bltu	a1,a5,80003ae8 <freerange+0xa8>
    80003a84:	00003a97          	auipc	s5,0x3
    80003a88:	46ca8a93          	addi	s5,s5,1132 # 80006ef0 <end>
    80003a8c:	0954e263          	bltu	s1,s5,80003b10 <freerange+0xd0>
    80003a90:	01100993          	li	s3,17
    80003a94:	01b99993          	slli	s3,s3,0x1b
    80003a98:	0734fc63          	bgeu	s1,s3,80003b10 <freerange+0xd0>
    80003a9c:	00058a13          	mv	s4,a1
    80003aa0:	00002917          	auipc	s2,0x2
    80003aa4:	1a090913          	addi	s2,s2,416 # 80005c40 <kmem>
    80003aa8:	00002b37          	lui	s6,0x2
    80003aac:	0140006f          	j	80003ac0 <freerange+0x80>
    80003ab0:	000017b7          	lui	a5,0x1
    80003ab4:	00f484b3          	add	s1,s1,a5
    80003ab8:	0554ec63          	bltu	s1,s5,80003b10 <freerange+0xd0>
    80003abc:	0534fa63          	bgeu	s1,s3,80003b10 <freerange+0xd0>
    80003ac0:	00001637          	lui	a2,0x1
    80003ac4:	00100593          	li	a1,1
    80003ac8:	00048513          	mv	a0,s1
    80003acc:	00000097          	auipc	ra,0x0
    80003ad0:	50c080e7          	jalr	1292(ra) # 80003fd8 <__memset>
    80003ad4:	00093703          	ld	a4,0(s2)
    80003ad8:	016487b3          	add	a5,s1,s6
    80003adc:	00e4b023          	sd	a4,0(s1)
    80003ae0:	00993023          	sd	s1,0(s2)
    80003ae4:	fcfa76e3          	bgeu	s4,a5,80003ab0 <freerange+0x70>
    80003ae8:	03813083          	ld	ra,56(sp)
    80003aec:	03013403          	ld	s0,48(sp)
    80003af0:	02813483          	ld	s1,40(sp)
    80003af4:	02013903          	ld	s2,32(sp)
    80003af8:	01813983          	ld	s3,24(sp)
    80003afc:	01013a03          	ld	s4,16(sp)
    80003b00:	00813a83          	ld	s5,8(sp)
    80003b04:	00013b03          	ld	s6,0(sp)
    80003b08:	04010113          	addi	sp,sp,64
    80003b0c:	00008067          	ret
    80003b10:	00002517          	auipc	a0,0x2
    80003b14:	91050513          	addi	a0,a0,-1776 # 80005420 <digits+0x18>
    80003b18:	fffff097          	auipc	ra,0xfffff
    80003b1c:	3d4080e7          	jalr	980(ra) # 80002eec <panic>

0000000080003b20 <kfree>:
    80003b20:	fe010113          	addi	sp,sp,-32
    80003b24:	00813823          	sd	s0,16(sp)
    80003b28:	00113c23          	sd	ra,24(sp)
    80003b2c:	00913423          	sd	s1,8(sp)
    80003b30:	02010413          	addi	s0,sp,32
    80003b34:	03451793          	slli	a5,a0,0x34
    80003b38:	04079c63          	bnez	a5,80003b90 <kfree+0x70>
    80003b3c:	00003797          	auipc	a5,0x3
    80003b40:	3b478793          	addi	a5,a5,948 # 80006ef0 <end>
    80003b44:	00050493          	mv	s1,a0
    80003b48:	04f56463          	bltu	a0,a5,80003b90 <kfree+0x70>
    80003b4c:	01100793          	li	a5,17
    80003b50:	01b79793          	slli	a5,a5,0x1b
    80003b54:	02f57e63          	bgeu	a0,a5,80003b90 <kfree+0x70>
    80003b58:	00001637          	lui	a2,0x1
    80003b5c:	00100593          	li	a1,1
    80003b60:	00000097          	auipc	ra,0x0
    80003b64:	478080e7          	jalr	1144(ra) # 80003fd8 <__memset>
    80003b68:	00002797          	auipc	a5,0x2
    80003b6c:	0d878793          	addi	a5,a5,216 # 80005c40 <kmem>
    80003b70:	0007b703          	ld	a4,0(a5)
    80003b74:	01813083          	ld	ra,24(sp)
    80003b78:	01013403          	ld	s0,16(sp)
    80003b7c:	00e4b023          	sd	a4,0(s1)
    80003b80:	0097b023          	sd	s1,0(a5)
    80003b84:	00813483          	ld	s1,8(sp)
    80003b88:	02010113          	addi	sp,sp,32
    80003b8c:	00008067          	ret
    80003b90:	00002517          	auipc	a0,0x2
    80003b94:	89050513          	addi	a0,a0,-1904 # 80005420 <digits+0x18>
    80003b98:	fffff097          	auipc	ra,0xfffff
    80003b9c:	354080e7          	jalr	852(ra) # 80002eec <panic>

0000000080003ba0 <kalloc>:
    80003ba0:	fe010113          	addi	sp,sp,-32
    80003ba4:	00813823          	sd	s0,16(sp)
    80003ba8:	00913423          	sd	s1,8(sp)
    80003bac:	00113c23          	sd	ra,24(sp)
    80003bb0:	02010413          	addi	s0,sp,32
    80003bb4:	00002797          	auipc	a5,0x2
    80003bb8:	08c78793          	addi	a5,a5,140 # 80005c40 <kmem>
    80003bbc:	0007b483          	ld	s1,0(a5)
    80003bc0:	02048063          	beqz	s1,80003be0 <kalloc+0x40>
    80003bc4:	0004b703          	ld	a4,0(s1)
    80003bc8:	00001637          	lui	a2,0x1
    80003bcc:	00500593          	li	a1,5
    80003bd0:	00048513          	mv	a0,s1
    80003bd4:	00e7b023          	sd	a4,0(a5)
    80003bd8:	00000097          	auipc	ra,0x0
    80003bdc:	400080e7          	jalr	1024(ra) # 80003fd8 <__memset>
    80003be0:	01813083          	ld	ra,24(sp)
    80003be4:	01013403          	ld	s0,16(sp)
    80003be8:	00048513          	mv	a0,s1
    80003bec:	00813483          	ld	s1,8(sp)
    80003bf0:	02010113          	addi	sp,sp,32
    80003bf4:	00008067          	ret

0000000080003bf8 <initlock>:
    80003bf8:	ff010113          	addi	sp,sp,-16
    80003bfc:	00813423          	sd	s0,8(sp)
    80003c00:	01010413          	addi	s0,sp,16
    80003c04:	00813403          	ld	s0,8(sp)
    80003c08:	00b53423          	sd	a1,8(a0)
    80003c0c:	00052023          	sw	zero,0(a0)
    80003c10:	00053823          	sd	zero,16(a0)
    80003c14:	01010113          	addi	sp,sp,16
    80003c18:	00008067          	ret

0000000080003c1c <acquire>:
    80003c1c:	fe010113          	addi	sp,sp,-32
    80003c20:	00813823          	sd	s0,16(sp)
    80003c24:	00913423          	sd	s1,8(sp)
    80003c28:	00113c23          	sd	ra,24(sp)
    80003c2c:	01213023          	sd	s2,0(sp)
    80003c30:	02010413          	addi	s0,sp,32
    80003c34:	00050493          	mv	s1,a0
    80003c38:	10002973          	csrr	s2,sstatus
    80003c3c:	100027f3          	csrr	a5,sstatus
    80003c40:	ffd7f793          	andi	a5,a5,-3
    80003c44:	10079073          	csrw	sstatus,a5
    80003c48:	fffff097          	auipc	ra,0xfffff
    80003c4c:	8e0080e7          	jalr	-1824(ra) # 80002528 <mycpu>
    80003c50:	07852783          	lw	a5,120(a0)
    80003c54:	06078e63          	beqz	a5,80003cd0 <acquire+0xb4>
    80003c58:	fffff097          	auipc	ra,0xfffff
    80003c5c:	8d0080e7          	jalr	-1840(ra) # 80002528 <mycpu>
    80003c60:	07852783          	lw	a5,120(a0)
    80003c64:	0004a703          	lw	a4,0(s1)
    80003c68:	0017879b          	addiw	a5,a5,1
    80003c6c:	06f52c23          	sw	a5,120(a0)
    80003c70:	04071063          	bnez	a4,80003cb0 <acquire+0x94>
    80003c74:	00100713          	li	a4,1
    80003c78:	00070793          	mv	a5,a4
    80003c7c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80003c80:	0007879b          	sext.w	a5,a5
    80003c84:	fe079ae3          	bnez	a5,80003c78 <acquire+0x5c>
    80003c88:	0ff0000f          	fence
    80003c8c:	fffff097          	auipc	ra,0xfffff
    80003c90:	89c080e7          	jalr	-1892(ra) # 80002528 <mycpu>
    80003c94:	01813083          	ld	ra,24(sp)
    80003c98:	01013403          	ld	s0,16(sp)
    80003c9c:	00a4b823          	sd	a0,16(s1)
    80003ca0:	00013903          	ld	s2,0(sp)
    80003ca4:	00813483          	ld	s1,8(sp)
    80003ca8:	02010113          	addi	sp,sp,32
    80003cac:	00008067          	ret
    80003cb0:	0104b903          	ld	s2,16(s1)
    80003cb4:	fffff097          	auipc	ra,0xfffff
    80003cb8:	874080e7          	jalr	-1932(ra) # 80002528 <mycpu>
    80003cbc:	faa91ce3          	bne	s2,a0,80003c74 <acquire+0x58>
    80003cc0:	00001517          	auipc	a0,0x1
    80003cc4:	76850513          	addi	a0,a0,1896 # 80005428 <digits+0x20>
    80003cc8:	fffff097          	auipc	ra,0xfffff
    80003ccc:	224080e7          	jalr	548(ra) # 80002eec <panic>
    80003cd0:	00195913          	srli	s2,s2,0x1
    80003cd4:	fffff097          	auipc	ra,0xfffff
    80003cd8:	854080e7          	jalr	-1964(ra) # 80002528 <mycpu>
    80003cdc:	00197913          	andi	s2,s2,1
    80003ce0:	07252e23          	sw	s2,124(a0)
    80003ce4:	f75ff06f          	j	80003c58 <acquire+0x3c>

0000000080003ce8 <release>:
    80003ce8:	fe010113          	addi	sp,sp,-32
    80003cec:	00813823          	sd	s0,16(sp)
    80003cf0:	00113c23          	sd	ra,24(sp)
    80003cf4:	00913423          	sd	s1,8(sp)
    80003cf8:	01213023          	sd	s2,0(sp)
    80003cfc:	02010413          	addi	s0,sp,32
    80003d00:	00052783          	lw	a5,0(a0)
    80003d04:	00079a63          	bnez	a5,80003d18 <release+0x30>
    80003d08:	00001517          	auipc	a0,0x1
    80003d0c:	72850513          	addi	a0,a0,1832 # 80005430 <digits+0x28>
    80003d10:	fffff097          	auipc	ra,0xfffff
    80003d14:	1dc080e7          	jalr	476(ra) # 80002eec <panic>
    80003d18:	01053903          	ld	s2,16(a0)
    80003d1c:	00050493          	mv	s1,a0
    80003d20:	fffff097          	auipc	ra,0xfffff
    80003d24:	808080e7          	jalr	-2040(ra) # 80002528 <mycpu>
    80003d28:	fea910e3          	bne	s2,a0,80003d08 <release+0x20>
    80003d2c:	0004b823          	sd	zero,16(s1)
    80003d30:	0ff0000f          	fence
    80003d34:	0f50000f          	fence	iorw,ow
    80003d38:	0804a02f          	amoswap.w	zero,zero,(s1)
    80003d3c:	ffffe097          	auipc	ra,0xffffe
    80003d40:	7ec080e7          	jalr	2028(ra) # 80002528 <mycpu>
    80003d44:	100027f3          	csrr	a5,sstatus
    80003d48:	0027f793          	andi	a5,a5,2
    80003d4c:	04079a63          	bnez	a5,80003da0 <release+0xb8>
    80003d50:	07852783          	lw	a5,120(a0)
    80003d54:	02f05e63          	blez	a5,80003d90 <release+0xa8>
    80003d58:	fff7871b          	addiw	a4,a5,-1
    80003d5c:	06e52c23          	sw	a4,120(a0)
    80003d60:	00071c63          	bnez	a4,80003d78 <release+0x90>
    80003d64:	07c52783          	lw	a5,124(a0)
    80003d68:	00078863          	beqz	a5,80003d78 <release+0x90>
    80003d6c:	100027f3          	csrr	a5,sstatus
    80003d70:	0027e793          	ori	a5,a5,2
    80003d74:	10079073          	csrw	sstatus,a5
    80003d78:	01813083          	ld	ra,24(sp)
    80003d7c:	01013403          	ld	s0,16(sp)
    80003d80:	00813483          	ld	s1,8(sp)
    80003d84:	00013903          	ld	s2,0(sp)
    80003d88:	02010113          	addi	sp,sp,32
    80003d8c:	00008067          	ret
    80003d90:	00001517          	auipc	a0,0x1
    80003d94:	6c050513          	addi	a0,a0,1728 # 80005450 <digits+0x48>
    80003d98:	fffff097          	auipc	ra,0xfffff
    80003d9c:	154080e7          	jalr	340(ra) # 80002eec <panic>
    80003da0:	00001517          	auipc	a0,0x1
    80003da4:	69850513          	addi	a0,a0,1688 # 80005438 <digits+0x30>
    80003da8:	fffff097          	auipc	ra,0xfffff
    80003dac:	144080e7          	jalr	324(ra) # 80002eec <panic>

0000000080003db0 <holding>:
    80003db0:	00052783          	lw	a5,0(a0)
    80003db4:	00079663          	bnez	a5,80003dc0 <holding+0x10>
    80003db8:	00000513          	li	a0,0
    80003dbc:	00008067          	ret
    80003dc0:	fe010113          	addi	sp,sp,-32
    80003dc4:	00813823          	sd	s0,16(sp)
    80003dc8:	00913423          	sd	s1,8(sp)
    80003dcc:	00113c23          	sd	ra,24(sp)
    80003dd0:	02010413          	addi	s0,sp,32
    80003dd4:	01053483          	ld	s1,16(a0)
    80003dd8:	ffffe097          	auipc	ra,0xffffe
    80003ddc:	750080e7          	jalr	1872(ra) # 80002528 <mycpu>
    80003de0:	01813083          	ld	ra,24(sp)
    80003de4:	01013403          	ld	s0,16(sp)
    80003de8:	40a48533          	sub	a0,s1,a0
    80003dec:	00153513          	seqz	a0,a0
    80003df0:	00813483          	ld	s1,8(sp)
    80003df4:	02010113          	addi	sp,sp,32
    80003df8:	00008067          	ret

0000000080003dfc <push_off>:
    80003dfc:	fe010113          	addi	sp,sp,-32
    80003e00:	00813823          	sd	s0,16(sp)
    80003e04:	00113c23          	sd	ra,24(sp)
    80003e08:	00913423          	sd	s1,8(sp)
    80003e0c:	02010413          	addi	s0,sp,32
    80003e10:	100024f3          	csrr	s1,sstatus
    80003e14:	100027f3          	csrr	a5,sstatus
    80003e18:	ffd7f793          	andi	a5,a5,-3
    80003e1c:	10079073          	csrw	sstatus,a5
    80003e20:	ffffe097          	auipc	ra,0xffffe
    80003e24:	708080e7          	jalr	1800(ra) # 80002528 <mycpu>
    80003e28:	07852783          	lw	a5,120(a0)
    80003e2c:	02078663          	beqz	a5,80003e58 <push_off+0x5c>
    80003e30:	ffffe097          	auipc	ra,0xffffe
    80003e34:	6f8080e7          	jalr	1784(ra) # 80002528 <mycpu>
    80003e38:	07852783          	lw	a5,120(a0)
    80003e3c:	01813083          	ld	ra,24(sp)
    80003e40:	01013403          	ld	s0,16(sp)
    80003e44:	0017879b          	addiw	a5,a5,1
    80003e48:	06f52c23          	sw	a5,120(a0)
    80003e4c:	00813483          	ld	s1,8(sp)
    80003e50:	02010113          	addi	sp,sp,32
    80003e54:	00008067          	ret
    80003e58:	0014d493          	srli	s1,s1,0x1
    80003e5c:	ffffe097          	auipc	ra,0xffffe
    80003e60:	6cc080e7          	jalr	1740(ra) # 80002528 <mycpu>
    80003e64:	0014f493          	andi	s1,s1,1
    80003e68:	06952e23          	sw	s1,124(a0)
    80003e6c:	fc5ff06f          	j	80003e30 <push_off+0x34>

0000000080003e70 <pop_off>:
    80003e70:	ff010113          	addi	sp,sp,-16
    80003e74:	00813023          	sd	s0,0(sp)
    80003e78:	00113423          	sd	ra,8(sp)
    80003e7c:	01010413          	addi	s0,sp,16
    80003e80:	ffffe097          	auipc	ra,0xffffe
    80003e84:	6a8080e7          	jalr	1704(ra) # 80002528 <mycpu>
    80003e88:	100027f3          	csrr	a5,sstatus
    80003e8c:	0027f793          	andi	a5,a5,2
    80003e90:	04079663          	bnez	a5,80003edc <pop_off+0x6c>
    80003e94:	07852783          	lw	a5,120(a0)
    80003e98:	02f05a63          	blez	a5,80003ecc <pop_off+0x5c>
    80003e9c:	fff7871b          	addiw	a4,a5,-1
    80003ea0:	06e52c23          	sw	a4,120(a0)
    80003ea4:	00071c63          	bnez	a4,80003ebc <pop_off+0x4c>
    80003ea8:	07c52783          	lw	a5,124(a0)
    80003eac:	00078863          	beqz	a5,80003ebc <pop_off+0x4c>
    80003eb0:	100027f3          	csrr	a5,sstatus
    80003eb4:	0027e793          	ori	a5,a5,2
    80003eb8:	10079073          	csrw	sstatus,a5
    80003ebc:	00813083          	ld	ra,8(sp)
    80003ec0:	00013403          	ld	s0,0(sp)
    80003ec4:	01010113          	addi	sp,sp,16
    80003ec8:	00008067          	ret
    80003ecc:	00001517          	auipc	a0,0x1
    80003ed0:	58450513          	addi	a0,a0,1412 # 80005450 <digits+0x48>
    80003ed4:	fffff097          	auipc	ra,0xfffff
    80003ed8:	018080e7          	jalr	24(ra) # 80002eec <panic>
    80003edc:	00001517          	auipc	a0,0x1
    80003ee0:	55c50513          	addi	a0,a0,1372 # 80005438 <digits+0x30>
    80003ee4:	fffff097          	auipc	ra,0xfffff
    80003ee8:	008080e7          	jalr	8(ra) # 80002eec <panic>

0000000080003eec <push_on>:
    80003eec:	fe010113          	addi	sp,sp,-32
    80003ef0:	00813823          	sd	s0,16(sp)
    80003ef4:	00113c23          	sd	ra,24(sp)
    80003ef8:	00913423          	sd	s1,8(sp)
    80003efc:	02010413          	addi	s0,sp,32
    80003f00:	100024f3          	csrr	s1,sstatus
    80003f04:	100027f3          	csrr	a5,sstatus
    80003f08:	0027e793          	ori	a5,a5,2
    80003f0c:	10079073          	csrw	sstatus,a5
    80003f10:	ffffe097          	auipc	ra,0xffffe
    80003f14:	618080e7          	jalr	1560(ra) # 80002528 <mycpu>
    80003f18:	07852783          	lw	a5,120(a0)
    80003f1c:	02078663          	beqz	a5,80003f48 <push_on+0x5c>
    80003f20:	ffffe097          	auipc	ra,0xffffe
    80003f24:	608080e7          	jalr	1544(ra) # 80002528 <mycpu>
    80003f28:	07852783          	lw	a5,120(a0)
    80003f2c:	01813083          	ld	ra,24(sp)
    80003f30:	01013403          	ld	s0,16(sp)
    80003f34:	0017879b          	addiw	a5,a5,1
    80003f38:	06f52c23          	sw	a5,120(a0)
    80003f3c:	00813483          	ld	s1,8(sp)
    80003f40:	02010113          	addi	sp,sp,32
    80003f44:	00008067          	ret
    80003f48:	0014d493          	srli	s1,s1,0x1
    80003f4c:	ffffe097          	auipc	ra,0xffffe
    80003f50:	5dc080e7          	jalr	1500(ra) # 80002528 <mycpu>
    80003f54:	0014f493          	andi	s1,s1,1
    80003f58:	06952e23          	sw	s1,124(a0)
    80003f5c:	fc5ff06f          	j	80003f20 <push_on+0x34>

0000000080003f60 <pop_on>:
    80003f60:	ff010113          	addi	sp,sp,-16
    80003f64:	00813023          	sd	s0,0(sp)
    80003f68:	00113423          	sd	ra,8(sp)
    80003f6c:	01010413          	addi	s0,sp,16
    80003f70:	ffffe097          	auipc	ra,0xffffe
    80003f74:	5b8080e7          	jalr	1464(ra) # 80002528 <mycpu>
    80003f78:	100027f3          	csrr	a5,sstatus
    80003f7c:	0027f793          	andi	a5,a5,2
    80003f80:	04078463          	beqz	a5,80003fc8 <pop_on+0x68>
    80003f84:	07852783          	lw	a5,120(a0)
    80003f88:	02f05863          	blez	a5,80003fb8 <pop_on+0x58>
    80003f8c:	fff7879b          	addiw	a5,a5,-1
    80003f90:	06f52c23          	sw	a5,120(a0)
    80003f94:	07853783          	ld	a5,120(a0)
    80003f98:	00079863          	bnez	a5,80003fa8 <pop_on+0x48>
    80003f9c:	100027f3          	csrr	a5,sstatus
    80003fa0:	ffd7f793          	andi	a5,a5,-3
    80003fa4:	10079073          	csrw	sstatus,a5
    80003fa8:	00813083          	ld	ra,8(sp)
    80003fac:	00013403          	ld	s0,0(sp)
    80003fb0:	01010113          	addi	sp,sp,16
    80003fb4:	00008067          	ret
    80003fb8:	00001517          	auipc	a0,0x1
    80003fbc:	4c050513          	addi	a0,a0,1216 # 80005478 <digits+0x70>
    80003fc0:	fffff097          	auipc	ra,0xfffff
    80003fc4:	f2c080e7          	jalr	-212(ra) # 80002eec <panic>
    80003fc8:	00001517          	auipc	a0,0x1
    80003fcc:	49050513          	addi	a0,a0,1168 # 80005458 <digits+0x50>
    80003fd0:	fffff097          	auipc	ra,0xfffff
    80003fd4:	f1c080e7          	jalr	-228(ra) # 80002eec <panic>

0000000080003fd8 <__memset>:
    80003fd8:	ff010113          	addi	sp,sp,-16
    80003fdc:	00813423          	sd	s0,8(sp)
    80003fe0:	01010413          	addi	s0,sp,16
    80003fe4:	1a060e63          	beqz	a2,800041a0 <__memset+0x1c8>
    80003fe8:	40a007b3          	neg	a5,a0
    80003fec:	0077f793          	andi	a5,a5,7
    80003ff0:	00778693          	addi	a3,a5,7
    80003ff4:	00b00813          	li	a6,11
    80003ff8:	0ff5f593          	andi	a1,a1,255
    80003ffc:	fff6071b          	addiw	a4,a2,-1
    80004000:	1b06e663          	bltu	a3,a6,800041ac <__memset+0x1d4>
    80004004:	1cd76463          	bltu	a4,a3,800041cc <__memset+0x1f4>
    80004008:	1a078e63          	beqz	a5,800041c4 <__memset+0x1ec>
    8000400c:	00b50023          	sb	a1,0(a0)
    80004010:	00100713          	li	a4,1
    80004014:	1ae78463          	beq	a5,a4,800041bc <__memset+0x1e4>
    80004018:	00b500a3          	sb	a1,1(a0)
    8000401c:	00200713          	li	a4,2
    80004020:	1ae78a63          	beq	a5,a4,800041d4 <__memset+0x1fc>
    80004024:	00b50123          	sb	a1,2(a0)
    80004028:	00300713          	li	a4,3
    8000402c:	18e78463          	beq	a5,a4,800041b4 <__memset+0x1dc>
    80004030:	00b501a3          	sb	a1,3(a0)
    80004034:	00400713          	li	a4,4
    80004038:	1ae78263          	beq	a5,a4,800041dc <__memset+0x204>
    8000403c:	00b50223          	sb	a1,4(a0)
    80004040:	00500713          	li	a4,5
    80004044:	1ae78063          	beq	a5,a4,800041e4 <__memset+0x20c>
    80004048:	00b502a3          	sb	a1,5(a0)
    8000404c:	00700713          	li	a4,7
    80004050:	18e79e63          	bne	a5,a4,800041ec <__memset+0x214>
    80004054:	00b50323          	sb	a1,6(a0)
    80004058:	00700e93          	li	t4,7
    8000405c:	00859713          	slli	a4,a1,0x8
    80004060:	00e5e733          	or	a4,a1,a4
    80004064:	01059e13          	slli	t3,a1,0x10
    80004068:	01c76e33          	or	t3,a4,t3
    8000406c:	01859313          	slli	t1,a1,0x18
    80004070:	006e6333          	or	t1,t3,t1
    80004074:	02059893          	slli	a7,a1,0x20
    80004078:	40f60e3b          	subw	t3,a2,a5
    8000407c:	011368b3          	or	a7,t1,a7
    80004080:	02859813          	slli	a6,a1,0x28
    80004084:	0108e833          	or	a6,a7,a6
    80004088:	03059693          	slli	a3,a1,0x30
    8000408c:	003e589b          	srliw	a7,t3,0x3
    80004090:	00d866b3          	or	a3,a6,a3
    80004094:	03859713          	slli	a4,a1,0x38
    80004098:	00389813          	slli	a6,a7,0x3
    8000409c:	00f507b3          	add	a5,a0,a5
    800040a0:	00e6e733          	or	a4,a3,a4
    800040a4:	000e089b          	sext.w	a7,t3
    800040a8:	00f806b3          	add	a3,a6,a5
    800040ac:	00e7b023          	sd	a4,0(a5)
    800040b0:	00878793          	addi	a5,a5,8
    800040b4:	fed79ce3          	bne	a5,a3,800040ac <__memset+0xd4>
    800040b8:	ff8e7793          	andi	a5,t3,-8
    800040bc:	0007871b          	sext.w	a4,a5
    800040c0:	01d787bb          	addw	a5,a5,t4
    800040c4:	0ce88e63          	beq	a7,a4,800041a0 <__memset+0x1c8>
    800040c8:	00f50733          	add	a4,a0,a5
    800040cc:	00b70023          	sb	a1,0(a4)
    800040d0:	0017871b          	addiw	a4,a5,1
    800040d4:	0cc77663          	bgeu	a4,a2,800041a0 <__memset+0x1c8>
    800040d8:	00e50733          	add	a4,a0,a4
    800040dc:	00b70023          	sb	a1,0(a4)
    800040e0:	0027871b          	addiw	a4,a5,2
    800040e4:	0ac77e63          	bgeu	a4,a2,800041a0 <__memset+0x1c8>
    800040e8:	00e50733          	add	a4,a0,a4
    800040ec:	00b70023          	sb	a1,0(a4)
    800040f0:	0037871b          	addiw	a4,a5,3
    800040f4:	0ac77663          	bgeu	a4,a2,800041a0 <__memset+0x1c8>
    800040f8:	00e50733          	add	a4,a0,a4
    800040fc:	00b70023          	sb	a1,0(a4)
    80004100:	0047871b          	addiw	a4,a5,4
    80004104:	08c77e63          	bgeu	a4,a2,800041a0 <__memset+0x1c8>
    80004108:	00e50733          	add	a4,a0,a4
    8000410c:	00b70023          	sb	a1,0(a4)
    80004110:	0057871b          	addiw	a4,a5,5
    80004114:	08c77663          	bgeu	a4,a2,800041a0 <__memset+0x1c8>
    80004118:	00e50733          	add	a4,a0,a4
    8000411c:	00b70023          	sb	a1,0(a4)
    80004120:	0067871b          	addiw	a4,a5,6
    80004124:	06c77e63          	bgeu	a4,a2,800041a0 <__memset+0x1c8>
    80004128:	00e50733          	add	a4,a0,a4
    8000412c:	00b70023          	sb	a1,0(a4)
    80004130:	0077871b          	addiw	a4,a5,7
    80004134:	06c77663          	bgeu	a4,a2,800041a0 <__memset+0x1c8>
    80004138:	00e50733          	add	a4,a0,a4
    8000413c:	00b70023          	sb	a1,0(a4)
    80004140:	0087871b          	addiw	a4,a5,8
    80004144:	04c77e63          	bgeu	a4,a2,800041a0 <__memset+0x1c8>
    80004148:	00e50733          	add	a4,a0,a4
    8000414c:	00b70023          	sb	a1,0(a4)
    80004150:	0097871b          	addiw	a4,a5,9
    80004154:	04c77663          	bgeu	a4,a2,800041a0 <__memset+0x1c8>
    80004158:	00e50733          	add	a4,a0,a4
    8000415c:	00b70023          	sb	a1,0(a4)
    80004160:	00a7871b          	addiw	a4,a5,10
    80004164:	02c77e63          	bgeu	a4,a2,800041a0 <__memset+0x1c8>
    80004168:	00e50733          	add	a4,a0,a4
    8000416c:	00b70023          	sb	a1,0(a4)
    80004170:	00b7871b          	addiw	a4,a5,11
    80004174:	02c77663          	bgeu	a4,a2,800041a0 <__memset+0x1c8>
    80004178:	00e50733          	add	a4,a0,a4
    8000417c:	00b70023          	sb	a1,0(a4)
    80004180:	00c7871b          	addiw	a4,a5,12
    80004184:	00c77e63          	bgeu	a4,a2,800041a0 <__memset+0x1c8>
    80004188:	00e50733          	add	a4,a0,a4
    8000418c:	00b70023          	sb	a1,0(a4)
    80004190:	00d7879b          	addiw	a5,a5,13
    80004194:	00c7f663          	bgeu	a5,a2,800041a0 <__memset+0x1c8>
    80004198:	00f507b3          	add	a5,a0,a5
    8000419c:	00b78023          	sb	a1,0(a5)
    800041a0:	00813403          	ld	s0,8(sp)
    800041a4:	01010113          	addi	sp,sp,16
    800041a8:	00008067          	ret
    800041ac:	00b00693          	li	a3,11
    800041b0:	e55ff06f          	j	80004004 <__memset+0x2c>
    800041b4:	00300e93          	li	t4,3
    800041b8:	ea5ff06f          	j	8000405c <__memset+0x84>
    800041bc:	00100e93          	li	t4,1
    800041c0:	e9dff06f          	j	8000405c <__memset+0x84>
    800041c4:	00000e93          	li	t4,0
    800041c8:	e95ff06f          	j	8000405c <__memset+0x84>
    800041cc:	00000793          	li	a5,0
    800041d0:	ef9ff06f          	j	800040c8 <__memset+0xf0>
    800041d4:	00200e93          	li	t4,2
    800041d8:	e85ff06f          	j	8000405c <__memset+0x84>
    800041dc:	00400e93          	li	t4,4
    800041e0:	e7dff06f          	j	8000405c <__memset+0x84>
    800041e4:	00500e93          	li	t4,5
    800041e8:	e75ff06f          	j	8000405c <__memset+0x84>
    800041ec:	00600e93          	li	t4,6
    800041f0:	e6dff06f          	j	8000405c <__memset+0x84>

00000000800041f4 <__memmove>:
    800041f4:	ff010113          	addi	sp,sp,-16
    800041f8:	00813423          	sd	s0,8(sp)
    800041fc:	01010413          	addi	s0,sp,16
    80004200:	0e060863          	beqz	a2,800042f0 <__memmove+0xfc>
    80004204:	fff6069b          	addiw	a3,a2,-1
    80004208:	0006881b          	sext.w	a6,a3
    8000420c:	0ea5e863          	bltu	a1,a0,800042fc <__memmove+0x108>
    80004210:	00758713          	addi	a4,a1,7
    80004214:	00a5e7b3          	or	a5,a1,a0
    80004218:	40a70733          	sub	a4,a4,a0
    8000421c:	0077f793          	andi	a5,a5,7
    80004220:	00f73713          	sltiu	a4,a4,15
    80004224:	00174713          	xori	a4,a4,1
    80004228:	0017b793          	seqz	a5,a5
    8000422c:	00e7f7b3          	and	a5,a5,a4
    80004230:	10078863          	beqz	a5,80004340 <__memmove+0x14c>
    80004234:	00900793          	li	a5,9
    80004238:	1107f463          	bgeu	a5,a6,80004340 <__memmove+0x14c>
    8000423c:	0036581b          	srliw	a6,a2,0x3
    80004240:	fff8081b          	addiw	a6,a6,-1
    80004244:	02081813          	slli	a6,a6,0x20
    80004248:	01d85893          	srli	a7,a6,0x1d
    8000424c:	00858813          	addi	a6,a1,8
    80004250:	00058793          	mv	a5,a1
    80004254:	00050713          	mv	a4,a0
    80004258:	01088833          	add	a6,a7,a6
    8000425c:	0007b883          	ld	a7,0(a5)
    80004260:	00878793          	addi	a5,a5,8
    80004264:	00870713          	addi	a4,a4,8
    80004268:	ff173c23          	sd	a7,-8(a4)
    8000426c:	ff0798e3          	bne	a5,a6,8000425c <__memmove+0x68>
    80004270:	ff867713          	andi	a4,a2,-8
    80004274:	02071793          	slli	a5,a4,0x20
    80004278:	0207d793          	srli	a5,a5,0x20
    8000427c:	00f585b3          	add	a1,a1,a5
    80004280:	40e686bb          	subw	a3,a3,a4
    80004284:	00f507b3          	add	a5,a0,a5
    80004288:	06e60463          	beq	a2,a4,800042f0 <__memmove+0xfc>
    8000428c:	0005c703          	lbu	a4,0(a1)
    80004290:	00e78023          	sb	a4,0(a5)
    80004294:	04068e63          	beqz	a3,800042f0 <__memmove+0xfc>
    80004298:	0015c603          	lbu	a2,1(a1)
    8000429c:	00100713          	li	a4,1
    800042a0:	00c780a3          	sb	a2,1(a5)
    800042a4:	04e68663          	beq	a3,a4,800042f0 <__memmove+0xfc>
    800042a8:	0025c603          	lbu	a2,2(a1)
    800042ac:	00200713          	li	a4,2
    800042b0:	00c78123          	sb	a2,2(a5)
    800042b4:	02e68e63          	beq	a3,a4,800042f0 <__memmove+0xfc>
    800042b8:	0035c603          	lbu	a2,3(a1)
    800042bc:	00300713          	li	a4,3
    800042c0:	00c781a3          	sb	a2,3(a5)
    800042c4:	02e68663          	beq	a3,a4,800042f0 <__memmove+0xfc>
    800042c8:	0045c603          	lbu	a2,4(a1)
    800042cc:	00400713          	li	a4,4
    800042d0:	00c78223          	sb	a2,4(a5)
    800042d4:	00e68e63          	beq	a3,a4,800042f0 <__memmove+0xfc>
    800042d8:	0055c603          	lbu	a2,5(a1)
    800042dc:	00500713          	li	a4,5
    800042e0:	00c782a3          	sb	a2,5(a5)
    800042e4:	00e68663          	beq	a3,a4,800042f0 <__memmove+0xfc>
    800042e8:	0065c703          	lbu	a4,6(a1)
    800042ec:	00e78323          	sb	a4,6(a5)
    800042f0:	00813403          	ld	s0,8(sp)
    800042f4:	01010113          	addi	sp,sp,16
    800042f8:	00008067          	ret
    800042fc:	02061713          	slli	a4,a2,0x20
    80004300:	02075713          	srli	a4,a4,0x20
    80004304:	00e587b3          	add	a5,a1,a4
    80004308:	f0f574e3          	bgeu	a0,a5,80004210 <__memmove+0x1c>
    8000430c:	02069613          	slli	a2,a3,0x20
    80004310:	02065613          	srli	a2,a2,0x20
    80004314:	fff64613          	not	a2,a2
    80004318:	00e50733          	add	a4,a0,a4
    8000431c:	00c78633          	add	a2,a5,a2
    80004320:	fff7c683          	lbu	a3,-1(a5)
    80004324:	fff78793          	addi	a5,a5,-1
    80004328:	fff70713          	addi	a4,a4,-1
    8000432c:	00d70023          	sb	a3,0(a4)
    80004330:	fec798e3          	bne	a5,a2,80004320 <__memmove+0x12c>
    80004334:	00813403          	ld	s0,8(sp)
    80004338:	01010113          	addi	sp,sp,16
    8000433c:	00008067          	ret
    80004340:	02069713          	slli	a4,a3,0x20
    80004344:	02075713          	srli	a4,a4,0x20
    80004348:	00170713          	addi	a4,a4,1
    8000434c:	00e50733          	add	a4,a0,a4
    80004350:	00050793          	mv	a5,a0
    80004354:	0005c683          	lbu	a3,0(a1)
    80004358:	00178793          	addi	a5,a5,1
    8000435c:	00158593          	addi	a1,a1,1
    80004360:	fed78fa3          	sb	a3,-1(a5)
    80004364:	fee798e3          	bne	a5,a4,80004354 <__memmove+0x160>
    80004368:	f89ff06f          	j	800042f0 <__memmove+0xfc>

000000008000436c <__putc>:
    8000436c:	fe010113          	addi	sp,sp,-32
    80004370:	00813823          	sd	s0,16(sp)
    80004374:	00113c23          	sd	ra,24(sp)
    80004378:	02010413          	addi	s0,sp,32
    8000437c:	00050793          	mv	a5,a0
    80004380:	fef40593          	addi	a1,s0,-17
    80004384:	00100613          	li	a2,1
    80004388:	00000513          	li	a0,0
    8000438c:	fef407a3          	sb	a5,-17(s0)
    80004390:	fffff097          	auipc	ra,0xfffff
    80004394:	b3c080e7          	jalr	-1220(ra) # 80002ecc <console_write>
    80004398:	01813083          	ld	ra,24(sp)
    8000439c:	01013403          	ld	s0,16(sp)
    800043a0:	02010113          	addi	sp,sp,32
    800043a4:	00008067          	ret

00000000800043a8 <__getc>:
    800043a8:	fe010113          	addi	sp,sp,-32
    800043ac:	00813823          	sd	s0,16(sp)
    800043b0:	00113c23          	sd	ra,24(sp)
    800043b4:	02010413          	addi	s0,sp,32
    800043b8:	fe840593          	addi	a1,s0,-24
    800043bc:	00100613          	li	a2,1
    800043c0:	00000513          	li	a0,0
    800043c4:	fffff097          	auipc	ra,0xfffff
    800043c8:	ae8080e7          	jalr	-1304(ra) # 80002eac <console_read>
    800043cc:	fe844503          	lbu	a0,-24(s0)
    800043d0:	01813083          	ld	ra,24(sp)
    800043d4:	01013403          	ld	s0,16(sp)
    800043d8:	02010113          	addi	sp,sp,32
    800043dc:	00008067          	ret

00000000800043e0 <console_handler>:
    800043e0:	fe010113          	addi	sp,sp,-32
    800043e4:	00813823          	sd	s0,16(sp)
    800043e8:	00113c23          	sd	ra,24(sp)
    800043ec:	00913423          	sd	s1,8(sp)
    800043f0:	02010413          	addi	s0,sp,32
    800043f4:	14202773          	csrr	a4,scause
    800043f8:	100027f3          	csrr	a5,sstatus
    800043fc:	0027f793          	andi	a5,a5,2
    80004400:	06079e63          	bnez	a5,8000447c <console_handler+0x9c>
    80004404:	00074c63          	bltz	a4,8000441c <console_handler+0x3c>
    80004408:	01813083          	ld	ra,24(sp)
    8000440c:	01013403          	ld	s0,16(sp)
    80004410:	00813483          	ld	s1,8(sp)
    80004414:	02010113          	addi	sp,sp,32
    80004418:	00008067          	ret
    8000441c:	0ff77713          	andi	a4,a4,255
    80004420:	00900793          	li	a5,9
    80004424:	fef712e3          	bne	a4,a5,80004408 <console_handler+0x28>
    80004428:	ffffe097          	auipc	ra,0xffffe
    8000442c:	6dc080e7          	jalr	1756(ra) # 80002b04 <plic_claim>
    80004430:	00a00793          	li	a5,10
    80004434:	00050493          	mv	s1,a0
    80004438:	02f50c63          	beq	a0,a5,80004470 <console_handler+0x90>
    8000443c:	fc0506e3          	beqz	a0,80004408 <console_handler+0x28>
    80004440:	00050593          	mv	a1,a0
    80004444:	00001517          	auipc	a0,0x1
    80004448:	f3c50513          	addi	a0,a0,-196 # 80005380 <_ZZ12printIntegermE6digits+0x360>
    8000444c:	fffff097          	auipc	ra,0xfffff
    80004450:	afc080e7          	jalr	-1284(ra) # 80002f48 <__printf>
    80004454:	01013403          	ld	s0,16(sp)
    80004458:	01813083          	ld	ra,24(sp)
    8000445c:	00048513          	mv	a0,s1
    80004460:	00813483          	ld	s1,8(sp)
    80004464:	02010113          	addi	sp,sp,32
    80004468:	ffffe317          	auipc	t1,0xffffe
    8000446c:	6d430067          	jr	1748(t1) # 80002b3c <plic_complete>
    80004470:	fffff097          	auipc	ra,0xfffff
    80004474:	3e0080e7          	jalr	992(ra) # 80003850 <uartintr>
    80004478:	fddff06f          	j	80004454 <console_handler+0x74>
    8000447c:	00001517          	auipc	a0,0x1
    80004480:	00450513          	addi	a0,a0,4 # 80005480 <digits+0x78>
    80004484:	fffff097          	auipc	ra,0xfffff
    80004488:	a68080e7          	jalr	-1432(ra) # 80002eec <panic>
	...
