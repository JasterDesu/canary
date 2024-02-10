local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICEAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ICE)
combat:setArea(createCombatArea(AREA_CIRCLE3X3))

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 3.0) + 20
	local max = (level / 5) + (maglevel * 4.8) + 45
	return -min, -max

	--[[teste lvl 500 ml 100
	min 100 + 300 + 20 = 420
	max 100 + 480 + 45 = 625
	]]
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local rune = Spell("rune")

function rune.onCastSpell(creature, var, isHotkey)
	return combat:execute(creature, var)
end

rune:id(115)
rune:group("attack")
rune:name("avalanche rune")
rune:castSound(SOUND_EFFECT_TYPE_SPELL_OR_RUNE)
rune:impactSound(SOUND_EFFECT_TYPE_SPELL_AVALANCHE_RUNE)
rune:runeId(3161)
rune:allowFarUse(true)
rune:charges(4)
rune:level(30)
rune:magicLevel(4)
rune:cooldown(1 * 1000)
rune:groupCooldown(1 * 1000)
rune:register()
