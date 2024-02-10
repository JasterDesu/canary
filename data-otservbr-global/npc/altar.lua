local internalNpcName = "Altar"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 0
npcConfig.walkRadius = 0

npcConfig.outfit = {
    lookTypeEx = 43845,
    lookHead = 0,
    lookBody = 0,
    lookLegs = 0,
    lookFeet = 0,
    lookAddons = 0,
}

npcConfig.flags = {
    floorchange = false,
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
npcType.onCheckItem = function(npc, player, clientId, subType) end

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
    local player = Player(creature)
    local playerId = player:getId()

    if not npcHandler:checkInteraction(npc, creature) then
        return false
    end

    if MsgContains(message, "Kneel") and player:getStorageValue(Storage.quest.U13_20.RottenBlood.access.hunts) == 1 then
        npcHandler:say({ "Prepare your {offer} and cling to the sanctity of this place." }, npc, creature)
        npcHandler:setTopic(playerId, 1)
    elseif MsgContains(message, "Offer") and player:getStorageValue(Storage.quest.U13_20.RottenBlood.access.hunts) == 1 then
        npcHandler:say({ "Five tainted hearts and five darklight hearts drowned in a worldly wealth of 50000000 gold pieces for the righteous. Are you prepared?" }, npc, creature)
        npcHandler:setTopic(playerId, 2)
    elseif MsgContains(message, "yes") then
        if player:getItemById(3043, 500) and player:getItemById(43854, 5) and player:getItemById(43855, 5) then
            if player:addItem(43895, 1) then
                player:removeItem(3043, 500)
                player:removeItem(43854, 5)
                player:removeItem(43855, 5)
                npcHandler:say({ "Your sacrifice has been accepted, mortal. Embrace your reward!" }, npc, creature)
            end
        else
            npcHandler:say({ "Sorry, your sacrifice was not accepted." }, npc, creature)
        end
    end
end

npcHandler:setMessage(MESSAGE_GREET, "{Kneel} before the all-devouring power of blooded decay")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good luck!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good luck!")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

-- npcType registering the npcConfig table
npcType:register(npcConfig)
