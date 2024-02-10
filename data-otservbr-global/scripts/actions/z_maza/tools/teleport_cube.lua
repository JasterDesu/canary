local config = {
    { name="DP Thais", position = Position(32342, 32223, 7) },
    { name="Hunts", position = Position(34334, 31009, 6) },
    { name="Towns", townsModal = true }, -- Add townsModal flag
    { name="Temple", position = Position(32369, 32241, 7) },
    { name="House", position = Position(32369, 32241, 7) },
    { name="Trainer", position = Position(1116, 1094, 7) },
    { name="Forge", position = Position(32208, 32287, 7) },
    { name="NPC Island", position = Position(994, 1030, 6) },
}

local towns = {
	{ name = "thais", position = Position(32369, 32241, 7)},
	{ name = "edron", position = Position(33217, 31814, 8)},
	{ name = "venore", position = Position(32957, 32076, 7)},
	{ name = "carlin", position = Position(32360, 31782, 7)},
	{ name = "darashia", position = Position(33213, 32454, 1)},
	{ name = "kazordoon", position = Position(32649, 31925, 11)},
	{ name = "rathleton", position = Position(33594, 31899, 6)},
	{ name = "roshamuul", position = Position(33513, 32363, 6)},
	{ name = "feyrist", position = Position(33491, 32221, 7)},
	{ name = "issavi", position = Position(33921, 31477, 5)},
	{ name = "ab'dendriel", position = Position(32732, 31634, 7)},
	{ name = "ankrahmun", position = Position(33194, 32853, 8)},
	{ name = "farmine", position = Position(33023, 31521, 11)},
	{ name = "liberty bay", position = Position(32317, 32826, 7)},
	{ name = "port hope", position = Position(32594, 32745, 7)},
	{ name = "svargrond", position = Position(32212, 31132, 7)},
	{ name = "yalahar", position = Position(32360, 31782, 7)},
	{ name = "gray beach", position = Position(33447, 31323, 9)},
	{ name = "krailos", position = Position(33657, 31665, 8)},
}

local teleportCube = Action()

function teleportCube.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if not Tile(player:getPosition()):hasFlag(TILESTATE_PROTECTIONZONE) and player:getCondition(CONDITION_INFIGHT, CONDITIONID_DEFAULT) or player:isPzLocked() then
        player:sendCancelMessage("You can't use this while in battle.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return true
    end

    local window = ModalWindow {
        title = "Teleport Modal",
        message = "Locations"
    }

    for i, info in pairs(config) do
        window:addChoice(string.format("%s", info.name), function(player, button, choice)
            if button.name ~= "Select" then
                return true
            end

            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You were teleported to " .. info.name)

            if info.name == "House" then
                houseModal(player)
            elseif info.townsModal then
                townsModal(player)
            else
                player:teleportTo(info.position)
            end

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

function houseModal(player)
	if not getTileInfo(getThingPos(player)).protection then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voce precisa estar em uma area de Protect Zone para usa-lo!")
    	return true
   	end
	
	if getHouseByPlayerGUID(getPlayerGUID(player)) then        
		doTeleportThing(player, getHouseEntry(getHouseByPlayerGUID(getPlayerGUID(player))))
		player:setStorageValue(stg, os.time() + tempo)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voce foi teleportado para sua casa!")                                                  
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Para usar essa opcao, primeiro compre uma casa. Diga !buyhouse em frente a porta da house.")
	end
end

function townsModal(player)
    local window = ModalWindow {
        title = "Teleport Towns Modal",
        message = "Towns"
    }

    for i, info in pairs(towns) do
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
end

teleportCube:id(31633)
teleportCube:register()
