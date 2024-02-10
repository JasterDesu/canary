local ferumbrasEvent = CreatureEvent("FerumbrasEvent")

-- Configurações do Ferumbras
local ferumbrasConfig = {
    teleportPercentages = {75, 50, 25}, -- Porcentagens da vida para teleportar
    teleportArea = {upperCorner = Position(32117, 32682, 4), lowerCorner = Position(32127, 32691, 4)}, -- Área para teleportar (canto superior e inferior)
}

function ferumbrasEvent.onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
    if not creature:isMonster() then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end

    local healthPercent = creature:getHealthPercent()

    for _, teleportPercentage in ipairs(ferumbrasConfig.teleportPercentages) do
        if healthPercent <= teleportPercentage then
            teleportFerumbras(creature)
            break -- Evitar múltiplos teletransportes na mesma porcentagem de vida
        end
    end

    return primaryDamage, primaryType, secondaryDamage, secondaryType
end

function teleportFerumbras(ferumbras)
    if ferumbras and ferumbras:isMonster() then
        local teleportPosition = generateRandomPosition()
        ferumbras:teleportTo(teleportPosition, true)
        ferumbras:say("Ferumbras teleported to a new location!", TALKTYPE_MONSTER_SAY)
    end
end

function generateRandomPosition()
    local upperCorner = ferumbrasConfig.teleportArea.upperCorner
    local lowerCorner = ferumbrasConfig.teleportArea.lowerCorner

    local randomX = math.random(upperCorner.x, lowerCorner.x)
    local randomY = math.random(upperCorner.y, lowerCorner.y)
    local randomZ = math.random(upperCorner.z, lowerCorner.z)

    return Position(randomX, randomY, randomZ)
end

ferumbrasEvent:register()
