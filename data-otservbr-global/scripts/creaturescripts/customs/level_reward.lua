local table = {
	-- [level] = type = "item", id = {ITEM_ID, QUANTITY}, msg = "MESSAGE"},
	-- [level] = type = "bank", id = {QUANTITY, 0}, msg = "MESSAGE"},
	-- [level] = type = "addon", id = {ID_ADDON_FEMALE, ID_ADDON_MALE}, msg = "MESSAGE"},
	-- [level] = type = "mount", id = {ID_MOUNT, 0}, msg = "MESSAGE"},

	[10] = { type = "bank", id = { 10000, 1 }, msg = "your receive 5000 gold coins for reaching level 10!" },
	[20] = { type = "bank", id = { 20000, 0 }, msg = "your receive 10000 gold coins for reaching level 20!" },
	[30] = { type = "bank", id = { 30000, 0 }, msg = "your receive 30000 gold coins for reaching level 30!" },
	[40] = { type = "bank", id = { 400000, 0 }, msg = "your receive 40000 gold coins for reaching level 40!" },
	[100] = { type = "item", id = { 22723, 3 }, msg = "your receive 3 roulette tokens for reaching level 100!" },
	[150] = { type = "mount", id = { 170, 0 }, msg = "your receive a Eventide Nandu Mount for reaching level 150!" },
	[500] = { type = "bank", id = { 1000000, 0 }, msg = "your receive 1kk gold coins for reaching level 500!" },
}

local storage = 15000

local levelReward = CreatureEvent("Level Reward")
function levelReward.onAdvance(player, skill, oldLevel, newLevel)
	if skill ~= SKILL_LEVEL or newLevel <= oldLevel then
		return true
	end

	for level, _ in pairs(table) do
		if newLevel >= level and player:getStorageValue(storage) < level then
			if table[level].type == "item" then
				player:addItem(table[level].id[1], table[level].id[2])
			elseif table[level].type == "bank" then
				player:setBankBalance(player:getBankBalance() + table[level].id[1])
			elseif table[level].type == "addon" then
				player:addOutfitAddon(table[level].id[1], 3)
				player:addOutfitAddon(table[level].id[2], 3)
			elseif table[level].type == "mount" then
				player:addMount(table[level].id[1])
			else
				return false
			end

			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, table[level].msg)
			player:setStorageValue(storage, level)
		end
	end

	player:save()

	return true
end

levelReward:register()
