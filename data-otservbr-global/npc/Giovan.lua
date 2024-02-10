local internalNpcName = "Giovan"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 1680,
	lookHead = 115,
	lookBody = 48,
	lookLegs = 48,
	lookFeet = 46,
	lookAddons = 3
}

npcConfig.flags = {
	floorchange = false
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end

local function creatureSayCallback(npc, creature, type, message)
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Seja bem vindo, |PLAYERNAME|!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Fallow, |PLAYERNAME|, vai pela sombra.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Volte sempre!")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Aqui esta")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

npcConfig.currency = 22720

npcConfig.shop = {
	--Eldritch
	{ name = "Eldritch Bow", clientId = 36664, sell = 1 },
	{ name = "Eldritch Breeches", clientId = 36665, sell = 1 },
	{ name = "Eldritch Claymore", clientId = 36657, sell = 1 },
	{ name = "Eldritch Cowl", clientId = 36670, sell = 1 },
	{ name = "Eldritch Cuirass", clientId = 36663, sell = 1 },
	{ name = "Eldritch Folio", clientId = 36672	, sell = 1 },
	{ name = "Eldritch Greataxe", clientId = 36661, sell = 1 },
	{ name = "Eldritch Hood", clientId = 36671, sell = 1 },
	{ name = "Eldritch Quiver", clientId = 36666, sell = 1 },
	{ name = "Eldritch Rod", clientId = 36674, sell = 1 },
	{ name = "Eldritch Shield", clientId = 36656, sell = 1 },
	{ name = "Eldritch Tome", clientId = 36673, sell = 1 },
	{ name = "Eldritch Wand", clientId = 36668, sell = 1 },
	{ name = "Eldritch Warmace", clientId = 36659, sell = 1 },
	{ name = "Gilded Eldritch Bow", clientId = 36665, sell = 1 },
	{ name = "Gilded Eldritch Claymore", clientId = 36658, sell = 1 },
	{ name = "Gilded Eldritch Greataxe", clientId = 36662, sell = 1 },
	{ name = "Gilded Eldritch Rod", clientId = 36675, sell = 1 },
	{ name = "Gilded Eldritch Wand", clientId = 36669, sell = 1 },
	{ name = "Gilded Eldritch Warmace", clientId = 36660, sell = 1 },
    -- Jungle
	{ name = "Jungle Bow", clientId = 35518, sell = 1 },
	{ name = "Jungle Flail", clientId = 35514, sell = 1 },
	{ name = "Jungle Quiver", clientId = 35524, sell = 1 },
	{ name = "Jungle Rod", clientId = 35521, sell = 1 },
	{ name = "Jungle Wand", clientId = 35522, sell = 1 },
	{ name = "Bast Legs", clientId = 35517, sell = 1 },
	{ name = "Exotic Legs", clientId = 35516, sell = 1 },
	{ name = "Make-Do Boots", clientId = 35520, sell = 1 },
	{ name = "Makeshift Boots", clientId = 35519, sell = 1 },
	{ name = "Exotic Amulet", clientId = 35523, sell = 1 },
	{ name = "Throwing Axe", clientId = 35515, sell = 1 },
    -- Lion
	{ name = "Lion Amulet", clientId = 34158, sell = 1 },
	{ name = "Lion Spangenhelm", clientId = 34156, sell = 2 },
	{ name = "Lion Plate", clientId = 34157, sell = 2 },
	{ name = "Lion Rod", clientId = 34151, sell = 2 },
	{ name = "Lion Wand", clientId = 34152, sell = 2 },
	{ name = "Lion Longsword", clientId = 34155, sell = 2 },
	{ name = "Lion Hammer", clientId = 34254, sell = 2 },
	{ name = "Lion Axe", clientId = 34253, sell = 2 },
	{ name = "Lion Longbow", clientId = 34150, sell = 2 },
	{ name = "Lion Shield", clientId = 34154, sell = 2 },
	{ name = "Lion Spellbook", clientId = 34153, sell = 2 },
    -- Cobra
	{ name = "Cobra Amulet", clientId = 31631, sell = 2 },
	{ name = "Cobra Axe", clientId = 30396, sell = 2 },
	{ name = "Cobra Boots", clientId = 30394, sell = 2 },
	{ name = "Cobra Club", clientId = 30395, sell = 2 },
	{ name = "Cobra Crossbow", clientId = 30393, sell = 2 },
	{ name = "Cobra Hood", clientId = 30397, sell = 2 },
	{ name = "Cobra Rod", clientId = 30400, sell = 2 },
	{ name = "Cobra Wand", clientId = 30399, sell = 2 },
	{ name = "Cobra Sword", clientId = 30398, sell = 2 },
    -- Mutated
	{ name = "Antler-Horn Helmet", clientId = 40588, sell = 2 },
	{ name = "Alchemist's Boots", clientId = 40592, sell = 2 },
	{ name = "Alchemist's Notepad", clientId = 40594, sell = 2 },
	{ name = "Mutant Bone Boots", clientId = 40595, sell = 2 },
	{ name = "Mutant Bone Kilt", clientId = 40593, sell = 2 },
	{ name = "Mutated Skin Armor", clientId = 40591, sell = 2 },
	{ name = "Mutated Skin Legs", clientId = 40590, sell = 2 },
	{ name = "Stitched Mutant Hide Legs", clientId = 40589, sell = 2 },
    -- Naga
	{ name = "Turtle Amulet", clientId = 40589, sell = 2 },
	{ name = "Naga Sword", clientId = 39155, sell = 3 },
	{ name = "Naga Axe", clientId = 39156, sell = 3 },
	{ name = "Naga Club", clientId = 39157, sell = 3 },
	{ name = "Frostflower Boots", clientId = 39158, sell = 3 },
	{ name = "Naga Crossbow", clientId = 39159, sell = 3 },
	{ name = "Naga Quiver", clientId = 39160, sell = 3 },
	{ name = "Feverbloom Boots", clientId = 39161, sell = 3 },
	{ name = "Naga Wand", clientId = 39162, sell = 3 },
	{ name = "Naga Rod", clientId = 39163, sell = 3 },
	{ name = "Dawnfire Sherwani", clientId = 39164, sell = 3 },
	{ name = "Midnight Tunic", clientId = 39165, sell = 3 },
	{ name = "Dawnfire Pantaloons", clientId = 39166, sell = 3 },
	{ name = "Midnight Sarong", clientId = 39167, sell = 3 },
    -- Falcon
	{ name = "Falcon Circlet", clientId = 28714, sell = 3 },
	{ name = "Falcon Coif", clientId = 28715, sell = 3 },
	{ name = "Falcon Rod", clientId = 28716, sell = 3 },
	{ name = "Falcon Wand", clientId = 28717, sell = 3 },
	{ name = "Falcon Bow", clientId = 28718, sell = 3 },
	{ name = "Falcon Plate", clientId = 28719, sell = 3 },
	{ name = "Falcon Greaves", clientId = 28720, sell = 3 },
	{ name = "Falcon Shield", clientId = 28721, sell = 3 },
	{ name = "Falcon Longsword", clientId = 28723, sell = 3 },
	{ name = "Falcon Battleaxe", clientId = 28724, sell = 3 },
	{ name = "Falcon Mace", clientId = 28725, sell = 3 },
    -- Soul
	{ name = "Soulcutter", clientId = 34082, sell = 4 },
	{ name = "Soulshredder", clientId = 34083, sell = 4 },
	{ name = "Soulbiter", clientId = 34084, sell = 4 },
	{ name = "Souleater", clientId = 34085, sell = 4 },
	{ name = "Soulcrusher", clientId = 34086, sell = 4 },
	{ name = "Soulmaimer", clientId = 34087, sell = 4 },
	{ name = "Soulbleeder", clientId = 34088, sell = 4 },
	{ name = "Soulpiercer", clientId = 34089, sell = 4 },
	{ name = "Soultainter", clientId = 34090, sell = 4 },
	{ name = "Soulhexer", clientId = 34091, sell = 4 },
	{ name = "Soulshanks", clientId = 34092, sell = 4 },
	{ name = "Soulstrider", clientId = 34093, sell = 4 },
	{ name = "Soulshell", clientId = 34094, sell = 4 },
	{ name = "Soulmantle", clientId = 34095, sell = 4 },
	{ name = "Soulshroud", clientId = 34096, sell = 4 },
	{ name = "Pair of Soulstalker", clientId = 34097, sell = 4 },
	{ name = "Pair of Soulwalker", clientId = 34098, sell = 4 },
	{ name = "Soulbastion", clientId = 34099, sell = 4 },
    -- Primal
	{ name = "Spiritthorn Armor", clientId = 39147, sell = 5 },
	{ name = "Spiritthorn Helmet", clientId = 39148, sell = 5 },
	{ name = "Alicorn Headguard", clientId = 39149, sell = 5 },
	{ name = "Alicorn Quiver", clientId = 39150, sell = 5 },
	{ name = "Arcanomancer Regalia", clientId = 39151, sell = 5 },
	{ name = "Arcanomancer Folio", clientId = 39152, sell = 5 },
	{ name = "Arboreal Crown", clientId = 39153, sell = 5 },
	{ name = "Arboreal Tome", clientId = 39154, sell = 5 },

	{ name = "Spiritthorn Ring", clientId = 39179, sell = 4 },
	{ name = "Alicorn Ring", clientId = 39182, sell = 4 },
	{ name = "Arcanomancer Sigil", clientId = 39185, sell = 4 },
	{ name = "Arboreal Ring", clientId = 39188, sell = 4 },

    --Bags
    { name = "Bag you desire", clientId = 34109, buy = 20 },
    { name = "Primal Bag", clientId = 39546, buy = 30 },
    { name = "Bag you covet", clientId = 43895, buy = 80 },
	
}

-- On buy npc shop message
npcType.onBuyItem = function(npc, player, itemId, subType, amount, ignore, inBackpacks, totalCost)
	npc:sellItem(player, itemId, amount, subType, 0, ignore, inBackpacks)
end
-- On sell npc shop message
npcType.onSellItem = function(npc, player, itemId, subtype, amount, ignore, name, totalCost)
	player:sendTextMessage(MESSAGE_INFO_DESCR, string.format("Sold %ix %s for %i gold.", amount, name, totalCost))
end
-- On check npc shop message (look item)
npcType.onCheckItem = function(npc, player, clientId, subType)
end

npcType:register(npcConfig)
