sagaTierUpMessages/Rebirth
	messages = list("You embark on the path of a Hero... but which Hero you become remains to be seen. Will you simply choose to be the strongest or defy everything for victory?", \
	"Now you can choose: Are you the hero spoken of in legend, or are you one who has not yet written their story?", \
	"Your legend shifts ever-closer to completion. Your name is starting to be recognized.", \
	"You are experiencing the first glimmers of Seventh Sense when in a pinch along with the ability to call upon your zodiac!", \
	"You reach the level of a Golden Saint, standing at the summit as a champion of Gods!", \
	"Your Cosmos burns with the power of a god!", \
	)


/mob/tierUpSaga(path)
	..()
	if(path == "Rebirth")
		src<<allSagaMessages[path].messages[SagaLevel]
		switch(SagaLevel)
			if(2)
				var/list/Choices=list("Prophesized Hero", "Unsung Hero")
				var/choice
				var/confirm
				while(confirm!="Yes")
					choice=input(src, "Are you the hero spoken of in legends? Or has your story yet to be written?", "Hero Path") in Choices
					switch(choice)
						if("Unsung Hero")
							confirm=alert(src, "You remain the hero nobody knows, but one day, your name will be its own legend.", "The Unsung Hero, a story yet to be written.", "Yes", "No")
						if("Prophesized Hero")
							confirm=alert(src, "A story told in glass, a tragedy written into time and space.", "The Hero of Prophecy, chosen by fate.", "Yes", "No")
				src.SagaLevel=2
				src<<"Unwavering courage wells up within you! You have unlocked the ACT meter!"
				switch(choice)
					if("Unsung Hero")
						src.RebirthHeroPath="Unsung"
						if(src.RebirthHeroType=="Blue")
							src.AddSkill(new/obj/Skills/Queue/NeverKnowsBest)
							src.AddSkill(new/obj/Skills/Projectile/Rude_Buster)
						if(src.RebirthHeroType=="Red")
							src.AddSkill(new/obj/Skills/Utility/NeverTooLate)
							src.passive_handler.Increase("Determination")
							src.passive_handler.Increase("Determination(Red)")
							src<< "Your ACT meter slows, but as it builds, a certain power wells up within you..."
							src<< "You unlock the Red SOUL color, boosting your crit rate as you gain ACT!"
						if(src.RebirthHeroType=="Rainbow")
							src.AddSkill(new/obj/Skills/AutoHit/NeverSeeItComing)
							src<< "nyoro~n :3c"
						src.AddSkill(new/obj/Skills/Utility/NeverTooEarly)
					if("Prophesized Hero")
						src.RebirthHeroPath="Prophesized"
						if(src.RebirthHeroType=="Blue")
							src.RebirthHeroType="Cyan"
							src<< "You are now the Cyan Hero of Soul, a cage for a human SOUL. Your ACT meter slows, but as it builds, a certain power wells up within you..."
							src.passive_handler.Increase("Determination")
							src.AddSkill(new/obj/Skills/Utility/SoulShift)
							src<<"You unlock the Red SOUL color, boosting your crit rate as you gain ACT!"
							src<<"You unlock the Yellow SOUL color, granting your melee attacks projectiles!!"
							src.AddSkill(new/obj/Skills/Buffs/Rebirth/Spookysword)
						if(src.RebirthHeroType=="Red")
							src.RebirthHeroType="Purple"
							src<< "You are now the Purple Hero of Hope, who attacks with dark energy."
							src.AddSkill(new/obj/Skills/Projectile/Rude_Buster)
							src.AddSkill(new/obj/Skills/Buffs/Rebirth/Devilsknife)
						if(src.RebirthHeroType=="Rainbow")
							src.RebirthHeroPath="Unsung"
							src<<"Sorry, there is no way in hell that fate could ever account for you. Nice try, though."
							src.AddSkill(new/obj/Skills/AutoHit/NeverSeeItComing)
							src<< "nyoro~n :3c"
							src.AddSkill(new/obj/Skills/Utility/NeverTooEarly)
					/*		src.RebirthHeroType="Yellow"
							src<< "You are now the Yellow Hero of Connection, who can attack with Ice Magic.."
							src.AddSkill(new/obj/Skills/Projectile/Rude_Buster)
							src.AddSkill(new/obj/Skills/Buffs/Rebirth/Devilsknife)
							src<< "..but you could still choose to become the Yellow Hero of Tragedy. After all, this wasn't supposed to be your story."
							src.AddSkill(new/obj/Skills/Buffs/Rebirth/ThornRing)
							src.AddSkill(new/obj/Skills/AutoHit/Snowgrave)*/
			if(3)
				src.SagaLevel=3
				if(src.RebirthHeroType=="Cyan")
					src<< "You have unlocked the green SOUL color, which reduces the damage you take as you build ACT. You also gain the BlackShard, a small weapon that can hardly be considered one, but carries great power..."
					src.AddSkill(new/obj/Skills/Utility/SoulShiftGreen)
					src.AddSkill(new/obj/Skills/Buffs/Rebirth/BlackShard)
				if(src.RebirthHeroType=="Purple")
					src<< "You can attempt to heal people now. You're doing your best, and I'm sure people will be proud of you for it. You can also utilize the Axe of Justice, but you're not quite ready for what that entails."
					src.AddSkill(new/obj/Skills/Utility/UltimateHeal)
					src.AddSkill(new/obj/Skills/Buffs/Rebirth/JusticeAxe)
				if(src.RebirthHeroType=="Blue")
					src.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Autonomous/Shining_Star)
				if(src.RebirthHeroType=="Red")
					src.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Autonomous/Unwavering_Soul)
		//		if(src.RebirthHeroType=="Rainbow")
			if(4)
				src.SagaLevel=4
				if(src.RebirthHeroType=="Purple")
					src<< "Your story has finally come into its own. You have become the Axe of Justice, with hope crossed on your heart."
					src.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Autonomous/Axe_of_Justice)
				if(src.RebirthHeroType=="Rainbow")
					src<<"Surprise! You're a woman now. RP accordingly."
					if(src.Gender=="Female")
						src<<"Oh, wait, you were before? Uh. Okay."
					src.Gender="Female"
			if(5)
			if(6)