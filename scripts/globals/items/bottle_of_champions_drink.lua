-----------------------------------------
--  ID: 5392
--  Item: bottle_of_champions_drink
--  Item Effect: Potency
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
    target:addStatusEffect(tpz.effect.POTENCY,7,0,60) -- need value of crit boost
    target:addStatusEffect(tpz.effect.MEDICINE,0,0,900)
end
