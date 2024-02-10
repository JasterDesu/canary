local doctorMarrow = CreatureEvent("DoctorMarrowTransform")

function doctorMarrow.onDeath(creature, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
    local doctorMarrowName = "Doctor Marrow"
    local theMonsterName = "The Monster"

    if creature:getName() == doctorMarrowName then
        -- Doctor Marrow está morto

        -- Encontre a posição do Doctor Marrow
        local doctorMarrowPosition = creature:getPosition()

        -- Remova o Doctor Marrow
        creature:remove()

        -- Crie o The Monster no lugar do Doctor Marrow
        local theMonster = Game.createMonster(theMonsterName, doctorMarrowPosition)
    end

    return true
end

doctorMarrow:register()
