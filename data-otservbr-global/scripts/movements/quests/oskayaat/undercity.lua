local teleports = {
	[3204] = { position = Position(33041, 32950, 9) }, -- undercity entry
	[3205] = { position = Position(33028, 32951, 8) }, -- undercity exit
}

local UndercityTeleport = MoveEvent()

function UndercityTeleport.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end

	for index, value in pairs(teleports) do
		if item.actionid == index then
			player:teleportTo(value.position)
		end
	end
end

UndercityTeleport:type("stepin")

for index, value in pairs(teleports) do
	UndercityTeleport:aid(index)
end

UndercityTeleport:register()
