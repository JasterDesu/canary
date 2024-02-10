local bp = TalkAction("!bp")

function bp.onSay(player, words, param)

    local defaultItemID = 2854  -- Default item ID if param is empty or invalid

    if param == "blue" then
        player:addItem(2869, 1)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have bought a blue backpack!")
    elseif param == "orange" then
        player:addItem(9602, 1)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have bought an orange backpack!")
    elseif param == "green" then
        player:addItem(2865, 1)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have bought a green backpack!")
    elseif param == "red" then
        player:addItem(2867, 1)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have bought a red backpack!")
    elseif param == "yellow" then
        player:addItem(2866, 1)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have bought a yellow backpack!")
    elseif param == "purple" then
        player:addItem(2868, 1)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have bought a purple backpack!")
    elseif param == "golden" then
        player:addItem(2871, 1)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have bought a golden backpack!")
    elseif param == "camouflage" then
        player:addItem(2872, 1)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have bought a camouflage backpack!")
    elseif param == "brocade" then
        player:addItem(8860, 1)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have bought a brocade backpack!")
    else
        player:addItem(defaultItemID, 1)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have bought a backpack!")
    end

    player:removeMoneyBank(10)
    player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
    return true
end

bp:groupType("normal")
bp:separator(" ")
bp:register()
