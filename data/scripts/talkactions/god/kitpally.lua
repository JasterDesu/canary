local kitPally = TalkAction("/kitpally")

function kitPally.onSay(player, words, param)
	local itemsToGive = { 34089, 34088, 39149, 34094, 28720, 34098, 39150 }
	local givenItems = {}

	for _, itemId in ipairs(itemsToGive) do
		local itemCount = player:getItemCount(itemId)
		if itemCount == 0 then
			player:addItem(itemId, 1)
			table.insert(givenItems, itemId)
		end
	end

	if #givenItems > 0 then
		local itemList = table.concat(givenItems, ", ")
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You received the following items: " .. itemList)
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You already have all the items in the kit.")
	end
end

kitPally:groupType("god")
kitPally:register()
