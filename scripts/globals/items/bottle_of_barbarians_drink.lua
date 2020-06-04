-----------------------------------------
--  ID: 5385
--  Item: bottle_of_barbarians_drink
--  Item Effect: Increases attack power
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")

function onItemCheck(target)
    if (target:hasStatusEffect(tpz.effect.MEDICINE)) then
        return tpz.msg.basic.ITEM_NO_USE_MEDICATED
    end
    return 0
end

function onItemUse(target)
    target:addStatusEffect(tpz.effect.ATTACK_BOOST,50,0,60) -- %
    target:addStatusEffect(tpz.effect.MEDICINE,0,0,900)
end