local shutdown = TalkAction("/shutdown")

function shutdown.onSay(player, words, param)
	Game.setGameState(GAME_STATE_SHUTDOWN)
end

shutdown:separator(" ")
shutdown:groupType("god")
shutdown:register()
