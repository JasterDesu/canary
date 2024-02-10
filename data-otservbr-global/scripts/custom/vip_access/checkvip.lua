local config = {
    isVipRequired = true,  -- Define se apenas VIPs podem passar
    actionId = 49800    -- Substitua pelo valor da Action ID desejada
}

local viptopass = MoveEvent()
function viptopass.onStepIn(player, item, position, fromPosition)
    -- Verifica se é necessário ser VIP
    if config.isVipRequired and not player:isVip() then
        player:sendTextMessage(MESSAGE_STATUS_SMALL, "Apenas jogadores VIPs podem passar.")
        player:teleportTo(fromPosition, true)
        return false
    end

    return true
end

function onStepInWithActionId(player, item, position, fromPosition)
    -- Verifica se o item tem a Action ID correta
    if item:getActionId() == config.actionId then
        return viptopass.onStepIn(player, item, position, fromPosition)
    else
        return false
    end
end

viptopass:type("onStepIn")
viptopass:aid(config.actionId)
viptopass:register()