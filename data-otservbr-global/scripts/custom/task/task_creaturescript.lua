--[[local taskCreature = CreatureEvent("TaskCreature")

function taskCreature.onKill(player, target)
	if target:isPlayer() or target:getMaster() or nil then
		return true
	end

	local targetName = target:getName():lower()
	local data = getTaskByMonsterName(targetName)
	if data ~= false and player:hasStartedTask(data.storage) then
		if player:getStorageValue(10102) >= os.time() then
		player:addTaskKill(data.storage, 2)
		else
		player:addTaskKill(data.storage, 1)
		end
	end
	return true
end

taskCreature:register()--]]

local taskCreature = CreatureEvent("TaskCreature")

function taskCreature.onDeath(creature, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
	if not creature:isMonster() then
		return false
	end

	local targetName = creature:getName():lower()
	local data = getTaskByMonsterName(targetName)

	if data and killer:isPlayer() and not killer:getMaster() then
		if killer:hasStartedTask(data.storage) then
			if killer:getStorageValue(10102) >= os.time() then
				killer:addTaskKill(data.storage, 2)
			else
				killer:addTaskKill(data.storage, 1)
			end
		end
	end

	return true
end

taskCreature:register()
