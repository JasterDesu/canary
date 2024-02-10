local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_BIGCLOUDS)
combat:setArea(createCombatArea(AREA_CIRCLE6X6))

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 7) + 200
	local max = (level / 5) + (maglevel * 14) + 200
	return -min, -max
	--[[ teste lvl 500 ml 100
min 100 + 700 + 200 = 1000
max 100 + 1400 + 200 = 1700
]]
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	return combat:execute(creature, var)
end

spell:group("attack", "focus")
spell:id(119)
spell:name("Rage of the Skies")
spell:words("exevo gran mas vis")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_RAGE_OF_THE_SKIES)
spell:level(55)
spell:mana(600)
spell:isSelfTarget(true)
spell:isPremium(true)
spell:cooldown(15 * 1000)
spell:groupCooldown(1 * 1000, 1 * 1000)
spell:needLearn(false)
spell:vocation("sorcerer;true", "master sorcerer;true")
spell:register()
