--[[local infinitefood = Action()
function infinitefood.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local condition = player:getCondition(CONDITION_REGENERATION, CONDITIONID_DEFAULT)
	if condition and math.floor(condition:getTicks() / 1000 + (itemFood[1] * 12)) >= 1200 then
		player:sendTextMessage(MESSAGE_FAILURE, "You are full.")
		return true
	end
    for i = 1, #conditions do
        doRemoveCondition(cid, conditions[i])
    end
    player:say("Chomp.", TALKTYPE_MONSTER_SAY)
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You feel better body condition.")
    player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
    return true
end
infinitefood:id(37532)
infinitefood:register()--]]
