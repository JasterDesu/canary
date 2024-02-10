local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICEATTACK)
combat:setArea(createCombatArea(AREA_CIRCLE6X6))

local condition = Condition(CONDITION_PARALYZE)
condition:setParameter(CONDITION_PARAM_TICKS, 6000)
condition:setFormula(-1, 81, -1, 81)
combat:addCondition(condition)

function onGetFormulaValues(player, level, maglevel)
	local min = (level * 2) + (maglevel * 12.5) -- 254 108 -- 508 + 1890 = 2398
	local max = (level * 2.5) + (maglevel * 17.3)
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	return combat:execute(creature, var)
end

spell:group("attack", "focus")
spell:id(140)
spell:name("Wrath of Freezing")
spell:words("exevo gran max frigo")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_DIVINE_CALDERA)
spell:level(450)
spell:mana(900)
spell:isPremium(true)
spell:isSelfTarget(true)
spell:cooldown(18 * 1000)
spell:groupCooldown(1 * 1000, 4 * 1000)
spell:needLearn(false)
spell:vocation("druid;true", "elder druid;true")
spell:register()