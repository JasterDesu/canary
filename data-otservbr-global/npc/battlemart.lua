local internalNpcName = "Battlemart"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 1020,
	lookHead = 57,
	lookBody = 113,
	lookLegs = 95,
	lookFeet = 113,
	lookAddons = 3,
}

npcConfig.flags = {
	floorchange = false,
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

local itemsTable = {
	["amulets"] = {
		{ itemName = "gill necklace", clientId = 16108, buy = 80000 },
		{ itemName = "glacier amulet", clientId = 815, buy = 6000 },
		{ itemName = "leviathan's amulet", clientId = 9303, buy = 9000 },
		{ itemName = "magma amulet", clientId = 817, buy = 6000 },
		{ itemName = "lightning pendant", clientId = 816, buy = 15000 },
		{ itemName = "prismatic necklace", clientId = 16113, buy = 150000 },
		{ itemName = "sacred tree amulet", clientId = 9302, buy = 9000 },
		{ itemName = "shockwave amulet", clientId = 9304, buy = 9000 },
		{ itemName = "stone skin amulet", clientId = 3081, buy = 5000 },
		{ itemName = "collar of blue plasma", clientId = 23542, buy = 12000 },
		{ itemName = "collar of green plasma", clientId = 23543, buy = 12000 },
		{ itemName = "collar of red plasma", clientId = 23544, buy = 12000 },
		{ itemName = "terra amulet", clientId = 814, buy = 15000 },
	},
	["rings"] = {
		{ itemName = "life ring", clientId = 3052, buy = 900 },
		{ itemName = "might ring", clientId = 3048, buy = 5000 },
		{ itemName = "ring of blue plasma", clientId = 23529, buy = 18000 },
		{ itemName = "ring of green plasma", clientId = 23531, buy = 18000 },
		{ itemName = "ring of healing", clientId = 3098, buy = 2000 },
		{ itemName = "prismatic ring", clientId = 16114, buy = 100000 },
		{ itemName = "ring of red plasma", clientId = 23533, buy = 18000 },
		{ itemName = "stealth ring", clientId = 3049, buy = 5000 },
		{ itemName = "time ring", clientId = 3053, buy = 2000 },
		{ itemName = "dwarven ring", clientId = 3097, buy = 2000 },
		{ itemName = "energy ring", clientId = 3051, buy = 2000 },
	},
}

local function creatureSayCallback(npc, player, type, message)
	local formattedCategoryNames = {}
	for categoryName, _ in pairs(itemsTable) do
		table.insert(formattedCategoryNames, "{" .. categoryName .. "}")
	end

	local categoryTable = itemsTable[message:lower()]
	if MsgContains(message, "shop options") then
		npcHandler:say("I sell a selection of " .. table.concat(formattedCategoryNames, ", "), npc, player)
	elseif categoryTable then
		npcHandler:say("Here are the items for the category " .. message, npc, player)
		npc:openShopWindowTable(player, categoryTable)
	end
end

npcHandler:setMessage(MESSAGE_GREET, "It is good to see you. I'm always at your {shop options}")
npcHandler:setMessage(MESSAGE_FAREWELL, "Farewell, |PLAYERNAME|, I'll be here if you need me again.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Come back soon!")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

-- On buy npc shop message
npcType.onBuyItem = function(npc, player, itemId, subType, amount, ignore, inBackpacks, totalCost)
	npc:sellItem(player, itemId, amount, subType, 0, ignore, inBackpacks)
end
-- On sell npc shop message
npcType.onSellItem = function(npc, player, itemId, subtype, amount, ignore, name, totalCost)
	player:sendTextMessage(MESSAGE_INFO_DESCR, string.format("Sold %ix %s for %i gold.", amount, name, totalCost))
end
-- On check npc shop message (look item)
npcType.onCheckItem = function(npc, player, clientId, subType) end

npcType:register(npcConfig)
