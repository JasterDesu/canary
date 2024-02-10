local taskLog = GlobalEvent("TaskLog")

function taskLog.onStartup()
local newmissions = {}
	for i, data in pairs(taskConfiguration) do
newmissions[#newmissions + 1] = {name = "Task: "..data.name, storageId = data.storage, missionId = #newmissions + 1, startValue = 0, endValue = os.time()*10, description = function(player) return (player:getTaskKills(data.storagecount) == -1 and "You have completed this task." or (player:getTaskKills(data.storagecount) == data.total and "You have completed this task, but you still need to collect your reward use !task." or "You killed ["..player:getTaskKills(data.storagecount).."/"..data.total.."] "..data.name)) end,}
	end
Quests[#Quests + 1] = {name = "Tasks", startStorageId = taskQuestLog, startStorageValue = 1,
                       missions = newmissions}
   return true
end

taskLog:register()

local taskEvents = CreatureEvent("TaskEvents")
function taskEvents.onLogin(player)
	local events = {
      -- Custom Events
      "TaskCreature"
	}

	for i = 1, #events do
		player:registerEvent(events[i])
	end
	return true
end

taskEvents:register()


--[[local taskLog = GlobalEvent("TaskLog")

function taskLog.onStartup()
    local newmissions = {}
    for i, data in pairs(taskConfiguration) do
        newmissions[#newmissions + 1] = {
            name = "Task: " .. data.name,
            storageId = data.storage,
            missionId = #newmissions + 1,
            startValue = 0,
            endValue = os.time() * 10,
            description = function(player)
                local kills = player:getTaskKills(data.storagecount)
                if kills == -1 then
                    return "You have completed this task."
                elseif kills == data.total then
                    return "You have completed this task, but you still need to collect your reward. Use !task."
                else
                    local remaining = data.total - kills
                    return "You killed [" .. kills .. "/" .. data.total .. "] " .. data.name .. ". Remaining: " .. remaining
                end
            end,
        }
    end

    Quests[#Quests + 1] = {
        name = "Tasks",
        startStorageId = taskQuestLog,
        startStorageValue = 1,
        missions = newmissions
    }

    return true
end

-- Adicionando o canal de bate-papo para enviar andamento da tarefa
local tasksChat = Channel(ChatChannels["tasks"])
local function sendTaskProgress(player, taskName, remaining)
    tasksChat:sendTextMessage(player:getName() .. " killed [" .. (data.total - remaining) .. "/" .. data.total .. "] " .. taskName .. ". Remaining: " .. remaining)
end

taskLog:register()

local taskEvents = CreatureEvent("TaskEvents")
function taskEvents.onKill(player, target)
    local tasks = {
        -- Adicione suas tarefas personalizadas aqui
        TaskCreature = {storage = 123, storagecount = 456, total = 100, name = "Creatures"}
    }

    for taskName, taskData in pairs(tasks) do
        if player:getStorageValue(taskData.storage) == 1 then
            local currentKills = player:getTaskKills(taskData.storagecount)
            if currentKills ~= -1 and currentKills < taskData.total then
                player:setTaskKills(taskData.storagecount, currentKills + 1)
                sendTaskProgress(player, taskData.name, taskData.total - (currentKills + 1))
            end
        end
    end

    return true
end

function taskEvents.onLogin(player)
    local events = {
        -- Custom Events
        "TaskCreature"
    }

    for i = 1, #events do
        player:registerEvent(events[i])
    end
    return true
end

taskEvents:register()
]]