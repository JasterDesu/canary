-- data/scripts/custom/online_points.lua

local config = {
	storage = 20000,
	pointItemId = 37317,
	pointsPerHour = 1,
	checkDuplicateIps = false,
}

local onlinePointsEvent = GlobalEvent("GainPointPerHour")

function onlinePointsEvent.onThink(interval)
	local players = Game.getPlayers()
	if #players == 0 then
		return true
	end

	--[[    local players = {}
    for _, player in ipairs(Game.getPlayers()) do
        if not player:getGroup():getAccess() then
            table.insert(players, player)
        end
    end--]]

	local c = #players
	if c <= 0 then
		return true
	end

	local checkIp = {}
	for _, player in pairs(players) do
		local ip = player:getIp()
		if ip ~= 0 and (not config.checkDuplicateIps or not checkIp[ip]) then
			checkIp[ip] = true
			local seconds = math.max(0, player:getStorageValue(config.storage))
			if seconds >= 3600 then
				player:setStorageValue(config.storage, 0)
				if player:isVip() then
					local item = player:addItem(config.pointItemId, 2)
				else
					local item = player:addItem(config.pointItemId, config.pointsPerHour)
				end
				if item then
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voce recebeu um Online Token por estar online por uma hora.")
				end
				return true
			end
			player:setStorageValue(config.storage, seconds + math.ceil(interval / 1000))
		end
	end
	return true
end

onlinePointsEvent:interval(10000)
onlinePointsEvent:register()