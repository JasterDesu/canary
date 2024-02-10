local config = {
    actionId = 18562, -- on lever
    lever = {
        left = 21126,
        right = 21130
    },
    playItem = {
        itemId = 22723, -- item required to pull lever
        count = 1
    },
    rouletteOptions = {
        rareItemChance_broadcastThreshold = 1500,
        ignoredItems = {1617, 25717, 40323 }, -- if you have tables/counters/other items on the roulette tiles, add them here
        winEffects = {CONST_ANI_FIRE, CONST_ME_SOUND_YELLOW, CONST_ME_SOUND_PURPLE, CONST_ME_SOUND_BLUE, CONST_ME_SOUND_WHITE}, -- first effect needs to be distance effect
        effectDelay = 333,
        spinTime = {min = 8, max = 12}, -- seconds
        spinSlowdownRamping = 5,
        rouletteStorage = 48561 -- required storage to avoid player abuse (if they logout/die before roulette finishes.. they can spin again for free)
    },
    prizePool = {
        {itemId = 43895, count = {1, 1}, chance = 300}, -- {itemId = itemid, count = {min, max}, chance = chance/10000} (Bag you covet)
        {itemId = 5903, count = {1, 1}, chance = 800 }, -- Ferumbras' hat
        {itemId = 3393, count = {1, 1}, chance = 1000 }, -- amazon helmet
        {itemId = 3394, count = {1, 1}, chance = 1100 }, -- amazon armor
        {itemId = 3437, count = {1, 1}, chance = 1200 }, -- amazon shield
        {itemId = 3365, count = {1, 1}, chance = 1050 }, -- golden helmet     -- items with 'charges' and have 'showCharges' in items.xml will be given charges
        {itemId = 3553, count = {1, 1}, chance = 1260 }, -- bunnyslippers
        {itemId = 37610, count = {1, 1}, chance = 1260 }, -- green demon slippers
        {itemId = 37609, count = {1, 1}, chance = 1260 }, -- green demon helmet
        {itemId = 37608, count = {1, 1}, chance = 1260 }, -- green demon armor
        {itemId = 37607, count = {1, 1}, chance = 1260 }, -- green demon legs
        {itemId = 3390, count = {1, 1}, chance = 1260 }, -- horned helmet
        {itemId = 3368, count = {1, 1}, chance = 1260 }, -- winged helmet
        {itemId = 8058, count = {1, 1}, chance = 1260 }, -- molten plate
        {itemId = 8056, count = {1, 1}, chance = 1260 }, -- oceanborn
        {itemId = 19372, count = {1, 1}, chance = 1260 }, -- goo shell
        {itemId = 3402, count = {1, 1}, chance = 1260 }, -- native armor
        {itemId = 3363, count = {1, 1}, chance = 1260 }, -- dragon legs
        {itemId = 10200, count = {1, 1}, chance = 1260 }, -- crystal boots
        {itemId = 10201, count = {1, 1}, chance = 1260 }, -- dragon boots
        {itemId = 3296, count = {1, 1}, chance = 1260 }, -- warlord sword
        {itemId = 3278, count = {1, 1}, chance = 1260 }, -- magic long sword
        {itemId = 3427, count = {1, 1}, chance = 1260 }, -- rose shield
        {itemId = 3423, count = {1, 1}, chance = 660 }, -- blessed shield
        {itemId = 8038, count = {1, 1}, chance = 1260 }, -- robe of the ice
        {itemId = 43946, count = {1, 1}, chance = 13450 }, -- scroll abridged
        {itemId = 43947, count = {1, 1}, chance = 10450 }, -- scroll basic
        {itemId = 43948, count = {1, 1}, chance = 8450 }, -- scroll revised
        {itemId = 43949, count = {1, 1}, chance = 6450 }, -- scroll extended
        {itemId = 43950, count = {1, 1}, chance = 3450 }, -- scroll advanced
        {itemId = 12581, count = {1, 1}, chance = 25000 }, -- demon doll
        {itemId = 39693, count = {1, 1}, chance = 10000 }, -- 25 years backpack
        {itemId = 24395, count = {1, 1}, chance = 15000  },  -- birthday backpack
        {itemId = 14674, count = {1, 1}, chance = 20000  },  -- anniversary backpack
        {itemId = 39546, count = {1, 1}, chance = 1450  },  -- primal bag
        {itemId = 34109, count = {1, 1}, chance = 1800  },  -- bag you desire
        {itemId = 30317, count = {1, 1}, chance = 19000  },  -- Ferumbras puppet
        {itemId = 37536, count = {1, 1}, chance = 18000  },  -- changing backpack
        {itemId = 3043, count = {1, 30}, chance = 30000  },  -- crystal coin
        {itemId = 31633, count = {1, 1}, chance = 21000  },  -- teleport cube
        {itemId = 10346, count = {1, 1}, chance = 26000  },  -- santa backpack
        {itemId = 9598, count = {1, 1}, chance = 27000  },  -- canivete azul
        {itemId = 9596, count = {1, 1}, chance = 28000  },  -- canivete rosa
        {itemId = 9594, count = {1, 1}, chance = 29000  },  -- canivete vermelho
        {itemId = 16244, count = {1, 1}, chance = 20000  },  -- music box
        {itemId = 30171, count = {1, 1}, chance = 15000  },  -- purple tendril lantern
        {itemId = 30170, count = {1, 1}, chance = 15000  },  -- turquoise tendril lantern
        {itemId = 12509, count = {1, 1}, chance = 25000  },  -- scorpion sceptre
    
    },
    roulettePositions = { -- hard-coded to 7 positions.
        Position(1033, 970, 7),
        Position(1034, 970, 7),
        Position(1035, 970, 7),
        Position(1036, 970, 7), -- position 4 in this list is hard-coded to be the reward location, which is the item given to the player
        Position(1037, 970, 7),
        Position(1038, 970, 7),
        Position(1039, 970, 7),
    }
}

local chancedItems = {} -- used for broadcast. don't edit

local function resetLever(position)
    local lever = Tile(position):getItemById(config.lever.right)
    lever:transform(config.lever.left)
end

local function updateRoulette(newItemInfo)
    local positions = config.roulettePositions
    for i = #positions, 1, -1 do
        local item = Tile(positions[i]):getTopVisibleThing()
        if item and item:getId() ~= Tile(positions[i]):getGround():getId() and not table.contains(config.rouletteOptions.ignoredItems, item:getId()) then
            if i ~= 7 then
                item:moveTo(positions[i + 1])
            else
                item:remove()
            end
        end
    end
    if ItemType(newItemInfo.itemId):getCharges() then
        local item = Game.createItem(newItemInfo.itemId, 1, positions[1])
        item:setAttribute("charges", newItemInfo.count)
    else
        Game.createItem(newItemInfo.itemId, newItemInfo.count, positions[1])
    end
end

local function clearRoulette(newItemInfo)
    local positions = config.roulettePositions
    for i = #positions, 1, -1 do
        local item = Tile(positions[i]):getTopVisibleThing()
        if item and item:getId() ~= Tile(positions[i]):getGround():getId() and not table.contains(config.rouletteOptions.ignoredItems, item:getId()) then
            item:remove()
        end
        if newItemInfo == nil then
            positions[i]:sendMagicEffect(CONST_ME_POFF)
        else
            if ItemType(newItemInfo.itemId):getCharges() then
                local item = Game.createItem(newItemInfo.itemId, 1, positions[i])
                item:setAttribute("charges", newItemInfo.count)
            else
                Game.createItem(newItemInfo.itemId, newItemInfo.count, positions[i])
            end
        end
    end
end

local function chanceNewReward()
    local newItemInfo = {itemId = 0, count = 0}
    
    local rewardTable = {}
    while #rewardTable < 1 do
        for i = 1, #config.prizePool do
            if config.prizePool[i].chance >= math.random(10000) then
                rewardTable[#rewardTable + 1] = i
            end
        end
    end
    
    local rand = math.random(#rewardTable)
    newItemInfo.itemId = config.prizePool[rewardTable[rand]].itemId
    newItemInfo.count = math.random(config.prizePool[rewardTable[rand]].count[1], config.prizePool[rewardTable[rand]].count[2])
    chancedItems[#chancedItems + 1] = config.prizePool[rewardTable[rand]].chance
    
    return newItemInfo
end

local function initiateReward(leverPosition, effectCounter)
    if effectCounter < #config.rouletteOptions.winEffects then
        effectCounter = effectCounter + 1
        if effectCounter == 1 then
            config.roulettePositions[1]:sendDistanceEffect(config.roulettePositions[4], config.rouletteOptions.winEffects[1])
            config.roulettePositions[7]:sendDistanceEffect(config.roulettePositions[4], config.rouletteOptions.winEffects[1])
        else
            for i = 1, #config.roulettePositions do
                config.roulettePositions[i]:sendMagicEffect(config.rouletteOptions.winEffects[effectCounter])
            end
        end
        if effectCounter == 2 then
            local item = Tile(config.roulettePositions[4]):getTopVisibleThing()
            local newItemInfo = {itemId = item:getId(), count = item:getItemCount()}
            clearRoulette(newItemInfo)
        end
        addEvent(initiateReward, config.rouletteOptions.effectDelay, leverPosition, effectCounter)
        return
    end
    resetLever(leverPosition)
end

local function rewardPlayer(playerId, leverPosition)
    local player = Player(playerId)
    if not player then
        return
    end
    
    local item = Tile(config.roulettePositions[4]):getTopVisibleThing()

    -- Verifique se 'item' não é nulo antes de tentar acessar seus métodos
    if item then
        if ItemType(item:getId()):getCharges() then
            local addedItem = player:addItem(item:getId(), 1, true)
            addedItem:setAttribute("charges", item:getCharges())
        else
            player:addItem(item:getId(), item:getItemCount(), true)
        end

        player:setStorageValue(config.rouletteOptions.rouletteStorage, -1)
        if chancedItems[#chancedItems - 3] and chancedItems[#chancedItems - 3] <= config.rouletteOptions.rareItemChance_broadcastThreshold then
            Game.broadcastMessage("The player " .. player:getName() .. " has won " .. item:getName() .. " from the roulette!", MESSAGE_EVENT_ADVANCE)
        end
    else
        print("Error: 'item' is nil in rewardPlayer function.")
    end
end


local function roulette(playerId, leverPosition, spinTimeRemaining, spinDelay)
    local player = Player(playerId)
    if not player then
        resetLever(leverPosition)
        return
    end
    
    local newItemInfo = chanceNewReward()
    updateRoulette(newItemInfo)
    
    if spinTimeRemaining > 0 then
        spinDelay = spinDelay + config.rouletteOptions.spinSlowdownRamping
        addEvent(roulette, spinDelay, playerId, leverPosition, spinTimeRemaining - (spinDelay - config.rouletteOptions.spinSlowdownRamping), spinDelay)
        return
    end
    
    initiateReward(leverPosition, 0)
    rewardPlayer(playerId, leverPosition)
end

local casinoRoulette = Action()

function casinoRoulette.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if item:getId() == config.lever.right then
        player:sendTextMessage(MESSAGE_STATUS_SMALL, "Casino Roulette is currently in progress. Please wait.")
        return true
    end
    
    if player:getItemCount(config.playItem.itemId) < config.playItem.count then
        if player:getStorageValue(config.rouletteOptions.rouletteStorage) < 1 then
            player:sendTextMessage(MESSAGE_STATUS_SMALL, "Casino Roulette requires " .. config.playItem.count .. " " .. (ItemType(config.playItem.itemId):getName()) .. " to use.")
            return true
        end
        -- player:sendTextMessage(MESSAGE_STATUS_SMALL, "Free Spin being used due to a previous unforeseen error.")
    end
    
    item:transform(config.lever.right)
    clearRoulette()
    chancedItems = {}
    
    player:removeItem(config.playItem.itemId, config.playItem.count)
    player:setStorageValue(config.rouletteOptions.rouletteStorage, 1)
    
    local spinTimeRemaining = math.random((config.rouletteOptions.spinTime.min * 1000), (config.rouletteOptions.spinTime.max * 1000))
    roulette(player:getId(), toPosition, spinTimeRemaining, 100)
    return true
end

casinoRoulette:aid(config.actionId)
casinoRoulette:register()


local disableMovingItemsToRoulettePositions = MoveEvent()

disableMovingItemsToRoulettePositions.onAddItem = function(moveitem, tileitem, position, item, count, fromPosition, toPosition)
    for v, k in pairs(config.roulettePositions) do
        if toPosition == k then
            return false
        end
    end
    return true
end

disableMovingItemsToRoulettePositions:position(config.roulettePositions)
disableMovingItemsToRoulettePositions:register()