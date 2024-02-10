local mType = Game.createMonsterType("Vemiath")
local monster = {}

monster.description = "Vemiath"
monster.experience = 180000
monster.outfit = {
	lookType = 1665,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 950000
monster.maxHealth = 950000
monster.race = "undead"
monster.corpse = 44021
monster.speed = 250
monster.manaCost = 0

monster.changeTarget = {
	interval = 10000,
	chance = 20
}

monster.bosstiary = {
	bossRaceId = 2365,
	bossRace = RARITY_NEMESIS
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
	canWalkOnPoison = true
}

monster.events = {
}

monster.light = {
	level = 0,
	color = 0
}

monster.summon = {
}

monster.voices = {
}

monster.loot = {
	{ name = "crystal coin", chance = 15440, maxCount = 125 },
	{ name = "ultimate mana potion", chance = 10466, maxCount = 211 },
	{ name = "giant emerald", chance = 7784, maxCount = 1 },
	{ name = "supreme health potion", chance = 11274, maxCount = 179 },
	{ name = "yellow gem", chance = 9801, maxCount = 5 },
	{ name = "berserk potion", chance = 14543, maxCount = 45 },
	{ name = "blue gem", chance = 14534, maxCount = 5 },
	{ name = "green gem", chance = 12977, maxCount = 4 },
	{ name = "bullseye potion", chance = 11216, maxCount = 26 },
	{ name = "mastermind potion", chance = 12511, maxCount = 44 },
	{ name = "ultimate spirit potion", chance = 11505, maxCount = 25 },
	{ name = "giant topaz", chance = 13548, maxCount = 1 },
	{ name = "giant amethyst", chance = 5882, maxCount = 1 },
	{ name = "gold ingot", chance = 8519, maxCount = 1 },
	{ id = 3039, chance = 6871, maxCount = 1 }, -- red gem
	{ name = "dragon figurine", chance = 11815, maxCount = 1 },
	{ name = "raw watermelon tourmaline", chance = 7601, maxCount = 1 },
	{ name = "vemiath's infused basalt", chance = 9159, maxCount = 1 },
	{ name = "violet gem", chance = 14710, maxCount = 1 },
	{ id = 43895, chance = 200 }, -- Bag you covet
	{ id = 44048, chance = 150 }, -- Spirit Horseshoe ( Spirit of Purity Mount x4 )
}

monster.attacks = {
	{ name ="melee", interval = 2000, chance = 100, minDamage = -1500, maxDamage = -2500 },
	{ name ="combat", interval = 3000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -500, maxDamage = -2000, length = 10, spread = 3, effect = 244, target = false },
	{ name ="speed", interval = 2000, chance = 25, speedChange = -600, radius = 7, effect = CONST_ME_MAGIC_RED, target = false, duration = 15000 },
	{ name ="combat", interval = 2000, chance = 15, type = COMBAT_ICEDAMAGE, minDamage = -300, maxDamage = -2700, radius = 5, effect = 243, target = false },
	{ name ="combat", interval = 2000, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -500, maxDamage = -2800, length = 10, spread = 3, effect = CONST_ME_EXPLOSIONHIT, target = false },
	{ name ="combat", interval = 2000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -500, maxDamage = -2800, length = 8, spread = 3, effect = CONST_ME_FIREATTACK, target = false }
}

monster.defenses = {
	defense = 105,
	armor = 105,
	{ name ="combat", interval = 3000, chance = 10, type = COMBAT_HEALING, minDamage = 800, maxDamage = 1500, effect = 236, target = false },
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
	{ type = COMBAT_HOLYDAMAGE , percent = 15 },
	{ type = COMBAT_DEATHDAMAGE , percent = 15 }
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false }
}

mType.onThink = function(monster, interval)
end

mType.onAppear = function(monster, creature)
	if monster:getType():isRewardBoss() then
		monster:setReward(true)
	end
end

mType.onDisappear = function(monster, creature)
end

mType.onMove = function(monster, creature, fromPosition, toPosition)
end

mType.onSay = function(monster, creature, type, message)
end

mType:register(monster)