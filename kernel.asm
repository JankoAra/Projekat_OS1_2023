
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00006117          	auipc	sp,0x6
    80000004:	b3813103          	ld	sp,-1224(sp) # 80005b38 <_GLOBAL_OFFSET_TABLE_+0x10>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	1e8020ef          	jal	ra,80002204 <start>

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
    80001184:	754000ef          	jal	ra,800018d8 <interruptRoutine>
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
    800012cc:	b64080e7          	jalr	-1180(ra) # 80001e2c <_ZN15MemoryAllocator7kmallocEm>
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
	//nema argumenata, samo kod sistemskog poziva
	__asm__ volatile("li a0, 0x12");
    80001324:	01200513          	li	a0,18
	__asm__ volatile("ecall");
    80001328:	00000073          	ecall

	scall();

	int status;
	__asm__ volatile("mv %[status], a0":[status] "=r"(status));
    8000132c:	00050513          	mv	a0,a0
	return status;
}
    80001330:	0005051b          	sext.w	a0,a0
    80001334:	00813403          	ld	s0,8(sp)
    80001338:	01010113          	addi	sp,sp,16
    8000133c:	00008067          	ret

0000000080001340 <_Z15thread_dispatchv>:

void thread_dispatch() {
    80001340:	ff010113          	addi	sp,sp,-16
    80001344:	00813423          	sd	s0,8(sp)
    80001348:	01010413          	addi	s0,sp,16
	//nema argumenata, samo kod sistemskog poziva
	__asm__ volatile("li a0, 0x13");
    8000134c:	01300513          	li	a0,19
	__asm__ volatile("ecall");
    80001350:	00000073          	ecall

	scall();
	//nema povratne vrednosti
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
    8000145c:	e74080e7          	jalr	-396(ra) # 800042cc <__putc>
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
    8000149c:	e34080e7          	jalr	-460(ra) # 800042cc <__putc>
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
    80001524:	dac080e7          	jalr	-596(ra) # 800042cc <__putc>
    80001528:	fe5ff06f          	j	8000150c <_Z12printIntegerm+0x5c>
    }
}
    8000152c:	02813083          	ld	ra,40(sp)
    80001530:	02013403          	ld	s0,32(sp)
    80001534:	01813483          	ld	s1,24(sp)
    80001538:	03010113          	addi	sp,sp,48
    8000153c:	00008067          	ret

0000000080001540 <_ZN9Scheduler3putEP3TCB>:

//Scheduler* Scheduler::singleton = nullptr;
TCB* Scheduler::head = nullptr;
TCB* Scheduler::tail = nullptr;

void Scheduler::put(TCB* tcb) {
    80001540:	ff010113          	addi	sp,sp,-16
    80001544:	00813423          	sd	s0,8(sp)
    80001548:	01010413          	addi	s0,sp,16
	if (tail == nullptr) {
    8000154c:	00004797          	auipc	a5,0x4
    80001550:	6547b783          	ld	a5,1620(a5) # 80005ba0 <_ZN9Scheduler4tailE>
    80001554:	00078e63          	beqz	a5,80001570 <_ZN9Scheduler3putEP3TCB+0x30>
		head = tail = tcb;
	} else {
		tail->nextInScheduler = tcb;
    80001558:	02a7bc23          	sd	a0,56(a5)
		tail = tcb;
    8000155c:	00004797          	auipc	a5,0x4
    80001560:	64a7b223          	sd	a0,1604(a5) # 80005ba0 <_ZN9Scheduler4tailE>
	}
}
    80001564:	00813403          	ld	s0,8(sp)
    80001568:	01010113          	addi	sp,sp,16
    8000156c:	00008067          	ret
		head = tail = tcb;
    80001570:	00004797          	auipc	a5,0x4
    80001574:	63078793          	addi	a5,a5,1584 # 80005ba0 <_ZN9Scheduler4tailE>
    80001578:	00a7b023          	sd	a0,0(a5)
    8000157c:	00a7b423          	sd	a0,8(a5)
    80001580:	fe5ff06f          	j	80001564 <_ZN9Scheduler3putEP3TCB+0x24>

0000000080001584 <_ZN9Scheduler3getEv>:

TCB* Scheduler::get() {
    80001584:	ff010113          	addi	sp,sp,-16
    80001588:	00813423          	sd	s0,8(sp)
    8000158c:	01010413          	addi	s0,sp,16
	TCB* firstThread = head;
    80001590:	00004717          	auipc	a4,0x4
    80001594:	61070713          	addi	a4,a4,1552 # 80005ba0 <_ZN9Scheduler4tailE>
    80001598:	00873503          	ld	a0,8(a4)
	head = head->nextInScheduler;
    8000159c:	03853783          	ld	a5,56(a0) # 1038 <_entry-0x7fffefc8>
    800015a0:	00f73423          	sd	a5,8(a4)
	if (head == nullptr) {
    800015a4:	00078863          	beqz	a5,800015b4 <_ZN9Scheduler3getEv+0x30>
		tail = head = nullptr;
	}
	return firstThread;
    800015a8:	00813403          	ld	s0,8(sp)
    800015ac:	01010113          	addi	sp,sp,16
    800015b0:	00008067          	ret
		tail = head = nullptr;
    800015b4:	00073423          	sd	zero,8(a4)
    800015b8:	00073023          	sd	zero,0(a4)
	return firstThread;
    800015bc:	fedff06f          	j	800015a8 <_ZN9Scheduler3getEv+0x24>

00000000800015c0 <main>:

	printInteger(t1);
}
uint64 sstatus;
#pragma GCC optimize("O0")
int main() {
    800015c0:	fd010113          	addi	sp,sp,-48
    800015c4:	02113423          	sd	ra,40(sp)
    800015c8:	02813023          	sd	s0,32(sp)
    800015cc:	03010413          	addi	s0,sp,48

	__asm__ volatile("csrr %[status], sstatus":[status] "=r"(
			sstatus): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800015d0:	10002373          	csrr	t1,sstatus
    800015d4:	00004797          	auipc	a5,0x4
    800015d8:	5dc78793          	addi	a5,a5,1500 # 80005bb0 <sstatus>
    800015dc:	0067b023          	sd	t1,0(a5)
	//zabrani prekide
	Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    800015e0:	00200513          	li	a0,2
    800015e4:	00000097          	auipc	ra,0x0
    800015e8:	2bc080e7          	jalr	700(ra) # 800018a0 <_ZN5Riscv10mc_sstatusEm>
	__asm__ volatile("csrr %[status], sstatus":[status] "=r"(
			sstatus): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800015ec:	10002373          	csrr	t1,sstatus
    800015f0:	00004797          	auipc	a5,0x4
    800015f4:	5c078793          	addi	a5,a5,1472 # 80005bb0 <sstatus>
    800015f8:	0067b023          	sd	t1,0(a5)
	//postavi adresu prekidne rutine u stvec
	Riscv::w_stvec((uint64)&interruptHandler);
    800015fc:	00004797          	auipc	a5,0x4
    80001600:	5547b783          	ld	a5,1364(a5) # 80005b50 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001604:	00078513          	mv	a0,a5
    80001608:	00000097          	auipc	ra,0x0
    8000160c:	260080e7          	jalr	608(ra) # 80001868 <_ZN5Riscv7w_stvecEm>
	__asm__ volatile("csrr %[status], sstatus":[status] "=r"(
			sstatus): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001610:	10002373          	csrr	t1,sstatus
    80001614:	00004797          	auipc	a5,0x4
    80001618:	59c78793          	addi	a5,a5,1436 # 80005bb0 <sstatus>
    8000161c:	0067b023          	sd	t1,0(a5)
	//omoguci prekide
	Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
    80001620:	00200513          	li	a0,2
    80001624:	00000097          	auipc	ra,0x0
    80001628:	260080e7          	jalr	608(ra) # 80001884 <_ZN5Riscv10ms_sstatusEm>
//	printInteger(*(lista->peekFirst()));
//	delete lista;
//	println("");

	//testiranje kreiranja niti
	thread_t glavnaNit = nullptr;
    8000162c:	fe043023          	sd	zero,-32(s0)
	thread_t nit1 = nullptr;
    80001630:	fc043c23          	sd	zero,-40(s0)
	thread_t nit2 = nullptr;
    80001634:	fc043823          	sd	zero,-48(s0)
	thread_create(&glavnaNit, nullptr, nullptr);
    80001638:	fe040793          	addi	a5,s0,-32
    8000163c:	00000613          	li	a2,0
    80001640:	00000593          	li	a1,0
    80001644:	00078513          	mv	a0,a5
    80001648:	00000097          	auipc	ra,0x0
    8000164c:	c50080e7          	jalr	-944(ra) # 80001298 <_Z13thread_createPP3TCBPFvPvES2_>
	TCB::running = glavnaNit;
    80001650:	fe043703          	ld	a4,-32(s0)
    80001654:	00004797          	auipc	a5,0x4
    80001658:	4ec7b783          	ld	a5,1260(a5) # 80005b40 <_GLOBAL_OFFSET_TABLE_+0x18>
    8000165c:	00e7b023          	sd	a4,0(a5)
	uint64* arg = new uint64;
    80001660:	00800513          	li	a0,8
    80001664:	00000097          	auipc	ra,0x0
    80001668:	518080e7          	jalr	1304(ra) # 80001b7c <_Znwm>
    8000166c:	00050793          	mv	a5,a0
    80001670:	fef43423          	sd	a5,-24(s0)
	*arg = 666;
    80001674:	fe843783          	ld	a5,-24(s0)
    80001678:	29a00713          	li	a4,666
    8000167c:	00e7b023          	sd	a4,0(a5)
	thread_create(&nit1, nit1f, nullptr);
    80001680:	fd840793          	addi	a5,s0,-40
    80001684:	00000613          	li	a2,0
    80001688:	00000597          	auipc	a1,0x0
    8000168c:	0d058593          	addi	a1,a1,208 # 80001758 <_Z5nit1fPv>
    80001690:	00078513          	mv	a0,a5
    80001694:	00000097          	auipc	ra,0x0
    80001698:	c04080e7          	jalr	-1020(ra) # 80001298 <_Z13thread_createPP3TCBPFvPvES2_>
	thread_create(&nit2, nit2f, arg);
    8000169c:	fd040793          	addi	a5,s0,-48
    800016a0:	fe843603          	ld	a2,-24(s0)
    800016a4:	00000597          	auipc	a1,0x0
    800016a8:	12458593          	addi	a1,a1,292 # 800017c8 <_Z5nit2fPv>
    800016ac:	00078513          	mv	a0,a5
    800016b0:	00000097          	auipc	ra,0x0
    800016b4:	be8080e7          	jalr	-1048(ra) # 80001298 <_Z13thread_createPP3TCBPFvPvES2_>
	while(!nit1->isFinished() && !nit2->isFinished()){
    800016b8:	fd843783          	ld	a5,-40(s0)
    800016bc:	00078513          	mv	a0,a5
    800016c0:	00000097          	auipc	ra,0x0
    800016c4:	1fc080e7          	jalr	508(ra) # 800018bc <_ZN3TCB10isFinishedEv>
    800016c8:	00050793          	mv	a5,a0
    800016cc:	0017c793          	xori	a5,a5,1
    800016d0:	0ff7f793          	andi	a5,a5,255
    800016d4:	02078663          	beqz	a5,80001700 <main+0x140>
    800016d8:	fd043783          	ld	a5,-48(s0)
    800016dc:	00078513          	mv	a0,a5
    800016e0:	00000097          	auipc	ra,0x0
    800016e4:	1dc080e7          	jalr	476(ra) # 800018bc <_ZN3TCB10isFinishedEv>
    800016e8:	00050793          	mv	a5,a0
    800016ec:	0017c793          	xori	a5,a5,1
    800016f0:	0ff7f793          	andi	a5,a5,255
    800016f4:	00078663          	beqz	a5,80001700 <main+0x140>
    800016f8:	00100793          	li	a5,1
    800016fc:	0080006f          	j	80001704 <main+0x144>
    80001700:	00000793          	li	a5,0
    80001704:	00078863          	beqz	a5,80001714 <main+0x154>
		thread_dispatch();
    80001708:	00000097          	auipc	ra,0x0
    8000170c:	c38080e7          	jalr	-968(ra) # 80001340 <_Z15thread_dispatchv>
	while(!nit1->isFinished() && !nit2->isFinished()){
    80001710:	fa9ff06f          	j	800016b8 <main+0xf8>
	}
	println("\nProsao while");
    80001714:	00004517          	auipc	a0,0x4
    80001718:	91c50513          	addi	a0,a0,-1764 # 80005030 <_ZZ12printIntegermE6digits+0x10>
    8000171c:	00000097          	auipc	ra,0x0
    80001720:	d60080e7          	jalr	-672(ra) # 8000147c <_Z7printlnPKc>

	//zabrani prekide
	Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    80001724:	00200513          	li	a0,2
    80001728:	00000097          	auipc	ra,0x0
    8000172c:	178080e7          	jalr	376(ra) # 800018a0 <_ZN5Riscv10mc_sstatusEm>
	println("\nSad cu da izadjem");
    80001730:	00004517          	auipc	a0,0x4
    80001734:	91050513          	addi	a0,a0,-1776 # 80005040 <_ZZ12printIntegermE6digits+0x20>
    80001738:	00000097          	auipc	ra,0x0
    8000173c:	d44080e7          	jalr	-700(ra) # 8000147c <_Z7printlnPKc>
	return 0;
    80001740:	00000793          	li	a5,0
    80001744:	00078513          	mv	a0,a5
    80001748:	02813083          	ld	ra,40(sp)
    8000174c:	02013403          	ld	s0,32(sp)
    80001750:	03010113          	addi	sp,sp,48
    80001754:	00008067          	ret

0000000080001758 <_Z5nit1fPv>:
void nit1f(void*) {
    80001758:	fe010113          	addi	sp,sp,-32
    8000175c:	00113c23          	sd	ra,24(sp)
    80001760:	00813823          	sd	s0,16(sp)
    80001764:	02010413          	addi	s0,sp,32
	println("\nusao u nit 1");
    80001768:	00004517          	auipc	a0,0x4
    8000176c:	8f050513          	addi	a0,a0,-1808 # 80005058 <_ZZ12printIntegermE6digits+0x38>
    80001770:	00000097          	auipc	ra,0x0
    80001774:	d0c080e7          	jalr	-756(ra) # 8000147c <_Z7printlnPKc>
	__asm__ volatile("li t1, 100");
    80001778:	06400313          	li	t1,100
	thread_dispatch();
    8000177c:	00000097          	auipc	ra,0x0
    80001780:	bc4080e7          	jalr	-1084(ra) # 80001340 <_Z15thread_dispatchv>
	__asm__ volatile("mv %0, t1":"=r"(t1));
    80001784:	00030793          	mv	a5,t1
    80001788:	fef43423          	sd	a5,-24(s0)
	println("\nopet u niti 1");
    8000178c:	00004517          	auipc	a0,0x4
    80001790:	8dc50513          	addi	a0,a0,-1828 # 80005068 <_ZZ12printIntegermE6digits+0x48>
    80001794:	00000097          	auipc	ra,0x0
    80001798:	ce8080e7          	jalr	-792(ra) # 8000147c <_Z7printlnPKc>
	printString("\nt1 = ");
    8000179c:	00004517          	auipc	a0,0x4
    800017a0:	8dc50513          	addi	a0,a0,-1828 # 80005078 <_ZZ12printIntegermE6digits+0x58>
    800017a4:	00000097          	auipc	ra,0x0
    800017a8:	c94080e7          	jalr	-876(ra) # 80001438 <_Z11printStringPKc>
	printInteger(t1);
    800017ac:	fe843503          	ld	a0,-24(s0)
    800017b0:	00000097          	auipc	ra,0x0
    800017b4:	d00080e7          	jalr	-768(ra) # 800014b0 <_Z12printIntegerm>
}
    800017b8:	01813083          	ld	ra,24(sp)
    800017bc:	01013403          	ld	s0,16(sp)
    800017c0:	02010113          	addi	sp,sp,32
    800017c4:	00008067          	ret

00000000800017c8 <_Z5nit2fPv>:
void nit2f(void* arg2) {
    800017c8:	fd010113          	addi	sp,sp,-48
    800017cc:	02113423          	sd	ra,40(sp)
    800017d0:	02813023          	sd	s0,32(sp)
    800017d4:	00913c23          	sd	s1,24(sp)
    800017d8:	03010413          	addi	s0,sp,48
    800017dc:	00050493          	mv	s1,a0
	println("\nusao u nit 2");
    800017e0:	00004517          	auipc	a0,0x4
    800017e4:	8a050513          	addi	a0,a0,-1888 # 80005080 <_ZZ12printIntegermE6digits+0x60>
    800017e8:	00000097          	auipc	ra,0x0
    800017ec:	c94080e7          	jalr	-876(ra) # 8000147c <_Z7printlnPKc>
	__asm__ volatile("li t1, 200");
    800017f0:	0c800313          	li	t1,200
	printInteger(*(uint64*)arg2);
    800017f4:	0004b503          	ld	a0,0(s1)
    800017f8:	00000097          	auipc	ra,0x0
    800017fc:	cb8080e7          	jalr	-840(ra) # 800014b0 <_Z12printIntegerm>
	*(uint64*)arg2+=10;
    80001800:	0004b783          	ld	a5,0(s1)
    80001804:	00a78793          	addi	a5,a5,10
    80001808:	00f4b023          	sd	a5,0(s1)
	thread_dispatch();
    8000180c:	00000097          	auipc	ra,0x0
    80001810:	b34080e7          	jalr	-1228(ra) # 80001340 <_Z15thread_dispatchv>
	__asm__ volatile("mv %0, t1":"=r"(t1));
    80001814:	00030793          	mv	a5,t1
    80001818:	fcf43c23          	sd	a5,-40(s0)
	println("\nopet u niti 2");
    8000181c:	00004517          	auipc	a0,0x4
    80001820:	87450513          	addi	a0,a0,-1932 # 80005090 <_ZZ12printIntegermE6digits+0x70>
    80001824:	00000097          	auipc	ra,0x0
    80001828:	c58080e7          	jalr	-936(ra) # 8000147c <_Z7printlnPKc>
	printInteger(*(uint64*)arg2);
    8000182c:	0004b503          	ld	a0,0(s1)
    80001830:	00000097          	auipc	ra,0x0
    80001834:	c80080e7          	jalr	-896(ra) # 800014b0 <_Z12printIntegerm>
	printString("\nt1 = ");
    80001838:	00004517          	auipc	a0,0x4
    8000183c:	84050513          	addi	a0,a0,-1984 # 80005078 <_ZZ12printIntegermE6digits+0x58>
    80001840:	00000097          	auipc	ra,0x0
    80001844:	bf8080e7          	jalr	-1032(ra) # 80001438 <_Z11printStringPKc>
	printInteger(t1);
    80001848:	fd843503          	ld	a0,-40(s0)
    8000184c:	00000097          	auipc	ra,0x0
    80001850:	c64080e7          	jalr	-924(ra) # 800014b0 <_Z12printIntegerm>
}
    80001854:	02813083          	ld	ra,40(sp)
    80001858:	02013403          	ld	s0,32(sp)
    8000185c:	01813483          	ld	s1,24(sp)
    80001860:	03010113          	addi	sp,sp,48
    80001864:	00008067          	ret

0000000080001868 <_ZN5Riscv7w_stvecEm>:
	uint64 volatile stvec;
	__asm__ volatile("csrr %[stvec], stvec": [stvec] "=r"(stvec));
	return stvec;
}

inline void Riscv::w_stvec(uint64 stvec) {
    80001868:	ff010113          	addi	sp,sp,-16
    8000186c:	00813423          	sd	s0,8(sp)
    80001870:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrw stvec, %[stvec]": :[stvec] "r"(stvec));
    80001874:	10551073          	csrw	stvec,a0
}
    80001878:	00813403          	ld	s0,8(sp)
    8000187c:	01010113          	addi	sp,sp,16
    80001880:	00008067          	ret

0000000080001884 <_ZN5Riscv10ms_sstatusEm>:

inline void Riscv::w_sip(uint64 sip) {
	__asm__ volatile("csrw sip, %[sip]": :[sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask) {
    80001884:	ff010113          	addi	sp,sp,-16
    80001888:	00813423          	sd	s0,8(sp)
    8000188c:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80001890:	10052073          	csrs	sstatus,a0
}
    80001894:	00813403          	ld	s0,8(sp)
    80001898:	01010113          	addi	sp,sp,16
    8000189c:	00008067          	ret

00000000800018a0 <_ZN5Riscv10mc_sstatusEm>:

inline void Riscv::mc_sstatus(uint64 mask) {
    800018a0:	ff010113          	addi	sp,sp,-16
    800018a4:	00813423          	sd	s0,8(sp)
    800018a8:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    800018ac:	10053073          	csrc	sstatus,a0
}
    800018b0:	00813403          	ld	s0,8(sp)
    800018b4:	01010113          	addi	sp,sp,16
    800018b8:	00008067          	ret

00000000800018bc <_ZN3TCB10isFinishedEv>:
	friend class Scheduler;
	using Body = void (*)(void*);

	static TCB* createThread(Body function, void* args, uint64* stack);

	bool isFinished() { return finished; }
    800018bc:	ff010113          	addi	sp,sp,-16
    800018c0:	00813423          	sd	s0,8(sp)
    800018c4:	01010413          	addi	s0,sp,16
    800018c8:	03054503          	lbu	a0,48(a0)
    800018cc:	00813403          	ld	s0,8(sp)
    800018d0:	01010113          	addi	sp,sp,16
    800018d4:	00008067          	ret

00000000800018d8 <interruptRoutine>:
#include "../h/syscall_c.hpp"
#include "../h/TCB.hpp"

#pragma GCC optimize("O0")

extern "C" void interruptRoutine() {
    800018d8:	f6010113          	addi	sp,sp,-160
    800018dc:	08113c23          	sd	ra,152(sp)
    800018e0:	08813823          	sd	s0,144(sp)
    800018e4:	0a010413          	addi	s0,sp,160
	//uint64 scause = Riscv::r_scause();
	//uint64 sepc = Riscv::r_sepc();
	uint64 scause, sepc, sstatus;
	__asm__ volatile("csrr %[scause], scause":[scause] "=r"(scause): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800018e8:	14202373          	csrr	t1,scause
    800018ec:	fe643423          	sd	t1,-24(s0)
	__asm__ volatile("csrr %[sepc], sepc":[sepc] "=r"(sepc): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800018f0:	14102373          	csrr	t1,sepc
    800018f4:	fe643023          	sd	t1,-32(s0)
	__asm__ volatile("csrr %[status], sstatus":[status] "=r"(
			sstatus): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    800018f8:	10002373          	csrr	t1,sstatus
    800018fc:	fc643c23          	sd	t1,-40(s0)
	uint64 a0, a1, a2, a3, a4, a5, a6, a7;
	__asm__ volatile("mv %[ax], a0":[ax] "=r"(a0): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001900:	00050313          	mv	t1,a0
    80001904:	fc643823          	sd	t1,-48(s0)
	__asm__ volatile("mv %[ax], a1":[ax] "=r"(a1): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001908:	00058313          	mv	t1,a1
    8000190c:	fc643423          	sd	t1,-56(s0)
	__asm__ volatile("mv %[ax], a2":[ax] "=r"(a2): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001910:	00060313          	mv	t1,a2
    80001914:	fc643023          	sd	t1,-64(s0)
	__asm__ volatile("mv %[ax], a3":[ax] "=r"(a3): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001918:	00068313          	mv	t1,a3
    8000191c:	fa643c23          	sd	t1,-72(s0)
	__asm__ volatile("mv %[ax], a4":[ax] "=r"(a4): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001920:	00070313          	mv	t1,a4
    80001924:	fa643823          	sd	t1,-80(s0)
	__asm__ volatile("mv %[ax], a5":[ax] "=r"(a5): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001928:	00078313          	mv	t1,a5
    8000192c:	fa643423          	sd	t1,-88(s0)
	__asm__ volatile("mv %[ax], a6":[ax] "=r"(a6): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001930:	00080313          	mv	t1,a6
    80001934:	fa643023          	sd	t1,-96(s0)
	__asm__ volatile("mv %[ax], a7":[ax] "=r"(a7): : "a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001938:	00088313          	mv	t1,a7
    8000193c:	f8643c23          	sd	t1,-104(s0)

	if (scause == 0x09 || scause == 0x08) {
    80001940:	fe843703          	ld	a4,-24(s0)
    80001944:	00900793          	li	a5,9
    80001948:	00f70863          	beq	a4,a5,80001958 <interruptRoutine+0x80>
    8000194c:	fe843703          	ld	a4,-24(s0)
    80001950:	00800793          	li	a5,8
    80001954:	16f71663          	bne	a4,a5,80001ac0 <interruptRoutine+0x1e8>
		//prekid zbog poziva ecall
		uint64 opCode = a0;
    80001958:	fd043783          	ld	a5,-48(s0)
    8000195c:	f8f43823          	sd	a5,-112(s0)

		switch (opCode) {
    80001960:	f9043703          	ld	a4,-112(s0)
    80001964:	04200793          	li	a5,66
    80001968:	0ee7e063          	bltu	a5,a4,80001a48 <interruptRoutine+0x170>
    8000196c:	f9043783          	ld	a5,-112(s0)
    80001970:	00279713          	slli	a4,a5,0x2
    80001974:	00003797          	auipc	a5,0x3
    80001978:	78878793          	addi	a5,a5,1928 # 800050fc <_ZZ12printIntegermE6digits+0xdc>
    8000197c:	00f707b3          	add	a5,a4,a5
    80001980:	0007a783          	lw	a5,0(a5)
    80001984:	0007871b          	sext.w	a4,a5
    80001988:	00003797          	auipc	a5,0x3
    8000198c:	77478793          	addi	a5,a5,1908 # 800050fc <_ZZ12printIntegermE6digits+0xdc>
    80001990:	00f707b3          	add	a5,a4,a5
    80001994:	00078067          	jr	a5
			case 0x01:
				//mem_alloc
				size_t size;
				size = (size_t)a1;
    80001998:	fc843783          	ld	a5,-56(s0)
    8000199c:	f6f43023          	sd	a5,-160(s0)
				//__asm__ volatile("mv %[size], a1":[size] "=r"(size));
				size = size * MEM_BLOCK_SIZE;
    800019a0:	f6043783          	ld	a5,-160(s0)
    800019a4:	00679793          	slli	a5,a5,0x6
    800019a8:	f6f43023          	sd	a5,-160(s0)
				MemoryAllocator::kmalloc(size);
    800019ac:	f6043503          	ld	a0,-160(s0)
    800019b0:	00000097          	auipc	ra,0x0
    800019b4:	47c080e7          	jalr	1148(ra) # 80001e2c <_ZN15MemoryAllocator7kmallocEm>
				__asm__ volatile("sd a0, 80(s0)");
    800019b8:	04a43823          	sd	a0,80(s0)
				break;
    800019bc:	0e80006f          	j	80001aa4 <interruptRoutine+0x1cc>
			case 0x02:
				//mem_free
				void* ptr;
				ptr = (void*)a1;
    800019c0:	fc843783          	ld	a5,-56(s0)
    800019c4:	f6f43423          	sd	a5,-152(s0)
				//__asm__ volatile("mv %[ptr], a1" :[ptr]"=r"(ptr));
				MemoryAllocator::kfree(ptr);
    800019c8:	f6843503          	ld	a0,-152(s0)
    800019cc:	00000097          	auipc	ra,0x0
    800019d0:	608080e7          	jalr	1544(ra) # 80001fd4 <_ZN15MemoryAllocator5kfreeEPv>
				__asm__ volatile("sd a0, 80(s0)");
    800019d4:	04a43823          	sd	a0,80(s0)
				break;
    800019d8:	0cc0006f          	j	80001aa4 <interruptRoutine+0x1cc>
			case 0x11:
				//thread_create
				thread_t* handle;
				handle = (thread_t*)a1;
    800019dc:	fc843783          	ld	a5,-56(s0)
    800019e0:	f8f43423          	sd	a5,-120(s0)
				void (* function)(void*);
				function = (void (*)(void*))a2;
    800019e4:	fc043783          	ld	a5,-64(s0)
    800019e8:	f8f43023          	sd	a5,-128(s0)
				void* args;
				args = (void*)a3;
    800019ec:	fb843783          	ld	a5,-72(s0)
    800019f0:	f6f43c23          	sd	a5,-136(s0)
				uint64* sp;
				sp = (uint64*)a4;
    800019f4:	fb043783          	ld	a5,-80(s0)
    800019f8:	f6f43823          	sd	a5,-144(s0)

				*handle = TCB::createThread(function, args, sp);
    800019fc:	f7043603          	ld	a2,-144(s0)
    80001a00:	f7843583          	ld	a1,-136(s0)
    80001a04:	f8043503          	ld	a0,-128(s0)
    80001a08:	00000097          	auipc	ra,0x0
    80001a0c:	33c080e7          	jalr	828(ra) # 80001d44 <_ZN3TCB12createThreadEPFvPvES0_Pm>
    80001a10:	00050713          	mv	a4,a0
    80001a14:	f8843783          	ld	a5,-120(s0)
    80001a18:	00e7b023          	sd	a4,0(a5)
				if (*handle != nullptr) {
    80001a1c:	f8843783          	ld	a5,-120(s0)
    80001a20:	0007b783          	ld	a5,0(a5)
    80001a24:	00078663          	beqz	a5,80001a30 <interruptRoutine+0x158>
					__asm__ volatile("li a0, 0");
    80001a28:	00000513          	li	a0,0
    80001a2c:	0080006f          	j	80001a34 <interruptRoutine+0x15c>
				} else {
					__asm__ volatile("li a0, -1");
    80001a30:	fff00513          	li	a0,-1
				}
				__asm__ volatile("sd a0, 80(s0)");
    80001a34:	04a43823          	sd	a0,80(s0)
				break;
    80001a38:	06c0006f          	j	80001aa4 <interruptRoutine+0x1cc>
			case 0x12:
				//thread_exit
				break;
			case 0x13:
				//thread_dispatch
				TCB::yield();
    80001a3c:	00000097          	auipc	ra,0x0
    80001a40:	250080e7          	jalr	592(ra) # 80001c8c <_ZN3TCB5yieldEv>
				break;
    80001a44:	0600006f          	j	80001aa4 <interruptRoutine+0x1cc>
				break;
			case 0x42:
				//putc
				break;
			default:
				printString("\nNepostojeci op code: ");
    80001a48:	00003517          	auipc	a0,0x3
    80001a4c:	65850513          	addi	a0,a0,1624 # 800050a0 <_ZZ12printIntegermE6digits+0x80>
    80001a50:	00000097          	auipc	ra,0x0
    80001a54:	9e8080e7          	jalr	-1560(ra) # 80001438 <_Z11printStringPKc>
				printInteger(opCode);
    80001a58:	f9043503          	ld	a0,-112(s0)
    80001a5c:	00000097          	auipc	ra,0x0
    80001a60:	a54080e7          	jalr	-1452(ra) # 800014b0 <_Z12printIntegerm>
				printString("\nscause: ");
    80001a64:	00003517          	auipc	a0,0x3
    80001a68:	65450513          	addi	a0,a0,1620 # 800050b8 <_ZZ12printIntegermE6digits+0x98>
    80001a6c:	00000097          	auipc	ra,0x0
    80001a70:	9cc080e7          	jalr	-1588(ra) # 80001438 <_Z11printStringPKc>
				printInteger(scause);
    80001a74:	fe843503          	ld	a0,-24(s0)
    80001a78:	00000097          	auipc	ra,0x0
    80001a7c:	a38080e7          	jalr	-1480(ra) # 800014b0 <_Z12printIntegerm>
				printString("\nsepc: ");
    80001a80:	00003517          	auipc	a0,0x3
    80001a84:	64850513          	addi	a0,a0,1608 # 800050c8 <_ZZ12printIntegermE6digits+0xa8>
    80001a88:	00000097          	auipc	ra,0x0
    80001a8c:	9b0080e7          	jalr	-1616(ra) # 80001438 <_Z11printStringPKc>
				printInteger(sepc);
    80001a90:	fe043503          	ld	a0,-32(s0)
    80001a94:	00000097          	auipc	ra,0x0
    80001a98:	a1c080e7          	jalr	-1508(ra) # 800014b0 <_Z12printIntegerm>
				break;
    80001a9c:	0080006f          	j	80001aa4 <interruptRoutine+0x1cc>
				break;
    80001aa0:	00000013          	nop
		}
		//sepc pokazuje na ecall instrukciju, treba preci na sledecu instrukciju
		//sepc += 4;
		__asm__ volatile("addi %[dst], %[src], 0x4":[dst]"=r"(sepc):[src]"r"(
				sepc):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001aa4:	fe043303          	ld	t1,-32(s0)
    80001aa8:	00430313          	addi	t1,t1,4
    80001aac:	fe643023          	sd	t1,-32(s0)
		__asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc):"a5", "a0", "a1", "a2", "a3", "a4", "a6", "a7");
    80001ab0:	fe043303          	ld	t1,-32(s0)
    80001ab4:	14131073          	csrw	sepc,t1
    80001ab8:	00000013          	nop
		printString("scause: ");
		printInteger(scause);
		printString("\nsepc: ");
		printInteger(sepc);
	}
}
    80001abc:	0900006f          	j	80001b4c <interruptRoutine+0x274>
	} else if (scause == (1UL << 63 | 9)) {
    80001ac0:	fe843703          	ld	a4,-24(s0)
    80001ac4:	fff00793          	li	a5,-1
    80001ac8:	03f79793          	slli	a5,a5,0x3f
    80001acc:	00978793          	addi	a5,a5,9
    80001ad0:	00f71863          	bne	a4,a5,80001ae0 <interruptRoutine+0x208>
		console_handler();
    80001ad4:	00003097          	auipc	ra,0x3
    80001ad8:	86c080e7          	jalr	-1940(ra) # 80004340 <console_handler>
}
    80001adc:	0700006f          	j	80001b4c <interruptRoutine+0x274>
	} else if (scause == (1UL << 63 | 1)) {
    80001ae0:	fe843703          	ld	a4,-24(s0)
    80001ae4:	fff00793          	li	a5,-1
    80001ae8:	03f79793          	slli	a5,a5,0x3f
    80001aec:	00178793          	addi	a5,a5,1
    80001af0:	00f71a63          	bne	a4,a5,80001b04 <interruptRoutine+0x22c>
		Riscv::mc_sip(Riscv::SIP_SSIP);
    80001af4:	00200513          	li	a0,2
    80001af8:	00000097          	auipc	ra,0x0
    80001afc:	068080e7          	jalr	104(ra) # 80001b60 <_ZN5Riscv6mc_sipEm>
}
    80001b00:	04c0006f          	j	80001b4c <interruptRoutine+0x274>
		println("\nGreska u prekidnoj rutini");
    80001b04:	00003517          	auipc	a0,0x3
    80001b08:	5cc50513          	addi	a0,a0,1484 # 800050d0 <_ZZ12printIntegermE6digits+0xb0>
    80001b0c:	00000097          	auipc	ra,0x0
    80001b10:	970080e7          	jalr	-1680(ra) # 8000147c <_Z7printlnPKc>
		printString("scause: ");
    80001b14:	00003517          	auipc	a0,0x3
    80001b18:	5dc50513          	addi	a0,a0,1500 # 800050f0 <_ZZ12printIntegermE6digits+0xd0>
    80001b1c:	00000097          	auipc	ra,0x0
    80001b20:	91c080e7          	jalr	-1764(ra) # 80001438 <_Z11printStringPKc>
		printInteger(scause);
    80001b24:	fe843503          	ld	a0,-24(s0)
    80001b28:	00000097          	auipc	ra,0x0
    80001b2c:	988080e7          	jalr	-1656(ra) # 800014b0 <_Z12printIntegerm>
		printString("\nsepc: ");
    80001b30:	00003517          	auipc	a0,0x3
    80001b34:	59850513          	addi	a0,a0,1432 # 800050c8 <_ZZ12printIntegermE6digits+0xa8>
    80001b38:	00000097          	auipc	ra,0x0
    80001b3c:	900080e7          	jalr	-1792(ra) # 80001438 <_Z11printStringPKc>
		printInteger(sepc);
    80001b40:	fe043503          	ld	a0,-32(s0)
    80001b44:	00000097          	auipc	ra,0x0
    80001b48:	96c080e7          	jalr	-1684(ra) # 800014b0 <_Z12printIntegerm>
}
    80001b4c:	00000013          	nop
    80001b50:	09813083          	ld	ra,152(sp)
    80001b54:	09013403          	ld	s0,144(sp)
    80001b58:	0a010113          	addi	sp,sp,160
    80001b5c:	00008067          	ret

0000000080001b60 <_ZN5Riscv6mc_sipEm>:
inline void Riscv::mc_sip(uint64 mask) {
    80001b60:	ff010113          	addi	sp,sp,-16
    80001b64:	00813423          	sd	s0,8(sp)
    80001b68:	01010413          	addi	s0,sp,16
	__asm__ volatile("csrc sip, %[mask]": :[mask] "r"(mask));
    80001b6c:	14453073          	csrc	sip,a0
}
    80001b70:	00813403          	ld	s0,8(sp)
    80001b74:	01010113          	addi	sp,sp,16
    80001b78:	00008067          	ret

0000000080001b7c <_Znwm>:
// Created by os on 5/29/23.
//
#include "../h/syscall_cpp.hpp"

//override globalnog new
void* operator new(size_t size) {
    80001b7c:	ff010113          	addi	sp,sp,-16
    80001b80:	00113423          	sd	ra,8(sp)
    80001b84:	00813023          	sd	s0,0(sp)
    80001b88:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    80001b8c:	fffff097          	auipc	ra,0xfffff
    80001b90:	69c080e7          	jalr	1692(ra) # 80001228 <_Z9mem_allocm>
}
    80001b94:	00813083          	ld	ra,8(sp)
    80001b98:	00013403          	ld	s0,0(sp)
    80001b9c:	01010113          	addi	sp,sp,16
    80001ba0:	00008067          	ret

0000000080001ba4 <_Znam>:

void* operator new[](size_t size) {
    80001ba4:	ff010113          	addi	sp,sp,-16
    80001ba8:	00113423          	sd	ra,8(sp)
    80001bac:	00813023          	sd	s0,0(sp)
    80001bb0:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    80001bb4:	fffff097          	auipc	ra,0xfffff
    80001bb8:	674080e7          	jalr	1652(ra) # 80001228 <_Z9mem_allocm>
}
    80001bbc:	00813083          	ld	ra,8(sp)
    80001bc0:	00013403          	ld	s0,0(sp)
    80001bc4:	01010113          	addi	sp,sp,16
    80001bc8:	00008067          	ret

0000000080001bcc <_ZdlPv>:

void operator delete(void* ptr)noexcept {
    80001bcc:	ff010113          	addi	sp,sp,-16
    80001bd0:	00113423          	sd	ra,8(sp)
    80001bd4:	00813023          	sd	s0,0(sp)
    80001bd8:	01010413          	addi	s0,sp,16
mem_free(ptr);
    80001bdc:	fffff097          	auipc	ra,0xfffff
    80001be0:	68c080e7          	jalr	1676(ra) # 80001268 <_Z8mem_freePv>
}
    80001be4:	00813083          	ld	ra,8(sp)
    80001be8:	00013403          	ld	s0,0(sp)
    80001bec:	01010113          	addi	sp,sp,16
    80001bf0:	00008067          	ret

0000000080001bf4 <_ZdaPv>:

void operator delete[](void* ptr)noexcept {
    80001bf4:	ff010113          	addi	sp,sp,-16
    80001bf8:	00113423          	sd	ra,8(sp)
    80001bfc:	00813023          	sd	s0,0(sp)
    80001c00:	01010413          	addi	s0,sp,16
mem_free(ptr);
    80001c04:	fffff097          	auipc	ra,0xfffff
    80001c08:	664080e7          	jalr	1636(ra) # 80001268 <_Z8mem_freePv>
    80001c0c:	00813083          	ld	ra,8(sp)
    80001c10:	00013403          	ld	s0,0(sp)
    80001c14:	01010113          	addi	sp,sp,16
    80001c18:	00008067          	ret

0000000080001c1c <_ZN3TCB8dispatchEv>:
	TCB* newThread = new TCB(function, args, stack);
	if (function != nullptr) Scheduler::put(newThread);
	return newThread;
}

void TCB::dispatch() {
    80001c1c:	fe010113          	addi	sp,sp,-32
    80001c20:	00113c23          	sd	ra,24(sp)
    80001c24:	00813823          	sd	s0,16(sp)
    80001c28:	00913423          	sd	s1,8(sp)
    80001c2c:	02010413          	addi	s0,sp,32
	TCB* old = TCB::running;
    80001c30:	00004497          	auipc	s1,0x4
    80001c34:	f884b483          	ld	s1,-120(s1) # 80005bb8 <_ZN3TCB7runningE>
    80001c38:	0304c783          	lbu	a5,48(s1)
	if (!old->isFinished() && !old->isBlocked()) {
    80001c3c:	00079663          	bnez	a5,80001c48 <_ZN3TCB8dispatchEv+0x2c>

	void setFinished(bool finish) { this->finished = finish; }

	bool isBlocked() { return blocked; }
    80001c40:	0314c783          	lbu	a5,49(s1)
    80001c44:	02078c63          	beqz	a5,80001c7c <_ZN3TCB8dispatchEv+0x60>
		Scheduler::put(old);
	}
	TCB::running = Scheduler::get();
    80001c48:	00000097          	auipc	ra,0x0
    80001c4c:	93c080e7          	jalr	-1732(ra) # 80001584 <_ZN9Scheduler3getEv>
    80001c50:	00050593          	mv	a1,a0
    80001c54:	00004797          	auipc	a5,0x4
    80001c58:	f6a7b223          	sd	a0,-156(a5) # 80005bb8 <_ZN3TCB7runningE>
	TCB::contextSwitch(&old->context, &running->context);
    80001c5c:	00048513          	mv	a0,s1
    80001c60:	fffff097          	auipc	ra,0xfffff
    80001c64:	5b4080e7          	jalr	1460(ra) # 80001214 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80001c68:	01813083          	ld	ra,24(sp)
    80001c6c:	01013403          	ld	s0,16(sp)
    80001c70:	00813483          	ld	s1,8(sp)
    80001c74:	02010113          	addi	sp,sp,32
    80001c78:	00008067          	ret
		Scheduler::put(old);
    80001c7c:	00048513          	mv	a0,s1
    80001c80:	00000097          	auipc	ra,0x0
    80001c84:	8c0080e7          	jalr	-1856(ra) # 80001540 <_ZN9Scheduler3putEP3TCB>
    80001c88:	fc1ff06f          	j	80001c48 <_ZN3TCB8dispatchEv+0x2c>

0000000080001c8c <_ZN3TCB5yieldEv>:

void TCB::yield() {
    80001c8c:	ff010113          	addi	sp,sp,-16
    80001c90:	00113423          	sd	ra,8(sp)
    80001c94:	00813023          	sd	s0,0(sp)
    80001c98:	01010413          	addi	s0,sp,16
	Riscv::pushRegisters();
    80001c9c:	fffff097          	auipc	ra,0xfffff
    80001ca0:	364080e7          	jalr	868(ra) # 80001000 <_ZN5Riscv13pushRegistersEv>
	TCB::dispatch();
    80001ca4:	00000097          	auipc	ra,0x0
    80001ca8:	f78080e7          	jalr	-136(ra) # 80001c1c <_ZN3TCB8dispatchEv>
	Riscv::popRegisters();
    80001cac:	fffff097          	auipc	ra,0xfffff
    80001cb0:	3d0080e7          	jalr	976(ra) # 8000107c <_ZN5Riscv12popRegistersEv>
}
    80001cb4:	00813083          	ld	ra,8(sp)
    80001cb8:	00013403          	ld	s0,0(sp)
    80001cbc:	01010113          	addi	sp,sp,16
    80001cc0:	00008067          	ret

0000000080001cc4 <_ZN3TCB7wrapperEv>:

void TCB::wrapper() {
    80001cc4:	fe010113          	addi	sp,sp,-32
    80001cc8:	00113c23          	sd	ra,24(sp)
    80001ccc:	00813823          	sd	s0,16(sp)
    80001cd0:	00913423          	sd	s1,8(sp)
    80001cd4:	02010413          	addi	s0,sp,32
	running->threadFunction(running->args);
    80001cd8:	00004497          	auipc	s1,0x4
    80001cdc:	ee048493          	addi	s1,s1,-288 # 80005bb8 <_ZN3TCB7runningE>
    80001ce0:	0004b783          	ld	a5,0(s1)
    80001ce4:	0107b703          	ld	a4,16(a5)
    80001ce8:	0207b503          	ld	a0,32(a5)
    80001cec:	000700e7          	jalr	a4
	running->finished = true;
    80001cf0:	0004b783          	ld	a5,0(s1)
    80001cf4:	00100713          	li	a4,1
    80001cf8:	02e78823          	sb	a4,48(a5)
	TCB::yield();
    80001cfc:	00000097          	auipc	ra,0x0
    80001d00:	f90080e7          	jalr	-112(ra) # 80001c8c <_ZN3TCB5yieldEv>
}
    80001d04:	01813083          	ld	ra,24(sp)
    80001d08:	01013403          	ld	s0,16(sp)
    80001d0c:	00813483          	ld	s1,8(sp)
    80001d10:	02010113          	addi	sp,sp,32
    80001d14:	00008067          	ret

0000000080001d18 <_ZN3TCBnwEm>:

void* TCB::operator new(size_t size) {
    80001d18:	ff010113          	addi	sp,sp,-16
    80001d1c:	00113423          	sd	ra,8(sp)
    80001d20:	00813023          	sd	s0,0(sp)
    80001d24:	01010413          	addi	s0,sp,16
	return MemoryAllocator::kmalloc(size+sizeof(MemoryAllocator::UsedMemSegment));
    80001d28:	01050513          	addi	a0,a0,16
    80001d2c:	00000097          	auipc	ra,0x0
    80001d30:	100080e7          	jalr	256(ra) # 80001e2c <_ZN15MemoryAllocator7kmallocEm>
}
    80001d34:	00813083          	ld	ra,8(sp)
    80001d38:	00013403          	ld	s0,0(sp)
    80001d3c:	01010113          	addi	sp,sp,16
    80001d40:	00008067          	ret

0000000080001d44 <_ZN3TCB12createThreadEPFvPvES0_Pm>:
TCB* TCB::createThread(TCB::Body function, void* args, uint64* stack) {
    80001d44:	fd010113          	addi	sp,sp,-48
    80001d48:	02113423          	sd	ra,40(sp)
    80001d4c:	02813023          	sd	s0,32(sp)
    80001d50:	00913c23          	sd	s1,24(sp)
    80001d54:	01213823          	sd	s2,16(sp)
    80001d58:	01313423          	sd	s3,8(sp)
    80001d5c:	01413023          	sd	s4,0(sp)
    80001d60:	03010413          	addi	s0,sp,48
    80001d64:	00050993          	mv	s3,a0
    80001d68:	00058a13          	mv	s4,a1
    80001d6c:	00060913          	mv	s2,a2
	TCB* newThread = new TCB(function, args, stack);
    80001d70:	04000513          	li	a0,64
    80001d74:	00000097          	auipc	ra,0x0
    80001d78:	fa4080e7          	jalr	-92(ra) # 80001d18 <_ZN3TCBnwEm>
    80001d7c:	00050493          	mv	s1,a0
	bool blocked;            //da li je nit blokirana
	TCB* nextInScheduler;    // pokazivac na sledecu nit u Scheduler-u

	TCB(Body function, void* args, uint64* stack) : threadFunction(function), stack(stack), args(args),
													timeSlice(DEFAULT_TIME_SLICE), finished(false), blocked(false),
													nextInScheduler(nullptr) {
    80001d80:	01353823          	sd	s3,16(a0)
    80001d84:	01253c23          	sd	s2,24(a0)
    80001d88:	03453023          	sd	s4,32(a0)
    80001d8c:	00200793          	li	a5,2
    80001d90:	02f53423          	sd	a5,40(a0)
    80001d94:	02050823          	sb	zero,48(a0)
    80001d98:	020508a3          	sb	zero,49(a0)
    80001d9c:	02053c23          	sd	zero,56(a0)
		//formiranje pocetnog konteksta; specijalni uslovi za main funkciju kojoj se pocetni kontekst automatski formira
		uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
    80001da0:	04098a63          	beqz	s3,80001df4 <_ZN3TCB12createThreadEPFvPvES0_Pm+0xb0>
    80001da4:	00000797          	auipc	a5,0x0
    80001da8:	f2078793          	addi	a5,a5,-224 # 80001cc4 <_ZN3TCB7wrapperEv>
		uint64 startSp = stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0;
    80001dac:	04090863          	beqz	s2,80001dfc <_ZN3TCB12createThreadEPFvPvES0_Pm+0xb8>
    80001db0:	00008637          	lui	a2,0x8
    80001db4:	00c90933          	add	s2,s2,a2
		this->context.ra = startRa;
    80001db8:	00f4b023          	sd	a5,0(s1)
		this->context.sp = startSp;
    80001dbc:	0124b423          	sd	s2,8(s1)
	if (function != nullptr) Scheduler::put(newThread);
    80001dc0:	00098863          	beqz	s3,80001dd0 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x8c>
    80001dc4:	00048513          	mv	a0,s1
    80001dc8:	fffff097          	auipc	ra,0xfffff
    80001dcc:	778080e7          	jalr	1912(ra) # 80001540 <_ZN9Scheduler3putEP3TCB>
}
    80001dd0:	00048513          	mv	a0,s1
    80001dd4:	02813083          	ld	ra,40(sp)
    80001dd8:	02013403          	ld	s0,32(sp)
    80001ddc:	01813483          	ld	s1,24(sp)
    80001de0:	01013903          	ld	s2,16(sp)
    80001de4:	00813983          	ld	s3,8(sp)
    80001de8:	00013a03          	ld	s4,0(sp)
    80001dec:	03010113          	addi	sp,sp,48
    80001df0:	00008067          	ret
		uint64 startRa = threadFunction != nullptr ? (uint64)&wrapper : 0;
    80001df4:	00000793          	li	a5,0
    80001df8:	fb5ff06f          	j	80001dac <_ZN3TCB12createThreadEPFvPvES0_Pm+0x68>
		uint64 startSp = stack != nullptr ? (uint64)&stack[DEFAULT_STACK_SIZE] : 0;
    80001dfc:	00000913          	li	s2,0
    80001e00:	fb9ff06f          	j	80001db8 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x74>

0000000080001e04 <_ZN3TCBdlEPv>:

void TCB::operator delete(void* ptr) {
    80001e04:	ff010113          	addi	sp,sp,-16
    80001e08:	00113423          	sd	ra,8(sp)
    80001e0c:	00813023          	sd	s0,0(sp)
    80001e10:	01010413          	addi	s0,sp,16
	MemoryAllocator::kfree(ptr);
    80001e14:	00000097          	auipc	ra,0x0
    80001e18:	1c0080e7          	jalr	448(ra) # 80001fd4 <_ZN15MemoryAllocator5kfreeEPv>
}
    80001e1c:	00813083          	ld	ra,8(sp)
    80001e20:	00013403          	ld	s0,0(sp)
    80001e24:	01010113          	addi	sp,sp,16
    80001e28:	00008067          	ret

0000000080001e2c <_ZN15MemoryAllocator7kmallocEm>:

bool MemoryAllocator::initialized = false;
MemoryAllocator::FreeMemSegment* MemoryAllocator::freeMemHead = nullptr;
MemoryAllocator::UsedMemSegment* MemoryAllocator::usedMemHead = nullptr;

void* MemoryAllocator::kmalloc(size_t size) {
    80001e2c:	ff010113          	addi	sp,sp,-16
    80001e30:	00813423          	sd	s0,8(sp)
    80001e34:	01010413          	addi	s0,sp,16
	if (size <= 0) return nullptr;
    80001e38:	12050663          	beqz	a0,80001f64 <_ZN15MemoryAllocator7kmallocEm+0x138>

	//pocetna inicijalizacija
	if (!initialized) {
    80001e3c:	00004797          	auipc	a5,0x4
    80001e40:	d8c7c783          	lbu	a5,-628(a5) # 80005bc8 <_ZN15MemoryAllocator11initializedE>
    80001e44:	04079863          	bnez	a5,80001e94 <_ZN15MemoryAllocator7kmallocEm+0x68>
		freeMemHead = (FreeMemSegment*)HEAP_START_ADDR;
    80001e48:	00004617          	auipc	a2,0x4
    80001e4c:	ce863603          	ld	a2,-792(a2) # 80005b30 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001e50:	00063783          	ld	a5,0(a2)
    80001e54:	00004717          	auipc	a4,0x4
    80001e58:	d7470713          	addi	a4,a4,-652 # 80005bc8 <_ZN15MemoryAllocator11initializedE>
    80001e5c:	00f73423          	sd	a5,8(a4)
		freeMemHead->next = nullptr;
    80001e60:	0007b023          	sd	zero,0(a5)
		freeMemHead->prev = nullptr;
    80001e64:	00873683          	ld	a3,8(a4)
    80001e68:	0006b423          	sd	zero,8(a3)
		freeMemHead->size = (char*)HEAP_END_ADDR - (char*)HEAP_START_ADDR - sizeof(FreeMemSegment);
    80001e6c:	00004797          	auipc	a5,0x4
    80001e70:	cdc7b783          	ld	a5,-804(a5) # 80005b48 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001e74:	0007b783          	ld	a5,0(a5)
    80001e78:	00063603          	ld	a2,0(a2)
    80001e7c:	40c787b3          	sub	a5,a5,a2
    80001e80:	fe878793          	addi	a5,a5,-24
    80001e84:	00f6b823          	sd	a5,16(a3)
		usedMemHead = nullptr;
    80001e88:	00073823          	sd	zero,16(a4)

		initialized = true;
    80001e8c:	00100793          	li	a5,1
    80001e90:	00f70023          	sb	a5,0(a4)
	}

	//alokacija uvek zaokruzena na blokove
	//size += sizeof(UsedMemSegment); ;prebaceno u mem_alloc
	size_t blocks = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
    80001e94:	00655793          	srli	a5,a0,0x6
    80001e98:	03f57513          	andi	a0,a0,63
    80001e9c:	00050463          	beqz	a0,80001ea4 <_ZN15MemoryAllocator7kmallocEm+0x78>
    80001ea0:	00100513          	li	a0,1
    80001ea4:	00a78533          	add	a0,a5,a0
	size = blocks * MEM_BLOCK_SIZE;
    80001ea8:	00651793          	slli	a5,a0,0x6

	//trazenje slobodnog segmenta po first-fit algoritmu
	for (FreeMemSegment* current = freeMemHead; current; current = current->next) {
    80001eac:	00004517          	auipc	a0,0x4
    80001eb0:	d2453503          	ld	a0,-732(a0) # 80005bd0 <_ZN15MemoryAllocator11freeMemHeadE>
    80001eb4:	08050a63          	beqz	a0,80001f48 <_ZN15MemoryAllocator7kmallocEm+0x11c>
		if (current->size < size) continue;
    80001eb8:	01053703          	ld	a4,16(a0)
    80001ebc:	06f76263          	bltu	a4,a5,80001f20 <_ZN15MemoryAllocator7kmallocEm+0xf4>

		//pravljenje novog slobodnog fragmenta od ostatka fragmenta
		FreeMemSegment* remainderFree = (FreeMemSegment*)((char*)current + size);
    80001ec0:	00f506b3          	add	a3,a0,a5
		remainderFree->size = current->size - size;
    80001ec4:	40f70733          	sub	a4,a4,a5
    80001ec8:	00e6b823          	sd	a4,16(a3)
		remainderFree->prev = current->prev;
    80001ecc:	00853703          	ld	a4,8(a0)
    80001ed0:	00e6b423          	sd	a4,8(a3)
		if (current->prev) current->prev->next = remainderFree;
    80001ed4:	00070463          	beqz	a4,80001edc <_ZN15MemoryAllocator7kmallocEm+0xb0>
    80001ed8:	00d73023          	sd	a3,0(a4)
		remainderFree->next = current->next;
    80001edc:	00053703          	ld	a4,0(a0)
    80001ee0:	00e6b023          	sd	a4,0(a3)
		if (current->next) current->next->prev = remainderFree;
    80001ee4:	00070463          	beqz	a4,80001eec <_ZN15MemoryAllocator7kmallocEm+0xc0>
    80001ee8:	00d73423          	sd	a3,8(a4)
		if (freeMemHead == current) freeMemHead = remainderFree;
    80001eec:	00004717          	auipc	a4,0x4
    80001ef0:	ce473703          	ld	a4,-796(a4) # 80005bd0 <_ZN15MemoryAllocator11freeMemHeadE>
    80001ef4:	02a70a63          	beq	a4,a0,80001f28 <_ZN15MemoryAllocator7kmallocEm+0xfc>

		//ubacivanje novog fragmenta u listu zauzetih fragmenata
		UsedMemSegment* newFragment = (UsedMemSegment*)current;
		newFragment->size = size;
    80001ef8:	00f53423          	sd	a5,8(a0)
		UsedMemSegment* prevUsed = nullptr;
		for (UsedMemSegment* cur = usedMemHead; cur && cur < newFragment; prevUsed = cur, cur = cur->next);
    80001efc:	00004697          	auipc	a3,0x4
    80001f00:	cdc6b683          	ld	a3,-804(a3) # 80005bd8 <_ZN15MemoryAllocator11usedMemHeadE>
    80001f04:	00068793          	mv	a5,a3
		UsedMemSegment* prevUsed = nullptr;
    80001f08:	00000713          	li	a4,0
		for (UsedMemSegment* cur = usedMemHead; cur && cur < newFragment; prevUsed = cur, cur = cur->next);
    80001f0c:	02078463          	beqz	a5,80001f34 <_ZN15MemoryAllocator7kmallocEm+0x108>
    80001f10:	02a7f263          	bgeu	a5,a0,80001f34 <_ZN15MemoryAllocator7kmallocEm+0x108>
    80001f14:	00078713          	mv	a4,a5
    80001f18:	0007b783          	ld	a5,0(a5)
    80001f1c:	ff1ff06f          	j	80001f0c <_ZN15MemoryAllocator7kmallocEm+0xe0>
	for (FreeMemSegment* current = freeMemHead; current; current = current->next) {
    80001f20:	00053503          	ld	a0,0(a0)
    80001f24:	f91ff06f          	j	80001eb4 <_ZN15MemoryAllocator7kmallocEm+0x88>
		if (freeMemHead == current) freeMemHead = remainderFree;
    80001f28:	00004717          	auipc	a4,0x4
    80001f2c:	cad73423          	sd	a3,-856(a4) # 80005bd0 <_ZN15MemoryAllocator11freeMemHeadE>
    80001f30:	fc9ff06f          	j	80001ef8 <_ZN15MemoryAllocator7kmallocEm+0xcc>
		if (!prevUsed) {
    80001f34:	02070063          	beqz	a4,80001f54 <_ZN15MemoryAllocator7kmallocEm+0x128>
			newFragment->next = usedMemHead;
			usedMemHead = newFragment;
		} else {
			newFragment->next = prevUsed->next;
    80001f38:	00073783          	ld	a5,0(a4)
    80001f3c:	00f53023          	sd	a5,0(a0)
			prevUsed->next = newFragment;
    80001f40:	00a73023          	sd	a0,0(a4)
		}
		return (char*)newFragment + sizeof(UsedMemSegment);
    80001f44:	01050513          	addi	a0,a0,16
	}
	return nullptr;
}
    80001f48:	00813403          	ld	s0,8(sp)
    80001f4c:	01010113          	addi	sp,sp,16
    80001f50:	00008067          	ret
			newFragment->next = usedMemHead;
    80001f54:	00d53023          	sd	a3,0(a0)
			usedMemHead = newFragment;
    80001f58:	00004797          	auipc	a5,0x4
    80001f5c:	c8a7b023          	sd	a0,-896(a5) # 80005bd8 <_ZN15MemoryAllocator11usedMemHeadE>
    80001f60:	fe5ff06f          	j	80001f44 <_ZN15MemoryAllocator7kmallocEm+0x118>
	if (size <= 0) return nullptr;
    80001f64:	00000513          	li	a0,0
    80001f68:	fe1ff06f          	j	80001f48 <_ZN15MemoryAllocator7kmallocEm+0x11c>

0000000080001f6c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>:
	tryToJoin(newFree);
	tryToJoin(prevFree);
	return 0;
}

int MemoryAllocator::tryToJoin(MemoryAllocator::FreeMemSegment* current) {
    80001f6c:	ff010113          	addi	sp,sp,-16
    80001f70:	00813423          	sd	s0,8(sp)
    80001f74:	01010413          	addi	s0,sp,16
	if (!current) return 0;
    80001f78:	04050663          	beqz	a0,80001fc4 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x58>
	bool nextExists = current->next != nullptr;
    80001f7c:	00053783          	ld	a5,0(a0)
	char* nextAddr = (char*)current + current->size;
    80001f80:	01053703          	ld	a4,16(a0)
    80001f84:	00e506b3          	add	a3,a0,a4
	char* cnext = (char*)current->next;
	bool nextIsConnected = (nextAddr == cnext);
	if (nextExists && nextIsConnected) {
    80001f88:	04078263          	beqz	a5,80001fcc <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x60>
    80001f8c:	00d78a63          	beq	a5,a3,80001fa0 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x34>
		current->size += current->next->size;
		current->next = current->next->next;
		if (current->next) current->next->prev = current;
		return 1;
	} else return 0;
    80001f90:	00000513          	li	a0,0
}
    80001f94:	00813403          	ld	s0,8(sp)
    80001f98:	01010113          	addi	sp,sp,16
    80001f9c:	00008067          	ret
		current->size += current->next->size;
    80001fa0:	0107b683          	ld	a3,16(a5)
    80001fa4:	00d70733          	add	a4,a4,a3
    80001fa8:	00e53823          	sd	a4,16(a0)
		current->next = current->next->next;
    80001fac:	0007b783          	ld	a5,0(a5)
    80001fb0:	00f53023          	sd	a5,0(a0)
		if (current->next) current->next->prev = current;
    80001fb4:	00078463          	beqz	a5,80001fbc <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x50>
    80001fb8:	00a7b423          	sd	a0,8(a5)
		return 1;
    80001fbc:	00100513          	li	a0,1
    80001fc0:	fd5ff06f          	j	80001f94 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>
	if (!current) return 0;
    80001fc4:	00000513          	li	a0,0
    80001fc8:	fcdff06f          	j	80001f94 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>
	} else return 0;
    80001fcc:	00000513          	li	a0,0
    80001fd0:	fc5ff06f          	j	80001f94 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>

0000000080001fd4 <_ZN15MemoryAllocator5kfreeEPv>:
	if (!ptr) return 0;
    80001fd4:	10050463          	beqz	a0,800020dc <_ZN15MemoryAllocator5kfreeEPv+0x108>
    80001fd8:	00050693          	mv	a3,a0
	if (!usedMemHead) return -1;
    80001fdc:	00004797          	auipc	a5,0x4
    80001fe0:	bfc7b783          	ld	a5,-1028(a5) # 80005bd8 <_ZN15MemoryAllocator11usedMemHeadE>
    80001fe4:	10078063          	beqz	a5,800020e4 <_ZN15MemoryAllocator5kfreeEPv+0x110>
	ptr = (char*)ptr - sizeof(UsedMemSegment);
    80001fe8:	ff050513          	addi	a0,a0,-16
	UsedMemSegment* prevUsed = nullptr;
    80001fec:	00000713          	li	a4,0
	for (; currentUsed && currentUsed != ptr; prevUsed = currentUsed, currentUsed = currentUsed->next);
    80001ff0:	00078a63          	beqz	a5,80002004 <_ZN15MemoryAllocator5kfreeEPv+0x30>
    80001ff4:	00a78863          	beq	a5,a0,80002004 <_ZN15MemoryAllocator5kfreeEPv+0x30>
    80001ff8:	00078713          	mv	a4,a5
    80001ffc:	0007b783          	ld	a5,0(a5)
    80002000:	ff1ff06f          	j	80001ff0 <_ZN15MemoryAllocator5kfreeEPv+0x1c>
	if (currentUsed != ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    80002004:	0ea79463          	bne	a5,a0,800020ec <_ZN15MemoryAllocator5kfreeEPv+0x118>
int MemoryAllocator::kfree(void* ptr) {
    80002008:	fe010113          	addi	sp,sp,-32
    8000200c:	00113c23          	sd	ra,24(sp)
    80002010:	00813823          	sd	s0,16(sp)
    80002014:	00913423          	sd	s1,8(sp)
    80002018:	02010413          	addi	s0,sp,32
	if (prevUsed) prevUsed->next = currentUsed->next;
    8000201c:	02070863          	beqz	a4,8000204c <_ZN15MemoryAllocator5kfreeEPv+0x78>
    80002020:	0007b783          	ld	a5,0(a5)
    80002024:	00f73023          	sd	a5,0(a4)
	if (!freeMemHead || ptr < (char*)freeMemHead) {
    80002028:	00004797          	auipc	a5,0x4
    8000202c:	ba87b783          	ld	a5,-1112(a5) # 80005bd0 <_ZN15MemoryAllocator11freeMemHeadE>
    80002030:	02078663          	beqz	a5,8000205c <_ZN15MemoryAllocator5kfreeEPv+0x88>
    80002034:	02f56863          	bltu	a0,a5,80002064 <_ZN15MemoryAllocator5kfreeEPv+0x90>
			 prevFree->next != nullptr && ptr > (char*)(prevFree->next); prevFree = prevFree->next);
    80002038:	00078493          	mv	s1,a5
    8000203c:	0007b783          	ld	a5,0(a5)
    80002040:	02078463          	beqz	a5,80002068 <_ZN15MemoryAllocator5kfreeEPv+0x94>
    80002044:	fea7eae3          	bltu	a5,a0,80002038 <_ZN15MemoryAllocator5kfreeEPv+0x64>
    80002048:	0200006f          	j	80002068 <_ZN15MemoryAllocator5kfreeEPv+0x94>
	else usedMemHead = currentUsed->next;
    8000204c:	0007b783          	ld	a5,0(a5)
    80002050:	00004717          	auipc	a4,0x4
    80002054:	b8f73423          	sd	a5,-1144(a4) # 80005bd8 <_ZN15MemoryAllocator11usedMemHeadE>
    80002058:	fd1ff06f          	j	80002028 <_ZN15MemoryAllocator5kfreeEPv+0x54>
		prevFree = nullptr;
    8000205c:	00078493          	mv	s1,a5
    80002060:	0080006f          	j	80002068 <_ZN15MemoryAllocator5kfreeEPv+0x94>
    80002064:	00000493          	li	s1,0
	size_t segmentSize = ((UsedMemSegment*)ptr)->size;
    80002068:	ff86b783          	ld	a5,-8(a3)
	newFree->size = segmentSize;
    8000206c:	00f6b023          	sd	a5,0(a3)
	newFree->prev = prevFree;
    80002070:	fe96bc23          	sd	s1,-8(a3)
	if (prevFree) newFree->next = prevFree->next;
    80002074:	04048663          	beqz	s1,800020c0 <_ZN15MemoryAllocator5kfreeEPv+0xec>
    80002078:	0004b783          	ld	a5,0(s1)
    8000207c:	fef6b823          	sd	a5,-16(a3)
	if (newFree->next) newFree->next->prev = newFree;
    80002080:	ff06b783          	ld	a5,-16(a3)
    80002084:	00078463          	beqz	a5,8000208c <_ZN15MemoryAllocator5kfreeEPv+0xb8>
    80002088:	00a7b423          	sd	a0,8(a5)
	if (prevFree) prevFree->next = newFree;
    8000208c:	04048263          	beqz	s1,800020d0 <_ZN15MemoryAllocator5kfreeEPv+0xfc>
    80002090:	00a4b023          	sd	a0,0(s1)
	tryToJoin(newFree);
    80002094:	00000097          	auipc	ra,0x0
    80002098:	ed8080e7          	jalr	-296(ra) # 80001f6c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
	tryToJoin(prevFree);
    8000209c:	00048513          	mv	a0,s1
    800020a0:	00000097          	auipc	ra,0x0
    800020a4:	ecc080e7          	jalr	-308(ra) # 80001f6c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
	return 0;
    800020a8:	00000513          	li	a0,0
}
    800020ac:	01813083          	ld	ra,24(sp)
    800020b0:	01013403          	ld	s0,16(sp)
    800020b4:	00813483          	ld	s1,8(sp)
    800020b8:	02010113          	addi	sp,sp,32
    800020bc:	00008067          	ret
	else newFree->next = freeMemHead;
    800020c0:	00004797          	auipc	a5,0x4
    800020c4:	b107b783          	ld	a5,-1264(a5) # 80005bd0 <_ZN15MemoryAllocator11freeMemHeadE>
    800020c8:	fef6b823          	sd	a5,-16(a3)
    800020cc:	fb5ff06f          	j	80002080 <_ZN15MemoryAllocator5kfreeEPv+0xac>
	else freeMemHead = newFree;
    800020d0:	00004797          	auipc	a5,0x4
    800020d4:	b0a7b023          	sd	a0,-1280(a5) # 80005bd0 <_ZN15MemoryAllocator11freeMemHeadE>
    800020d8:	fbdff06f          	j	80002094 <_ZN15MemoryAllocator5kfreeEPv+0xc0>
	if (!ptr) return 0;
    800020dc:	00000513          	li	a0,0
    800020e0:	00008067          	ret
	if (!usedMemHead) return -1;
    800020e4:	fff00513          	li	a0,-1
    800020e8:	00008067          	ret
	if (currentUsed != ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    800020ec:	fff00513          	li	a0,-1
}
    800020f0:	00008067          	ret

00000000800020f4 <_Z10testMemoryv>:
// Created by os on 5/29/23.
//
#include "../h/MemoryAllocator.hpp"
#include "../h/helper.hpp"

void testMemory() {
    800020f4:	81010113          	addi	sp,sp,-2032
    800020f8:	7e113423          	sd	ra,2024(sp)
    800020fc:	7e813023          	sd	s0,2016(sp)
    80002100:	7c913c23          	sd	s1,2008(sp)
    80002104:	7f010413          	addi	s0,sp,2032
    80002108:	83010113          	addi	sp,sp,-2000
	const uint64 NumAllocations = 500;    //zasto nece za preko 500????
	const uint64 AllocationSize = 16;

	// Allocate and initialize pointers
	int* allocations[NumAllocations];
	for (uint64 i = 0; i < NumAllocations; ++i)
    8000210c:	00000713          	li	a4,0
    80002110:	1f300793          	li	a5,499
    80002114:	02e7e263          	bltu	a5,a4,80002138 <_Z10testMemoryv+0x44>
		allocations[i] = nullptr;
    80002118:	fffff7b7          	lui	a5,0xfffff
    8000211c:	00371693          	slli	a3,a4,0x3
    80002120:	fe040613          	addi	a2,s0,-32
    80002124:	00f607b3          	add	a5,a2,a5
    80002128:	00d787b3          	add	a5,a5,a3
    8000212c:	0607b023          	sd	zero,96(a5) # fffffffffffff060 <end+0xffffffff7fff8220>
	for (uint64 i = 0; i < NumAllocations; ++i)
    80002130:	00170713          	addi	a4,a4,1
    80002134:	fddff06f          	j	80002110 <_Z10testMemoryv+0x1c>

	// Allocate memory
	for (uint64 i = 0; i < NumAllocations; ++i) {
    80002138:	00000493          	li	s1,0
    8000213c:	1f300793          	li	a5,499
    80002140:	0497e863          	bltu	a5,s1,80002190 <_Z10testMemoryv+0x9c>
		allocations[i] = static_cast<int*>(MemoryAllocator::kmalloc(AllocationSize));
    80002144:	01000513          	li	a0,16
    80002148:	00000097          	auipc	ra,0x0
    8000214c:	ce4080e7          	jalr	-796(ra) # 80001e2c <_ZN15MemoryAllocator7kmallocEm>
    80002150:	fffff737          	lui	a4,0xfffff
    80002154:	00349793          	slli	a5,s1,0x3
    80002158:	fe040693          	addi	a3,s0,-32
    8000215c:	00e68733          	add	a4,a3,a4
    80002160:	00f707b3          	add	a5,a4,a5
    80002164:	06a7b023          	sd	a0,96(a5)
		if (allocations[i] == nullptr) {
    80002168:	00050663          	beqz	a0,80002174 <_Z10testMemoryv+0x80>
	for (uint64 i = 0; i < NumAllocations; ++i) {
    8000216c:	00148493          	addi	s1,s1,1
    80002170:	fcdff06f          	j	8000213c <_Z10testMemoryv+0x48>
			printString("\nAllocation failed for index ");
    80002174:	00003517          	auipc	a0,0x3
    80002178:	09450513          	addi	a0,a0,148 # 80005208 <_ZZ12printIntegermE6digits+0x1e8>
    8000217c:	fffff097          	auipc	ra,0xfffff
    80002180:	2bc080e7          	jalr	700(ra) # 80001438 <_Z11printStringPKc>
			printInteger(i);
    80002184:	00048513          	mv	a0,s1
    80002188:	fffff097          	auipc	ra,0xfffff
    8000218c:	328080e7          	jalr	808(ra) # 800014b0 <_Z12printIntegerm>
	for (uint64 i = 0; i < NumAllocations; ++i) {
    80002190:	00000493          	li	s1,0
    80002194:	0240006f          	j	800021b8 <_Z10testMemoryv+0xc4>

	// Free memory
	for (uint64 i = 0; i < NumAllocations; ++i) {
		if (allocations[i] != nullptr) {
			if (MemoryAllocator::kfree(allocations[i]) != 0) {
				printString("\nDeallocation failed for index ");
    80002198:	00003517          	auipc	a0,0x3
    8000219c:	09050513          	addi	a0,a0,144 # 80005228 <_ZZ12printIntegermE6digits+0x208>
    800021a0:	fffff097          	auipc	ra,0xfffff
    800021a4:	298080e7          	jalr	664(ra) # 80001438 <_Z11printStringPKc>
				printInteger(i);
    800021a8:	00048513          	mv	a0,s1
    800021ac:	fffff097          	auipc	ra,0xfffff
    800021b0:	304080e7          	jalr	772(ra) # 800014b0 <_Z12printIntegerm>
	for (uint64 i = 0; i < NumAllocations; ++i) {
    800021b4:	00148493          	addi	s1,s1,1
    800021b8:	1f300793          	li	a5,499
    800021bc:	0297e863          	bltu	a5,s1,800021ec <_Z10testMemoryv+0xf8>
		if (allocations[i] != nullptr) {
    800021c0:	fffff737          	lui	a4,0xfffff
    800021c4:	00349793          	slli	a5,s1,0x3
    800021c8:	fe040693          	addi	a3,s0,-32
    800021cc:	00e68733          	add	a4,a3,a4
    800021d0:	00f707b3          	add	a5,a4,a5
    800021d4:	0607b503          	ld	a0,96(a5)
    800021d8:	fc050ee3          	beqz	a0,800021b4 <_Z10testMemoryv+0xc0>
			if (MemoryAllocator::kfree(allocations[i]) != 0) {
    800021dc:	00000097          	auipc	ra,0x0
    800021e0:	df8080e7          	jalr	-520(ra) # 80001fd4 <_ZN15MemoryAllocator5kfreeEPv>
    800021e4:	fc0508e3          	beqz	a0,800021b4 <_Z10testMemoryv+0xc0>
    800021e8:	fb1ff06f          	j	80002198 <_Z10testMemoryv+0xa4>
			}
		}
	}
    800021ec:	7d010113          	addi	sp,sp,2000
    800021f0:	7e813083          	ld	ra,2024(sp)
    800021f4:	7e013403          	ld	s0,2016(sp)
    800021f8:	7d813483          	ld	s1,2008(sp)
    800021fc:	7f010113          	addi	sp,sp,2032
    80002200:	00008067          	ret

0000000080002204 <start>:
    80002204:	ff010113          	addi	sp,sp,-16
    80002208:	00813423          	sd	s0,8(sp)
    8000220c:	01010413          	addi	s0,sp,16
    80002210:	300027f3          	csrr	a5,mstatus
    80002214:	ffffe737          	lui	a4,0xffffe
    80002218:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff79bf>
    8000221c:	00e7f7b3          	and	a5,a5,a4
    80002220:	00001737          	lui	a4,0x1
    80002224:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80002228:	00e7e7b3          	or	a5,a5,a4
    8000222c:	30079073          	csrw	mstatus,a5
    80002230:	00000797          	auipc	a5,0x0
    80002234:	16078793          	addi	a5,a5,352 # 80002390 <system_main>
    80002238:	34179073          	csrw	mepc,a5
    8000223c:	00000793          	li	a5,0
    80002240:	18079073          	csrw	satp,a5
    80002244:	000107b7          	lui	a5,0x10
    80002248:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    8000224c:	30279073          	csrw	medeleg,a5
    80002250:	30379073          	csrw	mideleg,a5
    80002254:	104027f3          	csrr	a5,sie
    80002258:	2227e793          	ori	a5,a5,546
    8000225c:	10479073          	csrw	sie,a5
    80002260:	fff00793          	li	a5,-1
    80002264:	00a7d793          	srli	a5,a5,0xa
    80002268:	3b079073          	csrw	pmpaddr0,a5
    8000226c:	00f00793          	li	a5,15
    80002270:	3a079073          	csrw	pmpcfg0,a5
    80002274:	f14027f3          	csrr	a5,mhartid
    80002278:	0200c737          	lui	a4,0x200c
    8000227c:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80002280:	0007869b          	sext.w	a3,a5
    80002284:	00269713          	slli	a4,a3,0x2
    80002288:	000f4637          	lui	a2,0xf4
    8000228c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80002290:	00d70733          	add	a4,a4,a3
    80002294:	0037979b          	slliw	a5,a5,0x3
    80002298:	020046b7          	lui	a3,0x2004
    8000229c:	00d787b3          	add	a5,a5,a3
    800022a0:	00c585b3          	add	a1,a1,a2
    800022a4:	00371693          	slli	a3,a4,0x3
    800022a8:	00004717          	auipc	a4,0x4
    800022ac:	93870713          	addi	a4,a4,-1736 # 80005be0 <timer_scratch>
    800022b0:	00b7b023          	sd	a1,0(a5)
    800022b4:	00d70733          	add	a4,a4,a3
    800022b8:	00f73c23          	sd	a5,24(a4)
    800022bc:	02c73023          	sd	a2,32(a4)
    800022c0:	34071073          	csrw	mscratch,a4
    800022c4:	00000797          	auipc	a5,0x0
    800022c8:	6ec78793          	addi	a5,a5,1772 # 800029b0 <timervec>
    800022cc:	30579073          	csrw	mtvec,a5
    800022d0:	300027f3          	csrr	a5,mstatus
    800022d4:	0087e793          	ori	a5,a5,8
    800022d8:	30079073          	csrw	mstatus,a5
    800022dc:	304027f3          	csrr	a5,mie
    800022e0:	0807e793          	ori	a5,a5,128
    800022e4:	30479073          	csrw	mie,a5
    800022e8:	f14027f3          	csrr	a5,mhartid
    800022ec:	0007879b          	sext.w	a5,a5
    800022f0:	00078213          	mv	tp,a5
    800022f4:	30200073          	mret
    800022f8:	00813403          	ld	s0,8(sp)
    800022fc:	01010113          	addi	sp,sp,16
    80002300:	00008067          	ret

0000000080002304 <timerinit>:
    80002304:	ff010113          	addi	sp,sp,-16
    80002308:	00813423          	sd	s0,8(sp)
    8000230c:	01010413          	addi	s0,sp,16
    80002310:	f14027f3          	csrr	a5,mhartid
    80002314:	0200c737          	lui	a4,0x200c
    80002318:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    8000231c:	0007869b          	sext.w	a3,a5
    80002320:	00269713          	slli	a4,a3,0x2
    80002324:	000f4637          	lui	a2,0xf4
    80002328:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    8000232c:	00d70733          	add	a4,a4,a3
    80002330:	0037979b          	slliw	a5,a5,0x3
    80002334:	020046b7          	lui	a3,0x2004
    80002338:	00d787b3          	add	a5,a5,a3
    8000233c:	00c585b3          	add	a1,a1,a2
    80002340:	00371693          	slli	a3,a4,0x3
    80002344:	00004717          	auipc	a4,0x4
    80002348:	89c70713          	addi	a4,a4,-1892 # 80005be0 <timer_scratch>
    8000234c:	00b7b023          	sd	a1,0(a5)
    80002350:	00d70733          	add	a4,a4,a3
    80002354:	00f73c23          	sd	a5,24(a4)
    80002358:	02c73023          	sd	a2,32(a4)
    8000235c:	34071073          	csrw	mscratch,a4
    80002360:	00000797          	auipc	a5,0x0
    80002364:	65078793          	addi	a5,a5,1616 # 800029b0 <timervec>
    80002368:	30579073          	csrw	mtvec,a5
    8000236c:	300027f3          	csrr	a5,mstatus
    80002370:	0087e793          	ori	a5,a5,8
    80002374:	30079073          	csrw	mstatus,a5
    80002378:	304027f3          	csrr	a5,mie
    8000237c:	0807e793          	ori	a5,a5,128
    80002380:	30479073          	csrw	mie,a5
    80002384:	00813403          	ld	s0,8(sp)
    80002388:	01010113          	addi	sp,sp,16
    8000238c:	00008067          	ret

0000000080002390 <system_main>:
    80002390:	fe010113          	addi	sp,sp,-32
    80002394:	00813823          	sd	s0,16(sp)
    80002398:	00913423          	sd	s1,8(sp)
    8000239c:	00113c23          	sd	ra,24(sp)
    800023a0:	02010413          	addi	s0,sp,32
    800023a4:	00000097          	auipc	ra,0x0
    800023a8:	0c4080e7          	jalr	196(ra) # 80002468 <cpuid>
    800023ac:	00003497          	auipc	s1,0x3
    800023b0:	7c448493          	addi	s1,s1,1988 # 80005b70 <started>
    800023b4:	02050263          	beqz	a0,800023d8 <system_main+0x48>
    800023b8:	0004a783          	lw	a5,0(s1)
    800023bc:	0007879b          	sext.w	a5,a5
    800023c0:	fe078ce3          	beqz	a5,800023b8 <system_main+0x28>
    800023c4:	0ff0000f          	fence
    800023c8:	00003517          	auipc	a0,0x3
    800023cc:	eb050513          	addi	a0,a0,-336 # 80005278 <_ZZ12printIntegermE6digits+0x258>
    800023d0:	00001097          	auipc	ra,0x1
    800023d4:	a7c080e7          	jalr	-1412(ra) # 80002e4c <panic>
    800023d8:	00001097          	auipc	ra,0x1
    800023dc:	9d0080e7          	jalr	-1584(ra) # 80002da8 <consoleinit>
    800023e0:	00001097          	auipc	ra,0x1
    800023e4:	15c080e7          	jalr	348(ra) # 8000353c <printfinit>
    800023e8:	00003517          	auipc	a0,0x3
    800023ec:	f7050513          	addi	a0,a0,-144 # 80005358 <_ZZ12printIntegermE6digits+0x338>
    800023f0:	00001097          	auipc	ra,0x1
    800023f4:	ab8080e7          	jalr	-1352(ra) # 80002ea8 <__printf>
    800023f8:	00003517          	auipc	a0,0x3
    800023fc:	e5050513          	addi	a0,a0,-432 # 80005248 <_ZZ12printIntegermE6digits+0x228>
    80002400:	00001097          	auipc	ra,0x1
    80002404:	aa8080e7          	jalr	-1368(ra) # 80002ea8 <__printf>
    80002408:	00003517          	auipc	a0,0x3
    8000240c:	f5050513          	addi	a0,a0,-176 # 80005358 <_ZZ12printIntegermE6digits+0x338>
    80002410:	00001097          	auipc	ra,0x1
    80002414:	a98080e7          	jalr	-1384(ra) # 80002ea8 <__printf>
    80002418:	00001097          	auipc	ra,0x1
    8000241c:	4b0080e7          	jalr	1200(ra) # 800038c8 <kinit>
    80002420:	00000097          	auipc	ra,0x0
    80002424:	148080e7          	jalr	328(ra) # 80002568 <trapinit>
    80002428:	00000097          	auipc	ra,0x0
    8000242c:	16c080e7          	jalr	364(ra) # 80002594 <trapinithart>
    80002430:	00000097          	auipc	ra,0x0
    80002434:	5c0080e7          	jalr	1472(ra) # 800029f0 <plicinit>
    80002438:	00000097          	auipc	ra,0x0
    8000243c:	5e0080e7          	jalr	1504(ra) # 80002a18 <plicinithart>
    80002440:	00000097          	auipc	ra,0x0
    80002444:	078080e7          	jalr	120(ra) # 800024b8 <userinit>
    80002448:	0ff0000f          	fence
    8000244c:	00100793          	li	a5,1
    80002450:	00003517          	auipc	a0,0x3
    80002454:	e1050513          	addi	a0,a0,-496 # 80005260 <_ZZ12printIntegermE6digits+0x240>
    80002458:	00f4a023          	sw	a5,0(s1)
    8000245c:	00001097          	auipc	ra,0x1
    80002460:	a4c080e7          	jalr	-1460(ra) # 80002ea8 <__printf>
    80002464:	0000006f          	j	80002464 <system_main+0xd4>

0000000080002468 <cpuid>:
    80002468:	ff010113          	addi	sp,sp,-16
    8000246c:	00813423          	sd	s0,8(sp)
    80002470:	01010413          	addi	s0,sp,16
    80002474:	00020513          	mv	a0,tp
    80002478:	00813403          	ld	s0,8(sp)
    8000247c:	0005051b          	sext.w	a0,a0
    80002480:	01010113          	addi	sp,sp,16
    80002484:	00008067          	ret

0000000080002488 <mycpu>:
    80002488:	ff010113          	addi	sp,sp,-16
    8000248c:	00813423          	sd	s0,8(sp)
    80002490:	01010413          	addi	s0,sp,16
    80002494:	00020793          	mv	a5,tp
    80002498:	00813403          	ld	s0,8(sp)
    8000249c:	0007879b          	sext.w	a5,a5
    800024a0:	00779793          	slli	a5,a5,0x7
    800024a4:	00004517          	auipc	a0,0x4
    800024a8:	76c50513          	addi	a0,a0,1900 # 80006c10 <cpus>
    800024ac:	00f50533          	add	a0,a0,a5
    800024b0:	01010113          	addi	sp,sp,16
    800024b4:	00008067          	ret

00000000800024b8 <userinit>:
    800024b8:	ff010113          	addi	sp,sp,-16
    800024bc:	00813423          	sd	s0,8(sp)
    800024c0:	01010413          	addi	s0,sp,16
    800024c4:	00813403          	ld	s0,8(sp)
    800024c8:	01010113          	addi	sp,sp,16
    800024cc:	fffff317          	auipc	t1,0xfffff
    800024d0:	0f430067          	jr	244(t1) # 800015c0 <main>

00000000800024d4 <either_copyout>:
    800024d4:	ff010113          	addi	sp,sp,-16
    800024d8:	00813023          	sd	s0,0(sp)
    800024dc:	00113423          	sd	ra,8(sp)
    800024e0:	01010413          	addi	s0,sp,16
    800024e4:	02051663          	bnez	a0,80002510 <either_copyout+0x3c>
    800024e8:	00058513          	mv	a0,a1
    800024ec:	00060593          	mv	a1,a2
    800024f0:	0006861b          	sext.w	a2,a3
    800024f4:	00002097          	auipc	ra,0x2
    800024f8:	c60080e7          	jalr	-928(ra) # 80004154 <__memmove>
    800024fc:	00813083          	ld	ra,8(sp)
    80002500:	00013403          	ld	s0,0(sp)
    80002504:	00000513          	li	a0,0
    80002508:	01010113          	addi	sp,sp,16
    8000250c:	00008067          	ret
    80002510:	00003517          	auipc	a0,0x3
    80002514:	d9050513          	addi	a0,a0,-624 # 800052a0 <_ZZ12printIntegermE6digits+0x280>
    80002518:	00001097          	auipc	ra,0x1
    8000251c:	934080e7          	jalr	-1740(ra) # 80002e4c <panic>

0000000080002520 <either_copyin>:
    80002520:	ff010113          	addi	sp,sp,-16
    80002524:	00813023          	sd	s0,0(sp)
    80002528:	00113423          	sd	ra,8(sp)
    8000252c:	01010413          	addi	s0,sp,16
    80002530:	02059463          	bnez	a1,80002558 <either_copyin+0x38>
    80002534:	00060593          	mv	a1,a2
    80002538:	0006861b          	sext.w	a2,a3
    8000253c:	00002097          	auipc	ra,0x2
    80002540:	c18080e7          	jalr	-1000(ra) # 80004154 <__memmove>
    80002544:	00813083          	ld	ra,8(sp)
    80002548:	00013403          	ld	s0,0(sp)
    8000254c:	00000513          	li	a0,0
    80002550:	01010113          	addi	sp,sp,16
    80002554:	00008067          	ret
    80002558:	00003517          	auipc	a0,0x3
    8000255c:	d7050513          	addi	a0,a0,-656 # 800052c8 <_ZZ12printIntegermE6digits+0x2a8>
    80002560:	00001097          	auipc	ra,0x1
    80002564:	8ec080e7          	jalr	-1812(ra) # 80002e4c <panic>

0000000080002568 <trapinit>:
    80002568:	ff010113          	addi	sp,sp,-16
    8000256c:	00813423          	sd	s0,8(sp)
    80002570:	01010413          	addi	s0,sp,16
    80002574:	00813403          	ld	s0,8(sp)
    80002578:	00003597          	auipc	a1,0x3
    8000257c:	d7858593          	addi	a1,a1,-648 # 800052f0 <_ZZ12printIntegermE6digits+0x2d0>
    80002580:	00004517          	auipc	a0,0x4
    80002584:	71050513          	addi	a0,a0,1808 # 80006c90 <tickslock>
    80002588:	01010113          	addi	sp,sp,16
    8000258c:	00001317          	auipc	t1,0x1
    80002590:	5cc30067          	jr	1484(t1) # 80003b58 <initlock>

0000000080002594 <trapinithart>:
    80002594:	ff010113          	addi	sp,sp,-16
    80002598:	00813423          	sd	s0,8(sp)
    8000259c:	01010413          	addi	s0,sp,16
    800025a0:	00000797          	auipc	a5,0x0
    800025a4:	30078793          	addi	a5,a5,768 # 800028a0 <kernelvec>
    800025a8:	10579073          	csrw	stvec,a5
    800025ac:	00813403          	ld	s0,8(sp)
    800025b0:	01010113          	addi	sp,sp,16
    800025b4:	00008067          	ret

00000000800025b8 <usertrap>:
    800025b8:	ff010113          	addi	sp,sp,-16
    800025bc:	00813423          	sd	s0,8(sp)
    800025c0:	01010413          	addi	s0,sp,16
    800025c4:	00813403          	ld	s0,8(sp)
    800025c8:	01010113          	addi	sp,sp,16
    800025cc:	00008067          	ret

00000000800025d0 <usertrapret>:
    800025d0:	ff010113          	addi	sp,sp,-16
    800025d4:	00813423          	sd	s0,8(sp)
    800025d8:	01010413          	addi	s0,sp,16
    800025dc:	00813403          	ld	s0,8(sp)
    800025e0:	01010113          	addi	sp,sp,16
    800025e4:	00008067          	ret

00000000800025e8 <kerneltrap>:
    800025e8:	fe010113          	addi	sp,sp,-32
    800025ec:	00813823          	sd	s0,16(sp)
    800025f0:	00113c23          	sd	ra,24(sp)
    800025f4:	00913423          	sd	s1,8(sp)
    800025f8:	02010413          	addi	s0,sp,32
    800025fc:	142025f3          	csrr	a1,scause
    80002600:	100027f3          	csrr	a5,sstatus
    80002604:	0027f793          	andi	a5,a5,2
    80002608:	10079c63          	bnez	a5,80002720 <kerneltrap+0x138>
    8000260c:	142027f3          	csrr	a5,scause
    80002610:	0207ce63          	bltz	a5,8000264c <kerneltrap+0x64>
    80002614:	00003517          	auipc	a0,0x3
    80002618:	d2450513          	addi	a0,a0,-732 # 80005338 <_ZZ12printIntegermE6digits+0x318>
    8000261c:	00001097          	auipc	ra,0x1
    80002620:	88c080e7          	jalr	-1908(ra) # 80002ea8 <__printf>
    80002624:	141025f3          	csrr	a1,sepc
    80002628:	14302673          	csrr	a2,stval
    8000262c:	00003517          	auipc	a0,0x3
    80002630:	d1c50513          	addi	a0,a0,-740 # 80005348 <_ZZ12printIntegermE6digits+0x328>
    80002634:	00001097          	auipc	ra,0x1
    80002638:	874080e7          	jalr	-1932(ra) # 80002ea8 <__printf>
    8000263c:	00003517          	auipc	a0,0x3
    80002640:	d2450513          	addi	a0,a0,-732 # 80005360 <_ZZ12printIntegermE6digits+0x340>
    80002644:	00001097          	auipc	ra,0x1
    80002648:	808080e7          	jalr	-2040(ra) # 80002e4c <panic>
    8000264c:	0ff7f713          	andi	a4,a5,255
    80002650:	00900693          	li	a3,9
    80002654:	04d70063          	beq	a4,a3,80002694 <kerneltrap+0xac>
    80002658:	fff00713          	li	a4,-1
    8000265c:	03f71713          	slli	a4,a4,0x3f
    80002660:	00170713          	addi	a4,a4,1
    80002664:	fae798e3          	bne	a5,a4,80002614 <kerneltrap+0x2c>
    80002668:	00000097          	auipc	ra,0x0
    8000266c:	e00080e7          	jalr	-512(ra) # 80002468 <cpuid>
    80002670:	06050663          	beqz	a0,800026dc <kerneltrap+0xf4>
    80002674:	144027f3          	csrr	a5,sip
    80002678:	ffd7f793          	andi	a5,a5,-3
    8000267c:	14479073          	csrw	sip,a5
    80002680:	01813083          	ld	ra,24(sp)
    80002684:	01013403          	ld	s0,16(sp)
    80002688:	00813483          	ld	s1,8(sp)
    8000268c:	02010113          	addi	sp,sp,32
    80002690:	00008067          	ret
    80002694:	00000097          	auipc	ra,0x0
    80002698:	3d0080e7          	jalr	976(ra) # 80002a64 <plic_claim>
    8000269c:	00a00793          	li	a5,10
    800026a0:	00050493          	mv	s1,a0
    800026a4:	06f50863          	beq	a0,a5,80002714 <kerneltrap+0x12c>
    800026a8:	fc050ce3          	beqz	a0,80002680 <kerneltrap+0x98>
    800026ac:	00050593          	mv	a1,a0
    800026b0:	00003517          	auipc	a0,0x3
    800026b4:	c6850513          	addi	a0,a0,-920 # 80005318 <_ZZ12printIntegermE6digits+0x2f8>
    800026b8:	00000097          	auipc	ra,0x0
    800026bc:	7f0080e7          	jalr	2032(ra) # 80002ea8 <__printf>
    800026c0:	01013403          	ld	s0,16(sp)
    800026c4:	01813083          	ld	ra,24(sp)
    800026c8:	00048513          	mv	a0,s1
    800026cc:	00813483          	ld	s1,8(sp)
    800026d0:	02010113          	addi	sp,sp,32
    800026d4:	00000317          	auipc	t1,0x0
    800026d8:	3c830067          	jr	968(t1) # 80002a9c <plic_complete>
    800026dc:	00004517          	auipc	a0,0x4
    800026e0:	5b450513          	addi	a0,a0,1460 # 80006c90 <tickslock>
    800026e4:	00001097          	auipc	ra,0x1
    800026e8:	498080e7          	jalr	1176(ra) # 80003b7c <acquire>
    800026ec:	00003717          	auipc	a4,0x3
    800026f0:	48870713          	addi	a4,a4,1160 # 80005b74 <ticks>
    800026f4:	00072783          	lw	a5,0(a4)
    800026f8:	00004517          	auipc	a0,0x4
    800026fc:	59850513          	addi	a0,a0,1432 # 80006c90 <tickslock>
    80002700:	0017879b          	addiw	a5,a5,1
    80002704:	00f72023          	sw	a5,0(a4)
    80002708:	00001097          	auipc	ra,0x1
    8000270c:	540080e7          	jalr	1344(ra) # 80003c48 <release>
    80002710:	f65ff06f          	j	80002674 <kerneltrap+0x8c>
    80002714:	00001097          	auipc	ra,0x1
    80002718:	09c080e7          	jalr	156(ra) # 800037b0 <uartintr>
    8000271c:	fa5ff06f          	j	800026c0 <kerneltrap+0xd8>
    80002720:	00003517          	auipc	a0,0x3
    80002724:	bd850513          	addi	a0,a0,-1064 # 800052f8 <_ZZ12printIntegermE6digits+0x2d8>
    80002728:	00000097          	auipc	ra,0x0
    8000272c:	724080e7          	jalr	1828(ra) # 80002e4c <panic>

0000000080002730 <clockintr>:
    80002730:	fe010113          	addi	sp,sp,-32
    80002734:	00813823          	sd	s0,16(sp)
    80002738:	00913423          	sd	s1,8(sp)
    8000273c:	00113c23          	sd	ra,24(sp)
    80002740:	02010413          	addi	s0,sp,32
    80002744:	00004497          	auipc	s1,0x4
    80002748:	54c48493          	addi	s1,s1,1356 # 80006c90 <tickslock>
    8000274c:	00048513          	mv	a0,s1
    80002750:	00001097          	auipc	ra,0x1
    80002754:	42c080e7          	jalr	1068(ra) # 80003b7c <acquire>
    80002758:	00003717          	auipc	a4,0x3
    8000275c:	41c70713          	addi	a4,a4,1052 # 80005b74 <ticks>
    80002760:	00072783          	lw	a5,0(a4)
    80002764:	01013403          	ld	s0,16(sp)
    80002768:	01813083          	ld	ra,24(sp)
    8000276c:	00048513          	mv	a0,s1
    80002770:	0017879b          	addiw	a5,a5,1
    80002774:	00813483          	ld	s1,8(sp)
    80002778:	00f72023          	sw	a5,0(a4)
    8000277c:	02010113          	addi	sp,sp,32
    80002780:	00001317          	auipc	t1,0x1
    80002784:	4c830067          	jr	1224(t1) # 80003c48 <release>

0000000080002788 <devintr>:
    80002788:	142027f3          	csrr	a5,scause
    8000278c:	00000513          	li	a0,0
    80002790:	0007c463          	bltz	a5,80002798 <devintr+0x10>
    80002794:	00008067          	ret
    80002798:	fe010113          	addi	sp,sp,-32
    8000279c:	00813823          	sd	s0,16(sp)
    800027a0:	00113c23          	sd	ra,24(sp)
    800027a4:	00913423          	sd	s1,8(sp)
    800027a8:	02010413          	addi	s0,sp,32
    800027ac:	0ff7f713          	andi	a4,a5,255
    800027b0:	00900693          	li	a3,9
    800027b4:	04d70c63          	beq	a4,a3,8000280c <devintr+0x84>
    800027b8:	fff00713          	li	a4,-1
    800027bc:	03f71713          	slli	a4,a4,0x3f
    800027c0:	00170713          	addi	a4,a4,1
    800027c4:	00e78c63          	beq	a5,a4,800027dc <devintr+0x54>
    800027c8:	01813083          	ld	ra,24(sp)
    800027cc:	01013403          	ld	s0,16(sp)
    800027d0:	00813483          	ld	s1,8(sp)
    800027d4:	02010113          	addi	sp,sp,32
    800027d8:	00008067          	ret
    800027dc:	00000097          	auipc	ra,0x0
    800027e0:	c8c080e7          	jalr	-884(ra) # 80002468 <cpuid>
    800027e4:	06050663          	beqz	a0,80002850 <devintr+0xc8>
    800027e8:	144027f3          	csrr	a5,sip
    800027ec:	ffd7f793          	andi	a5,a5,-3
    800027f0:	14479073          	csrw	sip,a5
    800027f4:	01813083          	ld	ra,24(sp)
    800027f8:	01013403          	ld	s0,16(sp)
    800027fc:	00813483          	ld	s1,8(sp)
    80002800:	00200513          	li	a0,2
    80002804:	02010113          	addi	sp,sp,32
    80002808:	00008067          	ret
    8000280c:	00000097          	auipc	ra,0x0
    80002810:	258080e7          	jalr	600(ra) # 80002a64 <plic_claim>
    80002814:	00a00793          	li	a5,10
    80002818:	00050493          	mv	s1,a0
    8000281c:	06f50663          	beq	a0,a5,80002888 <devintr+0x100>
    80002820:	00100513          	li	a0,1
    80002824:	fa0482e3          	beqz	s1,800027c8 <devintr+0x40>
    80002828:	00048593          	mv	a1,s1
    8000282c:	00003517          	auipc	a0,0x3
    80002830:	aec50513          	addi	a0,a0,-1300 # 80005318 <_ZZ12printIntegermE6digits+0x2f8>
    80002834:	00000097          	auipc	ra,0x0
    80002838:	674080e7          	jalr	1652(ra) # 80002ea8 <__printf>
    8000283c:	00048513          	mv	a0,s1
    80002840:	00000097          	auipc	ra,0x0
    80002844:	25c080e7          	jalr	604(ra) # 80002a9c <plic_complete>
    80002848:	00100513          	li	a0,1
    8000284c:	f7dff06f          	j	800027c8 <devintr+0x40>
    80002850:	00004517          	auipc	a0,0x4
    80002854:	44050513          	addi	a0,a0,1088 # 80006c90 <tickslock>
    80002858:	00001097          	auipc	ra,0x1
    8000285c:	324080e7          	jalr	804(ra) # 80003b7c <acquire>
    80002860:	00003717          	auipc	a4,0x3
    80002864:	31470713          	addi	a4,a4,788 # 80005b74 <ticks>
    80002868:	00072783          	lw	a5,0(a4)
    8000286c:	00004517          	auipc	a0,0x4
    80002870:	42450513          	addi	a0,a0,1060 # 80006c90 <tickslock>
    80002874:	0017879b          	addiw	a5,a5,1
    80002878:	00f72023          	sw	a5,0(a4)
    8000287c:	00001097          	auipc	ra,0x1
    80002880:	3cc080e7          	jalr	972(ra) # 80003c48 <release>
    80002884:	f65ff06f          	j	800027e8 <devintr+0x60>
    80002888:	00001097          	auipc	ra,0x1
    8000288c:	f28080e7          	jalr	-216(ra) # 800037b0 <uartintr>
    80002890:	fadff06f          	j	8000283c <devintr+0xb4>
	...

00000000800028a0 <kernelvec>:
    800028a0:	f0010113          	addi	sp,sp,-256
    800028a4:	00113023          	sd	ra,0(sp)
    800028a8:	00213423          	sd	sp,8(sp)
    800028ac:	00313823          	sd	gp,16(sp)
    800028b0:	00413c23          	sd	tp,24(sp)
    800028b4:	02513023          	sd	t0,32(sp)
    800028b8:	02613423          	sd	t1,40(sp)
    800028bc:	02713823          	sd	t2,48(sp)
    800028c0:	02813c23          	sd	s0,56(sp)
    800028c4:	04913023          	sd	s1,64(sp)
    800028c8:	04a13423          	sd	a0,72(sp)
    800028cc:	04b13823          	sd	a1,80(sp)
    800028d0:	04c13c23          	sd	a2,88(sp)
    800028d4:	06d13023          	sd	a3,96(sp)
    800028d8:	06e13423          	sd	a4,104(sp)
    800028dc:	06f13823          	sd	a5,112(sp)
    800028e0:	07013c23          	sd	a6,120(sp)
    800028e4:	09113023          	sd	a7,128(sp)
    800028e8:	09213423          	sd	s2,136(sp)
    800028ec:	09313823          	sd	s3,144(sp)
    800028f0:	09413c23          	sd	s4,152(sp)
    800028f4:	0b513023          	sd	s5,160(sp)
    800028f8:	0b613423          	sd	s6,168(sp)
    800028fc:	0b713823          	sd	s7,176(sp)
    80002900:	0b813c23          	sd	s8,184(sp)
    80002904:	0d913023          	sd	s9,192(sp)
    80002908:	0da13423          	sd	s10,200(sp)
    8000290c:	0db13823          	sd	s11,208(sp)
    80002910:	0dc13c23          	sd	t3,216(sp)
    80002914:	0fd13023          	sd	t4,224(sp)
    80002918:	0fe13423          	sd	t5,232(sp)
    8000291c:	0ff13823          	sd	t6,240(sp)
    80002920:	cc9ff0ef          	jal	ra,800025e8 <kerneltrap>
    80002924:	00013083          	ld	ra,0(sp)
    80002928:	00813103          	ld	sp,8(sp)
    8000292c:	01013183          	ld	gp,16(sp)
    80002930:	02013283          	ld	t0,32(sp)
    80002934:	02813303          	ld	t1,40(sp)
    80002938:	03013383          	ld	t2,48(sp)
    8000293c:	03813403          	ld	s0,56(sp)
    80002940:	04013483          	ld	s1,64(sp)
    80002944:	04813503          	ld	a0,72(sp)
    80002948:	05013583          	ld	a1,80(sp)
    8000294c:	05813603          	ld	a2,88(sp)
    80002950:	06013683          	ld	a3,96(sp)
    80002954:	06813703          	ld	a4,104(sp)
    80002958:	07013783          	ld	a5,112(sp)
    8000295c:	07813803          	ld	a6,120(sp)
    80002960:	08013883          	ld	a7,128(sp)
    80002964:	08813903          	ld	s2,136(sp)
    80002968:	09013983          	ld	s3,144(sp)
    8000296c:	09813a03          	ld	s4,152(sp)
    80002970:	0a013a83          	ld	s5,160(sp)
    80002974:	0a813b03          	ld	s6,168(sp)
    80002978:	0b013b83          	ld	s7,176(sp)
    8000297c:	0b813c03          	ld	s8,184(sp)
    80002980:	0c013c83          	ld	s9,192(sp)
    80002984:	0c813d03          	ld	s10,200(sp)
    80002988:	0d013d83          	ld	s11,208(sp)
    8000298c:	0d813e03          	ld	t3,216(sp)
    80002990:	0e013e83          	ld	t4,224(sp)
    80002994:	0e813f03          	ld	t5,232(sp)
    80002998:	0f013f83          	ld	t6,240(sp)
    8000299c:	10010113          	addi	sp,sp,256
    800029a0:	10200073          	sret
    800029a4:	00000013          	nop
    800029a8:	00000013          	nop
    800029ac:	00000013          	nop

00000000800029b0 <timervec>:
    800029b0:	34051573          	csrrw	a0,mscratch,a0
    800029b4:	00b53023          	sd	a1,0(a0)
    800029b8:	00c53423          	sd	a2,8(a0)
    800029bc:	00d53823          	sd	a3,16(a0)
    800029c0:	01853583          	ld	a1,24(a0)
    800029c4:	02053603          	ld	a2,32(a0)
    800029c8:	0005b683          	ld	a3,0(a1)
    800029cc:	00c686b3          	add	a3,a3,a2
    800029d0:	00d5b023          	sd	a3,0(a1)
    800029d4:	00200593          	li	a1,2
    800029d8:	14459073          	csrw	sip,a1
    800029dc:	01053683          	ld	a3,16(a0)
    800029e0:	00853603          	ld	a2,8(a0)
    800029e4:	00053583          	ld	a1,0(a0)
    800029e8:	34051573          	csrrw	a0,mscratch,a0
    800029ec:	30200073          	mret

00000000800029f0 <plicinit>:
    800029f0:	ff010113          	addi	sp,sp,-16
    800029f4:	00813423          	sd	s0,8(sp)
    800029f8:	01010413          	addi	s0,sp,16
    800029fc:	00813403          	ld	s0,8(sp)
    80002a00:	0c0007b7          	lui	a5,0xc000
    80002a04:	00100713          	li	a4,1
    80002a08:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    80002a0c:	00e7a223          	sw	a4,4(a5)
    80002a10:	01010113          	addi	sp,sp,16
    80002a14:	00008067          	ret

0000000080002a18 <plicinithart>:
    80002a18:	ff010113          	addi	sp,sp,-16
    80002a1c:	00813023          	sd	s0,0(sp)
    80002a20:	00113423          	sd	ra,8(sp)
    80002a24:	01010413          	addi	s0,sp,16
    80002a28:	00000097          	auipc	ra,0x0
    80002a2c:	a40080e7          	jalr	-1472(ra) # 80002468 <cpuid>
    80002a30:	0085171b          	slliw	a4,a0,0x8
    80002a34:	0c0027b7          	lui	a5,0xc002
    80002a38:	00e787b3          	add	a5,a5,a4
    80002a3c:	40200713          	li	a4,1026
    80002a40:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80002a44:	00813083          	ld	ra,8(sp)
    80002a48:	00013403          	ld	s0,0(sp)
    80002a4c:	00d5151b          	slliw	a0,a0,0xd
    80002a50:	0c2017b7          	lui	a5,0xc201
    80002a54:	00a78533          	add	a0,a5,a0
    80002a58:	00052023          	sw	zero,0(a0)
    80002a5c:	01010113          	addi	sp,sp,16
    80002a60:	00008067          	ret

0000000080002a64 <plic_claim>:
    80002a64:	ff010113          	addi	sp,sp,-16
    80002a68:	00813023          	sd	s0,0(sp)
    80002a6c:	00113423          	sd	ra,8(sp)
    80002a70:	01010413          	addi	s0,sp,16
    80002a74:	00000097          	auipc	ra,0x0
    80002a78:	9f4080e7          	jalr	-1548(ra) # 80002468 <cpuid>
    80002a7c:	00813083          	ld	ra,8(sp)
    80002a80:	00013403          	ld	s0,0(sp)
    80002a84:	00d5151b          	slliw	a0,a0,0xd
    80002a88:	0c2017b7          	lui	a5,0xc201
    80002a8c:	00a78533          	add	a0,a5,a0
    80002a90:	00452503          	lw	a0,4(a0)
    80002a94:	01010113          	addi	sp,sp,16
    80002a98:	00008067          	ret

0000000080002a9c <plic_complete>:
    80002a9c:	fe010113          	addi	sp,sp,-32
    80002aa0:	00813823          	sd	s0,16(sp)
    80002aa4:	00913423          	sd	s1,8(sp)
    80002aa8:	00113c23          	sd	ra,24(sp)
    80002aac:	02010413          	addi	s0,sp,32
    80002ab0:	00050493          	mv	s1,a0
    80002ab4:	00000097          	auipc	ra,0x0
    80002ab8:	9b4080e7          	jalr	-1612(ra) # 80002468 <cpuid>
    80002abc:	01813083          	ld	ra,24(sp)
    80002ac0:	01013403          	ld	s0,16(sp)
    80002ac4:	00d5179b          	slliw	a5,a0,0xd
    80002ac8:	0c201737          	lui	a4,0xc201
    80002acc:	00f707b3          	add	a5,a4,a5
    80002ad0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80002ad4:	00813483          	ld	s1,8(sp)
    80002ad8:	02010113          	addi	sp,sp,32
    80002adc:	00008067          	ret

0000000080002ae0 <consolewrite>:
    80002ae0:	fb010113          	addi	sp,sp,-80
    80002ae4:	04813023          	sd	s0,64(sp)
    80002ae8:	04113423          	sd	ra,72(sp)
    80002aec:	02913c23          	sd	s1,56(sp)
    80002af0:	03213823          	sd	s2,48(sp)
    80002af4:	03313423          	sd	s3,40(sp)
    80002af8:	03413023          	sd	s4,32(sp)
    80002afc:	01513c23          	sd	s5,24(sp)
    80002b00:	05010413          	addi	s0,sp,80
    80002b04:	06c05c63          	blez	a2,80002b7c <consolewrite+0x9c>
    80002b08:	00060993          	mv	s3,a2
    80002b0c:	00050a13          	mv	s4,a0
    80002b10:	00058493          	mv	s1,a1
    80002b14:	00000913          	li	s2,0
    80002b18:	fff00a93          	li	s5,-1
    80002b1c:	01c0006f          	j	80002b38 <consolewrite+0x58>
    80002b20:	fbf44503          	lbu	a0,-65(s0)
    80002b24:	0019091b          	addiw	s2,s2,1
    80002b28:	00148493          	addi	s1,s1,1
    80002b2c:	00001097          	auipc	ra,0x1
    80002b30:	a9c080e7          	jalr	-1380(ra) # 800035c8 <uartputc>
    80002b34:	03298063          	beq	s3,s2,80002b54 <consolewrite+0x74>
    80002b38:	00048613          	mv	a2,s1
    80002b3c:	00100693          	li	a3,1
    80002b40:	000a0593          	mv	a1,s4
    80002b44:	fbf40513          	addi	a0,s0,-65
    80002b48:	00000097          	auipc	ra,0x0
    80002b4c:	9d8080e7          	jalr	-1576(ra) # 80002520 <either_copyin>
    80002b50:	fd5518e3          	bne	a0,s5,80002b20 <consolewrite+0x40>
    80002b54:	04813083          	ld	ra,72(sp)
    80002b58:	04013403          	ld	s0,64(sp)
    80002b5c:	03813483          	ld	s1,56(sp)
    80002b60:	02813983          	ld	s3,40(sp)
    80002b64:	02013a03          	ld	s4,32(sp)
    80002b68:	01813a83          	ld	s5,24(sp)
    80002b6c:	00090513          	mv	a0,s2
    80002b70:	03013903          	ld	s2,48(sp)
    80002b74:	05010113          	addi	sp,sp,80
    80002b78:	00008067          	ret
    80002b7c:	00000913          	li	s2,0
    80002b80:	fd5ff06f          	j	80002b54 <consolewrite+0x74>

0000000080002b84 <consoleread>:
    80002b84:	f9010113          	addi	sp,sp,-112
    80002b88:	06813023          	sd	s0,96(sp)
    80002b8c:	04913c23          	sd	s1,88(sp)
    80002b90:	05213823          	sd	s2,80(sp)
    80002b94:	05313423          	sd	s3,72(sp)
    80002b98:	05413023          	sd	s4,64(sp)
    80002b9c:	03513c23          	sd	s5,56(sp)
    80002ba0:	03613823          	sd	s6,48(sp)
    80002ba4:	03713423          	sd	s7,40(sp)
    80002ba8:	03813023          	sd	s8,32(sp)
    80002bac:	06113423          	sd	ra,104(sp)
    80002bb0:	01913c23          	sd	s9,24(sp)
    80002bb4:	07010413          	addi	s0,sp,112
    80002bb8:	00060b93          	mv	s7,a2
    80002bbc:	00050913          	mv	s2,a0
    80002bc0:	00058c13          	mv	s8,a1
    80002bc4:	00060b1b          	sext.w	s6,a2
    80002bc8:	00004497          	auipc	s1,0x4
    80002bcc:	0f048493          	addi	s1,s1,240 # 80006cb8 <cons>
    80002bd0:	00400993          	li	s3,4
    80002bd4:	fff00a13          	li	s4,-1
    80002bd8:	00a00a93          	li	s5,10
    80002bdc:	05705e63          	blez	s7,80002c38 <consoleread+0xb4>
    80002be0:	09c4a703          	lw	a4,156(s1)
    80002be4:	0984a783          	lw	a5,152(s1)
    80002be8:	0007071b          	sext.w	a4,a4
    80002bec:	08e78463          	beq	a5,a4,80002c74 <consoleread+0xf0>
    80002bf0:	07f7f713          	andi	a4,a5,127
    80002bf4:	00e48733          	add	a4,s1,a4
    80002bf8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80002bfc:	0017869b          	addiw	a3,a5,1
    80002c00:	08d4ac23          	sw	a3,152(s1)
    80002c04:	00070c9b          	sext.w	s9,a4
    80002c08:	0b370663          	beq	a4,s3,80002cb4 <consoleread+0x130>
    80002c0c:	00100693          	li	a3,1
    80002c10:	f9f40613          	addi	a2,s0,-97
    80002c14:	000c0593          	mv	a1,s8
    80002c18:	00090513          	mv	a0,s2
    80002c1c:	f8e40fa3          	sb	a4,-97(s0)
    80002c20:	00000097          	auipc	ra,0x0
    80002c24:	8b4080e7          	jalr	-1868(ra) # 800024d4 <either_copyout>
    80002c28:	01450863          	beq	a0,s4,80002c38 <consoleread+0xb4>
    80002c2c:	001c0c13          	addi	s8,s8,1
    80002c30:	fffb8b9b          	addiw	s7,s7,-1
    80002c34:	fb5c94e3          	bne	s9,s5,80002bdc <consoleread+0x58>
    80002c38:	000b851b          	sext.w	a0,s7
    80002c3c:	06813083          	ld	ra,104(sp)
    80002c40:	06013403          	ld	s0,96(sp)
    80002c44:	05813483          	ld	s1,88(sp)
    80002c48:	05013903          	ld	s2,80(sp)
    80002c4c:	04813983          	ld	s3,72(sp)
    80002c50:	04013a03          	ld	s4,64(sp)
    80002c54:	03813a83          	ld	s5,56(sp)
    80002c58:	02813b83          	ld	s7,40(sp)
    80002c5c:	02013c03          	ld	s8,32(sp)
    80002c60:	01813c83          	ld	s9,24(sp)
    80002c64:	40ab053b          	subw	a0,s6,a0
    80002c68:	03013b03          	ld	s6,48(sp)
    80002c6c:	07010113          	addi	sp,sp,112
    80002c70:	00008067          	ret
    80002c74:	00001097          	auipc	ra,0x1
    80002c78:	1d8080e7          	jalr	472(ra) # 80003e4c <push_on>
    80002c7c:	0984a703          	lw	a4,152(s1)
    80002c80:	09c4a783          	lw	a5,156(s1)
    80002c84:	0007879b          	sext.w	a5,a5
    80002c88:	fef70ce3          	beq	a4,a5,80002c80 <consoleread+0xfc>
    80002c8c:	00001097          	auipc	ra,0x1
    80002c90:	234080e7          	jalr	564(ra) # 80003ec0 <pop_on>
    80002c94:	0984a783          	lw	a5,152(s1)
    80002c98:	07f7f713          	andi	a4,a5,127
    80002c9c:	00e48733          	add	a4,s1,a4
    80002ca0:	01874703          	lbu	a4,24(a4)
    80002ca4:	0017869b          	addiw	a3,a5,1
    80002ca8:	08d4ac23          	sw	a3,152(s1)
    80002cac:	00070c9b          	sext.w	s9,a4
    80002cb0:	f5371ee3          	bne	a4,s3,80002c0c <consoleread+0x88>
    80002cb4:	000b851b          	sext.w	a0,s7
    80002cb8:	f96bf2e3          	bgeu	s7,s6,80002c3c <consoleread+0xb8>
    80002cbc:	08f4ac23          	sw	a5,152(s1)
    80002cc0:	f7dff06f          	j	80002c3c <consoleread+0xb8>

0000000080002cc4 <consputc>:
    80002cc4:	10000793          	li	a5,256
    80002cc8:	00f50663          	beq	a0,a5,80002cd4 <consputc+0x10>
    80002ccc:	00001317          	auipc	t1,0x1
    80002cd0:	9f430067          	jr	-1548(t1) # 800036c0 <uartputc_sync>
    80002cd4:	ff010113          	addi	sp,sp,-16
    80002cd8:	00113423          	sd	ra,8(sp)
    80002cdc:	00813023          	sd	s0,0(sp)
    80002ce0:	01010413          	addi	s0,sp,16
    80002ce4:	00800513          	li	a0,8
    80002ce8:	00001097          	auipc	ra,0x1
    80002cec:	9d8080e7          	jalr	-1576(ra) # 800036c0 <uartputc_sync>
    80002cf0:	02000513          	li	a0,32
    80002cf4:	00001097          	auipc	ra,0x1
    80002cf8:	9cc080e7          	jalr	-1588(ra) # 800036c0 <uartputc_sync>
    80002cfc:	00013403          	ld	s0,0(sp)
    80002d00:	00813083          	ld	ra,8(sp)
    80002d04:	00800513          	li	a0,8
    80002d08:	01010113          	addi	sp,sp,16
    80002d0c:	00001317          	auipc	t1,0x1
    80002d10:	9b430067          	jr	-1612(t1) # 800036c0 <uartputc_sync>

0000000080002d14 <consoleintr>:
    80002d14:	fe010113          	addi	sp,sp,-32
    80002d18:	00813823          	sd	s0,16(sp)
    80002d1c:	00913423          	sd	s1,8(sp)
    80002d20:	01213023          	sd	s2,0(sp)
    80002d24:	00113c23          	sd	ra,24(sp)
    80002d28:	02010413          	addi	s0,sp,32
    80002d2c:	00004917          	auipc	s2,0x4
    80002d30:	f8c90913          	addi	s2,s2,-116 # 80006cb8 <cons>
    80002d34:	00050493          	mv	s1,a0
    80002d38:	00090513          	mv	a0,s2
    80002d3c:	00001097          	auipc	ra,0x1
    80002d40:	e40080e7          	jalr	-448(ra) # 80003b7c <acquire>
    80002d44:	02048c63          	beqz	s1,80002d7c <consoleintr+0x68>
    80002d48:	0a092783          	lw	a5,160(s2)
    80002d4c:	09892703          	lw	a4,152(s2)
    80002d50:	07f00693          	li	a3,127
    80002d54:	40e7873b          	subw	a4,a5,a4
    80002d58:	02e6e263          	bltu	a3,a4,80002d7c <consoleintr+0x68>
    80002d5c:	00d00713          	li	a4,13
    80002d60:	04e48063          	beq	s1,a4,80002da0 <consoleintr+0x8c>
    80002d64:	07f7f713          	andi	a4,a5,127
    80002d68:	00e90733          	add	a4,s2,a4
    80002d6c:	0017879b          	addiw	a5,a5,1
    80002d70:	0af92023          	sw	a5,160(s2)
    80002d74:	00970c23          	sb	s1,24(a4)
    80002d78:	08f92e23          	sw	a5,156(s2)
    80002d7c:	01013403          	ld	s0,16(sp)
    80002d80:	01813083          	ld	ra,24(sp)
    80002d84:	00813483          	ld	s1,8(sp)
    80002d88:	00013903          	ld	s2,0(sp)
    80002d8c:	00004517          	auipc	a0,0x4
    80002d90:	f2c50513          	addi	a0,a0,-212 # 80006cb8 <cons>
    80002d94:	02010113          	addi	sp,sp,32
    80002d98:	00001317          	auipc	t1,0x1
    80002d9c:	eb030067          	jr	-336(t1) # 80003c48 <release>
    80002da0:	00a00493          	li	s1,10
    80002da4:	fc1ff06f          	j	80002d64 <consoleintr+0x50>

0000000080002da8 <consoleinit>:
    80002da8:	fe010113          	addi	sp,sp,-32
    80002dac:	00113c23          	sd	ra,24(sp)
    80002db0:	00813823          	sd	s0,16(sp)
    80002db4:	00913423          	sd	s1,8(sp)
    80002db8:	02010413          	addi	s0,sp,32
    80002dbc:	00004497          	auipc	s1,0x4
    80002dc0:	efc48493          	addi	s1,s1,-260 # 80006cb8 <cons>
    80002dc4:	00048513          	mv	a0,s1
    80002dc8:	00002597          	auipc	a1,0x2
    80002dcc:	5a858593          	addi	a1,a1,1448 # 80005370 <_ZZ12printIntegermE6digits+0x350>
    80002dd0:	00001097          	auipc	ra,0x1
    80002dd4:	d88080e7          	jalr	-632(ra) # 80003b58 <initlock>
    80002dd8:	00000097          	auipc	ra,0x0
    80002ddc:	7ac080e7          	jalr	1964(ra) # 80003584 <uartinit>
    80002de0:	01813083          	ld	ra,24(sp)
    80002de4:	01013403          	ld	s0,16(sp)
    80002de8:	00000797          	auipc	a5,0x0
    80002dec:	d9c78793          	addi	a5,a5,-612 # 80002b84 <consoleread>
    80002df0:	0af4bc23          	sd	a5,184(s1)
    80002df4:	00000797          	auipc	a5,0x0
    80002df8:	cec78793          	addi	a5,a5,-788 # 80002ae0 <consolewrite>
    80002dfc:	0cf4b023          	sd	a5,192(s1)
    80002e00:	00813483          	ld	s1,8(sp)
    80002e04:	02010113          	addi	sp,sp,32
    80002e08:	00008067          	ret

0000000080002e0c <console_read>:
    80002e0c:	ff010113          	addi	sp,sp,-16
    80002e10:	00813423          	sd	s0,8(sp)
    80002e14:	01010413          	addi	s0,sp,16
    80002e18:	00813403          	ld	s0,8(sp)
    80002e1c:	00004317          	auipc	t1,0x4
    80002e20:	f5433303          	ld	t1,-172(t1) # 80006d70 <devsw+0x10>
    80002e24:	01010113          	addi	sp,sp,16
    80002e28:	00030067          	jr	t1

0000000080002e2c <console_write>:
    80002e2c:	ff010113          	addi	sp,sp,-16
    80002e30:	00813423          	sd	s0,8(sp)
    80002e34:	01010413          	addi	s0,sp,16
    80002e38:	00813403          	ld	s0,8(sp)
    80002e3c:	00004317          	auipc	t1,0x4
    80002e40:	f3c33303          	ld	t1,-196(t1) # 80006d78 <devsw+0x18>
    80002e44:	01010113          	addi	sp,sp,16
    80002e48:	00030067          	jr	t1

0000000080002e4c <panic>:
    80002e4c:	fe010113          	addi	sp,sp,-32
    80002e50:	00113c23          	sd	ra,24(sp)
    80002e54:	00813823          	sd	s0,16(sp)
    80002e58:	00913423          	sd	s1,8(sp)
    80002e5c:	02010413          	addi	s0,sp,32
    80002e60:	00050493          	mv	s1,a0
    80002e64:	00002517          	auipc	a0,0x2
    80002e68:	51450513          	addi	a0,a0,1300 # 80005378 <_ZZ12printIntegermE6digits+0x358>
    80002e6c:	00004797          	auipc	a5,0x4
    80002e70:	fa07a623          	sw	zero,-84(a5) # 80006e18 <pr+0x18>
    80002e74:	00000097          	auipc	ra,0x0
    80002e78:	034080e7          	jalr	52(ra) # 80002ea8 <__printf>
    80002e7c:	00048513          	mv	a0,s1
    80002e80:	00000097          	auipc	ra,0x0
    80002e84:	028080e7          	jalr	40(ra) # 80002ea8 <__printf>
    80002e88:	00002517          	auipc	a0,0x2
    80002e8c:	4d050513          	addi	a0,a0,1232 # 80005358 <_ZZ12printIntegermE6digits+0x338>
    80002e90:	00000097          	auipc	ra,0x0
    80002e94:	018080e7          	jalr	24(ra) # 80002ea8 <__printf>
    80002e98:	00100793          	li	a5,1
    80002e9c:	00003717          	auipc	a4,0x3
    80002ea0:	ccf72e23          	sw	a5,-804(a4) # 80005b78 <panicked>
    80002ea4:	0000006f          	j	80002ea4 <panic+0x58>

0000000080002ea8 <__printf>:
    80002ea8:	f3010113          	addi	sp,sp,-208
    80002eac:	08813023          	sd	s0,128(sp)
    80002eb0:	07313423          	sd	s3,104(sp)
    80002eb4:	09010413          	addi	s0,sp,144
    80002eb8:	05813023          	sd	s8,64(sp)
    80002ebc:	08113423          	sd	ra,136(sp)
    80002ec0:	06913c23          	sd	s1,120(sp)
    80002ec4:	07213823          	sd	s2,112(sp)
    80002ec8:	07413023          	sd	s4,96(sp)
    80002ecc:	05513c23          	sd	s5,88(sp)
    80002ed0:	05613823          	sd	s6,80(sp)
    80002ed4:	05713423          	sd	s7,72(sp)
    80002ed8:	03913c23          	sd	s9,56(sp)
    80002edc:	03a13823          	sd	s10,48(sp)
    80002ee0:	03b13423          	sd	s11,40(sp)
    80002ee4:	00004317          	auipc	t1,0x4
    80002ee8:	f1c30313          	addi	t1,t1,-228 # 80006e00 <pr>
    80002eec:	01832c03          	lw	s8,24(t1)
    80002ef0:	00b43423          	sd	a1,8(s0)
    80002ef4:	00c43823          	sd	a2,16(s0)
    80002ef8:	00d43c23          	sd	a3,24(s0)
    80002efc:	02e43023          	sd	a4,32(s0)
    80002f00:	02f43423          	sd	a5,40(s0)
    80002f04:	03043823          	sd	a6,48(s0)
    80002f08:	03143c23          	sd	a7,56(s0)
    80002f0c:	00050993          	mv	s3,a0
    80002f10:	4a0c1663          	bnez	s8,800033bc <__printf+0x514>
    80002f14:	60098c63          	beqz	s3,8000352c <__printf+0x684>
    80002f18:	0009c503          	lbu	a0,0(s3)
    80002f1c:	00840793          	addi	a5,s0,8
    80002f20:	f6f43c23          	sd	a5,-136(s0)
    80002f24:	00000493          	li	s1,0
    80002f28:	22050063          	beqz	a0,80003148 <__printf+0x2a0>
    80002f2c:	00002a37          	lui	s4,0x2
    80002f30:	00018ab7          	lui	s5,0x18
    80002f34:	000f4b37          	lui	s6,0xf4
    80002f38:	00989bb7          	lui	s7,0x989
    80002f3c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80002f40:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80002f44:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80002f48:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80002f4c:	00148c9b          	addiw	s9,s1,1
    80002f50:	02500793          	li	a5,37
    80002f54:	01998933          	add	s2,s3,s9
    80002f58:	38f51263          	bne	a0,a5,800032dc <__printf+0x434>
    80002f5c:	00094783          	lbu	a5,0(s2)
    80002f60:	00078c9b          	sext.w	s9,a5
    80002f64:	1e078263          	beqz	a5,80003148 <__printf+0x2a0>
    80002f68:	0024849b          	addiw	s1,s1,2
    80002f6c:	07000713          	li	a4,112
    80002f70:	00998933          	add	s2,s3,s1
    80002f74:	38e78a63          	beq	a5,a4,80003308 <__printf+0x460>
    80002f78:	20f76863          	bltu	a4,a5,80003188 <__printf+0x2e0>
    80002f7c:	42a78863          	beq	a5,a0,800033ac <__printf+0x504>
    80002f80:	06400713          	li	a4,100
    80002f84:	40e79663          	bne	a5,a4,80003390 <__printf+0x4e8>
    80002f88:	f7843783          	ld	a5,-136(s0)
    80002f8c:	0007a603          	lw	a2,0(a5)
    80002f90:	00878793          	addi	a5,a5,8
    80002f94:	f6f43c23          	sd	a5,-136(s0)
    80002f98:	42064a63          	bltz	a2,800033cc <__printf+0x524>
    80002f9c:	00a00713          	li	a4,10
    80002fa0:	02e677bb          	remuw	a5,a2,a4
    80002fa4:	00002d97          	auipc	s11,0x2
    80002fa8:	3fcd8d93          	addi	s11,s11,1020 # 800053a0 <digits>
    80002fac:	00900593          	li	a1,9
    80002fb0:	0006051b          	sext.w	a0,a2
    80002fb4:	00000c93          	li	s9,0
    80002fb8:	02079793          	slli	a5,a5,0x20
    80002fbc:	0207d793          	srli	a5,a5,0x20
    80002fc0:	00fd87b3          	add	a5,s11,a5
    80002fc4:	0007c783          	lbu	a5,0(a5)
    80002fc8:	02e656bb          	divuw	a3,a2,a4
    80002fcc:	f8f40023          	sb	a5,-128(s0)
    80002fd0:	14c5d863          	bge	a1,a2,80003120 <__printf+0x278>
    80002fd4:	06300593          	li	a1,99
    80002fd8:	00100c93          	li	s9,1
    80002fdc:	02e6f7bb          	remuw	a5,a3,a4
    80002fe0:	02079793          	slli	a5,a5,0x20
    80002fe4:	0207d793          	srli	a5,a5,0x20
    80002fe8:	00fd87b3          	add	a5,s11,a5
    80002fec:	0007c783          	lbu	a5,0(a5)
    80002ff0:	02e6d73b          	divuw	a4,a3,a4
    80002ff4:	f8f400a3          	sb	a5,-127(s0)
    80002ff8:	12a5f463          	bgeu	a1,a0,80003120 <__printf+0x278>
    80002ffc:	00a00693          	li	a3,10
    80003000:	00900593          	li	a1,9
    80003004:	02d777bb          	remuw	a5,a4,a3
    80003008:	02079793          	slli	a5,a5,0x20
    8000300c:	0207d793          	srli	a5,a5,0x20
    80003010:	00fd87b3          	add	a5,s11,a5
    80003014:	0007c503          	lbu	a0,0(a5)
    80003018:	02d757bb          	divuw	a5,a4,a3
    8000301c:	f8a40123          	sb	a0,-126(s0)
    80003020:	48e5f263          	bgeu	a1,a4,800034a4 <__printf+0x5fc>
    80003024:	06300513          	li	a0,99
    80003028:	02d7f5bb          	remuw	a1,a5,a3
    8000302c:	02059593          	slli	a1,a1,0x20
    80003030:	0205d593          	srli	a1,a1,0x20
    80003034:	00bd85b3          	add	a1,s11,a1
    80003038:	0005c583          	lbu	a1,0(a1)
    8000303c:	02d7d7bb          	divuw	a5,a5,a3
    80003040:	f8b401a3          	sb	a1,-125(s0)
    80003044:	48e57263          	bgeu	a0,a4,800034c8 <__printf+0x620>
    80003048:	3e700513          	li	a0,999
    8000304c:	02d7f5bb          	remuw	a1,a5,a3
    80003050:	02059593          	slli	a1,a1,0x20
    80003054:	0205d593          	srli	a1,a1,0x20
    80003058:	00bd85b3          	add	a1,s11,a1
    8000305c:	0005c583          	lbu	a1,0(a1)
    80003060:	02d7d7bb          	divuw	a5,a5,a3
    80003064:	f8b40223          	sb	a1,-124(s0)
    80003068:	46e57663          	bgeu	a0,a4,800034d4 <__printf+0x62c>
    8000306c:	02d7f5bb          	remuw	a1,a5,a3
    80003070:	02059593          	slli	a1,a1,0x20
    80003074:	0205d593          	srli	a1,a1,0x20
    80003078:	00bd85b3          	add	a1,s11,a1
    8000307c:	0005c583          	lbu	a1,0(a1)
    80003080:	02d7d7bb          	divuw	a5,a5,a3
    80003084:	f8b402a3          	sb	a1,-123(s0)
    80003088:	46ea7863          	bgeu	s4,a4,800034f8 <__printf+0x650>
    8000308c:	02d7f5bb          	remuw	a1,a5,a3
    80003090:	02059593          	slli	a1,a1,0x20
    80003094:	0205d593          	srli	a1,a1,0x20
    80003098:	00bd85b3          	add	a1,s11,a1
    8000309c:	0005c583          	lbu	a1,0(a1)
    800030a0:	02d7d7bb          	divuw	a5,a5,a3
    800030a4:	f8b40323          	sb	a1,-122(s0)
    800030a8:	3eeaf863          	bgeu	s5,a4,80003498 <__printf+0x5f0>
    800030ac:	02d7f5bb          	remuw	a1,a5,a3
    800030b0:	02059593          	slli	a1,a1,0x20
    800030b4:	0205d593          	srli	a1,a1,0x20
    800030b8:	00bd85b3          	add	a1,s11,a1
    800030bc:	0005c583          	lbu	a1,0(a1)
    800030c0:	02d7d7bb          	divuw	a5,a5,a3
    800030c4:	f8b403a3          	sb	a1,-121(s0)
    800030c8:	42eb7e63          	bgeu	s6,a4,80003504 <__printf+0x65c>
    800030cc:	02d7f5bb          	remuw	a1,a5,a3
    800030d0:	02059593          	slli	a1,a1,0x20
    800030d4:	0205d593          	srli	a1,a1,0x20
    800030d8:	00bd85b3          	add	a1,s11,a1
    800030dc:	0005c583          	lbu	a1,0(a1)
    800030e0:	02d7d7bb          	divuw	a5,a5,a3
    800030e4:	f8b40423          	sb	a1,-120(s0)
    800030e8:	42ebfc63          	bgeu	s7,a4,80003520 <__printf+0x678>
    800030ec:	02079793          	slli	a5,a5,0x20
    800030f0:	0207d793          	srli	a5,a5,0x20
    800030f4:	00fd8db3          	add	s11,s11,a5
    800030f8:	000dc703          	lbu	a4,0(s11)
    800030fc:	00a00793          	li	a5,10
    80003100:	00900c93          	li	s9,9
    80003104:	f8e404a3          	sb	a4,-119(s0)
    80003108:	00065c63          	bgez	a2,80003120 <__printf+0x278>
    8000310c:	f9040713          	addi	a4,s0,-112
    80003110:	00f70733          	add	a4,a4,a5
    80003114:	02d00693          	li	a3,45
    80003118:	fed70823          	sb	a3,-16(a4)
    8000311c:	00078c93          	mv	s9,a5
    80003120:	f8040793          	addi	a5,s0,-128
    80003124:	01978cb3          	add	s9,a5,s9
    80003128:	f7f40d13          	addi	s10,s0,-129
    8000312c:	000cc503          	lbu	a0,0(s9)
    80003130:	fffc8c93          	addi	s9,s9,-1
    80003134:	00000097          	auipc	ra,0x0
    80003138:	b90080e7          	jalr	-1136(ra) # 80002cc4 <consputc>
    8000313c:	ffac98e3          	bne	s9,s10,8000312c <__printf+0x284>
    80003140:	00094503          	lbu	a0,0(s2)
    80003144:	e00514e3          	bnez	a0,80002f4c <__printf+0xa4>
    80003148:	1a0c1663          	bnez	s8,800032f4 <__printf+0x44c>
    8000314c:	08813083          	ld	ra,136(sp)
    80003150:	08013403          	ld	s0,128(sp)
    80003154:	07813483          	ld	s1,120(sp)
    80003158:	07013903          	ld	s2,112(sp)
    8000315c:	06813983          	ld	s3,104(sp)
    80003160:	06013a03          	ld	s4,96(sp)
    80003164:	05813a83          	ld	s5,88(sp)
    80003168:	05013b03          	ld	s6,80(sp)
    8000316c:	04813b83          	ld	s7,72(sp)
    80003170:	04013c03          	ld	s8,64(sp)
    80003174:	03813c83          	ld	s9,56(sp)
    80003178:	03013d03          	ld	s10,48(sp)
    8000317c:	02813d83          	ld	s11,40(sp)
    80003180:	0d010113          	addi	sp,sp,208
    80003184:	00008067          	ret
    80003188:	07300713          	li	a4,115
    8000318c:	1ce78a63          	beq	a5,a4,80003360 <__printf+0x4b8>
    80003190:	07800713          	li	a4,120
    80003194:	1ee79e63          	bne	a5,a4,80003390 <__printf+0x4e8>
    80003198:	f7843783          	ld	a5,-136(s0)
    8000319c:	0007a703          	lw	a4,0(a5)
    800031a0:	00878793          	addi	a5,a5,8
    800031a4:	f6f43c23          	sd	a5,-136(s0)
    800031a8:	28074263          	bltz	a4,8000342c <__printf+0x584>
    800031ac:	00002d97          	auipc	s11,0x2
    800031b0:	1f4d8d93          	addi	s11,s11,500 # 800053a0 <digits>
    800031b4:	00f77793          	andi	a5,a4,15
    800031b8:	00fd87b3          	add	a5,s11,a5
    800031bc:	0007c683          	lbu	a3,0(a5)
    800031c0:	00f00613          	li	a2,15
    800031c4:	0007079b          	sext.w	a5,a4
    800031c8:	f8d40023          	sb	a3,-128(s0)
    800031cc:	0047559b          	srliw	a1,a4,0x4
    800031d0:	0047569b          	srliw	a3,a4,0x4
    800031d4:	00000c93          	li	s9,0
    800031d8:	0ee65063          	bge	a2,a4,800032b8 <__printf+0x410>
    800031dc:	00f6f693          	andi	a3,a3,15
    800031e0:	00dd86b3          	add	a3,s11,a3
    800031e4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    800031e8:	0087d79b          	srliw	a5,a5,0x8
    800031ec:	00100c93          	li	s9,1
    800031f0:	f8d400a3          	sb	a3,-127(s0)
    800031f4:	0cb67263          	bgeu	a2,a1,800032b8 <__printf+0x410>
    800031f8:	00f7f693          	andi	a3,a5,15
    800031fc:	00dd86b3          	add	a3,s11,a3
    80003200:	0006c583          	lbu	a1,0(a3)
    80003204:	00f00613          	li	a2,15
    80003208:	0047d69b          	srliw	a3,a5,0x4
    8000320c:	f8b40123          	sb	a1,-126(s0)
    80003210:	0047d593          	srli	a1,a5,0x4
    80003214:	28f67e63          	bgeu	a2,a5,800034b0 <__printf+0x608>
    80003218:	00f6f693          	andi	a3,a3,15
    8000321c:	00dd86b3          	add	a3,s11,a3
    80003220:	0006c503          	lbu	a0,0(a3)
    80003224:	0087d813          	srli	a6,a5,0x8
    80003228:	0087d69b          	srliw	a3,a5,0x8
    8000322c:	f8a401a3          	sb	a0,-125(s0)
    80003230:	28b67663          	bgeu	a2,a1,800034bc <__printf+0x614>
    80003234:	00f6f693          	andi	a3,a3,15
    80003238:	00dd86b3          	add	a3,s11,a3
    8000323c:	0006c583          	lbu	a1,0(a3)
    80003240:	00c7d513          	srli	a0,a5,0xc
    80003244:	00c7d69b          	srliw	a3,a5,0xc
    80003248:	f8b40223          	sb	a1,-124(s0)
    8000324c:	29067a63          	bgeu	a2,a6,800034e0 <__printf+0x638>
    80003250:	00f6f693          	andi	a3,a3,15
    80003254:	00dd86b3          	add	a3,s11,a3
    80003258:	0006c583          	lbu	a1,0(a3)
    8000325c:	0107d813          	srli	a6,a5,0x10
    80003260:	0107d69b          	srliw	a3,a5,0x10
    80003264:	f8b402a3          	sb	a1,-123(s0)
    80003268:	28a67263          	bgeu	a2,a0,800034ec <__printf+0x644>
    8000326c:	00f6f693          	andi	a3,a3,15
    80003270:	00dd86b3          	add	a3,s11,a3
    80003274:	0006c683          	lbu	a3,0(a3)
    80003278:	0147d79b          	srliw	a5,a5,0x14
    8000327c:	f8d40323          	sb	a3,-122(s0)
    80003280:	21067663          	bgeu	a2,a6,8000348c <__printf+0x5e4>
    80003284:	02079793          	slli	a5,a5,0x20
    80003288:	0207d793          	srli	a5,a5,0x20
    8000328c:	00fd8db3          	add	s11,s11,a5
    80003290:	000dc683          	lbu	a3,0(s11)
    80003294:	00800793          	li	a5,8
    80003298:	00700c93          	li	s9,7
    8000329c:	f8d403a3          	sb	a3,-121(s0)
    800032a0:	00075c63          	bgez	a4,800032b8 <__printf+0x410>
    800032a4:	f9040713          	addi	a4,s0,-112
    800032a8:	00f70733          	add	a4,a4,a5
    800032ac:	02d00693          	li	a3,45
    800032b0:	fed70823          	sb	a3,-16(a4)
    800032b4:	00078c93          	mv	s9,a5
    800032b8:	f8040793          	addi	a5,s0,-128
    800032bc:	01978cb3          	add	s9,a5,s9
    800032c0:	f7f40d13          	addi	s10,s0,-129
    800032c4:	000cc503          	lbu	a0,0(s9)
    800032c8:	fffc8c93          	addi	s9,s9,-1
    800032cc:	00000097          	auipc	ra,0x0
    800032d0:	9f8080e7          	jalr	-1544(ra) # 80002cc4 <consputc>
    800032d4:	ff9d18e3          	bne	s10,s9,800032c4 <__printf+0x41c>
    800032d8:	0100006f          	j	800032e8 <__printf+0x440>
    800032dc:	00000097          	auipc	ra,0x0
    800032e0:	9e8080e7          	jalr	-1560(ra) # 80002cc4 <consputc>
    800032e4:	000c8493          	mv	s1,s9
    800032e8:	00094503          	lbu	a0,0(s2)
    800032ec:	c60510e3          	bnez	a0,80002f4c <__printf+0xa4>
    800032f0:	e40c0ee3          	beqz	s8,8000314c <__printf+0x2a4>
    800032f4:	00004517          	auipc	a0,0x4
    800032f8:	b0c50513          	addi	a0,a0,-1268 # 80006e00 <pr>
    800032fc:	00001097          	auipc	ra,0x1
    80003300:	94c080e7          	jalr	-1716(ra) # 80003c48 <release>
    80003304:	e49ff06f          	j	8000314c <__printf+0x2a4>
    80003308:	f7843783          	ld	a5,-136(s0)
    8000330c:	03000513          	li	a0,48
    80003310:	01000d13          	li	s10,16
    80003314:	00878713          	addi	a4,a5,8
    80003318:	0007bc83          	ld	s9,0(a5)
    8000331c:	f6e43c23          	sd	a4,-136(s0)
    80003320:	00000097          	auipc	ra,0x0
    80003324:	9a4080e7          	jalr	-1628(ra) # 80002cc4 <consputc>
    80003328:	07800513          	li	a0,120
    8000332c:	00000097          	auipc	ra,0x0
    80003330:	998080e7          	jalr	-1640(ra) # 80002cc4 <consputc>
    80003334:	00002d97          	auipc	s11,0x2
    80003338:	06cd8d93          	addi	s11,s11,108 # 800053a0 <digits>
    8000333c:	03ccd793          	srli	a5,s9,0x3c
    80003340:	00fd87b3          	add	a5,s11,a5
    80003344:	0007c503          	lbu	a0,0(a5)
    80003348:	fffd0d1b          	addiw	s10,s10,-1
    8000334c:	004c9c93          	slli	s9,s9,0x4
    80003350:	00000097          	auipc	ra,0x0
    80003354:	974080e7          	jalr	-1676(ra) # 80002cc4 <consputc>
    80003358:	fe0d12e3          	bnez	s10,8000333c <__printf+0x494>
    8000335c:	f8dff06f          	j	800032e8 <__printf+0x440>
    80003360:	f7843783          	ld	a5,-136(s0)
    80003364:	0007bc83          	ld	s9,0(a5)
    80003368:	00878793          	addi	a5,a5,8
    8000336c:	f6f43c23          	sd	a5,-136(s0)
    80003370:	000c9a63          	bnez	s9,80003384 <__printf+0x4dc>
    80003374:	1080006f          	j	8000347c <__printf+0x5d4>
    80003378:	001c8c93          	addi	s9,s9,1
    8000337c:	00000097          	auipc	ra,0x0
    80003380:	948080e7          	jalr	-1720(ra) # 80002cc4 <consputc>
    80003384:	000cc503          	lbu	a0,0(s9)
    80003388:	fe0518e3          	bnez	a0,80003378 <__printf+0x4d0>
    8000338c:	f5dff06f          	j	800032e8 <__printf+0x440>
    80003390:	02500513          	li	a0,37
    80003394:	00000097          	auipc	ra,0x0
    80003398:	930080e7          	jalr	-1744(ra) # 80002cc4 <consputc>
    8000339c:	000c8513          	mv	a0,s9
    800033a0:	00000097          	auipc	ra,0x0
    800033a4:	924080e7          	jalr	-1756(ra) # 80002cc4 <consputc>
    800033a8:	f41ff06f          	j	800032e8 <__printf+0x440>
    800033ac:	02500513          	li	a0,37
    800033b0:	00000097          	auipc	ra,0x0
    800033b4:	914080e7          	jalr	-1772(ra) # 80002cc4 <consputc>
    800033b8:	f31ff06f          	j	800032e8 <__printf+0x440>
    800033bc:	00030513          	mv	a0,t1
    800033c0:	00000097          	auipc	ra,0x0
    800033c4:	7bc080e7          	jalr	1980(ra) # 80003b7c <acquire>
    800033c8:	b4dff06f          	j	80002f14 <__printf+0x6c>
    800033cc:	40c0053b          	negw	a0,a2
    800033d0:	00a00713          	li	a4,10
    800033d4:	02e576bb          	remuw	a3,a0,a4
    800033d8:	00002d97          	auipc	s11,0x2
    800033dc:	fc8d8d93          	addi	s11,s11,-56 # 800053a0 <digits>
    800033e0:	ff700593          	li	a1,-9
    800033e4:	02069693          	slli	a3,a3,0x20
    800033e8:	0206d693          	srli	a3,a3,0x20
    800033ec:	00dd86b3          	add	a3,s11,a3
    800033f0:	0006c683          	lbu	a3,0(a3)
    800033f4:	02e557bb          	divuw	a5,a0,a4
    800033f8:	f8d40023          	sb	a3,-128(s0)
    800033fc:	10b65e63          	bge	a2,a1,80003518 <__printf+0x670>
    80003400:	06300593          	li	a1,99
    80003404:	02e7f6bb          	remuw	a3,a5,a4
    80003408:	02069693          	slli	a3,a3,0x20
    8000340c:	0206d693          	srli	a3,a3,0x20
    80003410:	00dd86b3          	add	a3,s11,a3
    80003414:	0006c683          	lbu	a3,0(a3)
    80003418:	02e7d73b          	divuw	a4,a5,a4
    8000341c:	00200793          	li	a5,2
    80003420:	f8d400a3          	sb	a3,-127(s0)
    80003424:	bca5ece3          	bltu	a1,a0,80002ffc <__printf+0x154>
    80003428:	ce5ff06f          	j	8000310c <__printf+0x264>
    8000342c:	40e007bb          	negw	a5,a4
    80003430:	00002d97          	auipc	s11,0x2
    80003434:	f70d8d93          	addi	s11,s11,-144 # 800053a0 <digits>
    80003438:	00f7f693          	andi	a3,a5,15
    8000343c:	00dd86b3          	add	a3,s11,a3
    80003440:	0006c583          	lbu	a1,0(a3)
    80003444:	ff100613          	li	a2,-15
    80003448:	0047d69b          	srliw	a3,a5,0x4
    8000344c:	f8b40023          	sb	a1,-128(s0)
    80003450:	0047d59b          	srliw	a1,a5,0x4
    80003454:	0ac75e63          	bge	a4,a2,80003510 <__printf+0x668>
    80003458:	00f6f693          	andi	a3,a3,15
    8000345c:	00dd86b3          	add	a3,s11,a3
    80003460:	0006c603          	lbu	a2,0(a3)
    80003464:	00f00693          	li	a3,15
    80003468:	0087d79b          	srliw	a5,a5,0x8
    8000346c:	f8c400a3          	sb	a2,-127(s0)
    80003470:	d8b6e4e3          	bltu	a3,a1,800031f8 <__printf+0x350>
    80003474:	00200793          	li	a5,2
    80003478:	e2dff06f          	j	800032a4 <__printf+0x3fc>
    8000347c:	00002c97          	auipc	s9,0x2
    80003480:	f04c8c93          	addi	s9,s9,-252 # 80005380 <_ZZ12printIntegermE6digits+0x360>
    80003484:	02800513          	li	a0,40
    80003488:	ef1ff06f          	j	80003378 <__printf+0x4d0>
    8000348c:	00700793          	li	a5,7
    80003490:	00600c93          	li	s9,6
    80003494:	e0dff06f          	j	800032a0 <__printf+0x3f8>
    80003498:	00700793          	li	a5,7
    8000349c:	00600c93          	li	s9,6
    800034a0:	c69ff06f          	j	80003108 <__printf+0x260>
    800034a4:	00300793          	li	a5,3
    800034a8:	00200c93          	li	s9,2
    800034ac:	c5dff06f          	j	80003108 <__printf+0x260>
    800034b0:	00300793          	li	a5,3
    800034b4:	00200c93          	li	s9,2
    800034b8:	de9ff06f          	j	800032a0 <__printf+0x3f8>
    800034bc:	00400793          	li	a5,4
    800034c0:	00300c93          	li	s9,3
    800034c4:	dddff06f          	j	800032a0 <__printf+0x3f8>
    800034c8:	00400793          	li	a5,4
    800034cc:	00300c93          	li	s9,3
    800034d0:	c39ff06f          	j	80003108 <__printf+0x260>
    800034d4:	00500793          	li	a5,5
    800034d8:	00400c93          	li	s9,4
    800034dc:	c2dff06f          	j	80003108 <__printf+0x260>
    800034e0:	00500793          	li	a5,5
    800034e4:	00400c93          	li	s9,4
    800034e8:	db9ff06f          	j	800032a0 <__printf+0x3f8>
    800034ec:	00600793          	li	a5,6
    800034f0:	00500c93          	li	s9,5
    800034f4:	dadff06f          	j	800032a0 <__printf+0x3f8>
    800034f8:	00600793          	li	a5,6
    800034fc:	00500c93          	li	s9,5
    80003500:	c09ff06f          	j	80003108 <__printf+0x260>
    80003504:	00800793          	li	a5,8
    80003508:	00700c93          	li	s9,7
    8000350c:	bfdff06f          	j	80003108 <__printf+0x260>
    80003510:	00100793          	li	a5,1
    80003514:	d91ff06f          	j	800032a4 <__printf+0x3fc>
    80003518:	00100793          	li	a5,1
    8000351c:	bf1ff06f          	j	8000310c <__printf+0x264>
    80003520:	00900793          	li	a5,9
    80003524:	00800c93          	li	s9,8
    80003528:	be1ff06f          	j	80003108 <__printf+0x260>
    8000352c:	00002517          	auipc	a0,0x2
    80003530:	e5c50513          	addi	a0,a0,-420 # 80005388 <_ZZ12printIntegermE6digits+0x368>
    80003534:	00000097          	auipc	ra,0x0
    80003538:	918080e7          	jalr	-1768(ra) # 80002e4c <panic>

000000008000353c <printfinit>:
    8000353c:	fe010113          	addi	sp,sp,-32
    80003540:	00813823          	sd	s0,16(sp)
    80003544:	00913423          	sd	s1,8(sp)
    80003548:	00113c23          	sd	ra,24(sp)
    8000354c:	02010413          	addi	s0,sp,32
    80003550:	00004497          	auipc	s1,0x4
    80003554:	8b048493          	addi	s1,s1,-1872 # 80006e00 <pr>
    80003558:	00048513          	mv	a0,s1
    8000355c:	00002597          	auipc	a1,0x2
    80003560:	e3c58593          	addi	a1,a1,-452 # 80005398 <_ZZ12printIntegermE6digits+0x378>
    80003564:	00000097          	auipc	ra,0x0
    80003568:	5f4080e7          	jalr	1524(ra) # 80003b58 <initlock>
    8000356c:	01813083          	ld	ra,24(sp)
    80003570:	01013403          	ld	s0,16(sp)
    80003574:	0004ac23          	sw	zero,24(s1)
    80003578:	00813483          	ld	s1,8(sp)
    8000357c:	02010113          	addi	sp,sp,32
    80003580:	00008067          	ret

0000000080003584 <uartinit>:
    80003584:	ff010113          	addi	sp,sp,-16
    80003588:	00813423          	sd	s0,8(sp)
    8000358c:	01010413          	addi	s0,sp,16
    80003590:	100007b7          	lui	a5,0x10000
    80003594:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80003598:	f8000713          	li	a4,-128
    8000359c:	00e781a3          	sb	a4,3(a5)
    800035a0:	00300713          	li	a4,3
    800035a4:	00e78023          	sb	a4,0(a5)
    800035a8:	000780a3          	sb	zero,1(a5)
    800035ac:	00e781a3          	sb	a4,3(a5)
    800035b0:	00700693          	li	a3,7
    800035b4:	00d78123          	sb	a3,2(a5)
    800035b8:	00e780a3          	sb	a4,1(a5)
    800035bc:	00813403          	ld	s0,8(sp)
    800035c0:	01010113          	addi	sp,sp,16
    800035c4:	00008067          	ret

00000000800035c8 <uartputc>:
    800035c8:	00002797          	auipc	a5,0x2
    800035cc:	5b07a783          	lw	a5,1456(a5) # 80005b78 <panicked>
    800035d0:	00078463          	beqz	a5,800035d8 <uartputc+0x10>
    800035d4:	0000006f          	j	800035d4 <uartputc+0xc>
    800035d8:	fd010113          	addi	sp,sp,-48
    800035dc:	02813023          	sd	s0,32(sp)
    800035e0:	00913c23          	sd	s1,24(sp)
    800035e4:	01213823          	sd	s2,16(sp)
    800035e8:	01313423          	sd	s3,8(sp)
    800035ec:	02113423          	sd	ra,40(sp)
    800035f0:	03010413          	addi	s0,sp,48
    800035f4:	00002917          	auipc	s2,0x2
    800035f8:	58c90913          	addi	s2,s2,1420 # 80005b80 <uart_tx_r>
    800035fc:	00093783          	ld	a5,0(s2)
    80003600:	00002497          	auipc	s1,0x2
    80003604:	58848493          	addi	s1,s1,1416 # 80005b88 <uart_tx_w>
    80003608:	0004b703          	ld	a4,0(s1)
    8000360c:	02078693          	addi	a3,a5,32
    80003610:	00050993          	mv	s3,a0
    80003614:	02e69c63          	bne	a3,a4,8000364c <uartputc+0x84>
    80003618:	00001097          	auipc	ra,0x1
    8000361c:	834080e7          	jalr	-1996(ra) # 80003e4c <push_on>
    80003620:	00093783          	ld	a5,0(s2)
    80003624:	0004b703          	ld	a4,0(s1)
    80003628:	02078793          	addi	a5,a5,32
    8000362c:	00e79463          	bne	a5,a4,80003634 <uartputc+0x6c>
    80003630:	0000006f          	j	80003630 <uartputc+0x68>
    80003634:	00001097          	auipc	ra,0x1
    80003638:	88c080e7          	jalr	-1908(ra) # 80003ec0 <pop_on>
    8000363c:	00093783          	ld	a5,0(s2)
    80003640:	0004b703          	ld	a4,0(s1)
    80003644:	02078693          	addi	a3,a5,32
    80003648:	fce688e3          	beq	a3,a4,80003618 <uartputc+0x50>
    8000364c:	01f77693          	andi	a3,a4,31
    80003650:	00003597          	auipc	a1,0x3
    80003654:	7d058593          	addi	a1,a1,2000 # 80006e20 <uart_tx_buf>
    80003658:	00d586b3          	add	a3,a1,a3
    8000365c:	00170713          	addi	a4,a4,1
    80003660:	01368023          	sb	s3,0(a3)
    80003664:	00e4b023          	sd	a4,0(s1)
    80003668:	10000637          	lui	a2,0x10000
    8000366c:	02f71063          	bne	a4,a5,8000368c <uartputc+0xc4>
    80003670:	0340006f          	j	800036a4 <uartputc+0xdc>
    80003674:	00074703          	lbu	a4,0(a4)
    80003678:	00f93023          	sd	a5,0(s2)
    8000367c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80003680:	00093783          	ld	a5,0(s2)
    80003684:	0004b703          	ld	a4,0(s1)
    80003688:	00f70e63          	beq	a4,a5,800036a4 <uartputc+0xdc>
    8000368c:	00564683          	lbu	a3,5(a2)
    80003690:	01f7f713          	andi	a4,a5,31
    80003694:	00e58733          	add	a4,a1,a4
    80003698:	0206f693          	andi	a3,a3,32
    8000369c:	00178793          	addi	a5,a5,1
    800036a0:	fc069ae3          	bnez	a3,80003674 <uartputc+0xac>
    800036a4:	02813083          	ld	ra,40(sp)
    800036a8:	02013403          	ld	s0,32(sp)
    800036ac:	01813483          	ld	s1,24(sp)
    800036b0:	01013903          	ld	s2,16(sp)
    800036b4:	00813983          	ld	s3,8(sp)
    800036b8:	03010113          	addi	sp,sp,48
    800036bc:	00008067          	ret

00000000800036c0 <uartputc_sync>:
    800036c0:	ff010113          	addi	sp,sp,-16
    800036c4:	00813423          	sd	s0,8(sp)
    800036c8:	01010413          	addi	s0,sp,16
    800036cc:	00002717          	auipc	a4,0x2
    800036d0:	4ac72703          	lw	a4,1196(a4) # 80005b78 <panicked>
    800036d4:	02071663          	bnez	a4,80003700 <uartputc_sync+0x40>
    800036d8:	00050793          	mv	a5,a0
    800036dc:	100006b7          	lui	a3,0x10000
    800036e0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    800036e4:	02077713          	andi	a4,a4,32
    800036e8:	fe070ce3          	beqz	a4,800036e0 <uartputc_sync+0x20>
    800036ec:	0ff7f793          	andi	a5,a5,255
    800036f0:	00f68023          	sb	a5,0(a3)
    800036f4:	00813403          	ld	s0,8(sp)
    800036f8:	01010113          	addi	sp,sp,16
    800036fc:	00008067          	ret
    80003700:	0000006f          	j	80003700 <uartputc_sync+0x40>

0000000080003704 <uartstart>:
    80003704:	ff010113          	addi	sp,sp,-16
    80003708:	00813423          	sd	s0,8(sp)
    8000370c:	01010413          	addi	s0,sp,16
    80003710:	00002617          	auipc	a2,0x2
    80003714:	47060613          	addi	a2,a2,1136 # 80005b80 <uart_tx_r>
    80003718:	00002517          	auipc	a0,0x2
    8000371c:	47050513          	addi	a0,a0,1136 # 80005b88 <uart_tx_w>
    80003720:	00063783          	ld	a5,0(a2)
    80003724:	00053703          	ld	a4,0(a0)
    80003728:	04f70263          	beq	a4,a5,8000376c <uartstart+0x68>
    8000372c:	100005b7          	lui	a1,0x10000
    80003730:	00003817          	auipc	a6,0x3
    80003734:	6f080813          	addi	a6,a6,1776 # 80006e20 <uart_tx_buf>
    80003738:	01c0006f          	j	80003754 <uartstart+0x50>
    8000373c:	0006c703          	lbu	a4,0(a3)
    80003740:	00f63023          	sd	a5,0(a2)
    80003744:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80003748:	00063783          	ld	a5,0(a2)
    8000374c:	00053703          	ld	a4,0(a0)
    80003750:	00f70e63          	beq	a4,a5,8000376c <uartstart+0x68>
    80003754:	01f7f713          	andi	a4,a5,31
    80003758:	00e806b3          	add	a3,a6,a4
    8000375c:	0055c703          	lbu	a4,5(a1)
    80003760:	00178793          	addi	a5,a5,1
    80003764:	02077713          	andi	a4,a4,32
    80003768:	fc071ae3          	bnez	a4,8000373c <uartstart+0x38>
    8000376c:	00813403          	ld	s0,8(sp)
    80003770:	01010113          	addi	sp,sp,16
    80003774:	00008067          	ret

0000000080003778 <uartgetc>:
    80003778:	ff010113          	addi	sp,sp,-16
    8000377c:	00813423          	sd	s0,8(sp)
    80003780:	01010413          	addi	s0,sp,16
    80003784:	10000737          	lui	a4,0x10000
    80003788:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000378c:	0017f793          	andi	a5,a5,1
    80003790:	00078c63          	beqz	a5,800037a8 <uartgetc+0x30>
    80003794:	00074503          	lbu	a0,0(a4)
    80003798:	0ff57513          	andi	a0,a0,255
    8000379c:	00813403          	ld	s0,8(sp)
    800037a0:	01010113          	addi	sp,sp,16
    800037a4:	00008067          	ret
    800037a8:	fff00513          	li	a0,-1
    800037ac:	ff1ff06f          	j	8000379c <uartgetc+0x24>

00000000800037b0 <uartintr>:
    800037b0:	100007b7          	lui	a5,0x10000
    800037b4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    800037b8:	0017f793          	andi	a5,a5,1
    800037bc:	0a078463          	beqz	a5,80003864 <uartintr+0xb4>
    800037c0:	fe010113          	addi	sp,sp,-32
    800037c4:	00813823          	sd	s0,16(sp)
    800037c8:	00913423          	sd	s1,8(sp)
    800037cc:	00113c23          	sd	ra,24(sp)
    800037d0:	02010413          	addi	s0,sp,32
    800037d4:	100004b7          	lui	s1,0x10000
    800037d8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    800037dc:	0ff57513          	andi	a0,a0,255
    800037e0:	fffff097          	auipc	ra,0xfffff
    800037e4:	534080e7          	jalr	1332(ra) # 80002d14 <consoleintr>
    800037e8:	0054c783          	lbu	a5,5(s1)
    800037ec:	0017f793          	andi	a5,a5,1
    800037f0:	fe0794e3          	bnez	a5,800037d8 <uartintr+0x28>
    800037f4:	00002617          	auipc	a2,0x2
    800037f8:	38c60613          	addi	a2,a2,908 # 80005b80 <uart_tx_r>
    800037fc:	00002517          	auipc	a0,0x2
    80003800:	38c50513          	addi	a0,a0,908 # 80005b88 <uart_tx_w>
    80003804:	00063783          	ld	a5,0(a2)
    80003808:	00053703          	ld	a4,0(a0)
    8000380c:	04f70263          	beq	a4,a5,80003850 <uartintr+0xa0>
    80003810:	100005b7          	lui	a1,0x10000
    80003814:	00003817          	auipc	a6,0x3
    80003818:	60c80813          	addi	a6,a6,1548 # 80006e20 <uart_tx_buf>
    8000381c:	01c0006f          	j	80003838 <uartintr+0x88>
    80003820:	0006c703          	lbu	a4,0(a3)
    80003824:	00f63023          	sd	a5,0(a2)
    80003828:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000382c:	00063783          	ld	a5,0(a2)
    80003830:	00053703          	ld	a4,0(a0)
    80003834:	00f70e63          	beq	a4,a5,80003850 <uartintr+0xa0>
    80003838:	01f7f713          	andi	a4,a5,31
    8000383c:	00e806b3          	add	a3,a6,a4
    80003840:	0055c703          	lbu	a4,5(a1)
    80003844:	00178793          	addi	a5,a5,1
    80003848:	02077713          	andi	a4,a4,32
    8000384c:	fc071ae3          	bnez	a4,80003820 <uartintr+0x70>
    80003850:	01813083          	ld	ra,24(sp)
    80003854:	01013403          	ld	s0,16(sp)
    80003858:	00813483          	ld	s1,8(sp)
    8000385c:	02010113          	addi	sp,sp,32
    80003860:	00008067          	ret
    80003864:	00002617          	auipc	a2,0x2
    80003868:	31c60613          	addi	a2,a2,796 # 80005b80 <uart_tx_r>
    8000386c:	00002517          	auipc	a0,0x2
    80003870:	31c50513          	addi	a0,a0,796 # 80005b88 <uart_tx_w>
    80003874:	00063783          	ld	a5,0(a2)
    80003878:	00053703          	ld	a4,0(a0)
    8000387c:	04f70263          	beq	a4,a5,800038c0 <uartintr+0x110>
    80003880:	100005b7          	lui	a1,0x10000
    80003884:	00003817          	auipc	a6,0x3
    80003888:	59c80813          	addi	a6,a6,1436 # 80006e20 <uart_tx_buf>
    8000388c:	01c0006f          	j	800038a8 <uartintr+0xf8>
    80003890:	0006c703          	lbu	a4,0(a3)
    80003894:	00f63023          	sd	a5,0(a2)
    80003898:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000389c:	00063783          	ld	a5,0(a2)
    800038a0:	00053703          	ld	a4,0(a0)
    800038a4:	02f70063          	beq	a4,a5,800038c4 <uartintr+0x114>
    800038a8:	01f7f713          	andi	a4,a5,31
    800038ac:	00e806b3          	add	a3,a6,a4
    800038b0:	0055c703          	lbu	a4,5(a1)
    800038b4:	00178793          	addi	a5,a5,1
    800038b8:	02077713          	andi	a4,a4,32
    800038bc:	fc071ae3          	bnez	a4,80003890 <uartintr+0xe0>
    800038c0:	00008067          	ret
    800038c4:	00008067          	ret

00000000800038c8 <kinit>:
    800038c8:	fc010113          	addi	sp,sp,-64
    800038cc:	02913423          	sd	s1,40(sp)
    800038d0:	fffff7b7          	lui	a5,0xfffff
    800038d4:	00004497          	auipc	s1,0x4
    800038d8:	56b48493          	addi	s1,s1,1387 # 80007e3f <end+0xfff>
    800038dc:	02813823          	sd	s0,48(sp)
    800038e0:	01313c23          	sd	s3,24(sp)
    800038e4:	00f4f4b3          	and	s1,s1,a5
    800038e8:	02113c23          	sd	ra,56(sp)
    800038ec:	03213023          	sd	s2,32(sp)
    800038f0:	01413823          	sd	s4,16(sp)
    800038f4:	01513423          	sd	s5,8(sp)
    800038f8:	04010413          	addi	s0,sp,64
    800038fc:	000017b7          	lui	a5,0x1
    80003900:	01100993          	li	s3,17
    80003904:	00f487b3          	add	a5,s1,a5
    80003908:	01b99993          	slli	s3,s3,0x1b
    8000390c:	06f9e063          	bltu	s3,a5,8000396c <kinit+0xa4>
    80003910:	00003a97          	auipc	s5,0x3
    80003914:	530a8a93          	addi	s5,s5,1328 # 80006e40 <end>
    80003918:	0754ec63          	bltu	s1,s5,80003990 <kinit+0xc8>
    8000391c:	0734fa63          	bgeu	s1,s3,80003990 <kinit+0xc8>
    80003920:	00088a37          	lui	s4,0x88
    80003924:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80003928:	00002917          	auipc	s2,0x2
    8000392c:	26890913          	addi	s2,s2,616 # 80005b90 <kmem>
    80003930:	00ca1a13          	slli	s4,s4,0xc
    80003934:	0140006f          	j	80003948 <kinit+0x80>
    80003938:	000017b7          	lui	a5,0x1
    8000393c:	00f484b3          	add	s1,s1,a5
    80003940:	0554e863          	bltu	s1,s5,80003990 <kinit+0xc8>
    80003944:	0534f663          	bgeu	s1,s3,80003990 <kinit+0xc8>
    80003948:	00001637          	lui	a2,0x1
    8000394c:	00100593          	li	a1,1
    80003950:	00048513          	mv	a0,s1
    80003954:	00000097          	auipc	ra,0x0
    80003958:	5e4080e7          	jalr	1508(ra) # 80003f38 <__memset>
    8000395c:	00093783          	ld	a5,0(s2)
    80003960:	00f4b023          	sd	a5,0(s1)
    80003964:	00993023          	sd	s1,0(s2)
    80003968:	fd4498e3          	bne	s1,s4,80003938 <kinit+0x70>
    8000396c:	03813083          	ld	ra,56(sp)
    80003970:	03013403          	ld	s0,48(sp)
    80003974:	02813483          	ld	s1,40(sp)
    80003978:	02013903          	ld	s2,32(sp)
    8000397c:	01813983          	ld	s3,24(sp)
    80003980:	01013a03          	ld	s4,16(sp)
    80003984:	00813a83          	ld	s5,8(sp)
    80003988:	04010113          	addi	sp,sp,64
    8000398c:	00008067          	ret
    80003990:	00002517          	auipc	a0,0x2
    80003994:	a2850513          	addi	a0,a0,-1496 # 800053b8 <digits+0x18>
    80003998:	fffff097          	auipc	ra,0xfffff
    8000399c:	4b4080e7          	jalr	1204(ra) # 80002e4c <panic>

00000000800039a0 <freerange>:
    800039a0:	fc010113          	addi	sp,sp,-64
    800039a4:	000017b7          	lui	a5,0x1
    800039a8:	02913423          	sd	s1,40(sp)
    800039ac:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    800039b0:	009504b3          	add	s1,a0,s1
    800039b4:	fffff537          	lui	a0,0xfffff
    800039b8:	02813823          	sd	s0,48(sp)
    800039bc:	02113c23          	sd	ra,56(sp)
    800039c0:	03213023          	sd	s2,32(sp)
    800039c4:	01313c23          	sd	s3,24(sp)
    800039c8:	01413823          	sd	s4,16(sp)
    800039cc:	01513423          	sd	s5,8(sp)
    800039d0:	01613023          	sd	s6,0(sp)
    800039d4:	04010413          	addi	s0,sp,64
    800039d8:	00a4f4b3          	and	s1,s1,a0
    800039dc:	00f487b3          	add	a5,s1,a5
    800039e0:	06f5e463          	bltu	a1,a5,80003a48 <freerange+0xa8>
    800039e4:	00003a97          	auipc	s5,0x3
    800039e8:	45ca8a93          	addi	s5,s5,1116 # 80006e40 <end>
    800039ec:	0954e263          	bltu	s1,s5,80003a70 <freerange+0xd0>
    800039f0:	01100993          	li	s3,17
    800039f4:	01b99993          	slli	s3,s3,0x1b
    800039f8:	0734fc63          	bgeu	s1,s3,80003a70 <freerange+0xd0>
    800039fc:	00058a13          	mv	s4,a1
    80003a00:	00002917          	auipc	s2,0x2
    80003a04:	19090913          	addi	s2,s2,400 # 80005b90 <kmem>
    80003a08:	00002b37          	lui	s6,0x2
    80003a0c:	0140006f          	j	80003a20 <freerange+0x80>
    80003a10:	000017b7          	lui	a5,0x1
    80003a14:	00f484b3          	add	s1,s1,a5
    80003a18:	0554ec63          	bltu	s1,s5,80003a70 <freerange+0xd0>
    80003a1c:	0534fa63          	bgeu	s1,s3,80003a70 <freerange+0xd0>
    80003a20:	00001637          	lui	a2,0x1
    80003a24:	00100593          	li	a1,1
    80003a28:	00048513          	mv	a0,s1
    80003a2c:	00000097          	auipc	ra,0x0
    80003a30:	50c080e7          	jalr	1292(ra) # 80003f38 <__memset>
    80003a34:	00093703          	ld	a4,0(s2)
    80003a38:	016487b3          	add	a5,s1,s6
    80003a3c:	00e4b023          	sd	a4,0(s1)
    80003a40:	00993023          	sd	s1,0(s2)
    80003a44:	fcfa76e3          	bgeu	s4,a5,80003a10 <freerange+0x70>
    80003a48:	03813083          	ld	ra,56(sp)
    80003a4c:	03013403          	ld	s0,48(sp)
    80003a50:	02813483          	ld	s1,40(sp)
    80003a54:	02013903          	ld	s2,32(sp)
    80003a58:	01813983          	ld	s3,24(sp)
    80003a5c:	01013a03          	ld	s4,16(sp)
    80003a60:	00813a83          	ld	s5,8(sp)
    80003a64:	00013b03          	ld	s6,0(sp)
    80003a68:	04010113          	addi	sp,sp,64
    80003a6c:	00008067          	ret
    80003a70:	00002517          	auipc	a0,0x2
    80003a74:	94850513          	addi	a0,a0,-1720 # 800053b8 <digits+0x18>
    80003a78:	fffff097          	auipc	ra,0xfffff
    80003a7c:	3d4080e7          	jalr	980(ra) # 80002e4c <panic>

0000000080003a80 <kfree>:
    80003a80:	fe010113          	addi	sp,sp,-32
    80003a84:	00813823          	sd	s0,16(sp)
    80003a88:	00113c23          	sd	ra,24(sp)
    80003a8c:	00913423          	sd	s1,8(sp)
    80003a90:	02010413          	addi	s0,sp,32
    80003a94:	03451793          	slli	a5,a0,0x34
    80003a98:	04079c63          	bnez	a5,80003af0 <kfree+0x70>
    80003a9c:	00003797          	auipc	a5,0x3
    80003aa0:	3a478793          	addi	a5,a5,932 # 80006e40 <end>
    80003aa4:	00050493          	mv	s1,a0
    80003aa8:	04f56463          	bltu	a0,a5,80003af0 <kfree+0x70>
    80003aac:	01100793          	li	a5,17
    80003ab0:	01b79793          	slli	a5,a5,0x1b
    80003ab4:	02f57e63          	bgeu	a0,a5,80003af0 <kfree+0x70>
    80003ab8:	00001637          	lui	a2,0x1
    80003abc:	00100593          	li	a1,1
    80003ac0:	00000097          	auipc	ra,0x0
    80003ac4:	478080e7          	jalr	1144(ra) # 80003f38 <__memset>
    80003ac8:	00002797          	auipc	a5,0x2
    80003acc:	0c878793          	addi	a5,a5,200 # 80005b90 <kmem>
    80003ad0:	0007b703          	ld	a4,0(a5)
    80003ad4:	01813083          	ld	ra,24(sp)
    80003ad8:	01013403          	ld	s0,16(sp)
    80003adc:	00e4b023          	sd	a4,0(s1)
    80003ae0:	0097b023          	sd	s1,0(a5)
    80003ae4:	00813483          	ld	s1,8(sp)
    80003ae8:	02010113          	addi	sp,sp,32
    80003aec:	00008067          	ret
    80003af0:	00002517          	auipc	a0,0x2
    80003af4:	8c850513          	addi	a0,a0,-1848 # 800053b8 <digits+0x18>
    80003af8:	fffff097          	auipc	ra,0xfffff
    80003afc:	354080e7          	jalr	852(ra) # 80002e4c <panic>

0000000080003b00 <kalloc>:
    80003b00:	fe010113          	addi	sp,sp,-32
    80003b04:	00813823          	sd	s0,16(sp)
    80003b08:	00913423          	sd	s1,8(sp)
    80003b0c:	00113c23          	sd	ra,24(sp)
    80003b10:	02010413          	addi	s0,sp,32
    80003b14:	00002797          	auipc	a5,0x2
    80003b18:	07c78793          	addi	a5,a5,124 # 80005b90 <kmem>
    80003b1c:	0007b483          	ld	s1,0(a5)
    80003b20:	02048063          	beqz	s1,80003b40 <kalloc+0x40>
    80003b24:	0004b703          	ld	a4,0(s1)
    80003b28:	00001637          	lui	a2,0x1
    80003b2c:	00500593          	li	a1,5
    80003b30:	00048513          	mv	a0,s1
    80003b34:	00e7b023          	sd	a4,0(a5)
    80003b38:	00000097          	auipc	ra,0x0
    80003b3c:	400080e7          	jalr	1024(ra) # 80003f38 <__memset>
    80003b40:	01813083          	ld	ra,24(sp)
    80003b44:	01013403          	ld	s0,16(sp)
    80003b48:	00048513          	mv	a0,s1
    80003b4c:	00813483          	ld	s1,8(sp)
    80003b50:	02010113          	addi	sp,sp,32
    80003b54:	00008067          	ret

0000000080003b58 <initlock>:
    80003b58:	ff010113          	addi	sp,sp,-16
    80003b5c:	00813423          	sd	s0,8(sp)
    80003b60:	01010413          	addi	s0,sp,16
    80003b64:	00813403          	ld	s0,8(sp)
    80003b68:	00b53423          	sd	a1,8(a0)
    80003b6c:	00052023          	sw	zero,0(a0)
    80003b70:	00053823          	sd	zero,16(a0)
    80003b74:	01010113          	addi	sp,sp,16
    80003b78:	00008067          	ret

0000000080003b7c <acquire>:
    80003b7c:	fe010113          	addi	sp,sp,-32
    80003b80:	00813823          	sd	s0,16(sp)
    80003b84:	00913423          	sd	s1,8(sp)
    80003b88:	00113c23          	sd	ra,24(sp)
    80003b8c:	01213023          	sd	s2,0(sp)
    80003b90:	02010413          	addi	s0,sp,32
    80003b94:	00050493          	mv	s1,a0
    80003b98:	10002973          	csrr	s2,sstatus
    80003b9c:	100027f3          	csrr	a5,sstatus
    80003ba0:	ffd7f793          	andi	a5,a5,-3
    80003ba4:	10079073          	csrw	sstatus,a5
    80003ba8:	fffff097          	auipc	ra,0xfffff
    80003bac:	8e0080e7          	jalr	-1824(ra) # 80002488 <mycpu>
    80003bb0:	07852783          	lw	a5,120(a0)
    80003bb4:	06078e63          	beqz	a5,80003c30 <acquire+0xb4>
    80003bb8:	fffff097          	auipc	ra,0xfffff
    80003bbc:	8d0080e7          	jalr	-1840(ra) # 80002488 <mycpu>
    80003bc0:	07852783          	lw	a5,120(a0)
    80003bc4:	0004a703          	lw	a4,0(s1)
    80003bc8:	0017879b          	addiw	a5,a5,1
    80003bcc:	06f52c23          	sw	a5,120(a0)
    80003bd0:	04071063          	bnez	a4,80003c10 <acquire+0x94>
    80003bd4:	00100713          	li	a4,1
    80003bd8:	00070793          	mv	a5,a4
    80003bdc:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80003be0:	0007879b          	sext.w	a5,a5
    80003be4:	fe079ae3          	bnez	a5,80003bd8 <acquire+0x5c>
    80003be8:	0ff0000f          	fence
    80003bec:	fffff097          	auipc	ra,0xfffff
    80003bf0:	89c080e7          	jalr	-1892(ra) # 80002488 <mycpu>
    80003bf4:	01813083          	ld	ra,24(sp)
    80003bf8:	01013403          	ld	s0,16(sp)
    80003bfc:	00a4b823          	sd	a0,16(s1)
    80003c00:	00013903          	ld	s2,0(sp)
    80003c04:	00813483          	ld	s1,8(sp)
    80003c08:	02010113          	addi	sp,sp,32
    80003c0c:	00008067          	ret
    80003c10:	0104b903          	ld	s2,16(s1)
    80003c14:	fffff097          	auipc	ra,0xfffff
    80003c18:	874080e7          	jalr	-1932(ra) # 80002488 <mycpu>
    80003c1c:	faa91ce3          	bne	s2,a0,80003bd4 <acquire+0x58>
    80003c20:	00001517          	auipc	a0,0x1
    80003c24:	7a050513          	addi	a0,a0,1952 # 800053c0 <digits+0x20>
    80003c28:	fffff097          	auipc	ra,0xfffff
    80003c2c:	224080e7          	jalr	548(ra) # 80002e4c <panic>
    80003c30:	00195913          	srli	s2,s2,0x1
    80003c34:	fffff097          	auipc	ra,0xfffff
    80003c38:	854080e7          	jalr	-1964(ra) # 80002488 <mycpu>
    80003c3c:	00197913          	andi	s2,s2,1
    80003c40:	07252e23          	sw	s2,124(a0)
    80003c44:	f75ff06f          	j	80003bb8 <acquire+0x3c>

0000000080003c48 <release>:
    80003c48:	fe010113          	addi	sp,sp,-32
    80003c4c:	00813823          	sd	s0,16(sp)
    80003c50:	00113c23          	sd	ra,24(sp)
    80003c54:	00913423          	sd	s1,8(sp)
    80003c58:	01213023          	sd	s2,0(sp)
    80003c5c:	02010413          	addi	s0,sp,32
    80003c60:	00052783          	lw	a5,0(a0)
    80003c64:	00079a63          	bnez	a5,80003c78 <release+0x30>
    80003c68:	00001517          	auipc	a0,0x1
    80003c6c:	76050513          	addi	a0,a0,1888 # 800053c8 <digits+0x28>
    80003c70:	fffff097          	auipc	ra,0xfffff
    80003c74:	1dc080e7          	jalr	476(ra) # 80002e4c <panic>
    80003c78:	01053903          	ld	s2,16(a0)
    80003c7c:	00050493          	mv	s1,a0
    80003c80:	fffff097          	auipc	ra,0xfffff
    80003c84:	808080e7          	jalr	-2040(ra) # 80002488 <mycpu>
    80003c88:	fea910e3          	bne	s2,a0,80003c68 <release+0x20>
    80003c8c:	0004b823          	sd	zero,16(s1)
    80003c90:	0ff0000f          	fence
    80003c94:	0f50000f          	fence	iorw,ow
    80003c98:	0804a02f          	amoswap.w	zero,zero,(s1)
    80003c9c:	ffffe097          	auipc	ra,0xffffe
    80003ca0:	7ec080e7          	jalr	2028(ra) # 80002488 <mycpu>
    80003ca4:	100027f3          	csrr	a5,sstatus
    80003ca8:	0027f793          	andi	a5,a5,2
    80003cac:	04079a63          	bnez	a5,80003d00 <release+0xb8>
    80003cb0:	07852783          	lw	a5,120(a0)
    80003cb4:	02f05e63          	blez	a5,80003cf0 <release+0xa8>
    80003cb8:	fff7871b          	addiw	a4,a5,-1
    80003cbc:	06e52c23          	sw	a4,120(a0)
    80003cc0:	00071c63          	bnez	a4,80003cd8 <release+0x90>
    80003cc4:	07c52783          	lw	a5,124(a0)
    80003cc8:	00078863          	beqz	a5,80003cd8 <release+0x90>
    80003ccc:	100027f3          	csrr	a5,sstatus
    80003cd0:	0027e793          	ori	a5,a5,2
    80003cd4:	10079073          	csrw	sstatus,a5
    80003cd8:	01813083          	ld	ra,24(sp)
    80003cdc:	01013403          	ld	s0,16(sp)
    80003ce0:	00813483          	ld	s1,8(sp)
    80003ce4:	00013903          	ld	s2,0(sp)
    80003ce8:	02010113          	addi	sp,sp,32
    80003cec:	00008067          	ret
    80003cf0:	00001517          	auipc	a0,0x1
    80003cf4:	6f850513          	addi	a0,a0,1784 # 800053e8 <digits+0x48>
    80003cf8:	fffff097          	auipc	ra,0xfffff
    80003cfc:	154080e7          	jalr	340(ra) # 80002e4c <panic>
    80003d00:	00001517          	auipc	a0,0x1
    80003d04:	6d050513          	addi	a0,a0,1744 # 800053d0 <digits+0x30>
    80003d08:	fffff097          	auipc	ra,0xfffff
    80003d0c:	144080e7          	jalr	324(ra) # 80002e4c <panic>

0000000080003d10 <holding>:
    80003d10:	00052783          	lw	a5,0(a0)
    80003d14:	00079663          	bnez	a5,80003d20 <holding+0x10>
    80003d18:	00000513          	li	a0,0
    80003d1c:	00008067          	ret
    80003d20:	fe010113          	addi	sp,sp,-32
    80003d24:	00813823          	sd	s0,16(sp)
    80003d28:	00913423          	sd	s1,8(sp)
    80003d2c:	00113c23          	sd	ra,24(sp)
    80003d30:	02010413          	addi	s0,sp,32
    80003d34:	01053483          	ld	s1,16(a0)
    80003d38:	ffffe097          	auipc	ra,0xffffe
    80003d3c:	750080e7          	jalr	1872(ra) # 80002488 <mycpu>
    80003d40:	01813083          	ld	ra,24(sp)
    80003d44:	01013403          	ld	s0,16(sp)
    80003d48:	40a48533          	sub	a0,s1,a0
    80003d4c:	00153513          	seqz	a0,a0
    80003d50:	00813483          	ld	s1,8(sp)
    80003d54:	02010113          	addi	sp,sp,32
    80003d58:	00008067          	ret

0000000080003d5c <push_off>:
    80003d5c:	fe010113          	addi	sp,sp,-32
    80003d60:	00813823          	sd	s0,16(sp)
    80003d64:	00113c23          	sd	ra,24(sp)
    80003d68:	00913423          	sd	s1,8(sp)
    80003d6c:	02010413          	addi	s0,sp,32
    80003d70:	100024f3          	csrr	s1,sstatus
    80003d74:	100027f3          	csrr	a5,sstatus
    80003d78:	ffd7f793          	andi	a5,a5,-3
    80003d7c:	10079073          	csrw	sstatus,a5
    80003d80:	ffffe097          	auipc	ra,0xffffe
    80003d84:	708080e7          	jalr	1800(ra) # 80002488 <mycpu>
    80003d88:	07852783          	lw	a5,120(a0)
    80003d8c:	02078663          	beqz	a5,80003db8 <push_off+0x5c>
    80003d90:	ffffe097          	auipc	ra,0xffffe
    80003d94:	6f8080e7          	jalr	1784(ra) # 80002488 <mycpu>
    80003d98:	07852783          	lw	a5,120(a0)
    80003d9c:	01813083          	ld	ra,24(sp)
    80003da0:	01013403          	ld	s0,16(sp)
    80003da4:	0017879b          	addiw	a5,a5,1
    80003da8:	06f52c23          	sw	a5,120(a0)
    80003dac:	00813483          	ld	s1,8(sp)
    80003db0:	02010113          	addi	sp,sp,32
    80003db4:	00008067          	ret
    80003db8:	0014d493          	srli	s1,s1,0x1
    80003dbc:	ffffe097          	auipc	ra,0xffffe
    80003dc0:	6cc080e7          	jalr	1740(ra) # 80002488 <mycpu>
    80003dc4:	0014f493          	andi	s1,s1,1
    80003dc8:	06952e23          	sw	s1,124(a0)
    80003dcc:	fc5ff06f          	j	80003d90 <push_off+0x34>

0000000080003dd0 <pop_off>:
    80003dd0:	ff010113          	addi	sp,sp,-16
    80003dd4:	00813023          	sd	s0,0(sp)
    80003dd8:	00113423          	sd	ra,8(sp)
    80003ddc:	01010413          	addi	s0,sp,16
    80003de0:	ffffe097          	auipc	ra,0xffffe
    80003de4:	6a8080e7          	jalr	1704(ra) # 80002488 <mycpu>
    80003de8:	100027f3          	csrr	a5,sstatus
    80003dec:	0027f793          	andi	a5,a5,2
    80003df0:	04079663          	bnez	a5,80003e3c <pop_off+0x6c>
    80003df4:	07852783          	lw	a5,120(a0)
    80003df8:	02f05a63          	blez	a5,80003e2c <pop_off+0x5c>
    80003dfc:	fff7871b          	addiw	a4,a5,-1
    80003e00:	06e52c23          	sw	a4,120(a0)
    80003e04:	00071c63          	bnez	a4,80003e1c <pop_off+0x4c>
    80003e08:	07c52783          	lw	a5,124(a0)
    80003e0c:	00078863          	beqz	a5,80003e1c <pop_off+0x4c>
    80003e10:	100027f3          	csrr	a5,sstatus
    80003e14:	0027e793          	ori	a5,a5,2
    80003e18:	10079073          	csrw	sstatus,a5
    80003e1c:	00813083          	ld	ra,8(sp)
    80003e20:	00013403          	ld	s0,0(sp)
    80003e24:	01010113          	addi	sp,sp,16
    80003e28:	00008067          	ret
    80003e2c:	00001517          	auipc	a0,0x1
    80003e30:	5bc50513          	addi	a0,a0,1468 # 800053e8 <digits+0x48>
    80003e34:	fffff097          	auipc	ra,0xfffff
    80003e38:	018080e7          	jalr	24(ra) # 80002e4c <panic>
    80003e3c:	00001517          	auipc	a0,0x1
    80003e40:	59450513          	addi	a0,a0,1428 # 800053d0 <digits+0x30>
    80003e44:	fffff097          	auipc	ra,0xfffff
    80003e48:	008080e7          	jalr	8(ra) # 80002e4c <panic>

0000000080003e4c <push_on>:
    80003e4c:	fe010113          	addi	sp,sp,-32
    80003e50:	00813823          	sd	s0,16(sp)
    80003e54:	00113c23          	sd	ra,24(sp)
    80003e58:	00913423          	sd	s1,8(sp)
    80003e5c:	02010413          	addi	s0,sp,32
    80003e60:	100024f3          	csrr	s1,sstatus
    80003e64:	100027f3          	csrr	a5,sstatus
    80003e68:	0027e793          	ori	a5,a5,2
    80003e6c:	10079073          	csrw	sstatus,a5
    80003e70:	ffffe097          	auipc	ra,0xffffe
    80003e74:	618080e7          	jalr	1560(ra) # 80002488 <mycpu>
    80003e78:	07852783          	lw	a5,120(a0)
    80003e7c:	02078663          	beqz	a5,80003ea8 <push_on+0x5c>
    80003e80:	ffffe097          	auipc	ra,0xffffe
    80003e84:	608080e7          	jalr	1544(ra) # 80002488 <mycpu>
    80003e88:	07852783          	lw	a5,120(a0)
    80003e8c:	01813083          	ld	ra,24(sp)
    80003e90:	01013403          	ld	s0,16(sp)
    80003e94:	0017879b          	addiw	a5,a5,1
    80003e98:	06f52c23          	sw	a5,120(a0)
    80003e9c:	00813483          	ld	s1,8(sp)
    80003ea0:	02010113          	addi	sp,sp,32
    80003ea4:	00008067          	ret
    80003ea8:	0014d493          	srli	s1,s1,0x1
    80003eac:	ffffe097          	auipc	ra,0xffffe
    80003eb0:	5dc080e7          	jalr	1500(ra) # 80002488 <mycpu>
    80003eb4:	0014f493          	andi	s1,s1,1
    80003eb8:	06952e23          	sw	s1,124(a0)
    80003ebc:	fc5ff06f          	j	80003e80 <push_on+0x34>

0000000080003ec0 <pop_on>:
    80003ec0:	ff010113          	addi	sp,sp,-16
    80003ec4:	00813023          	sd	s0,0(sp)
    80003ec8:	00113423          	sd	ra,8(sp)
    80003ecc:	01010413          	addi	s0,sp,16
    80003ed0:	ffffe097          	auipc	ra,0xffffe
    80003ed4:	5b8080e7          	jalr	1464(ra) # 80002488 <mycpu>
    80003ed8:	100027f3          	csrr	a5,sstatus
    80003edc:	0027f793          	andi	a5,a5,2
    80003ee0:	04078463          	beqz	a5,80003f28 <pop_on+0x68>
    80003ee4:	07852783          	lw	a5,120(a0)
    80003ee8:	02f05863          	blez	a5,80003f18 <pop_on+0x58>
    80003eec:	fff7879b          	addiw	a5,a5,-1
    80003ef0:	06f52c23          	sw	a5,120(a0)
    80003ef4:	07853783          	ld	a5,120(a0)
    80003ef8:	00079863          	bnez	a5,80003f08 <pop_on+0x48>
    80003efc:	100027f3          	csrr	a5,sstatus
    80003f00:	ffd7f793          	andi	a5,a5,-3
    80003f04:	10079073          	csrw	sstatus,a5
    80003f08:	00813083          	ld	ra,8(sp)
    80003f0c:	00013403          	ld	s0,0(sp)
    80003f10:	01010113          	addi	sp,sp,16
    80003f14:	00008067          	ret
    80003f18:	00001517          	auipc	a0,0x1
    80003f1c:	4f850513          	addi	a0,a0,1272 # 80005410 <digits+0x70>
    80003f20:	fffff097          	auipc	ra,0xfffff
    80003f24:	f2c080e7          	jalr	-212(ra) # 80002e4c <panic>
    80003f28:	00001517          	auipc	a0,0x1
    80003f2c:	4c850513          	addi	a0,a0,1224 # 800053f0 <digits+0x50>
    80003f30:	fffff097          	auipc	ra,0xfffff
    80003f34:	f1c080e7          	jalr	-228(ra) # 80002e4c <panic>

0000000080003f38 <__memset>:
    80003f38:	ff010113          	addi	sp,sp,-16
    80003f3c:	00813423          	sd	s0,8(sp)
    80003f40:	01010413          	addi	s0,sp,16
    80003f44:	1a060e63          	beqz	a2,80004100 <__memset+0x1c8>
    80003f48:	40a007b3          	neg	a5,a0
    80003f4c:	0077f793          	andi	a5,a5,7
    80003f50:	00778693          	addi	a3,a5,7
    80003f54:	00b00813          	li	a6,11
    80003f58:	0ff5f593          	andi	a1,a1,255
    80003f5c:	fff6071b          	addiw	a4,a2,-1
    80003f60:	1b06e663          	bltu	a3,a6,8000410c <__memset+0x1d4>
    80003f64:	1cd76463          	bltu	a4,a3,8000412c <__memset+0x1f4>
    80003f68:	1a078e63          	beqz	a5,80004124 <__memset+0x1ec>
    80003f6c:	00b50023          	sb	a1,0(a0)
    80003f70:	00100713          	li	a4,1
    80003f74:	1ae78463          	beq	a5,a4,8000411c <__memset+0x1e4>
    80003f78:	00b500a3          	sb	a1,1(a0)
    80003f7c:	00200713          	li	a4,2
    80003f80:	1ae78a63          	beq	a5,a4,80004134 <__memset+0x1fc>
    80003f84:	00b50123          	sb	a1,2(a0)
    80003f88:	00300713          	li	a4,3
    80003f8c:	18e78463          	beq	a5,a4,80004114 <__memset+0x1dc>
    80003f90:	00b501a3          	sb	a1,3(a0)
    80003f94:	00400713          	li	a4,4
    80003f98:	1ae78263          	beq	a5,a4,8000413c <__memset+0x204>
    80003f9c:	00b50223          	sb	a1,4(a0)
    80003fa0:	00500713          	li	a4,5
    80003fa4:	1ae78063          	beq	a5,a4,80004144 <__memset+0x20c>
    80003fa8:	00b502a3          	sb	a1,5(a0)
    80003fac:	00700713          	li	a4,7
    80003fb0:	18e79e63          	bne	a5,a4,8000414c <__memset+0x214>
    80003fb4:	00b50323          	sb	a1,6(a0)
    80003fb8:	00700e93          	li	t4,7
    80003fbc:	00859713          	slli	a4,a1,0x8
    80003fc0:	00e5e733          	or	a4,a1,a4
    80003fc4:	01059e13          	slli	t3,a1,0x10
    80003fc8:	01c76e33          	or	t3,a4,t3
    80003fcc:	01859313          	slli	t1,a1,0x18
    80003fd0:	006e6333          	or	t1,t3,t1
    80003fd4:	02059893          	slli	a7,a1,0x20
    80003fd8:	40f60e3b          	subw	t3,a2,a5
    80003fdc:	011368b3          	or	a7,t1,a7
    80003fe0:	02859813          	slli	a6,a1,0x28
    80003fe4:	0108e833          	or	a6,a7,a6
    80003fe8:	03059693          	slli	a3,a1,0x30
    80003fec:	003e589b          	srliw	a7,t3,0x3
    80003ff0:	00d866b3          	or	a3,a6,a3
    80003ff4:	03859713          	slli	a4,a1,0x38
    80003ff8:	00389813          	slli	a6,a7,0x3
    80003ffc:	00f507b3          	add	a5,a0,a5
    80004000:	00e6e733          	or	a4,a3,a4
    80004004:	000e089b          	sext.w	a7,t3
    80004008:	00f806b3          	add	a3,a6,a5
    8000400c:	00e7b023          	sd	a4,0(a5)
    80004010:	00878793          	addi	a5,a5,8
    80004014:	fed79ce3          	bne	a5,a3,8000400c <__memset+0xd4>
    80004018:	ff8e7793          	andi	a5,t3,-8
    8000401c:	0007871b          	sext.w	a4,a5
    80004020:	01d787bb          	addw	a5,a5,t4
    80004024:	0ce88e63          	beq	a7,a4,80004100 <__memset+0x1c8>
    80004028:	00f50733          	add	a4,a0,a5
    8000402c:	00b70023          	sb	a1,0(a4)
    80004030:	0017871b          	addiw	a4,a5,1
    80004034:	0cc77663          	bgeu	a4,a2,80004100 <__memset+0x1c8>
    80004038:	00e50733          	add	a4,a0,a4
    8000403c:	00b70023          	sb	a1,0(a4)
    80004040:	0027871b          	addiw	a4,a5,2
    80004044:	0ac77e63          	bgeu	a4,a2,80004100 <__memset+0x1c8>
    80004048:	00e50733          	add	a4,a0,a4
    8000404c:	00b70023          	sb	a1,0(a4)
    80004050:	0037871b          	addiw	a4,a5,3
    80004054:	0ac77663          	bgeu	a4,a2,80004100 <__memset+0x1c8>
    80004058:	00e50733          	add	a4,a0,a4
    8000405c:	00b70023          	sb	a1,0(a4)
    80004060:	0047871b          	addiw	a4,a5,4
    80004064:	08c77e63          	bgeu	a4,a2,80004100 <__memset+0x1c8>
    80004068:	00e50733          	add	a4,a0,a4
    8000406c:	00b70023          	sb	a1,0(a4)
    80004070:	0057871b          	addiw	a4,a5,5
    80004074:	08c77663          	bgeu	a4,a2,80004100 <__memset+0x1c8>
    80004078:	00e50733          	add	a4,a0,a4
    8000407c:	00b70023          	sb	a1,0(a4)
    80004080:	0067871b          	addiw	a4,a5,6
    80004084:	06c77e63          	bgeu	a4,a2,80004100 <__memset+0x1c8>
    80004088:	00e50733          	add	a4,a0,a4
    8000408c:	00b70023          	sb	a1,0(a4)
    80004090:	0077871b          	addiw	a4,a5,7
    80004094:	06c77663          	bgeu	a4,a2,80004100 <__memset+0x1c8>
    80004098:	00e50733          	add	a4,a0,a4
    8000409c:	00b70023          	sb	a1,0(a4)
    800040a0:	0087871b          	addiw	a4,a5,8
    800040a4:	04c77e63          	bgeu	a4,a2,80004100 <__memset+0x1c8>
    800040a8:	00e50733          	add	a4,a0,a4
    800040ac:	00b70023          	sb	a1,0(a4)
    800040b0:	0097871b          	addiw	a4,a5,9
    800040b4:	04c77663          	bgeu	a4,a2,80004100 <__memset+0x1c8>
    800040b8:	00e50733          	add	a4,a0,a4
    800040bc:	00b70023          	sb	a1,0(a4)
    800040c0:	00a7871b          	addiw	a4,a5,10
    800040c4:	02c77e63          	bgeu	a4,a2,80004100 <__memset+0x1c8>
    800040c8:	00e50733          	add	a4,a0,a4
    800040cc:	00b70023          	sb	a1,0(a4)
    800040d0:	00b7871b          	addiw	a4,a5,11
    800040d4:	02c77663          	bgeu	a4,a2,80004100 <__memset+0x1c8>
    800040d8:	00e50733          	add	a4,a0,a4
    800040dc:	00b70023          	sb	a1,0(a4)
    800040e0:	00c7871b          	addiw	a4,a5,12
    800040e4:	00c77e63          	bgeu	a4,a2,80004100 <__memset+0x1c8>
    800040e8:	00e50733          	add	a4,a0,a4
    800040ec:	00b70023          	sb	a1,0(a4)
    800040f0:	00d7879b          	addiw	a5,a5,13
    800040f4:	00c7f663          	bgeu	a5,a2,80004100 <__memset+0x1c8>
    800040f8:	00f507b3          	add	a5,a0,a5
    800040fc:	00b78023          	sb	a1,0(a5)
    80004100:	00813403          	ld	s0,8(sp)
    80004104:	01010113          	addi	sp,sp,16
    80004108:	00008067          	ret
    8000410c:	00b00693          	li	a3,11
    80004110:	e55ff06f          	j	80003f64 <__memset+0x2c>
    80004114:	00300e93          	li	t4,3
    80004118:	ea5ff06f          	j	80003fbc <__memset+0x84>
    8000411c:	00100e93          	li	t4,1
    80004120:	e9dff06f          	j	80003fbc <__memset+0x84>
    80004124:	00000e93          	li	t4,0
    80004128:	e95ff06f          	j	80003fbc <__memset+0x84>
    8000412c:	00000793          	li	a5,0
    80004130:	ef9ff06f          	j	80004028 <__memset+0xf0>
    80004134:	00200e93          	li	t4,2
    80004138:	e85ff06f          	j	80003fbc <__memset+0x84>
    8000413c:	00400e93          	li	t4,4
    80004140:	e7dff06f          	j	80003fbc <__memset+0x84>
    80004144:	00500e93          	li	t4,5
    80004148:	e75ff06f          	j	80003fbc <__memset+0x84>
    8000414c:	00600e93          	li	t4,6
    80004150:	e6dff06f          	j	80003fbc <__memset+0x84>

0000000080004154 <__memmove>:
    80004154:	ff010113          	addi	sp,sp,-16
    80004158:	00813423          	sd	s0,8(sp)
    8000415c:	01010413          	addi	s0,sp,16
    80004160:	0e060863          	beqz	a2,80004250 <__memmove+0xfc>
    80004164:	fff6069b          	addiw	a3,a2,-1
    80004168:	0006881b          	sext.w	a6,a3
    8000416c:	0ea5e863          	bltu	a1,a0,8000425c <__memmove+0x108>
    80004170:	00758713          	addi	a4,a1,7
    80004174:	00a5e7b3          	or	a5,a1,a0
    80004178:	40a70733          	sub	a4,a4,a0
    8000417c:	0077f793          	andi	a5,a5,7
    80004180:	00f73713          	sltiu	a4,a4,15
    80004184:	00174713          	xori	a4,a4,1
    80004188:	0017b793          	seqz	a5,a5
    8000418c:	00e7f7b3          	and	a5,a5,a4
    80004190:	10078863          	beqz	a5,800042a0 <__memmove+0x14c>
    80004194:	00900793          	li	a5,9
    80004198:	1107f463          	bgeu	a5,a6,800042a0 <__memmove+0x14c>
    8000419c:	0036581b          	srliw	a6,a2,0x3
    800041a0:	fff8081b          	addiw	a6,a6,-1
    800041a4:	02081813          	slli	a6,a6,0x20
    800041a8:	01d85893          	srli	a7,a6,0x1d
    800041ac:	00858813          	addi	a6,a1,8
    800041b0:	00058793          	mv	a5,a1
    800041b4:	00050713          	mv	a4,a0
    800041b8:	01088833          	add	a6,a7,a6
    800041bc:	0007b883          	ld	a7,0(a5)
    800041c0:	00878793          	addi	a5,a5,8
    800041c4:	00870713          	addi	a4,a4,8
    800041c8:	ff173c23          	sd	a7,-8(a4)
    800041cc:	ff0798e3          	bne	a5,a6,800041bc <__memmove+0x68>
    800041d0:	ff867713          	andi	a4,a2,-8
    800041d4:	02071793          	slli	a5,a4,0x20
    800041d8:	0207d793          	srli	a5,a5,0x20
    800041dc:	00f585b3          	add	a1,a1,a5
    800041e0:	40e686bb          	subw	a3,a3,a4
    800041e4:	00f507b3          	add	a5,a0,a5
    800041e8:	06e60463          	beq	a2,a4,80004250 <__memmove+0xfc>
    800041ec:	0005c703          	lbu	a4,0(a1)
    800041f0:	00e78023          	sb	a4,0(a5)
    800041f4:	04068e63          	beqz	a3,80004250 <__memmove+0xfc>
    800041f8:	0015c603          	lbu	a2,1(a1)
    800041fc:	00100713          	li	a4,1
    80004200:	00c780a3          	sb	a2,1(a5)
    80004204:	04e68663          	beq	a3,a4,80004250 <__memmove+0xfc>
    80004208:	0025c603          	lbu	a2,2(a1)
    8000420c:	00200713          	li	a4,2
    80004210:	00c78123          	sb	a2,2(a5)
    80004214:	02e68e63          	beq	a3,a4,80004250 <__memmove+0xfc>
    80004218:	0035c603          	lbu	a2,3(a1)
    8000421c:	00300713          	li	a4,3
    80004220:	00c781a3          	sb	a2,3(a5)
    80004224:	02e68663          	beq	a3,a4,80004250 <__memmove+0xfc>
    80004228:	0045c603          	lbu	a2,4(a1)
    8000422c:	00400713          	li	a4,4
    80004230:	00c78223          	sb	a2,4(a5)
    80004234:	00e68e63          	beq	a3,a4,80004250 <__memmove+0xfc>
    80004238:	0055c603          	lbu	a2,5(a1)
    8000423c:	00500713          	li	a4,5
    80004240:	00c782a3          	sb	a2,5(a5)
    80004244:	00e68663          	beq	a3,a4,80004250 <__memmove+0xfc>
    80004248:	0065c703          	lbu	a4,6(a1)
    8000424c:	00e78323          	sb	a4,6(a5)
    80004250:	00813403          	ld	s0,8(sp)
    80004254:	01010113          	addi	sp,sp,16
    80004258:	00008067          	ret
    8000425c:	02061713          	slli	a4,a2,0x20
    80004260:	02075713          	srli	a4,a4,0x20
    80004264:	00e587b3          	add	a5,a1,a4
    80004268:	f0f574e3          	bgeu	a0,a5,80004170 <__memmove+0x1c>
    8000426c:	02069613          	slli	a2,a3,0x20
    80004270:	02065613          	srli	a2,a2,0x20
    80004274:	fff64613          	not	a2,a2
    80004278:	00e50733          	add	a4,a0,a4
    8000427c:	00c78633          	add	a2,a5,a2
    80004280:	fff7c683          	lbu	a3,-1(a5)
    80004284:	fff78793          	addi	a5,a5,-1
    80004288:	fff70713          	addi	a4,a4,-1
    8000428c:	00d70023          	sb	a3,0(a4)
    80004290:	fec798e3          	bne	a5,a2,80004280 <__memmove+0x12c>
    80004294:	00813403          	ld	s0,8(sp)
    80004298:	01010113          	addi	sp,sp,16
    8000429c:	00008067          	ret
    800042a0:	02069713          	slli	a4,a3,0x20
    800042a4:	02075713          	srli	a4,a4,0x20
    800042a8:	00170713          	addi	a4,a4,1
    800042ac:	00e50733          	add	a4,a0,a4
    800042b0:	00050793          	mv	a5,a0
    800042b4:	0005c683          	lbu	a3,0(a1)
    800042b8:	00178793          	addi	a5,a5,1
    800042bc:	00158593          	addi	a1,a1,1
    800042c0:	fed78fa3          	sb	a3,-1(a5)
    800042c4:	fee798e3          	bne	a5,a4,800042b4 <__memmove+0x160>
    800042c8:	f89ff06f          	j	80004250 <__memmove+0xfc>

00000000800042cc <__putc>:
    800042cc:	fe010113          	addi	sp,sp,-32
    800042d0:	00813823          	sd	s0,16(sp)
    800042d4:	00113c23          	sd	ra,24(sp)
    800042d8:	02010413          	addi	s0,sp,32
    800042dc:	00050793          	mv	a5,a0
    800042e0:	fef40593          	addi	a1,s0,-17
    800042e4:	00100613          	li	a2,1
    800042e8:	00000513          	li	a0,0
    800042ec:	fef407a3          	sb	a5,-17(s0)
    800042f0:	fffff097          	auipc	ra,0xfffff
    800042f4:	b3c080e7          	jalr	-1220(ra) # 80002e2c <console_write>
    800042f8:	01813083          	ld	ra,24(sp)
    800042fc:	01013403          	ld	s0,16(sp)
    80004300:	02010113          	addi	sp,sp,32
    80004304:	00008067          	ret

0000000080004308 <__getc>:
    80004308:	fe010113          	addi	sp,sp,-32
    8000430c:	00813823          	sd	s0,16(sp)
    80004310:	00113c23          	sd	ra,24(sp)
    80004314:	02010413          	addi	s0,sp,32
    80004318:	fe840593          	addi	a1,s0,-24
    8000431c:	00100613          	li	a2,1
    80004320:	00000513          	li	a0,0
    80004324:	fffff097          	auipc	ra,0xfffff
    80004328:	ae8080e7          	jalr	-1304(ra) # 80002e0c <console_read>
    8000432c:	fe844503          	lbu	a0,-24(s0)
    80004330:	01813083          	ld	ra,24(sp)
    80004334:	01013403          	ld	s0,16(sp)
    80004338:	02010113          	addi	sp,sp,32
    8000433c:	00008067          	ret

0000000080004340 <console_handler>:
    80004340:	fe010113          	addi	sp,sp,-32
    80004344:	00813823          	sd	s0,16(sp)
    80004348:	00113c23          	sd	ra,24(sp)
    8000434c:	00913423          	sd	s1,8(sp)
    80004350:	02010413          	addi	s0,sp,32
    80004354:	14202773          	csrr	a4,scause
    80004358:	100027f3          	csrr	a5,sstatus
    8000435c:	0027f793          	andi	a5,a5,2
    80004360:	06079e63          	bnez	a5,800043dc <console_handler+0x9c>
    80004364:	00074c63          	bltz	a4,8000437c <console_handler+0x3c>
    80004368:	01813083          	ld	ra,24(sp)
    8000436c:	01013403          	ld	s0,16(sp)
    80004370:	00813483          	ld	s1,8(sp)
    80004374:	02010113          	addi	sp,sp,32
    80004378:	00008067          	ret
    8000437c:	0ff77713          	andi	a4,a4,255
    80004380:	00900793          	li	a5,9
    80004384:	fef712e3          	bne	a4,a5,80004368 <console_handler+0x28>
    80004388:	ffffe097          	auipc	ra,0xffffe
    8000438c:	6dc080e7          	jalr	1756(ra) # 80002a64 <plic_claim>
    80004390:	00a00793          	li	a5,10
    80004394:	00050493          	mv	s1,a0
    80004398:	02f50c63          	beq	a0,a5,800043d0 <console_handler+0x90>
    8000439c:	fc0506e3          	beqz	a0,80004368 <console_handler+0x28>
    800043a0:	00050593          	mv	a1,a0
    800043a4:	00001517          	auipc	a0,0x1
    800043a8:	f7450513          	addi	a0,a0,-140 # 80005318 <_ZZ12printIntegermE6digits+0x2f8>
    800043ac:	fffff097          	auipc	ra,0xfffff
    800043b0:	afc080e7          	jalr	-1284(ra) # 80002ea8 <__printf>
    800043b4:	01013403          	ld	s0,16(sp)
    800043b8:	01813083          	ld	ra,24(sp)
    800043bc:	00048513          	mv	a0,s1
    800043c0:	00813483          	ld	s1,8(sp)
    800043c4:	02010113          	addi	sp,sp,32
    800043c8:	ffffe317          	auipc	t1,0xffffe
    800043cc:	6d430067          	jr	1748(t1) # 80002a9c <plic_complete>
    800043d0:	fffff097          	auipc	ra,0xfffff
    800043d4:	3e0080e7          	jalr	992(ra) # 800037b0 <uartintr>
    800043d8:	fddff06f          	j	800043b4 <console_handler+0x74>
    800043dc:	00001517          	auipc	a0,0x1
    800043e0:	03c50513          	addi	a0,a0,60 # 80005418 <digits+0x78>
    800043e4:	fffff097          	auipc	ra,0xfffff
    800043e8:	a68080e7          	jalr	-1432(ra) # 80002e4c <panic>
	...
