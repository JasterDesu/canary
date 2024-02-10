local mType = Game.createMonsterType("Ichgahal")
local monster = {}

monster.description = "Ichgahal"
monster.experience = 180000
monster.outfit = {
	lookType = 1665,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 950000
monster.maxHealth = 950000
monster.race = "undead"
monster.corpse = 44018
monster.speed = 250
monster.manaCost = 0

monster.changeTarget = {
	interval = 10000,
	chance = 20,
}

monster.bosstiary = {
	bossRaceId = 2364,
	bossRace = RARITY_NEMESIS,
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

monster.events = {}

monster.light = {
	level = 0,
	color = 0,
}

monster.summon = {}

monster.voices = {}

monster.loot = {
	{ name = "crystal coin", chance = 18272, maxCount = 115 },
	{ name = "ultimate spirit potion", chance = 10102, maxCount = 153 },
	{ name = "mastermind potion", chance = 10863, maxCount = 45 },
	{ name = "yellow gem", chance = 11012, maxCount = 5 },
	{ name = "amber with a bug", chance = 12615, maxCount = 2 },
	{ name = "ultimate mana potion", chance = 5651, maxCount = 179 },
	{ name = "violet gem", chance = 13679, maxCount = 4 },
	{ name = "raw watermelon tourmaline", chance = 14945, maxCount = 2 },
	{ id = 3039, chance = 13910, maxCount = 1 }, -- red gem
	{ name = "supreme health potion", chance = 13839, maxCount = 37 },
	{ name = "berserk potion", chance = 11963, maxCount = 45 },
	{ name = "amber with a dragonfly", chance = 8987, maxCount = 1 },
	{ name = "gold ingot", chance = 9617, maxCount = 1 },
	{ name = "blue gem", chance = 9183, maxCount = 1 },
	{ name = "bullseye potion", chance = 10513, maxCount = 36 },
	{ name = "putrefactive figurine", chance = 14153, maxCount = 1 },
	{ name = "ichgahal's fungal infestation", chance = 12641, maxCount = 1 },
	{ name = "white gem", chance = 7988, maxCount = 3 },
	{ id = 43895, chance = 200 }, -- Bag you covet
	{ id = 44048, chance = 150 }, -- Spirit Horseshoe ( Spirit of Purity Mount x4 )
}

monster.attacks = {
	{ name = "melee", interval = 3000, chance = 100, minDamage = -1500, maxDamage = -2300 },
	{ name = "combat", interval = 1000, chance = 10, type = COMBAT_PHYSICALDAMAGE, minDamage = -700, maxDamage = -1000, length = 12, spread = 3, effect = 249, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_MANADRAIN, minDamage = -2600, maxDamage = -2300, length = 12, spread = 3, effect = 193, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -900, maxDamage = -1500, length = 6, spread = 2, effect = CONST_ME_FIREAREA, target = false },
	{ name = "speed", interval = 2000, chance = 35, speedChange = -600, radius = 8, effect = CONST_ME_MAGIC_RED, target = false, duration = 15000 },
}

monster.defenses = {
	defense = 105,
	armor = 105,
	{ name = "combat", interval = 3000, chance = 10, type = COMBAT_HEALING, minDamage = 800, maxDamage = 1200, effect = 236, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 15 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 15 },
	{ type = COMBAT_EARTHDAMAGE, percent = 15 },
	{ type = COMBAT_FIREDAMAGE, percent = 15 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 15 },
	{ type = COMBAT_HOLYDAMAGE, percent = 15 },
	{ type = COMBAT_DEATHDAMAGE, percent = 15 },
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
