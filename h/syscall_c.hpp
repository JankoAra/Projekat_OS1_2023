#ifndef syscall_c_hpp
#define syscall_c_hpp

#include "../lib/hw.h"

/*
Alocira (najmanje) size bajtova memorije, zaokruženo i
poravnato na blokove veličine MEM_BLOCK_SIZE. Vraća
pokazivač na alocirani deo memorije u slučaju uspeha, a null
pokazivač u slučaju neuspeha.
MEM_BLOCK_SIZE je celobrojna konstanta veća od ili
jednaka 64, a manja od ili jednaka 1024.
 */
void* mem_alloc(size_t size);

/*
Oslobađa prostor prethodno zauzet pomoću mem_alloc.
Vraća 0 u slučaju uspeha, negativnu vrednost u slučaju greške
(kôd greške).
Argument mora imati vrednost vraćenu iz mem_alloc.
Ukoliko to nije slučaj, ponašanje je nedefinisano: jezgro
može vratiti grešku ukoliko može da je detektuje ili
manifestovati bilo kakvo drugo predvidivo ili nepredvidivo
ponašanje
 */
int mem_free(void*);

class TCB;

typedef TCB* thread_t;

/*
Pokreće nit nad funkcijom start_routine, pozivajući je sa
argumentom arg. U slučaju uspeha, u *handle upisuje
„ručku“ novokreirane niti i vraća 0, a u slučaju neuspeha
vraća negativnu vrednost (kôd greške).
„Ručka“ je interni identifikator koji jezgro koristi da bi
identifikovalo nit (pokazivač na neku internu
strukturu/objekat jezgra čije je ime sakriveno iza sinonima
_thread).
 */
int thread_create(thread_t* handle, void(* start_routine)(void*), void* arg);

/*
Gasi tekuću nit. U slučaju neuspeha vraća negativnu vrednost
(kôd greške).
 */
int thread_exit();

/*
Potencijalno oduzima procesor tekućoj i daje nekoj drugoj (ili
istoj) niti.
 */
void thread_dispatch();

/*
Suspenduje tekuću nit dok se nit sa datom ručkom ne završi.
 */
void thread_join(thread_t handle);

class KSem;

typedef KSem* sem_t;

/*
Kreira semafor sa inicijalnom vrednošću init. U slučaju
uspeha, u *handle upisuje ručku novokreiranog semafora i
vraća 0, a u slučaju neuspeha vraća negativnu vrednost (kôd
greške).
„Ručka“ je interni identifikator koji jezgro koristi da bi
identifikovalo semafore (pokazivač na neku internu
strukturu/objekat jezgra čije je ime sakriveno iza sinonima
_sem)
 */
int sem_open(sem_t* handle, unsigned init);

/*
Oslobađa semafor sa datom ručkom. Sve niti koje su se
zatekle da čekaju na semaforu se deblokiraju, pri čemu njihov
wait vraća grešku. U slučaju uspeha vraća 0, a u slučaju
neuspeha vraća negativnu vrednost (kôd greške).
 */
int sem_close(sem_t handle);

/*
Operacija wait na semaforu sa datom ručkom. U slučaju
uspeha vraća 0, a u slučaju neuspeha, uključujući i slučaj
kada je semafor dealociran dok je pozivajuća nit na njemu
čekala, vraća negativnu vrednost (kôd greške).
 */
int sem_wait(sem_t id);

/*
Operacija signal na semaforu sa datom ručkom. U slučaju
uspeha vraća 0, a u slučaju neuspeha vraća negativnu
vrednost (kôd greške).
 */
int sem_signal(sem_t id);

typedef unsigned long time_t;

/*
Uspavljuje pozivajuću nit na zadati period u internim
jedinicama vremena (periodama tajmera). U slučaju uspeha
vraća 0, a u slučaju neuspeha vraća negativnu vrednost (kôd greške)
 */
int time_sleep(time_t);

const int EOF = -1;

/*
Učitava jedan znak iz bafera znakova učitanih sa konzole. U
slučaju da je bafer prazan, suspenduje pozivajuću nit dok se
znak ne pojavi. Vraća učitani znak u slučaju uspeha, a
konstantu EOF u slučaju greške.
 */
char getc();

/*
Ispisuje dati znak na konzolu.
 */
void putc(char);


#endif