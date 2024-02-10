local config = {
	{ name = "Warzone 1,2,3", position = Position(33010, 31892, 9) },
	{ name = "Warzone 4,5,6", position = Position(33743, 32191, 14) },
	{ name = "Warzone 7,8,9", position = Position(32656, 31820, 10) },
}

local teleportwz = MoveEvent()
function teleportwz.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	local window = ModalWindow({
		title = "Teleport Hunts",
		message = "Hunts",
	})
	for i, info in pairs(config) do
		window:addChoice(string.format("%s", info.name), function(player, button, choice)
			if button.name ~= "Select" then
				return true
			end
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You were teleported to " .. info.name)
			player:teleportTo(info.position)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			return true
		end)
	end
	window:addButton("Select")
	window:addButton("Close")
	window:setDefaultEnterButton(0)
	window:setDefaultEscapeButton(1)
	window:sendToPlayer(player)
	return true
end
teleportwz:type("stepin")
teleportwz:aid(33320)
teleportwz:register()
