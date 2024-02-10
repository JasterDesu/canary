local mountId = 213 -- ID da montaria que você deseja conceder
local message = "You receive the permission to ride a Spirit Of Purity"

local requiredItems = {
    {itemId = 44048, count = 4}, -- ID dos Spiritual Horseshoes
}

local jadeMount = Action()

function hasRequiredItems(player)
    for _, requiredItem in ipairs(requiredItems) do
        if player:getItemCount(requiredItem.itemId) < requiredItem.count then
            return false
        end
    end
    return true
end

function jadeMount.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if not player:hasMount(mountId) then
        if hasRequiredItems(player) then
            for _, requiredItem in ipairs(requiredItems) do
                player:removeItem(requiredItem.itemId, requiredItem.count)
            end
            player:addMount(mountId)
            player:say(message, TALKTYPE_MONSTER_SAY)
        end
    else
        player:sendCancelMessage("You already have this mount.")
    end
    return true
end

jadeMount:id(44048)
jadeMount:register()