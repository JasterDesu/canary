local config = {
	boss = {
		name = "Bakragore",
		position = Position(33043, 32397, 15),
	},
	requiredLevel = 600,
	timeToFightAgain = 60 * 60 * 24 * 4,
	playerPositions = {
		{ pos = Position(33014, 32392, 15), teleport = Position(33044, 32407, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(33013, 32392, 15), teleport = Position(33044, 32407, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(33012, 32392, 15), teleport = Position(33044, 32407, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(33011, 32392, 15), teleport = Position(33044, 32407, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(33010, 32392, 15), teleport = Position(33044, 32407, 15), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(33030, 32388, 15),
		to = Position(33056, 32412, 15),
	},
	exit = Position(33044, 32409, 15),
}

local lever = BossLever(config)
lever:position(Position(33015, 32392, 15))
lever:register()
