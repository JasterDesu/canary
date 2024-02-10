local mType = Game.createMonsterType("Hells")
local monster = {}

monster.description = "Hells"
monster.experience = 3000000
monster.outfit = {
	lookType = 1468,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 500000
monster.maxHealth = 500000
monster.race = "blood"
monster.corpse = 37704
monster.speed = 530
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 10,
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
	staticAttackChance = 70,
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

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Prepare for your demise!", yell = true },
	{ text = "You dare challenge my might?", yell = true },
	{ text = "Witness the power that you cannot comprehend!", yell = true },
	{ text = "Your feeble attempts are in vain!", yell = true },
	{ text = "I shall crush you like insects!", yell = true },
	{ text = "This battle will be your last!", yell = true },
	{ text = "Foolish mortal, you face your doom!", yell = true },
	{ text = "Bow before my overwhelming power!", yell = true },
	{ text = "Your destiny is sealed by your own foolishness!", yell = true },
}

monster.summons = {}

monster.loot = {
	{ id = 3043, chance = 60000, maxCount = 35 }, -- crystal coin
	{ id = 3035, chance = 100000, maxCount = 69 }, -- Platinum Coin
	{ id = 23373, chance = 40000, maxCount = 100 }, -- Ultimate Mana Potion
	{ id = 7643, chance = 30000, maxCount = 100 }, -- Ultimate Health Potion
	{ id = 23374, chance = 30000, maxCount = 100 }, -- Ultimate Spirit Potion
	{ id = 37810, chance = 10000 }, -- Morshabaal's Extract
	{ id = 33780, chance = 18000 }, -- Watermelon Tourmaline (Pear)
	{ id = 33779, chance = 18000 }, -- Watermelon Tourmaline (Slice)
	{ id = 32625, chance = 40000 }, -- Amber with a Dragonfly
	{ id = 30054, chance = 20000 }, -- Unicorn Figurine
	{ id = 31323, chance = 20000 }, -- Sea Horse Figurine
	{ id = 37611, chance = 10000 }, -- Morshabaal's Mask
	{ id = 30060, chance = 10000 }, -- Giant Emerald
	{ id = 14112, chance = 10000 }, -- Bar of Gold
	{ id = 37613, chance = 666 }, -- Morshabaal's Brain
	{ id = 37608, chance = 666 }, -- Green Demon Armor
	{ id = 37609, chance = 666 }, -- Green Demon Helmet
	{ id = 37607, chance = 666 }, -- Green Demon Legs
	{ id = 37610, chance = 666 }, -- Green Demon Slippers
	{ id = 30053, chance = 666 }, -- Dragon Figurine
	{ id = 3309, chance = 666 }, -- Thunder Hammer
}

monster.attacks = {
	{ name = "combat", interval = 10000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -5500, length = 8, spread = 0, effect = CONST_ME_GREYCHAIN },
	{ name = "combat", interval = 10000, chance = 15, type = COMBAT_ICEDAMAGE, minDamage = -4000, maxDamage = -8000, effect = CONST_ME_ICEATTACK },
	{ name = "melee", interval = 1000, chance = 100, skill = 200, attack = 250 },
	{ name = "combat", interval = 5000, chance = 7, type = COMBAT_MANADRAIN, minDamage = -100, maxDamage = -1000, range = 7, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_POFF, target = false },
	{ name = "combat", interval = 5000, chance = 13, type = COMBAT_LIFEDRAIN, minDamage = -400, maxDamage = -700, radius = 8, effect = CONST_ME_LOSEENERGY, target = false },
	{ name = "combat", interval = 5000, chance = 10, type = COMBAT_MANADRAIN, minDamage = -400, maxDamage = -700, radius = 8, effect = CONST_ME_MAGIC_GREEN, target = false },
	{ name = "combat", interval = 5000, chance = 34, type = COMBAT_FIREDAMAGE, minDamage = -100, maxDamage = -900, range = 7, radius = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true },
	{ name = "combat", interval = 5000, chance = 15, type = COMBAT_LIFEDRAIN, minDamage = -500, maxDamage = -850, length = 8, spread = 3, effect = CONST_ME_MAGIC_RED, target = false },
}

monster.defenses = {
	defense = 160,
	armor = 160,
	{ name = "combat", interval = 5000, chance = 15, type = COMBAT_HEALING, minDamage = 3000, maxDamage = 5000, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 5000, chance = 8, speedChange = 1901, effect = CONST_ME_MAGIC_RED, target = false, duration = 5000 },
	{ name = "invisible", interval = 5000, chance = 4, effect = CONST_ME_MAGIC_BLUE },
	{ name = "outfit", interval = 5000, chance = 2, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 7000, outfitItem = 2916 },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 5 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 5 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "drunk", condition = true },
	{ type = "bleed", condition = false },
}

mType.onAppear = function(monster, creature)
	if monster:getType():isRewardBoss() then
		monster:setReward(true)
	end
end

mType:register(monster)
