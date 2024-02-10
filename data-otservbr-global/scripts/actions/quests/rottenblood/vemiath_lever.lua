local config = {
	boss = {
		name = "Vemiath",
		position = Position(33043, 32335, 15),
	},
	requiredLevel = 600,
	playerPositions = {
		{ pos = Position(33078, 32333, 15), teleport = Position(33043, 32342, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(33077, 32333, 15), teleport = Position(33043, 32342, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(33076, 32333, 15), teleport = Position(33043, 32342, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(33075, 32333, 15), teleport = Position(33043, 32342, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(33074, 32333, 15), teleport = Position(33043, 32342, 15), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(33030, 32324, 15),
		to = Position(33057, 32347, 15),
	},
	exit = Position(33043, 32344, 15),
}

local lever = BossLever(config)
lever:position(Position(33079, 32333, 15))
lever:register()