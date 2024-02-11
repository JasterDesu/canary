local mountId = 184 -- ID da montaria que você deseja conceder
local message = "You receive the permission to ride a Singeing Steed"

local requiredItems = {
	{ itemId = 36938, count = 4 }, -- ID dos Fiery Horseshoes
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

jadeMount:id(36938)
jadeMount:register()
