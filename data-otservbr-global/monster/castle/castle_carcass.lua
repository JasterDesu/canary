local mType = Game.createMonsterType("Castle Carcass")
local monster = {}

monster.description = "a castle carcass"
monster.experience = 58600
monster.outfit = {
	lookType = 1659,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 2550

monster.health = 78700
monster.maxHealth = 78700
monster.race = "blood"
monster.corpse = 43836
monster.speed = 130
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 15
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 10,
	random = 10,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 80,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = true
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Munch munch munch!", yell = false}
}

monster.loot = {
	{ name = "crystal coin", chance = 9000, maxCount = 6 },
	{ name = "lichen gobbler", chance = 12369, maxCount = 1 },
	{ name = "small emerald", chance = 12859, maxCount = 1 },
	{ id = 3039, chance = 9808, maxCount = 1 }, -- red gem
	{ name = "skull staff", chance = 12316, maxCount = 1 },
	{ name = "bone shield", chance = 6752, maxCount = 1 },
	{ name = "yellow gem", chance = 8634, maxCount = 1 },
	{ name = "rotten roots", chance = 13133, maxCount = 1 },
	{ name = "decayed finger bone", chance = 6964, maxCount = 1 },
	{ name = "ultimate health potion", chance = 10285, maxCount = 2 },
	{ name = "bloody edge", chance = 12270, maxCount = 1 },
	{ name = "spellbook of warding", chance = 5084, maxCount = 1 },
	{ id = 43895, chance = 3, maxCount = 1}, -- bag you cover
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -300, maxDamage = -2400},
	{name ="devovorga curse", interval = 2000, chance = 15, minDamage = -900, maxDamage = -3350, target = false},
	-- poison
	{name ="condition", type = CONDITION_POISON, interval = 2000, chance = 10, minDamage = -500, maxDamage = -2200, length = 8, spread = 3, effect = CONST_ME_PLANTATTACK, target = false},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_LIFEDRAIN, minDamage = -630, maxDamage = -3260, length = 5, spread = 3, effect = CONST_ME_SLASH, target = false},
	-- poison
	{name ="condition", type = CONDITION_POISON, interval = 2000, chance = 10, minDamage = -400, maxDamage = -3640, range = 7, radius = 3, effect = CONST_ME_HITBYPOISON, target = false}
}

monster.defenses = {
	defense = 60,
	armor = 110,
    mitigation = 3,
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 225, maxDamage = 380, effect = CONST_ME_MAGIC_BLUE, target = false},
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 25},
	{type = COMBAT_EARTHDAMAGE, percent = -80},
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 35},
	{type = COMBAT_HOLYDAMAGE , percent = -25},
	{type = COMBAT_DEATHDAMAGE , percent = 40}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
