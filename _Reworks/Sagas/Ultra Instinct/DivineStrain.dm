/obj/Skills/Buffs/TemporaryDebuffs/Mortal_Instinct_Debuff/DivineStrain
	BuffName = "Divine Strain"
	desc = "Your mortal body is struggling to adapt to divine instinct."
	Slotless = 1
	Copyable = 0
	TimerLimit = 86400 // 24 hours
	Timer = 0
	StrMult = 0.8
	EndMult = 0.8
	SpdMult = 0.9
	DefMult = 0.9
	OffMult = 0.85
	ForMult = 0.85
	ActiveMessage = "is overwhelmed by divine pressure!"
	OffMessage = "has fully adapted to the divine flow!"
	TextColor = "#d4aaff"

	New(mob/User)
		..()
		if(User)
			src.AutoTrigger(User)

	proc/AutoTrigger(mob/User)
		if(!User) return
		OMsg(User, "[User] [ActiveMessage]")
		Log("Admin", "[ExtractInfo(User)] received Mortal Instinct adaptation debuff (24h duration).")
		spawn(TimerLimit * 10)
			if(User && src in User.contents)
				src.AutoRemove(User)

	proc/AutoRemove(mob/User)
		if(!User) return
		OMsg(User, "[User] [OffMessage]")
		Log("Admin", "[ExtractInfo(User)]'s Mortal Instinct adaptation debuff has expired (24h complete).")
		del(src)