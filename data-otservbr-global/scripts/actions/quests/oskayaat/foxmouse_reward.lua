local chayenneReward = Action()
function chayenneReward.onUse(player, item, fromPosition, itemEx, toPosition)
	if player:getStorageValue(Storage.Grimvale.foxmouserward) < 1 then
		local backpack = player:addItem(5949, 1)
		backpack:addItem(43901, 1)
		player:setStorageValue(Storage.Grimvale.foxmouserward, 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a beach backpack.")
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You already got your reward.")
	end
	return true
end

chayenneReward:aid(55033)
chayenneReward:register()
