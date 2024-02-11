-- Constants for easier translation management
local TITLE = "Escolha um item"
local MESSAGE = "Selecione um item para receber:"
local INVALID_OPTION_MESSAGE = "Opção inválida."
local INVENTORY_FULL_MESSAGE = "Você não tem espaço suficiente no inventário."
local CANCELLED_MESSAGE = "Cancelado."

-- List of weapon options
local WEAPON_OPTIONS = {
	{ text = "Deepling Squelcher (Club)", itemId = 14250 },
	{ text = "Relic Sword (Sword)", itemId = 7383 },
	{ text = "Dragon Lance (Axe)", itemId = 3302 },
}

-- Helper function to send a text message
local function sendPlayerMessage(player, messageType, message)
	player:sendTextMessage(messageType, message)
end

-- Weapon action
local weapons = Action()
function weapons.onUse(player, item)
	local window = ModalWindow(100, TITLE, MESSAGE)

	for i, option in ipairs(WEAPON_OPTIONS) do
		window:addChoice(i, option.text)
	end

	window:addButton(1, "Select", ButtonStyle.Ok)
	window:addButton(0, "Close", ButtonStyle.Cancel)

	window:setDefaultEnterButton(1)
	window:setDefaultEscapeButton(0)

	window:sendToPlayer(player, function(modalWindow, player, buttonId, choiceId)
		if buttonId == 1 then -- Player selected "Select"
			local selectedOption = WEAPON_OPTIONS[choiceId]
			if not selectedOption then
				sendPlayerMessage(player, MESSAGE_STATUS_WARNING, INVALID_OPTION_MESSAGE)
				return true
			end

			local newItem = player:addItem(selectedOption.itemId, 1)
			if newItem then
				sendPlayerMessage(player, MESSAGE_EVENT_ADVANCE, "Você recebeu um " .. newItem:getName())
				item:remove(1)
			else
				sendPlayerMessage(player, MESSAGE_STATUS_WARNING, INVENTORY_FULL_MESSAGE)
			end
		end
	end)
end

weapons:id(19154)
weapons:register()