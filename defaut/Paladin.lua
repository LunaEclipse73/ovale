Ovale.defaut["PALADIN"] = 
[[
Define(AVENGERSSHIELD 31935)
Define(AVENGINGWRATH 31884)
	SpellInfo(AVENGINGWRATH cd=180)
Define(CONSECRATE 26573)
	SpellInfo(CONSECRATE cd=8)
Define(CRUSADERSTRIKE 35395)
	SpellInfo(CRUSADERSTRIKE cd=4)
Define(DIVINEPLEA 54428)
	SpellInfo(DIVINEPLEA cd=60)
	SpellAddBuff(DIVINEPLEA DIVINEPLEA=15)
Define(DIVINEPROTECTION 498)
Define(DIVINESTORM 53385)
Define(EXORCISM 879)
	SpellAddBuff(EXORCISM THEARTOFWAR=0)
Define(HAMMEROFWRATH 24275)
	SpellInfo(HAMMEROFWRATH cd=6)
Define(HAMMEROFTHERIGHTEOUS 53595)
	SpellInfo(HAMMEROFTHERIGHTEOUS cd=6)
Define(HOLYSHOCK 20473)
	SpellInfo(HOLYSHOCK cd=6)
Define(HOLYWRATH 2812)
	SpellInfo(HOLYWRATH cd=30)
Define(INQUISITION 84963)
Define(JUDGEMENT 20271)
Define(SEALRIGHTEOUSNESS 20154)
	SpellAddBuff(SEALRIGHTEOUSNESS SEALRIGHTEOUSNESS=1800)
Define(SEALOFTRUTH 31801)
	SpellAddBuff(SEALOFTRUTH SEALOFTRUTH=1800)
Define(SHIELDOFTHERIGHTEOUS 53600)
	SpellInfo(SHIELDOFTHERIGHTEOUS cd=6)
Define(TEMPLARSVERDICT 85256)
Define(ZEALOTRY 85696)

#Buff
Define(THEARTOFWAR 59578)

AddCheckBox(aoe L(AOE))

AddIcon help=main mastery=2
{
	unless InCombat() if BuffExpires(SEALRIGHTEOUSNESS 400) and BuffExpires(SEALOFTRUTH 400) Spell(SEALOFTRUTH)
	
	if HolyPower(more 2) Spell(SHIELDOFTHERIGHTEOUS)
	Spell(JUDGEMENT)
	Spell(AVENGERSSHIELD)
	Spell(HAMMEROFTHERIGHTEOUS)
	if CheckBoxOn(aoe)
	{
		Spell(CONSECRATE)
		Spell(HOLYWRATH)
	}
}

AddIcon help=cd mastery=2
{
	Spell(AVENGINGWRATH)
	Spell(DIVINEPROTECTION)
    Item(Trinket0Slot usable=1)
    Item(Trinket1Slot usable=1)
}

AddIcon help=main mastery=3
{
	unless InCombat()
	{
		if BuffExpires(SEALRIGHTEOUSNESS 400) and BuffExpires(SEALOFTRUTH 400) Spell(SEALOFTRUTH)
	}
    
	if HolyPower(more 2) Spell(ZEALOTRY)
    if HolyPower(more 0) and BuffExpires(INQUISITION) Spell(INQUISITION)
	if CheckBoxOff(aoe) and HolyPower(more 2) Spell(TEMPLARSVERDICT)
	if CheckBoxOn(aoe) and HolyPower(more 2) Spell(DIVINESTORM)
	if BuffPresent(THEARTOFWAR) Spell(EXORCISM)
	if TargetLifePercent(less 20) or BuffPresent(AVENGINGWRATH) Spell(HAMMEROFWRATH)
	Spell(JUDGEMENT)
	Spell(CRUSADERSTRIKE)
	if CheckBoxOn(aoe) Spell(CONSECRATE)
	if CheckBoxOn(aoe) Spell(HOLYWRATH)
}

AddIcon help=cd mastery=3
{
	Spell(AVENGINGWRATH)
    Item(Trinket0Slot usable=1)
    Item(Trinket1Slot usable=1)
}
]]
