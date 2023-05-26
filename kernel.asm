
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00004117          	auipc	sp,0x4
    80000004:	7c813103          	ld	sp,1992(sp) # 800047c8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	3e9010ef          	jal	ra,80001c04 <start>

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
    80001188:	53c000ef          	jal	ra,800016c4 <interruptRoutine>

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
	size = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
    80001240:	00655793          	srli	a5,a0,0x6
    80001244:	03f57513          	andi	a0,a0,63
    80001248:	00050463          	beqz	a0,80001250 <_Z9mem_allocm+0x1c>
    8000124c:	00100513          	li	a0,1
    80001250:	00a78533          	add	a0,a5,a0
	__asm__ volatile("mv a1, %[size]": :[size] "r"(size));
    80001254:	00050593          	mv	a1,a0
	__asm__ volatile("li a0, 0x01");    //op code = 0x01
    80001258:	00100513          	li	a0,1
	__asm__ volatile("ecall");
    8000125c:	00000073          	ecall

	scall();

	void* ret;
	__asm__ volatile("mv %[ptr], a0":[ptr] "=r"(ret));
    80001260:	00050513          	mv	a0,a0
	return ret;
}
    80001264:	00813403          	ld	s0,8(sp)
    80001268:	01010113          	addi	sp,sp,16
    8000126c:	00008067          	ret

0000000080001270 <_Z8mem_freePv>:

int mem_free(void* ptr) {
    80001270:	ff010113          	addi	sp,sp,-16
    80001274:	00813423          	sd	s0,8(sp)
    80001278:	01010413          	addi	s0,sp,16
	__asm__ volatile("mv a1, %[ptr]": :[ptr] "r"(ptr));
    8000127c:	00050593          	mv	a1,a0
	__asm__ volatile("li a0, 0x02");    //op code = 0x02
    80001280:	00200513          	li	a0,2
	__asm__ volatile("ecall");
    80001284:	00000073          	ecall

	scall();

	int status;
	__asm__ volatile("mv %[status], a0":[status] "=r"(status));
    80001288:	00050513          	mv	a0,a0
	return status;
    8000128c:	0005051b          	sext.w	a0,a0
    80001290:	00813403          	ld	s0,8(sp)
    80001294:	01010113          	addi	sp,sp,16
    80001298:	00008067          	ret

000000008000129c <_Z11printStringPKc>:
#include "../h/helper.hpp"
#include "../lib/console.h"
#include "../h/riscv.hpp"

void printString(char const *string) {
    8000129c:	fd010113          	addi	sp,sp,-48
    800012a0:	02113423          	sd	ra,40(sp)
    800012a4:	02813023          	sd	s0,32(sp)
    800012a8:	00913c23          	sd	s1,24(sp)
    800012ac:	01213823          	sd	s2,16(sp)
    800012b0:	03010413          	addi	s0,sp,48
    800012b4:	00050493          	mv	s1,a0
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
}

inline uint64 Riscv::r_sstatus() {
	uint64 volatile sstatus;
	__asm__ volatile("csrr %[sstatus], sstatus": [sstatus] "=r"(sstatus));
    800012b8:	100027f3          	csrr	a5,sstatus
    800012bc:	fcf43c23          	sd	a5,-40(s0)
	return sstatus;
    800012c0:	fd843903          	ld	s2,-40(s0)
    uint64 oldMask = Riscv::r_sstatus() & Riscv::SSTATUS_SIE;
    800012c4:	00297913          	andi	s2,s2,2
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    800012c8:	00200793          	li	a5,2
    800012cc:	1007b073          	csrc	sstatus,a5
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    while (*string != '\0') {
    800012d0:	0004c503          	lbu	a0,0(s1)
    800012d4:	00050a63          	beqz	a0,800012e8 <_Z11printStringPKc+0x4c>
        __putc(*string);
    800012d8:	00003097          	auipc	ra,0x3
    800012dc:	9f4080e7          	jalr	-1548(ra) # 80003ccc <__putc>
        string++;
    800012e0:	00148493          	addi	s1,s1,1
    while (*string != '\0') {
    800012e4:	fedff06f          	j	800012d0 <_Z11printStringPKc+0x34>
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    800012e8:	10092073          	csrs	sstatus,s2
    }
    Riscv::ms_sstatus(oldMask);
}
    800012ec:	02813083          	ld	ra,40(sp)
    800012f0:	02013403          	ld	s0,32(sp)
    800012f4:	01813483          	ld	s1,24(sp)
    800012f8:	01013903          	ld	s2,16(sp)
    800012fc:	03010113          	addi	sp,sp,48
    80001300:	00008067          	ret

0000000080001304 <_Z7printlnPKc>:

void println(char const *string) {
    80001304:	fd010113          	addi	sp,sp,-48
    80001308:	02113423          	sd	ra,40(sp)
    8000130c:	02813023          	sd	s0,32(sp)
    80001310:	00913c23          	sd	s1,24(sp)
    80001314:	03010413          	addi	s0,sp,48
	__asm__ volatile("csrr %[sstatus], sstatus": [sstatus] "=r"(sstatus));
    80001318:	100027f3          	csrr	a5,sstatus
    8000131c:	fcf43c23          	sd	a5,-40(s0)
	return sstatus;
    80001320:	fd843483          	ld	s1,-40(s0)
    uint64 oldMask = Riscv::r_sstatus() & Riscv::SSTATUS_SIE;
    80001324:	0024f493          	andi	s1,s1,2
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80001328:	00200793          	li	a5,2
    8000132c:	1007b073          	csrc	sstatus,a5
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    printString(string);
    80001330:	00000097          	auipc	ra,0x0
    80001334:	f6c080e7          	jalr	-148(ra) # 8000129c <_Z11printStringPKc>
    __putc('\n');
    80001338:	00a00513          	li	a0,10
    8000133c:	00003097          	auipc	ra,0x3
    80001340:	990080e7          	jalr	-1648(ra) # 80003ccc <__putc>
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    80001344:	1004a073          	csrs	sstatus,s1
    Riscv::ms_sstatus(oldMask);
}
    80001348:	02813083          	ld	ra,40(sp)
    8000134c:	02013403          	ld	s0,32(sp)
    80001350:	01813483          	ld	s1,24(sp)
    80001354:	03010113          	addi	sp,sp,48
    80001358:	00008067          	ret

000000008000135c <_Z12printIntegerm>:

void printInteger(uint64 integer) {
    8000135c:	fc010113          	addi	sp,sp,-64
    80001360:	02113c23          	sd	ra,56(sp)
    80001364:	02813823          	sd	s0,48(sp)
    80001368:	02913423          	sd	s1,40(sp)
    8000136c:	03213023          	sd	s2,32(sp)
    80001370:	04010413          	addi	s0,sp,64
	__asm__ volatile("csrr %[sstatus], sstatus": [sstatus] "=r"(sstatus));
    80001374:	100027f3          	csrr	a5,sstatus
    80001378:	fcf43423          	sd	a5,-56(s0)
	return sstatus;
    8000137c:	fc843903          	ld	s2,-56(s0)
    uint64 oldMask = Riscv::r_sstatus() & Riscv::SSTATUS_SIE;
    80001380:	00297913          	andi	s2,s2,2
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80001384:	00200793          	li	a5,2
    80001388:	1007b073          	csrc	sstatus,a5
    neg = 0;
    if (integer < 0) {
        neg = 1;
        x = -integer;
    } else {
        x = integer;
    8000138c:	0005051b          	sext.w	a0,a0
    }

    i = 0;
    80001390:	00000493          	li	s1,0
    do {
        buf[i++] = digits[x % 10];
    80001394:	00a00613          	li	a2,10
    80001398:	02c5773b          	remuw	a4,a0,a2
    8000139c:	02071693          	slli	a3,a4,0x20
    800013a0:	0206d693          	srli	a3,a3,0x20
    800013a4:	00003717          	auipc	a4,0x3
    800013a8:	c7c70713          	addi	a4,a4,-900 # 80004020 <_ZZ12printIntegermE6digits>
    800013ac:	00d70733          	add	a4,a4,a3
    800013b0:	00074703          	lbu	a4,0(a4)
    800013b4:	fe040693          	addi	a3,s0,-32
    800013b8:	009687b3          	add	a5,a3,s1
    800013bc:	0014849b          	addiw	s1,s1,1
    800013c0:	fee78823          	sb	a4,-16(a5)
    } while ((x /= 10) != 0);
    800013c4:	0005071b          	sext.w	a4,a0
    800013c8:	02c5553b          	divuw	a0,a0,a2
    800013cc:	00900793          	li	a5,9
    800013d0:	fce7e2e3          	bltu	a5,a4,80001394 <_Z12printIntegerm+0x38>
    if (neg) buf[i++] = '-';

    while (--i >= 0) {
    800013d4:	fff4849b          	addiw	s1,s1,-1
    800013d8:	0004ce63          	bltz	s1,800013f4 <_Z12printIntegerm+0x98>
        __putc(buf[i]);
    800013dc:	fe040793          	addi	a5,s0,-32
    800013e0:	009787b3          	add	a5,a5,s1
    800013e4:	ff07c503          	lbu	a0,-16(a5)
    800013e8:	00003097          	auipc	ra,0x3
    800013ec:	8e4080e7          	jalr	-1820(ra) # 80003ccc <__putc>
    800013f0:	fe5ff06f          	j	800013d4 <_Z12printIntegerm+0x78>
	__asm__ volatile("csrs sstatus, %[mask]": :[mask] "r"(mask));
    800013f4:	10092073          	csrs	sstatus,s2
    }
    Riscv::ms_sstatus(oldMask);
}
    800013f8:	03813083          	ld	ra,56(sp)
    800013fc:	03013403          	ld	s0,48(sp)
    80001400:	02813483          	ld	s1,40(sp)
    80001404:	02013903          	ld	s2,32(sp)
    80001408:	04010113          	addi	sp,sp,64
    8000140c:	00008067          	ret

0000000080001410 <_Z41__static_initialization_and_destruction_0ii>:
	readyThreads.addLast(thread);
}

TCB* Scheduler::get() {
	return readyThreads.removeFirst();
}
    80001410:	ff010113          	addi	sp,sp,-16
    80001414:	00813423          	sd	s0,8(sp)
    80001418:	01010413          	addi	s0,sp,16
    8000141c:	00100793          	li	a5,1
    80001420:	00f50863          	beq	a0,a5,80001430 <_Z41__static_initialization_and_destruction_0ii+0x20>
    80001424:	00813403          	ld	s0,8(sp)
    80001428:	01010113          	addi	sp,sp,16
    8000142c:	00008067          	ret
    80001430:	000107b7          	lui	a5,0x10
    80001434:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80001438:	fef596e3          	bne	a1,a5,80001424 <_Z41__static_initialization_and_destruction_0ii+0x14>
	};

	Elem* head, * tail;
	uint64 numOfElements;
public:
	List() : head(nullptr), tail(nullptr), numOfElements(0) {}
    8000143c:	00003797          	auipc	a5,0x3
    80001440:	3f478793          	addi	a5,a5,1012 # 80004830 <_ZN9Scheduler12readyThreadsE>
    80001444:	0007b023          	sd	zero,0(a5)
    80001448:	0007b423          	sd	zero,8(a5)
    8000144c:	0007b823          	sd	zero,16(a5)
    80001450:	fd5ff06f          	j	80001424 <_Z41__static_initialization_and_destruction_0ii+0x14>

0000000080001454 <_ZN9Scheduler3putEP3TCB>:
void Scheduler::put(TCB* thread) {
    80001454:	fe010113          	addi	sp,sp,-32
    80001458:	00113c23          	sd	ra,24(sp)
    8000145c:	00813823          	sd	s0,16(sp)
    80001460:	00913423          	sd	s1,8(sp)
    80001464:	02010413          	addi	s0,sp,32
    80001468:	00050493          	mv	s1,a0
		if (!tail) { tail = head; }
		numOfElements++;
	}

	void addLast(T* data) {
		Elem* elem = new Elem(data, nullptr);
    8000146c:	01000513          	li	a0,16
    80001470:	00000097          	auipc	ra,0x0
    80001474:	114080e7          	jalr	276(ra) # 80001584 <_Znwm>
		Elem(T* data, Elem* next) : data(data), next(next) {}
    80001478:	00953023          	sd	s1,0(a0)
    8000147c:	00053423          	sd	zero,8(a0)
		if (tail) {
    80001480:	00003797          	auipc	a5,0x3
    80001484:	3b87b783          	ld	a5,952(a5) # 80004838 <_ZN9Scheduler12readyThreadsE+0x8>
    80001488:	02078c63          	beqz	a5,800014c0 <_ZN9Scheduler3putEP3TCB+0x6c>
			tail->next = elem;
    8000148c:	00a7b423          	sd	a0,8(a5)
			tail = elem;
    80001490:	00003797          	auipc	a5,0x3
    80001494:	3aa7b423          	sd	a0,936(a5) # 80004838 <_ZN9Scheduler12readyThreadsE+0x8>
		} else {
			head = tail = elem;
		}
		numOfElements++;
    80001498:	00003717          	auipc	a4,0x3
    8000149c:	39870713          	addi	a4,a4,920 # 80004830 <_ZN9Scheduler12readyThreadsE>
    800014a0:	01073783          	ld	a5,16(a4)
    800014a4:	00178793          	addi	a5,a5,1
    800014a8:	00f73823          	sd	a5,16(a4)
}
    800014ac:	01813083          	ld	ra,24(sp)
    800014b0:	01013403          	ld	s0,16(sp)
    800014b4:	00813483          	ld	s1,8(sp)
    800014b8:	02010113          	addi	sp,sp,32
    800014bc:	00008067          	ret
			head = tail = elem;
    800014c0:	00003797          	auipc	a5,0x3
    800014c4:	37078793          	addi	a5,a5,880 # 80004830 <_ZN9Scheduler12readyThreadsE>
    800014c8:	00a7b423          	sd	a0,8(a5)
    800014cc:	00a7b023          	sd	a0,0(a5)
    800014d0:	fc9ff06f          	j	80001498 <_ZN9Scheduler3putEP3TCB+0x44>

00000000800014d4 <_ZN9Scheduler3getEv>:
TCB* Scheduler::get() {
    800014d4:	fe010113          	addi	sp,sp,-32
    800014d8:	00113c23          	sd	ra,24(sp)
    800014dc:	00813823          	sd	s0,16(sp)
    800014e0:	00913423          	sd	s1,8(sp)
    800014e4:	02010413          	addi	s0,sp,32
	}

	T* removeFirst() {
		if (!head) { return nullptr; }
    800014e8:	00003517          	auipc	a0,0x3
    800014ec:	34853503          	ld	a0,840(a0) # 80004830 <_ZN9Scheduler12readyThreadsE>
    800014f0:	04050c63          	beqz	a0,80001548 <_ZN9Scheduler3getEv+0x74>

		Elem* elem = head;
		head = head->next;
    800014f4:	00853783          	ld	a5,8(a0)
    800014f8:	00003717          	auipc	a4,0x3
    800014fc:	32f73c23          	sd	a5,824(a4) # 80004830 <_ZN9Scheduler12readyThreadsE>
		if (!head) { tail = nullptr; }
    80001500:	02078e63          	beqz	a5,8000153c <_ZN9Scheduler3getEv+0x68>

		T* ret = elem->data;
    80001504:	00053483          	ld	s1,0(a0)
		delete elem;
    80001508:	00000097          	auipc	ra,0x0
    8000150c:	0cc080e7          	jalr	204(ra) # 800015d4 <_ZdlPv>
		numOfElements--;
    80001510:	00003717          	auipc	a4,0x3
    80001514:	32070713          	addi	a4,a4,800 # 80004830 <_ZN9Scheduler12readyThreadsE>
    80001518:	01073783          	ld	a5,16(a4)
    8000151c:	fff78793          	addi	a5,a5,-1
    80001520:	00f73823          	sd	a5,16(a4)
}
    80001524:	00048513          	mv	a0,s1
    80001528:	01813083          	ld	ra,24(sp)
    8000152c:	01013403          	ld	s0,16(sp)
    80001530:	00813483          	ld	s1,8(sp)
    80001534:	02010113          	addi	sp,sp,32
    80001538:	00008067          	ret
		if (!head) { tail = nullptr; }
    8000153c:	00003797          	auipc	a5,0x3
    80001540:	2e07be23          	sd	zero,764(a5) # 80004838 <_ZN9Scheduler12readyThreadsE+0x8>
    80001544:	fc1ff06f          	j	80001504 <_ZN9Scheduler3getEv+0x30>
		if (!head) { return nullptr; }
    80001548:	00050493          	mv	s1,a0
	return readyThreads.removeFirst();
    8000154c:	fd9ff06f          	j	80001524 <_ZN9Scheduler3getEv+0x50>

0000000080001550 <_GLOBAL__sub_I__ZN9Scheduler12readyThreadsE>:
}
    80001550:	ff010113          	addi	sp,sp,-16
    80001554:	00113423          	sd	ra,8(sp)
    80001558:	00813023          	sd	s0,0(sp)
    8000155c:	01010413          	addi	s0,sp,16
    80001560:	000105b7          	lui	a1,0x10
    80001564:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80001568:	00100513          	li	a0,1
    8000156c:	00000097          	auipc	ra,0x0
    80001570:	ea4080e7          	jalr	-348(ra) # 80001410 <_Z41__static_initialization_and_destruction_0ii>
    80001574:	00813083          	ld	ra,8(sp)
    80001578:	00013403          	ld	s0,0(sp)
    8000157c:	01010113          	addi	sp,sp,16
    80001580:	00008067          	ret

0000000080001584 <_Znwm>:
//#include "../h/MemoryAllocator.hpp"

extern "C" void interruptHandler();

//override globalnog new
void* operator new(size_t size) {
    80001584:	ff010113          	addi	sp,sp,-16
    80001588:	00113423          	sd	ra,8(sp)
    8000158c:	00813023          	sd	s0,0(sp)
    80001590:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    80001594:	00000097          	auipc	ra,0x0
    80001598:	ca0080e7          	jalr	-864(ra) # 80001234 <_Z9mem_allocm>
}
    8000159c:	00813083          	ld	ra,8(sp)
    800015a0:	00013403          	ld	s0,0(sp)
    800015a4:	01010113          	addi	sp,sp,16
    800015a8:	00008067          	ret

00000000800015ac <_Znam>:

void* operator new[](size_t size) {
    800015ac:	ff010113          	addi	sp,sp,-16
    800015b0:	00113423          	sd	ra,8(sp)
    800015b4:	00813023          	sd	s0,0(sp)
    800015b8:	01010413          	addi	s0,sp,16
	return mem_alloc(size);
    800015bc:	00000097          	auipc	ra,0x0
    800015c0:	c78080e7          	jalr	-904(ra) # 80001234 <_Z9mem_allocm>
}
    800015c4:	00813083          	ld	ra,8(sp)
    800015c8:	00013403          	ld	s0,0(sp)
    800015cc:	01010113          	addi	sp,sp,16
    800015d0:	00008067          	ret

00000000800015d4 <_ZdlPv>:

void operator delete(void* ptr)noexcept {
    800015d4:	ff010113          	addi	sp,sp,-16
    800015d8:	00113423          	sd	ra,8(sp)
    800015dc:	00813023          	sd	s0,0(sp)
    800015e0:	01010413          	addi	s0,sp,16
mem_free(ptr);
    800015e4:	00000097          	auipc	ra,0x0
    800015e8:	c8c080e7          	jalr	-884(ra) # 80001270 <_Z8mem_freePv>
}
    800015ec:	00813083          	ld	ra,8(sp)
    800015f0:	00013403          	ld	s0,0(sp)
    800015f4:	01010113          	addi	sp,sp,16
    800015f8:	00008067          	ret

00000000800015fc <_ZdaPv>:

void operator delete[](void* ptr)noexcept {
    800015fc:	ff010113          	addi	sp,sp,-16
    80001600:	00113423          	sd	ra,8(sp)
    80001604:	00813023          	sd	s0,0(sp)
    80001608:	01010413          	addi	s0,sp,16
mem_free(ptr);
    8000160c:	00000097          	auipc	ra,0x0
    80001610:	c64080e7          	jalr	-924(ra) # 80001270 <_Z8mem_freePv>
}
    80001614:	00813083          	ld	ra,8(sp)
    80001618:	00013403          	ld	s0,0(sp)
    8000161c:	01010113          	addi	sp,sp,16
    80001620:	00008067          	ret

0000000080001624 <main>:
//void dispatch() {
//	__asm__ volatile ("mv %[savedPC], ra":[savedPC] "=r"(temp));
//	__asm__ volatile("mv ra, %[fAddress]": : [fAddress] "r"(&f));
//}

int main() {
    80001624:	fd010113          	addi	sp,sp,-48
    80001628:	02113423          	sd	ra,40(sp)
    8000162c:	02813023          	sd	s0,32(sp)
    80001630:	03010413          	addi	s0,sp,48
	__asm__ volatile("csrc sstatus, %[mask]": :[mask] "r"(mask));
    80001634:	00200793          	li	a5,2
    80001638:	1007b073          	csrc	sstatus,a5
	//zabrani prekide
	Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
	//postavi adresu prekidne rutine u stvec
	Riscv::w_stvec((uint64)&interruptHandler);
    8000163c:	00003797          	auipc	a5,0x3
    80001640:	19c7b783          	ld	a5,412(a5) # 800047d8 <_GLOBAL_OFFSET_TABLE_+0x20>
	__asm__ volatile("csrw stvec, %[stvec]": :[stvec] "r"(stvec));
    80001644:	10579073          	csrw	stvec,a5
	};

	Elem* head, * tail;
	uint64 numOfElements;
public:
	List() : head(nullptr), tail(nullptr), numOfElements(0) {}
    80001648:	fc043c23          	sd	zero,-40(s0)
    8000164c:	fe043023          	sd	zero,-32(s0)
//		}
//	}
//	printInteger(i);

	List<uint64> lista;
	uint64 num = 10;
    80001650:	00a00793          	li	a5,10
    80001654:	fcf43823          	sd	a5,-48(s0)
	List<T>& operator=(const List<T>&) = delete;

	uint64 getNumOfElems() { return numOfElements; }

	void addFirst(T* data) {
		Elem* elem = new Elem(data, head);
    80001658:	01000513          	li	a0,16
    8000165c:	00000097          	auipc	ra,0x0
    80001660:	f28080e7          	jalr	-216(ra) # 80001584 <_Znwm>
		Elem(T* data, Elem* next) : data(data), next(next) {}
    80001664:	fd040793          	addi	a5,s0,-48
    80001668:	00f53023          	sd	a5,0(a0)
    8000166c:	fd843783          	ld	a5,-40(s0)
    80001670:	00f53423          	sd	a5,8(a0)
		head = elem;
    80001674:	fca43c23          	sd	a0,-40(s0)
	lista.addFirst(&num);
	println("");
    80001678:	00003517          	auipc	a0,0x3
    8000167c:	b2050513          	addi	a0,a0,-1248 # 80004198 <_ZZ12printIntegermE6digits+0x178>
    80001680:	00000097          	auipc	ra,0x0
    80001684:	c84080e7          	jalr	-892(ra) # 80001304 <_Z7printlnPKc>
		numOfElements--;
		return ret;
	}

	T* peekFirst() {
		if (!head) { return nullptr; }
    80001688:	fd843783          	ld	a5,-40(s0)
    8000168c:	00078463          	beqz	a5,80001694 <main+0x70>
		return head->data;
    80001690:	0007b783          	ld	a5,0(a5)
	printInteger(*lista.peekFirst());
    80001694:	0007b503          	ld	a0,0(a5)
    80001698:	00000097          	auipc	ra,0x0
    8000169c:	cc4080e7          	jalr	-828(ra) # 8000135c <_Z12printIntegerm>
	println("");
    800016a0:	00003517          	auipc	a0,0x3
    800016a4:	af850513          	addi	a0,a0,-1288 # 80004198 <_ZZ12printIntegermE6digits+0x178>
    800016a8:	00000097          	auipc	ra,0x0
    800016ac:	c5c080e7          	jalr	-932(ra) # 80001304 <_Z7printlnPKc>

    //maskiraj prekide
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    */
	return 0;
    800016b0:	00000513          	li	a0,0
    800016b4:	02813083          	ld	ra,40(sp)
    800016b8:	02013403          	ld	s0,32(sp)
    800016bc:	03010113          	addi	sp,sp,48
    800016c0:	00008067          	ret

00000000800016c4 <interruptRoutine>:
#include "../h/MemoryAllocator.hpp"
#include "../h/helper.hpp"
#include "../h/riscv.hpp"
#include "../h/syscall_c.hpp"

extern "C" void interruptRoutine() {
    800016c4:	fd010113          	addi	sp,sp,-48
    800016c8:	02113423          	sd	ra,40(sp)
    800016cc:	02813023          	sd	s0,32(sp)
    800016d0:	00913c23          	sd	s1,24(sp)
    800016d4:	03010413          	addi	s0,sp,48
	__asm__ volatile("csrr %[scause], scause": [scause] "=r"(scause));
    800016d8:	142027f3          	csrr	a5,scause
    800016dc:	fcf43c23          	sd	a5,-40(s0)
	return scause;
    800016e0:	fd843703          	ld	a4,-40(s0)
	__asm__ volatile("csrr %[sepc], sepc": [sepc] "=r"(sepc));
    800016e4:	141027f3          	csrr	a5,sepc
    800016e8:	fcf43823          	sd	a5,-48(s0)
	return sepc;
    800016ec:	fd043483          	ld	s1,-48(s0)
	uint64 scause = Riscv::r_scause();
	uint64 sepc = Riscv::r_sepc();

	if (scause == 0x09 || scause == 0x08) {
    800016f0:	ff870693          	addi	a3,a4,-8
    800016f4:	00100793          	li	a5,1
    800016f8:	02d7f863          	bgeu	a5,a3,80001728 <interruptRoutine+0x64>
				println("Nepostojeci op code");
				break;
		}
		//sepc pokazuje na ecall instrukciju, treba preci na sledecu instrukciju
		Riscv::w_sepc(sepc + 4);
	} else if (scause == (1UL << 63 | 9)) {
    800016fc:	fff00793          	li	a5,-1
    80001700:	03f79793          	slli	a5,a5,0x3f
    80001704:	00978793          	addi	a5,a5,9
    80001708:	08f70c63          	beq	a4,a5,800017a0 <interruptRoutine+0xdc>
		//spoljasnji hardverski prekid
		console_handler();
	} else if (scause == (1UL << 63 | 1)) {
    8000170c:	fff00793          	li	a5,-1
    80001710:	03f79793          	slli	a5,a5,0x3f
    80001714:	00178793          	addi	a5,a5,1
    80001718:	08f71a63          	bne	a4,a5,800017ac <interruptRoutine+0xe8>
	__asm__ volatile("csrc sip, %[mask]": :[mask] "r"(mask));
    8000171c:	00200793          	li	a5,2
    80001720:	1447b073          	csrc	sip,a5
}
    80001724:	0440006f          	j	80001768 <interruptRoutine+0xa4>
		__asm__ volatile("mv %[op], a0":[op] "=r"(opCode));
    80001728:	00050793          	mv	a5,a0
		switch (opCode) {
    8000172c:	04200713          	li	a4,66
    80001730:	04f76e63          	bltu	a4,a5,8000178c <interruptRoutine+0xc8>
    80001734:	00279793          	slli	a5,a5,0x2
    80001738:	00003717          	auipc	a4,0x3
    8000173c:	92c70713          	addi	a4,a4,-1748 # 80004064 <_ZZ12printIntegermE6digits+0x44>
    80001740:	00e787b3          	add	a5,a5,a4
    80001744:	0007a783          	lw	a5,0(a5)
    80001748:	00e787b3          	add	a5,a5,a4
    8000174c:	00078067          	jr	a5
				__asm__ volatile("mv %[size], a1":[size] "=r"(size));
    80001750:	00058513          	mv	a0,a1
				MemoryAllocator::kmalloc(size);
    80001754:	00651513          	slli	a0,a0,0x6
    80001758:	00000097          	auipc	ra,0x0
    8000175c:	1e4080e7          	jalr	484(ra) # 8000193c <_ZN15MemoryAllocator7kmallocEm>
		Riscv::w_sepc(sepc + 4);
    80001760:	00448493          	addi	s1,s1,4
	__asm__ volatile("csrw sepc, %[sepc]": :[sepc] "r"(sepc));
    80001764:	14149073          	csrw	sepc,s1
		//prekid od tajmera
		Riscv::mc_sip(Riscv::SIP_SSIP);
	} else {
		println("Greska u prekidnoj rutini");
	}
}
    80001768:	02813083          	ld	ra,40(sp)
    8000176c:	02013403          	ld	s0,32(sp)
    80001770:	01813483          	ld	s1,24(sp)
    80001774:	03010113          	addi	sp,sp,48
    80001778:	00008067          	ret
				__asm__ volatile("mv %[ptr], a1" :[ptr]"=r"(ptr));
    8000177c:	00058513          	mv	a0,a1
				MemoryAllocator::kfree(ptr);
    80001780:	00000097          	auipc	ra,0x0
    80001784:	364080e7          	jalr	868(ra) # 80001ae4 <_ZN15MemoryAllocator5kfreeEPv>
				break;
    80001788:	fd9ff06f          	j	80001760 <interruptRoutine+0x9c>
				println("Nepostojeci op code");
    8000178c:	00003517          	auipc	a0,0x3
    80001790:	8a450513          	addi	a0,a0,-1884 # 80004030 <_ZZ12printIntegermE6digits+0x10>
    80001794:	00000097          	auipc	ra,0x0
    80001798:	b70080e7          	jalr	-1168(ra) # 80001304 <_Z7printlnPKc>
				break;
    8000179c:	fc5ff06f          	j	80001760 <interruptRoutine+0x9c>
		console_handler();
    800017a0:	00002097          	auipc	ra,0x2
    800017a4:	5a0080e7          	jalr	1440(ra) # 80003d40 <console_handler>
    800017a8:	fc1ff06f          	j	80001768 <interruptRoutine+0xa4>
		println("Greska u prekidnoj rutini");
    800017ac:	00003517          	auipc	a0,0x3
    800017b0:	89c50513          	addi	a0,a0,-1892 # 80004048 <_ZZ12printIntegermE6digits+0x28>
    800017b4:	00000097          	auipc	ra,0x0
    800017b8:	b50080e7          	jalr	-1200(ra) # 80001304 <_Z7printlnPKc>
}
    800017bc:	fadff06f          	j	80001768 <interruptRoutine+0xa4>

00000000800017c0 <_ZN3TCB15functionWrapperEPv>:
	Riscv::pushRegisters();
	TCB::dispatch();
	Riscv::popRegisters();
}

void TCB::functionWrapper(void*) {
    800017c0:	ff010113          	addi	sp,sp,-16
    800017c4:	00813423          	sd	s0,8(sp)
    800017c8:	01010413          	addi	s0,sp,16

}
    800017cc:	00813403          	ld	s0,8(sp)
    800017d0:	01010113          	addi	sp,sp,16
    800017d4:	00008067          	ret

00000000800017d8 <_ZN3TCB12createThreadEPFvPvES0_Pm>:
TCB* TCB::createThread(TCB::Body function, void* args, uint64* stack) {
    800017d8:	fd010113          	addi	sp,sp,-48
    800017dc:	02113423          	sd	ra,40(sp)
    800017e0:	02813023          	sd	s0,32(sp)
    800017e4:	00913c23          	sd	s1,24(sp)
    800017e8:	01213823          	sd	s2,16(sp)
    800017ec:	01313423          	sd	s3,8(sp)
    800017f0:	01413023          	sd	s4,0(sp)
    800017f4:	03010413          	addi	s0,sp,48
    800017f8:	00050a13          	mv	s4,a0
    800017fc:	00058993          	mv	s3,a1
    80001800:	00060913          	mv	s2,a2
	return new TCB(function, args, stack);
    80001804:	03800513          	li	a0,56
    80001808:	00000097          	auipc	ra,0x0
    8000180c:	d7c080e7          	jalr	-644(ra) # 80001584 <_Znwm>
    80001810:	00050493          	mv	s1,a0
	static TCB* running;
	static uint64 runningTimeSlice;

private:
	TCB(Body function, void* args, uint64* stack) {
		this->threadFunction = function;
    80001814:	01453823          	sd	s4,16(a0)
		this->args = args;
    80001818:	03353023          	sd	s3,32(a0)
		this->stack = stack;
    8000181c:	01253c23          	sd	s2,24(a0)
		this->timeSlice = DEFAULT_TIME_SLICE;
    80001820:	00200793          	li	a5,2
    80001824:	02f53423          	sd	a5,40(a0)
		this->finished = false;
    80001828:	02050823          	sb	zero,48(a0)
		this->blocked = false;
    8000182c:	020508a3          	sb	zero,49(a0)
		this->context.ra = (uint64)&functionWrapper;
    80001830:	00000797          	auipc	a5,0x0
    80001834:	f9078793          	addi	a5,a5,-112 # 800017c0 <_ZN3TCB15functionWrapperEPv>
    80001838:	00f53423          	sd	a5,8(a0)
		this->context.sp = (uint64)&stack[DEFAULT_STACK_SIZE];
    8000183c:	00008637          	lui	a2,0x8
    80001840:	00c90933          	add	s2,s2,a2
    80001844:	01253023          	sd	s2,0(a0)

		Scheduler::put(this);
    80001848:	00000097          	auipc	ra,0x0
    8000184c:	c0c080e7          	jalr	-1012(ra) # 80001454 <_ZN9Scheduler3putEP3TCB>
    80001850:	0200006f          	j	80001870 <_ZN3TCB12createThreadEPFvPvES0_Pm+0x98>
    80001854:	00050913          	mv	s2,a0
    80001858:	00048513          	mv	a0,s1
    8000185c:	00000097          	auipc	ra,0x0
    80001860:	d78080e7          	jalr	-648(ra) # 800015d4 <_ZdlPv>
    80001864:	00090513          	mv	a0,s2
    80001868:	00004097          	auipc	ra,0x4
    8000186c:	0d0080e7          	jalr	208(ra) # 80005938 <_Unwind_Resume>
}
    80001870:	00048513          	mv	a0,s1
    80001874:	02813083          	ld	ra,40(sp)
    80001878:	02013403          	ld	s0,32(sp)
    8000187c:	01813483          	ld	s1,24(sp)
    80001880:	01013903          	ld	s2,16(sp)
    80001884:	00813983          	ld	s3,8(sp)
    80001888:	00013a03          	ld	s4,0(sp)
    8000188c:	03010113          	addi	sp,sp,48
    80001890:	00008067          	ret

0000000080001894 <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    80001894:	fe010113          	addi	sp,sp,-32
    80001898:	00113c23          	sd	ra,24(sp)
    8000189c:	00813823          	sd	s0,16(sp)
    800018a0:	00913423          	sd	s1,8(sp)
    800018a4:	02010413          	addi	s0,sp,32
	TCB* old = TCB::running;
    800018a8:	00003497          	auipc	s1,0x3
    800018ac:	fa04b483          	ld	s1,-96(s1) # 80004848 <_ZN3TCB7runningE>
	bool isFinished() { return finished; }
    800018b0:	0304c783          	lbu	a5,48(s1)
	if (!old->isFinished() && !old->isBlocked()) {
    800018b4:	00079663          	bnez	a5,800018c0 <_ZN3TCB8dispatchEv+0x2c>
	bool isBlocked() { return blocked; }
    800018b8:	0314c783          	lbu	a5,49(s1)
    800018bc:	02078c63          	beqz	a5,800018f4 <_ZN3TCB8dispatchEv+0x60>
	TCB::running = Scheduler::get();
    800018c0:	00000097          	auipc	ra,0x0
    800018c4:	c14080e7          	jalr	-1004(ra) # 800014d4 <_ZN9Scheduler3getEv>
    800018c8:	00050593          	mv	a1,a0
    800018cc:	00003797          	auipc	a5,0x3
    800018d0:	f6a7be23          	sd	a0,-132(a5) # 80004848 <_ZN3TCB7runningE>
	TCB::contextSwitch(&old->context, &running->context);
    800018d4:	00048513          	mv	a0,s1
    800018d8:	00000097          	auipc	ra,0x0
    800018dc:	948080e7          	jalr	-1720(ra) # 80001220 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    800018e0:	01813083          	ld	ra,24(sp)
    800018e4:	01013403          	ld	s0,16(sp)
    800018e8:	00813483          	ld	s1,8(sp)
    800018ec:	02010113          	addi	sp,sp,32
    800018f0:	00008067          	ret
		Scheduler::put(old);
    800018f4:	00048513          	mv	a0,s1
    800018f8:	00000097          	auipc	ra,0x0
    800018fc:	b5c080e7          	jalr	-1188(ra) # 80001454 <_ZN9Scheduler3putEP3TCB>
    80001900:	fc1ff06f          	j	800018c0 <_ZN3TCB8dispatchEv+0x2c>

0000000080001904 <_ZN3TCB5yieldEv>:
void TCB::yield() {
    80001904:	ff010113          	addi	sp,sp,-16
    80001908:	00113423          	sd	ra,8(sp)
    8000190c:	00813023          	sd	s0,0(sp)
    80001910:	01010413          	addi	s0,sp,16
	Riscv::pushRegisters();
    80001914:	fffff097          	auipc	ra,0xfffff
    80001918:	6ec080e7          	jalr	1772(ra) # 80001000 <_ZN5Riscv13pushRegistersEv>
	TCB::dispatch();
    8000191c:	00000097          	auipc	ra,0x0
    80001920:	f78080e7          	jalr	-136(ra) # 80001894 <_ZN3TCB8dispatchEv>
	Riscv::popRegisters();
    80001924:	fffff097          	auipc	ra,0xfffff
    80001928:	758080e7          	jalr	1880(ra) # 8000107c <_ZN5Riscv12popRegistersEv>
}
    8000192c:	00813083          	ld	ra,8(sp)
    80001930:	00013403          	ld	s0,0(sp)
    80001934:	01010113          	addi	sp,sp,16
    80001938:	00008067          	ret

000000008000193c <_ZN15MemoryAllocator7kmallocEm>:

bool MemoryAllocator::initialized = false;
MemoryAllocator::FreeMemSegment* MemoryAllocator::freeMemHead = nullptr;
MemoryAllocator::UsedMemSegment* MemoryAllocator::usedMemHead = nullptr;

void* MemoryAllocator::kmalloc(size_t size) {
    8000193c:	ff010113          	addi	sp,sp,-16
    80001940:	00813423          	sd	s0,8(sp)
    80001944:	01010413          	addi	s0,sp,16
	if (size <= 0) return nullptr;
    80001948:	12050663          	beqz	a0,80001a74 <_ZN15MemoryAllocator7kmallocEm+0x138>

	//pocetna inicijalizacija
	if (!initialized) {
    8000194c:	00003797          	auipc	a5,0x3
    80001950:	f0c7c783          	lbu	a5,-244(a5) # 80004858 <_ZN15MemoryAllocator11initializedE>
    80001954:	04079663          	bnez	a5,800019a0 <_ZN15MemoryAllocator7kmallocEm+0x64>
		freeMemHead = (FreeMemSegment*)HEAP_START_ADDR;
    80001958:	00003617          	auipc	a2,0x3
    8000195c:	e6863603          	ld	a2,-408(a2) # 800047c0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001960:	00063703          	ld	a4,0(a2)
    80001964:	00003797          	auipc	a5,0x3
    80001968:	ef478793          	addi	a5,a5,-268 # 80004858 <_ZN15MemoryAllocator11initializedE>
    8000196c:	00e7b423          	sd	a4,8(a5)
		freeMemHead->next = nullptr;
    80001970:	00073023          	sd	zero,0(a4)
		freeMemHead->prev = nullptr;
    80001974:	0087b683          	ld	a3,8(a5)
    80001978:	0006b423          	sd	zero,8(a3)
		freeMemHead->size = (char*)HEAP_END_ADDR - (char*)HEAP_START_ADDR;
    8000197c:	00003717          	auipc	a4,0x3
    80001980:	e5473703          	ld	a4,-428(a4) # 800047d0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80001984:	00073703          	ld	a4,0(a4)
    80001988:	00063603          	ld	a2,0(a2)
    8000198c:	40c70733          	sub	a4,a4,a2
    80001990:	00e6b823          	sd	a4,16(a3)
		usedMemHead = nullptr;
    80001994:	0007b823          	sd	zero,16(a5)

		initialized = true;
    80001998:	00100713          	li	a4,1
    8000199c:	00e78023          	sb	a4,0(a5)
	}

	//alokacija uvek zaokruzena na blokove
	size += sizeof(UsedMemSegment);
    800019a0:	01050513          	addi	a0,a0,16
	size_t blocks = size / MEM_BLOCK_SIZE + (size % MEM_BLOCK_SIZE ? 1 : 0);
    800019a4:	00655713          	srli	a4,a0,0x6
    800019a8:	03f57793          	andi	a5,a0,63
    800019ac:	00078463          	beqz	a5,800019b4 <_ZN15MemoryAllocator7kmallocEm+0x78>
    800019b0:	00100793          	li	a5,1
    800019b4:	00f707b3          	add	a5,a4,a5
	size = blocks * MEM_BLOCK_SIZE;
    800019b8:	00679793          	slli	a5,a5,0x6

	//trazenje slobodnog segmenta po first-fit algoritmu
	for (FreeMemSegment* current = freeMemHead; current; current = current->next) {
    800019bc:	00003517          	auipc	a0,0x3
    800019c0:	ea453503          	ld	a0,-348(a0) # 80004860 <_ZN15MemoryAllocator11freeMemHeadE>
    800019c4:	08050a63          	beqz	a0,80001a58 <_ZN15MemoryAllocator7kmallocEm+0x11c>
		if (current->size < size) continue;
    800019c8:	01053703          	ld	a4,16(a0)
    800019cc:	06f76263          	bltu	a4,a5,80001a30 <_ZN15MemoryAllocator7kmallocEm+0xf4>

		//pravljenje novog slobodnog fragmenta od ostatka fragmenta
		FreeMemSegment* remainderFree = (FreeMemSegment*)((char*)current + size);
    800019d0:	00f506b3          	add	a3,a0,a5
		remainderFree->size = current->size - size;
    800019d4:	40f70733          	sub	a4,a4,a5
    800019d8:	00e6b823          	sd	a4,16(a3)
		remainderFree->prev = current->prev;
    800019dc:	00853703          	ld	a4,8(a0)
    800019e0:	00e6b423          	sd	a4,8(a3)
		if (current->prev) current->prev->next = remainderFree;
    800019e4:	00070463          	beqz	a4,800019ec <_ZN15MemoryAllocator7kmallocEm+0xb0>
    800019e8:	00d73023          	sd	a3,0(a4)
		remainderFree->next = current->next;
    800019ec:	00053703          	ld	a4,0(a0)
    800019f0:	00e6b023          	sd	a4,0(a3)
		if (current->next) current->next->prev = remainderFree;
    800019f4:	00070463          	beqz	a4,800019fc <_ZN15MemoryAllocator7kmallocEm+0xc0>
    800019f8:	00d73423          	sd	a3,8(a4)
		if (freeMemHead == current) freeMemHead = remainderFree;
    800019fc:	00003717          	auipc	a4,0x3
    80001a00:	e6473703          	ld	a4,-412(a4) # 80004860 <_ZN15MemoryAllocator11freeMemHeadE>
    80001a04:	02a70a63          	beq	a4,a0,80001a38 <_ZN15MemoryAllocator7kmallocEm+0xfc>

		//ubacivanje novog fragmenta u listu zauzetih fragmenata
		UsedMemSegment* newFragment = (UsedMemSegment*)current;
		newFragment->size = size;
    80001a08:	00f53423          	sd	a5,8(a0)
		UsedMemSegment* prevUsed = nullptr;
		for (UsedMemSegment* cur = usedMemHead; cur && cur < newFragment; prevUsed = cur, cur = cur->next);
    80001a0c:	00003697          	auipc	a3,0x3
    80001a10:	e5c6b683          	ld	a3,-420(a3) # 80004868 <_ZN15MemoryAllocator11usedMemHeadE>
    80001a14:	00068793          	mv	a5,a3
		UsedMemSegment* prevUsed = nullptr;
    80001a18:	00000713          	li	a4,0
		for (UsedMemSegment* cur = usedMemHead; cur && cur < newFragment; prevUsed = cur, cur = cur->next);
    80001a1c:	02078463          	beqz	a5,80001a44 <_ZN15MemoryAllocator7kmallocEm+0x108>
    80001a20:	02a7f263          	bgeu	a5,a0,80001a44 <_ZN15MemoryAllocator7kmallocEm+0x108>
    80001a24:	00078713          	mv	a4,a5
    80001a28:	0007b783          	ld	a5,0(a5)
    80001a2c:	ff1ff06f          	j	80001a1c <_ZN15MemoryAllocator7kmallocEm+0xe0>
	for (FreeMemSegment* current = freeMemHead; current; current = current->next) {
    80001a30:	00053503          	ld	a0,0(a0)
    80001a34:	f91ff06f          	j	800019c4 <_ZN15MemoryAllocator7kmallocEm+0x88>
		if (freeMemHead == current) freeMemHead = remainderFree;
    80001a38:	00003717          	auipc	a4,0x3
    80001a3c:	e2d73423          	sd	a3,-472(a4) # 80004860 <_ZN15MemoryAllocator11freeMemHeadE>
    80001a40:	fc9ff06f          	j	80001a08 <_ZN15MemoryAllocator7kmallocEm+0xcc>
		if (!prevUsed) {
    80001a44:	02070063          	beqz	a4,80001a64 <_ZN15MemoryAllocator7kmallocEm+0x128>
			newFragment->next = usedMemHead;
			usedMemHead = newFragment;
		} else {
			newFragment->next = prevUsed->next;
    80001a48:	00073783          	ld	a5,0(a4)
    80001a4c:	00f53023          	sd	a5,0(a0)
			prevUsed->next = newFragment;
    80001a50:	00a73023          	sd	a0,0(a4)
		}
		return (char*)newFragment + sizeof(UsedMemSegment);
    80001a54:	01050513          	addi	a0,a0,16
	}
	return nullptr;
}
    80001a58:	00813403          	ld	s0,8(sp)
    80001a5c:	01010113          	addi	sp,sp,16
    80001a60:	00008067          	ret
			newFragment->next = usedMemHead;
    80001a64:	00d53023          	sd	a3,0(a0)
			usedMemHead = newFragment;
    80001a68:	00003797          	auipc	a5,0x3
    80001a6c:	e0a7b023          	sd	a0,-512(a5) # 80004868 <_ZN15MemoryAllocator11usedMemHeadE>
    80001a70:	fe5ff06f          	j	80001a54 <_ZN15MemoryAllocator7kmallocEm+0x118>
	if (size <= 0) return nullptr;
    80001a74:	00000513          	li	a0,0
    80001a78:	fe1ff06f          	j	80001a58 <_ZN15MemoryAllocator7kmallocEm+0x11c>

0000000080001a7c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>:
	tryToJoin(newFree);
	tryToJoin(prevFree);
	return 0;
}

int MemoryAllocator::tryToJoin(MemoryAllocator::FreeMemSegment* current) {
    80001a7c:	ff010113          	addi	sp,sp,-16
    80001a80:	00813423          	sd	s0,8(sp)
    80001a84:	01010413          	addi	s0,sp,16
	if (!current) return 0;
    80001a88:	04050663          	beqz	a0,80001ad4 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x58>
	if (current->next && (char*)current + current->size == (char*)(current->next)) {
    80001a8c:	00053783          	ld	a5,0(a0)
    80001a90:	04078663          	beqz	a5,80001adc <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x60>
    80001a94:	01053703          	ld	a4,16(a0)
    80001a98:	00e506b3          	add	a3,a0,a4
    80001a9c:	00d78a63          	beq	a5,a3,80001ab0 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x34>
		current->size += current->next->size;
		current->next = current->next->next;
		if (current->next) current->next->prev = current;
		return 1;
	} else return 0;
    80001aa0:	00000513          	li	a0,0
}
    80001aa4:	00813403          	ld	s0,8(sp)
    80001aa8:	01010113          	addi	sp,sp,16
    80001aac:	00008067          	ret
		current->size += current->next->size;
    80001ab0:	0107b683          	ld	a3,16(a5)
    80001ab4:	00d70733          	add	a4,a4,a3
    80001ab8:	00e53823          	sd	a4,16(a0)
		current->next = current->next->next;
    80001abc:	0007b783          	ld	a5,0(a5)
    80001ac0:	00f53023          	sd	a5,0(a0)
		if (current->next) current->next->prev = current;
    80001ac4:	00078463          	beqz	a5,80001acc <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x50>
    80001ac8:	00a7b423          	sd	a0,8(a5)
		return 1;
    80001acc:	00100513          	li	a0,1
    80001ad0:	fd5ff06f          	j	80001aa4 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>
	if (!current) return 0;
    80001ad4:	00000513          	li	a0,0
    80001ad8:	fcdff06f          	j	80001aa4 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>
	} else return 0;
    80001adc:	00000513          	li	a0,0
    80001ae0:	fc5ff06f          	j	80001aa4 <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE+0x28>

0000000080001ae4 <_ZN15MemoryAllocator5kfreeEPv>:
	if (!ptr) return 0;
    80001ae4:	10050463          	beqz	a0,80001bec <_ZN15MemoryAllocator5kfreeEPv+0x108>
    80001ae8:	00050693          	mv	a3,a0
	if (!usedMemHead) return -1;
    80001aec:	00003797          	auipc	a5,0x3
    80001af0:	d7c7b783          	ld	a5,-644(a5) # 80004868 <_ZN15MemoryAllocator11usedMemHeadE>
    80001af4:	10078063          	beqz	a5,80001bf4 <_ZN15MemoryAllocator5kfreeEPv+0x110>
	ptr = (char*)ptr - sizeof(UsedMemSegment);
    80001af8:	ff050513          	addi	a0,a0,-16
	UsedMemSegment* prevUsed = nullptr;
    80001afc:	00000713          	li	a4,0
	for (; currentUsed && currentUsed != ptr; prevUsed = currentUsed, currentUsed = currentUsed->next);
    80001b00:	00078a63          	beqz	a5,80001b14 <_ZN15MemoryAllocator5kfreeEPv+0x30>
    80001b04:	00a78863          	beq	a5,a0,80001b14 <_ZN15MemoryAllocator5kfreeEPv+0x30>
    80001b08:	00078713          	mv	a4,a5
    80001b0c:	0007b783          	ld	a5,0(a5)
    80001b10:	ff1ff06f          	j	80001b00 <_ZN15MemoryAllocator5kfreeEPv+0x1c>
	if (currentUsed != ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    80001b14:	0ea79463          	bne	a5,a0,80001bfc <_ZN15MemoryAllocator5kfreeEPv+0x118>
int MemoryAllocator::kfree(void* ptr) {
    80001b18:	fe010113          	addi	sp,sp,-32
    80001b1c:	00113c23          	sd	ra,24(sp)
    80001b20:	00813823          	sd	s0,16(sp)
    80001b24:	00913423          	sd	s1,8(sp)
    80001b28:	02010413          	addi	s0,sp,32
	if (prevUsed) prevUsed->next = currentUsed->next;
    80001b2c:	02070863          	beqz	a4,80001b5c <_ZN15MemoryAllocator5kfreeEPv+0x78>
    80001b30:	0007b783          	ld	a5,0(a5)
    80001b34:	00f73023          	sd	a5,0(a4)
	if (!freeMemHead || ptr < (char*)freeMemHead) {
    80001b38:	00003797          	auipc	a5,0x3
    80001b3c:	d287b783          	ld	a5,-728(a5) # 80004860 <_ZN15MemoryAllocator11freeMemHeadE>
    80001b40:	02078663          	beqz	a5,80001b6c <_ZN15MemoryAllocator5kfreeEPv+0x88>
    80001b44:	02f56863          	bltu	a0,a5,80001b74 <_ZN15MemoryAllocator5kfreeEPv+0x90>
			 prevFree->next != nullptr && ptr > (char*)(prevFree->next); prevFree = prevFree->next);
    80001b48:	00078493          	mv	s1,a5
    80001b4c:	0007b783          	ld	a5,0(a5)
    80001b50:	02078463          	beqz	a5,80001b78 <_ZN15MemoryAllocator5kfreeEPv+0x94>
    80001b54:	fea7eae3          	bltu	a5,a0,80001b48 <_ZN15MemoryAllocator5kfreeEPv+0x64>
    80001b58:	0200006f          	j	80001b78 <_ZN15MemoryAllocator5kfreeEPv+0x94>
	else usedMemHead = currentUsed->next;
    80001b5c:	0007b783          	ld	a5,0(a5)
    80001b60:	00003717          	auipc	a4,0x3
    80001b64:	d0f73423          	sd	a5,-760(a4) # 80004868 <_ZN15MemoryAllocator11usedMemHeadE>
    80001b68:	fd1ff06f          	j	80001b38 <_ZN15MemoryAllocator5kfreeEPv+0x54>
		prevFree = nullptr;
    80001b6c:	00078493          	mv	s1,a5
    80001b70:	0080006f          	j	80001b78 <_ZN15MemoryAllocator5kfreeEPv+0x94>
    80001b74:	00000493          	li	s1,0
	size_t segmentSize = ((UsedMemSegment*)ptr)->size;
    80001b78:	ff86b783          	ld	a5,-8(a3)
	newFree->size = segmentSize;
    80001b7c:	00f6b023          	sd	a5,0(a3)
	newFree->prev = prevFree;
    80001b80:	fe96bc23          	sd	s1,-8(a3)
	if (prevFree) newFree->next = prevFree->next;
    80001b84:	04048663          	beqz	s1,80001bd0 <_ZN15MemoryAllocator5kfreeEPv+0xec>
    80001b88:	0004b783          	ld	a5,0(s1)
    80001b8c:	fef6b823          	sd	a5,-16(a3)
	if (newFree->next) newFree->next->prev = newFree;
    80001b90:	ff06b783          	ld	a5,-16(a3)
    80001b94:	00078463          	beqz	a5,80001b9c <_ZN15MemoryAllocator5kfreeEPv+0xb8>
    80001b98:	00a7b423          	sd	a0,8(a5)
	if (prevFree) prevFree->next = newFree;
    80001b9c:	04048263          	beqz	s1,80001be0 <_ZN15MemoryAllocator5kfreeEPv+0xfc>
    80001ba0:	00a4b023          	sd	a0,0(s1)
	tryToJoin(newFree);
    80001ba4:	00000097          	auipc	ra,0x0
    80001ba8:	ed8080e7          	jalr	-296(ra) # 80001a7c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
	tryToJoin(prevFree);
    80001bac:	00048513          	mv	a0,s1
    80001bb0:	00000097          	auipc	ra,0x0
    80001bb4:	ecc080e7          	jalr	-308(ra) # 80001a7c <_ZN15MemoryAllocator9tryToJoinEPNS_14FreeMemSegmentE>
	return 0;
    80001bb8:	00000513          	li	a0,0
}
    80001bbc:	01813083          	ld	ra,24(sp)
    80001bc0:	01013403          	ld	s0,16(sp)
    80001bc4:	00813483          	ld	s1,8(sp)
    80001bc8:	02010113          	addi	sp,sp,32
    80001bcc:	00008067          	ret
	else newFree->next = freeMemHead;
    80001bd0:	00003797          	auipc	a5,0x3
    80001bd4:	c907b783          	ld	a5,-880(a5) # 80004860 <_ZN15MemoryAllocator11freeMemHeadE>
    80001bd8:	fef6b823          	sd	a5,-16(a3)
    80001bdc:	fb5ff06f          	j	80001b90 <_ZN15MemoryAllocator5kfreeEPv+0xac>
	else freeMemHead = newFree;
    80001be0:	00003797          	auipc	a5,0x3
    80001be4:	c8a7b023          	sd	a0,-896(a5) # 80004860 <_ZN15MemoryAllocator11freeMemHeadE>
    80001be8:	fbdff06f          	j	80001ba4 <_ZN15MemoryAllocator5kfreeEPv+0xc0>
	if (!ptr) return 0;
    80001bec:	00000513          	li	a0,0
    80001bf0:	00008067          	ret
	if (!usedMemHead) return -1;
    80001bf4:	fff00513          	li	a0,-1
    80001bf8:	00008067          	ret
	if (currentUsed != ptr) return -1;    //adresa ne odgovara segmentu alociranom preko kmalloc
    80001bfc:	fff00513          	li	a0,-1
}
    80001c00:	00008067          	ret

0000000080001c04 <start>:
    80001c04:	ff010113          	addi	sp,sp,-16
    80001c08:	00813423          	sd	s0,8(sp)
    80001c0c:	01010413          	addi	s0,sp,16
    80001c10:	300027f3          	csrr	a5,mstatus
    80001c14:	ffffe737          	lui	a4,0xffffe
    80001c18:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff8d2f>
    80001c1c:	00e7f7b3          	and	a5,a5,a4
    80001c20:	00001737          	lui	a4,0x1
    80001c24:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80001c28:	00e7e7b3          	or	a5,a5,a4
    80001c2c:	30079073          	csrw	mstatus,a5
    80001c30:	00000797          	auipc	a5,0x0
    80001c34:	16078793          	addi	a5,a5,352 # 80001d90 <system_main>
    80001c38:	34179073          	csrw	mepc,a5
    80001c3c:	00000793          	li	a5,0
    80001c40:	18079073          	csrw	satp,a5
    80001c44:	000107b7          	lui	a5,0x10
    80001c48:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80001c4c:	30279073          	csrw	medeleg,a5
    80001c50:	30379073          	csrw	mideleg,a5
    80001c54:	104027f3          	csrr	a5,sie
    80001c58:	2227e793          	ori	a5,a5,546
    80001c5c:	10479073          	csrw	sie,a5
    80001c60:	fff00793          	li	a5,-1
    80001c64:	00a7d793          	srli	a5,a5,0xa
    80001c68:	3b079073          	csrw	pmpaddr0,a5
    80001c6c:	00f00793          	li	a5,15
    80001c70:	3a079073          	csrw	pmpcfg0,a5
    80001c74:	f14027f3          	csrr	a5,mhartid
    80001c78:	0200c737          	lui	a4,0x200c
    80001c7c:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80001c80:	0007869b          	sext.w	a3,a5
    80001c84:	00269713          	slli	a4,a3,0x2
    80001c88:	000f4637          	lui	a2,0xf4
    80001c8c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80001c90:	00d70733          	add	a4,a4,a3
    80001c94:	0037979b          	slliw	a5,a5,0x3
    80001c98:	020046b7          	lui	a3,0x2004
    80001c9c:	00d787b3          	add	a5,a5,a3
    80001ca0:	00c585b3          	add	a1,a1,a2
    80001ca4:	00371693          	slli	a3,a4,0x3
    80001ca8:	00003717          	auipc	a4,0x3
    80001cac:	bc870713          	addi	a4,a4,-1080 # 80004870 <timer_scratch>
    80001cb0:	00b7b023          	sd	a1,0(a5)
    80001cb4:	00d70733          	add	a4,a4,a3
    80001cb8:	00f73c23          	sd	a5,24(a4)
    80001cbc:	02c73023          	sd	a2,32(a4)
    80001cc0:	34071073          	csrw	mscratch,a4
    80001cc4:	00000797          	auipc	a5,0x0
    80001cc8:	6ec78793          	addi	a5,a5,1772 # 800023b0 <timervec>
    80001ccc:	30579073          	csrw	mtvec,a5
    80001cd0:	300027f3          	csrr	a5,mstatus
    80001cd4:	0087e793          	ori	a5,a5,8
    80001cd8:	30079073          	csrw	mstatus,a5
    80001cdc:	304027f3          	csrr	a5,mie
    80001ce0:	0807e793          	ori	a5,a5,128
    80001ce4:	30479073          	csrw	mie,a5
    80001ce8:	f14027f3          	csrr	a5,mhartid
    80001cec:	0007879b          	sext.w	a5,a5
    80001cf0:	00078213          	mv	tp,a5
    80001cf4:	30200073          	mret
    80001cf8:	00813403          	ld	s0,8(sp)
    80001cfc:	01010113          	addi	sp,sp,16
    80001d00:	00008067          	ret

0000000080001d04 <timerinit>:
    80001d04:	ff010113          	addi	sp,sp,-16
    80001d08:	00813423          	sd	s0,8(sp)
    80001d0c:	01010413          	addi	s0,sp,16
    80001d10:	f14027f3          	csrr	a5,mhartid
    80001d14:	0200c737          	lui	a4,0x200c
    80001d18:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80001d1c:	0007869b          	sext.w	a3,a5
    80001d20:	00269713          	slli	a4,a3,0x2
    80001d24:	000f4637          	lui	a2,0xf4
    80001d28:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80001d2c:	00d70733          	add	a4,a4,a3
    80001d30:	0037979b          	slliw	a5,a5,0x3
    80001d34:	020046b7          	lui	a3,0x2004
    80001d38:	00d787b3          	add	a5,a5,a3
    80001d3c:	00c585b3          	add	a1,a1,a2
    80001d40:	00371693          	slli	a3,a4,0x3
    80001d44:	00003717          	auipc	a4,0x3
    80001d48:	b2c70713          	addi	a4,a4,-1236 # 80004870 <timer_scratch>
    80001d4c:	00b7b023          	sd	a1,0(a5)
    80001d50:	00d70733          	add	a4,a4,a3
    80001d54:	00f73c23          	sd	a5,24(a4)
    80001d58:	02c73023          	sd	a2,32(a4)
    80001d5c:	34071073          	csrw	mscratch,a4
    80001d60:	00000797          	auipc	a5,0x0
    80001d64:	65078793          	addi	a5,a5,1616 # 800023b0 <timervec>
    80001d68:	30579073          	csrw	mtvec,a5
    80001d6c:	300027f3          	csrr	a5,mstatus
    80001d70:	0087e793          	ori	a5,a5,8
    80001d74:	30079073          	csrw	mstatus,a5
    80001d78:	304027f3          	csrr	a5,mie
    80001d7c:	0807e793          	ori	a5,a5,128
    80001d80:	30479073          	csrw	mie,a5
    80001d84:	00813403          	ld	s0,8(sp)
    80001d88:	01010113          	addi	sp,sp,16
    80001d8c:	00008067          	ret

0000000080001d90 <system_main>:
    80001d90:	fe010113          	addi	sp,sp,-32
    80001d94:	00813823          	sd	s0,16(sp)
    80001d98:	00913423          	sd	s1,8(sp)
    80001d9c:	00113c23          	sd	ra,24(sp)
    80001da0:	02010413          	addi	s0,sp,32
    80001da4:	00000097          	auipc	ra,0x0
    80001da8:	0c4080e7          	jalr	196(ra) # 80001e68 <cpuid>
    80001dac:	00003497          	auipc	s1,0x3
    80001db0:	a5448493          	addi	s1,s1,-1452 # 80004800 <started>
    80001db4:	02050263          	beqz	a0,80001dd8 <system_main+0x48>
    80001db8:	0004a783          	lw	a5,0(s1)
    80001dbc:	0007879b          	sext.w	a5,a5
    80001dc0:	fe078ce3          	beqz	a5,80001db8 <system_main+0x28>
    80001dc4:	0ff0000f          	fence
    80001dc8:	00002517          	auipc	a0,0x2
    80001dcc:	3d850513          	addi	a0,a0,984 # 800041a0 <_ZZ12printIntegermE6digits+0x180>
    80001dd0:	00001097          	auipc	ra,0x1
    80001dd4:	a7c080e7          	jalr	-1412(ra) # 8000284c <panic>
    80001dd8:	00001097          	auipc	ra,0x1
    80001ddc:	9d0080e7          	jalr	-1584(ra) # 800027a8 <consoleinit>
    80001de0:	00001097          	auipc	ra,0x1
    80001de4:	15c080e7          	jalr	348(ra) # 80002f3c <printfinit>
    80001de8:	00002517          	auipc	a0,0x2
    80001dec:	49850513          	addi	a0,a0,1176 # 80004280 <_ZZ12printIntegermE6digits+0x260>
    80001df0:	00001097          	auipc	ra,0x1
    80001df4:	ab8080e7          	jalr	-1352(ra) # 800028a8 <__printf>
    80001df8:	00002517          	auipc	a0,0x2
    80001dfc:	37850513          	addi	a0,a0,888 # 80004170 <_ZZ12printIntegermE6digits+0x150>
    80001e00:	00001097          	auipc	ra,0x1
    80001e04:	aa8080e7          	jalr	-1368(ra) # 800028a8 <__printf>
    80001e08:	00002517          	auipc	a0,0x2
    80001e0c:	47850513          	addi	a0,a0,1144 # 80004280 <_ZZ12printIntegermE6digits+0x260>
    80001e10:	00001097          	auipc	ra,0x1
    80001e14:	a98080e7          	jalr	-1384(ra) # 800028a8 <__printf>
    80001e18:	00001097          	auipc	ra,0x1
    80001e1c:	4b0080e7          	jalr	1200(ra) # 800032c8 <kinit>
    80001e20:	00000097          	auipc	ra,0x0
    80001e24:	148080e7          	jalr	328(ra) # 80001f68 <trapinit>
    80001e28:	00000097          	auipc	ra,0x0
    80001e2c:	16c080e7          	jalr	364(ra) # 80001f94 <trapinithart>
    80001e30:	00000097          	auipc	ra,0x0
    80001e34:	5c0080e7          	jalr	1472(ra) # 800023f0 <plicinit>
    80001e38:	00000097          	auipc	ra,0x0
    80001e3c:	5e0080e7          	jalr	1504(ra) # 80002418 <plicinithart>
    80001e40:	00000097          	auipc	ra,0x0
    80001e44:	078080e7          	jalr	120(ra) # 80001eb8 <userinit>
    80001e48:	0ff0000f          	fence
    80001e4c:	00100793          	li	a5,1
    80001e50:	00002517          	auipc	a0,0x2
    80001e54:	33850513          	addi	a0,a0,824 # 80004188 <_ZZ12printIntegermE6digits+0x168>
    80001e58:	00f4a023          	sw	a5,0(s1)
    80001e5c:	00001097          	auipc	ra,0x1
    80001e60:	a4c080e7          	jalr	-1460(ra) # 800028a8 <__printf>
    80001e64:	0000006f          	j	80001e64 <system_main+0xd4>

0000000080001e68 <cpuid>:
    80001e68:	ff010113          	addi	sp,sp,-16
    80001e6c:	00813423          	sd	s0,8(sp)
    80001e70:	01010413          	addi	s0,sp,16
    80001e74:	00020513          	mv	a0,tp
    80001e78:	00813403          	ld	s0,8(sp)
    80001e7c:	0005051b          	sext.w	a0,a0
    80001e80:	01010113          	addi	sp,sp,16
    80001e84:	00008067          	ret

0000000080001e88 <mycpu>:
    80001e88:	ff010113          	addi	sp,sp,-16
    80001e8c:	00813423          	sd	s0,8(sp)
    80001e90:	01010413          	addi	s0,sp,16
    80001e94:	00020793          	mv	a5,tp
    80001e98:	00813403          	ld	s0,8(sp)
    80001e9c:	0007879b          	sext.w	a5,a5
    80001ea0:	00779793          	slli	a5,a5,0x7
    80001ea4:	00004517          	auipc	a0,0x4
    80001ea8:	9fc50513          	addi	a0,a0,-1540 # 800058a0 <cpus>
    80001eac:	00f50533          	add	a0,a0,a5
    80001eb0:	01010113          	addi	sp,sp,16
    80001eb4:	00008067          	ret

0000000080001eb8 <userinit>:
    80001eb8:	ff010113          	addi	sp,sp,-16
    80001ebc:	00813423          	sd	s0,8(sp)
    80001ec0:	01010413          	addi	s0,sp,16
    80001ec4:	00813403          	ld	s0,8(sp)
    80001ec8:	01010113          	addi	sp,sp,16
    80001ecc:	fffff317          	auipc	t1,0xfffff
    80001ed0:	75830067          	jr	1880(t1) # 80001624 <main>

0000000080001ed4 <either_copyout>:
    80001ed4:	ff010113          	addi	sp,sp,-16
    80001ed8:	00813023          	sd	s0,0(sp)
    80001edc:	00113423          	sd	ra,8(sp)
    80001ee0:	01010413          	addi	s0,sp,16
    80001ee4:	02051663          	bnez	a0,80001f10 <either_copyout+0x3c>
    80001ee8:	00058513          	mv	a0,a1
    80001eec:	00060593          	mv	a1,a2
    80001ef0:	0006861b          	sext.w	a2,a3
    80001ef4:	00002097          	auipc	ra,0x2
    80001ef8:	c60080e7          	jalr	-928(ra) # 80003b54 <__memmove>
    80001efc:	00813083          	ld	ra,8(sp)
    80001f00:	00013403          	ld	s0,0(sp)
    80001f04:	00000513          	li	a0,0
    80001f08:	01010113          	addi	sp,sp,16
    80001f0c:	00008067          	ret
    80001f10:	00002517          	auipc	a0,0x2
    80001f14:	2b850513          	addi	a0,a0,696 # 800041c8 <_ZZ12printIntegermE6digits+0x1a8>
    80001f18:	00001097          	auipc	ra,0x1
    80001f1c:	934080e7          	jalr	-1740(ra) # 8000284c <panic>

0000000080001f20 <either_copyin>:
    80001f20:	ff010113          	addi	sp,sp,-16
    80001f24:	00813023          	sd	s0,0(sp)
    80001f28:	00113423          	sd	ra,8(sp)
    80001f2c:	01010413          	addi	s0,sp,16
    80001f30:	02059463          	bnez	a1,80001f58 <either_copyin+0x38>
    80001f34:	00060593          	mv	a1,a2
    80001f38:	0006861b          	sext.w	a2,a3
    80001f3c:	00002097          	auipc	ra,0x2
    80001f40:	c18080e7          	jalr	-1000(ra) # 80003b54 <__memmove>
    80001f44:	00813083          	ld	ra,8(sp)
    80001f48:	00013403          	ld	s0,0(sp)
    80001f4c:	00000513          	li	a0,0
    80001f50:	01010113          	addi	sp,sp,16
    80001f54:	00008067          	ret
    80001f58:	00002517          	auipc	a0,0x2
    80001f5c:	29850513          	addi	a0,a0,664 # 800041f0 <_ZZ12printIntegermE6digits+0x1d0>
    80001f60:	00001097          	auipc	ra,0x1
    80001f64:	8ec080e7          	jalr	-1812(ra) # 8000284c <panic>

0000000080001f68 <trapinit>:
    80001f68:	ff010113          	addi	sp,sp,-16
    80001f6c:	00813423          	sd	s0,8(sp)
    80001f70:	01010413          	addi	s0,sp,16
    80001f74:	00813403          	ld	s0,8(sp)
    80001f78:	00002597          	auipc	a1,0x2
    80001f7c:	2a058593          	addi	a1,a1,672 # 80004218 <_ZZ12printIntegermE6digits+0x1f8>
    80001f80:	00004517          	auipc	a0,0x4
    80001f84:	9a050513          	addi	a0,a0,-1632 # 80005920 <tickslock>
    80001f88:	01010113          	addi	sp,sp,16
    80001f8c:	00001317          	auipc	t1,0x1
    80001f90:	5cc30067          	jr	1484(t1) # 80003558 <initlock>

0000000080001f94 <trapinithart>:
    80001f94:	ff010113          	addi	sp,sp,-16
    80001f98:	00813423          	sd	s0,8(sp)
    80001f9c:	01010413          	addi	s0,sp,16
    80001fa0:	00000797          	auipc	a5,0x0
    80001fa4:	30078793          	addi	a5,a5,768 # 800022a0 <kernelvec>
    80001fa8:	10579073          	csrw	stvec,a5
    80001fac:	00813403          	ld	s0,8(sp)
    80001fb0:	01010113          	addi	sp,sp,16
    80001fb4:	00008067          	ret

0000000080001fb8 <usertrap>:
    80001fb8:	ff010113          	addi	sp,sp,-16
    80001fbc:	00813423          	sd	s0,8(sp)
    80001fc0:	01010413          	addi	s0,sp,16
    80001fc4:	00813403          	ld	s0,8(sp)
    80001fc8:	01010113          	addi	sp,sp,16
    80001fcc:	00008067          	ret

0000000080001fd0 <usertrapret>:
    80001fd0:	ff010113          	addi	sp,sp,-16
    80001fd4:	00813423          	sd	s0,8(sp)
    80001fd8:	01010413          	addi	s0,sp,16
    80001fdc:	00813403          	ld	s0,8(sp)
    80001fe0:	01010113          	addi	sp,sp,16
    80001fe4:	00008067          	ret

0000000080001fe8 <kerneltrap>:
    80001fe8:	fe010113          	addi	sp,sp,-32
    80001fec:	00813823          	sd	s0,16(sp)
    80001ff0:	00113c23          	sd	ra,24(sp)
    80001ff4:	00913423          	sd	s1,8(sp)
    80001ff8:	02010413          	addi	s0,sp,32
    80001ffc:	142025f3          	csrr	a1,scause
    80002000:	100027f3          	csrr	a5,sstatus
    80002004:	0027f793          	andi	a5,a5,2
    80002008:	10079c63          	bnez	a5,80002120 <kerneltrap+0x138>
    8000200c:	142027f3          	csrr	a5,scause
    80002010:	0207ce63          	bltz	a5,8000204c <kerneltrap+0x64>
    80002014:	00002517          	auipc	a0,0x2
    80002018:	24c50513          	addi	a0,a0,588 # 80004260 <_ZZ12printIntegermE6digits+0x240>
    8000201c:	00001097          	auipc	ra,0x1
    80002020:	88c080e7          	jalr	-1908(ra) # 800028a8 <__printf>
    80002024:	141025f3          	csrr	a1,sepc
    80002028:	14302673          	csrr	a2,stval
    8000202c:	00002517          	auipc	a0,0x2
    80002030:	24450513          	addi	a0,a0,580 # 80004270 <_ZZ12printIntegermE6digits+0x250>
    80002034:	00001097          	auipc	ra,0x1
    80002038:	874080e7          	jalr	-1932(ra) # 800028a8 <__printf>
    8000203c:	00002517          	auipc	a0,0x2
    80002040:	24c50513          	addi	a0,a0,588 # 80004288 <_ZZ12printIntegermE6digits+0x268>
    80002044:	00001097          	auipc	ra,0x1
    80002048:	808080e7          	jalr	-2040(ra) # 8000284c <panic>
    8000204c:	0ff7f713          	andi	a4,a5,255
    80002050:	00900693          	li	a3,9
    80002054:	04d70063          	beq	a4,a3,80002094 <kerneltrap+0xac>
    80002058:	fff00713          	li	a4,-1
    8000205c:	03f71713          	slli	a4,a4,0x3f
    80002060:	00170713          	addi	a4,a4,1
    80002064:	fae798e3          	bne	a5,a4,80002014 <kerneltrap+0x2c>
    80002068:	00000097          	auipc	ra,0x0
    8000206c:	e00080e7          	jalr	-512(ra) # 80001e68 <cpuid>
    80002070:	06050663          	beqz	a0,800020dc <kerneltrap+0xf4>
    80002074:	144027f3          	csrr	a5,sip
    80002078:	ffd7f793          	andi	a5,a5,-3
    8000207c:	14479073          	csrw	sip,a5
    80002080:	01813083          	ld	ra,24(sp)
    80002084:	01013403          	ld	s0,16(sp)
    80002088:	00813483          	ld	s1,8(sp)
    8000208c:	02010113          	addi	sp,sp,32
    80002090:	00008067          	ret
    80002094:	00000097          	auipc	ra,0x0
    80002098:	3d0080e7          	jalr	976(ra) # 80002464 <plic_claim>
    8000209c:	00a00793          	li	a5,10
    800020a0:	00050493          	mv	s1,a0
    800020a4:	06f50863          	beq	a0,a5,80002114 <kerneltrap+0x12c>
    800020a8:	fc050ce3          	beqz	a0,80002080 <kerneltrap+0x98>
    800020ac:	00050593          	mv	a1,a0
    800020b0:	00002517          	auipc	a0,0x2
    800020b4:	19050513          	addi	a0,a0,400 # 80004240 <_ZZ12printIntegermE6digits+0x220>
    800020b8:	00000097          	auipc	ra,0x0
    800020bc:	7f0080e7          	jalr	2032(ra) # 800028a8 <__printf>
    800020c0:	01013403          	ld	s0,16(sp)
    800020c4:	01813083          	ld	ra,24(sp)
    800020c8:	00048513          	mv	a0,s1
    800020cc:	00813483          	ld	s1,8(sp)
    800020d0:	02010113          	addi	sp,sp,32
    800020d4:	00000317          	auipc	t1,0x0
    800020d8:	3c830067          	jr	968(t1) # 8000249c <plic_complete>
    800020dc:	00004517          	auipc	a0,0x4
    800020e0:	84450513          	addi	a0,a0,-1980 # 80005920 <tickslock>
    800020e4:	00001097          	auipc	ra,0x1
    800020e8:	498080e7          	jalr	1176(ra) # 8000357c <acquire>
    800020ec:	00002717          	auipc	a4,0x2
    800020f0:	71870713          	addi	a4,a4,1816 # 80004804 <ticks>
    800020f4:	00072783          	lw	a5,0(a4)
    800020f8:	00004517          	auipc	a0,0x4
    800020fc:	82850513          	addi	a0,a0,-2008 # 80005920 <tickslock>
    80002100:	0017879b          	addiw	a5,a5,1
    80002104:	00f72023          	sw	a5,0(a4)
    80002108:	00001097          	auipc	ra,0x1
    8000210c:	540080e7          	jalr	1344(ra) # 80003648 <release>
    80002110:	f65ff06f          	j	80002074 <kerneltrap+0x8c>
    80002114:	00001097          	auipc	ra,0x1
    80002118:	09c080e7          	jalr	156(ra) # 800031b0 <uartintr>
    8000211c:	fa5ff06f          	j	800020c0 <kerneltrap+0xd8>
    80002120:	00002517          	auipc	a0,0x2
    80002124:	10050513          	addi	a0,a0,256 # 80004220 <_ZZ12printIntegermE6digits+0x200>
    80002128:	00000097          	auipc	ra,0x0
    8000212c:	724080e7          	jalr	1828(ra) # 8000284c <panic>

0000000080002130 <clockintr>:
    80002130:	fe010113          	addi	sp,sp,-32
    80002134:	00813823          	sd	s0,16(sp)
    80002138:	00913423          	sd	s1,8(sp)
    8000213c:	00113c23          	sd	ra,24(sp)
    80002140:	02010413          	addi	s0,sp,32
    80002144:	00003497          	auipc	s1,0x3
    80002148:	7dc48493          	addi	s1,s1,2012 # 80005920 <tickslock>
    8000214c:	00048513          	mv	a0,s1
    80002150:	00001097          	auipc	ra,0x1
    80002154:	42c080e7          	jalr	1068(ra) # 8000357c <acquire>
    80002158:	00002717          	auipc	a4,0x2
    8000215c:	6ac70713          	addi	a4,a4,1708 # 80004804 <ticks>
    80002160:	00072783          	lw	a5,0(a4)
    80002164:	01013403          	ld	s0,16(sp)
    80002168:	01813083          	ld	ra,24(sp)
    8000216c:	00048513          	mv	a0,s1
    80002170:	0017879b          	addiw	a5,a5,1
    80002174:	00813483          	ld	s1,8(sp)
    80002178:	00f72023          	sw	a5,0(a4)
    8000217c:	02010113          	addi	sp,sp,32
    80002180:	00001317          	auipc	t1,0x1
    80002184:	4c830067          	jr	1224(t1) # 80003648 <release>

0000000080002188 <devintr>:
    80002188:	142027f3          	csrr	a5,scause
    8000218c:	00000513          	li	a0,0
    80002190:	0007c463          	bltz	a5,80002198 <devintr+0x10>
    80002194:	00008067          	ret
    80002198:	fe010113          	addi	sp,sp,-32
    8000219c:	00813823          	sd	s0,16(sp)
    800021a0:	00113c23          	sd	ra,24(sp)
    800021a4:	00913423          	sd	s1,8(sp)
    800021a8:	02010413          	addi	s0,sp,32
    800021ac:	0ff7f713          	andi	a4,a5,255
    800021b0:	00900693          	li	a3,9
    800021b4:	04d70c63          	beq	a4,a3,8000220c <devintr+0x84>
    800021b8:	fff00713          	li	a4,-1
    800021bc:	03f71713          	slli	a4,a4,0x3f
    800021c0:	00170713          	addi	a4,a4,1
    800021c4:	00e78c63          	beq	a5,a4,800021dc <devintr+0x54>
    800021c8:	01813083          	ld	ra,24(sp)
    800021cc:	01013403          	ld	s0,16(sp)
    800021d0:	00813483          	ld	s1,8(sp)
    800021d4:	02010113          	addi	sp,sp,32
    800021d8:	00008067          	ret
    800021dc:	00000097          	auipc	ra,0x0
    800021e0:	c8c080e7          	jalr	-884(ra) # 80001e68 <cpuid>
    800021e4:	06050663          	beqz	a0,80002250 <devintr+0xc8>
    800021e8:	144027f3          	csrr	a5,sip
    800021ec:	ffd7f793          	andi	a5,a5,-3
    800021f0:	14479073          	csrw	sip,a5
    800021f4:	01813083          	ld	ra,24(sp)
    800021f8:	01013403          	ld	s0,16(sp)
    800021fc:	00813483          	ld	s1,8(sp)
    80002200:	00200513          	li	a0,2
    80002204:	02010113          	addi	sp,sp,32
    80002208:	00008067          	ret
    8000220c:	00000097          	auipc	ra,0x0
    80002210:	258080e7          	jalr	600(ra) # 80002464 <plic_claim>
    80002214:	00a00793          	li	a5,10
    80002218:	00050493          	mv	s1,a0
    8000221c:	06f50663          	beq	a0,a5,80002288 <devintr+0x100>
    80002220:	00100513          	li	a0,1
    80002224:	fa0482e3          	beqz	s1,800021c8 <devintr+0x40>
    80002228:	00048593          	mv	a1,s1
    8000222c:	00002517          	auipc	a0,0x2
    80002230:	01450513          	addi	a0,a0,20 # 80004240 <_ZZ12printIntegermE6digits+0x220>
    80002234:	00000097          	auipc	ra,0x0
    80002238:	674080e7          	jalr	1652(ra) # 800028a8 <__printf>
    8000223c:	00048513          	mv	a0,s1
    80002240:	00000097          	auipc	ra,0x0
    80002244:	25c080e7          	jalr	604(ra) # 8000249c <plic_complete>
    80002248:	00100513          	li	a0,1
    8000224c:	f7dff06f          	j	800021c8 <devintr+0x40>
    80002250:	00003517          	auipc	a0,0x3
    80002254:	6d050513          	addi	a0,a0,1744 # 80005920 <tickslock>
    80002258:	00001097          	auipc	ra,0x1
    8000225c:	324080e7          	jalr	804(ra) # 8000357c <acquire>
    80002260:	00002717          	auipc	a4,0x2
    80002264:	5a470713          	addi	a4,a4,1444 # 80004804 <ticks>
    80002268:	00072783          	lw	a5,0(a4)
    8000226c:	00003517          	auipc	a0,0x3
    80002270:	6b450513          	addi	a0,a0,1716 # 80005920 <tickslock>
    80002274:	0017879b          	addiw	a5,a5,1
    80002278:	00f72023          	sw	a5,0(a4)
    8000227c:	00001097          	auipc	ra,0x1
    80002280:	3cc080e7          	jalr	972(ra) # 80003648 <release>
    80002284:	f65ff06f          	j	800021e8 <devintr+0x60>
    80002288:	00001097          	auipc	ra,0x1
    8000228c:	f28080e7          	jalr	-216(ra) # 800031b0 <uartintr>
    80002290:	fadff06f          	j	8000223c <devintr+0xb4>
	...

00000000800022a0 <kernelvec>:
    800022a0:	f0010113          	addi	sp,sp,-256
    800022a4:	00113023          	sd	ra,0(sp)
    800022a8:	00213423          	sd	sp,8(sp)
    800022ac:	00313823          	sd	gp,16(sp)
    800022b0:	00413c23          	sd	tp,24(sp)
    800022b4:	02513023          	sd	t0,32(sp)
    800022b8:	02613423          	sd	t1,40(sp)
    800022bc:	02713823          	sd	t2,48(sp)
    800022c0:	02813c23          	sd	s0,56(sp)
    800022c4:	04913023          	sd	s1,64(sp)
    800022c8:	04a13423          	sd	a0,72(sp)
    800022cc:	04b13823          	sd	a1,80(sp)
    800022d0:	04c13c23          	sd	a2,88(sp)
    800022d4:	06d13023          	sd	a3,96(sp)
    800022d8:	06e13423          	sd	a4,104(sp)
    800022dc:	06f13823          	sd	a5,112(sp)
    800022e0:	07013c23          	sd	a6,120(sp)
    800022e4:	09113023          	sd	a7,128(sp)
    800022e8:	09213423          	sd	s2,136(sp)
    800022ec:	09313823          	sd	s3,144(sp)
    800022f0:	09413c23          	sd	s4,152(sp)
    800022f4:	0b513023          	sd	s5,160(sp)
    800022f8:	0b613423          	sd	s6,168(sp)
    800022fc:	0b713823          	sd	s7,176(sp)
    80002300:	0b813c23          	sd	s8,184(sp)
    80002304:	0d913023          	sd	s9,192(sp)
    80002308:	0da13423          	sd	s10,200(sp)
    8000230c:	0db13823          	sd	s11,208(sp)
    80002310:	0dc13c23          	sd	t3,216(sp)
    80002314:	0fd13023          	sd	t4,224(sp)
    80002318:	0fe13423          	sd	t5,232(sp)
    8000231c:	0ff13823          	sd	t6,240(sp)
    80002320:	cc9ff0ef          	jal	ra,80001fe8 <kerneltrap>
    80002324:	00013083          	ld	ra,0(sp)
    80002328:	00813103          	ld	sp,8(sp)
    8000232c:	01013183          	ld	gp,16(sp)
    80002330:	02013283          	ld	t0,32(sp)
    80002334:	02813303          	ld	t1,40(sp)
    80002338:	03013383          	ld	t2,48(sp)
    8000233c:	03813403          	ld	s0,56(sp)
    80002340:	04013483          	ld	s1,64(sp)
    80002344:	04813503          	ld	a0,72(sp)
    80002348:	05013583          	ld	a1,80(sp)
    8000234c:	05813603          	ld	a2,88(sp)
    80002350:	06013683          	ld	a3,96(sp)
    80002354:	06813703          	ld	a4,104(sp)
    80002358:	07013783          	ld	a5,112(sp)
    8000235c:	07813803          	ld	a6,120(sp)
    80002360:	08013883          	ld	a7,128(sp)
    80002364:	08813903          	ld	s2,136(sp)
    80002368:	09013983          	ld	s3,144(sp)
    8000236c:	09813a03          	ld	s4,152(sp)
    80002370:	0a013a83          	ld	s5,160(sp)
    80002374:	0a813b03          	ld	s6,168(sp)
    80002378:	0b013b83          	ld	s7,176(sp)
    8000237c:	0b813c03          	ld	s8,184(sp)
    80002380:	0c013c83          	ld	s9,192(sp)
    80002384:	0c813d03          	ld	s10,200(sp)
    80002388:	0d013d83          	ld	s11,208(sp)
    8000238c:	0d813e03          	ld	t3,216(sp)
    80002390:	0e013e83          	ld	t4,224(sp)
    80002394:	0e813f03          	ld	t5,232(sp)
    80002398:	0f013f83          	ld	t6,240(sp)
    8000239c:	10010113          	addi	sp,sp,256
    800023a0:	10200073          	sret
    800023a4:	00000013          	nop
    800023a8:	00000013          	nop
    800023ac:	00000013          	nop

00000000800023b0 <timervec>:
    800023b0:	34051573          	csrrw	a0,mscratch,a0
    800023b4:	00b53023          	sd	a1,0(a0)
    800023b8:	00c53423          	sd	a2,8(a0)
    800023bc:	00d53823          	sd	a3,16(a0)
    800023c0:	01853583          	ld	a1,24(a0)
    800023c4:	02053603          	ld	a2,32(a0)
    800023c8:	0005b683          	ld	a3,0(a1)
    800023cc:	00c686b3          	add	a3,a3,a2
    800023d0:	00d5b023          	sd	a3,0(a1)
    800023d4:	00200593          	li	a1,2
    800023d8:	14459073          	csrw	sip,a1
    800023dc:	01053683          	ld	a3,16(a0)
    800023e0:	00853603          	ld	a2,8(a0)
    800023e4:	00053583          	ld	a1,0(a0)
    800023e8:	34051573          	csrrw	a0,mscratch,a0
    800023ec:	30200073          	mret

00000000800023f0 <plicinit>:
    800023f0:	ff010113          	addi	sp,sp,-16
    800023f4:	00813423          	sd	s0,8(sp)
    800023f8:	01010413          	addi	s0,sp,16
    800023fc:	00813403          	ld	s0,8(sp)
    80002400:	0c0007b7          	lui	a5,0xc000
    80002404:	00100713          	li	a4,1
    80002408:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000240c:	00e7a223          	sw	a4,4(a5)
    80002410:	01010113          	addi	sp,sp,16
    80002414:	00008067          	ret

0000000080002418 <plicinithart>:
    80002418:	ff010113          	addi	sp,sp,-16
    8000241c:	00813023          	sd	s0,0(sp)
    80002420:	00113423          	sd	ra,8(sp)
    80002424:	01010413          	addi	s0,sp,16
    80002428:	00000097          	auipc	ra,0x0
    8000242c:	a40080e7          	jalr	-1472(ra) # 80001e68 <cpuid>
    80002430:	0085171b          	slliw	a4,a0,0x8
    80002434:	0c0027b7          	lui	a5,0xc002
    80002438:	00e787b3          	add	a5,a5,a4
    8000243c:	40200713          	li	a4,1026
    80002440:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80002444:	00813083          	ld	ra,8(sp)
    80002448:	00013403          	ld	s0,0(sp)
    8000244c:	00d5151b          	slliw	a0,a0,0xd
    80002450:	0c2017b7          	lui	a5,0xc201
    80002454:	00a78533          	add	a0,a5,a0
    80002458:	00052023          	sw	zero,0(a0)
    8000245c:	01010113          	addi	sp,sp,16
    80002460:	00008067          	ret

0000000080002464 <plic_claim>:
    80002464:	ff010113          	addi	sp,sp,-16
    80002468:	00813023          	sd	s0,0(sp)
    8000246c:	00113423          	sd	ra,8(sp)
    80002470:	01010413          	addi	s0,sp,16
    80002474:	00000097          	auipc	ra,0x0
    80002478:	9f4080e7          	jalr	-1548(ra) # 80001e68 <cpuid>
    8000247c:	00813083          	ld	ra,8(sp)
    80002480:	00013403          	ld	s0,0(sp)
    80002484:	00d5151b          	slliw	a0,a0,0xd
    80002488:	0c2017b7          	lui	a5,0xc201
    8000248c:	00a78533          	add	a0,a5,a0
    80002490:	00452503          	lw	a0,4(a0)
    80002494:	01010113          	addi	sp,sp,16
    80002498:	00008067          	ret

000000008000249c <plic_complete>:
    8000249c:	fe010113          	addi	sp,sp,-32
    800024a0:	00813823          	sd	s0,16(sp)
    800024a4:	00913423          	sd	s1,8(sp)
    800024a8:	00113c23          	sd	ra,24(sp)
    800024ac:	02010413          	addi	s0,sp,32
    800024b0:	00050493          	mv	s1,a0
    800024b4:	00000097          	auipc	ra,0x0
    800024b8:	9b4080e7          	jalr	-1612(ra) # 80001e68 <cpuid>
    800024bc:	01813083          	ld	ra,24(sp)
    800024c0:	01013403          	ld	s0,16(sp)
    800024c4:	00d5179b          	slliw	a5,a0,0xd
    800024c8:	0c201737          	lui	a4,0xc201
    800024cc:	00f707b3          	add	a5,a4,a5
    800024d0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    800024d4:	00813483          	ld	s1,8(sp)
    800024d8:	02010113          	addi	sp,sp,32
    800024dc:	00008067          	ret

00000000800024e0 <consolewrite>:
    800024e0:	fb010113          	addi	sp,sp,-80
    800024e4:	04813023          	sd	s0,64(sp)
    800024e8:	04113423          	sd	ra,72(sp)
    800024ec:	02913c23          	sd	s1,56(sp)
    800024f0:	03213823          	sd	s2,48(sp)
    800024f4:	03313423          	sd	s3,40(sp)
    800024f8:	03413023          	sd	s4,32(sp)
    800024fc:	01513c23          	sd	s5,24(sp)
    80002500:	05010413          	addi	s0,sp,80
    80002504:	06c05c63          	blez	a2,8000257c <consolewrite+0x9c>
    80002508:	00060993          	mv	s3,a2
    8000250c:	00050a13          	mv	s4,a0
    80002510:	00058493          	mv	s1,a1
    80002514:	00000913          	li	s2,0
    80002518:	fff00a93          	li	s5,-1
    8000251c:	01c0006f          	j	80002538 <consolewrite+0x58>
    80002520:	fbf44503          	lbu	a0,-65(s0)
    80002524:	0019091b          	addiw	s2,s2,1
    80002528:	00148493          	addi	s1,s1,1
    8000252c:	00001097          	auipc	ra,0x1
    80002530:	a9c080e7          	jalr	-1380(ra) # 80002fc8 <uartputc>
    80002534:	03298063          	beq	s3,s2,80002554 <consolewrite+0x74>
    80002538:	00048613          	mv	a2,s1
    8000253c:	00100693          	li	a3,1
    80002540:	000a0593          	mv	a1,s4
    80002544:	fbf40513          	addi	a0,s0,-65
    80002548:	00000097          	auipc	ra,0x0
    8000254c:	9d8080e7          	jalr	-1576(ra) # 80001f20 <either_copyin>
    80002550:	fd5518e3          	bne	a0,s5,80002520 <consolewrite+0x40>
    80002554:	04813083          	ld	ra,72(sp)
    80002558:	04013403          	ld	s0,64(sp)
    8000255c:	03813483          	ld	s1,56(sp)
    80002560:	02813983          	ld	s3,40(sp)
    80002564:	02013a03          	ld	s4,32(sp)
    80002568:	01813a83          	ld	s5,24(sp)
    8000256c:	00090513          	mv	a0,s2
    80002570:	03013903          	ld	s2,48(sp)
    80002574:	05010113          	addi	sp,sp,80
    80002578:	00008067          	ret
    8000257c:	00000913          	li	s2,0
    80002580:	fd5ff06f          	j	80002554 <consolewrite+0x74>

0000000080002584 <consoleread>:
    80002584:	f9010113          	addi	sp,sp,-112
    80002588:	06813023          	sd	s0,96(sp)
    8000258c:	04913c23          	sd	s1,88(sp)
    80002590:	05213823          	sd	s2,80(sp)
    80002594:	05313423          	sd	s3,72(sp)
    80002598:	05413023          	sd	s4,64(sp)
    8000259c:	03513c23          	sd	s5,56(sp)
    800025a0:	03613823          	sd	s6,48(sp)
    800025a4:	03713423          	sd	s7,40(sp)
    800025a8:	03813023          	sd	s8,32(sp)
    800025ac:	06113423          	sd	ra,104(sp)
    800025b0:	01913c23          	sd	s9,24(sp)
    800025b4:	07010413          	addi	s0,sp,112
    800025b8:	00060b93          	mv	s7,a2
    800025bc:	00050913          	mv	s2,a0
    800025c0:	00058c13          	mv	s8,a1
    800025c4:	00060b1b          	sext.w	s6,a2
    800025c8:	00003497          	auipc	s1,0x3
    800025cc:	38048493          	addi	s1,s1,896 # 80005948 <cons>
    800025d0:	00400993          	li	s3,4
    800025d4:	fff00a13          	li	s4,-1
    800025d8:	00a00a93          	li	s5,10
    800025dc:	05705e63          	blez	s7,80002638 <consoleread+0xb4>
    800025e0:	09c4a703          	lw	a4,156(s1)
    800025e4:	0984a783          	lw	a5,152(s1)
    800025e8:	0007071b          	sext.w	a4,a4
    800025ec:	08e78463          	beq	a5,a4,80002674 <consoleread+0xf0>
    800025f0:	07f7f713          	andi	a4,a5,127
    800025f4:	00e48733          	add	a4,s1,a4
    800025f8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    800025fc:	0017869b          	addiw	a3,a5,1
    80002600:	08d4ac23          	sw	a3,152(s1)
    80002604:	00070c9b          	sext.w	s9,a4
    80002608:	0b370663          	beq	a4,s3,800026b4 <consoleread+0x130>
    8000260c:	00100693          	li	a3,1
    80002610:	f9f40613          	addi	a2,s0,-97
    80002614:	000c0593          	mv	a1,s8
    80002618:	00090513          	mv	a0,s2
    8000261c:	f8e40fa3          	sb	a4,-97(s0)
    80002620:	00000097          	auipc	ra,0x0
    80002624:	8b4080e7          	jalr	-1868(ra) # 80001ed4 <either_copyout>
    80002628:	01450863          	beq	a0,s4,80002638 <consoleread+0xb4>
    8000262c:	001c0c13          	addi	s8,s8,1
    80002630:	fffb8b9b          	addiw	s7,s7,-1
    80002634:	fb5c94e3          	bne	s9,s5,800025dc <consoleread+0x58>
    80002638:	000b851b          	sext.w	a0,s7
    8000263c:	06813083          	ld	ra,104(sp)
    80002640:	06013403          	ld	s0,96(sp)
    80002644:	05813483          	ld	s1,88(sp)
    80002648:	05013903          	ld	s2,80(sp)
    8000264c:	04813983          	ld	s3,72(sp)
    80002650:	04013a03          	ld	s4,64(sp)
    80002654:	03813a83          	ld	s5,56(sp)
    80002658:	02813b83          	ld	s7,40(sp)
    8000265c:	02013c03          	ld	s8,32(sp)
    80002660:	01813c83          	ld	s9,24(sp)
    80002664:	40ab053b          	subw	a0,s6,a0
    80002668:	03013b03          	ld	s6,48(sp)
    8000266c:	07010113          	addi	sp,sp,112
    80002670:	00008067          	ret
    80002674:	00001097          	auipc	ra,0x1
    80002678:	1d8080e7          	jalr	472(ra) # 8000384c <push_on>
    8000267c:	0984a703          	lw	a4,152(s1)
    80002680:	09c4a783          	lw	a5,156(s1)
    80002684:	0007879b          	sext.w	a5,a5
    80002688:	fef70ce3          	beq	a4,a5,80002680 <consoleread+0xfc>
    8000268c:	00001097          	auipc	ra,0x1
    80002690:	234080e7          	jalr	564(ra) # 800038c0 <pop_on>
    80002694:	0984a783          	lw	a5,152(s1)
    80002698:	07f7f713          	andi	a4,a5,127
    8000269c:	00e48733          	add	a4,s1,a4
    800026a0:	01874703          	lbu	a4,24(a4)
    800026a4:	0017869b          	addiw	a3,a5,1
    800026a8:	08d4ac23          	sw	a3,152(s1)
    800026ac:	00070c9b          	sext.w	s9,a4
    800026b0:	f5371ee3          	bne	a4,s3,8000260c <consoleread+0x88>
    800026b4:	000b851b          	sext.w	a0,s7
    800026b8:	f96bf2e3          	bgeu	s7,s6,8000263c <consoleread+0xb8>
    800026bc:	08f4ac23          	sw	a5,152(s1)
    800026c0:	f7dff06f          	j	8000263c <consoleread+0xb8>

00000000800026c4 <consputc>:
    800026c4:	10000793          	li	a5,256
    800026c8:	00f50663          	beq	a0,a5,800026d4 <consputc+0x10>
    800026cc:	00001317          	auipc	t1,0x1
    800026d0:	9f430067          	jr	-1548(t1) # 800030c0 <uartputc_sync>
    800026d4:	ff010113          	addi	sp,sp,-16
    800026d8:	00113423          	sd	ra,8(sp)
    800026dc:	00813023          	sd	s0,0(sp)
    800026e0:	01010413          	addi	s0,sp,16
    800026e4:	00800513          	li	a0,8
    800026e8:	00001097          	auipc	ra,0x1
    800026ec:	9d8080e7          	jalr	-1576(ra) # 800030c0 <uartputc_sync>
    800026f0:	02000513          	li	a0,32
    800026f4:	00001097          	auipc	ra,0x1
    800026f8:	9cc080e7          	jalr	-1588(ra) # 800030c0 <uartputc_sync>
    800026fc:	00013403          	ld	s0,0(sp)
    80002700:	00813083          	ld	ra,8(sp)
    80002704:	00800513          	li	a0,8
    80002708:	01010113          	addi	sp,sp,16
    8000270c:	00001317          	auipc	t1,0x1
    80002710:	9b430067          	jr	-1612(t1) # 800030c0 <uartputc_sync>

0000000080002714 <consoleintr>:
    80002714:	fe010113          	addi	sp,sp,-32
    80002718:	00813823          	sd	s0,16(sp)
    8000271c:	00913423          	sd	s1,8(sp)
    80002720:	01213023          	sd	s2,0(sp)
    80002724:	00113c23          	sd	ra,24(sp)
    80002728:	02010413          	addi	s0,sp,32
    8000272c:	00003917          	auipc	s2,0x3
    80002730:	21c90913          	addi	s2,s2,540 # 80005948 <cons>
    80002734:	00050493          	mv	s1,a0
    80002738:	00090513          	mv	a0,s2
    8000273c:	00001097          	auipc	ra,0x1
    80002740:	e40080e7          	jalr	-448(ra) # 8000357c <acquire>
    80002744:	02048c63          	beqz	s1,8000277c <consoleintr+0x68>
    80002748:	0a092783          	lw	a5,160(s2)
    8000274c:	09892703          	lw	a4,152(s2)
    80002750:	07f00693          	li	a3,127
    80002754:	40e7873b          	subw	a4,a5,a4
    80002758:	02e6e263          	bltu	a3,a4,8000277c <consoleintr+0x68>
    8000275c:	00d00713          	li	a4,13
    80002760:	04e48063          	beq	s1,a4,800027a0 <consoleintr+0x8c>
    80002764:	07f7f713          	andi	a4,a5,127
    80002768:	00e90733          	add	a4,s2,a4
    8000276c:	0017879b          	addiw	a5,a5,1
    80002770:	0af92023          	sw	a5,160(s2)
    80002774:	00970c23          	sb	s1,24(a4)
    80002778:	08f92e23          	sw	a5,156(s2)
    8000277c:	01013403          	ld	s0,16(sp)
    80002780:	01813083          	ld	ra,24(sp)
    80002784:	00813483          	ld	s1,8(sp)
    80002788:	00013903          	ld	s2,0(sp)
    8000278c:	00003517          	auipc	a0,0x3
    80002790:	1bc50513          	addi	a0,a0,444 # 80005948 <cons>
    80002794:	02010113          	addi	sp,sp,32
    80002798:	00001317          	auipc	t1,0x1
    8000279c:	eb030067          	jr	-336(t1) # 80003648 <release>
    800027a0:	00a00493          	li	s1,10
    800027a4:	fc1ff06f          	j	80002764 <consoleintr+0x50>

00000000800027a8 <consoleinit>:
    800027a8:	fe010113          	addi	sp,sp,-32
    800027ac:	00113c23          	sd	ra,24(sp)
    800027b0:	00813823          	sd	s0,16(sp)
    800027b4:	00913423          	sd	s1,8(sp)
    800027b8:	02010413          	addi	s0,sp,32
    800027bc:	00003497          	auipc	s1,0x3
    800027c0:	18c48493          	addi	s1,s1,396 # 80005948 <cons>
    800027c4:	00048513          	mv	a0,s1
    800027c8:	00002597          	auipc	a1,0x2
    800027cc:	ad058593          	addi	a1,a1,-1328 # 80004298 <_ZZ12printIntegermE6digits+0x278>
    800027d0:	00001097          	auipc	ra,0x1
    800027d4:	d88080e7          	jalr	-632(ra) # 80003558 <initlock>
    800027d8:	00000097          	auipc	ra,0x0
    800027dc:	7ac080e7          	jalr	1964(ra) # 80002f84 <uartinit>
    800027e0:	01813083          	ld	ra,24(sp)
    800027e4:	01013403          	ld	s0,16(sp)
    800027e8:	00000797          	auipc	a5,0x0
    800027ec:	d9c78793          	addi	a5,a5,-612 # 80002584 <consoleread>
    800027f0:	0af4bc23          	sd	a5,184(s1)
    800027f4:	00000797          	auipc	a5,0x0
    800027f8:	cec78793          	addi	a5,a5,-788 # 800024e0 <consolewrite>
    800027fc:	0cf4b023          	sd	a5,192(s1)
    80002800:	00813483          	ld	s1,8(sp)
    80002804:	02010113          	addi	sp,sp,32
    80002808:	00008067          	ret

000000008000280c <console_read>:
    8000280c:	ff010113          	addi	sp,sp,-16
    80002810:	00813423          	sd	s0,8(sp)
    80002814:	01010413          	addi	s0,sp,16
    80002818:	00813403          	ld	s0,8(sp)
    8000281c:	00003317          	auipc	t1,0x3
    80002820:	1e433303          	ld	t1,484(t1) # 80005a00 <devsw+0x10>
    80002824:	01010113          	addi	sp,sp,16
    80002828:	00030067          	jr	t1

000000008000282c <console_write>:
    8000282c:	ff010113          	addi	sp,sp,-16
    80002830:	00813423          	sd	s0,8(sp)
    80002834:	01010413          	addi	s0,sp,16
    80002838:	00813403          	ld	s0,8(sp)
    8000283c:	00003317          	auipc	t1,0x3
    80002840:	1cc33303          	ld	t1,460(t1) # 80005a08 <devsw+0x18>
    80002844:	01010113          	addi	sp,sp,16
    80002848:	00030067          	jr	t1

000000008000284c <panic>:
    8000284c:	fe010113          	addi	sp,sp,-32
    80002850:	00113c23          	sd	ra,24(sp)
    80002854:	00813823          	sd	s0,16(sp)
    80002858:	00913423          	sd	s1,8(sp)
    8000285c:	02010413          	addi	s0,sp,32
    80002860:	00050493          	mv	s1,a0
    80002864:	00002517          	auipc	a0,0x2
    80002868:	a3c50513          	addi	a0,a0,-1476 # 800042a0 <_ZZ12printIntegermE6digits+0x280>
    8000286c:	00003797          	auipc	a5,0x3
    80002870:	2207ae23          	sw	zero,572(a5) # 80005aa8 <pr+0x18>
    80002874:	00000097          	auipc	ra,0x0
    80002878:	034080e7          	jalr	52(ra) # 800028a8 <__printf>
    8000287c:	00048513          	mv	a0,s1
    80002880:	00000097          	auipc	ra,0x0
    80002884:	028080e7          	jalr	40(ra) # 800028a8 <__printf>
    80002888:	00002517          	auipc	a0,0x2
    8000288c:	9f850513          	addi	a0,a0,-1544 # 80004280 <_ZZ12printIntegermE6digits+0x260>
    80002890:	00000097          	auipc	ra,0x0
    80002894:	018080e7          	jalr	24(ra) # 800028a8 <__printf>
    80002898:	00100793          	li	a5,1
    8000289c:	00002717          	auipc	a4,0x2
    800028a0:	f6f72623          	sw	a5,-148(a4) # 80004808 <panicked>
    800028a4:	0000006f          	j	800028a4 <panic+0x58>

00000000800028a8 <__printf>:
    800028a8:	f3010113          	addi	sp,sp,-208
    800028ac:	08813023          	sd	s0,128(sp)
    800028b0:	07313423          	sd	s3,104(sp)
    800028b4:	09010413          	addi	s0,sp,144
    800028b8:	05813023          	sd	s8,64(sp)
    800028bc:	08113423          	sd	ra,136(sp)
    800028c0:	06913c23          	sd	s1,120(sp)
    800028c4:	07213823          	sd	s2,112(sp)
    800028c8:	07413023          	sd	s4,96(sp)
    800028cc:	05513c23          	sd	s5,88(sp)
    800028d0:	05613823          	sd	s6,80(sp)
    800028d4:	05713423          	sd	s7,72(sp)
    800028d8:	03913c23          	sd	s9,56(sp)
    800028dc:	03a13823          	sd	s10,48(sp)
    800028e0:	03b13423          	sd	s11,40(sp)
    800028e4:	00003317          	auipc	t1,0x3
    800028e8:	1ac30313          	addi	t1,t1,428 # 80005a90 <pr>
    800028ec:	01832c03          	lw	s8,24(t1)
    800028f0:	00b43423          	sd	a1,8(s0)
    800028f4:	00c43823          	sd	a2,16(s0)
    800028f8:	00d43c23          	sd	a3,24(s0)
    800028fc:	02e43023          	sd	a4,32(s0)
    80002900:	02f43423          	sd	a5,40(s0)
    80002904:	03043823          	sd	a6,48(s0)
    80002908:	03143c23          	sd	a7,56(s0)
    8000290c:	00050993          	mv	s3,a0
    80002910:	4a0c1663          	bnez	s8,80002dbc <__printf+0x514>
    80002914:	60098c63          	beqz	s3,80002f2c <__printf+0x684>
    80002918:	0009c503          	lbu	a0,0(s3)
    8000291c:	00840793          	addi	a5,s0,8
    80002920:	f6f43c23          	sd	a5,-136(s0)
    80002924:	00000493          	li	s1,0
    80002928:	22050063          	beqz	a0,80002b48 <__printf+0x2a0>
    8000292c:	00002a37          	lui	s4,0x2
    80002930:	00018ab7          	lui	s5,0x18
    80002934:	000f4b37          	lui	s6,0xf4
    80002938:	00989bb7          	lui	s7,0x989
    8000293c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80002940:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80002944:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80002948:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    8000294c:	00148c9b          	addiw	s9,s1,1
    80002950:	02500793          	li	a5,37
    80002954:	01998933          	add	s2,s3,s9
    80002958:	38f51263          	bne	a0,a5,80002cdc <__printf+0x434>
    8000295c:	00094783          	lbu	a5,0(s2)
    80002960:	00078c9b          	sext.w	s9,a5
    80002964:	1e078263          	beqz	a5,80002b48 <__printf+0x2a0>
    80002968:	0024849b          	addiw	s1,s1,2
    8000296c:	07000713          	li	a4,112
    80002970:	00998933          	add	s2,s3,s1
    80002974:	38e78a63          	beq	a5,a4,80002d08 <__printf+0x460>
    80002978:	20f76863          	bltu	a4,a5,80002b88 <__printf+0x2e0>
    8000297c:	42a78863          	beq	a5,a0,80002dac <__printf+0x504>
    80002980:	06400713          	li	a4,100
    80002984:	40e79663          	bne	a5,a4,80002d90 <__printf+0x4e8>
    80002988:	f7843783          	ld	a5,-136(s0)
    8000298c:	0007a603          	lw	a2,0(a5)
    80002990:	00878793          	addi	a5,a5,8
    80002994:	f6f43c23          	sd	a5,-136(s0)
    80002998:	42064a63          	bltz	a2,80002dcc <__printf+0x524>
    8000299c:	00a00713          	li	a4,10
    800029a0:	02e677bb          	remuw	a5,a2,a4
    800029a4:	00002d97          	auipc	s11,0x2
    800029a8:	924d8d93          	addi	s11,s11,-1756 # 800042c8 <digits>
    800029ac:	00900593          	li	a1,9
    800029b0:	0006051b          	sext.w	a0,a2
    800029b4:	00000c93          	li	s9,0
    800029b8:	02079793          	slli	a5,a5,0x20
    800029bc:	0207d793          	srli	a5,a5,0x20
    800029c0:	00fd87b3          	add	a5,s11,a5
    800029c4:	0007c783          	lbu	a5,0(a5)
    800029c8:	02e656bb          	divuw	a3,a2,a4
    800029cc:	f8f40023          	sb	a5,-128(s0)
    800029d0:	14c5d863          	bge	a1,a2,80002b20 <__printf+0x278>
    800029d4:	06300593          	li	a1,99
    800029d8:	00100c93          	li	s9,1
    800029dc:	02e6f7bb          	remuw	a5,a3,a4
    800029e0:	02079793          	slli	a5,a5,0x20
    800029e4:	0207d793          	srli	a5,a5,0x20
    800029e8:	00fd87b3          	add	a5,s11,a5
    800029ec:	0007c783          	lbu	a5,0(a5)
    800029f0:	02e6d73b          	divuw	a4,a3,a4
    800029f4:	f8f400a3          	sb	a5,-127(s0)
    800029f8:	12a5f463          	bgeu	a1,a0,80002b20 <__printf+0x278>
    800029fc:	00a00693          	li	a3,10
    80002a00:	00900593          	li	a1,9
    80002a04:	02d777bb          	remuw	a5,a4,a3
    80002a08:	02079793          	slli	a5,a5,0x20
    80002a0c:	0207d793          	srli	a5,a5,0x20
    80002a10:	00fd87b3          	add	a5,s11,a5
    80002a14:	0007c503          	lbu	a0,0(a5)
    80002a18:	02d757bb          	divuw	a5,a4,a3
    80002a1c:	f8a40123          	sb	a0,-126(s0)
    80002a20:	48e5f263          	bgeu	a1,a4,80002ea4 <__printf+0x5fc>
    80002a24:	06300513          	li	a0,99
    80002a28:	02d7f5bb          	remuw	a1,a5,a3
    80002a2c:	02059593          	slli	a1,a1,0x20
    80002a30:	0205d593          	srli	a1,a1,0x20
    80002a34:	00bd85b3          	add	a1,s11,a1
    80002a38:	0005c583          	lbu	a1,0(a1)
    80002a3c:	02d7d7bb          	divuw	a5,a5,a3
    80002a40:	f8b401a3          	sb	a1,-125(s0)
    80002a44:	48e57263          	bgeu	a0,a4,80002ec8 <__printf+0x620>
    80002a48:	3e700513          	li	a0,999
    80002a4c:	02d7f5bb          	remuw	a1,a5,a3
    80002a50:	02059593          	slli	a1,a1,0x20
    80002a54:	0205d593          	srli	a1,a1,0x20
    80002a58:	00bd85b3          	add	a1,s11,a1
    80002a5c:	0005c583          	lbu	a1,0(a1)
    80002a60:	02d7d7bb          	divuw	a5,a5,a3
    80002a64:	f8b40223          	sb	a1,-124(s0)
    80002a68:	46e57663          	bgeu	a0,a4,80002ed4 <__printf+0x62c>
    80002a6c:	02d7f5bb          	remuw	a1,a5,a3
    80002a70:	02059593          	slli	a1,a1,0x20
    80002a74:	0205d593          	srli	a1,a1,0x20
    80002a78:	00bd85b3          	add	a1,s11,a1
    80002a7c:	0005c583          	lbu	a1,0(a1)
    80002a80:	02d7d7bb          	divuw	a5,a5,a3
    80002a84:	f8b402a3          	sb	a1,-123(s0)
    80002a88:	46ea7863          	bgeu	s4,a4,80002ef8 <__printf+0x650>
    80002a8c:	02d7f5bb          	remuw	a1,a5,a3
    80002a90:	02059593          	slli	a1,a1,0x20
    80002a94:	0205d593          	srli	a1,a1,0x20
    80002a98:	00bd85b3          	add	a1,s11,a1
    80002a9c:	0005c583          	lbu	a1,0(a1)
    80002aa0:	02d7d7bb          	divuw	a5,a5,a3
    80002aa4:	f8b40323          	sb	a1,-122(s0)
    80002aa8:	3eeaf863          	bgeu	s5,a4,80002e98 <__printf+0x5f0>
    80002aac:	02d7f5bb          	remuw	a1,a5,a3
    80002ab0:	02059593          	slli	a1,a1,0x20
    80002ab4:	0205d593          	srli	a1,a1,0x20
    80002ab8:	00bd85b3          	add	a1,s11,a1
    80002abc:	0005c583          	lbu	a1,0(a1)
    80002ac0:	02d7d7bb          	divuw	a5,a5,a3
    80002ac4:	f8b403a3          	sb	a1,-121(s0)
    80002ac8:	42eb7e63          	bgeu	s6,a4,80002f04 <__printf+0x65c>
    80002acc:	02d7f5bb          	remuw	a1,a5,a3
    80002ad0:	02059593          	slli	a1,a1,0x20
    80002ad4:	0205d593          	srli	a1,a1,0x20
    80002ad8:	00bd85b3          	add	a1,s11,a1
    80002adc:	0005c583          	lbu	a1,0(a1)
    80002ae0:	02d7d7bb          	divuw	a5,a5,a3
    80002ae4:	f8b40423          	sb	a1,-120(s0)
    80002ae8:	42ebfc63          	bgeu	s7,a4,80002f20 <__printf+0x678>
    80002aec:	02079793          	slli	a5,a5,0x20
    80002af0:	0207d793          	srli	a5,a5,0x20
    80002af4:	00fd8db3          	add	s11,s11,a5
    80002af8:	000dc703          	lbu	a4,0(s11)
    80002afc:	00a00793          	li	a5,10
    80002b00:	00900c93          	li	s9,9
    80002b04:	f8e404a3          	sb	a4,-119(s0)
    80002b08:	00065c63          	bgez	a2,80002b20 <__printf+0x278>
    80002b0c:	f9040713          	addi	a4,s0,-112
    80002b10:	00f70733          	add	a4,a4,a5
    80002b14:	02d00693          	li	a3,45
    80002b18:	fed70823          	sb	a3,-16(a4)
    80002b1c:	00078c93          	mv	s9,a5
    80002b20:	f8040793          	addi	a5,s0,-128
    80002b24:	01978cb3          	add	s9,a5,s9
    80002b28:	f7f40d13          	addi	s10,s0,-129
    80002b2c:	000cc503          	lbu	a0,0(s9)
    80002b30:	fffc8c93          	addi	s9,s9,-1
    80002b34:	00000097          	auipc	ra,0x0
    80002b38:	b90080e7          	jalr	-1136(ra) # 800026c4 <consputc>
    80002b3c:	ffac98e3          	bne	s9,s10,80002b2c <__printf+0x284>
    80002b40:	00094503          	lbu	a0,0(s2)
    80002b44:	e00514e3          	bnez	a0,8000294c <__printf+0xa4>
    80002b48:	1a0c1663          	bnez	s8,80002cf4 <__printf+0x44c>
    80002b4c:	08813083          	ld	ra,136(sp)
    80002b50:	08013403          	ld	s0,128(sp)
    80002b54:	07813483          	ld	s1,120(sp)
    80002b58:	07013903          	ld	s2,112(sp)
    80002b5c:	06813983          	ld	s3,104(sp)
    80002b60:	06013a03          	ld	s4,96(sp)
    80002b64:	05813a83          	ld	s5,88(sp)
    80002b68:	05013b03          	ld	s6,80(sp)
    80002b6c:	04813b83          	ld	s7,72(sp)
    80002b70:	04013c03          	ld	s8,64(sp)
    80002b74:	03813c83          	ld	s9,56(sp)
    80002b78:	03013d03          	ld	s10,48(sp)
    80002b7c:	02813d83          	ld	s11,40(sp)
    80002b80:	0d010113          	addi	sp,sp,208
    80002b84:	00008067          	ret
    80002b88:	07300713          	li	a4,115
    80002b8c:	1ce78a63          	beq	a5,a4,80002d60 <__printf+0x4b8>
    80002b90:	07800713          	li	a4,120
    80002b94:	1ee79e63          	bne	a5,a4,80002d90 <__printf+0x4e8>
    80002b98:	f7843783          	ld	a5,-136(s0)
    80002b9c:	0007a703          	lw	a4,0(a5)
    80002ba0:	00878793          	addi	a5,a5,8
    80002ba4:	f6f43c23          	sd	a5,-136(s0)
    80002ba8:	28074263          	bltz	a4,80002e2c <__printf+0x584>
    80002bac:	00001d97          	auipc	s11,0x1
    80002bb0:	71cd8d93          	addi	s11,s11,1820 # 800042c8 <digits>
    80002bb4:	00f77793          	andi	a5,a4,15
    80002bb8:	00fd87b3          	add	a5,s11,a5
    80002bbc:	0007c683          	lbu	a3,0(a5)
    80002bc0:	00f00613          	li	a2,15
    80002bc4:	0007079b          	sext.w	a5,a4
    80002bc8:	f8d40023          	sb	a3,-128(s0)
    80002bcc:	0047559b          	srliw	a1,a4,0x4
    80002bd0:	0047569b          	srliw	a3,a4,0x4
    80002bd4:	00000c93          	li	s9,0
    80002bd8:	0ee65063          	bge	a2,a4,80002cb8 <__printf+0x410>
    80002bdc:	00f6f693          	andi	a3,a3,15
    80002be0:	00dd86b3          	add	a3,s11,a3
    80002be4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80002be8:	0087d79b          	srliw	a5,a5,0x8
    80002bec:	00100c93          	li	s9,1
    80002bf0:	f8d400a3          	sb	a3,-127(s0)
    80002bf4:	0cb67263          	bgeu	a2,a1,80002cb8 <__printf+0x410>
    80002bf8:	00f7f693          	andi	a3,a5,15
    80002bfc:	00dd86b3          	add	a3,s11,a3
    80002c00:	0006c583          	lbu	a1,0(a3)
    80002c04:	00f00613          	li	a2,15
    80002c08:	0047d69b          	srliw	a3,a5,0x4
    80002c0c:	f8b40123          	sb	a1,-126(s0)
    80002c10:	0047d593          	srli	a1,a5,0x4
    80002c14:	28f67e63          	bgeu	a2,a5,80002eb0 <__printf+0x608>
    80002c18:	00f6f693          	andi	a3,a3,15
    80002c1c:	00dd86b3          	add	a3,s11,a3
    80002c20:	0006c503          	lbu	a0,0(a3)
    80002c24:	0087d813          	srli	a6,a5,0x8
    80002c28:	0087d69b          	srliw	a3,a5,0x8
    80002c2c:	f8a401a3          	sb	a0,-125(s0)
    80002c30:	28b67663          	bgeu	a2,a1,80002ebc <__printf+0x614>
    80002c34:	00f6f693          	andi	a3,a3,15
    80002c38:	00dd86b3          	add	a3,s11,a3
    80002c3c:	0006c583          	lbu	a1,0(a3)
    80002c40:	00c7d513          	srli	a0,a5,0xc
    80002c44:	00c7d69b          	srliw	a3,a5,0xc
    80002c48:	f8b40223          	sb	a1,-124(s0)
    80002c4c:	29067a63          	bgeu	a2,a6,80002ee0 <__printf+0x638>
    80002c50:	00f6f693          	andi	a3,a3,15
    80002c54:	00dd86b3          	add	a3,s11,a3
    80002c58:	0006c583          	lbu	a1,0(a3)
    80002c5c:	0107d813          	srli	a6,a5,0x10
    80002c60:	0107d69b          	srliw	a3,a5,0x10
    80002c64:	f8b402a3          	sb	a1,-123(s0)
    80002c68:	28a67263          	bgeu	a2,a0,80002eec <__printf+0x644>
    80002c6c:	00f6f693          	andi	a3,a3,15
    80002c70:	00dd86b3          	add	a3,s11,a3
    80002c74:	0006c683          	lbu	a3,0(a3)
    80002c78:	0147d79b          	srliw	a5,a5,0x14
    80002c7c:	f8d40323          	sb	a3,-122(s0)
    80002c80:	21067663          	bgeu	a2,a6,80002e8c <__printf+0x5e4>
    80002c84:	02079793          	slli	a5,a5,0x20
    80002c88:	0207d793          	srli	a5,a5,0x20
    80002c8c:	00fd8db3          	add	s11,s11,a5
    80002c90:	000dc683          	lbu	a3,0(s11)
    80002c94:	00800793          	li	a5,8
    80002c98:	00700c93          	li	s9,7
    80002c9c:	f8d403a3          	sb	a3,-121(s0)
    80002ca0:	00075c63          	bgez	a4,80002cb8 <__printf+0x410>
    80002ca4:	f9040713          	addi	a4,s0,-112
    80002ca8:	00f70733          	add	a4,a4,a5
    80002cac:	02d00693          	li	a3,45
    80002cb0:	fed70823          	sb	a3,-16(a4)
    80002cb4:	00078c93          	mv	s9,a5
    80002cb8:	f8040793          	addi	a5,s0,-128
    80002cbc:	01978cb3          	add	s9,a5,s9
    80002cc0:	f7f40d13          	addi	s10,s0,-129
    80002cc4:	000cc503          	lbu	a0,0(s9)
    80002cc8:	fffc8c93          	addi	s9,s9,-1
    80002ccc:	00000097          	auipc	ra,0x0
    80002cd0:	9f8080e7          	jalr	-1544(ra) # 800026c4 <consputc>
    80002cd4:	ff9d18e3          	bne	s10,s9,80002cc4 <__printf+0x41c>
    80002cd8:	0100006f          	j	80002ce8 <__printf+0x440>
    80002cdc:	00000097          	auipc	ra,0x0
    80002ce0:	9e8080e7          	jalr	-1560(ra) # 800026c4 <consputc>
    80002ce4:	000c8493          	mv	s1,s9
    80002ce8:	00094503          	lbu	a0,0(s2)
    80002cec:	c60510e3          	bnez	a0,8000294c <__printf+0xa4>
    80002cf0:	e40c0ee3          	beqz	s8,80002b4c <__printf+0x2a4>
    80002cf4:	00003517          	auipc	a0,0x3
    80002cf8:	d9c50513          	addi	a0,a0,-612 # 80005a90 <pr>
    80002cfc:	00001097          	auipc	ra,0x1
    80002d00:	94c080e7          	jalr	-1716(ra) # 80003648 <release>
    80002d04:	e49ff06f          	j	80002b4c <__printf+0x2a4>
    80002d08:	f7843783          	ld	a5,-136(s0)
    80002d0c:	03000513          	li	a0,48
    80002d10:	01000d13          	li	s10,16
    80002d14:	00878713          	addi	a4,a5,8
    80002d18:	0007bc83          	ld	s9,0(a5)
    80002d1c:	f6e43c23          	sd	a4,-136(s0)
    80002d20:	00000097          	auipc	ra,0x0
    80002d24:	9a4080e7          	jalr	-1628(ra) # 800026c4 <consputc>
    80002d28:	07800513          	li	a0,120
    80002d2c:	00000097          	auipc	ra,0x0
    80002d30:	998080e7          	jalr	-1640(ra) # 800026c4 <consputc>
    80002d34:	00001d97          	auipc	s11,0x1
    80002d38:	594d8d93          	addi	s11,s11,1428 # 800042c8 <digits>
    80002d3c:	03ccd793          	srli	a5,s9,0x3c
    80002d40:	00fd87b3          	add	a5,s11,a5
    80002d44:	0007c503          	lbu	a0,0(a5)
    80002d48:	fffd0d1b          	addiw	s10,s10,-1
    80002d4c:	004c9c93          	slli	s9,s9,0x4
    80002d50:	00000097          	auipc	ra,0x0
    80002d54:	974080e7          	jalr	-1676(ra) # 800026c4 <consputc>
    80002d58:	fe0d12e3          	bnez	s10,80002d3c <__printf+0x494>
    80002d5c:	f8dff06f          	j	80002ce8 <__printf+0x440>
    80002d60:	f7843783          	ld	a5,-136(s0)
    80002d64:	0007bc83          	ld	s9,0(a5)
    80002d68:	00878793          	addi	a5,a5,8
    80002d6c:	f6f43c23          	sd	a5,-136(s0)
    80002d70:	000c9a63          	bnez	s9,80002d84 <__printf+0x4dc>
    80002d74:	1080006f          	j	80002e7c <__printf+0x5d4>
    80002d78:	001c8c93          	addi	s9,s9,1
    80002d7c:	00000097          	auipc	ra,0x0
    80002d80:	948080e7          	jalr	-1720(ra) # 800026c4 <consputc>
    80002d84:	000cc503          	lbu	a0,0(s9)
    80002d88:	fe0518e3          	bnez	a0,80002d78 <__printf+0x4d0>
    80002d8c:	f5dff06f          	j	80002ce8 <__printf+0x440>
    80002d90:	02500513          	li	a0,37
    80002d94:	00000097          	auipc	ra,0x0
    80002d98:	930080e7          	jalr	-1744(ra) # 800026c4 <consputc>
    80002d9c:	000c8513          	mv	a0,s9
    80002da0:	00000097          	auipc	ra,0x0
    80002da4:	924080e7          	jalr	-1756(ra) # 800026c4 <consputc>
    80002da8:	f41ff06f          	j	80002ce8 <__printf+0x440>
    80002dac:	02500513          	li	a0,37
    80002db0:	00000097          	auipc	ra,0x0
    80002db4:	914080e7          	jalr	-1772(ra) # 800026c4 <consputc>
    80002db8:	f31ff06f          	j	80002ce8 <__printf+0x440>
    80002dbc:	00030513          	mv	a0,t1
    80002dc0:	00000097          	auipc	ra,0x0
    80002dc4:	7bc080e7          	jalr	1980(ra) # 8000357c <acquire>
    80002dc8:	b4dff06f          	j	80002914 <__printf+0x6c>
    80002dcc:	40c0053b          	negw	a0,a2
    80002dd0:	00a00713          	li	a4,10
    80002dd4:	02e576bb          	remuw	a3,a0,a4
    80002dd8:	00001d97          	auipc	s11,0x1
    80002ddc:	4f0d8d93          	addi	s11,s11,1264 # 800042c8 <digits>
    80002de0:	ff700593          	li	a1,-9
    80002de4:	02069693          	slli	a3,a3,0x20
    80002de8:	0206d693          	srli	a3,a3,0x20
    80002dec:	00dd86b3          	add	a3,s11,a3
    80002df0:	0006c683          	lbu	a3,0(a3)
    80002df4:	02e557bb          	divuw	a5,a0,a4
    80002df8:	f8d40023          	sb	a3,-128(s0)
    80002dfc:	10b65e63          	bge	a2,a1,80002f18 <__printf+0x670>
    80002e00:	06300593          	li	a1,99
    80002e04:	02e7f6bb          	remuw	a3,a5,a4
    80002e08:	02069693          	slli	a3,a3,0x20
    80002e0c:	0206d693          	srli	a3,a3,0x20
    80002e10:	00dd86b3          	add	a3,s11,a3
    80002e14:	0006c683          	lbu	a3,0(a3)
    80002e18:	02e7d73b          	divuw	a4,a5,a4
    80002e1c:	00200793          	li	a5,2
    80002e20:	f8d400a3          	sb	a3,-127(s0)
    80002e24:	bca5ece3          	bltu	a1,a0,800029fc <__printf+0x154>
    80002e28:	ce5ff06f          	j	80002b0c <__printf+0x264>
    80002e2c:	40e007bb          	negw	a5,a4
    80002e30:	00001d97          	auipc	s11,0x1
    80002e34:	498d8d93          	addi	s11,s11,1176 # 800042c8 <digits>
    80002e38:	00f7f693          	andi	a3,a5,15
    80002e3c:	00dd86b3          	add	a3,s11,a3
    80002e40:	0006c583          	lbu	a1,0(a3)
    80002e44:	ff100613          	li	a2,-15
    80002e48:	0047d69b          	srliw	a3,a5,0x4
    80002e4c:	f8b40023          	sb	a1,-128(s0)
    80002e50:	0047d59b          	srliw	a1,a5,0x4
    80002e54:	0ac75e63          	bge	a4,a2,80002f10 <__printf+0x668>
    80002e58:	00f6f693          	andi	a3,a3,15
    80002e5c:	00dd86b3          	add	a3,s11,a3
    80002e60:	0006c603          	lbu	a2,0(a3)
    80002e64:	00f00693          	li	a3,15
    80002e68:	0087d79b          	srliw	a5,a5,0x8
    80002e6c:	f8c400a3          	sb	a2,-127(s0)
    80002e70:	d8b6e4e3          	bltu	a3,a1,80002bf8 <__printf+0x350>
    80002e74:	00200793          	li	a5,2
    80002e78:	e2dff06f          	j	80002ca4 <__printf+0x3fc>
    80002e7c:	00001c97          	auipc	s9,0x1
    80002e80:	42cc8c93          	addi	s9,s9,1068 # 800042a8 <_ZZ12printIntegermE6digits+0x288>
    80002e84:	02800513          	li	a0,40
    80002e88:	ef1ff06f          	j	80002d78 <__printf+0x4d0>
    80002e8c:	00700793          	li	a5,7
    80002e90:	00600c93          	li	s9,6
    80002e94:	e0dff06f          	j	80002ca0 <__printf+0x3f8>
    80002e98:	00700793          	li	a5,7
    80002e9c:	00600c93          	li	s9,6
    80002ea0:	c69ff06f          	j	80002b08 <__printf+0x260>
    80002ea4:	00300793          	li	a5,3
    80002ea8:	00200c93          	li	s9,2
    80002eac:	c5dff06f          	j	80002b08 <__printf+0x260>
    80002eb0:	00300793          	li	a5,3
    80002eb4:	00200c93          	li	s9,2
    80002eb8:	de9ff06f          	j	80002ca0 <__printf+0x3f8>
    80002ebc:	00400793          	li	a5,4
    80002ec0:	00300c93          	li	s9,3
    80002ec4:	dddff06f          	j	80002ca0 <__printf+0x3f8>
    80002ec8:	00400793          	li	a5,4
    80002ecc:	00300c93          	li	s9,3
    80002ed0:	c39ff06f          	j	80002b08 <__printf+0x260>
    80002ed4:	00500793          	li	a5,5
    80002ed8:	00400c93          	li	s9,4
    80002edc:	c2dff06f          	j	80002b08 <__printf+0x260>
    80002ee0:	00500793          	li	a5,5
    80002ee4:	00400c93          	li	s9,4
    80002ee8:	db9ff06f          	j	80002ca0 <__printf+0x3f8>
    80002eec:	00600793          	li	a5,6
    80002ef0:	00500c93          	li	s9,5
    80002ef4:	dadff06f          	j	80002ca0 <__printf+0x3f8>
    80002ef8:	00600793          	li	a5,6
    80002efc:	00500c93          	li	s9,5
    80002f00:	c09ff06f          	j	80002b08 <__printf+0x260>
    80002f04:	00800793          	li	a5,8
    80002f08:	00700c93          	li	s9,7
    80002f0c:	bfdff06f          	j	80002b08 <__printf+0x260>
    80002f10:	00100793          	li	a5,1
    80002f14:	d91ff06f          	j	80002ca4 <__printf+0x3fc>
    80002f18:	00100793          	li	a5,1
    80002f1c:	bf1ff06f          	j	80002b0c <__printf+0x264>
    80002f20:	00900793          	li	a5,9
    80002f24:	00800c93          	li	s9,8
    80002f28:	be1ff06f          	j	80002b08 <__printf+0x260>
    80002f2c:	00001517          	auipc	a0,0x1
    80002f30:	38450513          	addi	a0,a0,900 # 800042b0 <_ZZ12printIntegermE6digits+0x290>
    80002f34:	00000097          	auipc	ra,0x0
    80002f38:	918080e7          	jalr	-1768(ra) # 8000284c <panic>

0000000080002f3c <printfinit>:
    80002f3c:	fe010113          	addi	sp,sp,-32
    80002f40:	00813823          	sd	s0,16(sp)
    80002f44:	00913423          	sd	s1,8(sp)
    80002f48:	00113c23          	sd	ra,24(sp)
    80002f4c:	02010413          	addi	s0,sp,32
    80002f50:	00003497          	auipc	s1,0x3
    80002f54:	b4048493          	addi	s1,s1,-1216 # 80005a90 <pr>
    80002f58:	00048513          	mv	a0,s1
    80002f5c:	00001597          	auipc	a1,0x1
    80002f60:	36458593          	addi	a1,a1,868 # 800042c0 <_ZZ12printIntegermE6digits+0x2a0>
    80002f64:	00000097          	auipc	ra,0x0
    80002f68:	5f4080e7          	jalr	1524(ra) # 80003558 <initlock>
    80002f6c:	01813083          	ld	ra,24(sp)
    80002f70:	01013403          	ld	s0,16(sp)
    80002f74:	0004ac23          	sw	zero,24(s1)
    80002f78:	00813483          	ld	s1,8(sp)
    80002f7c:	02010113          	addi	sp,sp,32
    80002f80:	00008067          	ret

0000000080002f84 <uartinit>:
    80002f84:	ff010113          	addi	sp,sp,-16
    80002f88:	00813423          	sd	s0,8(sp)
    80002f8c:	01010413          	addi	s0,sp,16
    80002f90:	100007b7          	lui	a5,0x10000
    80002f94:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80002f98:	f8000713          	li	a4,-128
    80002f9c:	00e781a3          	sb	a4,3(a5)
    80002fa0:	00300713          	li	a4,3
    80002fa4:	00e78023          	sb	a4,0(a5)
    80002fa8:	000780a3          	sb	zero,1(a5)
    80002fac:	00e781a3          	sb	a4,3(a5)
    80002fb0:	00700693          	li	a3,7
    80002fb4:	00d78123          	sb	a3,2(a5)
    80002fb8:	00e780a3          	sb	a4,1(a5)
    80002fbc:	00813403          	ld	s0,8(sp)
    80002fc0:	01010113          	addi	sp,sp,16
    80002fc4:	00008067          	ret

0000000080002fc8 <uartputc>:
    80002fc8:	00002797          	auipc	a5,0x2
    80002fcc:	8407a783          	lw	a5,-1984(a5) # 80004808 <panicked>
    80002fd0:	00078463          	beqz	a5,80002fd8 <uartputc+0x10>
    80002fd4:	0000006f          	j	80002fd4 <uartputc+0xc>
    80002fd8:	fd010113          	addi	sp,sp,-48
    80002fdc:	02813023          	sd	s0,32(sp)
    80002fe0:	00913c23          	sd	s1,24(sp)
    80002fe4:	01213823          	sd	s2,16(sp)
    80002fe8:	01313423          	sd	s3,8(sp)
    80002fec:	02113423          	sd	ra,40(sp)
    80002ff0:	03010413          	addi	s0,sp,48
    80002ff4:	00002917          	auipc	s2,0x2
    80002ff8:	81c90913          	addi	s2,s2,-2020 # 80004810 <uart_tx_r>
    80002ffc:	00093783          	ld	a5,0(s2)
    80003000:	00002497          	auipc	s1,0x2
    80003004:	81848493          	addi	s1,s1,-2024 # 80004818 <uart_tx_w>
    80003008:	0004b703          	ld	a4,0(s1)
    8000300c:	02078693          	addi	a3,a5,32
    80003010:	00050993          	mv	s3,a0
    80003014:	02e69c63          	bne	a3,a4,8000304c <uartputc+0x84>
    80003018:	00001097          	auipc	ra,0x1
    8000301c:	834080e7          	jalr	-1996(ra) # 8000384c <push_on>
    80003020:	00093783          	ld	a5,0(s2)
    80003024:	0004b703          	ld	a4,0(s1)
    80003028:	02078793          	addi	a5,a5,32
    8000302c:	00e79463          	bne	a5,a4,80003034 <uartputc+0x6c>
    80003030:	0000006f          	j	80003030 <uartputc+0x68>
    80003034:	00001097          	auipc	ra,0x1
    80003038:	88c080e7          	jalr	-1908(ra) # 800038c0 <pop_on>
    8000303c:	00093783          	ld	a5,0(s2)
    80003040:	0004b703          	ld	a4,0(s1)
    80003044:	02078693          	addi	a3,a5,32
    80003048:	fce688e3          	beq	a3,a4,80003018 <uartputc+0x50>
    8000304c:	01f77693          	andi	a3,a4,31
    80003050:	00003597          	auipc	a1,0x3
    80003054:	a6058593          	addi	a1,a1,-1440 # 80005ab0 <uart_tx_buf>
    80003058:	00d586b3          	add	a3,a1,a3
    8000305c:	00170713          	addi	a4,a4,1
    80003060:	01368023          	sb	s3,0(a3)
    80003064:	00e4b023          	sd	a4,0(s1)
    80003068:	10000637          	lui	a2,0x10000
    8000306c:	02f71063          	bne	a4,a5,8000308c <uartputc+0xc4>
    80003070:	0340006f          	j	800030a4 <uartputc+0xdc>
    80003074:	00074703          	lbu	a4,0(a4)
    80003078:	00f93023          	sd	a5,0(s2)
    8000307c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80003080:	00093783          	ld	a5,0(s2)
    80003084:	0004b703          	ld	a4,0(s1)
    80003088:	00f70e63          	beq	a4,a5,800030a4 <uartputc+0xdc>
    8000308c:	00564683          	lbu	a3,5(a2)
    80003090:	01f7f713          	andi	a4,a5,31
    80003094:	00e58733          	add	a4,a1,a4
    80003098:	0206f693          	andi	a3,a3,32
    8000309c:	00178793          	addi	a5,a5,1
    800030a0:	fc069ae3          	bnez	a3,80003074 <uartputc+0xac>
    800030a4:	02813083          	ld	ra,40(sp)
    800030a8:	02013403          	ld	s0,32(sp)
    800030ac:	01813483          	ld	s1,24(sp)
    800030b0:	01013903          	ld	s2,16(sp)
    800030b4:	00813983          	ld	s3,8(sp)
    800030b8:	03010113          	addi	sp,sp,48
    800030bc:	00008067          	ret

00000000800030c0 <uartputc_sync>:
    800030c0:	ff010113          	addi	sp,sp,-16
    800030c4:	00813423          	sd	s0,8(sp)
    800030c8:	01010413          	addi	s0,sp,16
    800030cc:	00001717          	auipc	a4,0x1
    800030d0:	73c72703          	lw	a4,1852(a4) # 80004808 <panicked>
    800030d4:	02071663          	bnez	a4,80003100 <uartputc_sync+0x40>
    800030d8:	00050793          	mv	a5,a0
    800030dc:	100006b7          	lui	a3,0x10000
    800030e0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    800030e4:	02077713          	andi	a4,a4,32
    800030e8:	fe070ce3          	beqz	a4,800030e0 <uartputc_sync+0x20>
    800030ec:	0ff7f793          	andi	a5,a5,255
    800030f0:	00f68023          	sb	a5,0(a3)
    800030f4:	00813403          	ld	s0,8(sp)
    800030f8:	01010113          	addi	sp,sp,16
    800030fc:	00008067          	ret
    80003100:	0000006f          	j	80003100 <uartputc_sync+0x40>

0000000080003104 <uartstart>:
    80003104:	ff010113          	addi	sp,sp,-16
    80003108:	00813423          	sd	s0,8(sp)
    8000310c:	01010413          	addi	s0,sp,16
    80003110:	00001617          	auipc	a2,0x1
    80003114:	70060613          	addi	a2,a2,1792 # 80004810 <uart_tx_r>
    80003118:	00001517          	auipc	a0,0x1
    8000311c:	70050513          	addi	a0,a0,1792 # 80004818 <uart_tx_w>
    80003120:	00063783          	ld	a5,0(a2)
    80003124:	00053703          	ld	a4,0(a0)
    80003128:	04f70263          	beq	a4,a5,8000316c <uartstart+0x68>
    8000312c:	100005b7          	lui	a1,0x10000
    80003130:	00003817          	auipc	a6,0x3
    80003134:	98080813          	addi	a6,a6,-1664 # 80005ab0 <uart_tx_buf>
    80003138:	01c0006f          	j	80003154 <uartstart+0x50>
    8000313c:	0006c703          	lbu	a4,0(a3)
    80003140:	00f63023          	sd	a5,0(a2)
    80003144:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80003148:	00063783          	ld	a5,0(a2)
    8000314c:	00053703          	ld	a4,0(a0)
    80003150:	00f70e63          	beq	a4,a5,8000316c <uartstart+0x68>
    80003154:	01f7f713          	andi	a4,a5,31
    80003158:	00e806b3          	add	a3,a6,a4
    8000315c:	0055c703          	lbu	a4,5(a1)
    80003160:	00178793          	addi	a5,a5,1
    80003164:	02077713          	andi	a4,a4,32
    80003168:	fc071ae3          	bnez	a4,8000313c <uartstart+0x38>
    8000316c:	00813403          	ld	s0,8(sp)
    80003170:	01010113          	addi	sp,sp,16
    80003174:	00008067          	ret

0000000080003178 <uartgetc>:
    80003178:	ff010113          	addi	sp,sp,-16
    8000317c:	00813423          	sd	s0,8(sp)
    80003180:	01010413          	addi	s0,sp,16
    80003184:	10000737          	lui	a4,0x10000
    80003188:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000318c:	0017f793          	andi	a5,a5,1
    80003190:	00078c63          	beqz	a5,800031a8 <uartgetc+0x30>
    80003194:	00074503          	lbu	a0,0(a4)
    80003198:	0ff57513          	andi	a0,a0,255
    8000319c:	00813403          	ld	s0,8(sp)
    800031a0:	01010113          	addi	sp,sp,16
    800031a4:	00008067          	ret
    800031a8:	fff00513          	li	a0,-1
    800031ac:	ff1ff06f          	j	8000319c <uartgetc+0x24>

00000000800031b0 <uartintr>:
    800031b0:	100007b7          	lui	a5,0x10000
    800031b4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    800031b8:	0017f793          	andi	a5,a5,1
    800031bc:	0a078463          	beqz	a5,80003264 <uartintr+0xb4>
    800031c0:	fe010113          	addi	sp,sp,-32
    800031c4:	00813823          	sd	s0,16(sp)
    800031c8:	00913423          	sd	s1,8(sp)
    800031cc:	00113c23          	sd	ra,24(sp)
    800031d0:	02010413          	addi	s0,sp,32
    800031d4:	100004b7          	lui	s1,0x10000
    800031d8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    800031dc:	0ff57513          	andi	a0,a0,255
    800031e0:	fffff097          	auipc	ra,0xfffff
    800031e4:	534080e7          	jalr	1332(ra) # 80002714 <consoleintr>
    800031e8:	0054c783          	lbu	a5,5(s1)
    800031ec:	0017f793          	andi	a5,a5,1
    800031f0:	fe0794e3          	bnez	a5,800031d8 <uartintr+0x28>
    800031f4:	00001617          	auipc	a2,0x1
    800031f8:	61c60613          	addi	a2,a2,1564 # 80004810 <uart_tx_r>
    800031fc:	00001517          	auipc	a0,0x1
    80003200:	61c50513          	addi	a0,a0,1564 # 80004818 <uart_tx_w>
    80003204:	00063783          	ld	a5,0(a2)
    80003208:	00053703          	ld	a4,0(a0)
    8000320c:	04f70263          	beq	a4,a5,80003250 <uartintr+0xa0>
    80003210:	100005b7          	lui	a1,0x10000
    80003214:	00003817          	auipc	a6,0x3
    80003218:	89c80813          	addi	a6,a6,-1892 # 80005ab0 <uart_tx_buf>
    8000321c:	01c0006f          	j	80003238 <uartintr+0x88>
    80003220:	0006c703          	lbu	a4,0(a3)
    80003224:	00f63023          	sd	a5,0(a2)
    80003228:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000322c:	00063783          	ld	a5,0(a2)
    80003230:	00053703          	ld	a4,0(a0)
    80003234:	00f70e63          	beq	a4,a5,80003250 <uartintr+0xa0>
    80003238:	01f7f713          	andi	a4,a5,31
    8000323c:	00e806b3          	add	a3,a6,a4
    80003240:	0055c703          	lbu	a4,5(a1)
    80003244:	00178793          	addi	a5,a5,1
    80003248:	02077713          	andi	a4,a4,32
    8000324c:	fc071ae3          	bnez	a4,80003220 <uartintr+0x70>
    80003250:	01813083          	ld	ra,24(sp)
    80003254:	01013403          	ld	s0,16(sp)
    80003258:	00813483          	ld	s1,8(sp)
    8000325c:	02010113          	addi	sp,sp,32
    80003260:	00008067          	ret
    80003264:	00001617          	auipc	a2,0x1
    80003268:	5ac60613          	addi	a2,a2,1452 # 80004810 <uart_tx_r>
    8000326c:	00001517          	auipc	a0,0x1
    80003270:	5ac50513          	addi	a0,a0,1452 # 80004818 <uart_tx_w>
    80003274:	00063783          	ld	a5,0(a2)
    80003278:	00053703          	ld	a4,0(a0)
    8000327c:	04f70263          	beq	a4,a5,800032c0 <uartintr+0x110>
    80003280:	100005b7          	lui	a1,0x10000
    80003284:	00003817          	auipc	a6,0x3
    80003288:	82c80813          	addi	a6,a6,-2004 # 80005ab0 <uart_tx_buf>
    8000328c:	01c0006f          	j	800032a8 <uartintr+0xf8>
    80003290:	0006c703          	lbu	a4,0(a3)
    80003294:	00f63023          	sd	a5,0(a2)
    80003298:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000329c:	00063783          	ld	a5,0(a2)
    800032a0:	00053703          	ld	a4,0(a0)
    800032a4:	02f70063          	beq	a4,a5,800032c4 <uartintr+0x114>
    800032a8:	01f7f713          	andi	a4,a5,31
    800032ac:	00e806b3          	add	a3,a6,a4
    800032b0:	0055c703          	lbu	a4,5(a1)
    800032b4:	00178793          	addi	a5,a5,1
    800032b8:	02077713          	andi	a4,a4,32
    800032bc:	fc071ae3          	bnez	a4,80003290 <uartintr+0xe0>
    800032c0:	00008067          	ret
    800032c4:	00008067          	ret

00000000800032c8 <kinit>:
    800032c8:	fc010113          	addi	sp,sp,-64
    800032cc:	02913423          	sd	s1,40(sp)
    800032d0:	fffff7b7          	lui	a5,0xfffff
    800032d4:	00003497          	auipc	s1,0x3
    800032d8:	7fb48493          	addi	s1,s1,2043 # 80006acf <end+0xfff>
    800032dc:	02813823          	sd	s0,48(sp)
    800032e0:	01313c23          	sd	s3,24(sp)
    800032e4:	00f4f4b3          	and	s1,s1,a5
    800032e8:	02113c23          	sd	ra,56(sp)
    800032ec:	03213023          	sd	s2,32(sp)
    800032f0:	01413823          	sd	s4,16(sp)
    800032f4:	01513423          	sd	s5,8(sp)
    800032f8:	04010413          	addi	s0,sp,64
    800032fc:	000017b7          	lui	a5,0x1
    80003300:	01100993          	li	s3,17
    80003304:	00f487b3          	add	a5,s1,a5
    80003308:	01b99993          	slli	s3,s3,0x1b
    8000330c:	06f9e063          	bltu	s3,a5,8000336c <kinit+0xa4>
    80003310:	00002a97          	auipc	s5,0x2
    80003314:	7c0a8a93          	addi	s5,s5,1984 # 80005ad0 <end>
    80003318:	0754ec63          	bltu	s1,s5,80003390 <kinit+0xc8>
    8000331c:	0734fa63          	bgeu	s1,s3,80003390 <kinit+0xc8>
    80003320:	00088a37          	lui	s4,0x88
    80003324:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80003328:	00001917          	auipc	s2,0x1
    8000332c:	4f890913          	addi	s2,s2,1272 # 80004820 <kmem>
    80003330:	00ca1a13          	slli	s4,s4,0xc
    80003334:	0140006f          	j	80003348 <kinit+0x80>
    80003338:	000017b7          	lui	a5,0x1
    8000333c:	00f484b3          	add	s1,s1,a5
    80003340:	0554e863          	bltu	s1,s5,80003390 <kinit+0xc8>
    80003344:	0534f663          	bgeu	s1,s3,80003390 <kinit+0xc8>
    80003348:	00001637          	lui	a2,0x1
    8000334c:	00100593          	li	a1,1
    80003350:	00048513          	mv	a0,s1
    80003354:	00000097          	auipc	ra,0x0
    80003358:	5e4080e7          	jalr	1508(ra) # 80003938 <__memset>
    8000335c:	00093783          	ld	a5,0(s2)
    80003360:	00f4b023          	sd	a5,0(s1)
    80003364:	00993023          	sd	s1,0(s2)
    80003368:	fd4498e3          	bne	s1,s4,80003338 <kinit+0x70>
    8000336c:	03813083          	ld	ra,56(sp)
    80003370:	03013403          	ld	s0,48(sp)
    80003374:	02813483          	ld	s1,40(sp)
    80003378:	02013903          	ld	s2,32(sp)
    8000337c:	01813983          	ld	s3,24(sp)
    80003380:	01013a03          	ld	s4,16(sp)
    80003384:	00813a83          	ld	s5,8(sp)
    80003388:	04010113          	addi	sp,sp,64
    8000338c:	00008067          	ret
    80003390:	00001517          	auipc	a0,0x1
    80003394:	f5050513          	addi	a0,a0,-176 # 800042e0 <digits+0x18>
    80003398:	fffff097          	auipc	ra,0xfffff
    8000339c:	4b4080e7          	jalr	1204(ra) # 8000284c <panic>

00000000800033a0 <freerange>:
    800033a0:	fc010113          	addi	sp,sp,-64
    800033a4:	000017b7          	lui	a5,0x1
    800033a8:	02913423          	sd	s1,40(sp)
    800033ac:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    800033b0:	009504b3          	add	s1,a0,s1
    800033b4:	fffff537          	lui	a0,0xfffff
    800033b8:	02813823          	sd	s0,48(sp)
    800033bc:	02113c23          	sd	ra,56(sp)
    800033c0:	03213023          	sd	s2,32(sp)
    800033c4:	01313c23          	sd	s3,24(sp)
    800033c8:	01413823          	sd	s4,16(sp)
    800033cc:	01513423          	sd	s5,8(sp)
    800033d0:	01613023          	sd	s6,0(sp)
    800033d4:	04010413          	addi	s0,sp,64
    800033d8:	00a4f4b3          	and	s1,s1,a0
    800033dc:	00f487b3          	add	a5,s1,a5
    800033e0:	06f5e463          	bltu	a1,a5,80003448 <freerange+0xa8>
    800033e4:	00002a97          	auipc	s5,0x2
    800033e8:	6eca8a93          	addi	s5,s5,1772 # 80005ad0 <end>
    800033ec:	0954e263          	bltu	s1,s5,80003470 <freerange+0xd0>
    800033f0:	01100993          	li	s3,17
    800033f4:	01b99993          	slli	s3,s3,0x1b
    800033f8:	0734fc63          	bgeu	s1,s3,80003470 <freerange+0xd0>
    800033fc:	00058a13          	mv	s4,a1
    80003400:	00001917          	auipc	s2,0x1
    80003404:	42090913          	addi	s2,s2,1056 # 80004820 <kmem>
    80003408:	00002b37          	lui	s6,0x2
    8000340c:	0140006f          	j	80003420 <freerange+0x80>
    80003410:	000017b7          	lui	a5,0x1
    80003414:	00f484b3          	add	s1,s1,a5
    80003418:	0554ec63          	bltu	s1,s5,80003470 <freerange+0xd0>
    8000341c:	0534fa63          	bgeu	s1,s3,80003470 <freerange+0xd0>
    80003420:	00001637          	lui	a2,0x1
    80003424:	00100593          	li	a1,1
    80003428:	00048513          	mv	a0,s1
    8000342c:	00000097          	auipc	ra,0x0
    80003430:	50c080e7          	jalr	1292(ra) # 80003938 <__memset>
    80003434:	00093703          	ld	a4,0(s2)
    80003438:	016487b3          	add	a5,s1,s6
    8000343c:	00e4b023          	sd	a4,0(s1)
    80003440:	00993023          	sd	s1,0(s2)
    80003444:	fcfa76e3          	bgeu	s4,a5,80003410 <freerange+0x70>
    80003448:	03813083          	ld	ra,56(sp)
    8000344c:	03013403          	ld	s0,48(sp)
    80003450:	02813483          	ld	s1,40(sp)
    80003454:	02013903          	ld	s2,32(sp)
    80003458:	01813983          	ld	s3,24(sp)
    8000345c:	01013a03          	ld	s4,16(sp)
    80003460:	00813a83          	ld	s5,8(sp)
    80003464:	00013b03          	ld	s6,0(sp)
    80003468:	04010113          	addi	sp,sp,64
    8000346c:	00008067          	ret
    80003470:	00001517          	auipc	a0,0x1
    80003474:	e7050513          	addi	a0,a0,-400 # 800042e0 <digits+0x18>
    80003478:	fffff097          	auipc	ra,0xfffff
    8000347c:	3d4080e7          	jalr	980(ra) # 8000284c <panic>

0000000080003480 <kfree>:
    80003480:	fe010113          	addi	sp,sp,-32
    80003484:	00813823          	sd	s0,16(sp)
    80003488:	00113c23          	sd	ra,24(sp)
    8000348c:	00913423          	sd	s1,8(sp)
    80003490:	02010413          	addi	s0,sp,32
    80003494:	03451793          	slli	a5,a0,0x34
    80003498:	04079c63          	bnez	a5,800034f0 <kfree+0x70>
    8000349c:	00002797          	auipc	a5,0x2
    800034a0:	63478793          	addi	a5,a5,1588 # 80005ad0 <end>
    800034a4:	00050493          	mv	s1,a0
    800034a8:	04f56463          	bltu	a0,a5,800034f0 <kfree+0x70>
    800034ac:	01100793          	li	a5,17
    800034b0:	01b79793          	slli	a5,a5,0x1b
    800034b4:	02f57e63          	bgeu	a0,a5,800034f0 <kfree+0x70>
    800034b8:	00001637          	lui	a2,0x1
    800034bc:	00100593          	li	a1,1
    800034c0:	00000097          	auipc	ra,0x0
    800034c4:	478080e7          	jalr	1144(ra) # 80003938 <__memset>
    800034c8:	00001797          	auipc	a5,0x1
    800034cc:	35878793          	addi	a5,a5,856 # 80004820 <kmem>
    800034d0:	0007b703          	ld	a4,0(a5)
    800034d4:	01813083          	ld	ra,24(sp)
    800034d8:	01013403          	ld	s0,16(sp)
    800034dc:	00e4b023          	sd	a4,0(s1)
    800034e0:	0097b023          	sd	s1,0(a5)
    800034e4:	00813483          	ld	s1,8(sp)
    800034e8:	02010113          	addi	sp,sp,32
    800034ec:	00008067          	ret
    800034f0:	00001517          	auipc	a0,0x1
    800034f4:	df050513          	addi	a0,a0,-528 # 800042e0 <digits+0x18>
    800034f8:	fffff097          	auipc	ra,0xfffff
    800034fc:	354080e7          	jalr	852(ra) # 8000284c <panic>

0000000080003500 <kalloc>:
    80003500:	fe010113          	addi	sp,sp,-32
    80003504:	00813823          	sd	s0,16(sp)
    80003508:	00913423          	sd	s1,8(sp)
    8000350c:	00113c23          	sd	ra,24(sp)
    80003510:	02010413          	addi	s0,sp,32
    80003514:	00001797          	auipc	a5,0x1
    80003518:	30c78793          	addi	a5,a5,780 # 80004820 <kmem>
    8000351c:	0007b483          	ld	s1,0(a5)
    80003520:	02048063          	beqz	s1,80003540 <kalloc+0x40>
    80003524:	0004b703          	ld	a4,0(s1)
    80003528:	00001637          	lui	a2,0x1
    8000352c:	00500593          	li	a1,5
    80003530:	00048513          	mv	a0,s1
    80003534:	00e7b023          	sd	a4,0(a5)
    80003538:	00000097          	auipc	ra,0x0
    8000353c:	400080e7          	jalr	1024(ra) # 80003938 <__memset>
    80003540:	01813083          	ld	ra,24(sp)
    80003544:	01013403          	ld	s0,16(sp)
    80003548:	00048513          	mv	a0,s1
    8000354c:	00813483          	ld	s1,8(sp)
    80003550:	02010113          	addi	sp,sp,32
    80003554:	00008067          	ret

0000000080003558 <initlock>:
    80003558:	ff010113          	addi	sp,sp,-16
    8000355c:	00813423          	sd	s0,8(sp)
    80003560:	01010413          	addi	s0,sp,16
    80003564:	00813403          	ld	s0,8(sp)
    80003568:	00b53423          	sd	a1,8(a0)
    8000356c:	00052023          	sw	zero,0(a0)
    80003570:	00053823          	sd	zero,16(a0)
    80003574:	01010113          	addi	sp,sp,16
    80003578:	00008067          	ret

000000008000357c <acquire>:
    8000357c:	fe010113          	addi	sp,sp,-32
    80003580:	00813823          	sd	s0,16(sp)
    80003584:	00913423          	sd	s1,8(sp)
    80003588:	00113c23          	sd	ra,24(sp)
    8000358c:	01213023          	sd	s2,0(sp)
    80003590:	02010413          	addi	s0,sp,32
    80003594:	00050493          	mv	s1,a0
    80003598:	10002973          	csrr	s2,sstatus
    8000359c:	100027f3          	csrr	a5,sstatus
    800035a0:	ffd7f793          	andi	a5,a5,-3
    800035a4:	10079073          	csrw	sstatus,a5
    800035a8:	fffff097          	auipc	ra,0xfffff
    800035ac:	8e0080e7          	jalr	-1824(ra) # 80001e88 <mycpu>
    800035b0:	07852783          	lw	a5,120(a0)
    800035b4:	06078e63          	beqz	a5,80003630 <acquire+0xb4>
    800035b8:	fffff097          	auipc	ra,0xfffff
    800035bc:	8d0080e7          	jalr	-1840(ra) # 80001e88 <mycpu>
    800035c0:	07852783          	lw	a5,120(a0)
    800035c4:	0004a703          	lw	a4,0(s1)
    800035c8:	0017879b          	addiw	a5,a5,1
    800035cc:	06f52c23          	sw	a5,120(a0)
    800035d0:	04071063          	bnez	a4,80003610 <acquire+0x94>
    800035d4:	00100713          	li	a4,1
    800035d8:	00070793          	mv	a5,a4
    800035dc:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    800035e0:	0007879b          	sext.w	a5,a5
    800035e4:	fe079ae3          	bnez	a5,800035d8 <acquire+0x5c>
    800035e8:	0ff0000f          	fence
    800035ec:	fffff097          	auipc	ra,0xfffff
    800035f0:	89c080e7          	jalr	-1892(ra) # 80001e88 <mycpu>
    800035f4:	01813083          	ld	ra,24(sp)
    800035f8:	01013403          	ld	s0,16(sp)
    800035fc:	00a4b823          	sd	a0,16(s1)
    80003600:	00013903          	ld	s2,0(sp)
    80003604:	00813483          	ld	s1,8(sp)
    80003608:	02010113          	addi	sp,sp,32
    8000360c:	00008067          	ret
    80003610:	0104b903          	ld	s2,16(s1)
    80003614:	fffff097          	auipc	ra,0xfffff
    80003618:	874080e7          	jalr	-1932(ra) # 80001e88 <mycpu>
    8000361c:	faa91ce3          	bne	s2,a0,800035d4 <acquire+0x58>
    80003620:	00001517          	auipc	a0,0x1
    80003624:	cc850513          	addi	a0,a0,-824 # 800042e8 <digits+0x20>
    80003628:	fffff097          	auipc	ra,0xfffff
    8000362c:	224080e7          	jalr	548(ra) # 8000284c <panic>
    80003630:	00195913          	srli	s2,s2,0x1
    80003634:	fffff097          	auipc	ra,0xfffff
    80003638:	854080e7          	jalr	-1964(ra) # 80001e88 <mycpu>
    8000363c:	00197913          	andi	s2,s2,1
    80003640:	07252e23          	sw	s2,124(a0)
    80003644:	f75ff06f          	j	800035b8 <acquire+0x3c>

0000000080003648 <release>:
    80003648:	fe010113          	addi	sp,sp,-32
    8000364c:	00813823          	sd	s0,16(sp)
    80003650:	00113c23          	sd	ra,24(sp)
    80003654:	00913423          	sd	s1,8(sp)
    80003658:	01213023          	sd	s2,0(sp)
    8000365c:	02010413          	addi	s0,sp,32
    80003660:	00052783          	lw	a5,0(a0)
    80003664:	00079a63          	bnez	a5,80003678 <release+0x30>
    80003668:	00001517          	auipc	a0,0x1
    8000366c:	c8850513          	addi	a0,a0,-888 # 800042f0 <digits+0x28>
    80003670:	fffff097          	auipc	ra,0xfffff
    80003674:	1dc080e7          	jalr	476(ra) # 8000284c <panic>
    80003678:	01053903          	ld	s2,16(a0)
    8000367c:	00050493          	mv	s1,a0
    80003680:	fffff097          	auipc	ra,0xfffff
    80003684:	808080e7          	jalr	-2040(ra) # 80001e88 <mycpu>
    80003688:	fea910e3          	bne	s2,a0,80003668 <release+0x20>
    8000368c:	0004b823          	sd	zero,16(s1)
    80003690:	0ff0000f          	fence
    80003694:	0f50000f          	fence	iorw,ow
    80003698:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000369c:	ffffe097          	auipc	ra,0xffffe
    800036a0:	7ec080e7          	jalr	2028(ra) # 80001e88 <mycpu>
    800036a4:	100027f3          	csrr	a5,sstatus
    800036a8:	0027f793          	andi	a5,a5,2
    800036ac:	04079a63          	bnez	a5,80003700 <release+0xb8>
    800036b0:	07852783          	lw	a5,120(a0)
    800036b4:	02f05e63          	blez	a5,800036f0 <release+0xa8>
    800036b8:	fff7871b          	addiw	a4,a5,-1
    800036bc:	06e52c23          	sw	a4,120(a0)
    800036c0:	00071c63          	bnez	a4,800036d8 <release+0x90>
    800036c4:	07c52783          	lw	a5,124(a0)
    800036c8:	00078863          	beqz	a5,800036d8 <release+0x90>
    800036cc:	100027f3          	csrr	a5,sstatus
    800036d0:	0027e793          	ori	a5,a5,2
    800036d4:	10079073          	csrw	sstatus,a5
    800036d8:	01813083          	ld	ra,24(sp)
    800036dc:	01013403          	ld	s0,16(sp)
    800036e0:	00813483          	ld	s1,8(sp)
    800036e4:	00013903          	ld	s2,0(sp)
    800036e8:	02010113          	addi	sp,sp,32
    800036ec:	00008067          	ret
    800036f0:	00001517          	auipc	a0,0x1
    800036f4:	c2050513          	addi	a0,a0,-992 # 80004310 <digits+0x48>
    800036f8:	fffff097          	auipc	ra,0xfffff
    800036fc:	154080e7          	jalr	340(ra) # 8000284c <panic>
    80003700:	00001517          	auipc	a0,0x1
    80003704:	bf850513          	addi	a0,a0,-1032 # 800042f8 <digits+0x30>
    80003708:	fffff097          	auipc	ra,0xfffff
    8000370c:	144080e7          	jalr	324(ra) # 8000284c <panic>

0000000080003710 <holding>:
    80003710:	00052783          	lw	a5,0(a0)
    80003714:	00079663          	bnez	a5,80003720 <holding+0x10>
    80003718:	00000513          	li	a0,0
    8000371c:	00008067          	ret
    80003720:	fe010113          	addi	sp,sp,-32
    80003724:	00813823          	sd	s0,16(sp)
    80003728:	00913423          	sd	s1,8(sp)
    8000372c:	00113c23          	sd	ra,24(sp)
    80003730:	02010413          	addi	s0,sp,32
    80003734:	01053483          	ld	s1,16(a0)
    80003738:	ffffe097          	auipc	ra,0xffffe
    8000373c:	750080e7          	jalr	1872(ra) # 80001e88 <mycpu>
    80003740:	01813083          	ld	ra,24(sp)
    80003744:	01013403          	ld	s0,16(sp)
    80003748:	40a48533          	sub	a0,s1,a0
    8000374c:	00153513          	seqz	a0,a0
    80003750:	00813483          	ld	s1,8(sp)
    80003754:	02010113          	addi	sp,sp,32
    80003758:	00008067          	ret

000000008000375c <push_off>:
    8000375c:	fe010113          	addi	sp,sp,-32
    80003760:	00813823          	sd	s0,16(sp)
    80003764:	00113c23          	sd	ra,24(sp)
    80003768:	00913423          	sd	s1,8(sp)
    8000376c:	02010413          	addi	s0,sp,32
    80003770:	100024f3          	csrr	s1,sstatus
    80003774:	100027f3          	csrr	a5,sstatus
    80003778:	ffd7f793          	andi	a5,a5,-3
    8000377c:	10079073          	csrw	sstatus,a5
    80003780:	ffffe097          	auipc	ra,0xffffe
    80003784:	708080e7          	jalr	1800(ra) # 80001e88 <mycpu>
    80003788:	07852783          	lw	a5,120(a0)
    8000378c:	02078663          	beqz	a5,800037b8 <push_off+0x5c>
    80003790:	ffffe097          	auipc	ra,0xffffe
    80003794:	6f8080e7          	jalr	1784(ra) # 80001e88 <mycpu>
    80003798:	07852783          	lw	a5,120(a0)
    8000379c:	01813083          	ld	ra,24(sp)
    800037a0:	01013403          	ld	s0,16(sp)
    800037a4:	0017879b          	addiw	a5,a5,1
    800037a8:	06f52c23          	sw	a5,120(a0)
    800037ac:	00813483          	ld	s1,8(sp)
    800037b0:	02010113          	addi	sp,sp,32
    800037b4:	00008067          	ret
    800037b8:	0014d493          	srli	s1,s1,0x1
    800037bc:	ffffe097          	auipc	ra,0xffffe
    800037c0:	6cc080e7          	jalr	1740(ra) # 80001e88 <mycpu>
    800037c4:	0014f493          	andi	s1,s1,1
    800037c8:	06952e23          	sw	s1,124(a0)
    800037cc:	fc5ff06f          	j	80003790 <push_off+0x34>

00000000800037d0 <pop_off>:
    800037d0:	ff010113          	addi	sp,sp,-16
    800037d4:	00813023          	sd	s0,0(sp)
    800037d8:	00113423          	sd	ra,8(sp)
    800037dc:	01010413          	addi	s0,sp,16
    800037e0:	ffffe097          	auipc	ra,0xffffe
    800037e4:	6a8080e7          	jalr	1704(ra) # 80001e88 <mycpu>
    800037e8:	100027f3          	csrr	a5,sstatus
    800037ec:	0027f793          	andi	a5,a5,2
    800037f0:	04079663          	bnez	a5,8000383c <pop_off+0x6c>
    800037f4:	07852783          	lw	a5,120(a0)
    800037f8:	02f05a63          	blez	a5,8000382c <pop_off+0x5c>
    800037fc:	fff7871b          	addiw	a4,a5,-1
    80003800:	06e52c23          	sw	a4,120(a0)
    80003804:	00071c63          	bnez	a4,8000381c <pop_off+0x4c>
    80003808:	07c52783          	lw	a5,124(a0)
    8000380c:	00078863          	beqz	a5,8000381c <pop_off+0x4c>
    80003810:	100027f3          	csrr	a5,sstatus
    80003814:	0027e793          	ori	a5,a5,2
    80003818:	10079073          	csrw	sstatus,a5
    8000381c:	00813083          	ld	ra,8(sp)
    80003820:	00013403          	ld	s0,0(sp)
    80003824:	01010113          	addi	sp,sp,16
    80003828:	00008067          	ret
    8000382c:	00001517          	auipc	a0,0x1
    80003830:	ae450513          	addi	a0,a0,-1308 # 80004310 <digits+0x48>
    80003834:	fffff097          	auipc	ra,0xfffff
    80003838:	018080e7          	jalr	24(ra) # 8000284c <panic>
    8000383c:	00001517          	auipc	a0,0x1
    80003840:	abc50513          	addi	a0,a0,-1348 # 800042f8 <digits+0x30>
    80003844:	fffff097          	auipc	ra,0xfffff
    80003848:	008080e7          	jalr	8(ra) # 8000284c <panic>

000000008000384c <push_on>:
    8000384c:	fe010113          	addi	sp,sp,-32
    80003850:	00813823          	sd	s0,16(sp)
    80003854:	00113c23          	sd	ra,24(sp)
    80003858:	00913423          	sd	s1,8(sp)
    8000385c:	02010413          	addi	s0,sp,32
    80003860:	100024f3          	csrr	s1,sstatus
    80003864:	100027f3          	csrr	a5,sstatus
    80003868:	0027e793          	ori	a5,a5,2
    8000386c:	10079073          	csrw	sstatus,a5
    80003870:	ffffe097          	auipc	ra,0xffffe
    80003874:	618080e7          	jalr	1560(ra) # 80001e88 <mycpu>
    80003878:	07852783          	lw	a5,120(a0)
    8000387c:	02078663          	beqz	a5,800038a8 <push_on+0x5c>
    80003880:	ffffe097          	auipc	ra,0xffffe
    80003884:	608080e7          	jalr	1544(ra) # 80001e88 <mycpu>
    80003888:	07852783          	lw	a5,120(a0)
    8000388c:	01813083          	ld	ra,24(sp)
    80003890:	01013403          	ld	s0,16(sp)
    80003894:	0017879b          	addiw	a5,a5,1
    80003898:	06f52c23          	sw	a5,120(a0)
    8000389c:	00813483          	ld	s1,8(sp)
    800038a0:	02010113          	addi	sp,sp,32
    800038a4:	00008067          	ret
    800038a8:	0014d493          	srli	s1,s1,0x1
    800038ac:	ffffe097          	auipc	ra,0xffffe
    800038b0:	5dc080e7          	jalr	1500(ra) # 80001e88 <mycpu>
    800038b4:	0014f493          	andi	s1,s1,1
    800038b8:	06952e23          	sw	s1,124(a0)
    800038bc:	fc5ff06f          	j	80003880 <push_on+0x34>

00000000800038c0 <pop_on>:
    800038c0:	ff010113          	addi	sp,sp,-16
    800038c4:	00813023          	sd	s0,0(sp)
    800038c8:	00113423          	sd	ra,8(sp)
    800038cc:	01010413          	addi	s0,sp,16
    800038d0:	ffffe097          	auipc	ra,0xffffe
    800038d4:	5b8080e7          	jalr	1464(ra) # 80001e88 <mycpu>
    800038d8:	100027f3          	csrr	a5,sstatus
    800038dc:	0027f793          	andi	a5,a5,2
    800038e0:	04078463          	beqz	a5,80003928 <pop_on+0x68>
    800038e4:	07852783          	lw	a5,120(a0)
    800038e8:	02f05863          	blez	a5,80003918 <pop_on+0x58>
    800038ec:	fff7879b          	addiw	a5,a5,-1
    800038f0:	06f52c23          	sw	a5,120(a0)
    800038f4:	07853783          	ld	a5,120(a0)
    800038f8:	00079863          	bnez	a5,80003908 <pop_on+0x48>
    800038fc:	100027f3          	csrr	a5,sstatus
    80003900:	ffd7f793          	andi	a5,a5,-3
    80003904:	10079073          	csrw	sstatus,a5
    80003908:	00813083          	ld	ra,8(sp)
    8000390c:	00013403          	ld	s0,0(sp)
    80003910:	01010113          	addi	sp,sp,16
    80003914:	00008067          	ret
    80003918:	00001517          	auipc	a0,0x1
    8000391c:	a2050513          	addi	a0,a0,-1504 # 80004338 <digits+0x70>
    80003920:	fffff097          	auipc	ra,0xfffff
    80003924:	f2c080e7          	jalr	-212(ra) # 8000284c <panic>
    80003928:	00001517          	auipc	a0,0x1
    8000392c:	9f050513          	addi	a0,a0,-1552 # 80004318 <digits+0x50>
    80003930:	fffff097          	auipc	ra,0xfffff
    80003934:	f1c080e7          	jalr	-228(ra) # 8000284c <panic>

0000000080003938 <__memset>:
    80003938:	ff010113          	addi	sp,sp,-16
    8000393c:	00813423          	sd	s0,8(sp)
    80003940:	01010413          	addi	s0,sp,16
    80003944:	1a060e63          	beqz	a2,80003b00 <__memset+0x1c8>
    80003948:	40a007b3          	neg	a5,a0
    8000394c:	0077f793          	andi	a5,a5,7
    80003950:	00778693          	addi	a3,a5,7
    80003954:	00b00813          	li	a6,11
    80003958:	0ff5f593          	andi	a1,a1,255
    8000395c:	fff6071b          	addiw	a4,a2,-1
    80003960:	1b06e663          	bltu	a3,a6,80003b0c <__memset+0x1d4>
    80003964:	1cd76463          	bltu	a4,a3,80003b2c <__memset+0x1f4>
    80003968:	1a078e63          	beqz	a5,80003b24 <__memset+0x1ec>
    8000396c:	00b50023          	sb	a1,0(a0)
    80003970:	00100713          	li	a4,1
    80003974:	1ae78463          	beq	a5,a4,80003b1c <__memset+0x1e4>
    80003978:	00b500a3          	sb	a1,1(a0)
    8000397c:	00200713          	li	a4,2
    80003980:	1ae78a63          	beq	a5,a4,80003b34 <__memset+0x1fc>
    80003984:	00b50123          	sb	a1,2(a0)
    80003988:	00300713          	li	a4,3
    8000398c:	18e78463          	beq	a5,a4,80003b14 <__memset+0x1dc>
    80003990:	00b501a3          	sb	a1,3(a0)
    80003994:	00400713          	li	a4,4
    80003998:	1ae78263          	beq	a5,a4,80003b3c <__memset+0x204>
    8000399c:	00b50223          	sb	a1,4(a0)
    800039a0:	00500713          	li	a4,5
    800039a4:	1ae78063          	beq	a5,a4,80003b44 <__memset+0x20c>
    800039a8:	00b502a3          	sb	a1,5(a0)
    800039ac:	00700713          	li	a4,7
    800039b0:	18e79e63          	bne	a5,a4,80003b4c <__memset+0x214>
    800039b4:	00b50323          	sb	a1,6(a0)
    800039b8:	00700e93          	li	t4,7
    800039bc:	00859713          	slli	a4,a1,0x8
    800039c0:	00e5e733          	or	a4,a1,a4
    800039c4:	01059e13          	slli	t3,a1,0x10
    800039c8:	01c76e33          	or	t3,a4,t3
    800039cc:	01859313          	slli	t1,a1,0x18
    800039d0:	006e6333          	or	t1,t3,t1
    800039d4:	02059893          	slli	a7,a1,0x20
    800039d8:	40f60e3b          	subw	t3,a2,a5
    800039dc:	011368b3          	or	a7,t1,a7
    800039e0:	02859813          	slli	a6,a1,0x28
    800039e4:	0108e833          	or	a6,a7,a6
    800039e8:	03059693          	slli	a3,a1,0x30
    800039ec:	003e589b          	srliw	a7,t3,0x3
    800039f0:	00d866b3          	or	a3,a6,a3
    800039f4:	03859713          	slli	a4,a1,0x38
    800039f8:	00389813          	slli	a6,a7,0x3
    800039fc:	00f507b3          	add	a5,a0,a5
    80003a00:	00e6e733          	or	a4,a3,a4
    80003a04:	000e089b          	sext.w	a7,t3
    80003a08:	00f806b3          	add	a3,a6,a5
    80003a0c:	00e7b023          	sd	a4,0(a5)
    80003a10:	00878793          	addi	a5,a5,8
    80003a14:	fed79ce3          	bne	a5,a3,80003a0c <__memset+0xd4>
    80003a18:	ff8e7793          	andi	a5,t3,-8
    80003a1c:	0007871b          	sext.w	a4,a5
    80003a20:	01d787bb          	addw	a5,a5,t4
    80003a24:	0ce88e63          	beq	a7,a4,80003b00 <__memset+0x1c8>
    80003a28:	00f50733          	add	a4,a0,a5
    80003a2c:	00b70023          	sb	a1,0(a4)
    80003a30:	0017871b          	addiw	a4,a5,1
    80003a34:	0cc77663          	bgeu	a4,a2,80003b00 <__memset+0x1c8>
    80003a38:	00e50733          	add	a4,a0,a4
    80003a3c:	00b70023          	sb	a1,0(a4)
    80003a40:	0027871b          	addiw	a4,a5,2
    80003a44:	0ac77e63          	bgeu	a4,a2,80003b00 <__memset+0x1c8>
    80003a48:	00e50733          	add	a4,a0,a4
    80003a4c:	00b70023          	sb	a1,0(a4)
    80003a50:	0037871b          	addiw	a4,a5,3
    80003a54:	0ac77663          	bgeu	a4,a2,80003b00 <__memset+0x1c8>
    80003a58:	00e50733          	add	a4,a0,a4
    80003a5c:	00b70023          	sb	a1,0(a4)
    80003a60:	0047871b          	addiw	a4,a5,4
    80003a64:	08c77e63          	bgeu	a4,a2,80003b00 <__memset+0x1c8>
    80003a68:	00e50733          	add	a4,a0,a4
    80003a6c:	00b70023          	sb	a1,0(a4)
    80003a70:	0057871b          	addiw	a4,a5,5
    80003a74:	08c77663          	bgeu	a4,a2,80003b00 <__memset+0x1c8>
    80003a78:	00e50733          	add	a4,a0,a4
    80003a7c:	00b70023          	sb	a1,0(a4)
    80003a80:	0067871b          	addiw	a4,a5,6
    80003a84:	06c77e63          	bgeu	a4,a2,80003b00 <__memset+0x1c8>
    80003a88:	00e50733          	add	a4,a0,a4
    80003a8c:	00b70023          	sb	a1,0(a4)
    80003a90:	0077871b          	addiw	a4,a5,7
    80003a94:	06c77663          	bgeu	a4,a2,80003b00 <__memset+0x1c8>
    80003a98:	00e50733          	add	a4,a0,a4
    80003a9c:	00b70023          	sb	a1,0(a4)
    80003aa0:	0087871b          	addiw	a4,a5,8
    80003aa4:	04c77e63          	bgeu	a4,a2,80003b00 <__memset+0x1c8>
    80003aa8:	00e50733          	add	a4,a0,a4
    80003aac:	00b70023          	sb	a1,0(a4)
    80003ab0:	0097871b          	addiw	a4,a5,9
    80003ab4:	04c77663          	bgeu	a4,a2,80003b00 <__memset+0x1c8>
    80003ab8:	00e50733          	add	a4,a0,a4
    80003abc:	00b70023          	sb	a1,0(a4)
    80003ac0:	00a7871b          	addiw	a4,a5,10
    80003ac4:	02c77e63          	bgeu	a4,a2,80003b00 <__memset+0x1c8>
    80003ac8:	00e50733          	add	a4,a0,a4
    80003acc:	00b70023          	sb	a1,0(a4)
    80003ad0:	00b7871b          	addiw	a4,a5,11
    80003ad4:	02c77663          	bgeu	a4,a2,80003b00 <__memset+0x1c8>
    80003ad8:	00e50733          	add	a4,a0,a4
    80003adc:	00b70023          	sb	a1,0(a4)
    80003ae0:	00c7871b          	addiw	a4,a5,12
    80003ae4:	00c77e63          	bgeu	a4,a2,80003b00 <__memset+0x1c8>
    80003ae8:	00e50733          	add	a4,a0,a4
    80003aec:	00b70023          	sb	a1,0(a4)
    80003af0:	00d7879b          	addiw	a5,a5,13
    80003af4:	00c7f663          	bgeu	a5,a2,80003b00 <__memset+0x1c8>
    80003af8:	00f507b3          	add	a5,a0,a5
    80003afc:	00b78023          	sb	a1,0(a5)
    80003b00:	00813403          	ld	s0,8(sp)
    80003b04:	01010113          	addi	sp,sp,16
    80003b08:	00008067          	ret
    80003b0c:	00b00693          	li	a3,11
    80003b10:	e55ff06f          	j	80003964 <__memset+0x2c>
    80003b14:	00300e93          	li	t4,3
    80003b18:	ea5ff06f          	j	800039bc <__memset+0x84>
    80003b1c:	00100e93          	li	t4,1
    80003b20:	e9dff06f          	j	800039bc <__memset+0x84>
    80003b24:	00000e93          	li	t4,0
    80003b28:	e95ff06f          	j	800039bc <__memset+0x84>
    80003b2c:	00000793          	li	a5,0
    80003b30:	ef9ff06f          	j	80003a28 <__memset+0xf0>
    80003b34:	00200e93          	li	t4,2
    80003b38:	e85ff06f          	j	800039bc <__memset+0x84>
    80003b3c:	00400e93          	li	t4,4
    80003b40:	e7dff06f          	j	800039bc <__memset+0x84>
    80003b44:	00500e93          	li	t4,5
    80003b48:	e75ff06f          	j	800039bc <__memset+0x84>
    80003b4c:	00600e93          	li	t4,6
    80003b50:	e6dff06f          	j	800039bc <__memset+0x84>

0000000080003b54 <__memmove>:
    80003b54:	ff010113          	addi	sp,sp,-16
    80003b58:	00813423          	sd	s0,8(sp)
    80003b5c:	01010413          	addi	s0,sp,16
    80003b60:	0e060863          	beqz	a2,80003c50 <__memmove+0xfc>
    80003b64:	fff6069b          	addiw	a3,a2,-1
    80003b68:	0006881b          	sext.w	a6,a3
    80003b6c:	0ea5e863          	bltu	a1,a0,80003c5c <__memmove+0x108>
    80003b70:	00758713          	addi	a4,a1,7
    80003b74:	00a5e7b3          	or	a5,a1,a0
    80003b78:	40a70733          	sub	a4,a4,a0
    80003b7c:	0077f793          	andi	a5,a5,7
    80003b80:	00f73713          	sltiu	a4,a4,15
    80003b84:	00174713          	xori	a4,a4,1
    80003b88:	0017b793          	seqz	a5,a5
    80003b8c:	00e7f7b3          	and	a5,a5,a4
    80003b90:	10078863          	beqz	a5,80003ca0 <__memmove+0x14c>
    80003b94:	00900793          	li	a5,9
    80003b98:	1107f463          	bgeu	a5,a6,80003ca0 <__memmove+0x14c>
    80003b9c:	0036581b          	srliw	a6,a2,0x3
    80003ba0:	fff8081b          	addiw	a6,a6,-1
    80003ba4:	02081813          	slli	a6,a6,0x20
    80003ba8:	01d85893          	srli	a7,a6,0x1d
    80003bac:	00858813          	addi	a6,a1,8
    80003bb0:	00058793          	mv	a5,a1
    80003bb4:	00050713          	mv	a4,a0
    80003bb8:	01088833          	add	a6,a7,a6
    80003bbc:	0007b883          	ld	a7,0(a5)
    80003bc0:	00878793          	addi	a5,a5,8
    80003bc4:	00870713          	addi	a4,a4,8
    80003bc8:	ff173c23          	sd	a7,-8(a4)
    80003bcc:	ff0798e3          	bne	a5,a6,80003bbc <__memmove+0x68>
    80003bd0:	ff867713          	andi	a4,a2,-8
    80003bd4:	02071793          	slli	a5,a4,0x20
    80003bd8:	0207d793          	srli	a5,a5,0x20
    80003bdc:	00f585b3          	add	a1,a1,a5
    80003be0:	40e686bb          	subw	a3,a3,a4
    80003be4:	00f507b3          	add	a5,a0,a5
    80003be8:	06e60463          	beq	a2,a4,80003c50 <__memmove+0xfc>
    80003bec:	0005c703          	lbu	a4,0(a1)
    80003bf0:	00e78023          	sb	a4,0(a5)
    80003bf4:	04068e63          	beqz	a3,80003c50 <__memmove+0xfc>
    80003bf8:	0015c603          	lbu	a2,1(a1)
    80003bfc:	00100713          	li	a4,1
    80003c00:	00c780a3          	sb	a2,1(a5)
    80003c04:	04e68663          	beq	a3,a4,80003c50 <__memmove+0xfc>
    80003c08:	0025c603          	lbu	a2,2(a1)
    80003c0c:	00200713          	li	a4,2
    80003c10:	00c78123          	sb	a2,2(a5)
    80003c14:	02e68e63          	beq	a3,a4,80003c50 <__memmove+0xfc>
    80003c18:	0035c603          	lbu	a2,3(a1)
    80003c1c:	00300713          	li	a4,3
    80003c20:	00c781a3          	sb	a2,3(a5)
    80003c24:	02e68663          	beq	a3,a4,80003c50 <__memmove+0xfc>
    80003c28:	0045c603          	lbu	a2,4(a1)
    80003c2c:	00400713          	li	a4,4
    80003c30:	00c78223          	sb	a2,4(a5)
    80003c34:	00e68e63          	beq	a3,a4,80003c50 <__memmove+0xfc>
    80003c38:	0055c603          	lbu	a2,5(a1)
    80003c3c:	00500713          	li	a4,5
    80003c40:	00c782a3          	sb	a2,5(a5)
    80003c44:	00e68663          	beq	a3,a4,80003c50 <__memmove+0xfc>
    80003c48:	0065c703          	lbu	a4,6(a1)
    80003c4c:	00e78323          	sb	a4,6(a5)
    80003c50:	00813403          	ld	s0,8(sp)
    80003c54:	01010113          	addi	sp,sp,16
    80003c58:	00008067          	ret
    80003c5c:	02061713          	slli	a4,a2,0x20
    80003c60:	02075713          	srli	a4,a4,0x20
    80003c64:	00e587b3          	add	a5,a1,a4
    80003c68:	f0f574e3          	bgeu	a0,a5,80003b70 <__memmove+0x1c>
    80003c6c:	02069613          	slli	a2,a3,0x20
    80003c70:	02065613          	srli	a2,a2,0x20
    80003c74:	fff64613          	not	a2,a2
    80003c78:	00e50733          	add	a4,a0,a4
    80003c7c:	00c78633          	add	a2,a5,a2
    80003c80:	fff7c683          	lbu	a3,-1(a5)
    80003c84:	fff78793          	addi	a5,a5,-1
    80003c88:	fff70713          	addi	a4,a4,-1
    80003c8c:	00d70023          	sb	a3,0(a4)
    80003c90:	fec798e3          	bne	a5,a2,80003c80 <__memmove+0x12c>
    80003c94:	00813403          	ld	s0,8(sp)
    80003c98:	01010113          	addi	sp,sp,16
    80003c9c:	00008067          	ret
    80003ca0:	02069713          	slli	a4,a3,0x20
    80003ca4:	02075713          	srli	a4,a4,0x20
    80003ca8:	00170713          	addi	a4,a4,1
    80003cac:	00e50733          	add	a4,a0,a4
    80003cb0:	00050793          	mv	a5,a0
    80003cb4:	0005c683          	lbu	a3,0(a1)
    80003cb8:	00178793          	addi	a5,a5,1
    80003cbc:	00158593          	addi	a1,a1,1
    80003cc0:	fed78fa3          	sb	a3,-1(a5)
    80003cc4:	fee798e3          	bne	a5,a4,80003cb4 <__memmove+0x160>
    80003cc8:	f89ff06f          	j	80003c50 <__memmove+0xfc>

0000000080003ccc <__putc>:
    80003ccc:	fe010113          	addi	sp,sp,-32
    80003cd0:	00813823          	sd	s0,16(sp)
    80003cd4:	00113c23          	sd	ra,24(sp)
    80003cd8:	02010413          	addi	s0,sp,32
    80003cdc:	00050793          	mv	a5,a0
    80003ce0:	fef40593          	addi	a1,s0,-17
    80003ce4:	00100613          	li	a2,1
    80003ce8:	00000513          	li	a0,0
    80003cec:	fef407a3          	sb	a5,-17(s0)
    80003cf0:	fffff097          	auipc	ra,0xfffff
    80003cf4:	b3c080e7          	jalr	-1220(ra) # 8000282c <console_write>
    80003cf8:	01813083          	ld	ra,24(sp)
    80003cfc:	01013403          	ld	s0,16(sp)
    80003d00:	02010113          	addi	sp,sp,32
    80003d04:	00008067          	ret

0000000080003d08 <__getc>:
    80003d08:	fe010113          	addi	sp,sp,-32
    80003d0c:	00813823          	sd	s0,16(sp)
    80003d10:	00113c23          	sd	ra,24(sp)
    80003d14:	02010413          	addi	s0,sp,32
    80003d18:	fe840593          	addi	a1,s0,-24
    80003d1c:	00100613          	li	a2,1
    80003d20:	00000513          	li	a0,0
    80003d24:	fffff097          	auipc	ra,0xfffff
    80003d28:	ae8080e7          	jalr	-1304(ra) # 8000280c <console_read>
    80003d2c:	fe844503          	lbu	a0,-24(s0)
    80003d30:	01813083          	ld	ra,24(sp)
    80003d34:	01013403          	ld	s0,16(sp)
    80003d38:	02010113          	addi	sp,sp,32
    80003d3c:	00008067          	ret

0000000080003d40 <console_handler>:
    80003d40:	fe010113          	addi	sp,sp,-32
    80003d44:	00813823          	sd	s0,16(sp)
    80003d48:	00113c23          	sd	ra,24(sp)
    80003d4c:	00913423          	sd	s1,8(sp)
    80003d50:	02010413          	addi	s0,sp,32
    80003d54:	14202773          	csrr	a4,scause
    80003d58:	100027f3          	csrr	a5,sstatus
    80003d5c:	0027f793          	andi	a5,a5,2
    80003d60:	06079e63          	bnez	a5,80003ddc <console_handler+0x9c>
    80003d64:	00074c63          	bltz	a4,80003d7c <console_handler+0x3c>
    80003d68:	01813083          	ld	ra,24(sp)
    80003d6c:	01013403          	ld	s0,16(sp)
    80003d70:	00813483          	ld	s1,8(sp)
    80003d74:	02010113          	addi	sp,sp,32
    80003d78:	00008067          	ret
    80003d7c:	0ff77713          	andi	a4,a4,255
    80003d80:	00900793          	li	a5,9
    80003d84:	fef712e3          	bne	a4,a5,80003d68 <console_handler+0x28>
    80003d88:	ffffe097          	auipc	ra,0xffffe
    80003d8c:	6dc080e7          	jalr	1756(ra) # 80002464 <plic_claim>
    80003d90:	00a00793          	li	a5,10
    80003d94:	00050493          	mv	s1,a0
    80003d98:	02f50c63          	beq	a0,a5,80003dd0 <console_handler+0x90>
    80003d9c:	fc0506e3          	beqz	a0,80003d68 <console_handler+0x28>
    80003da0:	00050593          	mv	a1,a0
    80003da4:	00000517          	auipc	a0,0x0
    80003da8:	49c50513          	addi	a0,a0,1180 # 80004240 <_ZZ12printIntegermE6digits+0x220>
    80003dac:	fffff097          	auipc	ra,0xfffff
    80003db0:	afc080e7          	jalr	-1284(ra) # 800028a8 <__printf>
    80003db4:	01013403          	ld	s0,16(sp)
    80003db8:	01813083          	ld	ra,24(sp)
    80003dbc:	00048513          	mv	a0,s1
    80003dc0:	00813483          	ld	s1,8(sp)
    80003dc4:	02010113          	addi	sp,sp,32
    80003dc8:	ffffe317          	auipc	t1,0xffffe
    80003dcc:	6d430067          	jr	1748(t1) # 8000249c <plic_complete>
    80003dd0:	fffff097          	auipc	ra,0xfffff
    80003dd4:	3e0080e7          	jalr	992(ra) # 800031b0 <uartintr>
    80003dd8:	fddff06f          	j	80003db4 <console_handler+0x74>
    80003ddc:	00000517          	auipc	a0,0x0
    80003de0:	56450513          	addi	a0,a0,1380 # 80004340 <digits+0x78>
    80003de4:	fffff097          	auipc	ra,0xfffff
    80003de8:	a68080e7          	jalr	-1432(ra) # 8000284c <panic>
	...
