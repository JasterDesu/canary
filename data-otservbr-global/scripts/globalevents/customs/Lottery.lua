local lottery = GlobalEvent("lottery")

local config = {
	interval = "1 hour",
	rewards = {

		{ 3043, 5 }, --CC
		{ 3043, 10 }, --CC
		{ 3043, 15 }, --CC
		{ 3043, 20 }, --CC
		{ 3043, 25 }, --CC
		{ 33893, 1 }, --Stamina Refill
		{ 36723, 1 }, --Pot Cooldown
		{ 19082, 1 }, --Dust Refill
		{ 22723, 1 }, --Lottery Token
		{ 9080, 10 }, --hydra salad
		{ 36724, 1 }, --pot critico
		{ 36735, 1 }, --phys resilience
		{ 36742, 1 }, --phys ampli
		{ 36730, 1 }, --ice resili
		{ 36737, 1 }, --ice ampli
		{ 36733, 1 }, --holy resili
		{ 36740, 1 }, --holy ampli
		{ 36729, 1 }, --fire resili
		{ 36736, 1 }, --fire ampli
		{ 36732, 1 }, --energy resili
		{ 36739, 1 }, --energy ampli
		{ 36731, 1 }, --earth resili
		{ 36738, 1 }, --earth ampli
		{ 36734, 1 }, --death resili
		{ 36741, 1 }, --death ampli
		{ 28484, 1 }, --cupcake life
		{ 28485, 1 }, --cupcake mana
		{ 37338, 1 }, --skull remover
		{ 36727, 1 }, --loot 2x
		{ 3043, 3 }, -- {Crystal Coin, 3} -- {itemID, quantity}
		{ 3043, 5 }, -- {Crystal Coin, 5}
		{ 3043, 10 }, -- {Crystal Coin, 10}
		{ 3043, 25 }, -- {Crystal Coin, 25}
		{ 3043, 100 }, -- {Crystal Coin, 100}
		{ 22721, 10 }, -- {Gold Token, 10}
		{ 22721, 5 }, -- {Gold Token, 5}
		{ 22516, 10 }, -- {Silver Token, 10}
		{ 22516, 5 }, -- {Silver Token, 5}
	},

	-- Random Reward
	website = false,
}

function lottery.onThink(interval)
	local players = {}
	for _, player in ipairs(Game.getPlayers()) do
		if not player:getGroup():getAccess() then
			table.insert(players, player)
		end
	end

	local c = #players
	if c <= 0 then
		return true
	end

	local winner = players[math.random(#players)]

	local reward = config.rewards[math.random(#config.rewards)]
	local itemid, amount = reward[1], reward[2]
	winner:addItem(itemid, amount)

	local it = ItemType(itemid)
	local name = (amount == 1) and (it:getArticle() .. " " .. it:getName()) or (amount .. " " .. it:getPluralName())

	broadcastMessage("[LOTTERY SYSTEM] " .. winner:getName() .. " won " .. name .. "! Congratulations! (Next lottery in " .. config.interval .. " minute)")

	return true
end

lottery:interval(config.interval * 60 * 1000) -- Convert minutes to milliseconds
lottery:register()
