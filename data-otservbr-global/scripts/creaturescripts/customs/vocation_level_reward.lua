-- [1,5] = VOCATION ID
-- [LEVEL] = {items = {{itemid = ITEM_ID, count = COUNT}}, storage = YOU_CHOOSE, msg = "MESSAGE FOR THE PLAYER"},

local table = {
   
    [{1, 5}] = {

        [15] = {items = {{itemid = 3075, count = 1}}, storage = 40100, msg = "You won wand of Dragonbreath for reaching level 15!"},
        [25] = {items = {{itemid = 3079, count = 1}}, storage = 40101, msg = "You won boots of haste for reaching level 25!"},
        [35] = {items = {{itemid = 3210, count = 1}}, storage = 40102, msg = "You won Hat of the mad for reaching level 35!"},
        [45] = {items = {{itemid = 8043, count = 1}}, storage = 40103, msg = "You won Focus Cape for reaching level 45!"},
        [55] = {items = {{itemid = 645, count = 1}}, storage = 40104, msg = "You won Blue Legs for reaching level 55!"},
    },

    [{2, 6}] = {

        [15] = {items = {{itemid = 3070, count = 1}}, storage = 40200, msg = "You won Moonlight Rod for reaching level 15!"},
        [25] = {items = {{itemid = 3079, count = 1}}, storage = 40201, msg = "You won boots of haste reaching level 25!"},
        [35] = {items = {{itemid = 3210, count = 1}}, storage = 40202, msg = "You won Hat of the mad reaching level 35!"},
        [45] = {items = {{itemid = 8043, count = 1}}, storage = 40203, msg = "You won Focus Cape reaching level 45!"},
        [55] = {items = {{itemid = 645, count = 1}}, storage = 40204, msg = "You won Blue Legs reaching level 55!"},

    },

    [{3, 7}] = {

        [15] = {items = {{itemid = 8044, count = 1}}, storage = 40300, msg = "You won Belted Cape for reaching level 15!"},
        [25] = {items = {{itemid = 3079, count = 1}}, storage = 40301, msg = "You won Boots of Haste for reaching level 25!"},
        [35] = {items = {{itemid = 3557, count = 1}}, storage = 40302, msg = "You won Plate Legs for reaching level 35!"},
        [45] = {items = {{itemid = 7367, count = 1}}, storage = 40303, msg = "You won Enchanted Spear for reaching level 45!"},
        [55] = {items = {{itemid = 3391, count = 1}}, storage = 40304, msg = "You won Crusader Helmet for reaching level 55!"},
    },
    [{4, 8}] = {
        [15] = {items = {{itemid = 3370, count = 1}}, storage = 40403, msg = "You won knight armor reaching level 15!"},
        [25] = {items = {{itemid = 3079, count = 1}}, storage = 40401, msg = "You won boots of haste reaching level 25!"},
        [35] = {items = {{itemid = 3371, count = 1}}, storage = 40402, msg = "You won knight legs reaching level 35!"},
        [45] = {items = {{itemid = 19154, count = 1}}, storage = 40403, msg = "You won a weapon selector reaching level 45!"},
        [55] = {items = {{itemid = 3391, count = 1}}, storage = 40404, msg = "You won Crusader Helmet for reaching level 55!"},
    },
}

local rewardLevel = CreatureEvent("RewardLevel")
function rewardLevel.onAdvance(player, skill, oldLevel, newLevel)
    if skill ~= SKILL_LEVEL or newLevel <= oldLevel then  
        return true
    end

    for voc, x in pairs(table) do
        if isInArray(voc, player:getVocation():getId()) then
            for level, z in pairs(x) do
                if newLevel >= level and player:getStorageValue(z.storage) ~= 1 then
                    for v = 1, #z.items do
                        local ret = ", "
                        if v == 1 then
                            ret = ""
                        end
                        player:addItem(z.items[v].itemid, z.items[v].count)
                        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, z.msg)
            			player:setStorageValue(z.storage, 1)
                    end
                end
            end
            player:save()
            return true
        end
    end
end

rewardLevel:register()