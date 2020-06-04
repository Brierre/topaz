-----------------------------------------
--  ID: 5435
--  Item: bottle_of_fools_drink
--  Item Effect: Nullifies all magical damage
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
    target:addStatusEffect(tpz.effect.MAGIC_SHIELD,7,0,60) -- need param1, blocks magic damage, blocks enfeeb spells, does not block magical TP moves, also overwrites/is overwritten by fanatic's drink
    target:addStatusEffect(tpz.effect.MEDICINE,0,0,900)
end
