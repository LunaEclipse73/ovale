Ovale.defaut["WARLOCK"]=
[[
Define(BANEOFAGONY 980)
	SpellAddTargetDebuff(BANEOFAGONY BANEOFAGONY=24)
Define(BANEOFDOOM 603)
	SpellAddTargetDebuff(BANEOFDOOM BANEOFDOOM=60)
Define(BANEOFHAVOC 80240)
Define(CHAOSBOLT 50796)
	SpellInfo(CHAOSBOLT cd=12)
Define(CONFLAGRATE 17962)
	SpellInfo(CONFLAGRATE cd=10)
Define(CORRUPTION 172)
	SpellAddTargetDebuff(CORRUPTION CORRUPTION=18)
Define(CURSEELEMENTS 1490)
	SpellAddTargetDebuff(CURSEELEMENTS CURSEELEMENTS=300)
Define(CURSETONGUES 1714)
Define(CURSEWEAKNESS 702)
Define(DARKINTENT 80398)
Define(DEATHCOIL 6789)
Define(DEMONARMOR 687)
Define(DEMONICEMPOWERMENT 47193)
Define(DEMONSOUL 77801)
Define(DRAINLIFE 689)
Define(DRAINSOUL 1120)
	SpellInfo(DRAINSOUL canStopChannelling=5)
Define(FELARMOR 28176)
Define(FELFLAME 77799)
Define(HANDOFGULDAN 71521)
	SpellInfo(HANDOFGULDAN cd=12)
Define(HAUNT 48181)
	SpellInfo(HAUNT cd=8)
Define(IMMOLATE 348)
	SpellAddTargetDebuff(IMMOLATE IMMOLATE=15)
	SpellAddBuff(IMMOLATE MOLTENCORE=-1)
Define(INCINERATE 29722)
	SpellAddBuff(INCINERATE MOLTENCORE=-1)
Define(LIFETAP 1454)
Define(METAMORPHOSIS 47241)
Define(SEARINGPAIN 5676)
Define(SEEDOFCORRUPTION 27243)
Define(SHADOWBOLT 686)
	SpellAddTargetDebuff(SHADOWBOLT SHADOWEMBRACE=12)
Define(SHADOWBURN 17877)
Define(SOULFIRE 6353)
Define(SOULBURN 74434)
Define(SUMMONFELGUARD 18540)
Define(UNSTABLEAFFLICTION 30108)
	SpellAddTargetDebuff(UNSTABLEAFFLICTION UNSTABLEAFFLICTION=15)


#Buff
Define(SHADOWEMBRACE 32386)
Define(DECIMATION 63167)
Define(MOLTENCORE 71165)
Define(EMPOWEREDIMP 47221)

#Talent	
Define(TALENTSHADOWEMBRACE 1763)
	
AddListItem(curse elements SpellName(CURSEELEMENTS))
AddListItem(curse tongues SpellName(CURSETONGUES))
AddListItem(curse weakness SpellName(CURSEWEAKNESS))
AddListItem(bane agony SpellName(BANEOFAGONY))
AddListItem(bane doom SpellName(BANEOFDOOM))
AddListItem(bane havoc SpellName(BANEOFHAVOC))

ScoreSpells(CURSEELEMENTS SHADOWBOLT HAUNT UNSTABLEAFFLICTION IMMOLATE CONFLAGRATE BANEOFDOOM CURSETONGUES CURSEWEAKNESS
	BANEOFAGONY CORRUPTION SOULFIRE DRAINSOUL INCINERATE SHADOWBOLT CHAOSBOLT)

AddIcon help=main mastery=1
{
	if InCombat(no) and BuffExpires(FELARMOR 400) Spell(FELARMOR)

	if List(curse elements) and TargetDebuffExpires(CURSEELEMENTS 2) and TargetDeadIn(more 8) Spell(CURSEELEMENTS)
	if List(curse weakness) and TargetDebuffExpires(CURSEWEAKNESS 2) and TargetDeadIn(more 8) Spell(CURSEWEAKNESS)

	if TargetDebuffExpires(HAUNT 1.5 mine=1) Spell(HAUNT)
	if TalentPoints(TALENTSHADOWEMBRACE more 0) and TargetDebuffExpires(SHADOWEMBRACE 0) Spell(SHADOWBOLT)
	if TargetDebuffExpires(UNSTABLEAFFLICTION 1.5 mine=1 haste=spell) and TargetDeadIn(more 8) Spell(UNSTABLEAFFLICTION)
	if TargetDebuffExpires(CORRUPTION 0 mine=1) and TargetDebuffExpires(SEEDOFCORRUPTION 0 mine=1) and TargetDeadIn(more 9) Spell(CORRUPTION)
	if TargetDebuffExpires(BANEOFDOOM 0 mine=1) and TargetDebuffExpires(BANEOFAGONY 0 mine=1)
	{
		if List(curse doom) and TargetDeadIn(more 20) Spell(BANEOFDOOM)
		if TargetDeadIn(more 10) Spell(BANEOFAGONY)
	}
	if TargetLifePercent(less 25) Spell(DRAINSOUL)
	Spell(SHADOWBOLT)
}

AddIcon help=cd mastery=1
{
	Spell(SUMMONFELGUARD)
	Spell(SOULBURN usable=1)
	Item(Trinket0Slot usable=1)
	Item(Trinket1Slot usable=1)
}

AddIcon help=main mastery=2
{	
	if InCombat(no) and BuffExpires(FELARMOR 400) Spell(FELARMOR)

	if List(curse elements) and TargetDebuffExpires(CURSEELEMENTS 2) and TargetDeadIn(more 8) Spell(CURSEELEMENTS)
	if List(curse weakness) and TargetDebuffExpires(CURSEWEAKNESS 2) and TargetDeadIn(more 8) Spell(CURSEWEAKNESS)

	if TargetDebuffExpires(IMMOLATE 2 mine=1 haste=spell) and TargetDeadIn(more 8) Spell(IMMOLATE)
	if TargetDebuffExpires(CORRUPTION 0 mine=1) and TargetDebuffExpires(SEEDOFCORRUPTION 0 mine=1) and TargetDeadIn(more 9) Spell(CORRUPTION)
	if TargetDebuffExpires(BANEOFDOOM 0 mine=1) and TargetDebuffExpires(BANEOFAGONY 0 mine=1)
	{
		if List(curse doom) and TargetDeadIn(more 60) Spell(BANEOFDOOM)
		if TargetDeadIn(more 10) Spell(BANEOFAGONY)
	}
	Spell(HANDOFGULDAN)
	if BuffPresent(DECIMATION) Spell(SOULFIRE)
	if BuffPresent(MOLTENCORE) Spell(INCINERATE)
	Spell(SHADOWBOLT)
}

AddIcon help=cd mastery=2
{
	Spell(METAMORPHOSIS)
	Spell(DEMONICEMPOWERMENT)
	Spell(SUMMONFELGUARD)
	Spell(SOULBURN usable=1)
	Item(Trinket0Slot usable=1)
	Item(Trinket1Slot usable=1)
}
	
AddIcon help=main mastery=3
{
	if InCombat(no) and BuffExpires(FELARMOR 400) Spell(FELARMOR)
	
	if List(curse elements) and TargetDebuffExpires(CURSEELEMENTS 2) and TargetDeadIn(more 8) Spell(CURSEELEMENTS)
	if List(curse weakness) and TargetDebuffExpires(CURSEWEAKNESS 2) and TargetDeadIn(more 8) Spell(CURSEWEAKNESS)

	if TargetDebuffPresent(IMMOLATE mine=1)	Spell(CONFLAGRATE)
	if TargetDebuffExpires(IMMOLATE 2 mine=1 haste=spell) and TargetDeadIn(more 8) Spell(IMMOLATE)
	if TargetDebuffExpires(CORRUPTION 0 mine=1) and TargetDebuffExpires(SEEDOFCORRUPTION 0 mine=1) and TargetDeadIn(more 9) Spell(CORRUPTION)
	if TargetDebuffExpires(BANEOFDOOM 0 mine=1) and TargetDebuffExpires(BANEOFAGONY 0 mine=1)
	{
		if List(curse doom) and TargetDeadIn(more 60) Spell(BANEOFDOOM)
		if TargetDeadIn(more 10) unless List(cure havoc) Spell(BANEOFAGONY)
	}
	if BuffPresent(EMPOWEREDIMP) or BuffPresent(SOULBURN) Spell(SOULFIRE)
	Spell(CHAOSBOLT)
	Spell(INCINERATE)
}

AddIcon help=cd mastery=3
{
	Spell(SUMMONFELGUARD)
	Spell(SOULBURN usable=1)
	Item(Trinket0Slot usable=1)
	Item(Trinket1Slot usable=1)
}

]]
