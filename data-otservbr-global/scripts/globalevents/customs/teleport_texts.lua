local effects = {
    {position = Position(32369, 32241, 7), text = 'Bem-vindo ao Meraki!', effect = CONST_ME_GROUNDSHAKER},
    {position = Position(32365, 32236, 7), text = '[TRAINERS]', effect = CONST_ME_GROUNDSHAKER},
    {position = Position(32373, 32236, 7), text = '[EVENTS]', effect = CONST_ME_GROUNDSHAKER},    
    {position = Position(32373, 32239, 7), text = '[NPC ISLAND]', effect = CONST_ME_GROUNDSHAKER}, 
    {position = Position(32350, 32222, 7), text = '[Boss]', effect = CONST_ME_GROUNDSHAKER}, 
    {position = Position(34250, 31032, 6), text = 'Proximas Hunts', effect = CONST_ME_GROUNDSHAKER}, 
    {position = Position(32350, 32224, 7), text = '[Hunts]', effect = CONST_ME_GROUNDSHAKER}, 
    {position = Position(34330, 31024, 6), text = '[Exit]', effect = CONST_ME_GROUNDSHAKER}, 
    {position = Position(34331, 31050, 6), text = '[Exit]', effect = CONST_ME_GROUNDSHAKER}, 
    {position = Position(34337, 31050, 6), text = '[Exit]', effect = CONST_ME_GROUNDSHAKER}, 
    {position = Position(34333, 31006, 6), text = '[Medium]', effect = CONST_ME_GROUNDSHAKER}, 
    {position = Position(34335, 31006, 6), text = '[Hard]', effect = CONST_ME_GROUNDSHAKER}, 
    {position = Position(34237, 31035, 6), text = '[Multi TP]\n Dragon Lair', effect = CONST_ME_GROUNDSHAKER}, 
    {position = Position(34249, 31029, 5), text = '[Multi TP]\n Warzones', effect = CONST_ME_GROUNDSHAKER}, 
    {position = Position(34231, 31015, 5), text = '[Multi TP]\n Cathedral', effect = CONST_ME_GROUNDSHAKER}, 
    {position = Position(34227, 31029, 5), text = '[Multi TP]\n Secret Library', effect = CONST_ME_GROUNDSHAKER}, 
    {position = Position(32343, 32219, 7), text = '[Task System]', effect = CONST_ME_GROUNDSHAKER}, 
    {position = Position(32070, 31898, 5), text = '[Rookgaard]', effect = CONST_ME_TUTORIALSQUARE}, 
    {position = Position(32119, 32191, 8), text = '[Trainer]', effect = CONST_ME_TUTORIALSQUARE}, 
}

local animatedText = GlobalEvent("AnimatedText") 
function animatedText.onThink(interval)
    for i = 1, #effects do
        local settings = effects[i]
        local spectators = Game.getSpectators(settings.position, false, true, 7, 7, 5, 5)
        if #spectators > 0 then
            if settings.text then
                for i = 1, #spectators do
                    spectators[i]:say(settings.text, TALKTYPE_MONSTER_SAY, false, spectators[i], settings.position)
                end
            end
            if settings.effect then
                settings.position:sendMagicEffect(settings.effect)
            end
        end
    end
   return true
end

animatedText:interval(4550)
animatedText:register()