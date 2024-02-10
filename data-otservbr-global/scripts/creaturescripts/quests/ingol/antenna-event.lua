local antennaEvent = CreatureEvent("AntennaEvent")

function antennaEvent.onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
    local doctorMarrowName = "Doctor Marrow"

    if creature:getName() == "Antenna" then
        local doctorMarrow = creature:getTarget()

        if doctorMarrow and doctorMarrow:getName() == doctorMarrowName then
            local antennaDamage = creature:getMaxHealth() * 0.25

            if doctorMarrow:getHealth() > antennaDamage then
                doctorMarrow:addHealth(-antennaDamage)
            else
                doctorMarrow:addHealth(-doctorMarrow:getHealth())
            end

            creature:remove()
        end
    end
    return true
end

antennaEvent:register()
