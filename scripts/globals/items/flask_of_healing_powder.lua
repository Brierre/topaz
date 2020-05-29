-----------------------------------------
--  ID: 5322
--  Item: flask_of_healing_powder
--  Item Effect: AoE restore HP 
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
-- restore HP, needs amount, AoE flagged in DB
    target:addStatusEffect(tpz.effect.MEDICINE,0,0,900)
end
