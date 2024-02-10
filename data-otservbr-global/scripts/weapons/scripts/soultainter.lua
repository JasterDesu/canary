local area = createCombatArea({
	{ 0, 1, 1, 1, 0 },
	{ 1, 1, 1, 1, 1 },
	{ 1, 1, 3, 1, 1 },
	{ 1, 1, 1, 1, 1 },
	{ 0, 1, 1, 1, 0 },
})

local wandOfDimensions = Weapon(WEAPON_WAND)

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SUDDENDEATH)

function onGetFormulaValues()
	local min = 100
	local max = 120
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

wandOfDimensions.onUseWeapon = function(player, variant)
	return combat:execute(player, variant)
end

combat:setArea(area)
wandOfDimensions:id(34090)
wandOfDimensions:mana(15)
wandOfDimensions:range(5)
wandOfDimensions:register()
