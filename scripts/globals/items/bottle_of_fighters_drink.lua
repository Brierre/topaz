-----------------------------------------
--  ID: 5386
--  Item: bottle_of_fighters_drink
--  Item Effect: Increases accuracy
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
    target:addStatusEffect(tpz.effect.ACC,100,0,90) -- acc/racc  +100 for 90sec
    target:addStatusEffect(tpz.effect.RACC,100,0,90)
    target:addStatusEffect(tpz.effect.MEDICINE,0,0,900)
end
