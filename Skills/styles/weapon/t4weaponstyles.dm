/obj/Skills/Buffs/NuStyle/SwordStyle
    Way_of_the_Kensei
        SignatureTechnique = 4
        StyleOff=1.5
        StyleStr=1.5
        StyleSpd=1.5
        StyleDef=1.5
        Finisher="/obj/Skills/Queue/Finisher/Jinzen_Senkei"
        passives = list("Kensei" = 1, "The Way" = 1, "Sword Master" = 1, "LikeWater" = 6, "SweepingStrike" = 1, "DoubleStrike" = 3, "BlurringStrikes" = 1.5, \
                        "Zornhau" = 3, "Half-Sword" = 2, "Rage" = 1, "TripleStrike" = 1, "Iaijutsu" = 5, "Musoken" = 1, "Fury" = 3, "Momentum" = 3, "Hardening" = 3, \
                        "Parry" = 3, "Disarm" = 2, "Deflection" = 2, "Pressure" = 4)
        StyleActive="Way of the Kensei"
        verb/Way_of_the_Kensei()
            set hidden=1
            src.Trigger(usr)
    Kyutoryu
        SignatureTechnique = 4
        StyleActive="Kyutoryu"
        StyleSpd=2.25
        StyleStr=1.75
        Finisher="/obj/Skills/Queue/Finisher/Demonic_Nine_Flashes"
        passives = list("AsuraStrike" = 1, "TripleStrike" = 2, "DoubleStrike" = 3, "Iaijutsu" = 3, \
                        "Fury" = 5, "NeedsSecondSword" = 1, "NeedsThirdSword" = 1, "BlurringStrikes" = 2, "SweepingStrikes" = 1, \
                        "Iaijutsu" = 3, "Disarm" = 3, "Parry" = 3, "Fury" = 5, "Unnerve" = 2, "Pressure" = 2 )
        verb/Kyutoryu()
            set hidden=1
            src.Trigger(usr)
    Alpha_inForce
        SignatureTechnique = 4
        StyleActive="Alpha inForce"
        StyleStr=1.5
        StyleFor=1.5
        StyleEnd=1.25
        StyleOff=1.25
        StyleSpd=1.25
        passives = list("Knight of the Empty Seat" = 1, "HybridStyle" = "MysticStyle", "CriticalChance" = 15, "CriticalDamage"= 0.15, "SpiritSword" = 1, "SpiritFlow"= 4, "SweepingStrike" = 1, \
        				"MovingCharge"= 1, "TripleStrike" = 1, "DoubleStrike" = 2, "Momentum" = 2, "Parry" = 2, "Deflection" = 2, "HybridStrike" = 1, "QuickCast" = 5, "ManaSteal" = 25, "ManaGeneration" = 5)
        Finisher = "/obj/Skills/Queue/Finisher/Seiken_Gradalpha"
        verb/Alpha_inForce()
            set hidden=1
            src.Trigger(usr)
    Ulforce
        SignatureTechnique = 4
        StyleActive="Ulforce"
        StyleSpd=3
        passives = list("HotHundred" = 1, "SweepingStrike"= 1, "Warping" = 3)
        Finisher = "/obj/Skills/Queue/Finisher/Shining_V_Force"
        verb/Ulforce()
            set hidden=1
            src.Trigger(usr)
    War_God
        SignatureTechnique = 4
        StyleActive="Kratos"
        StyleOff=1.5
        StyleStr=2
        StyleEnd=1.5
        Finisher="/obj/Skills/Queue/Finisher/The_Blade_Of_Chaos"
        passives = list("DisableGodKi" = 1, "EndlessNine"=0.25, "Deicide" = 10, "Rage" = 5, "Half-Sword" = 5, "Zornhau" = 5, "FavoredPrey" = "Everything", \
                        "Shearing" = 10, "Deflection" = 5, "Disarm" = 3,"Parry" = 5, "Momentum" = 5, "Hardening" = 5, \
                        "Secret Knives" = "GodSlayer", "Tossing" = 5, "Pressure" = 5, "Unnerve" = 5, "BladeFisting" = 1)
                        // either throw swords at them, or runes, depending on icon_state do a different effect
        verb/War_God()
            set hidden=1
            src.Trigger(usr)

