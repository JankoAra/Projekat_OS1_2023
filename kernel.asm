
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00006117          	auipc	sp,0x6
    80000004:	fa813103          	ld	sp,-88(sp) # 80005fa8 <_GLOBAL_OFFSET_TABLE_+0x18>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	0cd020ef          	jal	ra,800028e8 <start>

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
    80001184:	14d000ef          	jal	ra,80001ad0 <interruptRoutine>

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

int time_sleep(time_t timerPeriods) {
    80001374:	ff010113          	addi	sp,sp,-16
    80001378:	00813423          	sd	s0,8(sp)
    8000137c:	01010413          	addi	s0,sp,16
    80001380:	00050313          	mv	t1,a0
	//stavljanje argumenata za sistemski poziv
	__asm__ volatile("mv a1, %[time]": :[time] "r"(timerPeriods):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001384:	00030593          	mv	a1,t1
	__asm__ volatile("li a0, 0x31");
    80001388:	03100513          	li	a0,49
	__asm__ volatile("ecall");
    8000138c:	00000073          	ecall
	//a1 = broj perioda tajmera na koji se uspavljuje nit

	scall();

	int status;
	__asm__ volatile("mv %[status], a0":[status] "=r"(status));
    80001390:	00050513          	mv	a0,a0
	return status;
}
    80001394:	0005051b          	sext.w	a0,a0
    80001398:	00813403          	ld	s0,8(sp)
    8000139c:	01010113          	addi	sp,sp,16
    800013a0:	00008067          	ret

00000000800013a4 <_Z8sem_openPP4_semj>:

int sem_open(sem_t* handle, unsigned int init) {
    800013a4:	ff010113          	addi	sp,sp,-16
    800013a8:	00813423          	sd	s0,8(sp)
    800013ac:	01010413          	addi	s0,sp,16
	return 0;
}
    800013b0:	00000513          	li	a0,0
    800013b4:	00813403          	ld	s0,8(sp)
    800013b8:	01010113          	addi	sp,sp,16
    800013bc:	00008067          	ret

00000000800013c0 <_Z9sem_closeP4_sem>:

int sem_close(sem_t handle) {
    800013c0:	ff010113          	addi	sp,sp,-16
    800013c4:	00813423          	sd	s0,8(sp)
    800013c8:	01010413          	addi	s0,sp,16
	return 0;
}
    800013cc:	00000513          	li	a0,0
    800013d0:	00813403          	ld	s0,8(sp)
    800013d4:	01010113          	addi	sp,sp,16
    800013d8:	00008067          	ret

00000000800013dc <_Z8sem_waitP4_sem>:

int sem_wait(sem_t id) {
    800013dc:	ff010113          	addi	sp,sp,-16
    800013e0:	00813423          	sd	s0,8(sp)
    800013e4:	01010413          	addi	s0,sp,16
	return 0;
}
    800013e8:	00000513          	li	a0,0
    800013ec:	00813403          	ld	s0,8(sp)
    800013f0:	01010113          	addi	sp,sp,16
    800013f4:	00008067          	ret

00000000800013f8 <_Z10sem_signalP4_sem>:

int sem_signal(sem_t id) {
    800013f8:	ff010113          	addi	sp,sp,-16
    800013fc:	00813423          	sd	s0,8(sp)
    80001400:	01010413          	addi	s0,sp,16
	return 0;
}
    80001404:	00000513          	li	a0,0
    80001408:	00813403          	ld	s0,8(sp)
    8000140c:	01010113          	addi	sp,sp,16
    80001410:	00008067          	ret

0000000080001414 <_Z4getcv>:

char getc() {
    80001414:	ff010113          	addi	sp,sp,-16
    80001418:	00113423          	sd	ra,8(sp)
    8000141c:	00813023          	sd	s0,0(sp)
    80001420:	01010413          	addi	s0,sp,16
	return __getc();
    80001424:	00003097          	auipc	ra,0x3
    80001428:	5c4080e7          	jalr	1476(ra) # 800049e8 <__getc>
}
    8000142c:	00813083          	ld	ra,8(sp)
    80001430:	00013403          	ld	s0,0(sp)
    80001434:	01010113          	addi	sp,sp,16
    80001438:	00008067          	ret

000000008000143c <_Z4putcc>:

void putc(char c) {
    8000143c:	ff010113          	addi	sp,sp,-16
    80001440:	00113423          	sd	ra,8(sp)
    80001444:	00813023          	sd	s0,0(sp)
    80001448:	01010413          	addi	s0,sp,16
	__putc(c);
    8000144c:	00003097          	auipc	ra,0x3
    80001450:	560080e7          	jalr	1376(ra) # 800049ac <__putc>
}
    80001454:	00813083          	ld	ra,8(sp)
    80001458:	00013403          	ld	s0,0(sp)
    8000145c:	01010113          	addi	sp,sp,16
    80001460:	00008067          	ret

0000000080001464 <_Z11printStringPKc>:
#include "../h/helper.hpp"
#include "../lib/console.h"
#include "../h/Riscv.hpp"
//#include "../h/syscall_c.hpp"

void printString(char const* string) {
    80001464:	ff010113          	addi	sp,sp,-16
    80001468:	00813423          	sd	s0,8(sp)
    8000146c:	01010413          	addi	s0,sp,16
    80001470:	00050313          	mv	t1,a0

	//stavljanje argumenata za sistemski poziv
	__asm__ volatile("mv a1, %[ptr]": :[ptr] "r"(string):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001474:	00030593          	mv	a1,t1
	__asm__ volatile("li a0, 0x90");
    80001478:	09000513          	li	a0,144

	__asm__ volatile("ecall");
    8000147c:	00000073          	ecall


}
    80001480:	00813403          	ld	s0,8(sp)
    80001484:	01010113          	addi	sp,sp,16
    80001488:	00008067          	ret

000000008000148c <_Z12printIntegerm>:
//void println(char const *string) {
//    printString(string);
//    __putc('\n');
//}

void printInteger(uint64 integer) {
    8000148c:	ff010113          	addi	sp,sp,-16
    80001490:	00813423          	sd	s0,8(sp)
    80001494:	01010413          	addi	s0,sp,16
    80001498:	00050313          	mv	t1,a0
	//stavljanje argumenata za sistemski poziv
	__asm__ volatile("mv a1, %[ptr]": :[ptr] "r"(integer):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    8000149c:	00030593          	mv	a1,t1
	__asm__ volatile("li a0, 0x91");
    800014a0:	09100513          	li	a0,145

	__asm__ volatile("ecall");
    800014a4:	00000073          	ecall
}
    800014a8:	00813403          	ld	s0,8(sp)
    800014ac:	01010113          	addi	sp,sp,16
    800014b0:	00008067          	ret

00000000800014b4 <_ZN9Scheduler3putEP3TCB>:
//Scheduler* Scheduler::singleton = nullptr;
TCB* Scheduler::head = nullptr;
TCB* Scheduler::tail = nullptr;
TCB* Scheduler::sleepingHead = nullptr;

void Scheduler::put(TCB* tcb) {
    800014b4:	ff010113          	addi	sp,sp,-16
    800014b8:	00813423          	sd	s0,8(sp)
    800014bc:	01010413          	addi	s0,sp,16
	if (tail == nullptr) {
    800014c0:	00005797          	auipc	a5,0x5
    800014c4:	b507b783          	ld	a5,-1200(a5) # 80006010 <_ZN9Scheduler4tailE>
    800014c8:	00078e63          	beqz	a5,800014e4 <_ZN9Scheduler3putEP3TCB+0x30>
		head = tail = tcb;
	} else {
		tail->nextInScheduler = tcb;
    800014cc:	02a7bc23          	sd	a0,56(a5)
		tail = tcb;
    800014d0:	00005797          	auipc	a5,0x5
    800014d4:	b4a7b023          	sd	a0,-1216(a5) # 80006010 <_ZN9Scheduler4tailE>
	}
}
    800014d8:	00813403          	ld	s0,8(sp)
    800014dc:	01010113          	addi	sp,sp,16
    800014e0:	00008067          	ret
		head = tail = tcb;
    800014e4:	00005797          	auipc	a5,0x5
    800014e8:	b2c78793          	addi	a5,a5,-1236 # 80006010 <_ZN9Scheduler4tailE>
    800014ec:	00a7b023          	sd	a0,0(a5)
    800014f0:	00a7b423          	sd	a0,8(a5)
    800014f4:	fe5ff06f          	j	800014d8 <_ZN9Scheduler3putEP3TCB+0x24>

00000000800014f8 <_ZN9Scheduler3getEv>:

TCB* Scheduler::get() {
    800014f8:	ff010113          	addi	sp,sp,-16
    800014fc:	00813423          	sd	s0,8(sp)
    80001500:	01010413          	addi	s0,sp,16
	TCB* firstThread = head;
    80001504:	00005717          	auipc	a4,0x5
    80001508:	b0c70713          	addi	a4,a4,-1268 # 80006010 <_ZN9Scheduler4tailE>
    8000150c:	00873503          	ld	a0,8(a4)
	head = head->nextInScheduler;
    80001510:	03853783          	ld	a5,56(a0) # 1038 <_entry-0x7fffefc8>
    80001514:	00f73423          	sd	a5,8(a4)
	if (head == nullptr) {
    80001518:	00078a63          	beqz	a5,8000152c <_ZN9Scheduler3getEv+0x34>
		tail = head = nullptr;
	}
	firstThread->nextInScheduler = nullptr;
    8000151c:	02053c23          	sd	zero,56(a0)
	return firstThread;
}
    80001520:	00813403          	ld	s0,8(sp)
    80001524:	01010113          	addi	sp,sp,16
    80001528:	00008067          	ret
		tail = head = nullptr;
    8000152c:	00073423          	sd	zero,8(a4)
    80001530:	00073023          	sd	zero,0(a4)
    80001534:	fe9ff06f          	j	8000151c <_ZN9Scheduler3getEv+0x24>

0000000080001538 <_ZN9Scheduler10putToSleepEP3TCBm>:

void Scheduler::putToSleep(TCB* tcb, time_t sleepTime) {
    80001538:	ff010113          	addi	sp,sp,-16
    8000153c:	00813423          	sd	s0,8(sp)
    80001540:	01010413          	addi	s0,sp,16
	if (sleepingHead == nullptr) {
    80001544:	00005817          	auipc	a6,0x5
    80001548:	adc83803          	ld	a6,-1316(a6) # 80006020 <_ZN9Scheduler12sleepingHeadE>
    8000154c:	02080863          	beqz	a6,8000157c <_ZN9Scheduler10putToSleepEP3TCBm+0x44>
		tcb->timeToSleep = sleepTime;
		return;
	}
	TCB* prevSleeping = nullptr;
	time_t accumulated = 0;
	TCB* current = sleepingHead;
    80001550:	00080793          	mv	a5,a6
	time_t accumulated = 0;
    80001554:	00000693          	li	a3,0
	TCB* prevSleeping = nullptr;
    80001558:	00000613          	li	a2,0
	for (; current && accumulated + current->timeToSleep < sleepTime; current = current->nextSleeping) {
    8000155c:	02078863          	beqz	a5,8000158c <_ZN9Scheduler10putToSleepEP3TCBm+0x54>
    80001560:	0407b703          	ld	a4,64(a5)
    80001564:	00d70733          	add	a4,a4,a3
    80001568:	02b77263          	bgeu	a4,a1,8000158c <_ZN9Scheduler10putToSleepEP3TCBm+0x54>
		accumulated += current->timeToSleep;
    8000156c:	00070693          	mv	a3,a4
		prevSleeping = current;
    80001570:	00078613          	mv	a2,a5
	for (; current && accumulated + current->timeToSleep < sleepTime; current = current->nextSleeping) {
    80001574:	0487b783          	ld	a5,72(a5)
    80001578:	fe5ff06f          	j	8000155c <_ZN9Scheduler10putToSleepEP3TCBm+0x24>
		sleepingHead = tcb;
    8000157c:	00005797          	auipc	a5,0x5
    80001580:	aaa7b223          	sd	a0,-1372(a5) # 80006020 <_ZN9Scheduler12sleepingHeadE>
		tcb->timeToSleep = sleepTime;
    80001584:	04b53023          	sd	a1,64(a0)
		return;
    80001588:	02c0006f          	j	800015b4 <_ZN9Scheduler10putToSleepEP3TCBm+0x7c>
	}
	if (!prevSleeping) {
    8000158c:	02060a63          	beqz	a2,800015c0 <_ZN9Scheduler10putToSleepEP3TCBm+0x88>
		sleepingHead = tcb;
		tcb->timeToSleep = sleepTime;
		tcb->nextSleeping->timeToSleep -= sleepTime;
		return;
	}
	tcb->nextSleeping = current;
    80001590:	04f53423          	sd	a5,72(a0)
	prevSleeping->nextSleeping = tcb;
    80001594:	04a63423          	sd	a0,72(a2)
	tcb->timeToSleep = sleepTime - accumulated;
    80001598:	40d58733          	sub	a4,a1,a3
    8000159c:	04e53023          	sd	a4,64(a0)
	if (current) current->timeToSleep -= sleepTime - accumulated;
    800015a0:	00078a63          	beqz	a5,800015b4 <_ZN9Scheduler10putToSleepEP3TCBm+0x7c>
    800015a4:	40b686b3          	sub	a3,a3,a1
    800015a8:	0407b703          	ld	a4,64(a5)
    800015ac:	00d706b3          	add	a3,a4,a3
    800015b0:	04d7b023          	sd	a3,64(a5)
}
    800015b4:	00813403          	ld	s0,8(sp)
    800015b8:	01010113          	addi	sp,sp,16
    800015bc:	00008067          	ret
		tcb->nextSleeping = sleepingHead;
    800015c0:	05053423          	sd	a6,72(a0)
		sleepingHead = tcb;
    800015c4:	00005797          	auipc	a5,0x5
    800015c8:	a4a7be23          	sd	a0,-1444(a5) # 80006020 <_ZN9Scheduler12sleepingHeadE>
		tcb->timeToSleep = sleepTime;
    800015cc:	04b53023          	sd	a1,64(a0)
		tcb->nextSleeping->timeToSleep -= sleepTime;
    800015d0:	04083683          	ld	a3,64(a6)
    800015d4:	40b686b3          	sub	a3,a3,a1
    800015d8:	04d83023          	sd	a3,64(a6)
		return;
    800015dc:	fd9ff06f          	j	800015b4 <_ZN9Scheduler10putToSleepEP3TCBm+0x7c>

00000000800015e0 <_ZN9Scheduler4wakeEv>:

void Scheduler::wake() {
	if (!sleepingHead) return;
    800015e0:	00005797          	auipc	a5,0x5
    800015e4:	a407b783          	ld	a5,-1472(a5) # 80006020 <_ZN9Scheduler12sleepingHeadE>
    800015e8:	06078a63          	beqz	a5,8000165c <_ZN9Scheduler4wakeEv+0x7c>
	sleepingHead->timeToSleep--;
    800015ec:	0407b703          	ld	a4,64(a5)
    800015f0:	fff70713          	addi	a4,a4,-1
    800015f4:	04e7b023          	sd	a4,64(a5)
	while (sleepingHead && sleepingHead->timeToSleep == 0) {
    800015f8:	00005517          	auipc	a0,0x5
    800015fc:	a2853503          	ld	a0,-1496(a0) # 80006020 <_ZN9Scheduler12sleepingHeadE>
    80001600:	04050e63          	beqz	a0,8000165c <_ZN9Scheduler4wakeEv+0x7c>
    80001604:	04053783          	ld	a5,64(a0)
    80001608:	04079a63          	bnez	a5,8000165c <_ZN9Scheduler4wakeEv+0x7c>
void Scheduler::wake() {
    8000160c:	ff010113          	addi	sp,sp,-16
    80001610:	00113423          	sd	ra,8(sp)
    80001614:	00813023          	sd	s0,0(sp)
    80001618:	01010413          	addi	s0,sp,16
    8000161c:	00c0006f          	j	80001628 <_ZN9Scheduler4wakeEv+0x48>
	while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001620:	04053783          	ld	a5,64(a0)
    80001624:	02079463          	bnez	a5,8000164c <_ZN9Scheduler4wakeEv+0x6c>
		TCB* thread = sleepingHead;
		sleepingHead = sleepingHead->nextSleeping;
    80001628:	04853783          	ld	a5,72(a0)
    8000162c:	00005717          	auipc	a4,0x5
    80001630:	9ef73a23          	sd	a5,-1548(a4) # 80006020 <_ZN9Scheduler12sleepingHeadE>
		thread->nextSleeping = nullptr;
    80001634:	04053423          	sd	zero,72(a0)
		Scheduler::put(thread);
    80001638:	00000097          	auipc	ra,0x0
    8000163c:	e7c080e7          	jalr	-388(ra) # 800014b4 <_ZN9Scheduler3putEP3TCB>
	while (sleepingHead && sleepingHead->timeToSleep == 0) {
    80001640:	00005517          	auipc	a0,0x5
    80001644:	9e053503          	ld	a0,-1568(a0) # 80006020 <_ZN9Scheduler12sleepingHeadE>
    80001648:	fc051ce3          	bnez	a0,80001620 <_ZN9Scheduler4wakeEv+0x40>
	}
}
    8000164c:	00813083          	ld	ra,8(sp)
    80001650:	00013403          	ld	s0,0(sp)
    80001654:	01010113          	addi	sp,sp,16
    80001658:	00008067          	ret
    8000165c:	00008067          	ret

0000000080001660 <main>:
	}
}

#pragma GCC optimize("O0")

int main() {
    80001660:	fc010113          	addi	sp,sp,-64
    80001664:	02113c23          	sd	ra,56(sp)
    80001668:	02813823          	sd	s0,48(sp)
    8000166c:	04010413          	addi	s0,sp,64

	//zabrani prekide
	Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    80001670:	00200513          	li	a0,2
    80001674:	00000097          	auipc	ra,0x0
    80001678:	424080e7          	jalr	1060(ra) # 80001a98 <_ZN5Riscv10mc_sstatusEm>

	//postavi adresu prekidne rutine u stvec
	Riscv::w_stvec((uint64)&interruptHandler);
    8000167c:	00005797          	auipc	a5,0x5
    80001680:	9447b783          	ld	a5,-1724(a5) # 80005fc0 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001684:	00078513          	mv	a0,a5
    80001688:	00000097          	auipc	ra,0x0
    8000168c:	3d8080e7          	jalr	984(ra) # 80001a60 <_ZN5Riscv7w_stvecEm>
//	printInteger(*(lista->peekFirst()));
//	delete lista;
//	println("");

	//testiranje kreiranja niti
	thread_t glavnaNit = nullptr;
    80001690:	fe043023          	sd	zero,-32(s0)
	thread_t nit1 = nullptr;
    80001694:	fc043c23          	sd	zero,-40(s0)
	thread_t nit2 = nullptr;
    80001698:	fc043823          	sd	zero,-48(s0)
	thread_t nit3;
	thread_create(&glavnaNit, nullptr, nullptr);
    8000169c:	fe040793          	addi	a5,s0,-32
    800016a0:	00000613          	li	a2,0
    800016a4:	00000593          	li	a1,0
    800016a8:	00078513          	mv	a0,a5
    800016ac:	00000097          	auipc	ra,0x0
    800016b0:	be8080e7          	jalr	-1048(ra) # 80001294 <_Z13thread_createPP3TCBPFvPvES2_>
	TCB::running = glavnaNit;
    800016b4:	fe043703          	ld	a4,-32(s0)
    800016b8:	00005797          	auipc	a5,0x5
    800016bc:	8f87b783          	ld	a5,-1800(a5) # 80005fb0 <_GLOBAL_OFFSET_TABLE_+0x20>
    800016c0:	00e7b023          	sd	a4,0(a5)
	uint64* arg = new uint64;
    800016c4:	00800513          	li	a0,8
    800016c8:	00001097          	auipc	ra,0x1
    800016cc:	91c080e7          	jalr	-1764(ra) # 80001fe4 <_Znwm>
    800016d0:	00050793          	mv	a5,a0
    800016d4:	fef43423          	sd	a5,-24(s0)
	*arg = 666;
    800016d8:	fe843783          	ld	a5,-24(s0)
    800016dc:	29a00713          	li	a4,666
    800016e0:	00e7b023          	sd	a4,0(a5)
	thread_create(&nit1, nit1f, nullptr);
    800016e4:	fd840793          	addi	a5,s0,-40
    800016e8:	00000613          	li	a2,0
    800016ec:	00000597          	auipc	a1,0x0
    800016f0:	0f858593          	addi	a1,a1,248 # 800017e4 <_Z5nit1fPv>
    800016f4:	00078513          	mv	a0,a5
    800016f8:	00000097          	auipc	ra,0x0
    800016fc:	b9c080e7          	jalr	-1124(ra) # 80001294 <_Z13thread_createPP3TCBPFvPvES2_>
	thread_create(&nit2, nit2f, arg);
    80001700:	fd040793          	addi	a5,s0,-48
    80001704:	fe843603          	ld	a2,-24(s0)
    80001708:	00000597          	auipc	a1,0x0
    8000170c:	1b058593          	addi	a1,a1,432 # 800018b8 <_Z5nit2fPv>
    80001710:	00078513          	mv	a0,a5
    80001714:	00000097          	auipc	ra,0x0
    80001718:	b80080e7          	jalr	-1152(ra) # 80001294 <_Z13thread_createPP3TCBPFvPvES2_>
	thread_create(&nit3, nit3f, nullptr);
    8000171c:	fc840793          	addi	a5,s0,-56
    80001720:	00000613          	li	a2,0
    80001724:	00000597          	auipc	a1,0x0
    80001728:	2d858593          	addi	a1,a1,728 # 800019fc <_Z5nit3fPv>
    8000172c:	00078513          	mv	a0,a5
    80001730:	00000097          	auipc	ra,0x0
    80001734:	b64080e7          	jalr	-1180(ra) # 80001294 <_Z13thread_createPP3TCBPFvPvES2_>

	//omoguci prekide
	Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
    80001738:	00200513          	li	a0,2
    8000173c:	00000097          	auipc	ra,0x0
    80001740:	340080e7          	jalr	832(ra) # 80001a7c <_ZN5Riscv10ms_sstatusEm>

	while (!nit1->isFinished() || !nit2->isFinished()) {
    80001744:	fd843783          	ld	a5,-40(s0)
    80001748:	00078513          	mv	a0,a5
    8000174c:	00000097          	auipc	ra,0x0
    80001750:	368080e7          	jalr	872(ra) # 80001ab4 <_ZN3TCB10isFinishedEv>
    80001754:	00050793          	mv	a5,a0
    80001758:	0017c793          	xori	a5,a5,1
    8000175c:	0ff7f793          	andi	a5,a5,255
    80001760:	02079263          	bnez	a5,80001784 <main+0x124>
    80001764:	fd043783          	ld	a5,-48(s0)
    80001768:	00078513          	mv	a0,a5
    8000176c:	00000097          	auipc	ra,0x0
    80001770:	348080e7          	jalr	840(ra) # 80001ab4 <_ZN3TCB10isFinishedEv>
    80001774:	00050793          	mv	a5,a0
    80001778:	0017c793          	xori	a5,a5,1
    8000177c:	0ff7f793          	andi	a5,a5,255
    80001780:	00078663          	beqz	a5,8000178c <main+0x12c>
    80001784:	00100793          	li	a5,1
    80001788:	0080006f          	j	80001790 <main+0x130>
    8000178c:	00000793          	li	a5,0
    80001790:	00078863          	beqz	a5,800017a0 <main+0x140>
		thread_dispatch();
    80001794:	00000097          	auipc	ra,0x0
    80001798:	ba8080e7          	jalr	-1112(ra) # 8000133c <_Z15thread_dispatchv>
	while (!nit1->isFinished() || !nit2->isFinished()) {
    8000179c:	fa9ff06f          	j	80001744 <main+0xe4>
	}

	printString("\nProsao while\n");
    800017a0:	00004517          	auipc	a0,0x4
    800017a4:	88050513          	addi	a0,a0,-1920 # 80005020 <CONSOLE_STATUS+0x10>
    800017a8:	00000097          	auipc	ra,0x0
    800017ac:	cbc080e7          	jalr	-836(ra) # 80001464 <_Z11printStringPKc>

	//zabrani prekide
	Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    800017b0:	00200513          	li	a0,2
    800017b4:	00000097          	auipc	ra,0x0
    800017b8:	2e4080e7          	jalr	740(ra) # 80001a98 <_ZN5Riscv10mc_sstatusEm>
	printString("\nSad cu da izadjem\n");
    800017bc:	00004517          	auipc	a0,0x4
    800017c0:	87450513          	addi	a0,a0,-1932 # 80005030 <CONSOLE_STATUS+0x20>
    800017c4:	00000097          	auipc	ra,0x0
    800017c8:	ca0080e7          	jalr	-864(ra) # 80001464 <_Z11printStringPKc>
//	thread_create(&userHandle, (TCB::Body)userMain, nullptr);
//	while (!userHandle->isFinished()) {
//		thread_dispatch();
//	}
//	Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
	return 0;
    800017cc:	00000793          	li	a5,0
    800017d0:	00078513          	mv	a0,a5
    800017d4:	03813083          	ld	ra,56(sp)
    800017d8:	03013403          	ld	s0,48(sp)
    800017dc:	04010113          	addi	sp,sp,64
    800017e0:	00008067          	ret

00000000800017e4 <_Z5nit1fPv>:
void nit1f(void*) {
    800017e4:	fd010113          	addi	sp,sp,-48
    800017e8:	02113423          	sd	ra,40(sp)
    800017ec:	02813023          	sd	s0,32(sp)
    800017f0:	00913c23          	sd	s1,24(sp)
    800017f4:	03010413          	addi	s0,sp,48
	printString("\nusao u nit 1\n");
    800017f8:	00004517          	auipc	a0,0x4
    800017fc:	85050513          	addi	a0,a0,-1968 # 80005048 <CONSOLE_STATUS+0x38>
    80001800:	00000097          	auipc	ra,0x0
    80001804:	c64080e7          	jalr	-924(ra) # 80001464 <_Z11printStringPKc>
	__asm__ volatile("li t1, 100");
    80001808:	06400313          	li	t1,100
	__asm__ volatile("mv %0, t1":"=r"(t1));
    8000180c:	00030793          	mv	a5,t1
    80001810:	fcf43c23          	sd	a5,-40(s0)
	printString("\nopet u niti 1\n");
    80001814:	00004517          	auipc	a0,0x4
    80001818:	84450513          	addi	a0,a0,-1980 # 80005058 <CONSOLE_STATUS+0x48>
    8000181c:	00000097          	auipc	ra,0x0
    80001820:	c48080e7          	jalr	-952(ra) # 80001464 <_Z11printStringPKc>
	printString("\nt1 = ");
    80001824:	00004517          	auipc	a0,0x4
    80001828:	84450513          	addi	a0,a0,-1980 # 80005068 <CONSOLE_STATUS+0x58>
    8000182c:	00000097          	auipc	ra,0x0
    80001830:	c38080e7          	jalr	-968(ra) # 80001464 <_Z11printStringPKc>
	printInteger(t1);
    80001834:	fd843503          	ld	a0,-40(s0)
    80001838:	00000097          	auipc	ra,0x0
    8000183c:	c54080e7          	jalr	-940(ra) # 8000148c <_Z12printIntegerm>
	for (int i = 0; i < 1000000; i++) {
    80001840:	00000493          	li	s1,0
    80001844:	0340006f          	j	80001878 <_Z5nit1fPv+0x94>
			printString("Nit1: ");
    80001848:	00004517          	auipc	a0,0x4
    8000184c:	82850513          	addi	a0,a0,-2008 # 80005070 <CONSOLE_STATUS+0x60>
    80001850:	00000097          	auipc	ra,0x0
    80001854:	c14080e7          	jalr	-1004(ra) # 80001464 <_Z11printStringPKc>
			printInteger(i);
    80001858:	00048513          	mv	a0,s1
    8000185c:	00000097          	auipc	ra,0x0
    80001860:	c30080e7          	jalr	-976(ra) # 8000148c <_Z12printIntegerm>
			printString("\n");
    80001864:	00004517          	auipc	a0,0x4
    80001868:	81450513          	addi	a0,a0,-2028 # 80005078 <CONSOLE_STATUS+0x68>
    8000186c:	00000097          	auipc	ra,0x0
    80001870:	bf8080e7          	jalr	-1032(ra) # 80001464 <_Z11printStringPKc>
	for (int i = 0; i < 1000000; i++) {
    80001874:	0014849b          	addiw	s1,s1,1
    80001878:	000f47b7          	lui	a5,0xf4
    8000187c:	23f78793          	addi	a5,a5,575 # f423f <_entry-0x7ff0bdc1>
    80001880:	0097ca63          	blt	a5,s1,80001894 <_Z5nit1fPv+0xb0>
		if (i % 1200 == 0) {
    80001884:	4b000793          	li	a5,1200
    80001888:	02f4e7bb          	remw	a5,s1,a5
    8000188c:	fe0794e3          	bnez	a5,80001874 <_Z5nit1fPv+0x90>
    80001890:	fb9ff06f          	j	80001848 <_Z5nit1fPv+0x64>
	printString("\nGotova nit 1\n");
    80001894:	00003517          	auipc	a0,0x3
    80001898:	7ec50513          	addi	a0,a0,2028 # 80005080 <CONSOLE_STATUS+0x70>
    8000189c:	00000097          	auipc	ra,0x0
    800018a0:	bc8080e7          	jalr	-1080(ra) # 80001464 <_Z11printStringPKc>
}
    800018a4:	02813083          	ld	ra,40(sp)
    800018a8:	02013403          	ld	s0,32(sp)
    800018ac:	01813483          	ld	s1,24(sp)
    800018b0:	03010113          	addi	sp,sp,48
    800018b4:	00008067          	ret

00000000800018b8 <_Z5nit2fPv>:
void nit2f(void* arg2) {
    800018b8:	fd010113          	addi	sp,sp,-48
    800018bc:	02113423          	sd	ra,40(sp)
    800018c0:	02813023          	sd	s0,32(sp)
    800018c4:	00913c23          	sd	s1,24(sp)
    800018c8:	01213823          	sd	s2,16(sp)
    800018cc:	03010413          	addi	s0,sp,48
    800018d0:	00050913          	mv	s2,a0
	printString("\nusao u nit 2\n");
    800018d4:	00003517          	auipc	a0,0x3
    800018d8:	7bc50513          	addi	a0,a0,1980 # 80005090 <CONSOLE_STATUS+0x80>
    800018dc:	00000097          	auipc	ra,0x0
    800018e0:	b88080e7          	jalr	-1144(ra) # 80001464 <_Z11printStringPKc>
	printInteger(*(uint64*)arg2);
    800018e4:	00093503          	ld	a0,0(s2)
    800018e8:	00000097          	auipc	ra,0x0
    800018ec:	ba4080e7          	jalr	-1116(ra) # 8000148c <_Z12printIntegerm>
	*(uint64*)arg2 += 10;
    800018f0:	00093783          	ld	a5,0(s2)
    800018f4:	00a78793          	addi	a5,a5,10
    800018f8:	00f93023          	sd	a5,0(s2)
	__asm__ volatile("li t1, 200");
    800018fc:	0c800313          	li	t1,200
	__asm__ volatile("mv %0, t1":"=r"(t1));
    80001900:	00030793          	mv	a5,t1
    80001904:	fcf43c23          	sd	a5,-40(s0)
	printString("\nopet u niti 2\n");
    80001908:	00003517          	auipc	a0,0x3
    8000190c:	79850513          	addi	a0,a0,1944 # 800050a0 <CONSOLE_STATUS+0x90>
    80001910:	00000097          	auipc	ra,0x0
    80001914:	b54080e7          	jalr	-1196(ra) # 80001464 <_Z11printStringPKc>
	printString("\nt1 = ");
    80001918:	00003517          	auipc	a0,0x3
    8000191c:	75050513          	addi	a0,a0,1872 # 80005068 <CONSOLE_STATUS+0x58>
    80001920:	00000097          	auipc	ra,0x0
    80001924:	b44080e7          	jalr	-1212(ra) # 80001464 <_Z11printStringPKc>
	printInteger(t1);
    80001928:	fd843503          	ld	a0,-40(s0)
    8000192c:	00000097          	auipc	ra,0x0
    80001930:	b60080e7          	jalr	-1184(ra) # 8000148c <_Z12printIntegerm>
	printString("\n");
    80001934:	00003517          	auipc	a0,0x3
    80001938:	74450513          	addi	a0,a0,1860 # 80005078 <CONSOLE_STATUS+0x68>
    8000193c:	00000097          	auipc	ra,0x0
    80001940:	b28080e7          	jalr	-1240(ra) # 80001464 <_Z11printStringPKc>
	for (int i = 0; i < 1000000; i++) {
    80001944:	00000493          	li	s1,0
    80001948:	0400006f          	j	80001988 <_Z5nit2fPv+0xd0>
			printString("Nit2: ");
    8000194c:	00003517          	auipc	a0,0x3
    80001950:	76450513          	addi	a0,a0,1892 # 800050b0 <CONSOLE_STATUS+0xa0>
    80001954:	00000097          	auipc	ra,0x0
    80001958:	b10080e7          	jalr	-1264(ra) # 80001464 <_Z11printStringPKc>
			printInteger(i);
    8000195c:	00048513          	mv	a0,s1
    80001960:	00000097          	auipc	ra,0x0
    80001964:	b2c080e7          	jalr	-1236(ra) # 8000148c <_Z12printIntegerm>
			printString("\n");
    80001968:	00003517          	auipc	a0,0x3
    8000196c:	71050513          	addi	a0,a0,1808 # 80005078 <CONSOLE_STATUS+0x68>
    80001970:	00000097          	auipc	ra,0x0
    80001974:	af4080e7          	jalr	-1292(ra) # 80001464 <_Z11printStringPKc>
			time_sleep(20);
    80001978:	01400513          	li	a0,20
    8000197c:	00000097          	auipc	ra,0x0
    80001980:	9f8080e7          	jalr	-1544(ra) # 80001374 <_Z10time_sleepm>
	for (int i = 0; i < 1000000; i++) {
    80001984:	0014849b          	addiw	s1,s1,1
    80001988:	000f47b7          	lui	a5,0xf4
    8000198c:	23f78793          	addi	a5,a5,575 # f423f <_entry-0x7ff0bdc1>
    80001990:	0097cc63          	blt	a5,s1,800019a8 <_Z5nit2fPv+0xf0>
		if (i % 100000 == 0) {
    80001994:	000187b7          	lui	a5,0x18
    80001998:	6a07879b          	addiw	a5,a5,1696
    8000199c:	02f4e7bb          	remw	a5,s1,a5
    800019a0:	fe0792e3          	bnez	a5,80001984 <_Z5nit2fPv+0xcc>
    800019a4:	fa9ff06f          	j	8000194c <_Z5nit2fPv+0x94>
	printString("\nPokusavam da ugasim nit 2\n");
    800019a8:	00003517          	auipc	a0,0x3
    800019ac:	71050513          	addi	a0,a0,1808 # 800050b8 <CONSOLE_STATUS+0xa8>
    800019b0:	00000097          	auipc	ra,0x0
    800019b4:	ab4080e7          	jalr	-1356(ra) # 80001464 <_Z11printStringPKc>
	printString("\nNisam uspeo da ugasim nit 2\n");
    800019b8:	00003517          	auipc	a0,0x3
    800019bc:	72050513          	addi	a0,a0,1824 # 800050d8 <CONSOLE_STATUS+0xc8>
    800019c0:	00000097          	auipc	ra,0x0
    800019c4:	aa4080e7          	jalr	-1372(ra) # 80001464 <_Z11printStringPKc>
	printInteger(*(uint64*)arg2);
    800019c8:	00093503          	ld	a0,0(s2)
    800019cc:	00000097          	auipc	ra,0x0
    800019d0:	ac0080e7          	jalr	-1344(ra) # 8000148c <_Z12printIntegerm>
	printString("\nGotova nit 2\n");
    800019d4:	00003517          	auipc	a0,0x3
    800019d8:	72450513          	addi	a0,a0,1828 # 800050f8 <CONSOLE_STATUS+0xe8>
    800019dc:	00000097          	auipc	ra,0x0
    800019e0:	a88080e7          	jalr	-1400(ra) # 80001464 <_Z11printStringPKc>
}
    800019e4:	02813083          	ld	ra,40(sp)
    800019e8:	02013403          	ld	s0,32(sp)
    800019ec:	01813483          	ld	s1,24(sp)
    800019f0:	01013903          	ld	s2,16(sp)
    800019f4:	03010113          	addi	sp,sp,48
    800019f8:	00008067          	ret

00000000800019fc <_Z5nit3fPv>:
void nit3f(void*) {
    800019fc:	fe010113          	addi	sp,sp,-32
    80001a00:	00113c23          	sd	ra,24(sp)
    80001a04:	00813823          	sd	s0,16(sp)
    80001a08:	00913423          	sd	s1,8(sp)
    80001a0c:	02010413          	addi	s0,sp,32
	for (int i = 0; i < 20; i++) {
    80001a10:	00000493          	li	s1,0
    80001a14:	0300006f          	j	80001a44 <_Z5nit3fPv+0x48>
		printInteger(i);
    80001a18:	00048513          	mv	a0,s1
    80001a1c:	00000097          	auipc	ra,0x0
    80001a20:	a70080e7          	jalr	-1424(ra) # 8000148c <_Z12printIntegerm>
		printString("\n");
    80001a24:	00003517          	auipc	a0,0x3
    80001a28:	65450513          	addi	a0,a0,1620 # 80005078 <CONSOLE_STATUS+0x68>
    80001a2c:	00000097          	auipc	ra,0x0
    80001a30:	a38080e7          	jalr	-1480(ra) # 80001464 <_Z11printStringPKc>
		time_sleep(10);
    80001a34:	00a00513          	li	a0,10
    80001a38:	00000097          	auipc	ra,0x0
    80001a3c:	93c080e7          	jalr	-1732(ra) # 80001374 <_Z10time_sleepm>
	for (int i = 0; i < 20; i++) {
    80001a40:	0014849b          	addiw	s1,s1,1
    80001a44:	01300793          	li	a5,19
    80001a48:	fc97d8e3          	bge	a5,s1,80001a18 <_Z5nit3fPv+0x1c>
}
    80001a4c:	01813083          	ld	ra,24(sp)
    80001a50:	01013403          	ld	s0,16(sp)
    80001a54:	00813483          	ld	s1,8(sp)
    80001a58:	02010113          	addi	sp,sp,32
    80001a5c:	00008067          	ret

0000000080001a60 <_ZN5Riscv7w_stvecEm>:
	uint64 volatile stvec;
	__asm__ volatile("csrr %[stvec], stvec": [stvec] "=r"(stvec));
	return stvec;
}

inline void Riscv::w_stvec(uint64 stvec) {
    80001a60:	ff010113          	addi	sp,sp,-16
    80001a64:	00813423          	sd	s0,8(sp)
    80001a68:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrw stvec, %[stvec]": :[stvec] "r"(stvec));
    80001a6c:	10551073          	csrw	stvec,a0
}
    80001a70:	00813403          	ld	s0,8(sp)
    80001a74:	01010113          	addi	sp,sp,16
    80001a78:	00008067          	ret

0000000080001a7c <_ZN5Riscv10ms_sstatusEm>:

inline void Riscv::w_sip(uint64 sip) {
	__asm__ volatile("csrw sip, %[sip]": :[sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask) {
    80001a7c:	ff010113          	addi	sp,sp,-16
    80001a80:	00813423          	sd	s0,8(sp)
    80001a84:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80001a88:	10052073          	csrs	sstatus,a0
}
    80001a8c:	00813403          	ld	s0,8(sp)
    80001a90:	01010113          	addi	sp,sp,16
    80001a94:	00008067          	ret

0000000080001a98 <_ZN5Riscv10mc_sstatusEm>:

inline void Riscv::mc_sstatus(uint64 mask) {
    80001a98:	ff010113          	addi	sp,sp,-16
    80001a9c:	00813423          	sd	s0,8(sp)
    80001aa0:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80001aa4:	10053073          	csrc	sstatus,a0
}
    80001aa8:	00813403          	ld	s0,8(sp)
    80001aac:	01010113          	addi	sp,sp,16
    80001ab0:	00008067          	ret

0000000080001ab4 <_ZN3TCB10isFinishedEv>:

	using Body = void (*)(void*);

	static TCB* createThread(Body function, void* args, uint64* stack);

	bool isFinished() { return finished; }
    80001ab4:	ff010113          	addi	sp,sp,-16
    80001ab8:	00813423          	sd	s0,8(sp)
    80001abc:	01010413          	addi	s0,sp,16
    80001ac0:	03054503          	lbu	a0,48(a0)
    80001ac4:	00813403          	ld	s0,8(sp)
    80001ac8:	01010113          	addi	sp,sp,16
    80001acc:	00008067          	ret

0000000080001ad0 <interruptRoutine>:
#include "../h/syscall_c.hpp"
#include "../h/TCB.hpp"
#include "../h/Scheduler.hpp"

#pragma GCC optimize("O0")
extern "C" void interruptRoutine() {
    80001ad0:	f2010113          	addi	sp,sp,-224
    80001ad4:	0c113c23          	sd	ra,216(sp)
    80001ad8:	0c813823          	sd	s0,208(sp)
    80001adc:	0e010413          	addi	s0,sp,224
	uint64 scause, sepc, sstatus;
	__asm__ volatile("csrr %[scause], scause":[scause] "=r"(scause): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001ae0:	14202373          	csrr	t1,scause
    80001ae4:	fc643c23          	sd	t1,-40(s0)
	__asm__ volatile("csrr %[sepc], sepc":[sepc] "=r"(sepc): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001ae8:	14102373          	csrr	t1,sepc
    80001aec:	fc643823          	sd	t1,-48(s0)
	__asm__ volatile("csrr %[status], sstatus":[status] "=r"(
			sstatus): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001af0:	10002373          	csrr	t1,sstatus
    80001af4:	fc643423          	sd	t1,-56(s0)
	uint64 a0, a1, a2, a3, a4, a5, a6, a7;
	__asm__ volatile("mv %[ax], a0":[ax] "=r"(a0): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001af8:	00050313          	mv	t1,a0
    80001afc:	fc643023          	sd	t1,-64(s0)
	__asm__ volatile("mv %[ax], a1":[ax] "=r"(a1): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001b00:	00058313          	mv	t1,a1
    80001b04:	fa643c23          	sd	t1,-72(s0)
	__asm__ volatile("mv %[ax], a2":[ax] "=r"(a2): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001b08:	00060313          	mv	t1,a2
    80001b0c:	fa643823          	sd	t1,-80(s0)
	__asm__ volatile("mv %[ax], a3":[ax] "=r"(a3): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001b10:	00068313          	mv	t1,a3
    80001b14:	fa643423          	sd	t1,-88(s0)
	__asm__ volatile("mv %[ax], a4":[ax] "=r"(a4): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001b18:	00070313          	mv	t1,a4
    80001b1c:	fa643023          	sd	t1,-96(s0)
	__asm__ volatile("mv %[ax], a5":[ax] "=r"(a5): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001b20:	00078313          	mv	t1,a5
    80001b24:	f8643c23          	sd	t1,-104(s0)
	__asm__ volatile("mv %[ax], a6":[ax] "=r"(a6): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001b28:	00080313          	mv	t1,a6
    80001b2c:	f8643823          	sd	t1,-112(s0)
	__asm__ volatile("mv %[ax], a7":[ax] "=r"(a7): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001b30:	00088313          	mv	t1,a7
    80001b34:	f8643423          	sd	t1,-120(s0)

	if (scause == 0x09 || scause == 0x08) {
    80001b38:	fd843703          	ld	a4,-40(s0)
    80001b3c:	00900793          	li	a5,9
    80001b40:	00f70863          	beq	a4,a5,80001b50 <interruptRoutine+0x80>
    80001b44:	fd843703          	ld	a4,-40(s0)
    80001b48:	00800793          	li	a5,8
    80001b4c:	30f71063          	bne	a4,a5,80001e4c <interruptRoutine+0x37c>
		//prekid zbog poziva ecall
		uint64 opCode = a0;
    80001b50:	fc043783          	ld	a5,-64(s0)
    80001b54:	f8f43023          	sd	a5,-128(s0)
		switch (opCode) {
    80001b58:	f8043703          	ld	a4,-128(s0)
    80001b5c:	09100793          	li	a5,145
    80001b60:	1cf70663          	beq	a4,a5,80001d2c <interruptRoutine+0x25c>
    80001b64:	f8043703          	ld	a4,-128(s0)
    80001b68:	09100793          	li	a5,145
    80001b6c:	2ae7e463          	bltu	a5,a4,80001e14 <interruptRoutine+0x344>
    80001b70:	f8043703          	ld	a4,-128(s0)
    80001b74:	04200793          	li	a5,66
    80001b78:	04e7e263          	bltu	a5,a4,80001bbc <interruptRoutine+0xec>
    80001b7c:	f8043783          	ld	a5,-128(s0)
    80001b80:	28078a63          	beqz	a5,80001e14 <interruptRoutine+0x344>
    80001b84:	f8043703          	ld	a4,-128(s0)
    80001b88:	04200793          	li	a5,66
    80001b8c:	28e7e463          	bltu	a5,a4,80001e14 <interruptRoutine+0x344>
    80001b90:	f8043783          	ld	a5,-128(s0)
    80001b94:	00279713          	slli	a4,a5,0x2
    80001b98:	00003797          	auipc	a5,0x3
    80001b9c:	57078793          	addi	a5,a5,1392 # 80005108 <CONSOLE_STATUS+0xf8>
    80001ba0:	00f707b3          	add	a5,a4,a5
    80001ba4:	0007a783          	lw	a5,0(a5)
    80001ba8:	0007871b          	sext.w	a4,a5
    80001bac:	00003797          	auipc	a5,0x3
    80001bb0:	55c78793          	addi	a5,a5,1372 # 80005108 <CONSOLE_STATUS+0xf8>
    80001bb4:	00f707b3          	add	a5,a4,a5
    80001bb8:	00078067          	jr	a5
    80001bbc:	f8043703          	ld	a4,-128(s0)
    80001bc0:	09000793          	li	a5,144
    80001bc4:	12f70863          	beq	a4,a5,80001cf4 <interruptRoutine+0x224>
//				printInteger(opCode);
//				printString("\nscause: ");
//				printInteger(scause);
//				printString("\nsepc: ");
//				printInteger(sepc);
				break;
    80001bc8:	24c0006f          	j	80001e14 <interruptRoutine+0x344>
				size = (size_t)a1;
    80001bcc:	fb843783          	ld	a5,-72(s0)
    80001bd0:	f2f43c23          	sd	a5,-200(s0)
				size = size * MEM_BLOCK_SIZE;
    80001bd4:	f3843783          	ld	a5,-200(s0)
    80001bd8:	00679793          	slli	a5,a5,0x6
    80001bdc:	f2f43c23          	sd	a5,-200(s0)
				MemoryAllocator::kmalloc(size);
    80001be0:	f3843503          	ld	a0,-200(s0)
    80001be4:	00001097          	auipc	ra,0x1
    80001be8:	968080e7          	jalr	-1688(ra) # 8000254c <_ZN15MemoryAllocator7kmallocEm>
				__asm__ volatile("sd a0, 80(s0)");
    80001bec:	04a43823          	sd	a0,80(s0)
				break;
    80001bf0:	2400006f          	j	80001e30 <interruptRoutine+0x360>
				ptr = (void*)a1;
    80001bf4:	fb843783          	ld	a5,-72(s0)
    80001bf8:	f4f43023          	sd	a5,-192(s0)
				MemoryAllocator::kfree(ptr);
    80001bfc:	f4043503          	ld	a0,-192(s0)
    80001c00:	00001097          	auipc	ra,0x1
    80001c04:	af4080e7          	jalr	-1292(ra) # 800026f4 <_ZN15MemoryAllocator5kfreeEPv>
				__asm__ volatile("sd a0, 80(s0)");
    80001c08:	04a43823          	sd	a0,80(s0)
				break;
    80001c0c:	2240006f          	j	80001e30 <interruptRoutine+0x360>
				handle = (thread_t*)a1;
    80001c10:	fb843783          	ld	a5,-72(s0)
    80001c14:	f6f43023          	sd	a5,-160(s0)
				function = (void (*)(void*))a2;
    80001c18:	fb043783          	ld	a5,-80(s0)
    80001c1c:	f4f43c23          	sd	a5,-168(s0)
				args = (void*)a3;
    80001c20:	fa843783          	ld	a5,-88(s0)
    80001c24:	f4f43823          	sd	a5,-176(s0)
				sp = (uint64*)a4;
    80001c28:	fa043783          	ld	a5,-96(s0)
    80001c2c:	f4f43423          	sd	a5,-184(s0)
				*handle = TCB::createThread(function, args, sp);
    80001c30:	f4843603          	ld	a2,-184(s0)
    80001c34:	f5043583          	ld	a1,-176(s0)
    80001c38:	f5843503          	ld	a0,-168(s0)
    80001c3c:	00001097          	auipc	ra,0x1
    80001c40:	800080e7          	jalr	-2048(ra) # 8000243c <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80001c44:	00050713          	mv	a4,a0
    80001c48:	f6043783          	ld	a5,-160(s0)
    80001c4c:	00e7b023          	sd	a4,0(a5)
				if (*handle != nullptr) {
    80001c50:	f6043783          	ld	a5,-160(s0)
    80001c54:	0007b783          	ld	a5,0(a5)
    80001c58:	00078663          	beqz	a5,80001c64 <interruptRoutine+0x194>
					__asm__ volatile("li a0, 0");
    80001c5c:	00000513          	li	a0,0
    80001c60:	0080006f          	j	80001c68 <interruptRoutine+0x198>
					__asm__ volatile("li a0, -1");
    80001c64:	fff00513          	li	a0,-1
				__asm__ volatile("sd a0, 80(s0)");
    80001c68:	04a43823          	sd	a0,80(s0)
				break;
    80001c6c:	1c40006f          	j	80001e30 <interruptRoutine+0x360>
				TCB::running->setFinished(true);
    80001c70:	00004797          	auipc	a5,0x4
    80001c74:	3407b783          	ld	a5,832(a5) # 80005fb0 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001c78:	0007b783          	ld	a5,0(a5)
    80001c7c:	00100593          	li	a1,1
    80001c80:	00078513          	mv	a0,a5
    80001c84:	00000097          	auipc	ra,0x0
    80001c88:	2f8080e7          	jalr	760(ra) # 80001f7c <_ZN3TCB11setFinishedEb>
				TCB::yield();
    80001c8c:	00000097          	auipc	ra,0x0
    80001c90:	74c080e7          	jalr	1868(ra) # 800023d8 <_ZN3TCB5yieldEv>
				break;
    80001c94:	19c0006f          	j	80001e30 <interruptRoutine+0x360>
				TCB::yield();
    80001c98:	00000097          	auipc	ra,0x0
    80001c9c:	740080e7          	jalr	1856(ra) # 800023d8 <_ZN3TCB5yieldEv>
				break;
    80001ca0:	1900006f          	j	80001e30 <interruptRoutine+0x360>
				timerPeriods = (time_t)a1;
    80001ca4:	fb843783          	ld	a5,-72(s0)
    80001ca8:	f6f43423          	sd	a5,-152(s0)
				if (timerPeriods>0) {
    80001cac:	f6843783          	ld	a5,-152(s0)
    80001cb0:	00078663          	beqz	a5,80001cbc <interruptRoutine+0x1ec>
					__asm__ volatile("li a0, 0");
    80001cb4:	00000513          	li	a0,0
    80001cb8:	0080006f          	j	80001cc0 <interruptRoutine+0x1f0>
					__asm__ volatile("li a0, -1");
    80001cbc:	fff00513          	li	a0,-1
				__asm__ volatile("sd a0, 80(s0)");
    80001cc0:	04a43823          	sd	a0,80(s0)
				if(timerPeriods>0) {
    80001cc4:	f6843783          	ld	a5,-152(s0)
    80001cc8:	14078a63          	beqz	a5,80001e1c <interruptRoutine+0x34c>
					Scheduler::putToSleep(TCB::running, timerPeriods);
    80001ccc:	00004797          	auipc	a5,0x4
    80001cd0:	2e47b783          	ld	a5,740(a5) # 80005fb0 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001cd4:	0007b783          	ld	a5,0(a5)
    80001cd8:	f6843583          	ld	a1,-152(s0)
    80001cdc:	00078513          	mv	a0,a5
    80001ce0:	00000097          	auipc	ra,0x0
    80001ce4:	858080e7          	jalr	-1960(ra) # 80001538 <_ZN9Scheduler10putToSleepEP3TCBm>
					TCB::yield();
    80001ce8:	00000097          	auipc	ra,0x0
    80001cec:	6f0080e7          	jalr	1776(ra) # 800023d8 <_ZN3TCB5yieldEv>
				break;
    80001cf0:	12c0006f          	j	80001e1c <interruptRoutine+0x34c>
				string = (const char*)a1;
    80001cf4:	fb843783          	ld	a5,-72(s0)
    80001cf8:	fef43423          	sd	a5,-24(s0)
				while (*string != '\0') {
    80001cfc:	fe843783          	ld	a5,-24(s0)
    80001d00:	0007c783          	lbu	a5,0(a5)
    80001d04:	12078063          	beqz	a5,80001e24 <interruptRoutine+0x354>
					__putc(*string);
    80001d08:	fe843783          	ld	a5,-24(s0)
    80001d0c:	0007c783          	lbu	a5,0(a5)
    80001d10:	00078513          	mv	a0,a5
    80001d14:	00003097          	auipc	ra,0x3
    80001d18:	c98080e7          	jalr	-872(ra) # 800049ac <__putc>
					string++;
    80001d1c:	fe843783          	ld	a5,-24(s0)
    80001d20:	00178793          	addi	a5,a5,1
    80001d24:	fef43423          	sd	a5,-24(s0)
				while (*string != '\0') {
    80001d28:	fd5ff06f          	j	80001cfc <interruptRoutine+0x22c>
				integer = a1;
    80001d2c:	fb843783          	ld	a5,-72(s0)
    80001d30:	f6f43c23          	sd	a5,-136(s0)
				neg = 0;
    80001d34:	f6042a23          	sw	zero,-140(s0)
					x = integer;
    80001d38:	f7843783          	ld	a5,-136(s0)
    80001d3c:	fef42023          	sw	a5,-32(s0)
				i = 0;
    80001d40:	fe042223          	sw	zero,-28(s0)
					buf[i++] = digits[x % 10];
    80001d44:	fe042703          	lw	a4,-32(s0)
    80001d48:	00a00793          	li	a5,10
    80001d4c:	02f777bb          	remuw	a5,a4,a5
    80001d50:	0007861b          	sext.w	a2,a5
    80001d54:	fe442783          	lw	a5,-28(s0)
    80001d58:	0017871b          	addiw	a4,a5,1
    80001d5c:	fee42223          	sw	a4,-28(s0)
    80001d60:	00004697          	auipc	a3,0x4
    80001d64:	1a068693          	addi	a3,a3,416 # 80005f00 <_ZZ16interruptRoutineE6digits>
    80001d68:	02061713          	slli	a4,a2,0x20
    80001d6c:	02075713          	srli	a4,a4,0x20
    80001d70:	00e68733          	add	a4,a3,a4
    80001d74:	00074703          	lbu	a4,0(a4)
    80001d78:	ff040693          	addi	a3,s0,-16
    80001d7c:	00f687b3          	add	a5,a3,a5
    80001d80:	f2e78c23          	sb	a4,-200(a5)
				} while ((x /= 10) != 0);
    80001d84:	fe042703          	lw	a4,-32(s0)
    80001d88:	00a00793          	li	a5,10
    80001d8c:	02f757bb          	divuw	a5,a4,a5
    80001d90:	fef42023          	sw	a5,-32(s0)
    80001d94:	fe042783          	lw	a5,-32(s0)
    80001d98:	0007879b          	sext.w	a5,a5
    80001d9c:	00f037b3          	snez	a5,a5
    80001da0:	0ff7f793          	andi	a5,a5,255
    80001da4:	00078463          	beqz	a5,80001dac <interruptRoutine+0x2dc>
				do {
    80001da8:	f9dff06f          	j	80001d44 <interruptRoutine+0x274>
				if (neg) buf[i++] = '-';
    80001dac:	f7442783          	lw	a5,-140(s0)
    80001db0:	0007879b          	sext.w	a5,a5
    80001db4:	02078063          	beqz	a5,80001dd4 <interruptRoutine+0x304>
    80001db8:	fe442783          	lw	a5,-28(s0)
    80001dbc:	0017871b          	addiw	a4,a5,1
    80001dc0:	fee42223          	sw	a4,-28(s0)
    80001dc4:	ff040713          	addi	a4,s0,-16
    80001dc8:	00f707b3          	add	a5,a4,a5
    80001dcc:	02d00713          	li	a4,45
    80001dd0:	f2e78c23          	sb	a4,-200(a5)
				while (--i >= 0) {
    80001dd4:	fe442783          	lw	a5,-28(s0)
    80001dd8:	fff7879b          	addiw	a5,a5,-1
    80001ddc:	fef42223          	sw	a5,-28(s0)
    80001de0:	fe442783          	lw	a5,-28(s0)
    80001de4:	fff7c793          	not	a5,a5
    80001de8:	01f7d79b          	srliw	a5,a5,0x1f
    80001dec:	0ff7f793          	andi	a5,a5,255
    80001df0:	02078e63          	beqz	a5,80001e2c <interruptRoutine+0x35c>
					__putc(buf[i]);
    80001df4:	fe442783          	lw	a5,-28(s0)
    80001df8:	ff040713          	addi	a4,s0,-16
    80001dfc:	00f707b3          	add	a5,a4,a5
    80001e00:	f387c783          	lbu	a5,-200(a5)
    80001e04:	00078513          	mv	a0,a5
    80001e08:	00003097          	auipc	ra,0x3
    80001e0c:	ba4080e7          	jalr	-1116(ra) # 800049ac <__putc>
				while (--i >= 0) {
    80001e10:	fc5ff06f          	j	80001dd4 <interruptRoutine+0x304>
				break;
    80001e14:	00000013          	nop
    80001e18:	0180006f          	j	80001e30 <interruptRoutine+0x360>
				break;
    80001e1c:	00000013          	nop
    80001e20:	0100006f          	j	80001e30 <interruptRoutine+0x360>
				break;
    80001e24:	00000013          	nop
    80001e28:	0080006f          	j	80001e30 <interruptRoutine+0x360>
				break;
    80001e2c:	00000013          	nop
		}
		//sepc pokazuje na ecall instrukciju, treba preci na sledecu instrukciju
		//sepc += 4;
		__asm__ volatile("addi %[dst], %[src], 0x4":[dst]"=r"(sepc):[src]"r"(
				sepc):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001e30:	fd043303          	ld	t1,-48(s0)
    80001e34:	00430313          	addi	t1,t1,4
    80001e38:	fc643823          	sd	t1,-48(s0)
		__asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001e3c:	fd043303          	ld	t1,-48(s0)
    80001e40:	14131073          	csrw	sepc,t1
    80001e44:	00000013          	nop
//		printString("scause: ");
//		printInteger(scause);
//		printString("\nsepc: ");
//		printInteger(sepc);
	}
}
    80001e48:	0cc0006f          	j	80001f14 <interruptRoutine+0x444>
	} else if (scause == (1UL << 63 | 9)) {
    80001e4c:	fd843703          	ld	a4,-40(s0)
    80001e50:	fff00793          	li	a5,-1
    80001e54:	03f79793          	slli	a5,a5,0x3f
    80001e58:	00978793          	addi	a5,a5,9
    80001e5c:	00f71863          	bne	a4,a5,80001e6c <interruptRoutine+0x39c>
		console_handler();
    80001e60:	00003097          	auipc	ra,0x3
    80001e64:	bc0080e7          	jalr	-1088(ra) # 80004a20 <console_handler>
}
    80001e68:	0ac0006f          	j	80001f14 <interruptRoutine+0x444>
	} else if (scause == (1UL << 63 | 1)) {
    80001e6c:	fd843703          	ld	a4,-40(s0)
    80001e70:	fff00793          	li	a5,-1
    80001e74:	03f79793          	slli	a5,a5,0x3f
    80001e78:	00178793          	addi	a5,a5,1
    80001e7c:	08f71c63          	bne	a4,a5,80001f14 <interruptRoutine+0x444>
		Scheduler::wake();
    80001e80:	fffff097          	auipc	ra,0xfffff
    80001e84:	760080e7          	jalr	1888(ra) # 800015e0 <_ZN9Scheduler4wakeEv>
		TCB::runningTimeSlice++;
    80001e88:	00004797          	auipc	a5,0x4
    80001e8c:	1107b783          	ld	a5,272(a5) # 80005f98 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001e90:	0007b783          	ld	a5,0(a5)
    80001e94:	00178713          	addi	a4,a5,1
    80001e98:	00004797          	auipc	a5,0x4
    80001e9c:	1007b783          	ld	a5,256(a5) # 80005f98 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001ea0:	00e7b023          	sd	a4,0(a5)
		if (TCB::runningTimeSlice >= TCB::running->getTimeSlice()) {
    80001ea4:	00004797          	auipc	a5,0x4
    80001ea8:	10c7b783          	ld	a5,268(a5) # 80005fb0 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001eac:	0007b783          	ld	a5,0(a5)
    80001eb0:	00078513          	mv	a0,a5
    80001eb4:	00000097          	auipc	ra,0x0
    80001eb8:	0e4080e7          	jalr	228(ra) # 80001f98 <_ZN3TCB12getTimeSliceEv>
    80001ebc:	00050713          	mv	a4,a0
    80001ec0:	00004797          	auipc	a5,0x4
    80001ec4:	0d87b783          	ld	a5,216(a5) # 80005f98 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001ec8:	0007b783          	ld	a5,0(a5)
    80001ecc:	00e7b7b3          	sltu	a5,a5,a4
    80001ed0:	0017c793          	xori	a5,a5,1
    80001ed4:	0ff7f793          	andi	a5,a5,255
    80001ed8:	00078c63          	beqz	a5,80001ef0 <interruptRoutine+0x420>
			TCB::yield();
    80001edc:	00000097          	auipc	ra,0x0
    80001ee0:	4fc080e7          	jalr	1276(ra) # 800023d8 <_ZN3TCB5yieldEv>
			TCB::runningTimeSlice = 0;
    80001ee4:	00004797          	auipc	a5,0x4
    80001ee8:	0b47b783          	ld	a5,180(a5) # 80005f98 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001eec:	0007b023          	sd	zero,0(a5)
		Riscv::w_sepc(sepc);
    80001ef0:	fd043503          	ld	a0,-48(s0)
    80001ef4:	00000097          	auipc	ra,0x0
    80001ef8:	034080e7          	jalr	52(ra) # 80001f28 <_ZN5Riscv6w_sepcEm>
		Riscv::w_sstatus(sstatus);
    80001efc:	fc843503          	ld	a0,-56(s0)
    80001f00:	00000097          	auipc	ra,0x0
    80001f04:	060080e7          	jalr	96(ra) # 80001f60 <_ZN5Riscv9w_sstatusEm>
		Riscv::mc_sip(Riscv::SIP_SSIP);
    80001f08:	00200513          	li	a0,2
    80001f0c:	00000097          	auipc	ra,0x0
    80001f10:	038080e7          	jalr	56(ra) # 80001f44 <_ZN5Riscv6mc_sipEm>
}
    80001f14:	00000013          	nop
    80001f18:	0d813083          	ld	ra,216(sp)
    80001f1c:	0d013403          	ld	s0,208(sp)
    80001f20:	0e010113          	addi	sp,sp,224
    80001f24:	00008067          	ret

0000000080001f28 <_ZN5Riscv6w_sepcEm>:
inline void Riscv::w_sepc(uint64 sepc) {
    80001f28:	ff010113          	addi	sp,sp,-16
    80001f2c:	00813423          	sd	s0,8(sp)
    80001f30:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    80001f34:	14151073          	csrw	sepc,a0
}
    80001f38:	00813403          	ld	s0,8(sp)
    80001f3c:	01010113          	addi	sp,sp,16
    80001f40:	00008067          	ret

0000000080001f44 <_ZN5Riscv6mc_sipEm>:
inline void Riscv::mc_sip(uint64 mask) {
    80001f44:	ff010113          	addi	sp,sp,-16
    80001f48:	00813423          	sd	s0,8(sp)
    80001f4c:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sip, %[mask]": :[mask] "r"(mask));
    80001f50:	14453073          	csrc	sip,a0
}
    80001f54:	00813403          	ld	s0,8(sp)
    80001f58:	01010113          	addi	sp,sp,16
    80001f5c:	00008067          	ret

0000000080001f60 <_ZN5Riscv9w_sstatusEm>:
	uint64 volatile sstatus;
	__asm__ volatile("csrr %[sstatus], sstatus": [sstatus] "=r"(sstatus));
	return sstatus;
}

inline void Riscv::w_sstatus(uint64 sstatus) {
    80001f60:	ff010113          	addi	sp,sp,-16
    80001f64:	00813423          	sd	s0,8(sp)
    80001f68:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrw sstatus, %[sstatus]": :[sstatus] "r"(sstatus));
    80001f6c:	10051073          	csrw	sstatus,a0
}
    80001f70:	00813403          	ld	s0,8(sp)
    80001f74:	01010113          	addi	sp,sp,16
    80001f78:	00008067          	ret

0000000080001f7c <_ZN3TCB11setFinishedEb>:

	void setFinished(bool finish) { this->finished = finish; }
    80001f7c:	ff010113          	addi	sp,sp,-16
    80001f80:	00813423          	sd	s0,8(sp)
    80001f84:	01010413          	addi	s0,sp,16
    80001f88:	02b50823          	sb	a1,48(a0)
    80001f8c:	00813403          	ld	s0,8(sp)
    80001f90:	01010113          	addi	sp,sp,16
    80001f94:	00008067          	ret

0000000080001f98 <_ZN3TCB12getTimeSliceEv>:

	bool isBlocked() { return blocked; }

	void setBlocked(bool block) { this->blocked = block; }

	uint64 getTimeSlice() { return timeSlice; }
    80001f98:	ff010113          	addi	sp,sp,-16
    80001f9c:	00813423          	sd	s0,8(sp)
    80001fa0:	01010413          	addi	s0,sp,16
    80001fa4:	02853503          	ld	a0,40(a0)
    80001fa8:	00813403          	ld	s0,8(sp)
    80001fac:	01010113          	addi	sp,sp,16
    80001fb0:	00008067          	ret

0000000080001fb4 <_ZN6ThreadD1Ev>:

Thread::Thread(void (* body)(void*), void* arg) {

}

Thread::~Thread() {
    80001fb4:	ff010113          	addi	sp,sp,-16
    80001fb8:	00813423          	sd	s0,8(sp)
    80001fbc:	01010413          	addi	s0,sp,16

}
    80001fc0:	00813403          	ld	s0,8(sp)
    80001fc4:	01010113          	addi	sp,sp,16
    80001fc8:	00008067          	ret

0000000080001fcc <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned int init) {

}

Semaphore::~Semaphore() {
    80001fcc:	ff010113          	addi	sp,sp,-16
    80001fd0:	00813423          	sd	s0,8(sp)
    80001fd4:	01010413          	addi	s0,sp,16

}
    80001fd8:	00813403          	ld	s0,8(sp)
    80001fdc:	01010113          	addi	sp,sp,16
    80001fe0:	00008067          	ret

0000000080001fe4 <_Znwm>:
void* operator new(size_t size) {
    80001fe4:	ff010113          	addi	sp,sp,-16
    80001fe8:	00113423          	sd	ra,8(sp)
    80001fec:	00813023          	sd	s0,0(sp)
    80001ff0:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    80001ff4:	fffff097          	auipc	ra,0xfffff
    80001ff8:	230080e7          	jalr	560(ra) # 80001224 <_Z9mem_allocm>
}
    80001ffc:	00813083          	ld	ra,8(sp)
    80002000:	00013403          	ld	s0,0(sp)
    80002004:	01010113          	addi	sp,sp,16
    80002008:	00008067          	ret

000000008000200c <_Znam>:
void* operator new[](size_t size) {
    8000200c:	ff010113          	addi	sp,sp,-16
    80002010:	00113423          	sd	ra,8(sp)
    80002014:	00813023          	sd	s0,0(sp)
    80002018:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    8000201c:	fffff097          	auipc	ra,0xfffff
    80002020:	208080e7          	jalr	520(ra) # 80001224 <_Z9mem_allocm>
}
    80002024:	00813083          	ld	ra,8(sp)
    80002028:	00013403          	ld	s0,0(sp)
    8000202c:	01010113          	addi	sp,sp,16
    80002030:	00008067          	ret

0000000080002034 <_ZdlPv>:
void operator delete(void* ptr)noexcept {
    80002034:	ff010113          	addi	sp,sp,-16
    80002038:	00113423          	sd	ra,8(sp)
    8000203c:	00813023          	sd	s0,0(sp)
    80002040:	01010413          	addi	s0,sp,16
mem_free(ptr);
    80002044:	fffff097          	auipc	ra,0xfffff
    80002048:	220080e7          	jalr	544(ra) # 80001264 <_Z8mem_freePv>
}
    8000204c:	00813083          	ld	ra,8(sp)
    80002050:	00013403          	ld	s0,0(sp)
    80002054:	01010113          	addi	sp,sp,16
    80002058:	00008067          	ret

000000008000205c <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    8000205c:	ff010113          	addi	sp,sp,-16
    80002060:	00113423          	sd	ra,8(sp)
    80002064:	00813023          	sd	s0,0(sp)
    80002068:	01010413          	addi	s0,sp,16
}
    8000206c:	00000097          	auipc	ra,0x0
    80002070:	fc8080e7          	jalr	-56(ra) # 80002034 <_ZdlPv>
    80002074:	00813083          	ld	ra,8(sp)
    80002078:	00013403          	ld	s0,0(sp)
    8000207c:	01010113          	addi	sp,sp,16
    80002080:	00008067          	ret

0000000080002084 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    80002084:	ff010113          	addi	sp,sp,-16
    80002088:	00113423          	sd	ra,8(sp)
    8000208c:	00813023          	sd	s0,0(sp)
    80002090:	01010413          	addi	s0,sp,16
}
    80002094:	00000097          	auipc	ra,0x0
    80002098:	fa0080e7          	jalr	-96(ra) # 80002034 <_ZdlPv>
    8000209c:	00813083          	ld	ra,8(sp)
    800020a0:	00013403          	ld	s0,0(sp)
    800020a4:	01010113          	addi	sp,sp,16
    800020a8:	00008067          	ret

00000000800020ac <_ZdaPv>:
void operator delete[](void* ptr)noexcept {
    800020ac:	ff010113          	addi	sp,sp,-16
    800020b0:	00113423          	sd	ra,8(sp)
    800020b4:	00813023          	sd	s0,0(sp)
    800020b8:	01010413          	addi	s0,sp,16
mem_free(ptr);
    800020bc:	fffff097          	auipc	ra,0xfffff
    800020c0:	1a8080e7          	jalr	424(ra) # 80001264 <_Z8mem_freePv>
}
    800020c4:	00813083          	ld	ra,8(sp)
    800020c8:	00013403          	ld	s0,0(sp)
    800020cc:	01010113          	addi	sp,sp,16
    800020d0:	00008067          	ret

00000000800020d4 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (* body)(void*), void* arg) {
    800020d4:	ff010113          	addi	sp,sp,-16
    800020d8:	00813423          	sd	s0,8(sp)
    800020dc:	01010413          	addi	s0,sp,16
    800020e0:	00004797          	auipc	a5,0x4
    800020e4:	e7078793          	addi	a5,a5,-400 # 80005f50 <_ZTV6Thread+0x10>
    800020e8:	00f53023          	sd	a5,0(a0)
}
    800020ec:	00813403          	ld	s0,8(sp)
    800020f0:	01010113          	addi	sp,sp,16
    800020f4:	00008067          	ret

00000000800020f8 <_ZN6Thread5startEv>:
int Thread::start() {
    800020f8:	ff010113          	addi	sp,sp,-16
    800020fc:	00813423          	sd	s0,8(sp)
    80002100:	01010413          	addi	s0,sp,16
}
    80002104:	00000513          	li	a0,0
    80002108:	00813403          	ld	s0,8(sp)
    8000210c:	01010113          	addi	sp,sp,16
    80002110:	00008067          	ret

0000000080002114 <_ZN6Thread4joinEv>:
void Thread::join() {
    80002114:	ff010113          	addi	sp,sp,-16
    80002118:	00813423          	sd	s0,8(sp)
    8000211c:	01010413          	addi	s0,sp,16
}
    80002120:	00813403          	ld	s0,8(sp)
    80002124:	01010113          	addi	sp,sp,16
    80002128:	00008067          	ret

000000008000212c <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    8000212c:	ff010113          	addi	sp,sp,-16
    80002130:	00813423          	sd	s0,8(sp)
    80002134:	01010413          	addi	s0,sp,16
}
    80002138:	00813403          	ld	s0,8(sp)
    8000213c:	01010113          	addi	sp,sp,16
    80002140:	00008067          	ret

0000000080002144 <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t) {
    80002144:	ff010113          	addi	sp,sp,-16
    80002148:	00813423          	sd	s0,8(sp)
    8000214c:	01010413          	addi	s0,sp,16
}
    80002150:	00000513          	li	a0,0
    80002154:	00813403          	ld	s0,8(sp)
    80002158:	01010113          	addi	sp,sp,16
    8000215c:	00008067          	ret

0000000080002160 <_ZN6ThreadC1Ev>:
Thread::Thread() {
    80002160:	ff010113          	addi	sp,sp,-16
    80002164:	00813423          	sd	s0,8(sp)
    80002168:	01010413          	addi	s0,sp,16
    8000216c:	00004797          	auipc	a5,0x4
    80002170:	de478793          	addi	a5,a5,-540 # 80005f50 <_ZTV6Thread+0x10>
    80002174:	00f53023          	sd	a5,0(a0)
}
    80002178:	00813403          	ld	s0,8(sp)
    8000217c:	01010113          	addi	sp,sp,16
    80002180:	00008067          	ret

0000000080002184 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    80002184:	ff010113          	addi	sp,sp,-16
    80002188:	00813423          	sd	s0,8(sp)
    8000218c:	01010413          	addi	s0,sp,16
    80002190:	00004797          	auipc	a5,0x4
    80002194:	de878793          	addi	a5,a5,-536 # 80005f78 <_ZTV9Semaphore+0x10>
    80002198:	00f53023          	sd	a5,0(a0)
}
    8000219c:	00813403          	ld	s0,8(sp)
    800021a0:	01010113          	addi	sp,sp,16
    800021a4:	00008067          	ret

00000000800021a8 <_ZN9Semaphore4waitEv>:

int Semaphore::wait() {
    800021a8:	ff010113          	addi	sp,sp,-16
    800021ac:	00813423          	sd	s0,8(sp)
    800021b0:	01010413          	addi	s0,sp,16
	return 0;
}
    800021b4:	00000513          	li	a0,0
    800021b8:	00813403          	ld	s0,8(sp)
    800021bc:	01010113          	addi	sp,sp,16
    800021c0:	00008067          	ret

00000000800021c4 <_ZN9Semaphore6signalEv>:

int Semaphore::signal() {
    800021c4:	ff010113          	addi	sp,sp,-16
    800021c8:	00813423          	sd	s0,8(sp)
    800021cc:	01010413          	addi	s0,sp,16
	return 0;
}
    800021d0:	00000513          	li	a0,0
    800021d4:	00813403          	ld	s0,8(sp)
    800021d8:	01010113          	addi	sp,sp,16
    800021dc:	00008067          	ret

00000000800021e0 <_ZN14PeriodicThread9terminateEv>:

void PeriodicThread::terminate() {
    800021e0:	ff010113          	addi	sp,sp,-16
    800021e4:	00813423          	sd	s0,8(sp)
    800021e8:	01010413          	addi	s0,sp,16

}
    800021ec:	00813403          	ld	s0,8(sp)
    800021f0:	01010113          	addi	sp,sp,16
    800021f4:	00008067          	ret

00000000800021f8 <_ZN14PeriodicThreadC1Em>:

PeriodicThread::PeriodicThread(time_t period) {
    800021f8:	fe010113          	addi	sp,sp,-32
    800021fc:	00113c23          	sd	ra,24(sp)
    80002200:	00813823          	sd	s0,16(sp)
    80002204:	00913423          	sd	s1,8(sp)
    80002208:	02010413          	addi	s0,sp,32
    8000220c:	00050493          	mv	s1,a0
    80002210:	00000097          	auipc	ra,0x0
    80002214:	f50080e7          	jalr	-176(ra) # 80002160 <_ZN6ThreadC1Ev>
    80002218:	00004797          	auipc	a5,0x4
    8000221c:	d0878793          	addi	a5,a5,-760 # 80005f20 <_ZTV14PeriodicThread+0x10>
    80002220:	00f4b023          	sd	a5,0(s1)

}
    80002224:	01813083          	ld	ra,24(sp)
    80002228:	01013403          	ld	s0,16(sp)
    8000222c:	00813483          	ld	s1,8(sp)
    80002230:	02010113          	addi	sp,sp,32
    80002234:	00008067          	ret

0000000080002238 <_ZN7Console4getcEv>:

char Console::getc() {
    80002238:	ff010113          	addi	sp,sp,-16
    8000223c:	00813423          	sd	s0,8(sp)
    80002240:	01010413          	addi	s0,sp,16
	return 0;
}
    80002244:	00000513          	li	a0,0
    80002248:	00813403          	ld	s0,8(sp)
    8000224c:	01010113          	addi	sp,sp,16
    80002250:	00008067          	ret

0000000080002254 <_ZN7Console4putcEc>:

void Console::putc(char) {
    80002254:	ff010113          	addi	sp,sp,-16
    80002258:	00813423          	sd	s0,8(sp)
    8000225c:	01010413          	addi	s0,sp,16

}
    80002260:	00813403          	ld	s0,8(sp)
    80002264:	01010113          	addi	sp,sp,16
    80002268:	00008067          	ret

000000008000226c <_ZN6Thread3runEv>:
    static void dispatch ();
    static int sleep (time_t);

protected:
    Thread ();
    virtual void run () {}
    8000226c:	ff010113          	addi	sp,sp,-16
    80002270:	00813423          	sd	s0,8(sp)
    80002274:	01010413          	addi	s0,sp,16
    80002278:	00813403          	ld	s0,8(sp)
    8000227c:	01010113          	addi	sp,sp,16
    80002280:	00008067          	ret

0000000080002284 <_ZN14PeriodicThread18periodicActivationEv>:
public:
    void terminate ();

protected:
    PeriodicThread (time_t period);
    virtual void periodicActivation () {}
    80002284:	ff010113          	addi	sp,sp,-16
    80002288:	00813423          	sd	s0,8(sp)
    8000228c:	01010413          	addi	s0,sp,16
    80002290:	00813403          	ld	s0,8(sp)
    80002294:	01010113          	addi	sp,sp,16
    80002298:	00008067          	ret

000000008000229c <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    8000229c:	ff010113          	addi	sp,sp,-16
    800022a0:	00813423          	sd	s0,8(sp)
    800022a4:	01010413          	addi	s0,sp,16
    800022a8:	00004797          	auipc	a5,0x4
    800022ac:	c7878793          	addi	a5,a5,-904 # 80005f20 <_ZTV14PeriodicThread+0x10>
    800022b0:	00f53023          	sd	a5,0(a0)
    800022b4:	00813403          	ld	s0,8(sp)
    800022b8:	01010113          	addi	sp,sp,16
    800022bc:	00008067          	ret

00000000800022c0 <_ZN14PeriodicThreadD0Ev>:
    800022c0:	ff010113          	addi	sp,sp,-16
    800022c4:	00113423          	sd	ra,8(sp)
    800022c8:	00813023          	sd	s0,0(sp)
    800022cc:	01010413          	addi	s0,sp,16
    800022d0:	00004797          	auipc	a5,0x4
    800022d4:	c5078793          	addi	a5,a5,-944 # 80005f20 <_ZTV14PeriodicThread+0x10>
    800022d8:	00f53023          	sd	a5,0(a0)
    800022dc:	00000097          	auipc	ra,0x0
    800022e0:	d58080e7          	jalr	-680(ra) # 80002034 <_ZdlPv>
    800022e4:	00813083          	ld	ra,8(sp)
    800022e8:	00013403          	ld	s0,0(sp)
    800022ec:	01010113          	addi	sp,sp,16
    800022f0:	00008067          	ret

00000000800022f4 <_ZN3TCB7wrapperEv>:
	Riscv::pushRegisters();
	TCB::dispatch();
	Riscv::popRegisters();
}

void TCB::wrapper() {
    800022f4:	ff010113          	addi	sp,sp,-16
    800022f8:	00113423          	sd	ra,8(sp)
    800022fc:	00813023          	sd	s0,0(sp)
    80002300:	01010413          	addi	s0,sp,16
	//pocetak wrappera se izvrsava u supervisor modu,
	//jer nismo izasli iz prekidne rutine prilikom promene konteksta (dispatch/yield)
	Riscv::popSppSpie();
    80002304:	00000097          	auipc	ra,0x0
    80002308:	228080e7          	jalr	552(ra) # 8000252c <_ZN5Riscv10popSppSpieEv>
	//na dalje se izvrsavamo u user modu
	running->threadFunction(running->args);
    8000230c:	00004797          	auipc	a5,0x4
    80002310:	d1c7b783          	ld	a5,-740(a5) # 80006028 <_ZN3TCB7runningE>
    80002314:	0107b703          	ld	a4,16(a5)
    80002318:	0207b503          	ld	a0,32(a5)
    8000231c:	000700e7          	jalr	a4
	//running->finished = true;
	//i dalje smo u user modu, moramo promenu niti vrsiti sistemskim pozivom
	thread_exit();
    80002320:	fffff097          	auipc	ra,0xfffff
    80002324:	ff4080e7          	jalr	-12(ra) # 80001314 <_Z11thread_exitv>
}
    80002328:	00813083          	ld	ra,8(sp)
    8000232c:	00013403          	ld	s0,0(sp)
    80002330:	01010113          	addi	sp,sp,16
    80002334:	00008067          	ret

0000000080002338 <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    80002338:	fe010113          	addi	sp,sp,-32
    8000233c:	00113c23          	sd	ra,24(sp)
    80002340:	00813823          	sd	s0,16(sp)
    80002344:	00913423          	sd	s1,8(sp)
    80002348:	02010413          	addi	s0,sp,32
	TCB* old = TCB::running;
    8000234c:	00004497          	auipc	s1,0x4
    80002350:	cdc4b483          	ld	s1,-804(s1) # 80006028 <_ZN3TCB7runningE>
	if (!old->finished && !old->blocked && old->timeToSleep == 0) {
    80002354:	0304c783          	lbu	a5,48(s1)
    80002358:	00079a63          	bnez	a5,8000236c <_ZN3TCB8dispatchEv+0x34>
    8000235c:	0314c783          	lbu	a5,49(s1)
    80002360:	00079663          	bnez	a5,8000236c <_ZN3TCB8dispatchEv+0x34>
    80002364:	0404b783          	ld	a5,64(s1)
    80002368:	04078a63          	beqz	a5,800023bc <_ZN3TCB8dispatchEv+0x84>
	TCB::running = Scheduler::get();
    8000236c:	fffff097          	auipc	ra,0xfffff
    80002370:	18c080e7          	jalr	396(ra) # 800014f8 <_ZN9Scheduler3getEv>
    80002374:	00050593          	mv	a1,a0
    80002378:	00004797          	auipc	a5,0x4
    8000237c:	cb078793          	addi	a5,a5,-848 # 80006028 <_ZN3TCB7runningE>
    80002380:	00a7b023          	sd	a0,0(a5)
	TCB::runningTimeSlice = 0;
    80002384:	0007b423          	sd	zero,8(a5)
	if (TCB::running->threadFunction == nullptr) {
    80002388:	01053783          	ld	a5,16(a0)
    8000238c:	04078063          	beqz	a5,800023cc <_ZN3TCB8dispatchEv+0x94>
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80002390:	10000793          	li	a5,256
    80002394:	1007b073          	csrc	sstatus,a5
	if (old != TCB::running) TCB::contextSwitch(&old->context, &running->context);
    80002398:	00b48863          	beq	s1,a1,800023a8 <_ZN3TCB8dispatchEv+0x70>
    8000239c:	00048513          	mv	a0,s1
    800023a0:	fffff097          	auipc	ra,0xfffff
    800023a4:	e70080e7          	jalr	-400(ra) # 80001210 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    800023a8:	01813083          	ld	ra,24(sp)
    800023ac:	01013403          	ld	s0,16(sp)
    800023b0:	00813483          	ld	s1,8(sp)
    800023b4:	02010113          	addi	sp,sp,32
    800023b8:	00008067          	ret
		Scheduler::put(old);
    800023bc:	00048513          	mv	a0,s1
    800023c0:	fffff097          	auipc	ra,0xfffff
    800023c4:	0f4080e7          	jalr	244(ra) # 800014b4 <_ZN9Scheduler3putEP3TCB>
    800023c8:	fa5ff06f          	j	8000236c <_ZN3TCB8dispatchEv+0x34>
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    800023cc:	10000793          	li	a5,256
    800023d0:	1007a073          	csrs	sstatus,a5
}
    800023d4:	fc5ff06f          	j	80002398 <_ZN3TCB8dispatchEv+0x60>

00000000800023d8 <_ZN3TCB5yieldEv>:
void TCB::yield() {
    800023d8:	ff010113          	addi	sp,sp,-16
    800023dc:	00113423          	sd	ra,8(sp)
    800023e0:	00813023          	sd	s0,0(sp)
    800023e4:	01010413          	addi	s0,sp,16
	Riscv::pushRegisters();
    800023e8:	fffff097          	auipc	ra,0xfffff
    800023ec:	c18080e7          	jalr	-1000(ra) # 80001000 <_ZN5Riscv13pushRegistersEv>
	TCB::dispatch();
    800023f0:	00000097          	auipc	ra,0x0
    800023f4:	f48080e7          	jalr	-184(ra) # 80002338 <_ZN3TCB8dispatchEv>
	Riscv::popRegisters();
    800023f8:	fffff097          	auipc	ra,0xfffff
    800023fc:	c84080e7          	jalr	-892(ra) # 8000107c <_ZN5Riscv12popRegistersEv>
}
    80002400:	00813083          	ld	ra,8(sp)
    80002404:	00013403          	ld	s0,0(sp)
    80002408:	01010113          	addi	sp,sp,16
    8000240c:	00008067          	ret

0000000080002410 <_ZN3TCBnwEm>:

void* TCB::operator new(size_t size) {
    80002410:	ff010113          	addi	sp,sp,-16
    80002414:	00113423          	sd	ra,8(sp)
    80002418:	00813023          	sd	s0,0(sp)
    8000241c:	01010413          	addi	s0,sp,16
	return MemoryAllocator::kmalloc(size + sizeof(MemoryAllocator::UsedMemSegment));
    80002420:	01050513          	addi	a0,a0,16
    80002424:	00000097          	auipc	ra,0x0
    80002428:	128080e7          	jalr	296(ra) # 8000254c <_ZN15MemoryAllocator7kmallocEm>
}
    8000242c:	00813083          	ld	ra,8(sp)
    80002430:	00013403          	ld	s0,0(sp)
    80002434:	01010113          	addi	sp,sp,16
    80002438:	00008067          	ret

000000008000243c <_ZN3TCB12createThreadEPFvPvES0_Pm>:
TCB* TCB::createThread(TCB::Body function, void* args, uint64* stack) {
    8000243c:	fd010113          	addi	sp,sp,-48
    80002440:	02113423          	sd	ra,40(sp)
    80002444:	02813023          	sd	s0,32(sp)
    80002448:	00913c23          	sd	s1,24(sp)
    8000244c:	01213823          	sd	s2,16(sp)
    80002450:	01313423          	sd	s3,8(sp)
    80002454:	01413023          	sd	s4,0(sp)
    80002458:	03010413          	addi	s0,sp,48
    8000245c:	00050993          	mv	s3,a0
    80002460:	00058a13          	mv	s4,a1
    80002464:	00060913          	mv	s2,a2
	TCB* newThread = new TCB(function, args, stack);
    80002468:	05000513          	li	a0,80
    8000246c:	00000097          	auipc	ra,0x0
    80002470:	fa4080e7          	jalr	-92(ra) # 80002410 <_ZN3TCBnwEm>
    80002474:	00050493          	mv	s1,a0
	time_t timeToSleep;
	TCB* nextSleeping;

	TCB(Body function, void* args, uint64* stack) : threadFunction(function), stack(stack), args(args),
													timeSlice(DEFAULT_TIME_SLICE), finished(false), blocked(false),
													nextInScheduler(nullptr), timeToSleep(0), nextSleeping(nullptr) {
    80002478:	01353823          	sd	s3,16(a0)
    8000247c:	01253c23          	sd	s2,24(a0)
    80002480:	03453023          	sd	s4,32(a0)
    80002484:	00200793          	li	a5,2
    80002488:	02f53423          	sd	a5,40(a0)
    8000248c:	02050823          	sb	zero,48(a0)
    80002490:	020508a3          	sb	zero,49(a0)
    80002494:	02053c23          	sd	zero,56(a0)
    80002498:	04053023          	sd	zero,64(a0)
    8000249c:	04053423          	sd	zero,72(a0)
		//formiranje pocetnog konteksta; specijalni uslovi za main funkciju kojoj se pocetni kontekst automatski formira
		uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
    800024a0:	04098a63          	beqz	s3,800024f4 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xb8>
    800024a4:	00000797          	auipc	a5,0x0
    800024a8:	e5078793          	addi	a5,a5,-432 # 800022f4 <_ZN3TCB7wrapperEv>
		uint64 startSp = stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0;
    800024ac:	04090863          	beqz	s2,800024fc <_ZN3TCB12createThreadEPFvPvES0_Pm+0xc0>
    800024b0:	00008637          	lui	a2,0x8
    800024b4:	00c90933          	add	s2,s2,a2
		this->context.ra = startRa;
    800024b8:	00f4b023          	sd	a5,0(s1)
		this->context.sp = startSp;
    800024bc:	0124b423          	sd	s2,8(s1)
	if (function != nullptr) Scheduler::put(newThread);
    800024c0:	00098863          	beqz	s3,800024d0 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x94>
    800024c4:	00048513          	mv	a0,s1
    800024c8:	fffff097          	auipc	ra,0xfffff
    800024cc:	fec080e7          	jalr	-20(ra) # 800014b4 <_ZN9Scheduler3putEP3TCB>
}
    800024d0:	00048513          	mv	a0,s1
    800024d4:	02813083          	ld	ra,40(sp)
    800024d8:	02013403          	ld	s0,32(sp)
    800024dc:	01813483          	ld	s1,24(sp)
    800024e0:	01013903          	ld	s2,16(sp)
    800024e4:	00813983          	ld	s3,8(sp)
    800024e8:	00013a03          	ld	s4,0(sp)
    800024ec:	03010113          	addi	sp,sp,48
    800024f0:	00008067          	ret
		uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
    800024f4:	00000793          	li	a5,0
    800024f8:	fb5ff06f          	j	800024ac <_ZN3TCB12createThreadEPFvPvES0_Pm+0x70>
		uint64 startSp = stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0;
    800024fc:	00000913          	li	s2,0
    80002500:	fb9ff06f          	j	800024b8 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x7c>

0000000080002504 <_ZN3TCBdlEPv>:

void TCB::operator delete(void* ptr) {
    80002504:	ff010113          	addi	sp,sp,-16
    80002508:	00113423          	sd	ra,8(sp)
    8000250c:	00813023          	sd	s0,0(sp)
    80002510:	01010413          	addi	s0,sp,16
	MemoryAllocator::kfree(ptr);
    80002514:	00000097          	auipc	ra,0x0
    80002518:	1e0080e7          	jalr	480(ra) # 800026f4 <_ZN15MemoryAllocator5kfreeEPv>
}
    8000251c:	00813083          	ld	ra,8(sp)
    80002520:	00013403          	ld	s0,0(sp)
    80002524:	01010113          	addi	sp,sp,16
    80002528:	00008067          	ret

000000008000252c <_ZN5Riscv10popSppSpieEv>:
// Created by os on 5/17/23.
//

#include "../h/Riscv.hpp"

void Riscv::popSppSpie() {
    8000252c:	ff010113          	addi	sp,sp,-16
    80002530:	00813423          	sd	s0,8(sp)
    80002534:	01010413          	addi	s0,sp,16
	//ra pokazuje iza ove funkcije na nastavak wrappera
	__asm__ volatile("csrw sepc, ra");
    80002538:	14109073          	csrw	sepc,ra
	__asm__ volatile("sret");
    8000253c:	10200073          	sret
    80002540:	00813403          	ld	s0,8(sp)
    80002544:	01010113          	addi	sp,sp,16
    80002548:	00008067          	ret

000000008000254c <_ZN15MemoryAllocator7kmallocEm>:

bool MemoryAllocator::initialized = false;
MemoryAllocator::FreeMemSegment* MemoryAllocator::freeMemHead = nullptr;
MemoryAllocator::UsedMemSegment* MemoryAllocator::usedMemHead = nullptr;

void* MemoryAllocator::kmalloc(size_t size) {
    8000254c:	ff010113          	addi	sp,sp,-16
    80002550:	00813423          	sd	s0,8(sp)
    80002554:	01010413          	addi	s0,sp,16
	if (size <= 0) return nullptr;
    80002558:	12050663          	beqz	a0,80002684 <_ZN15MemoryAllocator7kmallocEm+0x138>

	//pocetna inicijalizacija
	if (!initialized) {
    8000255c:	00004797          	auipc	a5,0x4
    80002560:	adc7c783          	lbu	a5,-1316(a5) # 80006038 <_ZN15MemoryAllocator11initializedE>
    80002564:	04079863          	bnez	a5,800025b4 <_ZN15MemoryAllocator7kmallocEm+0x68>
		freeMemHead = (FreeMemSegment*)HEAP_START_ADDR;
    80002568:	00004617          	auipc	a2,0x4
    8000256c:	a3863603          	ld	a2,-1480(a2) # 80005fa0 <_GLOBAL_OFFSET_TABLE_+0x10>
    80002570:	00063783          	ld	a5,0(a2)
    80002574:	00004717          	auipc	a4,0x4
    80002578:	ac470713          	addi	a4,a4,-1340 # 80006038 <_ZN15MemoryAllocator11initializedE>
    8000257c:	00f73423          	sd	a5,8(a4)
		freeMemHead->next = nullptr;
    80002580:	0007b023          	sd	zero,0(a5)
		freeMemHead->prev = nullptr;
    80002584:	00873683          	ld	a3,8(a4)
    80002588:	0006b423          	sd	zero,8(a3)
		freeMemHead->size = (char*)HEAP_END_ADDR - (char*)HEAP_START_ADDR - sizeof(FreeMemSegment);
    8000258c:	00004797          	auipc	a5,0x4
    80002590:	a2c7b783          	ld	a5,-1492(a5) # 80005fb8 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002594:	0007b783          	ld	a5,0(a5)
    80002598:	00063603          	ld	a2,0(a2)
    8000259c:	40c787b3          	sub	a5,a5,a2
    800025a0:	fe878793          	addi	a5,a5,-24
    800025a4:	00f6b823          	sd	a5,16(a3)
		usedMemHead = nullptr;
    800025a8:	00073823          	sd	zero,16(a4)

		initialized = true;
    800025ac:	00100793          	li	a5,1
    800025b0:	00f70023          	sb	a5,0(a4)
	}

	//alokacija uvek zaokruzena na blokove
	//size += sizeof(UsedMemSegment); ;prebaceno u mem_alloc
	size_t blocks = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
    800025b4:	00655793          	srli	a5,a0,0x6
    800025b8:	03f57513          	andi	a0,a0,63
    800025bc:	00050463          	beqz	a0,800025c4 <_ZN15MemoryAllocator7kmallocEm+0x78>
    800025c0:	00100513          	li	a0,1
    800025c4:	00a78533          	add	a0,a5,a0
	size = blocks * MEM_BLOCK_SIZE;
    800025c8:	00651793          	slli	a5,a0,0x6

	//trazenje slobodnog segmenta po first-fit algoritmu
	for (FreeMemSegment* current = freeMemHead; current; current = current->next) {
    800025cc:	00004517          	auipc	a0,0x4
    800025d0:	a7453503          	ld	a0,-1420(a0) # 80006040 <_ZN15MemoryAllocator11freeMemHeadE>
    800025d4:	08050a63          	beqz	a0,80002668 <_ZN15MemoryAllocator7kmallocEm+0x11c>
		if (current->size < size) continue;
    800025d8:	01053703          	ld	a4,16(a0)
    800025dc:	06f76263          	bltu	a4,a5,80002640 <_ZN15MemoryAllocator7kmallocEm+0xf4>

		//pravljenje novog slobodnog fragmenta od ostatka fragmenta
		FreeMemSegment* remainderFree = (FreeMemSegment*)((char*)current + size);
    800025e0:	00f506b3          	add	a3,a0,a5
		remainderFree->size = current->size - size;
    800025e4:	40f70733          	sub	a4,a4,a5
    800025e8:	00e6b823          	sd	a4,16(a3)
		remainderFree->prev = current->prev;
    800025ec:	00853703          	ld	a4,8(a0)
    800025f0:	00e6b423          	sd	a4,8(a3)
		if (current->prev) current->prev->next = remainderFree;
    800025f4:	00070463          	beqz	a4,800025fc <_ZN15MemoryAllocator7kmallocEm+0xb0>
    800025f8:	00d73023          	sd	a3,0(a4)
		remainderFree->next = current->next;
    800025fc:	00053703          	ld	a4,0(a0)
    80002600:	00e6b023          	sd	a4,0(a3)
		if (current->next) current->next->prev = remainderFree;
    80002604:	00070463          	beqz	a4,8000260c <_ZN15MemoryAllocator7kmallocEm+0xc0>
    80002608:	00d73423          	sd	a3,8(a4)
		if (freeMemHead == current) freeMemHead = remainderFree;
    8000260c:	00004717          	auipc	a4,0x4
    80002610:	a3473703          	ld	a4,-1484(a4) # 80006040 <_ZN15MemoryAllocator11freeMemHeadE>
    80002614:	02a70a63          	beq	a4,a0,80002648 <_ZN15MemoryAllocator7kmallocEm+0xfc>

		//ubacivanje novog fragmenta u listu zauzetih fragmenata
		UsedMemSegment* newFragment = (UsedMemSegment*)current;
		newFragment->size = size;
    80002618:	00f53423          	sd	a5,8(a0)
		UsedMemSegment* prevUsed = nullptr;
		for (UsedMemSegment* cur = usedMemHead; cur && cur < newFragment; prevUsed = cur, cur = cur->next);
    8000261c:	00004697          	auipc	a3,0x4
    80002620:	a2c6b683          	ld	a3,-1492(a3) # 80006048 <_ZN15MemoryAllocator11usedMemHeadE>
    80002624:	00068793          	mv	a5,a3
		UsedMemSegment* prevUsed = nullptr;
    80002628:	00000713          	li	a4,0
		for (UsedMemSegment* cur = usedMemHead; cur && cur < newFragment; prevUsed = cur, cur = cur->next);
    8000262c:	02078463          	beqz	a5,80002654 <_ZN15MemoryAllocator7kmallocEm+0x108>
    80002630:	02a7f263          	bgeu	a5,a0,80002654 <_ZN15MemoryAllocator7kmallocEm+0x108>
    80002634:	00078713          	mv	a4,a5
    80002638:	0007b783          	ld	a5,0(a5)
    8000263c:	ff1ff06f          	j	8000262c <_ZN15MemoryAllocator7kmallocEm+0xe0>
	for (FreeMemSegment* current = freeMemHead; current; current = current->next) {
    80002640:	00053503          	ld	a0,0(a0)
    80002644:	f91ff06f          	j	800025d4 <_ZN15MemoryAllocator7kmallocEm+0x88>
		if (freeMemHead == current) freeMemHead = remainderFree;
    80002648:	00004717          	auipc	a4,0x4
    8000264c:	9ed73c23          	sd	a3,-1544(a4) # 80006040 <_ZN15MemoryAllocator11freeMemHeadE>
    80002650:	fc9ff06f          	j	80002618 <_ZN15MemoryAllocator7kmallocEm+0xcc>
		if (!prevUsed) {
    80002654:	02070063          	beqz	a4,80002674 <_ZN15MemoryAllocator7kmallocEm+0x128>
			newFragment->next = usedMemHead;
			usedMemHead = newFragment;
		} else {
			newFragment->next = prevUsed->next;
    80002658:	00073783          	ld	a5,0(a4)
    8000265c:	00f53023          	sd	a5,0(a0)
			prevUsed->next = newFragment;
    80002660:	00a73023          	sd	a0,0(a4)
		}
		return (char*)newFragment + sizeof(UsedMemSegment);
    80002664:	01050513          	addi	a0,a0,16
	}
	return nullptr;
}
    80002668:	00813403          	ld	s0,8(sp)
    8000266c:	01010113          	addi	sp,sp,16
    80002670:	00008067          	ret
			newFragment->next = usedMemHead;
    80002674:	00d53023          	sd	a3,0(a0)
			usedMemHead = newFragment;
    80002678:	00004797          	auipc	a5,0x4
    8000267c:	9ca7b823          	sd	a0,-1584(a5) # 80006048 <_ZN15MemoryAllocator11usedMemHeadE>
    80002680:	fe5ff06f          	j	80002664 <_ZN15MemoryAllocator7kmallocEm+0x118>
	if (size <= 0) return nullptr;
    80002684:	00000513          	li	a0,0
    80002688:	fe1ff06f          	j	80002668 <_ZN15MemoryAllocator7kmallocEm+0x11c>

000000008000268c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>:
	tryToJoin(newFree);
	tryToJoin(prevFree);
	return 0;
}

int MemoryAllocator::tryToJoin(MemoryAllocator::FreeMemSegment* current) {
    8000268c:	ff010113          	addi	sp,sp,-16
    80002690:	00813423          	sd	s0,8(sp)
    80002694:	01010413          	addi	s0,sp,16
	if (!current) return 0;
    80002698:	04050663          	beqz	a0,800026e4 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x58>
	bool nextExists = current->next != nullptr;
    8000269c:	00053783          	ld	a5,0(a0)
	char* nextAddr = (char*)current + current->size;
    800026a0:	01053703          	ld	a4,16(a0)
    800026a4:	00e506b3          	add	a3,a0,a4
	char* cnext = (char*)current->next;
	bool nextIsConnected = (nextAddr == cnext);
	if (nextExists && nextIsConnected) {
    800026a8:	04078263          	beqz	a5,800026ec <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x60>
    800026ac:	00d78a63          	beq	a5,a3,800026c0 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x34>
		current->size += current->next->size;
		current->next = current->next->next;
		if (current->next) current->next->prev = current;
		return 1;
	} else return 0;
    800026b0:	00000513          	li	a0,0
}
    800026b4:	00813403          	ld	s0,8(sp)
    800026b8:	01010113          	addi	sp,sp,16
    800026bc:	00008067          	ret
		current->size += current->next->size;
    800026c0:	0107b683          	ld	a3,16(a5)
    800026c4:	00d70733          	add	a4,a4,a3
    800026c8:	00e53823          	sd	a4,16(a0)
		current->next = current->next->next;
    800026cc:	0007b783          	ld	a5,0(a5)
    800026d0:	00f53023          	sd	a5,0(a0)
		if (current->next) current->next->prev = current;
    800026d4:	00078463          	beqz	a5,800026dc <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x50>
    800026d8:	00a7b423          	sd	a0,8(a5)
		return 1;
    800026dc:	00100513          	li	a0,1
    800026e0:	fd5ff06f          	j	800026b4 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>
	if (!current) return 0;
    800026e4:	00000513          	li	a0,0
    800026e8:	fcdff06f          	j	800026b4 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>
	} else return 0;
    800026ec:	00000513          	li	a0,0
    800026f0:	fc5ff06f          	j	800026b4 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>

00000000800026f4 <_ZN15MemoryAllocator5kfreeEPv>:
	if (!ptr) return 0;
    800026f4:	10050463          	beqz	a0,800027fc <_ZN15MemoryAllocator5kfreeEPv+0x108>
    800026f8:	00050693          	mv	a3,a0
	if (!usedMemHead) return -1;
    800026fc:	00004797          	auipc	a5,0x4
    80002700:	94c7b783          	ld	a5,-1716(a5) # 80006048 <_ZN15MemoryAllocator11usedMemHeadE>
    80002704:	10078063          	beqz	a5,80002804 <_ZN15MemoryAllocator5kfreeEPv+0x110>
	ptr = (char*)ptr - sizeof(UsedMemSegment);
    80002708:	ff050513          	addi	a0,a0,-16
	UsedMemSegment* prevUsed = nullptr;
    8000270c:	00000713          	li	a4,0
	for (; currentUsed && currentUsed != ptr; prevUsed = currentUsed, currentUsed = currentUsed->next);
    80002710:	00078a63          	beqz	a5,80002724 <_ZN15MemoryAllocator5kfreeEPv+0x30>
    80002714:	00a78863          	beq	a5,a0,80002724 <_ZN15MemoryAllocator5kfreeEPv+0x30>
    80002718:	00078713          	mv	a4,a5
    8000271c:	0007b783          	ld	a5,0(a5)
    80002720:	ff1ff06f          	j	80002710 <_ZN15MemoryAllocator5kfreeEPv+0x1c>
	if (currentUsed != ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    80002724:	0ea79463          	bne	a5,a0,8000280c <_ZN15MemoryAllocator5kfreeEPv+0x118>
int MemoryAllocator::kfree(void* ptr) {
    80002728:	fe010113          	addi	sp,sp,-32
    8000272c:	00113c23          	sd	ra,24(sp)
    80002730:	00813823          	sd	s0,16(sp)
    80002734:	00913423          	sd	s1,8(sp)
    80002738:	02010413          	addi	s0,sp,32
	if (prevUsed) prevUsed->next = currentUsed->next;
    8000273c:	02070863          	beqz	a4,8000276c <_ZN15MemoryAllocator5kfreeEPv+0x78>
    80002740:	0007b783          	ld	a5,0(a5)
    80002744:	00f73023          	sd	a5,0(a4)
	if (!freeMemHead || ptr < (char*)freeMemHead) {
    80002748:	00004797          	auipc	a5,0x4
    8000274c:	8f87b783          	ld	a5,-1800(a5) # 80006040 <_ZN15MemoryAllocator11freeMemHeadE>
    80002750:	02078663          	beqz	a5,8000277c <_ZN15MemoryAllocator5kfreeEPv+0x88>
    80002754:	02f56863          	bltu	a0,a5,80002784 <_ZN15MemoryAllocator5kfreeEPv+0x90>
			 prevFree->next != nullptr && ptr > (char*)(prevFree->next); prevFree = prevFree->next);
    80002758:	00078493          	mv	s1,a5
    8000275c:	0007b783          	ld	a5,0(a5)
    80002760:	02078463          	beqz	a5,80002788 <_ZN15MemoryAllocator5kfreeEPv+0x94>
    80002764:	fea7eae3          	bltu	a5,a0,80002758 <_ZN15MemoryAllocator5kfreeEPv+0x64>
    80002768:	0200006f          	j	80002788 <_ZN15MemoryAllocator5kfreeEPv+0x94>
	else usedMemHead = currentUsed->next;
    8000276c:	0007b783          	ld	a5,0(a5)
    80002770:	00004717          	auipc	a4,0x4
    80002774:	8cf73c23          	sd	a5,-1832(a4) # 80006048 <_ZN15MemoryAllocator11usedMemHeadE>
    80002778:	fd1ff06f          	j	80002748 <_ZN15MemoryAllocator5kfreeEPv+0x54>
		prevFree = nullptr;
    8000277c:	00078493          	mv	s1,a5
    80002780:	0080006f          	j	80002788 <_ZN15MemoryAllocator5kfreeEPv+0x94>
    80002784:	00000493          	li	s1,0
	size_t segmentSize = ((UsedMemSegment*)ptr)->size;
    80002788:	ff86b783          	ld	a5,-8(a3)
	newFree->size = segmentSize;
    8000278c:	00f6b023          	sd	a5,0(a3)
	newFree->prev = prevFree;
    80002790:	fe96bc23          	sd	s1,-8(a3)
	if (prevFree) newFree->next = prevFree->next;
    80002794:	04048663          	beqz	s1,800027e0 <_ZN15MemoryAllocator5kfreeEPv+0xec>
    80002798:	0004b783          	ld	a5,0(s1)
    8000279c:	fef6b823          	sd	a5,-16(a3)
	if (newFree->next) newFree->next->prev = newFree;
    800027a0:	ff06b783          	ld	a5,-16(a3)
    800027a4:	00078463          	beqz	a5,800027ac <_ZN15MemoryAllocator5kfreeEPv+0xb8>
    800027a8:	00a7b423          	sd	a0,8(a5)
	if (prevFree) prevFree->next = newFree;
    800027ac:	04048263          	beqz	s1,800027f0 <_ZN15MemoryAllocator5kfreeEPv+0xfc>
    800027b0:	00a4b023          	sd	a0,0(s1)
	tryToJoin(newFree);
    800027b4:	00000097          	auipc	ra,0x0
    800027b8:	ed8080e7          	jalr	-296(ra) # 8000268c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
	tryToJoin(prevFree);
    800027bc:	00048513          	mv	a0,s1
    800027c0:	00000097          	auipc	ra,0x0
    800027c4:	ecc080e7          	jalr	-308(ra) # 8000268c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
	return 0;
    800027c8:	00000513          	li	a0,0
}
    800027cc:	01813083          	ld	ra,24(sp)
    800027d0:	01013403          	ld	s0,16(sp)
    800027d4:	00813483          	ld	s1,8(sp)
    800027d8:	02010113          	addi	sp,sp,32
    800027dc:	00008067          	ret
	else newFree->next = freeMemHead;
    800027e0:	00004797          	auipc	a5,0x4
    800027e4:	8607b783          	ld	a5,-1952(a5) # 80006040 <_ZN15MemoryAllocator11freeMemHeadE>
    800027e8:	fef6b823          	sd	a5,-16(a3)
    800027ec:	fb5ff06f          	j	800027a0 <_ZN15MemoryAllocator5kfreeEPv+0xac>
	else freeMemHead = newFree;
    800027f0:	00004797          	auipc	a5,0x4
    800027f4:	84a7b823          	sd	a0,-1968(a5) # 80006040 <_ZN15MemoryAllocator11freeMemHeadE>
    800027f8:	fbdff06f          	j	800027b4 <_ZN15MemoryAllocator5kfreeEPv+0xc0>
	if (!ptr) return 0;
    800027fc:	00000513          	li	a0,0
    80002800:	00008067          	ret
	if (!usedMemHead) return -1;
    80002804:	fff00513          	li	a0,-1
    80002808:	00008067          	ret
	if (currentUsed != ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    8000280c:	fff00513          	li	a0,-1
}
    80002810:	00008067          	ret

0000000080002814 <_Z10testMemoryv>:
// Created by os on 5/29/23.
//
#include "../h/MemoryAllocator.hpp"
#include "../h/helper.hpp"

void testMemory() {
    80002814:	81010113          	addi	sp,sp,-2032
    80002818:	7e113423          	sd	ra,2024(sp)
    8000281c:	7e813023          	sd	s0,2016(sp)
    80002820:	7c913c23          	sd	s1,2008(sp)
    80002824:	7f010413          	addi	s0,sp,2032
    80002828:	83010113          	addi	sp,sp,-2000
	const uint64 NumAllocations = 500;    //zasto nece za preko 500????
	const uint64 AllocationSize = 16;

	// Allocate and initialize pointers
	int* allocations[NumAllocations];
	for (uint64 i = 0; i < NumAllocations; ++i)
    8000282c:	00000713          	li	a4,0
    80002830:	1f300793          	li	a5,499
    80002834:	02e7e263          	bltu	a5,a4,80002858 <_Z10testMemoryv+0x44>
		allocations[i] = nullptr;
    80002838:	fffff7b7          	lui	a5,0xfffff
    8000283c:	00371693          	slli	a3,a4,0x3
    80002840:	fe040613          	addi	a2,s0,-32
    80002844:	00f607b3          	add	a5,a2,a5
    80002848:	00d787b3          	add	a5,a5,a3
    8000284c:	0607b023          	sd	zero,96(a5) # fffffffffffff060 <end+0xffffffff7fff7db0>
	for (uint64 i = 0; i < NumAllocations; ++i)
    80002850:	00170713          	addi	a4,a4,1
    80002854:	fddff06f          	j	80002830 <_Z10testMemoryv+0x1c>

	// Allocate memory
	for (uint64 i = 0; i < NumAllocations; ++i) {
    80002858:	00000493          	li	s1,0
    8000285c:	1f300793          	li	a5,499
    80002860:	0297ea63          	bltu	a5,s1,80002894 <_Z10testMemoryv+0x80>
		allocations[i] = static_cast<int*>(MemoryAllocator::kmalloc(AllocationSize));
    80002864:	01000513          	li	a0,16
    80002868:	00000097          	auipc	ra,0x0
    8000286c:	ce4080e7          	jalr	-796(ra) # 8000254c <_ZN15MemoryAllocator7kmallocEm>
    80002870:	fffff737          	lui	a4,0xfffff
    80002874:	00349793          	slli	a5,s1,0x3
    80002878:	fe040693          	addi	a3,s0,-32
    8000287c:	00e68733          	add	a4,a3,a4
    80002880:	00f707b3          	add	a5,a4,a5
    80002884:	06a7b023          	sd	a0,96(a5)
		if (allocations[i] == nullptr) {
    80002888:	00050663          	beqz	a0,80002894 <_Z10testMemoryv+0x80>
	for (uint64 i = 0; i < NumAllocations; ++i) {
    8000288c:	00148493          	addi	s1,s1,1
    80002890:	fcdff06f          	j	8000285c <_Z10testMemoryv+0x48>
    80002894:	00000493          	li	s1,0
    80002898:	0100006f          	j	800028a8 <_Z10testMemoryv+0x94>
	}

	// Free memory
	for (uint64 i = 0; i < NumAllocations; ++i) {
		if (allocations[i] != nullptr) {
			if (MemoryAllocator::kfree(allocations[i]) != 0) {
    8000289c:	00000097          	auipc	ra,0x0
    800028a0:	e58080e7          	jalr	-424(ra) # 800026f4 <_ZN15MemoryAllocator5kfreeEPv>
	for (uint64 i = 0; i < NumAllocations; ++i) {
    800028a4:	00148493          	addi	s1,s1,1
    800028a8:	1f300793          	li	a5,499
    800028ac:	0297e263          	bltu	a5,s1,800028d0 <_Z10testMemoryv+0xbc>
		if (allocations[i] != nullptr) {
    800028b0:	fffff737          	lui	a4,0xfffff
    800028b4:	00349793          	slli	a5,s1,0x3
    800028b8:	fe040693          	addi	a3,s0,-32
    800028bc:	00e68733          	add	a4,a3,a4
    800028c0:	00f707b3          	add	a5,a4,a5
    800028c4:	0607b503          	ld	a0,96(a5)
    800028c8:	fc051ae3          	bnez	a0,8000289c <_Z10testMemoryv+0x88>
    800028cc:	fd9ff06f          	j	800028a4 <_Z10testMemoryv+0x90>
//				printString("\nDeallocation failed for index ");
//				printInteger(i);
			}
		}
	}
    800028d0:	7d010113          	addi	sp,sp,2000
    800028d4:	7e813083          	ld	ra,2024(sp)
    800028d8:	7e013403          	ld	s0,2016(sp)
    800028dc:	7d813483          	ld	s1,2008(sp)
    800028e0:	7f010113          	addi	sp,sp,2032
    800028e4:	00008067          	ret

00000000800028e8 <start>:
    800028e8:	ff010113          	addi	sp,sp,-16
    800028ec:	00813423          	sd	s0,8(sp)
    800028f0:	01010413          	addi	s0,sp,16
    800028f4:	300027f3          	csrr	a5,mstatus
    800028f8:	ffffe737          	lui	a4,0xffffe
    800028fc:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff754f>
    80002900:	00e7f7b3          	and	a5,a5,a4
    80002904:	00001737          	lui	a4,0x1
    80002908:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    8000290c:	00e7e7b3          	or	a5,a5,a4
    80002910:	30079073          	csrw	mstatus,a5
    80002914:	00000797          	auipc	a5,0x0
    80002918:	16078793          	addi	a5,a5,352 # 80002a74 <system_main>
    8000291c:	34179073          	csrw	mepc,a5
    80002920:	00000793          	li	a5,0
    80002924:	18079073          	csrw	satp,a5
    80002928:	000107b7          	lui	a5,0x10
    8000292c:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80002930:	30279073          	csrw	medeleg,a5
    80002934:	30379073          	csrw	mideleg,a5
    80002938:	104027f3          	csrr	a5,sie
    8000293c:	2227e793          	ori	a5,a5,546
    80002940:	10479073          	csrw	sie,a5
    80002944:	fff00793          	li	a5,-1
    80002948:	00a7d793          	srli	a5,a5,0xa
    8000294c:	3b079073          	csrw	pmpaddr0,a5
    80002950:	00f00793          	li	a5,15
    80002954:	3a079073          	csrw	pmpcfg0,a5
    80002958:	f14027f3          	csrr	a5,mhartid
    8000295c:	0200c737          	lui	a4,0x200c
    80002960:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80002964:	0007869b          	sext.w	a3,a5
    80002968:	00269713          	slli	a4,a3,0x2
    8000296c:	000f4637          	lui	a2,0xf4
    80002970:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80002974:	00d70733          	add	a4,a4,a3
    80002978:	0037979b          	slliw	a5,a5,0x3
    8000297c:	020046b7          	lui	a3,0x2004
    80002980:	00d787b3          	add	a5,a5,a3
    80002984:	00c585b3          	add	a1,a1,a2
    80002988:	00371693          	slli	a3,a4,0x3
    8000298c:	00003717          	auipc	a4,0x3
    80002990:	6c470713          	addi	a4,a4,1732 # 80006050 <timer_scratch>
    80002994:	00b7b023          	sd	a1,0(a5)
    80002998:	00d70733          	add	a4,a4,a3
    8000299c:	00f73c23          	sd	a5,24(a4)
    800029a0:	02c73023          	sd	a2,32(a4)
    800029a4:	34071073          	csrw	mscratch,a4
    800029a8:	00000797          	auipc	a5,0x0
    800029ac:	6e878793          	addi	a5,a5,1768 # 80003090 <timervec>
    800029b0:	30579073          	csrw	mtvec,a5
    800029b4:	300027f3          	csrr	a5,mstatus
    800029b8:	0087e793          	ori	a5,a5,8
    800029bc:	30079073          	csrw	mstatus,a5
    800029c0:	304027f3          	csrr	a5,mie
    800029c4:	0807e793          	ori	a5,a5,128
    800029c8:	30479073          	csrw	mie,a5
    800029cc:	f14027f3          	csrr	a5,mhartid
    800029d0:	0007879b          	sext.w	a5,a5
    800029d4:	00078213          	mv	tp,a5
    800029d8:	30200073          	mret
    800029dc:	00813403          	ld	s0,8(sp)
    800029e0:	01010113          	addi	sp,sp,16
    800029e4:	00008067          	ret

00000000800029e8 <timerinit>:
    800029e8:	ff010113          	addi	sp,sp,-16
    800029ec:	00813423          	sd	s0,8(sp)
    800029f0:	01010413          	addi	s0,sp,16
    800029f4:	f14027f3          	csrr	a5,mhartid
    800029f8:	0200c737          	lui	a4,0x200c
    800029fc:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80002a00:	0007869b          	sext.w	a3,a5
    80002a04:	00269713          	slli	a4,a3,0x2
    80002a08:	000f4637          	lui	a2,0xf4
    80002a0c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80002a10:	00d70733          	add	a4,a4,a3
    80002a14:	0037979b          	slliw	a5,a5,0x3
    80002a18:	020046b7          	lui	a3,0x2004
    80002a1c:	00d787b3          	add	a5,a5,a3
    80002a20:	00c585b3          	add	a1,a1,a2
    80002a24:	00371693          	slli	a3,a4,0x3
    80002a28:	00003717          	auipc	a4,0x3
    80002a2c:	62870713          	addi	a4,a4,1576 # 80006050 <timer_scratch>
    80002a30:	00b7b023          	sd	a1,0(a5)
    80002a34:	00d70733          	add	a4,a4,a3
    80002a38:	00f73c23          	sd	a5,24(a4)
    80002a3c:	02c73023          	sd	a2,32(a4)
    80002a40:	34071073          	csrw	mscratch,a4
    80002a44:	00000797          	auipc	a5,0x0
    80002a48:	64c78793          	addi	a5,a5,1612 # 80003090 <timervec>
    80002a4c:	30579073          	csrw	mtvec,a5
    80002a50:	300027f3          	csrr	a5,mstatus
    80002a54:	0087e793          	ori	a5,a5,8
    80002a58:	30079073          	csrw	mstatus,a5
    80002a5c:	304027f3          	csrr	a5,mie
    80002a60:	0807e793          	ori	a5,a5,128
    80002a64:	30479073          	csrw	mie,a5
    80002a68:	00813403          	ld	s0,8(sp)
    80002a6c:	01010113          	addi	sp,sp,16
    80002a70:	00008067          	ret

0000000080002a74 <system_main>:
    80002a74:	fe010113          	addi	sp,sp,-32
    80002a78:	00813823          	sd	s0,16(sp)
    80002a7c:	00913423          	sd	s1,8(sp)
    80002a80:	00113c23          	sd	ra,24(sp)
    80002a84:	02010413          	addi	s0,sp,32
    80002a88:	00000097          	auipc	ra,0x0
    80002a8c:	0c4080e7          	jalr	196(ra) # 80002b4c <cpuid>
    80002a90:	00003497          	auipc	s1,0x3
    80002a94:	55048493          	addi	s1,s1,1360 # 80005fe0 <started>
    80002a98:	02050263          	beqz	a0,80002abc <system_main+0x48>
    80002a9c:	0004a783          	lw	a5,0(s1)
    80002aa0:	0007879b          	sext.w	a5,a5
    80002aa4:	fe078ce3          	beqz	a5,80002a9c <system_main+0x28>
    80002aa8:	0ff0000f          	fence
    80002aac:	00002517          	auipc	a0,0x2
    80002ab0:	79c50513          	addi	a0,a0,1948 # 80005248 <CONSOLE_STATUS+0x238>
    80002ab4:	00001097          	auipc	ra,0x1
    80002ab8:	a78080e7          	jalr	-1416(ra) # 8000352c <panic>
    80002abc:	00001097          	auipc	ra,0x1
    80002ac0:	9cc080e7          	jalr	-1588(ra) # 80003488 <consoleinit>
    80002ac4:	00001097          	auipc	ra,0x1
    80002ac8:	158080e7          	jalr	344(ra) # 80003c1c <printfinit>
    80002acc:	00003517          	auipc	a0,0x3
    80002ad0:	85c50513          	addi	a0,a0,-1956 # 80005328 <CONSOLE_STATUS+0x318>
    80002ad4:	00001097          	auipc	ra,0x1
    80002ad8:	ab4080e7          	jalr	-1356(ra) # 80003588 <__printf>
    80002adc:	00002517          	auipc	a0,0x2
    80002ae0:	73c50513          	addi	a0,a0,1852 # 80005218 <CONSOLE_STATUS+0x208>
    80002ae4:	00001097          	auipc	ra,0x1
    80002ae8:	aa4080e7          	jalr	-1372(ra) # 80003588 <__printf>
    80002aec:	00003517          	auipc	a0,0x3
    80002af0:	83c50513          	addi	a0,a0,-1988 # 80005328 <CONSOLE_STATUS+0x318>
    80002af4:	00001097          	auipc	ra,0x1
    80002af8:	a94080e7          	jalr	-1388(ra) # 80003588 <__printf>
    80002afc:	00001097          	auipc	ra,0x1
    80002b00:	4ac080e7          	jalr	1196(ra) # 80003fa8 <kinit>
    80002b04:	00000097          	auipc	ra,0x0
    80002b08:	148080e7          	jalr	328(ra) # 80002c4c <trapinit>
    80002b0c:	00000097          	auipc	ra,0x0
    80002b10:	16c080e7          	jalr	364(ra) # 80002c78 <trapinithart>
    80002b14:	00000097          	auipc	ra,0x0
    80002b18:	5bc080e7          	jalr	1468(ra) # 800030d0 <plicinit>
    80002b1c:	00000097          	auipc	ra,0x0
    80002b20:	5dc080e7          	jalr	1500(ra) # 800030f8 <plicinithart>
    80002b24:	00000097          	auipc	ra,0x0
    80002b28:	078080e7          	jalr	120(ra) # 80002b9c <userinit>
    80002b2c:	0ff0000f          	fence
    80002b30:	00100793          	li	a5,1
    80002b34:	00002517          	auipc	a0,0x2
    80002b38:	6fc50513          	addi	a0,a0,1788 # 80005230 <CONSOLE_STATUS+0x220>
    80002b3c:	00f4a023          	sw	a5,0(s1)
    80002b40:	00001097          	auipc	ra,0x1
    80002b44:	a48080e7          	jalr	-1464(ra) # 80003588 <__printf>
    80002b48:	0000006f          	j	80002b48 <system_main+0xd4>

0000000080002b4c <cpuid>:
    80002b4c:	ff010113          	addi	sp,sp,-16
    80002b50:	00813423          	sd	s0,8(sp)
    80002b54:	01010413          	addi	s0,sp,16
    80002b58:	00020513          	mv	a0,tp
    80002b5c:	00813403          	ld	s0,8(sp)
    80002b60:	0005051b          	sext.w	a0,a0
    80002b64:	01010113          	addi	sp,sp,16
    80002b68:	00008067          	ret

0000000080002b6c <mycpu>:
    80002b6c:	ff010113          	addi	sp,sp,-16
    80002b70:	00813423          	sd	s0,8(sp)
    80002b74:	01010413          	addi	s0,sp,16
    80002b78:	00020793          	mv	a5,tp
    80002b7c:	00813403          	ld	s0,8(sp)
    80002b80:	0007879b          	sext.w	a5,a5
    80002b84:	00779793          	slli	a5,a5,0x7
    80002b88:	00004517          	auipc	a0,0x4
    80002b8c:	4f850513          	addi	a0,a0,1272 # 80007080 <cpus>
    80002b90:	00f50533          	add	a0,a0,a5
    80002b94:	01010113          	addi	sp,sp,16
    80002b98:	00008067          	ret

0000000080002b9c <userinit>:
    80002b9c:	ff010113          	addi	sp,sp,-16
    80002ba0:	00813423          	sd	s0,8(sp)
    80002ba4:	01010413          	addi	s0,sp,16
    80002ba8:	00813403          	ld	s0,8(sp)
    80002bac:	01010113          	addi	sp,sp,16
    80002bb0:	fffff317          	auipc	t1,0xfffff
    80002bb4:	ab030067          	jr	-1360(t1) # 80001660 <main>

0000000080002bb8 <either_copyout>:
    80002bb8:	ff010113          	addi	sp,sp,-16
    80002bbc:	00813023          	sd	s0,0(sp)
    80002bc0:	00113423          	sd	ra,8(sp)
    80002bc4:	01010413          	addi	s0,sp,16
    80002bc8:	02051663          	bnez	a0,80002bf4 <either_copyout+0x3c>
    80002bcc:	00058513          	mv	a0,a1
    80002bd0:	00060593          	mv	a1,a2
    80002bd4:	0006861b          	sext.w	a2,a3
    80002bd8:	00002097          	auipc	ra,0x2
    80002bdc:	c5c080e7          	jalr	-932(ra) # 80004834 <__memmove>
    80002be0:	00813083          	ld	ra,8(sp)
    80002be4:	00013403          	ld	s0,0(sp)
    80002be8:	00000513          	li	a0,0
    80002bec:	01010113          	addi	sp,sp,16
    80002bf0:	00008067          	ret
    80002bf4:	00002517          	auipc	a0,0x2
    80002bf8:	67c50513          	addi	a0,a0,1660 # 80005270 <CONSOLE_STATUS+0x260>
    80002bfc:	00001097          	auipc	ra,0x1
    80002c00:	930080e7          	jalr	-1744(ra) # 8000352c <panic>

0000000080002c04 <either_copyin>:
    80002c04:	ff010113          	addi	sp,sp,-16
    80002c08:	00813023          	sd	s0,0(sp)
    80002c0c:	00113423          	sd	ra,8(sp)
    80002c10:	01010413          	addi	s0,sp,16
    80002c14:	02059463          	bnez	a1,80002c3c <either_copyin+0x38>
    80002c18:	00060593          	mv	a1,a2
    80002c1c:	0006861b          	sext.w	a2,a3
    80002c20:	00002097          	auipc	ra,0x2
    80002c24:	c14080e7          	jalr	-1004(ra) # 80004834 <__memmove>
    80002c28:	00813083          	ld	ra,8(sp)
    80002c2c:	00013403          	ld	s0,0(sp)
    80002c30:	00000513          	li	a0,0
    80002c34:	01010113          	addi	sp,sp,16
    80002c38:	00008067          	ret
    80002c3c:	00002517          	auipc	a0,0x2
    80002c40:	65c50513          	addi	a0,a0,1628 # 80005298 <CONSOLE_STATUS+0x288>
    80002c44:	00001097          	auipc	ra,0x1
    80002c48:	8e8080e7          	jalr	-1816(ra) # 8000352c <panic>

0000000080002c4c <trapinit>:
    80002c4c:	ff010113          	addi	sp,sp,-16
    80002c50:	00813423          	sd	s0,8(sp)
    80002c54:	01010413          	addi	s0,sp,16
    80002c58:	00813403          	ld	s0,8(sp)
    80002c5c:	00002597          	auipc	a1,0x2
    80002c60:	66458593          	addi	a1,a1,1636 # 800052c0 <CONSOLE_STATUS+0x2b0>
    80002c64:	00004517          	auipc	a0,0x4
    80002c68:	49c50513          	addi	a0,a0,1180 # 80007100 <tickslock>
    80002c6c:	01010113          	addi	sp,sp,16
    80002c70:	00001317          	auipc	t1,0x1
    80002c74:	5c830067          	jr	1480(t1) # 80004238 <initlock>

0000000080002c78 <trapinithart>:
    80002c78:	ff010113          	addi	sp,sp,-16
    80002c7c:	00813423          	sd	s0,8(sp)
    80002c80:	01010413          	addi	s0,sp,16
    80002c84:	00000797          	auipc	a5,0x0
    80002c88:	2fc78793          	addi	a5,a5,764 # 80002f80 <kernelvec>
    80002c8c:	10579073          	csrw	stvec,a5
    80002c90:	00813403          	ld	s0,8(sp)
    80002c94:	01010113          	addi	sp,sp,16
    80002c98:	00008067          	ret

0000000080002c9c <usertrap>:
    80002c9c:	ff010113          	addi	sp,sp,-16
    80002ca0:	00813423          	sd	s0,8(sp)
    80002ca4:	01010413          	addi	s0,sp,16
    80002ca8:	00813403          	ld	s0,8(sp)
    80002cac:	01010113          	addi	sp,sp,16
    80002cb0:	00008067          	ret

0000000080002cb4 <usertrapret>:
    80002cb4:	ff010113          	addi	sp,sp,-16
    80002cb8:	00813423          	sd	s0,8(sp)
    80002cbc:	01010413          	addi	s0,sp,16
    80002cc0:	00813403          	ld	s0,8(sp)
    80002cc4:	01010113          	addi	sp,sp,16
    80002cc8:	00008067          	ret

0000000080002ccc <kerneltrap>:
    80002ccc:	fe010113          	addi	sp,sp,-32
    80002cd0:	00813823          	sd	s0,16(sp)
    80002cd4:	00113c23          	sd	ra,24(sp)
    80002cd8:	00913423          	sd	s1,8(sp)
    80002cdc:	02010413          	addi	s0,sp,32
    80002ce0:	142025f3          	csrr	a1,scause
    80002ce4:	100027f3          	csrr	a5,sstatus
    80002ce8:	0027f793          	andi	a5,a5,2
    80002cec:	10079c63          	bnez	a5,80002e04 <kerneltrap+0x138>
    80002cf0:	142027f3          	csrr	a5,scause
    80002cf4:	0207ce63          	bltz	a5,80002d30 <kerneltrap+0x64>
    80002cf8:	00002517          	auipc	a0,0x2
    80002cfc:	61050513          	addi	a0,a0,1552 # 80005308 <CONSOLE_STATUS+0x2f8>
    80002d00:	00001097          	auipc	ra,0x1
    80002d04:	888080e7          	jalr	-1912(ra) # 80003588 <__printf>
    80002d08:	141025f3          	csrr	a1,sepc
    80002d0c:	14302673          	csrr	a2,stval
    80002d10:	00002517          	auipc	a0,0x2
    80002d14:	60850513          	addi	a0,a0,1544 # 80005318 <CONSOLE_STATUS+0x308>
    80002d18:	00001097          	auipc	ra,0x1
    80002d1c:	870080e7          	jalr	-1936(ra) # 80003588 <__printf>
    80002d20:	00002517          	auipc	a0,0x2
    80002d24:	61050513          	addi	a0,a0,1552 # 80005330 <CONSOLE_STATUS+0x320>
    80002d28:	00001097          	auipc	ra,0x1
    80002d2c:	804080e7          	jalr	-2044(ra) # 8000352c <panic>
    80002d30:	0ff7f713          	andi	a4,a5,255
    80002d34:	00900693          	li	a3,9
    80002d38:	04d70063          	beq	a4,a3,80002d78 <kerneltrap+0xac>
    80002d3c:	fff00713          	li	a4,-1
    80002d40:	03f71713          	slli	a4,a4,0x3f
    80002d44:	00170713          	addi	a4,a4,1
    80002d48:	fae798e3          	bne	a5,a4,80002cf8 <kerneltrap+0x2c>
    80002d4c:	00000097          	auipc	ra,0x0
    80002d50:	e00080e7          	jalr	-512(ra) # 80002b4c <cpuid>
    80002d54:	06050663          	beqz	a0,80002dc0 <kerneltrap+0xf4>
    80002d58:	144027f3          	csrr	a5,sip
    80002d5c:	ffd7f793          	andi	a5,a5,-3
    80002d60:	14479073          	csrw	sip,a5
    80002d64:	01813083          	ld	ra,24(sp)
    80002d68:	01013403          	ld	s0,16(sp)
    80002d6c:	00813483          	ld	s1,8(sp)
    80002d70:	02010113          	addi	sp,sp,32
    80002d74:	00008067          	ret
    80002d78:	00000097          	auipc	ra,0x0
    80002d7c:	3cc080e7          	jalr	972(ra) # 80003144 <plic_claim>
    80002d80:	00a00793          	li	a5,10
    80002d84:	00050493          	mv	s1,a0
    80002d88:	06f50863          	beq	a0,a5,80002df8 <kerneltrap+0x12c>
    80002d8c:	fc050ce3          	beqz	a0,80002d64 <kerneltrap+0x98>
    80002d90:	00050593          	mv	a1,a0
    80002d94:	00002517          	auipc	a0,0x2
    80002d98:	55450513          	addi	a0,a0,1364 # 800052e8 <CONSOLE_STATUS+0x2d8>
    80002d9c:	00000097          	auipc	ra,0x0
    80002da0:	7ec080e7          	jalr	2028(ra) # 80003588 <__printf>
    80002da4:	01013403          	ld	s0,16(sp)
    80002da8:	01813083          	ld	ra,24(sp)
    80002dac:	00048513          	mv	a0,s1
    80002db0:	00813483          	ld	s1,8(sp)
    80002db4:	02010113          	addi	sp,sp,32
    80002db8:	00000317          	auipc	t1,0x0
    80002dbc:	3c430067          	jr	964(t1) # 8000317c <plic_complete>
    80002dc0:	00004517          	auipc	a0,0x4
    80002dc4:	34050513          	addi	a0,a0,832 # 80007100 <tickslock>
    80002dc8:	00001097          	auipc	ra,0x1
    80002dcc:	494080e7          	jalr	1172(ra) # 8000425c <acquire>
    80002dd0:	00003717          	auipc	a4,0x3
    80002dd4:	21470713          	addi	a4,a4,532 # 80005fe4 <ticks>
    80002dd8:	00072783          	lw	a5,0(a4)
    80002ddc:	00004517          	auipc	a0,0x4
    80002de0:	32450513          	addi	a0,a0,804 # 80007100 <tickslock>
    80002de4:	0017879b          	addiw	a5,a5,1
    80002de8:	00f72023          	sw	a5,0(a4)
    80002dec:	00001097          	auipc	ra,0x1
    80002df0:	53c080e7          	jalr	1340(ra) # 80004328 <release>
    80002df4:	f65ff06f          	j	80002d58 <kerneltrap+0x8c>
    80002df8:	00001097          	auipc	ra,0x1
    80002dfc:	098080e7          	jalr	152(ra) # 80003e90 <uartintr>
    80002e00:	fa5ff06f          	j	80002da4 <kerneltrap+0xd8>
    80002e04:	00002517          	auipc	a0,0x2
    80002e08:	4c450513          	addi	a0,a0,1220 # 800052c8 <CONSOLE_STATUS+0x2b8>
    80002e0c:	00000097          	auipc	ra,0x0
    80002e10:	720080e7          	jalr	1824(ra) # 8000352c <panic>

0000000080002e14 <clockintr>:
    80002e14:	fe010113          	addi	sp,sp,-32
    80002e18:	00813823          	sd	s0,16(sp)
    80002e1c:	00913423          	sd	s1,8(sp)
    80002e20:	00113c23          	sd	ra,24(sp)
    80002e24:	02010413          	addi	s0,sp,32
    80002e28:	00004497          	auipc	s1,0x4
    80002e2c:	2d848493          	addi	s1,s1,728 # 80007100 <tickslock>
    80002e30:	00048513          	mv	a0,s1
    80002e34:	00001097          	auipc	ra,0x1
    80002e38:	428080e7          	jalr	1064(ra) # 8000425c <acquire>
    80002e3c:	00003717          	auipc	a4,0x3
    80002e40:	1a870713          	addi	a4,a4,424 # 80005fe4 <ticks>
    80002e44:	00072783          	lw	a5,0(a4)
    80002e48:	01013403          	ld	s0,16(sp)
    80002e4c:	01813083          	ld	ra,24(sp)
    80002e50:	00048513          	mv	a0,s1
    80002e54:	0017879b          	addiw	a5,a5,1
    80002e58:	00813483          	ld	s1,8(sp)
    80002e5c:	00f72023          	sw	a5,0(a4)
    80002e60:	02010113          	addi	sp,sp,32
    80002e64:	00001317          	auipc	t1,0x1
    80002e68:	4c430067          	jr	1220(t1) # 80004328 <release>

0000000080002e6c <devintr>:
    80002e6c:	142027f3          	csrr	a5,scause
    80002e70:	00000513          	li	a0,0
    80002e74:	0007c463          	bltz	a5,80002e7c <devintr+0x10>
    80002e78:	00008067          	ret
    80002e7c:	fe010113          	addi	sp,sp,-32
    80002e80:	00813823          	sd	s0,16(sp)
    80002e84:	00113c23          	sd	ra,24(sp)
    80002e88:	00913423          	sd	s1,8(sp)
    80002e8c:	02010413          	addi	s0,sp,32
    80002e90:	0ff7f713          	andi	a4,a5,255
    80002e94:	00900693          	li	a3,9
    80002e98:	04d70c63          	beq	a4,a3,80002ef0 <devintr+0x84>
    80002e9c:	fff00713          	li	a4,-1
    80002ea0:	03f71713          	slli	a4,a4,0x3f
    80002ea4:	00170713          	addi	a4,a4,1
    80002ea8:	00e78c63          	beq	a5,a4,80002ec0 <devintr+0x54>
    80002eac:	01813083          	ld	ra,24(sp)
    80002eb0:	01013403          	ld	s0,16(sp)
    80002eb4:	00813483          	ld	s1,8(sp)
    80002eb8:	02010113          	addi	sp,sp,32
    80002ebc:	00008067          	ret
    80002ec0:	00000097          	auipc	ra,0x0
    80002ec4:	c8c080e7          	jalr	-884(ra) # 80002b4c <cpuid>
    80002ec8:	06050663          	beqz	a0,80002f34 <devintr+0xc8>
    80002ecc:	144027f3          	csrr	a5,sip
    80002ed0:	ffd7f793          	andi	a5,a5,-3
    80002ed4:	14479073          	csrw	sip,a5
    80002ed8:	01813083          	ld	ra,24(sp)
    80002edc:	01013403          	ld	s0,16(sp)
    80002ee0:	00813483          	ld	s1,8(sp)
    80002ee4:	00200513          	li	a0,2
    80002ee8:	02010113          	addi	sp,sp,32
    80002eec:	00008067          	ret
    80002ef0:	00000097          	auipc	ra,0x0
    80002ef4:	254080e7          	jalr	596(ra) # 80003144 <plic_claim>
    80002ef8:	00a00793          	li	a5,10
    80002efc:	00050493          	mv	s1,a0
    80002f00:	06f50663          	beq	a0,a5,80002f6c <devintr+0x100>
    80002f04:	00100513          	li	a0,1
    80002f08:	fa0482e3          	beqz	s1,80002eac <devintr+0x40>
    80002f0c:	00048593          	mv	a1,s1
    80002f10:	00002517          	auipc	a0,0x2
    80002f14:	3d850513          	addi	a0,a0,984 # 800052e8 <CONSOLE_STATUS+0x2d8>
    80002f18:	00000097          	auipc	ra,0x0
    80002f1c:	670080e7          	jalr	1648(ra) # 80003588 <__printf>
    80002f20:	00048513          	mv	a0,s1
    80002f24:	00000097          	auipc	ra,0x0
    80002f28:	258080e7          	jalr	600(ra) # 8000317c <plic_complete>
    80002f2c:	00100513          	li	a0,1
    80002f30:	f7dff06f          	j	80002eac <devintr+0x40>
    80002f34:	00004517          	auipc	a0,0x4
    80002f38:	1cc50513          	addi	a0,a0,460 # 80007100 <tickslock>
    80002f3c:	00001097          	auipc	ra,0x1
    80002f40:	320080e7          	jalr	800(ra) # 8000425c <acquire>
    80002f44:	00003717          	auipc	a4,0x3
    80002f48:	0a070713          	addi	a4,a4,160 # 80005fe4 <ticks>
    80002f4c:	00072783          	lw	a5,0(a4)
    80002f50:	00004517          	auipc	a0,0x4
    80002f54:	1b050513          	addi	a0,a0,432 # 80007100 <tickslock>
    80002f58:	0017879b          	addiw	a5,a5,1
    80002f5c:	00f72023          	sw	a5,0(a4)
    80002f60:	00001097          	auipc	ra,0x1
    80002f64:	3c8080e7          	jalr	968(ra) # 80004328 <release>
    80002f68:	f65ff06f          	j	80002ecc <devintr+0x60>
    80002f6c:	00001097          	auipc	ra,0x1
    80002f70:	f24080e7          	jalr	-220(ra) # 80003e90 <uartintr>
    80002f74:	fadff06f          	j	80002f20 <devintr+0xb4>
	...

0000000080002f80 <kernelvec>:
    80002f80:	f0010113          	addi	sp,sp,-256
    80002f84:	00113023          	sd	ra,0(sp)
    80002f88:	00213423          	sd	sp,8(sp)
    80002f8c:	00313823          	sd	gp,16(sp)
    80002f90:	00413c23          	sd	tp,24(sp)
    80002f94:	02513023          	sd	t0,32(sp)
    80002f98:	02613423          	sd	t1,40(sp)
    80002f9c:	02713823          	sd	t2,48(sp)
    80002fa0:	02813c23          	sd	s0,56(sp)
    80002fa4:	04913023          	sd	s1,64(sp)
    80002fa8:	04a13423          	sd	a0,72(sp)
    80002fac:	04b13823          	sd	a1,80(sp)
    80002fb0:	04c13c23          	sd	a2,88(sp)
    80002fb4:	06d13023          	sd	a3,96(sp)
    80002fb8:	06e13423          	sd	a4,104(sp)
    80002fbc:	06f13823          	sd	a5,112(sp)
    80002fc0:	07013c23          	sd	a6,120(sp)
    80002fc4:	09113023          	sd	a7,128(sp)
    80002fc8:	09213423          	sd	s2,136(sp)
    80002fcc:	09313823          	sd	s3,144(sp)
    80002fd0:	09413c23          	sd	s4,152(sp)
    80002fd4:	0b513023          	sd	s5,160(sp)
    80002fd8:	0b613423          	sd	s6,168(sp)
    80002fdc:	0b713823          	sd	s7,176(sp)
    80002fe0:	0b813c23          	sd	s8,184(sp)
    80002fe4:	0d913023          	sd	s9,192(sp)
    80002fe8:	0da13423          	sd	s10,200(sp)
    80002fec:	0db13823          	sd	s11,208(sp)
    80002ff0:	0dc13c23          	sd	t3,216(sp)
    80002ff4:	0fd13023          	sd	t4,224(sp)
    80002ff8:	0fe13423          	sd	t5,232(sp)
    80002ffc:	0ff13823          	sd	t6,240(sp)
    80003000:	ccdff0ef          	jal	ra,80002ccc <kerneltrap>
    80003004:	00013083          	ld	ra,0(sp)
    80003008:	00813103          	ld	sp,8(sp)
    8000300c:	01013183          	ld	gp,16(sp)
    80003010:	02013283          	ld	t0,32(sp)
    80003014:	02813303          	ld	t1,40(sp)
    80003018:	03013383          	ld	t2,48(sp)
    8000301c:	03813403          	ld	s0,56(sp)
    80003020:	04013483          	ld	s1,64(sp)
    80003024:	04813503          	ld	a0,72(sp)
    80003028:	05013583          	ld	a1,80(sp)
    8000302c:	05813603          	ld	a2,88(sp)
    80003030:	06013683          	ld	a3,96(sp)
    80003034:	06813703          	ld	a4,104(sp)
    80003038:	07013783          	ld	a5,112(sp)
    8000303c:	07813803          	ld	a6,120(sp)
    80003040:	08013883          	ld	a7,128(sp)
    80003044:	08813903          	ld	s2,136(sp)
    80003048:	09013983          	ld	s3,144(sp)
    8000304c:	09813a03          	ld	s4,152(sp)
    80003050:	0a013a83          	ld	s5,160(sp)
    80003054:	0a813b03          	ld	s6,168(sp)
    80003058:	0b013b83          	ld	s7,176(sp)
    8000305c:	0b813c03          	ld	s8,184(sp)
    80003060:	0c013c83          	ld	s9,192(sp)
    80003064:	0c813d03          	ld	s10,200(sp)
    80003068:	0d013d83          	ld	s11,208(sp)
    8000306c:	0d813e03          	ld	t3,216(sp)
    80003070:	0e013e83          	ld	t4,224(sp)
    80003074:	0e813f03          	ld	t5,232(sp)
    80003078:	0f013f83          	ld	t6,240(sp)
    8000307c:	10010113          	addi	sp,sp,256
    80003080:	10200073          	sret
    80003084:	00000013          	nop
    80003088:	00000013          	nop
    8000308c:	00000013          	nop

0000000080003090 <timervec>:
    80003090:	34051573          	csrrw	a0,mscratch,a0
    80003094:	00b53023          	sd	a1,0(a0)
    80003098:	00c53423          	sd	a2,8(a0)
    8000309c:	00d53823          	sd	a3,16(a0)
    800030a0:	01853583          	ld	a1,24(a0)
    800030a4:	02053603          	ld	a2,32(a0)
    800030a8:	0005b683          	ld	a3,0(a1)
    800030ac:	00c686b3          	add	a3,a3,a2
    800030b0:	00d5b023          	sd	a3,0(a1)
    800030b4:	00200593          	li	a1,2
    800030b8:	14459073          	csrw	sip,a1
    800030bc:	01053683          	ld	a3,16(a0)
    800030c0:	00853603          	ld	a2,8(a0)
    800030c4:	00053583          	ld	a1,0(a0)
    800030c8:	34051573          	csrrw	a0,mscratch,a0
    800030cc:	30200073          	mret

00000000800030d0 <plicinit>:
    800030d0:	ff010113          	addi	sp,sp,-16
    800030d4:	00813423          	sd	s0,8(sp)
    800030d8:	01010413          	addi	s0,sp,16
    800030dc:	00813403          	ld	s0,8(sp)
    800030e0:	0c0007b7          	lui	a5,0xc000
    800030e4:	00100713          	li	a4,1
    800030e8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    800030ec:	00e7a223          	sw	a4,4(a5)
    800030f0:	01010113          	addi	sp,sp,16
    800030f4:	00008067          	ret

00000000800030f8 <plicinithart>:
    800030f8:	ff010113          	addi	sp,sp,-16
    800030fc:	00813023          	sd	s0,0(sp)
    80003100:	00113423          	sd	ra,8(sp)
    80003104:	01010413          	addi	s0,sp,16
    80003108:	00000097          	auipc	ra,0x0
    8000310c:	a44080e7          	jalr	-1468(ra) # 80002b4c <cpuid>
    80003110:	0085171b          	slliw	a4,a0,0x8
    80003114:	0c0027b7          	lui	a5,0xc002
    80003118:	00e787b3          	add	a5,a5,a4
    8000311c:	40200713          	li	a4,1026
    80003120:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80003124:	00813083          	ld	ra,8(sp)
    80003128:	00013403          	ld	s0,0(sp)
    8000312c:	00d5151b          	slliw	a0,a0,0xd
    80003130:	0c2017b7          	lui	a5,0xc201
    80003134:	00a78533          	add	a0,a5,a0
    80003138:	00052023          	sw	zero,0(a0)
    8000313c:	01010113          	addi	sp,sp,16
    80003140:	00008067          	ret

0000000080003144 <plic_claim>:
    80003144:	ff010113          	addi	sp,sp,-16
    80003148:	00813023          	sd	s0,0(sp)
    8000314c:	00113423          	sd	ra,8(sp)
    80003150:	01010413          	addi	s0,sp,16
    80003154:	00000097          	auipc	ra,0x0
    80003158:	9f8080e7          	jalr	-1544(ra) # 80002b4c <cpuid>
    8000315c:	00813083          	ld	ra,8(sp)
    80003160:	00013403          	ld	s0,0(sp)
    80003164:	00d5151b          	slliw	a0,a0,0xd
    80003168:	0c2017b7          	lui	a5,0xc201
    8000316c:	00a78533          	add	a0,a5,a0
    80003170:	00452503          	lw	a0,4(a0)
    80003174:	01010113          	addi	sp,sp,16
    80003178:	00008067          	ret

000000008000317c <plic_complete>:
    8000317c:	fe010113          	addi	sp,sp,-32
    80003180:	00813823          	sd	s0,16(sp)
    80003184:	00913423          	sd	s1,8(sp)
    80003188:	00113c23          	sd	ra,24(sp)
    8000318c:	02010413          	addi	s0,sp,32
    80003190:	00050493          	mv	s1,a0
    80003194:	00000097          	auipc	ra,0x0
    80003198:	9b8080e7          	jalr	-1608(ra) # 80002b4c <cpuid>
    8000319c:	01813083          	ld	ra,24(sp)
    800031a0:	01013403          	ld	s0,16(sp)
    800031a4:	00d5179b          	slliw	a5,a0,0xd
    800031a8:	0c201737          	lui	a4,0xc201
    800031ac:	00f707b3          	add	a5,a4,a5
    800031b0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    800031b4:	00813483          	ld	s1,8(sp)
    800031b8:	02010113          	addi	sp,sp,32
    800031bc:	00008067          	ret

00000000800031c0 <consolewrite>:
    800031c0:	fb010113          	addi	sp,sp,-80
    800031c4:	04813023          	sd	s0,64(sp)
    800031c8:	04113423          	sd	ra,72(sp)
    800031cc:	02913c23          	sd	s1,56(sp)
    800031d0:	03213823          	sd	s2,48(sp)
    800031d4:	03313423          	sd	s3,40(sp)
    800031d8:	03413023          	sd	s4,32(sp)
    800031dc:	01513c23          	sd	s5,24(sp)
    800031e0:	05010413          	addi	s0,sp,80
    800031e4:	06c05c63          	blez	a2,8000325c <consolewrite+0x9c>
    800031e8:	00060993          	mv	s3,a2
    800031ec:	00050a13          	mv	s4,a0
    800031f0:	00058493          	mv	s1,a1
    800031f4:	00000913          	li	s2,0
    800031f8:	fff00a93          	li	s5,-1
    800031fc:	01c0006f          	j	80003218 <consolewrite+0x58>
    80003200:	fbf44503          	lbu	a0,-65(s0)
    80003204:	0019091b          	addiw	s2,s2,1
    80003208:	00148493          	addi	s1,s1,1
    8000320c:	00001097          	auipc	ra,0x1
    80003210:	a9c080e7          	jalr	-1380(ra) # 80003ca8 <uartputc>
    80003214:	03298063          	beq	s3,s2,80003234 <consolewrite+0x74>
    80003218:	00048613          	mv	a2,s1
    8000321c:	00100693          	li	a3,1
    80003220:	000a0593          	mv	a1,s4
    80003224:	fbf40513          	addi	a0,s0,-65
    80003228:	00000097          	auipc	ra,0x0
    8000322c:	9dc080e7          	jalr	-1572(ra) # 80002c04 <either_copyin>
    80003230:	fd5518e3          	bne	a0,s5,80003200 <consolewrite+0x40>
    80003234:	04813083          	ld	ra,72(sp)
    80003238:	04013403          	ld	s0,64(sp)
    8000323c:	03813483          	ld	s1,56(sp)
    80003240:	02813983          	ld	s3,40(sp)
    80003244:	02013a03          	ld	s4,32(sp)
    80003248:	01813a83          	ld	s5,24(sp)
    8000324c:	00090513          	mv	a0,s2
    80003250:	03013903          	ld	s2,48(sp)
    80003254:	05010113          	addi	sp,sp,80
    80003258:	00008067          	ret
    8000325c:	00000913          	li	s2,0
    80003260:	fd5ff06f          	j	80003234 <consolewrite+0x74>

0000000080003264 <consoleread>:
    80003264:	f9010113          	addi	sp,sp,-112
    80003268:	06813023          	sd	s0,96(sp)
    8000326c:	04913c23          	sd	s1,88(sp)
    80003270:	05213823          	sd	s2,80(sp)
    80003274:	05313423          	sd	s3,72(sp)
    80003278:	05413023          	sd	s4,64(sp)
    8000327c:	03513c23          	sd	s5,56(sp)
    80003280:	03613823          	sd	s6,48(sp)
    80003284:	03713423          	sd	s7,40(sp)
    80003288:	03813023          	sd	s8,32(sp)
    8000328c:	06113423          	sd	ra,104(sp)
    80003290:	01913c23          	sd	s9,24(sp)
    80003294:	07010413          	addi	s0,sp,112
    80003298:	00060b93          	mv	s7,a2
    8000329c:	00050913          	mv	s2,a0
    800032a0:	00058c13          	mv	s8,a1
    800032a4:	00060b1b          	sext.w	s6,a2
    800032a8:	00004497          	auipc	s1,0x4
    800032ac:	e8048493          	addi	s1,s1,-384 # 80007128 <cons>
    800032b0:	00400993          	li	s3,4
    800032b4:	fff00a13          	li	s4,-1
    800032b8:	00a00a93          	li	s5,10
    800032bc:	05705e63          	blez	s7,80003318 <consoleread+0xb4>
    800032c0:	09c4a703          	lw	a4,156(s1)
    800032c4:	0984a783          	lw	a5,152(s1)
    800032c8:	0007071b          	sext.w	a4,a4
    800032cc:	08e78463          	beq	a5,a4,80003354 <consoleread+0xf0>
    800032d0:	07f7f713          	andi	a4,a5,127
    800032d4:	00e48733          	add	a4,s1,a4
    800032d8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    800032dc:	0017869b          	addiw	a3,a5,1
    800032e0:	08d4ac23          	sw	a3,152(s1)
    800032e4:	00070c9b          	sext.w	s9,a4
    800032e8:	0b370663          	beq	a4,s3,80003394 <consoleread+0x130>
    800032ec:	00100693          	li	a3,1
    800032f0:	f9f40613          	addi	a2,s0,-97
    800032f4:	000c0593          	mv	a1,s8
    800032f8:	00090513          	mv	a0,s2
    800032fc:	f8e40fa3          	sb	a4,-97(s0)
    80003300:	00000097          	auipc	ra,0x0
    80003304:	8b8080e7          	jalr	-1864(ra) # 80002bb8 <either_copyout>
    80003308:	01450863          	beq	a0,s4,80003318 <consoleread+0xb4>
    8000330c:	001c0c13          	addi	s8,s8,1
    80003310:	fffb8b9b          	addiw	s7,s7,-1
    80003314:	fb5c94e3          	bne	s9,s5,800032bc <consoleread+0x58>
    80003318:	000b851b          	sext.w	a0,s7
    8000331c:	06813083          	ld	ra,104(sp)
    80003320:	06013403          	ld	s0,96(sp)
    80003324:	05813483          	ld	s1,88(sp)
    80003328:	05013903          	ld	s2,80(sp)
    8000332c:	04813983          	ld	s3,72(sp)
    80003330:	04013a03          	ld	s4,64(sp)
    80003334:	03813a83          	ld	s5,56(sp)
    80003338:	02813b83          	ld	s7,40(sp)
    8000333c:	02013c03          	ld	s8,32(sp)
    80003340:	01813c83          	ld	s9,24(sp)
    80003344:	40ab053b          	subw	a0,s6,a0
    80003348:	03013b03          	ld	s6,48(sp)
    8000334c:	07010113          	addi	sp,sp,112
    80003350:	00008067          	ret
    80003354:	00001097          	auipc	ra,0x1
    80003358:	1d8080e7          	jalr	472(ra) # 8000452c <push_on>
    8000335c:	0984a703          	lw	a4,152(s1)
    80003360:	09c4a783          	lw	a5,156(s1)
    80003364:	0007879b          	sext.w	a5,a5
    80003368:	fef70ce3          	beq	a4,a5,80003360 <consoleread+0xfc>
    8000336c:	00001097          	auipc	ra,0x1
    80003370:	234080e7          	jalr	564(ra) # 800045a0 <pop_on>
    80003374:	0984a783          	lw	a5,152(s1)
    80003378:	07f7f713          	andi	a4,a5,127
    8000337c:	00e48733          	add	a4,s1,a4
    80003380:	01874703          	lbu	a4,24(a4)
    80003384:	0017869b          	addiw	a3,a5,1
    80003388:	08d4ac23          	sw	a3,152(s1)
    8000338c:	00070c9b          	sext.w	s9,a4
    80003390:	f5371ee3          	bne	a4,s3,800032ec <consoleread+0x88>
    80003394:	000b851b          	sext.w	a0,s7
    80003398:	f96bf2e3          	bgeu	s7,s6,8000331c <consoleread+0xb8>
    8000339c:	08f4ac23          	sw	a5,152(s1)
    800033a0:	f7dff06f          	j	8000331c <consoleread+0xb8>

00000000800033a4 <consputc>:
    800033a4:	10000793          	li	a5,256
    800033a8:	00f50663          	beq	a0,a5,800033b4 <consputc+0x10>
    800033ac:	00001317          	auipc	t1,0x1
    800033b0:	9f430067          	jr	-1548(t1) # 80003da0 <uartputc_sync>
    800033b4:	ff010113          	addi	sp,sp,-16
    800033b8:	00113423          	sd	ra,8(sp)
    800033bc:	00813023          	sd	s0,0(sp)
    800033c0:	01010413          	addi	s0,sp,16
    800033c4:	00800513          	li	a0,8
    800033c8:	00001097          	auipc	ra,0x1
    800033cc:	9d8080e7          	jalr	-1576(ra) # 80003da0 <uartputc_sync>
    800033d0:	02000513          	li	a0,32
    800033d4:	00001097          	auipc	ra,0x1
    800033d8:	9cc080e7          	jalr	-1588(ra) # 80003da0 <uartputc_sync>
    800033dc:	00013403          	ld	s0,0(sp)
    800033e0:	00813083          	ld	ra,8(sp)
    800033e4:	00800513          	li	a0,8
    800033e8:	01010113          	addi	sp,sp,16
    800033ec:	00001317          	auipc	t1,0x1
    800033f0:	9b430067          	jr	-1612(t1) # 80003da0 <uartputc_sync>

00000000800033f4 <consoleintr>:
    800033f4:	fe010113          	addi	sp,sp,-32
    800033f8:	00813823          	sd	s0,16(sp)
    800033fc:	00913423          	sd	s1,8(sp)
    80003400:	01213023          	sd	s2,0(sp)
    80003404:	00113c23          	sd	ra,24(sp)
    80003408:	02010413          	addi	s0,sp,32
    8000340c:	00004917          	auipc	s2,0x4
    80003410:	d1c90913          	addi	s2,s2,-740 # 80007128 <cons>
    80003414:	00050493          	mv	s1,a0
    80003418:	00090513          	mv	a0,s2
    8000341c:	00001097          	auipc	ra,0x1
    80003420:	e40080e7          	jalr	-448(ra) # 8000425c <acquire>
    80003424:	02048c63          	beqz	s1,8000345c <consoleintr+0x68>
    80003428:	0a092783          	lw	a5,160(s2)
    8000342c:	09892703          	lw	a4,152(s2)
    80003430:	07f00693          	li	a3,127
    80003434:	40e7873b          	subw	a4,a5,a4
    80003438:	02e6e263          	bltu	a3,a4,8000345c <consoleintr+0x68>
    8000343c:	00d00713          	li	a4,13
    80003440:	04e48063          	beq	s1,a4,80003480 <consoleintr+0x8c>
    80003444:	07f7f713          	andi	a4,a5,127
    80003448:	00e90733          	add	a4,s2,a4
    8000344c:	0017879b          	addiw	a5,a5,1
    80003450:	0af92023          	sw	a5,160(s2)
    80003454:	00970c23          	sb	s1,24(a4)
    80003458:	08f92e23          	sw	a5,156(s2)
    8000345c:	01013403          	ld	s0,16(sp)
    80003460:	01813083          	ld	ra,24(sp)
    80003464:	00813483          	ld	s1,8(sp)
    80003468:	00013903          	ld	s2,0(sp)
    8000346c:	00004517          	auipc	a0,0x4
    80003470:	cbc50513          	addi	a0,a0,-836 # 80007128 <cons>
    80003474:	02010113          	addi	sp,sp,32
    80003478:	00001317          	auipc	t1,0x1
    8000347c:	eb030067          	jr	-336(t1) # 80004328 <release>
    80003480:	00a00493          	li	s1,10
    80003484:	fc1ff06f          	j	80003444 <consoleintr+0x50>

0000000080003488 <consoleinit>:
    80003488:	fe010113          	addi	sp,sp,-32
    8000348c:	00113c23          	sd	ra,24(sp)
    80003490:	00813823          	sd	s0,16(sp)
    80003494:	00913423          	sd	s1,8(sp)
    80003498:	02010413          	addi	s0,sp,32
    8000349c:	00004497          	auipc	s1,0x4
    800034a0:	c8c48493          	addi	s1,s1,-884 # 80007128 <cons>
    800034a4:	00048513          	mv	a0,s1
    800034a8:	00002597          	auipc	a1,0x2
    800034ac:	e9858593          	addi	a1,a1,-360 # 80005340 <CONSOLE_STATUS+0x330>
    800034b0:	00001097          	auipc	ra,0x1
    800034b4:	d88080e7          	jalr	-632(ra) # 80004238 <initlock>
    800034b8:	00000097          	auipc	ra,0x0
    800034bc:	7ac080e7          	jalr	1964(ra) # 80003c64 <uartinit>
    800034c0:	01813083          	ld	ra,24(sp)
    800034c4:	01013403          	ld	s0,16(sp)
    800034c8:	00000797          	auipc	a5,0x0
    800034cc:	d9c78793          	addi	a5,a5,-612 # 80003264 <consoleread>
    800034d0:	0af4bc23          	sd	a5,184(s1)
    800034d4:	00000797          	auipc	a5,0x0
    800034d8:	cec78793          	addi	a5,a5,-788 # 800031c0 <consolewrite>
    800034dc:	0cf4b023          	sd	a5,192(s1)
    800034e0:	00813483          	ld	s1,8(sp)
    800034e4:	02010113          	addi	sp,sp,32
    800034e8:	00008067          	ret

00000000800034ec <console_read>:
    800034ec:	ff010113          	addi	sp,sp,-16
    800034f0:	00813423          	sd	s0,8(sp)
    800034f4:	01010413          	addi	s0,sp,16
    800034f8:	00813403          	ld	s0,8(sp)
    800034fc:	00004317          	auipc	t1,0x4
    80003500:	ce433303          	ld	t1,-796(t1) # 800071e0 <devsw+0x10>
    80003504:	01010113          	addi	sp,sp,16
    80003508:	00030067          	jr	t1

000000008000350c <console_write>:
    8000350c:	ff010113          	addi	sp,sp,-16
    80003510:	00813423          	sd	s0,8(sp)
    80003514:	01010413          	addi	s0,sp,16
    80003518:	00813403          	ld	s0,8(sp)
    8000351c:	00004317          	auipc	t1,0x4
    80003520:	ccc33303          	ld	t1,-820(t1) # 800071e8 <devsw+0x18>
    80003524:	01010113          	addi	sp,sp,16
    80003528:	00030067          	jr	t1

000000008000352c <panic>:
    8000352c:	fe010113          	addi	sp,sp,-32
    80003530:	00113c23          	sd	ra,24(sp)
    80003534:	00813823          	sd	s0,16(sp)
    80003538:	00913423          	sd	s1,8(sp)
    8000353c:	02010413          	addi	s0,sp,32
    80003540:	00050493          	mv	s1,a0
    80003544:	00002517          	auipc	a0,0x2
    80003548:	e0450513          	addi	a0,a0,-508 # 80005348 <CONSOLE_STATUS+0x338>
    8000354c:	00004797          	auipc	a5,0x4
    80003550:	d207ae23          	sw	zero,-708(a5) # 80007288 <pr+0x18>
    80003554:	00000097          	auipc	ra,0x0
    80003558:	034080e7          	jalr	52(ra) # 80003588 <__printf>
    8000355c:	00048513          	mv	a0,s1
    80003560:	00000097          	auipc	ra,0x0
    80003564:	028080e7          	jalr	40(ra) # 80003588 <__printf>
    80003568:	00002517          	auipc	a0,0x2
    8000356c:	dc050513          	addi	a0,a0,-576 # 80005328 <CONSOLE_STATUS+0x318>
    80003570:	00000097          	auipc	ra,0x0
    80003574:	018080e7          	jalr	24(ra) # 80003588 <__printf>
    80003578:	00100793          	li	a5,1
    8000357c:	00003717          	auipc	a4,0x3
    80003580:	a6f72623          	sw	a5,-1428(a4) # 80005fe8 <panicked>
    80003584:	0000006f          	j	80003584 <panic+0x58>

0000000080003588 <__printf>:
    80003588:	f3010113          	addi	sp,sp,-208
    8000358c:	08813023          	sd	s0,128(sp)
    80003590:	07313423          	sd	s3,104(sp)
    80003594:	09010413          	addi	s0,sp,144
    80003598:	05813023          	sd	s8,64(sp)
    8000359c:	08113423          	sd	ra,136(sp)
    800035a0:	06913c23          	sd	s1,120(sp)
    800035a4:	07213823          	sd	s2,112(sp)
    800035a8:	07413023          	sd	s4,96(sp)
    800035ac:	05513c23          	sd	s5,88(sp)
    800035b0:	05613823          	sd	s6,80(sp)
    800035b4:	05713423          	sd	s7,72(sp)
    800035b8:	03913c23          	sd	s9,56(sp)
    800035bc:	03a13823          	sd	s10,48(sp)
    800035c0:	03b13423          	sd	s11,40(sp)
    800035c4:	00004317          	auipc	t1,0x4
    800035c8:	cac30313          	addi	t1,t1,-852 # 80007270 <pr>
    800035cc:	01832c03          	lw	s8,24(t1)
    800035d0:	00b43423          	sd	a1,8(s0)
    800035d4:	00c43823          	sd	a2,16(s0)
    800035d8:	00d43c23          	sd	a3,24(s0)
    800035dc:	02e43023          	sd	a4,32(s0)
    800035e0:	02f43423          	sd	a5,40(s0)
    800035e4:	03043823          	sd	a6,48(s0)
    800035e8:	03143c23          	sd	a7,56(s0)
    800035ec:	00050993          	mv	s3,a0
    800035f0:	4a0c1663          	bnez	s8,80003a9c <__printf+0x514>
    800035f4:	60098c63          	beqz	s3,80003c0c <__printf+0x684>
    800035f8:	0009c503          	lbu	a0,0(s3)
    800035fc:	00840793          	addi	a5,s0,8
    80003600:	f6f43c23          	sd	a5,-136(s0)
    80003604:	00000493          	li	s1,0
    80003608:	22050063          	beqz	a0,80003828 <__printf+0x2a0>
    8000360c:	00002a37          	lui	s4,0x2
    80003610:	00018ab7          	lui	s5,0x18
    80003614:	000f4b37          	lui	s6,0xf4
    80003618:	00989bb7          	lui	s7,0x989
    8000361c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80003620:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80003624:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80003628:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    8000362c:	00148c9b          	addiw	s9,s1,1
    80003630:	02500793          	li	a5,37
    80003634:	01998933          	add	s2,s3,s9
    80003638:	38f51263          	bne	a0,a5,800039bc <__printf+0x434>
    8000363c:	00094783          	lbu	a5,0(s2)
    80003640:	00078c9b          	sext.w	s9,a5
    80003644:	1e078263          	beqz	a5,80003828 <__printf+0x2a0>
    80003648:	0024849b          	addiw	s1,s1,2
    8000364c:	07000713          	li	a4,112
    80003650:	00998933          	add	s2,s3,s1
    80003654:	38e78a63          	beq	a5,a4,800039e8 <__printf+0x460>
    80003658:	20f76863          	bltu	a4,a5,80003868 <__printf+0x2e0>
    8000365c:	42a78863          	beq	a5,a0,80003a8c <__printf+0x504>
    80003660:	06400713          	li	a4,100
    80003664:	40e79663          	bne	a5,a4,80003a70 <__printf+0x4e8>
    80003668:	f7843783          	ld	a5,-136(s0)
    8000366c:	0007a603          	lw	a2,0(a5)
    80003670:	00878793          	addi	a5,a5,8
    80003674:	f6f43c23          	sd	a5,-136(s0)
    80003678:	42064a63          	bltz	a2,80003aac <__printf+0x524>
    8000367c:	00a00713          	li	a4,10
    80003680:	02e677bb          	remuw	a5,a2,a4
    80003684:	00002d97          	auipc	s11,0x2
    80003688:	cecd8d93          	addi	s11,s11,-788 # 80005370 <digits>
    8000368c:	00900593          	li	a1,9
    80003690:	0006051b          	sext.w	a0,a2
    80003694:	00000c93          	li	s9,0
    80003698:	02079793          	slli	a5,a5,0x20
    8000369c:	0207d793          	srli	a5,a5,0x20
    800036a0:	00fd87b3          	add	a5,s11,a5
    800036a4:	0007c783          	lbu	a5,0(a5)
    800036a8:	02e656bb          	divuw	a3,a2,a4
    800036ac:	f8f40023          	sb	a5,-128(s0)
    800036b0:	14c5d863          	bge	a1,a2,80003800 <__printf+0x278>
    800036b4:	06300593          	li	a1,99
    800036b8:	00100c93          	li	s9,1
    800036bc:	02e6f7bb          	remuw	a5,a3,a4
    800036c0:	02079793          	slli	a5,a5,0x20
    800036c4:	0207d793          	srli	a5,a5,0x20
    800036c8:	00fd87b3          	add	a5,s11,a5
    800036cc:	0007c783          	lbu	a5,0(a5)
    800036d0:	02e6d73b          	divuw	a4,a3,a4
    800036d4:	f8f400a3          	sb	a5,-127(s0)
    800036d8:	12a5f463          	bgeu	a1,a0,80003800 <__printf+0x278>
    800036dc:	00a00693          	li	a3,10
    800036e0:	00900593          	li	a1,9
    800036e4:	02d777bb          	remuw	a5,a4,a3
    800036e8:	02079793          	slli	a5,a5,0x20
    800036ec:	0207d793          	srli	a5,a5,0x20
    800036f0:	00fd87b3          	add	a5,s11,a5
    800036f4:	0007c503          	lbu	a0,0(a5)
    800036f8:	02d757bb          	divuw	a5,a4,a3
    800036fc:	f8a40123          	sb	a0,-126(s0)
    80003700:	48e5f263          	bgeu	a1,a4,80003b84 <__printf+0x5fc>
    80003704:	06300513          	li	a0,99
    80003708:	02d7f5bb          	remuw	a1,a5,a3
    8000370c:	02059593          	slli	a1,a1,0x20
    80003710:	0205d593          	srli	a1,a1,0x20
    80003714:	00bd85b3          	add	a1,s11,a1
    80003718:	0005c583          	lbu	a1,0(a1)
    8000371c:	02d7d7bb          	divuw	a5,a5,a3
    80003720:	f8b401a3          	sb	a1,-125(s0)
    80003724:	48e57263          	bgeu	a0,a4,80003ba8 <__printf+0x620>
    80003728:	3e700513          	li	a0,999
    8000372c:	02d7f5bb          	remuw	a1,a5,a3
    80003730:	02059593          	slli	a1,a1,0x20
    80003734:	0205d593          	srli	a1,a1,0x20
    80003738:	00bd85b3          	add	a1,s11,a1
    8000373c:	0005c583          	lbu	a1,0(a1)
    80003740:	02d7d7bb          	divuw	a5,a5,a3
    80003744:	f8b40223          	sb	a1,-124(s0)
    80003748:	46e57663          	bgeu	a0,a4,80003bb4 <__printf+0x62c>
    8000374c:	02d7f5bb          	remuw	a1,a5,a3
    80003750:	02059593          	slli	a1,a1,0x20
    80003754:	0205d593          	srli	a1,a1,0x20
    80003758:	00bd85b3          	add	a1,s11,a1
    8000375c:	0005c583          	lbu	a1,0(a1)
    80003760:	02d7d7bb          	divuw	a5,a5,a3
    80003764:	f8b402a3          	sb	a1,-123(s0)
    80003768:	46ea7863          	bgeu	s4,a4,80003bd8 <__printf+0x650>
    8000376c:	02d7f5bb          	remuw	a1,a5,a3
    80003770:	02059593          	slli	a1,a1,0x20
    80003774:	0205d593          	srli	a1,a1,0x20
    80003778:	00bd85b3          	add	a1,s11,a1
    8000377c:	0005c583          	lbu	a1,0(a1)
    80003780:	02d7d7bb          	divuw	a5,a5,a3
    80003784:	f8b40323          	sb	a1,-122(s0)
    80003788:	3eeaf863          	bgeu	s5,a4,80003b78 <__printf+0x5f0>
    8000378c:	02d7f5bb          	remuw	a1,a5,a3
    80003790:	02059593          	slli	a1,a1,0x20
    80003794:	0205d593          	srli	a1,a1,0x20
    80003798:	00bd85b3          	add	a1,s11,a1
    8000379c:	0005c583          	lbu	a1,0(a1)
    800037a0:	02d7d7bb          	divuw	a5,a5,a3
    800037a4:	f8b403a3          	sb	a1,-121(s0)
    800037a8:	42eb7e63          	bgeu	s6,a4,80003be4 <__printf+0x65c>
    800037ac:	02d7f5bb          	remuw	a1,a5,a3
    800037b0:	02059593          	slli	a1,a1,0x20
    800037b4:	0205d593          	srli	a1,a1,0x20
    800037b8:	00bd85b3          	add	a1,s11,a1
    800037bc:	0005c583          	lbu	a1,0(a1)
    800037c0:	02d7d7bb          	divuw	a5,a5,a3
    800037c4:	f8b40423          	sb	a1,-120(s0)
    800037c8:	42ebfc63          	bgeu	s7,a4,80003c00 <__printf+0x678>
    800037cc:	02079793          	slli	a5,a5,0x20
    800037d0:	0207d793          	srli	a5,a5,0x20
    800037d4:	00fd8db3          	add	s11,s11,a5
    800037d8:	000dc703          	lbu	a4,0(s11)
    800037dc:	00a00793          	li	a5,10
    800037e0:	00900c93          	li	s9,9
    800037e4:	f8e404a3          	sb	a4,-119(s0)
    800037e8:	00065c63          	bgez	a2,80003800 <__printf+0x278>
    800037ec:	f9040713          	addi	a4,s0,-112
    800037f0:	00f70733          	add	a4,a4,a5
    800037f4:	02d00693          	li	a3,45
    800037f8:	fed70823          	sb	a3,-16(a4)
    800037fc:	00078c93          	mv	s9,a5
    80003800:	f8040793          	addi	a5,s0,-128
    80003804:	01978cb3          	add	s9,a5,s9
    80003808:	f7f40d13          	addi	s10,s0,-129
    8000380c:	000cc503          	lbu	a0,0(s9)
    80003810:	fffc8c93          	addi	s9,s9,-1
    80003814:	00000097          	auipc	ra,0x0
    80003818:	b90080e7          	jalr	-1136(ra) # 800033a4 <consputc>
    8000381c:	ffac98e3          	bne	s9,s10,8000380c <__printf+0x284>
    80003820:	00094503          	lbu	a0,0(s2)
    80003824:	e00514e3          	bnez	a0,8000362c <__printf+0xa4>
    80003828:	1a0c1663          	bnez	s8,800039d4 <__printf+0x44c>
    8000382c:	08813083          	ld	ra,136(sp)
    80003830:	08013403          	ld	s0,128(sp)
    80003834:	07813483          	ld	s1,120(sp)
    80003838:	07013903          	ld	s2,112(sp)
    8000383c:	06813983          	ld	s3,104(sp)
    80003840:	06013a03          	ld	s4,96(sp)
    80003844:	05813a83          	ld	s5,88(sp)
    80003848:	05013b03          	ld	s6,80(sp)
    8000384c:	04813b83          	ld	s7,72(sp)
    80003850:	04013c03          	ld	s8,64(sp)
    80003854:	03813c83          	ld	s9,56(sp)
    80003858:	03013d03          	ld	s10,48(sp)
    8000385c:	02813d83          	ld	s11,40(sp)
    80003860:	0d010113          	addi	sp,sp,208
    80003864:	00008067          	ret
    80003868:	07300713          	li	a4,115
    8000386c:	1ce78a63          	beq	a5,a4,80003a40 <__printf+0x4b8>
    80003870:	07800713          	li	a4,120
    80003874:	1ee79e63          	bne	a5,a4,80003a70 <__printf+0x4e8>
    80003878:	f7843783          	ld	a5,-136(s0)
    8000387c:	0007a703          	lw	a4,0(a5)
    80003880:	00878793          	addi	a5,a5,8
    80003884:	f6f43c23          	sd	a5,-136(s0)
    80003888:	28074263          	bltz	a4,80003b0c <__printf+0x584>
    8000388c:	00002d97          	auipc	s11,0x2
    80003890:	ae4d8d93          	addi	s11,s11,-1308 # 80005370 <digits>
    80003894:	00f77793          	andi	a5,a4,15
    80003898:	00fd87b3          	add	a5,s11,a5
    8000389c:	0007c683          	lbu	a3,0(a5)
    800038a0:	00f00613          	li	a2,15
    800038a4:	0007079b          	sext.w	a5,a4
    800038a8:	f8d40023          	sb	a3,-128(s0)
    800038ac:	0047559b          	srliw	a1,a4,0x4
    800038b0:	0047569b          	srliw	a3,a4,0x4
    800038b4:	00000c93          	li	s9,0
    800038b8:	0ee65063          	bge	a2,a4,80003998 <__printf+0x410>
    800038bc:	00f6f693          	andi	a3,a3,15
    800038c0:	00dd86b3          	add	a3,s11,a3
    800038c4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    800038c8:	0087d79b          	srliw	a5,a5,0x8
    800038cc:	00100c93          	li	s9,1
    800038d0:	f8d400a3          	sb	a3,-127(s0)
    800038d4:	0cb67263          	bgeu	a2,a1,80003998 <__printf+0x410>
    800038d8:	00f7f693          	andi	a3,a5,15
    800038dc:	00dd86b3          	add	a3,s11,a3
    800038e0:	0006c583          	lbu	a1,0(a3)
    800038e4:	00f00613          	li	a2,15
    800038e8:	0047d69b          	srliw	a3,a5,0x4
    800038ec:	f8b40123          	sb	a1,-126(s0)
    800038f0:	0047d593          	srli	a1,a5,0x4
    800038f4:	28f67e63          	bgeu	a2,a5,80003b90 <__printf+0x608>
    800038f8:	00f6f693          	andi	a3,a3,15
    800038fc:	00dd86b3          	add	a3,s11,a3
    80003900:	0006c503          	lbu	a0,0(a3)
    80003904:	0087d813          	srli	a6,a5,0x8
    80003908:	0087d69b          	srliw	a3,a5,0x8
    8000390c:	f8a401a3          	sb	a0,-125(s0)
    80003910:	28b67663          	bgeu	a2,a1,80003b9c <__printf+0x614>
    80003914:	00f6f693          	andi	a3,a3,15
    80003918:	00dd86b3          	add	a3,s11,a3
    8000391c:	0006c583          	lbu	a1,0(a3)
    80003920:	00c7d513          	srli	a0,a5,0xc
    80003924:	00c7d69b          	srliw	a3,a5,0xc
    80003928:	f8b40223          	sb	a1,-124(s0)
    8000392c:	29067a63          	bgeu	a2,a6,80003bc0 <__printf+0x638>
    80003930:	00f6f693          	andi	a3,a3,15
    80003934:	00dd86b3          	add	a3,s11,a3
    80003938:	0006c583          	lbu	a1,0(a3)
    8000393c:	0107d813          	srli	a6,a5,0x10
    80003940:	0107d69b          	srliw	a3,a5,0x10
    80003944:	f8b402a3          	sb	a1,-123(s0)
    80003948:	28a67263          	bgeu	a2,a0,80003bcc <__printf+0x644>
    8000394c:	00f6f693          	andi	a3,a3,15
    80003950:	00dd86b3          	add	a3,s11,a3
    80003954:	0006c683          	lbu	a3,0(a3)
    80003958:	0147d79b          	srliw	a5,a5,0x14
    8000395c:	f8d40323          	sb	a3,-122(s0)
    80003960:	21067663          	bgeu	a2,a6,80003b6c <__printf+0x5e4>
    80003964:	02079793          	slli	a5,a5,0x20
    80003968:	0207d793          	srli	a5,a5,0x20
    8000396c:	00fd8db3          	add	s11,s11,a5
    80003970:	000dc683          	lbu	a3,0(s11)
    80003974:	00800793          	li	a5,8
    80003978:	00700c93          	li	s9,7
    8000397c:	f8d403a3          	sb	a3,-121(s0)
    80003980:	00075c63          	bgez	a4,80003998 <__printf+0x410>
    80003984:	f9040713          	addi	a4,s0,-112
    80003988:	00f70733          	add	a4,a4,a5
    8000398c:	02d00693          	li	a3,45
    80003990:	fed70823          	sb	a3,-16(a4)
    80003994:	00078c93          	mv	s9,a5
    80003998:	f8040793          	addi	a5,s0,-128
    8000399c:	01978cb3          	add	s9,a5,s9
    800039a0:	f7f40d13          	addi	s10,s0,-129
    800039a4:	000cc503          	lbu	a0,0(s9)
    800039a8:	fffc8c93          	addi	s9,s9,-1
    800039ac:	00000097          	auipc	ra,0x0
    800039b0:	9f8080e7          	jalr	-1544(ra) # 800033a4 <consputc>
    800039b4:	ff9d18e3          	bne	s10,s9,800039a4 <__printf+0x41c>
    800039b8:	0100006f          	j	800039c8 <__printf+0x440>
    800039bc:	00000097          	auipc	ra,0x0
    800039c0:	9e8080e7          	jalr	-1560(ra) # 800033a4 <consputc>
    800039c4:	000c8493          	mv	s1,s9
    800039c8:	00094503          	lbu	a0,0(s2)
    800039cc:	c60510e3          	bnez	a0,8000362c <__printf+0xa4>
    800039d0:	e40c0ee3          	beqz	s8,8000382c <__printf+0x2a4>
    800039d4:	00004517          	auipc	a0,0x4
    800039d8:	89c50513          	addi	a0,a0,-1892 # 80007270 <pr>
    800039dc:	00001097          	auipc	ra,0x1
    800039e0:	94c080e7          	jalr	-1716(ra) # 80004328 <release>
    800039e4:	e49ff06f          	j	8000382c <__printf+0x2a4>
    800039e8:	f7843783          	ld	a5,-136(s0)
    800039ec:	03000513          	li	a0,48
    800039f0:	01000d13          	li	s10,16
    800039f4:	00878713          	addi	a4,a5,8
    800039f8:	0007bc83          	ld	s9,0(a5)
    800039fc:	f6e43c23          	sd	a4,-136(s0)
    80003a00:	00000097          	auipc	ra,0x0
    80003a04:	9a4080e7          	jalr	-1628(ra) # 800033a4 <consputc>
    80003a08:	07800513          	li	a0,120
    80003a0c:	00000097          	auipc	ra,0x0
    80003a10:	998080e7          	jalr	-1640(ra) # 800033a4 <consputc>
    80003a14:	00002d97          	auipc	s11,0x2
    80003a18:	95cd8d93          	addi	s11,s11,-1700 # 80005370 <digits>
    80003a1c:	03ccd793          	srli	a5,s9,0x3c
    80003a20:	00fd87b3          	add	a5,s11,a5
    80003a24:	0007c503          	lbu	a0,0(a5)
    80003a28:	fffd0d1b          	addiw	s10,s10,-1
    80003a2c:	004c9c93          	slli	s9,s9,0x4
    80003a30:	00000097          	auipc	ra,0x0
    80003a34:	974080e7          	jalr	-1676(ra) # 800033a4 <consputc>
    80003a38:	fe0d12e3          	bnez	s10,80003a1c <__printf+0x494>
    80003a3c:	f8dff06f          	j	800039c8 <__printf+0x440>
    80003a40:	f7843783          	ld	a5,-136(s0)
    80003a44:	0007bc83          	ld	s9,0(a5)
    80003a48:	00878793          	addi	a5,a5,8
    80003a4c:	f6f43c23          	sd	a5,-136(s0)
    80003a50:	000c9a63          	bnez	s9,80003a64 <__printf+0x4dc>
    80003a54:	1080006f          	j	80003b5c <__printf+0x5d4>
    80003a58:	001c8c93          	addi	s9,s9,1
    80003a5c:	00000097          	auipc	ra,0x0
    80003a60:	948080e7          	jalr	-1720(ra) # 800033a4 <consputc>
    80003a64:	000cc503          	lbu	a0,0(s9)
    80003a68:	fe0518e3          	bnez	a0,80003a58 <__printf+0x4d0>
    80003a6c:	f5dff06f          	j	800039c8 <__printf+0x440>
    80003a70:	02500513          	li	a0,37
    80003a74:	00000097          	auipc	ra,0x0
    80003a78:	930080e7          	jalr	-1744(ra) # 800033a4 <consputc>
    80003a7c:	000c8513          	mv	a0,s9
    80003a80:	00000097          	auipc	ra,0x0
    80003a84:	924080e7          	jalr	-1756(ra) # 800033a4 <consputc>
    80003a88:	f41ff06f          	j	800039c8 <__printf+0x440>
    80003a8c:	02500513          	li	a0,37
    80003a90:	00000097          	auipc	ra,0x0
    80003a94:	914080e7          	jalr	-1772(ra) # 800033a4 <consputc>
    80003a98:	f31ff06f          	j	800039c8 <__printf+0x440>
    80003a9c:	00030513          	mv	a0,t1
    80003aa0:	00000097          	auipc	ra,0x0
    80003aa4:	7bc080e7          	jalr	1980(ra) # 8000425c <acquire>
    80003aa8:	b4dff06f          	j	800035f4 <__printf+0x6c>
    80003aac:	40c0053b          	negw	a0,a2
    80003ab0:	00a00713          	li	a4,10
    80003ab4:	02e576bb          	remuw	a3,a0,a4
    80003ab8:	00002d97          	auipc	s11,0x2
    80003abc:	8b8d8d93          	addi	s11,s11,-1864 # 80005370 <digits>
    80003ac0:	ff700593          	li	a1,-9
    80003ac4:	02069693          	slli	a3,a3,0x20
    80003ac8:	0206d693          	srli	a3,a3,0x20
    80003acc:	00dd86b3          	add	a3,s11,a3
    80003ad0:	0006c683          	lbu	a3,0(a3)
    80003ad4:	02e557bb          	divuw	a5,a0,a4
    80003ad8:	f8d40023          	sb	a3,-128(s0)
    80003adc:	10b65e63          	bge	a2,a1,80003bf8 <__printf+0x670>
    80003ae0:	06300593          	li	a1,99
    80003ae4:	02e7f6bb          	remuw	a3,a5,a4
    80003ae8:	02069693          	slli	a3,a3,0x20
    80003aec:	0206d693          	srli	a3,a3,0x20
    80003af0:	00dd86b3          	add	a3,s11,a3
    80003af4:	0006c683          	lbu	a3,0(a3)
    80003af8:	02e7d73b          	divuw	a4,a5,a4
    80003afc:	00200793          	li	a5,2
    80003b00:	f8d400a3          	sb	a3,-127(s0)
    80003b04:	bca5ece3          	bltu	a1,a0,800036dc <__printf+0x154>
    80003b08:	ce5ff06f          	j	800037ec <__printf+0x264>
    80003b0c:	40e007bb          	negw	a5,a4
    80003b10:	00002d97          	auipc	s11,0x2
    80003b14:	860d8d93          	addi	s11,s11,-1952 # 80005370 <digits>
    80003b18:	00f7f693          	andi	a3,a5,15
    80003b1c:	00dd86b3          	add	a3,s11,a3
    80003b20:	0006c583          	lbu	a1,0(a3)
    80003b24:	ff100613          	li	a2,-15
    80003b28:	0047d69b          	srliw	a3,a5,0x4
    80003b2c:	f8b40023          	sb	a1,-128(s0)
    80003b30:	0047d59b          	srliw	a1,a5,0x4
    80003b34:	0ac75e63          	bge	a4,a2,80003bf0 <__printf+0x668>
    80003b38:	00f6f693          	andi	a3,a3,15
    80003b3c:	00dd86b3          	add	a3,s11,a3
    80003b40:	0006c603          	lbu	a2,0(a3)
    80003b44:	00f00693          	li	a3,15
    80003b48:	0087d79b          	srliw	a5,a5,0x8
    80003b4c:	f8c400a3          	sb	a2,-127(s0)
    80003b50:	d8b6e4e3          	bltu	a3,a1,800038d8 <__printf+0x350>
    80003b54:	00200793          	li	a5,2
    80003b58:	e2dff06f          	j	80003984 <__printf+0x3fc>
    80003b5c:	00001c97          	auipc	s9,0x1
    80003b60:	7f4c8c93          	addi	s9,s9,2036 # 80005350 <CONSOLE_STATUS+0x340>
    80003b64:	02800513          	li	a0,40
    80003b68:	ef1ff06f          	j	80003a58 <__printf+0x4d0>
    80003b6c:	00700793          	li	a5,7
    80003b70:	00600c93          	li	s9,6
    80003b74:	e0dff06f          	j	80003980 <__printf+0x3f8>
    80003b78:	00700793          	li	a5,7
    80003b7c:	00600c93          	li	s9,6
    80003b80:	c69ff06f          	j	800037e8 <__printf+0x260>
    80003b84:	00300793          	li	a5,3
    80003b88:	00200c93          	li	s9,2
    80003b8c:	c5dff06f          	j	800037e8 <__printf+0x260>
    80003b90:	00300793          	li	a5,3
    80003b94:	00200c93          	li	s9,2
    80003b98:	de9ff06f          	j	80003980 <__printf+0x3f8>
    80003b9c:	00400793          	li	a5,4
    80003ba0:	00300c93          	li	s9,3
    80003ba4:	dddff06f          	j	80003980 <__printf+0x3f8>
    80003ba8:	00400793          	li	a5,4
    80003bac:	00300c93          	li	s9,3
    80003bb0:	c39ff06f          	j	800037e8 <__printf+0x260>
    80003bb4:	00500793          	li	a5,5
    80003bb8:	00400c93          	li	s9,4
    80003bbc:	c2dff06f          	j	800037e8 <__printf+0x260>
    80003bc0:	00500793          	li	a5,5
    80003bc4:	00400c93          	li	s9,4
    80003bc8:	db9ff06f          	j	80003980 <__printf+0x3f8>
    80003bcc:	00600793          	li	a5,6
    80003bd0:	00500c93          	li	s9,5
    80003bd4:	dadff06f          	j	80003980 <__printf+0x3f8>
    80003bd8:	00600793          	li	a5,6
    80003bdc:	00500c93          	li	s9,5
    80003be0:	c09ff06f          	j	800037e8 <__printf+0x260>
    80003be4:	00800793          	li	a5,8
    80003be8:	00700c93          	li	s9,7
    80003bec:	bfdff06f          	j	800037e8 <__printf+0x260>
    80003bf0:	00100793          	li	a5,1
    80003bf4:	d91ff06f          	j	80003984 <__printf+0x3fc>
    80003bf8:	00100793          	li	a5,1
    80003bfc:	bf1ff06f          	j	800037ec <__printf+0x264>
    80003c00:	00900793          	li	a5,9
    80003c04:	00800c93          	li	s9,8
    80003c08:	be1ff06f          	j	800037e8 <__printf+0x260>
    80003c0c:	00001517          	auipc	a0,0x1
    80003c10:	74c50513          	addi	a0,a0,1868 # 80005358 <CONSOLE_STATUS+0x348>
    80003c14:	00000097          	auipc	ra,0x0
    80003c18:	918080e7          	jalr	-1768(ra) # 8000352c <panic>

0000000080003c1c <printfinit>:
    80003c1c:	fe010113          	addi	sp,sp,-32
    80003c20:	00813823          	sd	s0,16(sp)
    80003c24:	00913423          	sd	s1,8(sp)
    80003c28:	00113c23          	sd	ra,24(sp)
    80003c2c:	02010413          	addi	s0,sp,32
    80003c30:	00003497          	auipc	s1,0x3
    80003c34:	64048493          	addi	s1,s1,1600 # 80007270 <pr>
    80003c38:	00048513          	mv	a0,s1
    80003c3c:	00001597          	auipc	a1,0x1
    80003c40:	72c58593          	addi	a1,a1,1836 # 80005368 <CONSOLE_STATUS+0x358>
    80003c44:	00000097          	auipc	ra,0x0
    80003c48:	5f4080e7          	jalr	1524(ra) # 80004238 <initlock>
    80003c4c:	01813083          	ld	ra,24(sp)
    80003c50:	01013403          	ld	s0,16(sp)
    80003c54:	0004ac23          	sw	zero,24(s1)
    80003c58:	00813483          	ld	s1,8(sp)
    80003c5c:	02010113          	addi	sp,sp,32
    80003c60:	00008067          	ret

0000000080003c64 <uartinit>:
    80003c64:	ff010113          	addi	sp,sp,-16
    80003c68:	00813423          	sd	s0,8(sp)
    80003c6c:	01010413          	addi	s0,sp,16
    80003c70:	100007b7          	lui	a5,0x10000
    80003c74:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80003c78:	f8000713          	li	a4,-128
    80003c7c:	00e781a3          	sb	a4,3(a5)
    80003c80:	00300713          	li	a4,3
    80003c84:	00e78023          	sb	a4,0(a5)
    80003c88:	000780a3          	sb	zero,1(a5)
    80003c8c:	00e781a3          	sb	a4,3(a5)
    80003c90:	00700693          	li	a3,7
    80003c94:	00d78123          	sb	a3,2(a5)
    80003c98:	00e780a3          	sb	a4,1(a5)
    80003c9c:	00813403          	ld	s0,8(sp)
    80003ca0:	01010113          	addi	sp,sp,16
    80003ca4:	00008067          	ret

0000000080003ca8 <uartputc>:
    80003ca8:	00002797          	auipc	a5,0x2
    80003cac:	3407a783          	lw	a5,832(a5) # 80005fe8 <panicked>
    80003cb0:	00078463          	beqz	a5,80003cb8 <uartputc+0x10>
    80003cb4:	0000006f          	j	80003cb4 <uartputc+0xc>
    80003cb8:	fd010113          	addi	sp,sp,-48
    80003cbc:	02813023          	sd	s0,32(sp)
    80003cc0:	00913c23          	sd	s1,24(sp)
    80003cc4:	01213823          	sd	s2,16(sp)
    80003cc8:	01313423          	sd	s3,8(sp)
    80003ccc:	02113423          	sd	ra,40(sp)
    80003cd0:	03010413          	addi	s0,sp,48
    80003cd4:	00002917          	auipc	s2,0x2
    80003cd8:	31c90913          	addi	s2,s2,796 # 80005ff0 <uart_tx_r>
    80003cdc:	00093783          	ld	a5,0(s2)
    80003ce0:	00002497          	auipc	s1,0x2
    80003ce4:	31848493          	addi	s1,s1,792 # 80005ff8 <uart_tx_w>
    80003ce8:	0004b703          	ld	a4,0(s1)
    80003cec:	02078693          	addi	a3,a5,32
    80003cf0:	00050993          	mv	s3,a0
    80003cf4:	02e69c63          	bne	a3,a4,80003d2c <uartputc+0x84>
    80003cf8:	00001097          	auipc	ra,0x1
    80003cfc:	834080e7          	jalr	-1996(ra) # 8000452c <push_on>
    80003d00:	00093783          	ld	a5,0(s2)
    80003d04:	0004b703          	ld	a4,0(s1)
    80003d08:	02078793          	addi	a5,a5,32
    80003d0c:	00e79463          	bne	a5,a4,80003d14 <uartputc+0x6c>
    80003d10:	0000006f          	j	80003d10 <uartputc+0x68>
    80003d14:	00001097          	auipc	ra,0x1
    80003d18:	88c080e7          	jalr	-1908(ra) # 800045a0 <pop_on>
    80003d1c:	00093783          	ld	a5,0(s2)
    80003d20:	0004b703          	ld	a4,0(s1)
    80003d24:	02078693          	addi	a3,a5,32
    80003d28:	fce688e3          	beq	a3,a4,80003cf8 <uartputc+0x50>
    80003d2c:	01f77693          	andi	a3,a4,31
    80003d30:	00003597          	auipc	a1,0x3
    80003d34:	56058593          	addi	a1,a1,1376 # 80007290 <uart_tx_buf>
    80003d38:	00d586b3          	add	a3,a1,a3
    80003d3c:	00170713          	addi	a4,a4,1
    80003d40:	01368023          	sb	s3,0(a3)
    80003d44:	00e4b023          	sd	a4,0(s1)
    80003d48:	10000637          	lui	a2,0x10000
    80003d4c:	02f71063          	bne	a4,a5,80003d6c <uartputc+0xc4>
    80003d50:	0340006f          	j	80003d84 <uartputc+0xdc>
    80003d54:	00074703          	lbu	a4,0(a4)
    80003d58:	00f93023          	sd	a5,0(s2)
    80003d5c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80003d60:	00093783          	ld	a5,0(s2)
    80003d64:	0004b703          	ld	a4,0(s1)
    80003d68:	00f70e63          	beq	a4,a5,80003d84 <uartputc+0xdc>
    80003d6c:	00564683          	lbu	a3,5(a2)
    80003d70:	01f7f713          	andi	a4,a5,31
    80003d74:	00e58733          	add	a4,a1,a4
    80003d78:	0206f693          	andi	a3,a3,32
    80003d7c:	00178793          	addi	a5,a5,1
    80003d80:	fc069ae3          	bnez	a3,80003d54 <uartputc+0xac>
    80003d84:	02813083          	ld	ra,40(sp)
    80003d88:	02013403          	ld	s0,32(sp)
    80003d8c:	01813483          	ld	s1,24(sp)
    80003d90:	01013903          	ld	s2,16(sp)
    80003d94:	00813983          	ld	s3,8(sp)
    80003d98:	03010113          	addi	sp,sp,48
    80003d9c:	00008067          	ret

0000000080003da0 <uartputc_sync>:
    80003da0:	ff010113          	addi	sp,sp,-16
    80003da4:	00813423          	sd	s0,8(sp)
    80003da8:	01010413          	addi	s0,sp,16
    80003dac:	00002717          	auipc	a4,0x2
    80003db0:	23c72703          	lw	a4,572(a4) # 80005fe8 <panicked>
    80003db4:	02071663          	bnez	a4,80003de0 <uartputc_sync+0x40>
    80003db8:	00050793          	mv	a5,a0
    80003dbc:	100006b7          	lui	a3,0x10000
    80003dc0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80003dc4:	02077713          	andi	a4,a4,32
    80003dc8:	fe070ce3          	beqz	a4,80003dc0 <uartputc_sync+0x20>
    80003dcc:	0ff7f793          	andi	a5,a5,255
    80003dd0:	00f68023          	sb	a5,0(a3)
    80003dd4:	00813403          	ld	s0,8(sp)
    80003dd8:	01010113          	addi	sp,sp,16
    80003ddc:	00008067          	ret
    80003de0:	0000006f          	j	80003de0 <uartputc_sync+0x40>

0000000080003de4 <uartstart>:
    80003de4:	ff010113          	addi	sp,sp,-16
    80003de8:	00813423          	sd	s0,8(sp)
    80003dec:	01010413          	addi	s0,sp,16
    80003df0:	00002617          	auipc	a2,0x2
    80003df4:	20060613          	addi	a2,a2,512 # 80005ff0 <uart_tx_r>
    80003df8:	00002517          	auipc	a0,0x2
    80003dfc:	20050513          	addi	a0,a0,512 # 80005ff8 <uart_tx_w>
    80003e00:	00063783          	ld	a5,0(a2)
    80003e04:	00053703          	ld	a4,0(a0)
    80003e08:	04f70263          	beq	a4,a5,80003e4c <uartstart+0x68>
    80003e0c:	100005b7          	lui	a1,0x10000
    80003e10:	00003817          	auipc	a6,0x3
    80003e14:	48080813          	addi	a6,a6,1152 # 80007290 <uart_tx_buf>
    80003e18:	01c0006f          	j	80003e34 <uartstart+0x50>
    80003e1c:	0006c703          	lbu	a4,0(a3)
    80003e20:	00f63023          	sd	a5,0(a2)
    80003e24:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80003e28:	00063783          	ld	a5,0(a2)
    80003e2c:	00053703          	ld	a4,0(a0)
    80003e30:	00f70e63          	beq	a4,a5,80003e4c <uartstart+0x68>
    80003e34:	01f7f713          	andi	a4,a5,31
    80003e38:	00e806b3          	add	a3,a6,a4
    80003e3c:	0055c703          	lbu	a4,5(a1)
    80003e40:	00178793          	addi	a5,a5,1
    80003e44:	02077713          	andi	a4,a4,32
    80003e48:	fc071ae3          	bnez	a4,80003e1c <uartstart+0x38>
    80003e4c:	00813403          	ld	s0,8(sp)
    80003e50:	01010113          	addi	sp,sp,16
    80003e54:	00008067          	ret

0000000080003e58 <uartgetc>:
    80003e58:	ff010113          	addi	sp,sp,-16
    80003e5c:	00813423          	sd	s0,8(sp)
    80003e60:	01010413          	addi	s0,sp,16
    80003e64:	10000737          	lui	a4,0x10000
    80003e68:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80003e6c:	0017f793          	andi	a5,a5,1
    80003e70:	00078c63          	beqz	a5,80003e88 <uartgetc+0x30>
    80003e74:	00074503          	lbu	a0,0(a4)
    80003e78:	0ff57513          	andi	a0,a0,255
    80003e7c:	00813403          	ld	s0,8(sp)
    80003e80:	01010113          	addi	sp,sp,16
    80003e84:	00008067          	ret
    80003e88:	fff00513          	li	a0,-1
    80003e8c:	ff1ff06f          	j	80003e7c <uartgetc+0x24>

0000000080003e90 <uartintr>:
    80003e90:	100007b7          	lui	a5,0x10000
    80003e94:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80003e98:	0017f793          	andi	a5,a5,1
    80003e9c:	0a078463          	beqz	a5,80003f44 <uartintr+0xb4>
    80003ea0:	fe010113          	addi	sp,sp,-32
    80003ea4:	00813823          	sd	s0,16(sp)
    80003ea8:	00913423          	sd	s1,8(sp)
    80003eac:	00113c23          	sd	ra,24(sp)
    80003eb0:	02010413          	addi	s0,sp,32
    80003eb4:	100004b7          	lui	s1,0x10000
    80003eb8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    80003ebc:	0ff57513          	andi	a0,a0,255
    80003ec0:	fffff097          	auipc	ra,0xfffff
    80003ec4:	534080e7          	jalr	1332(ra) # 800033f4 <consoleintr>
    80003ec8:	0054c783          	lbu	a5,5(s1)
    80003ecc:	0017f793          	andi	a5,a5,1
    80003ed0:	fe0794e3          	bnez	a5,80003eb8 <uartintr+0x28>
    80003ed4:	00002617          	auipc	a2,0x2
    80003ed8:	11c60613          	addi	a2,a2,284 # 80005ff0 <uart_tx_r>
    80003edc:	00002517          	auipc	a0,0x2
    80003ee0:	11c50513          	addi	a0,a0,284 # 80005ff8 <uart_tx_w>
    80003ee4:	00063783          	ld	a5,0(a2)
    80003ee8:	00053703          	ld	a4,0(a0)
    80003eec:	04f70263          	beq	a4,a5,80003f30 <uartintr+0xa0>
    80003ef0:	100005b7          	lui	a1,0x10000
    80003ef4:	00003817          	auipc	a6,0x3
    80003ef8:	39c80813          	addi	a6,a6,924 # 80007290 <uart_tx_buf>
    80003efc:	01c0006f          	j	80003f18 <uartintr+0x88>
    80003f00:	0006c703          	lbu	a4,0(a3)
    80003f04:	00f63023          	sd	a5,0(a2)
    80003f08:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80003f0c:	00063783          	ld	a5,0(a2)
    80003f10:	00053703          	ld	a4,0(a0)
    80003f14:	00f70e63          	beq	a4,a5,80003f30 <uartintr+0xa0>
    80003f18:	01f7f713          	andi	a4,a5,31
    80003f1c:	00e806b3          	add	a3,a6,a4
    80003f20:	0055c703          	lbu	a4,5(a1)
    80003f24:	00178793          	addi	a5,a5,1
    80003f28:	02077713          	andi	a4,a4,32
    80003f2c:	fc071ae3          	bnez	a4,80003f00 <uartintr+0x70>
    80003f30:	01813083          	ld	ra,24(sp)
    80003f34:	01013403          	ld	s0,16(sp)
    80003f38:	00813483          	ld	s1,8(sp)
    80003f3c:	02010113          	addi	sp,sp,32
    80003f40:	00008067          	ret
    80003f44:	00002617          	auipc	a2,0x2
    80003f48:	0ac60613          	addi	a2,a2,172 # 80005ff0 <uart_tx_r>
    80003f4c:	00002517          	auipc	a0,0x2
    80003f50:	0ac50513          	addi	a0,a0,172 # 80005ff8 <uart_tx_w>
    80003f54:	00063783          	ld	a5,0(a2)
    80003f58:	00053703          	ld	a4,0(a0)
    80003f5c:	04f70263          	beq	a4,a5,80003fa0 <uartintr+0x110>
    80003f60:	100005b7          	lui	a1,0x10000
    80003f64:	00003817          	auipc	a6,0x3
    80003f68:	32c80813          	addi	a6,a6,812 # 80007290 <uart_tx_buf>
    80003f6c:	01c0006f          	j	80003f88 <uartintr+0xf8>
    80003f70:	0006c703          	lbu	a4,0(a3)
    80003f74:	00f63023          	sd	a5,0(a2)
    80003f78:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80003f7c:	00063783          	ld	a5,0(a2)
    80003f80:	00053703          	ld	a4,0(a0)
    80003f84:	02f70063          	beq	a4,a5,80003fa4 <uartintr+0x114>
    80003f88:	01f7f713          	andi	a4,a5,31
    80003f8c:	00e806b3          	add	a3,a6,a4
    80003f90:	0055c703          	lbu	a4,5(a1)
    80003f94:	00178793          	addi	a5,a5,1
    80003f98:	02077713          	andi	a4,a4,32
    80003f9c:	fc071ae3          	bnez	a4,80003f70 <uartintr+0xe0>
    80003fa0:	00008067          	ret
    80003fa4:	00008067          	ret

0000000080003fa8 <kinit>:
    80003fa8:	fc010113          	addi	sp,sp,-64
    80003fac:	02913423          	sd	s1,40(sp)
    80003fb0:	fffff7b7          	lui	a5,0xfffff
    80003fb4:	00004497          	auipc	s1,0x4
    80003fb8:	2fb48493          	addi	s1,s1,763 # 800082af <end+0xfff>
    80003fbc:	02813823          	sd	s0,48(sp)
    80003fc0:	01313c23          	sd	s3,24(sp)
    80003fc4:	00f4f4b3          	and	s1,s1,a5
    80003fc8:	02113c23          	sd	ra,56(sp)
    80003fcc:	03213023          	sd	s2,32(sp)
    80003fd0:	01413823          	sd	s4,16(sp)
    80003fd4:	01513423          	sd	s5,8(sp)
    80003fd8:	04010413          	addi	s0,sp,64
    80003fdc:	000017b7          	lui	a5,0x1
    80003fe0:	01100993          	li	s3,17
    80003fe4:	00f487b3          	add	a5,s1,a5
    80003fe8:	01b99993          	slli	s3,s3,0x1b
    80003fec:	06f9e063          	bltu	s3,a5,8000404c <kinit+0xa4>
    80003ff0:	00003a97          	auipc	s5,0x3
    80003ff4:	2c0a8a93          	addi	s5,s5,704 # 800072b0 <end>
    80003ff8:	0754ec63          	bltu	s1,s5,80004070 <kinit+0xc8>
    80003ffc:	0734fa63          	bgeu	s1,s3,80004070 <kinit+0xc8>
    80004000:	00088a37          	lui	s4,0x88
    80004004:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80004008:	00002917          	auipc	s2,0x2
    8000400c:	ff890913          	addi	s2,s2,-8 # 80006000 <kmem>
    80004010:	00ca1a13          	slli	s4,s4,0xc
    80004014:	0140006f          	j	80004028 <kinit+0x80>
    80004018:	000017b7          	lui	a5,0x1
    8000401c:	00f484b3          	add	s1,s1,a5
    80004020:	0554e863          	bltu	s1,s5,80004070 <kinit+0xc8>
    80004024:	0534f663          	bgeu	s1,s3,80004070 <kinit+0xc8>
    80004028:	00001637          	lui	a2,0x1
    8000402c:	00100593          	li	a1,1
    80004030:	00048513          	mv	a0,s1
    80004034:	00000097          	auipc	ra,0x0
    80004038:	5e4080e7          	jalr	1508(ra) # 80004618 <__memset>
    8000403c:	00093783          	ld	a5,0(s2)
    80004040:	00f4b023          	sd	a5,0(s1)
    80004044:	00993023          	sd	s1,0(s2)
    80004048:	fd4498e3          	bne	s1,s4,80004018 <kinit+0x70>
    8000404c:	03813083          	ld	ra,56(sp)
    80004050:	03013403          	ld	s0,48(sp)
    80004054:	02813483          	ld	s1,40(sp)
    80004058:	02013903          	ld	s2,32(sp)
    8000405c:	01813983          	ld	s3,24(sp)
    80004060:	01013a03          	ld	s4,16(sp)
    80004064:	00813a83          	ld	s5,8(sp)
    80004068:	04010113          	addi	sp,sp,64
    8000406c:	00008067          	ret
    80004070:	00001517          	auipc	a0,0x1
    80004074:	31850513          	addi	a0,a0,792 # 80005388 <digits+0x18>
    80004078:	fffff097          	auipc	ra,0xfffff
    8000407c:	4b4080e7          	jalr	1204(ra) # 8000352c <panic>

0000000080004080 <freerange>:
    80004080:	fc010113          	addi	sp,sp,-64
    80004084:	000017b7          	lui	a5,0x1
    80004088:	02913423          	sd	s1,40(sp)
    8000408c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80004090:	009504b3          	add	s1,a0,s1
    80004094:	fffff537          	lui	a0,0xfffff
    80004098:	02813823          	sd	s0,48(sp)
    8000409c:	02113c23          	sd	ra,56(sp)
    800040a0:	03213023          	sd	s2,32(sp)
    800040a4:	01313c23          	sd	s3,24(sp)
    800040a8:	01413823          	sd	s4,16(sp)
    800040ac:	01513423          	sd	s5,8(sp)
    800040b0:	01613023          	sd	s6,0(sp)
    800040b4:	04010413          	addi	s0,sp,64
    800040b8:	00a4f4b3          	and	s1,s1,a0
    800040bc:	00f487b3          	add	a5,s1,a5
    800040c0:	06f5e463          	bltu	a1,a5,80004128 <freerange+0xa8>
    800040c4:	00003a97          	auipc	s5,0x3
    800040c8:	1eca8a93          	addi	s5,s5,492 # 800072b0 <end>
    800040cc:	0954e263          	bltu	s1,s5,80004150 <freerange+0xd0>
    800040d0:	01100993          	li	s3,17
    800040d4:	01b99993          	slli	s3,s3,0x1b
    800040d8:	0734fc63          	bgeu	s1,s3,80004150 <freerange+0xd0>
    800040dc:	00058a13          	mv	s4,a1
    800040e0:	00002917          	auipc	s2,0x2
    800040e4:	f2090913          	addi	s2,s2,-224 # 80006000 <kmem>
    800040e8:	00002b37          	lui	s6,0x2
    800040ec:	0140006f          	j	80004100 <freerange+0x80>
    800040f0:	000017b7          	lui	a5,0x1
    800040f4:	00f484b3          	add	s1,s1,a5
    800040f8:	0554ec63          	bltu	s1,s5,80004150 <freerange+0xd0>
    800040fc:	0534fa63          	bgeu	s1,s3,80004150 <freerange+0xd0>
    80004100:	00001637          	lui	a2,0x1
    80004104:	00100593          	li	a1,1
    80004108:	00048513          	mv	a0,s1
    8000410c:	00000097          	auipc	ra,0x0
    80004110:	50c080e7          	jalr	1292(ra) # 80004618 <__memset>
    80004114:	00093703          	ld	a4,0(s2)
    80004118:	016487b3          	add	a5,s1,s6
    8000411c:	00e4b023          	sd	a4,0(s1)
    80004120:	00993023          	sd	s1,0(s2)
    80004124:	fcfa76e3          	bgeu	s4,a5,800040f0 <freerange+0x70>
    80004128:	03813083          	ld	ra,56(sp)
    8000412c:	03013403          	ld	s0,48(sp)
    80004130:	02813483          	ld	s1,40(sp)
    80004134:	02013903          	ld	s2,32(sp)
    80004138:	01813983          	ld	s3,24(sp)
    8000413c:	01013a03          	ld	s4,16(sp)
    80004140:	00813a83          	ld	s5,8(sp)
    80004144:	00013b03          	ld	s6,0(sp)
    80004148:	04010113          	addi	sp,sp,64
    8000414c:	00008067          	ret
    80004150:	00001517          	auipc	a0,0x1
    80004154:	23850513          	addi	a0,a0,568 # 80005388 <digits+0x18>
    80004158:	fffff097          	auipc	ra,0xfffff
    8000415c:	3d4080e7          	jalr	980(ra) # 8000352c <panic>

0000000080004160 <kfree>:
    80004160:	fe010113          	addi	sp,sp,-32
    80004164:	00813823          	sd	s0,16(sp)
    80004168:	00113c23          	sd	ra,24(sp)
    8000416c:	00913423          	sd	s1,8(sp)
    80004170:	02010413          	addi	s0,sp,32
    80004174:	03451793          	slli	a5,a0,0x34
    80004178:	04079c63          	bnez	a5,800041d0 <kfree+0x70>
    8000417c:	00003797          	auipc	a5,0x3
    80004180:	13478793          	addi	a5,a5,308 # 800072b0 <end>
    80004184:	00050493          	mv	s1,a0
    80004188:	04f56463          	bltu	a0,a5,800041d0 <kfree+0x70>
    8000418c:	01100793          	li	a5,17
    80004190:	01b79793          	slli	a5,a5,0x1b
    80004194:	02f57e63          	bgeu	a0,a5,800041d0 <kfree+0x70>
    80004198:	00001637          	lui	a2,0x1
    8000419c:	00100593          	li	a1,1
    800041a0:	00000097          	auipc	ra,0x0
    800041a4:	478080e7          	jalr	1144(ra) # 80004618 <__memset>
    800041a8:	00002797          	auipc	a5,0x2
    800041ac:	e5878793          	addi	a5,a5,-424 # 80006000 <kmem>
    800041b0:	0007b703          	ld	a4,0(a5)
    800041b4:	01813083          	ld	ra,24(sp)
    800041b8:	01013403          	ld	s0,16(sp)
    800041bc:	00e4b023          	sd	a4,0(s1)
    800041c0:	0097b023          	sd	s1,0(a5)
    800041c4:	00813483          	ld	s1,8(sp)
    800041c8:	02010113          	addi	sp,sp,32
    800041cc:	00008067          	ret
    800041d0:	00001517          	auipc	a0,0x1
    800041d4:	1b850513          	addi	a0,a0,440 # 80005388 <digits+0x18>
    800041d8:	fffff097          	auipc	ra,0xfffff
    800041dc:	354080e7          	jalr	852(ra) # 8000352c <panic>

00000000800041e0 <kalloc>:
    800041e0:	fe010113          	addi	sp,sp,-32
    800041e4:	00813823          	sd	s0,16(sp)
    800041e8:	00913423          	sd	s1,8(sp)
    800041ec:	00113c23          	sd	ra,24(sp)
    800041f0:	02010413          	addi	s0,sp,32
    800041f4:	00002797          	auipc	a5,0x2
    800041f8:	e0c78793          	addi	a5,a5,-500 # 80006000 <kmem>
    800041fc:	0007b483          	ld	s1,0(a5)
    80004200:	02048063          	beqz	s1,80004220 <kalloc+0x40>
    80004204:	0004b703          	ld	a4,0(s1)
    80004208:	00001637          	lui	a2,0x1
    8000420c:	00500593          	li	a1,5
    80004210:	00048513          	mv	a0,s1
    80004214:	00e7b023          	sd	a4,0(a5)
    80004218:	00000097          	auipc	ra,0x0
    8000421c:	400080e7          	jalr	1024(ra) # 80004618 <__memset>
    80004220:	01813083          	ld	ra,24(sp)
    80004224:	01013403          	ld	s0,16(sp)
    80004228:	00048513          	mv	a0,s1
    8000422c:	00813483          	ld	s1,8(sp)
    80004230:	02010113          	addi	sp,sp,32
    80004234:	00008067          	ret

0000000080004238 <initlock>:
    80004238:	ff010113          	addi	sp,sp,-16
    8000423c:	00813423          	sd	s0,8(sp)
    80004240:	01010413          	addi	s0,sp,16
    80004244:	00813403          	ld	s0,8(sp)
    80004248:	00b53423          	sd	a1,8(a0)
    8000424c:	00052023          	sw	zero,0(a0)
    80004250:	00053823          	sd	zero,16(a0)
    80004254:	01010113          	addi	sp,sp,16
    80004258:	00008067          	ret

000000008000425c <acquire>:
    8000425c:	fe010113          	addi	sp,sp,-32
    80004260:	00813823          	sd	s0,16(sp)
    80004264:	00913423          	sd	s1,8(sp)
    80004268:	00113c23          	sd	ra,24(sp)
    8000426c:	01213023          	sd	s2,0(sp)
    80004270:	02010413          	addi	s0,sp,32
    80004274:	00050493          	mv	s1,a0
    80004278:	10002973          	csrr	s2,sstatus
    8000427c:	100027f3          	csrr	a5,sstatus
    80004280:	ffd7f793          	andi	a5,a5,-3
    80004284:	10079073          	csrw	sstatus,a5
    80004288:	fffff097          	auipc	ra,0xfffff
    8000428c:	8e4080e7          	jalr	-1820(ra) # 80002b6c <mycpu>
    80004290:	07852783          	lw	a5,120(a0)
    80004294:	06078e63          	beqz	a5,80004310 <acquire+0xb4>
    80004298:	fffff097          	auipc	ra,0xfffff
    8000429c:	8d4080e7          	jalr	-1836(ra) # 80002b6c <mycpu>
    800042a0:	07852783          	lw	a5,120(a0)
    800042a4:	0004a703          	lw	a4,0(s1)
    800042a8:	0017879b          	addiw	a5,a5,1
    800042ac:	06f52c23          	sw	a5,120(a0)
    800042b0:	04071063          	bnez	a4,800042f0 <acquire+0x94>
    800042b4:	00100713          	li	a4,1
    800042b8:	00070793          	mv	a5,a4
    800042bc:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    800042c0:	0007879b          	sext.w	a5,a5
    800042c4:	fe079ae3          	bnez	a5,800042b8 <acquire+0x5c>
    800042c8:	0ff0000f          	fence
    800042cc:	fffff097          	auipc	ra,0xfffff
    800042d0:	8a0080e7          	jalr	-1888(ra) # 80002b6c <mycpu>
    800042d4:	01813083          	ld	ra,24(sp)
    800042d8:	01013403          	ld	s0,16(sp)
    800042dc:	00a4b823          	sd	a0,16(s1)
    800042e0:	00013903          	ld	s2,0(sp)
    800042e4:	00813483          	ld	s1,8(sp)
    800042e8:	02010113          	addi	sp,sp,32
    800042ec:	00008067          	ret
    800042f0:	0104b903          	ld	s2,16(s1)
    800042f4:	fffff097          	auipc	ra,0xfffff
    800042f8:	878080e7          	jalr	-1928(ra) # 80002b6c <mycpu>
    800042fc:	faa91ce3          	bne	s2,a0,800042b4 <acquire+0x58>
    80004300:	00001517          	auipc	a0,0x1
    80004304:	09050513          	addi	a0,a0,144 # 80005390 <digits+0x20>
    80004308:	fffff097          	auipc	ra,0xfffff
    8000430c:	224080e7          	jalr	548(ra) # 8000352c <panic>
    80004310:	00195913          	srli	s2,s2,0x1
    80004314:	fffff097          	auipc	ra,0xfffff
    80004318:	858080e7          	jalr	-1960(ra) # 80002b6c <mycpu>
    8000431c:	00197913          	andi	s2,s2,1
    80004320:	07252e23          	sw	s2,124(a0)
    80004324:	f75ff06f          	j	80004298 <acquire+0x3c>

0000000080004328 <release>:
    80004328:	fe010113          	addi	sp,sp,-32
    8000432c:	00813823          	sd	s0,16(sp)
    80004330:	00113c23          	sd	ra,24(sp)
    80004334:	00913423          	sd	s1,8(sp)
    80004338:	01213023          	sd	s2,0(sp)
    8000433c:	02010413          	addi	s0,sp,32
    80004340:	00052783          	lw	a5,0(a0)
    80004344:	00079a63          	bnez	a5,80004358 <release+0x30>
    80004348:	00001517          	auipc	a0,0x1
    8000434c:	05050513          	addi	a0,a0,80 # 80005398 <digits+0x28>
    80004350:	fffff097          	auipc	ra,0xfffff
    80004354:	1dc080e7          	jalr	476(ra) # 8000352c <panic>
    80004358:	01053903          	ld	s2,16(a0)
    8000435c:	00050493          	mv	s1,a0
    80004360:	fffff097          	auipc	ra,0xfffff
    80004364:	80c080e7          	jalr	-2036(ra) # 80002b6c <mycpu>
    80004368:	fea910e3          	bne	s2,a0,80004348 <release+0x20>
    8000436c:	0004b823          	sd	zero,16(s1)
    80004370:	0ff0000f          	fence
    80004374:	0f50000f          	fence	iorw,ow
    80004378:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000437c:	ffffe097          	auipc	ra,0xffffe
    80004380:	7f0080e7          	jalr	2032(ra) # 80002b6c <mycpu>
    80004384:	100027f3          	csrr	a5,sstatus
    80004388:	0027f793          	andi	a5,a5,2
    8000438c:	04079a63          	bnez	a5,800043e0 <release+0xb8>
    80004390:	07852783          	lw	a5,120(a0)
    80004394:	02f05e63          	blez	a5,800043d0 <release+0xa8>
    80004398:	fff7871b          	addiw	a4,a5,-1
    8000439c:	06e52c23          	sw	a4,120(a0)
    800043a0:	00071c63          	bnez	a4,800043b8 <release+0x90>
    800043a4:	07c52783          	lw	a5,124(a0)
    800043a8:	00078863          	beqz	a5,800043b8 <release+0x90>
    800043ac:	100027f3          	csrr	a5,sstatus
    800043b0:	0027e793          	ori	a5,a5,2
    800043b4:	10079073          	csrw	sstatus,a5
    800043b8:	01813083          	ld	ra,24(sp)
    800043bc:	01013403          	ld	s0,16(sp)
    800043c0:	00813483          	ld	s1,8(sp)
    800043c4:	00013903          	ld	s2,0(sp)
    800043c8:	02010113          	addi	sp,sp,32
    800043cc:	00008067          	ret
    800043d0:	00001517          	auipc	a0,0x1
    800043d4:	fe850513          	addi	a0,a0,-24 # 800053b8 <digits+0x48>
    800043d8:	fffff097          	auipc	ra,0xfffff
    800043dc:	154080e7          	jalr	340(ra) # 8000352c <panic>
    800043e0:	00001517          	auipc	a0,0x1
    800043e4:	fc050513          	addi	a0,a0,-64 # 800053a0 <digits+0x30>
    800043e8:	fffff097          	auipc	ra,0xfffff
    800043ec:	144080e7          	jalr	324(ra) # 8000352c <panic>

00000000800043f0 <holding>:
    800043f0:	00052783          	lw	a5,0(a0)
    800043f4:	00079663          	bnez	a5,80004400 <holding+0x10>
    800043f8:	00000513          	li	a0,0
    800043fc:	00008067          	ret
    80004400:	fe010113          	addi	sp,sp,-32
    80004404:	00813823          	sd	s0,16(sp)
    80004408:	00913423          	sd	s1,8(sp)
    8000440c:	00113c23          	sd	ra,24(sp)
    80004410:	02010413          	addi	s0,sp,32
    80004414:	01053483          	ld	s1,16(a0)
    80004418:	ffffe097          	auipc	ra,0xffffe
    8000441c:	754080e7          	jalr	1876(ra) # 80002b6c <mycpu>
    80004420:	01813083          	ld	ra,24(sp)
    80004424:	01013403          	ld	s0,16(sp)
    80004428:	40a48533          	sub	a0,s1,a0
    8000442c:	00153513          	seqz	a0,a0
    80004430:	00813483          	ld	s1,8(sp)
    80004434:	02010113          	addi	sp,sp,32
    80004438:	00008067          	ret

000000008000443c <push_off>:
    8000443c:	fe010113          	addi	sp,sp,-32
    80004440:	00813823          	sd	s0,16(sp)
    80004444:	00113c23          	sd	ra,24(sp)
    80004448:	00913423          	sd	s1,8(sp)
    8000444c:	02010413          	addi	s0,sp,32
    80004450:	100024f3          	csrr	s1,sstatus
    80004454:	100027f3          	csrr	a5,sstatus
    80004458:	ffd7f793          	andi	a5,a5,-3
    8000445c:	10079073          	csrw	sstatus,a5
    80004460:	ffffe097          	auipc	ra,0xffffe
    80004464:	70c080e7          	jalr	1804(ra) # 80002b6c <mycpu>
    80004468:	07852783          	lw	a5,120(a0)
    8000446c:	02078663          	beqz	a5,80004498 <push_off+0x5c>
    80004470:	ffffe097          	auipc	ra,0xffffe
    80004474:	6fc080e7          	jalr	1788(ra) # 80002b6c <mycpu>
    80004478:	07852783          	lw	a5,120(a0)
    8000447c:	01813083          	ld	ra,24(sp)
    80004480:	01013403          	ld	s0,16(sp)
    80004484:	0017879b          	addiw	a5,a5,1
    80004488:	06f52c23          	sw	a5,120(a0)
    8000448c:	00813483          	ld	s1,8(sp)
    80004490:	02010113          	addi	sp,sp,32
    80004494:	00008067          	ret
    80004498:	0014d493          	srli	s1,s1,0x1
    8000449c:	ffffe097          	auipc	ra,0xffffe
    800044a0:	6d0080e7          	jalr	1744(ra) # 80002b6c <mycpu>
    800044a4:	0014f493          	andi	s1,s1,1
    800044a8:	06952e23          	sw	s1,124(a0)
    800044ac:	fc5ff06f          	j	80004470 <push_off+0x34>

00000000800044b0 <pop_off>:
    800044b0:	ff010113          	addi	sp,sp,-16
    800044b4:	00813023          	sd	s0,0(sp)
    800044b8:	00113423          	sd	ra,8(sp)
    800044bc:	01010413          	addi	s0,sp,16
    800044c0:	ffffe097          	auipc	ra,0xffffe
    800044c4:	6ac080e7          	jalr	1708(ra) # 80002b6c <mycpu>
    800044c8:	100027f3          	csrr	a5,sstatus
    800044cc:	0027f793          	andi	a5,a5,2
    800044d0:	04079663          	bnez	a5,8000451c <pop_off+0x6c>
    800044d4:	07852783          	lw	a5,120(a0)
    800044d8:	02f05a63          	blez	a5,8000450c <pop_off+0x5c>
    800044dc:	fff7871b          	addiw	a4,a5,-1
    800044e0:	06e52c23          	sw	a4,120(a0)
    800044e4:	00071c63          	bnez	a4,800044fc <pop_off+0x4c>
    800044e8:	07c52783          	lw	a5,124(a0)
    800044ec:	00078863          	beqz	a5,800044fc <pop_off+0x4c>
    800044f0:	100027f3          	csrr	a5,sstatus
    800044f4:	0027e793          	ori	a5,a5,2
    800044f8:	10079073          	csrw	sstatus,a5
    800044fc:	00813083          	ld	ra,8(sp)
    80004500:	00013403          	ld	s0,0(sp)
    80004504:	01010113          	addi	sp,sp,16
    80004508:	00008067          	ret
    8000450c:	00001517          	auipc	a0,0x1
    80004510:	eac50513          	addi	a0,a0,-340 # 800053b8 <digits+0x48>
    80004514:	fffff097          	auipc	ra,0xfffff
    80004518:	018080e7          	jalr	24(ra) # 8000352c <panic>
    8000451c:	00001517          	auipc	a0,0x1
    80004520:	e8450513          	addi	a0,a0,-380 # 800053a0 <digits+0x30>
    80004524:	fffff097          	auipc	ra,0xfffff
    80004528:	008080e7          	jalr	8(ra) # 8000352c <panic>

000000008000452c <push_on>:
    8000452c:	fe010113          	addi	sp,sp,-32
    80004530:	00813823          	sd	s0,16(sp)
    80004534:	00113c23          	sd	ra,24(sp)
    80004538:	00913423          	sd	s1,8(sp)
    8000453c:	02010413          	addi	s0,sp,32
    80004540:	100024f3          	csrr	s1,sstatus
    80004544:	100027f3          	csrr	a5,sstatus
    80004548:	0027e793          	ori	a5,a5,2
    8000454c:	10079073          	csrw	sstatus,a5
    80004550:	ffffe097          	auipc	ra,0xffffe
    80004554:	61c080e7          	jalr	1564(ra) # 80002b6c <mycpu>
    80004558:	07852783          	lw	a5,120(a0)
    8000455c:	02078663          	beqz	a5,80004588 <push_on+0x5c>
    80004560:	ffffe097          	auipc	ra,0xffffe
    80004564:	60c080e7          	jalr	1548(ra) # 80002b6c <mycpu>
    80004568:	07852783          	lw	a5,120(a0)
    8000456c:	01813083          	ld	ra,24(sp)
    80004570:	01013403          	ld	s0,16(sp)
    80004574:	0017879b          	addiw	a5,a5,1
    80004578:	06f52c23          	sw	a5,120(a0)
    8000457c:	00813483          	ld	s1,8(sp)
    80004580:	02010113          	addi	sp,sp,32
    80004584:	00008067          	ret
    80004588:	0014d493          	srli	s1,s1,0x1
    8000458c:	ffffe097          	auipc	ra,0xffffe
    80004590:	5e0080e7          	jalr	1504(ra) # 80002b6c <mycpu>
    80004594:	0014f493          	andi	s1,s1,1
    80004598:	06952e23          	sw	s1,124(a0)
    8000459c:	fc5ff06f          	j	80004560 <push_on+0x34>

00000000800045a0 <pop_on>:
    800045a0:	ff010113          	addi	sp,sp,-16
    800045a4:	00813023          	sd	s0,0(sp)
    800045a8:	00113423          	sd	ra,8(sp)
    800045ac:	01010413          	addi	s0,sp,16
    800045b0:	ffffe097          	auipc	ra,0xffffe
    800045b4:	5bc080e7          	jalr	1468(ra) # 80002b6c <mycpu>
    800045b8:	100027f3          	csrr	a5,sstatus
    800045bc:	0027f793          	andi	a5,a5,2
    800045c0:	04078463          	beqz	a5,80004608 <pop_on+0x68>
    800045c4:	07852783          	lw	a5,120(a0)
    800045c8:	02f05863          	blez	a5,800045f8 <pop_on+0x58>
    800045cc:	fff7879b          	addiw	a5,a5,-1
    800045d0:	06f52c23          	sw	a5,120(a0)
    800045d4:	07853783          	ld	a5,120(a0)
    800045d8:	00079863          	bnez	a5,800045e8 <pop_on+0x48>
    800045dc:	100027f3          	csrr	a5,sstatus
    800045e0:	ffd7f793          	andi	a5,a5,-3
    800045e4:	10079073          	csrw	sstatus,a5
    800045e8:	00813083          	ld	ra,8(sp)
    800045ec:	00013403          	ld	s0,0(sp)
    800045f0:	01010113          	addi	sp,sp,16
    800045f4:	00008067          	ret
    800045f8:	00001517          	auipc	a0,0x1
    800045fc:	de850513          	addi	a0,a0,-536 # 800053e0 <digits+0x70>
    80004600:	fffff097          	auipc	ra,0xfffff
    80004604:	f2c080e7          	jalr	-212(ra) # 8000352c <panic>
    80004608:	00001517          	auipc	a0,0x1
    8000460c:	db850513          	addi	a0,a0,-584 # 800053c0 <digits+0x50>
    80004610:	fffff097          	auipc	ra,0xfffff
    80004614:	f1c080e7          	jalr	-228(ra) # 8000352c <panic>

0000000080004618 <__memset>:
    80004618:	ff010113          	addi	sp,sp,-16
    8000461c:	00813423          	sd	s0,8(sp)
    80004620:	01010413          	addi	s0,sp,16
    80004624:	1a060e63          	beqz	a2,800047e0 <__memset+0x1c8>
    80004628:	40a007b3          	neg	a5,a0
    8000462c:	0077f793          	andi	a5,a5,7
    80004630:	00778693          	addi	a3,a5,7
    80004634:	00b00813          	li	a6,11
    80004638:	0ff5f593          	andi	a1,a1,255
    8000463c:	fff6071b          	addiw	a4,a2,-1
    80004640:	1b06e663          	bltu	a3,a6,800047ec <__memset+0x1d4>
    80004644:	1cd76463          	bltu	a4,a3,8000480c <__memset+0x1f4>
    80004648:	1a078e63          	beqz	a5,80004804 <__memset+0x1ec>
    8000464c:	00b50023          	sb	a1,0(a0)
    80004650:	00100713          	li	a4,1
    80004654:	1ae78463          	beq	a5,a4,800047fc <__memset+0x1e4>
    80004658:	00b500a3          	sb	a1,1(a0)
    8000465c:	00200713          	li	a4,2
    80004660:	1ae78a63          	beq	a5,a4,80004814 <__memset+0x1fc>
    80004664:	00b50123          	sb	a1,2(a0)
    80004668:	00300713          	li	a4,3
    8000466c:	18e78463          	beq	a5,a4,800047f4 <__memset+0x1dc>
    80004670:	00b501a3          	sb	a1,3(a0)
    80004674:	00400713          	li	a4,4
    80004678:	1ae78263          	beq	a5,a4,8000481c <__memset+0x204>
    8000467c:	00b50223          	sb	a1,4(a0)
    80004680:	00500713          	li	a4,5
    80004684:	1ae78063          	beq	a5,a4,80004824 <__memset+0x20c>
    80004688:	00b502a3          	sb	a1,5(a0)
    8000468c:	00700713          	li	a4,7
    80004690:	18e79e63          	bne	a5,a4,8000482c <__memset+0x214>
    80004694:	00b50323          	sb	a1,6(a0)
    80004698:	00700e93          	li	t4,7
    8000469c:	00859713          	slli	a4,a1,0x8
    800046a0:	00e5e733          	or	a4,a1,a4
    800046a4:	01059e13          	slli	t3,a1,0x10
    800046a8:	01c76e33          	or	t3,a4,t3
    800046ac:	01859313          	slli	t1,a1,0x18
    800046b0:	006e6333          	or	t1,t3,t1
    800046b4:	02059893          	slli	a7,a1,0x20
    800046b8:	40f60e3b          	subw	t3,a2,a5
    800046bc:	011368b3          	or	a7,t1,a7
    800046c0:	02859813          	slli	a6,a1,0x28
    800046c4:	0108e833          	or	a6,a7,a6
    800046c8:	03059693          	slli	a3,a1,0x30
    800046cc:	003e589b          	srliw	a7,t3,0x3
    800046d0:	00d866b3          	or	a3,a6,a3
    800046d4:	03859713          	slli	a4,a1,0x38
    800046d8:	00389813          	slli	a6,a7,0x3
    800046dc:	00f507b3          	add	a5,a0,a5
    800046e0:	00e6e733          	or	a4,a3,a4
    800046e4:	000e089b          	sext.w	a7,t3
    800046e8:	00f806b3          	add	a3,a6,a5
    800046ec:	00e7b023          	sd	a4,0(a5)
    800046f0:	00878793          	addi	a5,a5,8
    800046f4:	fed79ce3          	bne	a5,a3,800046ec <__memset+0xd4>
    800046f8:	ff8e7793          	andi	a5,t3,-8
    800046fc:	0007871b          	sext.w	a4,a5
    80004700:	01d787bb          	addw	a5,a5,t4
    80004704:	0ce88e63          	beq	a7,a4,800047e0 <__memset+0x1c8>
    80004708:	00f50733          	add	a4,a0,a5
    8000470c:	00b70023          	sb	a1,0(a4)
    80004710:	0017871b          	addiw	a4,a5,1
    80004714:	0cc77663          	bgeu	a4,a2,800047e0 <__memset+0x1c8>
    80004718:	00e50733          	add	a4,a0,a4
    8000471c:	00b70023          	sb	a1,0(a4)
    80004720:	0027871b          	addiw	a4,a5,2
    80004724:	0ac77e63          	bgeu	a4,a2,800047e0 <__memset+0x1c8>
    80004728:	00e50733          	add	a4,a0,a4
    8000472c:	00b70023          	sb	a1,0(a4)
    80004730:	0037871b          	addiw	a4,a5,3
    80004734:	0ac77663          	bgeu	a4,a2,800047e0 <__memset+0x1c8>
    80004738:	00e50733          	add	a4,a0,a4
    8000473c:	00b70023          	sb	a1,0(a4)
    80004740:	0047871b          	addiw	a4,a5,4
    80004744:	08c77e63          	bgeu	a4,a2,800047e0 <__memset+0x1c8>
    80004748:	00e50733          	add	a4,a0,a4
    8000474c:	00b70023          	sb	a1,0(a4)
    80004750:	0057871b          	addiw	a4,a5,5
    80004754:	08c77663          	bgeu	a4,a2,800047e0 <__memset+0x1c8>
    80004758:	00e50733          	add	a4,a0,a4
    8000475c:	00b70023          	sb	a1,0(a4)
    80004760:	0067871b          	addiw	a4,a5,6
    80004764:	06c77e63          	bgeu	a4,a2,800047e0 <__memset+0x1c8>
    80004768:	00e50733          	add	a4,a0,a4
    8000476c:	00b70023          	sb	a1,0(a4)
    80004770:	0077871b          	addiw	a4,a5,7
    80004774:	06c77663          	bgeu	a4,a2,800047e0 <__memset+0x1c8>
    80004778:	00e50733          	add	a4,a0,a4
    8000477c:	00b70023          	sb	a1,0(a4)
    80004780:	0087871b          	addiw	a4,a5,8
    80004784:	04c77e63          	bgeu	a4,a2,800047e0 <__memset+0x1c8>
    80004788:	00e50733          	add	a4,a0,a4
    8000478c:	00b70023          	sb	a1,0(a4)
    80004790:	0097871b          	addiw	a4,a5,9
    80004794:	04c77663          	bgeu	a4,a2,800047e0 <__memset+0x1c8>
    80004798:	00e50733          	add	a4,a0,a4
    8000479c:	00b70023          	sb	a1,0(a4)
    800047a0:	00a7871b          	addiw	a4,a5,10
    800047a4:	02c77e63          	bgeu	a4,a2,800047e0 <__memset+0x1c8>
    800047a8:	00e50733          	add	a4,a0,a4
    800047ac:	00b70023          	sb	a1,0(a4)
    800047b0:	00b7871b          	addiw	a4,a5,11
    800047b4:	02c77663          	bgeu	a4,a2,800047e0 <__memset+0x1c8>
    800047b8:	00e50733          	add	a4,a0,a4
    800047bc:	00b70023          	sb	a1,0(a4)
    800047c0:	00c7871b          	addiw	a4,a5,12
    800047c4:	00c77e63          	bgeu	a4,a2,800047e0 <__memset+0x1c8>
    800047c8:	00e50733          	add	a4,a0,a4
    800047cc:	00b70023          	sb	a1,0(a4)
    800047d0:	00d7879b          	addiw	a5,a5,13
    800047d4:	00c7f663          	bgeu	a5,a2,800047e0 <__memset+0x1c8>
    800047d8:	00f507b3          	add	a5,a0,a5
    800047dc:	00b78023          	sb	a1,0(a5)
    800047e0:	00813403          	ld	s0,8(sp)
    800047e4:	01010113          	addi	sp,sp,16
    800047e8:	00008067          	ret
    800047ec:	00b00693          	li	a3,11
    800047f0:	e55ff06f          	j	80004644 <__memset+0x2c>
    800047f4:	00300e93          	li	t4,3
    800047f8:	ea5ff06f          	j	8000469c <__memset+0x84>
    800047fc:	00100e93          	li	t4,1
    80004800:	e9dff06f          	j	8000469c <__memset+0x84>
    80004804:	00000e93          	li	t4,0
    80004808:	e95ff06f          	j	8000469c <__memset+0x84>
    8000480c:	00000793          	li	a5,0
    80004810:	ef9ff06f          	j	80004708 <__memset+0xf0>
    80004814:	00200e93          	li	t4,2
    80004818:	e85ff06f          	j	8000469c <__memset+0x84>
    8000481c:	00400e93          	li	t4,4
    80004820:	e7dff06f          	j	8000469c <__memset+0x84>
    80004824:	00500e93          	li	t4,5
    80004828:	e75ff06f          	j	8000469c <__memset+0x84>
    8000482c:	00600e93          	li	t4,6
    80004830:	e6dff06f          	j	8000469c <__memset+0x84>

0000000080004834 <__memmove>:
    80004834:	ff010113          	addi	sp,sp,-16
    80004838:	00813423          	sd	s0,8(sp)
    8000483c:	01010413          	addi	s0,sp,16
    80004840:	0e060863          	beqz	a2,80004930 <__memmove+0xfc>
    80004844:	fff6069b          	addiw	a3,a2,-1
    80004848:	0006881b          	sext.w	a6,a3
    8000484c:	0ea5e863          	bltu	a1,a0,8000493c <__memmove+0x108>
    80004850:	00758713          	addi	a4,a1,7
    80004854:	00a5e7b3          	or	a5,a1,a0
    80004858:	40a70733          	sub	a4,a4,a0
    8000485c:	0077f793          	andi	a5,a5,7
    80004860:	00f73713          	sltiu	a4,a4,15
    80004864:	00174713          	xori	a4,a4,1
    80004868:	0017b793          	seqz	a5,a5
    8000486c:	00e7f7b3          	and	a5,a5,a4
    80004870:	10078863          	beqz	a5,80004980 <__memmove+0x14c>
    80004874:	00900793          	li	a5,9
    80004878:	1107f463          	bgeu	a5,a6,80004980 <__memmove+0x14c>
    8000487c:	0036581b          	srliw	a6,a2,0x3
    80004880:	fff8081b          	addiw	a6,a6,-1
    80004884:	02081813          	slli	a6,a6,0x20
    80004888:	01d85893          	srli	a7,a6,0x1d
    8000488c:	00858813          	addi	a6,a1,8
    80004890:	00058793          	mv	a5,a1
    80004894:	00050713          	mv	a4,a0
    80004898:	01088833          	add	a6,a7,a6
    8000489c:	0007b883          	ld	a7,0(a5)
    800048a0:	00878793          	addi	a5,a5,8
    800048a4:	00870713          	addi	a4,a4,8
    800048a8:	ff173c23          	sd	a7,-8(a4)
    800048ac:	ff0798e3          	bne	a5,a6,8000489c <__memmove+0x68>
    800048b0:	ff867713          	andi	a4,a2,-8
    800048b4:	02071793          	slli	a5,a4,0x20
    800048b8:	0207d793          	srli	a5,a5,0x20
    800048bc:	00f585b3          	add	a1,a1,a5
    800048c0:	40e686bb          	subw	a3,a3,a4
    800048c4:	00f507b3          	add	a5,a0,a5
    800048c8:	06e60463          	beq	a2,a4,80004930 <__memmove+0xfc>
    800048cc:	0005c703          	lbu	a4,0(a1)
    800048d0:	00e78023          	sb	a4,0(a5)
    800048d4:	04068e63          	beqz	a3,80004930 <__memmove+0xfc>
    800048d8:	0015c603          	lbu	a2,1(a1)
    800048dc:	00100713          	li	a4,1
    800048e0:	00c780a3          	sb	a2,1(a5)
    800048e4:	04e68663          	beq	a3,a4,80004930 <__memmove+0xfc>
    800048e8:	0025c603          	lbu	a2,2(a1)
    800048ec:	00200713          	li	a4,2
    800048f0:	00c78123          	sb	a2,2(a5)
    800048f4:	02e68e63          	beq	a3,a4,80004930 <__memmove+0xfc>
    800048f8:	0035c603          	lbu	a2,3(a1)
    800048fc:	00300713          	li	a4,3
    80004900:	00c781a3          	sb	a2,3(a5)
    80004904:	02e68663          	beq	a3,a4,80004930 <__memmove+0xfc>
    80004908:	0045c603          	lbu	a2,4(a1)
    8000490c:	00400713          	li	a4,4
    80004910:	00c78223          	sb	a2,4(a5)
    80004914:	00e68e63          	beq	a3,a4,80004930 <__memmove+0xfc>
    80004918:	0055c603          	lbu	a2,5(a1)
    8000491c:	00500713          	li	a4,5
    80004920:	00c782a3          	sb	a2,5(a5)
    80004924:	00e68663          	beq	a3,a4,80004930 <__memmove+0xfc>
    80004928:	0065c703          	lbu	a4,6(a1)
    8000492c:	00e78323          	sb	a4,6(a5)
    80004930:	00813403          	ld	s0,8(sp)
    80004934:	01010113          	addi	sp,sp,16
    80004938:	00008067          	ret
    8000493c:	02061713          	slli	a4,a2,0x20
    80004940:	02075713          	srli	a4,a4,0x20
    80004944:	00e587b3          	add	a5,a1,a4
    80004948:	f0f574e3          	bgeu	a0,a5,80004850 <__memmove+0x1c>
    8000494c:	02069613          	slli	a2,a3,0x20
    80004950:	02065613          	srli	a2,a2,0x20
    80004954:	fff64613          	not	a2,a2
    80004958:	00e50733          	add	a4,a0,a4
    8000495c:	00c78633          	add	a2,a5,a2
    80004960:	fff7c683          	lbu	a3,-1(a5)
    80004964:	fff78793          	addi	a5,a5,-1
    80004968:	fff70713          	addi	a4,a4,-1
    8000496c:	00d70023          	sb	a3,0(a4)
    80004970:	fec798e3          	bne	a5,a2,80004960 <__memmove+0x12c>
    80004974:	00813403          	ld	s0,8(sp)
    80004978:	01010113          	addi	sp,sp,16
    8000497c:	00008067          	ret
    80004980:	02069713          	slli	a4,a3,0x20
    80004984:	02075713          	srli	a4,a4,0x20
    80004988:	00170713          	addi	a4,a4,1
    8000498c:	00e50733          	add	a4,a0,a4
    80004990:	00050793          	mv	a5,a0
    80004994:	0005c683          	lbu	a3,0(a1)
    80004998:	00178793          	addi	a5,a5,1
    8000499c:	00158593          	addi	a1,a1,1
    800049a0:	fed78fa3          	sb	a3,-1(a5)
    800049a4:	fee798e3          	bne	a5,a4,80004994 <__memmove+0x160>
    800049a8:	f89ff06f          	j	80004930 <__memmove+0xfc>

00000000800049ac <__putc>:
    800049ac:	fe010113          	addi	sp,sp,-32
    800049b0:	00813823          	sd	s0,16(sp)
    800049b4:	00113c23          	sd	ra,24(sp)
    800049b8:	02010413          	addi	s0,sp,32
    800049bc:	00050793          	mv	a5,a0
    800049c0:	fef40593          	addi	a1,s0,-17
    800049c4:	00100613          	li	a2,1
    800049c8:	00000513          	li	a0,0
    800049cc:	fef407a3          	sb	a5,-17(s0)
    800049d0:	fffff097          	auipc	ra,0xfffff
    800049d4:	b3c080e7          	jalr	-1220(ra) # 8000350c <console_write>
    800049d8:	01813083          	ld	ra,24(sp)
    800049dc:	01013403          	ld	s0,16(sp)
    800049e0:	02010113          	addi	sp,sp,32
    800049e4:	00008067          	ret

00000000800049e8 <__getc>:
    800049e8:	fe010113          	addi	sp,sp,-32
    800049ec:	00813823          	sd	s0,16(sp)
    800049f0:	00113c23          	sd	ra,24(sp)
    800049f4:	02010413          	addi	s0,sp,32
    800049f8:	fe840593          	addi	a1,s0,-24
    800049fc:	00100613          	li	a2,1
    80004a00:	00000513          	li	a0,0
    80004a04:	fffff097          	auipc	ra,0xfffff
    80004a08:	ae8080e7          	jalr	-1304(ra) # 800034ec <console_read>
    80004a0c:	fe844503          	lbu	a0,-24(s0)
    80004a10:	01813083          	ld	ra,24(sp)
    80004a14:	01013403          	ld	s0,16(sp)
    80004a18:	02010113          	addi	sp,sp,32
    80004a1c:	00008067          	ret

0000000080004a20 <console_handler>:
    80004a20:	fe010113          	addi	sp,sp,-32
    80004a24:	00813823          	sd	s0,16(sp)
    80004a28:	00113c23          	sd	ra,24(sp)
    80004a2c:	00913423          	sd	s1,8(sp)
    80004a30:	02010413          	addi	s0,sp,32
    80004a34:	14202773          	csrr	a4,scause
    80004a38:	100027f3          	csrr	a5,sstatus
    80004a3c:	0027f793          	andi	a5,a5,2
    80004a40:	06079e63          	bnez	a5,80004abc <console_handler+0x9c>
    80004a44:	00074c63          	bltz	a4,80004a5c <console_handler+0x3c>
    80004a48:	01813083          	ld	ra,24(sp)
    80004a4c:	01013403          	ld	s0,16(sp)
    80004a50:	00813483          	ld	s1,8(sp)
    80004a54:	02010113          	addi	sp,sp,32
    80004a58:	00008067          	ret
    80004a5c:	0ff77713          	andi	a4,a4,255
    80004a60:	00900793          	li	a5,9
    80004a64:	fef712e3          	bne	a4,a5,80004a48 <console_handler+0x28>
    80004a68:	ffffe097          	auipc	ra,0xffffe
    80004a6c:	6dc080e7          	jalr	1756(ra) # 80003144 <plic_claim>
    80004a70:	00a00793          	li	a5,10
    80004a74:	00050493          	mv	s1,a0
    80004a78:	02f50c63          	beq	a0,a5,80004ab0 <console_handler+0x90>
    80004a7c:	fc0506e3          	beqz	a0,80004a48 <console_handler+0x28>
    80004a80:	00050593          	mv	a1,a0
    80004a84:	00001517          	auipc	a0,0x1
    80004a88:	86450513          	addi	a0,a0,-1948 # 800052e8 <CONSOLE_STATUS+0x2d8>
    80004a8c:	fffff097          	auipc	ra,0xfffff
    80004a90:	afc080e7          	jalr	-1284(ra) # 80003588 <__printf>
    80004a94:	01013403          	ld	s0,16(sp)
    80004a98:	01813083          	ld	ra,24(sp)
    80004a9c:	00048513          	mv	a0,s1
    80004aa0:	00813483          	ld	s1,8(sp)
    80004aa4:	02010113          	addi	sp,sp,32
    80004aa8:	ffffe317          	auipc	t1,0xffffe
    80004aac:	6d430067          	jr	1748(t1) # 8000317c <plic_complete>
    80004ab0:	fffff097          	auipc	ra,0xfffff
    80004ab4:	3e0080e7          	jalr	992(ra) # 80003e90 <uartintr>
    80004ab8:	fddff06f          	j	80004a94 <console_handler+0x74>
    80004abc:	00001517          	auipc	a0,0x1
    80004ac0:	92c50513          	addi	a0,a0,-1748 # 800053e8 <digits+0x78>
    80004ac4:	fffff097          	auipc	ra,0xfffff
    80004ac8:	a68080e7          	jalr	-1432(ra) # 8000352c <panic>
	...
