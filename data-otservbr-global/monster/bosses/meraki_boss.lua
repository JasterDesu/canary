local mType = Game.createMonsterType("Meraki Boss")
local monster = {}

monster.description = "Meraki Boss"
monster.experience = 800000
monster.outfit = {
	lookType = 676,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 3200000
monster.maxHealth = monster.health
monster.race = "undead"
monster.corpse = 36612
monster.speed = 300
monster.manaCost = 0

monster.changeTarget = {
	interval = 10000,
	chance = 20,
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
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 98,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true,
}

monster.light = {
	level = 0,
	color = 0,
}

monster.summon = {
	maxSummons = 4,
	summons = {
		{ name = "angry demon", chance = 20, interval = 4000, count = 4 },
	},
}
monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "The darkness will engulf your being!", yell = true },
	{ text = "Your fate is only suffering!", yell = true },
	{ text = "You are no match for my supremacy!", yell = true },
	{ text = "Your resistance is futile before me!", yell = true },
	{ text = "Feel the despair, for there is no escape!", yell = true },
}

monster.loot = {
	{ id = 3043, chance = 25000, maxCount = 550 }, -- crystal coin
	{ id = 39546, chance = 500, unique = true }, -- primal bag
	{ id = 34109, chance = 500, unique = true }, -- bag you desire
	{ id = 43895, chance = 200, unique = true }, -- bag you covet
	{ id = 30316, chance = 1320, unique = true }, -- surprise bag
	{ id = 3422, chance = 800, unique = true }, --  great shield
	{ id = 33893, chance = 5000, maxCount = 2 }, -- stamina refil 20h
	{ id = 37110, chance = 7000, maxCount = 3 }, -- exalted core
	{ id = 37109, chance = 12000, maxCount = 7 }, -- sliver
	{ id = 19082, chance = 3000, maxCount = 3 }, -- dust refiler
	{ id = 36724, chance = 7000, maxCount = 5 }, -- strike enchancment
	{ id = 44048, chance = 350, unique = true }, -- spiritual horseshoe
	{ id = 37338, chance = 10000, maxCount = 1 }, -- remove skull
	{ id = 36727, chance = 10000, maxCount = 2 }, -- wealth duplex - loot 2x
	{ id = 3555, chance = 800 }, -- golden boots
	{ name = "white gem", chance = 18000, maxcount = 10 },
	{ name = "violet gem", chance = 18000, maxcount = 15 },
	{ name = "yellow gem", chance = 25000, maxcount = 15 },
	{ name = "green gem", chance = 25000, maxcount = 15 },
	{ name = "blue gem", chance = 25000, maxcount = 15 },
	{ id = 3039, chance = 25000, maxcount = 15 }, --red gem
	{ name = "the skull of a beast", chance = 540 },
	{ name = "spectral horseshoe", chance = 760 },
	{ name = "spectral horse tack", chance = 760 },
	{ name = "spectral saddle", chance = 760 },
	{ name = "bracelet of strengthening", chance = 600 },
	{ id = 22773, chance = 1200 }, -- boots of homecoming
	{ name = "ghost chestplate", chance = 750 },
	{ id = 32619, chance = 750 }, -- pair of nightmare boots
	{ name = "phantasmal axe", chance = 780 },
	{ name = "fabulous legs", chance = 950 },
	{ name = "giant amethyst", chance = 9000, maxcount = 3 },
	{ name = "giant emerald", chance = 9000, maxcount = 3 },
	{ name = "giant ruby", chance = 9000, maxcount = 3 },
	{ name = "giant sapphire", chance = 9000, maxcount = 3 },
	{ name = "giant topaz", chance = 9000, maxcount = 3 },
	{ name = "hexagonal ruby", chance = 9000, maxcount = 3 },
	{ name = "small amethyst", chance = 9000, maxcount = 100 },
	{ name = "small emerald", chance = 9000, maxcount = 100 },
	{ name = "small ruby", chance = 9000, maxcount = 100 },
	{ name = "small sapphire", chance = 9000, maxcount = 100 },
	{ name = "small topaz", chance = 9000, maxcount = 100 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -5000 },
	{ name = "combat", interval = 3000, chance = 35, type = COMBAT_ICEDAMAGE, minDamage = -900, maxDamage = -1100, range = 7, radius = 7, shootEffect = CONST_ANI_ICE, effect = CONST_ME_ICEAREA, target = true },
	{ name = "combat", interval = 2000, chance = 13, type = COMBAT_DEATHDAMAGE, minDamage = -100, maxDamage = -1000, length = 8, spread = 3, effect = CONST_ME_POFF, target = false },
	{ name = "combat", interval = 2000, chance = 19, type = COMBAT_DEATHDAMAGE, minDamage = -100, maxDamage = -800, range = 7, radius = 6, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = true },
	{ name = "combat", interval = 3000, chance = 30, type = COMBAT_FIREDAMAGE, minDamage = -4000, maxDamage = -6000, length = 8, spread = 3, effect = CONST_ME_HITBYFIRE, target = false },
	{ name = "combat", interval = 2000, chance = 14, type = COMBAT_FIREDAMAGE, minDamage = -1600, maxDamage = -3400, length = 8, spread = 3, effect = CONST_ME_FIREAREA, target = false },
	{ name = "combat", interval = 2500, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -200, maxDamage = -480, range = 7, radius = 5, effect = CONST_ME_MAGIC_GREEN, target = false },
}

monster.defenses = {
	defense = 100,
	armor = 100,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 50 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 50 },
	{ type = COMBAT_EARTHDAMAGE, percent = 50 },
	{ type = COMBAT_FIREDAMAGE, percent = 50 },
	{ type = COMBAT_LIFEDRAIN, percent = 50 },
	{ type = COMBAT_MANADRAIN, percent = 50 },
	{ type = COMBAT_DROWNDAMAGE, percent = 50 },
	{ type = COMBAT_ICEDAMAGE, percent = 50 },
	{ type = COMBAT_HOLYDAMAGE, percent = 50 },
	{ type = COMBAT_DEATHDAMAGE, percent = 50 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType.onThink = function(monster, interval) end

mType.onAppear = function(monster, creature)
	if monster:getType():isRewardBoss() then
		monster:setReward(true)
	end
end

mType.onDisappear = function(monster, creature) end

mType.onMove = function(monster, creature, fromPosition, toPosition) end

mType.onSay = function(monster, creature, type, message) end

mType:register(monster)
