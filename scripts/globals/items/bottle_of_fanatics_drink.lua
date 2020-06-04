-----------------------------------------
--  ID: 5434
--  Item: bottle_of_fanatics_drink
--  Item Effect: Nullifies all physical damage
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
    target:addStatusEffect(tpz.effect.PHYSICAL_SHIELD,100,0,60) -- blocks phys dmg, ALL TP moves and their effects, except breath damage or HPP-based TP moves
    target:addStatusEffect(tpz.effect.MEDICINE,0,0,900)
end
