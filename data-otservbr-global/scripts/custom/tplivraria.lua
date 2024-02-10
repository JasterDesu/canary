local config = {
	{ name = "Energy Session", position = Position(32427, 32750, 12) },
	{ name = "Earth Session", position = Position(32623, 32546, 12) },
	{ name = "Fire Session", position = Position(32596, 32755, 12) },
	{ name = "Ice Session", position = Position(32621, 32566, 14) },
}

local teleportGazer = MoveEvent()
function teleportGazer.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	local window = ModalWindow({
		title = "Teleport Library",
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
teleportGazer:type("stepin")
teleportGazer:aid(33316)
teleportGazer:register()
