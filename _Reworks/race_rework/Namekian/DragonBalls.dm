/obj/Skills/Utility/Inner_Dragon_Wish
	name = "Inner Dragon Wish"
	desc = "Invoke the inner dragon to grant a powerful boon."
	Copyable = 0
	Cooldown = 604800 // one week!!!!!!!
	CooldownStatic = 1
	cooldown_start = 0
	cooldown_remaining = 0

	verb/Wish()
		set name = "Make a Wish"
		set desc = "Call upon your inner dragon to reshape destiny."
		set category = "Skills"

		var/mob/M = usr
		if(!M) return
		if(M.Class != "Dragon")
			M << "<font color=#77ff77><b>Your inner dragon slumbers. Only Namekian of the Dragon caste may call upon it.</b></font>"
			return

		if(src.cooldown_remaining || (world.realtime < src.cooldown_start + (src.Cooldown * 10)))
			var/time_left = round((src.cooldown_start + (src.Cooldown * 10) - world.realtime) / 86400, 0.1)
			M << "<font color=#77ff77><b>Your inner dragon has not yet awakened. Try again in [time_left] days.</b></font>"
			return

		var/choice = input(M, "What will you wish for?", "Inner Dragon Wish") in list("Increase Economy", "Unlock Ascension (Warrior only)", "Reclass to Warrior")
		if(!choice) return

		switch(choice)
			if("Increase Economy")
				if(M.EconomyMult <= 1)
					M.EconomyMult *= 2
					M << "<font color=#ffff77><b>Your inner dragon doubles your fortune!</b></font>"
				else
					M.EconomyMult += 0.15
					M << "<font color=#ffff77><b>Your inner dragon blesses your trade! Your economy multiplier rises to [round(M.EconomyMult, 0.01)]!</b></font>"

			if("Unlock Ascension (Warriors Only)")
				var/list/namekian_targets = list()
				for(var/mob/P in view(10, M))
					if(P != M && P.race == "Namekian")
						namekian_targets += P

				if(!namekian_targets.len)
					M << "<font color=#aaaaaa><b>There are no Namekians nearby to bless...</b></font>"
					return

				var/mob/target = input(M, "Whose ascension will you awaken?", "Choose Namekian") as mob in namekian_targets
				if(!target) return

				if(target.Class != "Warrior")
					M << "<font color=#ff7777><b>The dragon’s power rejects the unworthy. Only Warrior caste Namekians may be blessed.</b></font>"
					return
				if(target.AscensionsUnlocked >= 2)
					M << "<font color=#ff7777><b>The dragon senses that [target]'s spirit cannot ascend further through this wish.</b></font>"
					return

				target.AscensionsUnlocked++
				M << "<font color=#77ffff><b>The dragon’s light flows into [target], awakening their next ascension!</b></font>"
				target << "<font color=#77ffff><b>Your soul resonates with the dragon’s call! Ascension [target.AscensionsUnlocked] unlocked!</b></font>"
				Log("Admin", "[ExtractInfo(M)] granted [target]'s Ascension [target.AscensionsUnlocked] via Inner Dragon Wish.")

			if("Reclass to Warrior")
				M.Class = "Warrior"
				M << "<font color=#77ff77><b>Your body surges with power, transforming you into a Namekian of the Warrior caste!</b></font>"

				switch(M.AscensionsUnlocked)
					if(1)
						M.StrAscension += 0.35
						M.EndAscension += 0.35
					if(2)
						M.Intimidation += 10
						M.StrAscension += 0.7
						M.EndAscension += 0.7
					if(3)
						M.Intimidation += 10
						M.StrAscension += 1.35
						M.EndAscension += 1.35
						M.OffAscension += 0.65
						M.RecovAscension += 0.65
					if(4)
						M.Intimidation += 40
						M.StrAscension += 2.35
						M.EndAscension += 1.7
						M.OffAscension += 0.65
						M.RecovAscension += 1.15
					if(5)
						M.Intimidation += 110
						M.StrAscension += 3.35
						M.EndAscension += 2.7
						M.OffAscension += 0.65
						M.RecovAscension += 1.15

				if(M.AscensionsUnlocked >= 4)
					M.transUnlocked = 1
					M << "<font color=#ff9933><b>The fire of the Orange Namekian ignites within you!</b></font>"

		src.Cooldown(1, src.Cooldown, M)
		M << "<font color=#77ff77><b>Your inner dragon returns to its slumber for a week...</b></font>"