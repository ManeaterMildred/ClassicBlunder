/obj/Skills/Buffs/NuStyle/UnarmedStyle
    God_Fist
        SignatureTechnique = 4
        StyleActive="God Fist"
        StyleEnd = 1.5
        StyleDef = 1.5
        StyleSpd = 1.5
        StyleStr = 1.5
        Finisher="/obj/Skills/Queue/Finisher/The_Big_Bang_Punch"
        passives = list("LikeWater" = 4, "Fa Jin" = 3, "Interception" = 3, "Sunyata" = 5 , "Gum Gum" = 2, "Acupuncture" = 2, \
                        "Flow" = 2, "Instinct" = 2, "Momentum" = 3, "Hardening" = 2, "Pressure" = 3, "Hard Style" = 1, \
                        "FluidForm" = 4, "DoubleStrike" = 2)
        verb/God_Fist()
            set hidden=1
            src.Trigger(usr)
    Ten_Directions
        SignatureTechnique = 4
        StyleActive="Ten Directions"
        passives = list("Flying Thunder God" = 1, "BlurringStrikes" = 10, "Fury" = 3, "Fa Jin" = 3, "Instinct" = 2, "Secret Knives" = "FTG", "Tossing" = 3, \
        "BladeFisting" = 1, "NeedsSword" = 0, "NoSword" = 1, "Interception" = 3, "Sunyata" = 3, "LikeWater" = 5, "Soft Style" = 1)
        Finisher="/obj/Skills/Queue/Finisher/Hyakuretsu_Ken"
        StyleSpd = 2.25
        StyleOff = 1.5
        StyleStr = 1.25
        verb/Ten_Directions()
            set hidden=1
            src.Trigger(usr)
    Giga_Galaxy_Wrestling
        SignatureTechnique = 4
        StyleActive="Giga Galaxy Wrestling"
        StyleEnd = 2
        StyleStr = 2
        Finisher="/obj/Skills/Queue/Finisher/Stone_Cold_Stunner"
        passives = list("Heavy Strike" = "Wrestling", "Muscle Power" =8, "Grippy" = 7, \
                        "Scoop" = 5, "Iron Grip" = 1, "DeathField" = 5, "Gum Gum" = 3, "Hardening" = 4, \
                        "Momentum" = 4, "CallousedHands"=0.15)
        verb/Giga_Galaxy_Wrestling()
            set hidden=1
            src.Trigger(usr)
