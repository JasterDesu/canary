local mType = Game.createMonsterType("Rotten Castle-Maggot")
local monster = {}

monster.description = "a rotten castle-maggot"
monster.experience = 42625
monster.outfit = {
	lookType = 1655,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 2502

monster.health = 61100
monster.maxHealth = 61100
monster.race = "blood"
monster.corpse = 43820
monster.speed = 130
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 15,
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
	canWalkOnPoison = true,
}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Munch munch munch!", yell = false },
}

monster.loot = {
	{ name = "crystal coin", chance = 10340, maxCount = 4 },
	{ name = "small amethyst", chance = 7364, maxCount = 2 },
	{ name = "lichen gobbler", chance = 8391, maxCount = 1 },
	{ name = "rotten roots", chance = 11619, maxCount = 1 },
	{ name = "wood cape", chance = 14371, maxCount = 1 },
	{ id = 3039, chance = 5155, maxCount = 1 }, -- red gem
	{ name = "yellow gem", chance = 9564, maxCount = 1 },
	{ name = "blooded worm", chance = 5096, maxCount = 1 },
	{ id = 43895, chance = 3, maxCount = 1 }, -- bag you cover
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -300, maxDamage = -2400 },
	{ name = "devovorga curse", interval = 2000, chance = 15, minDamage = -900, maxDamage = -3350, target = false },
	{ name = "poisonfield", interval = 2000, chance = 20, radius = 4, target = false },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 10, minDamage = -500, maxDamage = -2200, length = 8, spread = 3, effect = CONST_ME_PLANTATTACK, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_LIFEDRAIN, minDamage = -630, maxDamage = -3260, length = 5, spread = 3, effect = CONST_ME_SLASH, target = false },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 10, minDamage = -400, maxDamage = -2640, range = 7, radius = 3, effect = CONST_ME_HITBYPOISON, target = false },
}

monster.defenses = {
	defense = 60,
	armor = 110,
	mitigation = 2,
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 225, maxDamage = 380, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 15 },
	{ type = COMBAT_EARTHDAMAGE, percent = -15 },
	{ type = COMBAT_FIREDAMAGE, percent = -10 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 40 },
	{ type = COMBAT_HOLYDAMAGE, percent = -15 },
	{ type = COMBAT_DEATHDAMAGE, percent = 30 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
