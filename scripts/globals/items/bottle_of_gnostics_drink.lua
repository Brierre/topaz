-----------------------------------------
--  ID: 5394
--  Item: bottle_of_gnostics_drink
--  Item Effect: Pax
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
    target:addStatusEffect(tpz.effect.PAX,7,0,60) -- reduces enmity gain rate, need value
    target:addStatusEffect(tpz.effect.MEDICINE,0,0,900)
end
