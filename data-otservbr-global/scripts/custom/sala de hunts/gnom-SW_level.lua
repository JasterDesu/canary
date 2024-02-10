local config = {
    minimumLevel = 300,  -- Nível mínimo necessário
    actionId = 44501    -- Substitua pelo valor da Action ID desejada
}

local leveltopass = MoveEvent()
function leveltopass.onStepIn(player, item, position, fromPosition)
    -- Verifique se o jogador atende ao requisito de nível
    if player:getLevel() < config.minimumLevel then
        player:sendTextMessage(MESSAGE_STATUS_SMALL, "Voce precisa ter level 300 para passar.")
        player:teleportTo(fromPosition, true)
        return false
    end

    return true
end

function onStepInWithActionId(player, item, position, fromPosition)
    -- Verifica se o item tem a Action ID correta
    if item:getActionId() == config.actionId then
        return onStepIn(player, item, position, fromPosition)
    else
        return false
    end
end


leveltopass:type("onStepIn")
leveltopass:aid(config.actionId)
leveltopass:register()
