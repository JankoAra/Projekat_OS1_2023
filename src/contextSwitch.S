.global _ZN3TCB13contextSwitchEPNS_7ContextES1_
.type _ZN3TCB13contextSwitchEPNS_7ContextES1_, @function
_ZN3TCB13contextSwitchEPNS_7ContextES1_:
	# a0 = adresa od oldContext
	# a1 = adresa od newContext

	# ra pokazuje iza contextSwitch-a u dispatch-u za staru nit

	# ra za novu nit pokazuje ili iza contextSwitch-a
	# ili na pocetak wrapper funkcije(ako se nit nikad nije izvrsavala)

	# sp stare niti pokazuje na sacuvane podatke iz dispatch(ra,s0,s1),
	# iznad toga su registri x3-x31 sacuvani u yield-u i ra,s0 iz yielda

	# sp nove niti pokazuje na sacuvane podatke iz dispatch-a i yield-a ako se nit nekad izvrsavala,
	# odnosno adresu vrha steka alociranog za novu nit ako nije
	sd ra, 0 * 8(a0)
	sd sp, 1 * 8(a0)

	ld ra, 0 * 8(a1)
    ld sp, 1 * 8(a1)

	ret