/obj/Skills/Buffs/TemporaryDebuffs/Mortal_Instinct_Debuff/DivineStrain
	BuffName = "Divine Strain"
	desc = "Your mortal body is struggling to adapt to divine instinct."
	Slotless = 1
	Copyable = 0
	TimerLimit = 259200 // 72 hours
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
		Log("Admin", "[ExtractInfo(User)] received Mortal Instinct adaptation debuff (72h duration).")
		spawn(TimerLimit * 10)
			if(User && src in User.contents)
				src.AutoRemove(User)

	proc/AutoRemove(mob/User)
		if(!User) return
		OMsg(User, "[User] [OffMessage]")
		Log("Admin", "[ExtractInfo(User)]'s Mortal Instinct adaptation debuff has expired (72h complete).")
		del(src)

/obj/Skills/Buffs/TemporaryDebuffs/Mortal_Instinct_Debuff/ClearMind
	BuffName = "Clear Mind"
	desc = "Your mind is freed and your heart is pure, preventing you from angering."
	Slotless = 1
	Copyable = 0
	TimerLimit = 1209600 // two weeks?! (yes)
	passives = list("NoAnger" = 1)
	AngerMult = 0.75 //so that CalmAnger and associated debuffs can't benefit you unless you have like. 200% anger. but if you manage to combine the mechanics in such a ridiculous way then i kinda think you've earned it.
	Timer = 0
	ActiveMessage = "is overwhelmed by divine pressure!"
	OffMessage = ""
	TextColor = "#d4aaff"

	New(mob/User)
		..()
		if(User)
			src.AutoTrigger(User)

	proc/AutoTrigger(mob/User)
		if(!User) return
		OMsg(User, "[User] [ActiveMessage]")
		Log("Admin", "[ExtractInfo(User)] received Mortal Instinct adaptation debuff (72h duration).")
		spawn(TimerLimit * 10)
			if(User && src in User.contents)
				src.AutoRemove(User)

	proc/AutoRemove(mob/User)
		if(!User) return
		OMsg(User, "[User] [OffMessage]")
		Log("Admin", "[ExtractInfo(User)]'s Mortal Instinct adaptation debuff has expired (72h complete).")
		del(src)

	proc/GetRemainingTime()
		var/time_left = max((TimerLimit * 10) - (Timer * 10), 0)
		return time_left

	verb/CloudedHeart()
		set name = "Clouded Heart"
		set desc = "Suppress your divine state for one hour, allowing mortal emotion to surface."
		set category = "Skills"
		var/mob/User = usr
		if(!User) return
		if(User.CloudedHeartActive)
			User << "<font color='#ffb3c6'><b>Your heart is already clouded. Wait until your emotions settle.</b></font>"
			return
		User.CloudedHeartActive = TRUE
		var/hadClearMind = FALSE
		var/hadDivineStrain = FALSE
		var/clearMindTimeLeft = 0
		for(var/obj/Skills/Buffs/TemporaryDebuffs/Mortal_Instinct_Debuff/DivineStrain/D in User.contents)
			del(D)
			hadDivineStrain = TRUE
		for(var/obj/Skills/Buffs/TemporaryDebuffs/Mortal_Instinct_Debuff/ClearMind/C in User.contents)
			clearMindTimeLeft = C.GetRemainingTime()
			del(C)
			hadClearMind = TRUE
		if(hadClearMind || hadDivineStrain)
			User << "<font color='#c87aff'><b>Your divine calm fades, and mortal emotion clouds your heart...</b></font>"
			OMsg(User, "[User]'s divine aura dims beneath mortal doubt.")
			Log("Admin", "[ExtractInfo(User)] activated Clouded Heart: divine effects suppressed for 1 hour.")
		else
			User << "<font color='#d4aaff'><b>The divine strain stirs as your heart clouds over.</b></font>"
			OMsg(User, "[User]'s divine essence shifts under emotional weight.")
			Log("Admin", "[ExtractInfo(User)] used Clouded Heart without active buffs - DivineStrain will reapply later.")
		spawn(36000)// ONE HOUR OF FREEDOM GOOD LUCK SMOOTH BRAIN LMFAOOOOOOOOOOOO
			if(User)
				var/newstrain = new /obj/Skills/Buffs/TemporaryDebuffs/Mortal_Instinct_Debuff/DivineStrain(User)
				User.contents += newstrain
				User << "<font color='#d4aaff'><b>The divine flow returns as your heart clears once more.</b></font>"//Yeah, you're going to carry that weight.
				OMsg(User, "[User]'s divine strain reawakens after the heart clears.")//Yeah, you're going to carry that weight.
				Log("Admin", "[ExtractInfo(User)]'s Clouded Heart expired. DivineStrain restored!")//			Yeah, you're going to carry that weight.
				if(hadClearMind)//																				Yeah, you're going to carry that weight.
					var/newmind = new /obj/Skills/Buffs/TemporaryDebuffs/Mortal_Instinct_Debuff/ClearMind(User)//Yeah, you're going to carry that weight.
					User.contents += newmind//																	Yeah, you're going to carry that weight.
					if(clearMindTimeLeft > 0)//																	Yeah, you're going to carry that weight.
						spawn(clearMindTimeLeft)//																Yeah, you're going to carry that weight.
							if(User && newmind in User.contents)//												Yeah, you're going to carry that weight.
								call(newmind, "AutoRemove")(User)//														Yeah, you're going to carry that weight.
					User << "<font color='#bfefff'><b>Your thoughts settle back into divine clarity.</b></font>"//Yeah, you're going to carry that weight.
					Log("Admin", "[ExtractInfo(User)]'s ClearMind restored with previous timer intact.")//Yeah, you're going to carry that weight.
				User.CloudedHeartActive = FALSE