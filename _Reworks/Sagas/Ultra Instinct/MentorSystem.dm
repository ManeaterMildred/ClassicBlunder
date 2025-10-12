mob/var
    LastMentorUse = 0 // cooldown timer to prevent spam training

obj/Skills/Utility/Mentor_System
	verb/Teach_UI()
		set category = "Utility"
		set name = "Teach Ultra Instinct"
		if(src.Using)
			return
		src.Using = 1

		var/mob/Mentor = usr
		var/list/mob/Players/Students = list("Cancel")

		for(var/mob/Players/P in oview(1, Mentor))
			if(P.EraAge > Mentor.EraAge || Mentor.Timeless)
				Students.Add(P)

		if(Students.len < 2)
			Mentor << "There's no one nearby to train."
			src.Using = 0
			return

		var/mob/Players/Choice = input(Mentor, "Select a student to train:", "Teach Ultra Instinct") in Students
		if(Choice == "Cancel")
			src.Using = 0
			return

		if(world.realtime < Mentor.LastMentorUse)
			var/remaining = round((Mentor.LastMentorUse - world.realtime) / Hour(1), 0.1)
			Mentor << "You must wait [remaining] more hours before training again."
			src.Using = 0
			return

		if(Choice.CheckSlotless("Divine Strain"))
			Mentor << "[Choice] is still recovering from their last Mortal Instinct training. You must wait until their strain fades."
			src.Using = 0
			return

		switch(input(Choice, "[Mentor] wishes to train you in Ultra Instinct. Do you accept?", "Mentorship") in list("Allow", "Deny"))
			if("Deny")
				Mentor << "[Choice] declined your offer."
				src.Using = 0
				return

		if(Mentor.Saga != "Ultra Instinct")//prevent abuse of verbs falling into unintended hands(read:idiot insurance.)
			Mentor << "You must first walk the path of the Angels before you can teach Ultra Instinct."
			src.Using = 0
			return

		if(Choice.Saga != "Ultra Instinct")
			Choice.Saga = "Ultra Instinct"

		switch(Choice.SagaLevel)
			if(0)
				src.Grant_Mortal_Instinct(Mentor, Choice)
				Choice.SagaLevel = 1
			if(1)
				if(Mentor.SagaLevel >= 2)
					src.Grant_Imperfect_UI(Mentor, Choice)
					Choice.SagaLevel = 2
				else
					Mentor << "You must deepen your understanding of Ultra Instinct first."
					src.Using = 0
					return
			if(2)
				if(Mentor.SagaLevel >= 3)
					src.Grant_Complete_UI(Mentor, Choice)
					Choice.SagaLevel = 3
				else
					Mentor << "You must master Ultra Instinct before you can teach this level."
					src.Using = 0
					return
			else
				Mentor << "[Choice] has already achieved mastery beyond your teaching."
				src.Using = 0
				return


		Log("Admin", "[ExtractInfo(Mentor)] mentored [ExtractInfo(Choice)] in Ultra Instinct (SagaLevel advanced to [Choice.SagaLevel]).")//prevents abuse of verbs in the late night hours

		Mentor.LastMentorUse = world.realtime + Day(1) //Cooldown for mentoring

		Mentor << "<font color='#888888'>(Mentorship logged to admin records.)</font>"//Allows admins to track students.
		src.Using = 0

	proc/Grant_Mortal_Instinct(mob/Mentor, mob/Student)
		Student.AddSkill(new /obj/Skills/Buffs/NuStyle/MortalUI/Mortal_Instinct_Style)
		Student << "<font color='#b4f0ff'>You begin to sense divine motion, but your body strains to respond.</font>"
		OMsg(Mentor, "[Student] has entered Mortal Instinct training.")

		Log("Admin", "[ExtractInfo(Mentor)] initiated Mortal Instinct training for [ExtractInfo(Student)].")//Allows admins to track student's initial training.

		var/debuff = new /obj/Skills/Buffs/TemporaryDebuffs/Mortal_Instinct_Debuff/DivineStrain(Student)
		Student.contents += debuff
		Student << "<font color='#d4aaff'><b>Your mortal body struggles to adapt to divine movement...</b></font>"
		OMsg(Mentor, "[Student]'s body strains under the divine pressure.")

		Log("Admin", "[ExtractInfo(Mentor)] applied Mortal Instinct adaptation debuff to [ExtractInfo(Student)] for 24 hours.")//Allows admins to track student's initial debuff.


	proc/Grant_Imperfect_UI(mob/Mentor, mob/Student)
		Student.AddSkill(new /obj/Skills/Buffs/NuStyle/MortalUI/Incomplete_Ultra_Instinct_Style)
		OMsg(Mentor, "[Student] progresses further into the realm of instinct.")
		Log("Admin", "[ExtractInfo(Mentor)] advanced [ExtractInfo(Student)] to Incomplete Ultra Instinct (SagaLevel 2).")//Allows admins to track student's overall progression.

	proc/Grant_Complete_UI(mob/Mentor, mob/Student)
		Student.AddSkill(new /obj/Skills/Buffs/NuStyle/MortalUI/Ultra_Instinct_Style)
		OMsg(Mentor, "[Student] achieves a complete understanding of divine instinct.")
		Student << "<font color='#d4aaff'><b>To advance further you must conquer your ego and achieve perfection...</b></font>"
		Log("Admin", "[ExtractInfo(Mentor)] advanced [ExtractInfo(Student)] to Complete Ultra Instinct (SagaLevel 3).")//Allows admins to track student's overall progression.

		if(Mentor.SagaLevel >= 3)//End of the road Compadre.
			Mentor.verbs -= /obj/Skills/Utility/Mentor_System/verb/Teach_UI//This is an optional keep, but IMHO should be mandatory. If the student dies give it back I GUESS.
			Mentor << "<font color='#a0ffff'><b>Your role as a mentor is complete - you have passed on the secrets of Ultra Instinct.</b></font>"
			Log("Admin", "[ExtractInfo(Mentor)]'s Teach_UI verb has been removed after passing on Complete Ultra Instinct.")//We need to keep track of this stuff because automated systems can always be buggy.