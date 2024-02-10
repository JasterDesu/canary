local refiller = Action()
local timeToDisappear = 2 * 60 * 1000 -- 2 minutos
local cooldownTime = 3 * 60 * 1000 -- 3 minutos
local maxDistance = 10 -- 10 sqm

-- Inicializar a tabela HUNT_REFILLER
if not HUNT_REFILLER then
	HUNT_REFILLER = {}
end

function refiller.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local itemId = item:getId()
	local pid = player:getId()

	if player:getCondition(CONDITION_INFIGHT, CONDITIONID_DEFAULT) or player:isPzLocked() then
		player:sendCancelMessage("Voce nao pode usar isso durante uma batalha ou enquanto estiver PZ locked.")
		return true
	end

	if HUNT_REFILLER[pid] and HUNT_REFILLER[pid].time and HUNT_REFILLER[pid].time > os.time() then
		player:sendCancelMessage("Voce precisa esperar antes de usar este item novamente.")
		return true
	end

	if not HUNT_REFILLER[pid] then
		HUNT_REFILLER[pid] = {}
	end

	local position = player:getPosition()

	-- Criar NPC Hunt Refiller
	local npc = Game.createNpc("Hunt Refiller", position)
	if npc then
		HUNT_REFILLER[pid].time = os.time() + cooldownTime / 1000
		HUNT_REFILLER[pid].npc = npc:getId()

		-- Agendar remocao do NPC
		local removeEvent = addEvent(function()
			local playerData = HUNT_REFILLER[pid]
			if playerData and playerData.npc then
				local npcToRemove = Creature(playerData.npc)
				if npcToRemove then
					npcToRemove:remove()
				end
				HUNT_REFILLER[pid] = nil
			end
		end, timeToDisappear)

		-- Agendar verificacao de distancia
		local distanceCheckEvent
		distanceCheckEvent = addEvent(function()
			local playerData = HUNT_REFILLER[pid]
			if playerData and playerData.npc then
				local npcPosition = Creature(playerData.npc):getPosition()
				local distance = player:getPosition():getDistance(npcPosition)

				if distance > maxDistance then
					-- Se o jogador estiver a mais de 10 sqm, remova o NPC imediatamente
					stopEvent(removeEvent)
					removeEvent = nil
					Game.removeNpc(playerData.npc)
					HUNT_REFILLER[pid] = nil
				else
					-- Caso contrario, continue verificando
					distanceCheckEvent = addEvent(distanceCheckEvent, 1000) -- Verificar a cada segundo
				end
			end
		end, 1000)

		-- Definir posicao mestre do NPC e enviar efeito magico
		npc:setMasterPos(position)
		position:sendMagicEffect(CONST_ME_MAGIC_RED)
	end

	return true
end

refiller:id(35909)
refiller:register()
