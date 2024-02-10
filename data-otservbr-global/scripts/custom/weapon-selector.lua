-- Configuração das opções
local options = {
    {text = "Deepling Squelcher (Club)", itemId = 14250},
    {text = "Relic Sword (Sword)", itemId = 7383},
    {text = "Dragon Lance (Axe)", itemId = 3302}
}

local weapons = Action()
function weapons.onUse(player)
    local title = "Escolha um item"
    local message = "Selecione um item para receber:"
    local window = ModalWindow(1000, title, message)

    for _, option in ipairs(options) do
        window:addChoice(_, option.text)
    end

    window:addButton("Select", function(player, choice)
        local selectedOption = options[choice]
        local newItem = player:addItem(selectedOption.itemId, 1)

        if newItem then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Você recebeu um " .. newItem:getName())

            -- Remover o item original (ID 19154)
            local originalItem = player:getItemById(19154)
            if originalItem then
                originalItem:remove()
            end
        else
            player:sendTextMessage(MESSAGE_STATUS_SMALL, "Você não tem espaço suficiente no inventário.")
        end
    end)

    window:addButton("Close", function(player)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Cancelado.")
    end)

    window:setDefaultEnterButton(0) -- Botão "Select"
    window:setDefaultEscapeButton(1) -- Botão "Close"
    window:sendToPlayer(player)
end

weapons:id(19154)
weapons:register()
