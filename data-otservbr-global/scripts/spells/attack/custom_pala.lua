local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HOLYAREA)
combat:setArea(createCombatArea(AREA_RING1_BURST3))

function onGetFormulaValues(player, level, maglevel)
	local min = (level * 1.5) + (maglevel * 10.5)
	local max = (level * 2) + (maglevel * 13.5)
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	return combat:execute(creature, var)
end

spell:group("attack", "focus")
spell:id(61)
spell:name("Wrath of God")
spell:words("exevo gran mas san")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_DIVINE_CALDERA)
spell:level(450)
spell:mana(700)
spell:isPremium(true)
spell:isSelfTarget(true)
spell:cooldown(10 * 1000)
spell:groupCooldown(1 * 1000, 3 * 1000)
spell:needLearn(false)
spell:vocation("paladin;true", "royal paladin;true")
spell:register()
