local config = {
	monsters = {
		{ "demon", "infernal demon", "branchy crawler" }, -- wave 1
		{ "many faces", "cloak of terror", "rotten golem" }, -- wave 2
		{ "the monster", "the nightmare beast", "the dread maiden" }, -- wave 3
		{ "the fear feaster", "drume", "goshnar megalomania" }, -- wave final (boss)
	},
	spawnArea = { upperCorner = Position(34224, 30946, 6), lowerCorner = Position(34243, 30963, 6) },
	waveInterval = 10, -- Tempo em segundos entre as waves
	eventStartTime = "21:00:00", -- Horário de início do evento
	warningTime = 60, -- Tempo em segundos para o aviso antes do evento
}

local event = {
	currentWave = 0,
	creatures = {},
}

local MonsterWave = GlobalEvent("MonsterWave")
function event.spawnWave(wave)
	local spawnArea = config.spawnArea
	local upperCorner = spawnArea.upperCorner
	local lowerCorner = spawnArea.lowerCorner

	for _, monster in ipairs(config.monsters[wave]) do
		local randomPosition = Position(math.random(upperCorner.x, lowerCorner.x), math.random(upperCorner.y, lowerCorner.y), math.random(upperCorner.z, lowerCorner.z))
		local creature = Game.createMonster(monster, randomPosition)

		if creature then
			table.insert(event.creatures, { creature:getId() })
		end
	end
end

function event.onThink(interval, lastExecution)
	local currentTime = os.sched_gettime()

	if event.currentWave == 0 then
		if os.date("%H:%M:%S", currentTime) == config.eventStartTime then
			-- Inicia o aviso 60 segundos antes do evento
			addEvent(event.showWarning, (config.warningTime - 60) * 1000)

			-- Inicia a primeira wave às 21:00
			event.currentWave = 1
			event.spawnWave(event.currentWave)
		end
	else
		if #event.creatures == 0 then
			-- Se todos os monstros da wave anterior morreram, inicia a próxima wave após 10 segundos
			addEvent(event.spawnNextWave, config.waveInterval * 1000)
		end
	end

	return true
end

function event.spawnNextWave()
	event.currentWave = event.currentWave + 1

	if event.currentWave <= #config.monsters then
		event.spawnWave(event.currentWave)
	else
		-- Todas as waves foram concluídas, reinicia para a primeira wave no próximo dia
		event.currentWave = 0
	end
end

function event.showWarning()
	Game.broadcastMessage("[EVENT] O evento de waves comecara em 60 segundos!", MESSAGE_STATUS_WARNING)
end

MonsterWave:register()
