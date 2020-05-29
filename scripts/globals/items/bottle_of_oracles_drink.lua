-----------------------------------------
--  ID: 5387
--  Item: bottle_of_oracles_drink
--  Item Effect: Increases magic attack power
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
    target:addStatusEffect(tpz.effect.MAGIC_ATK_BOOST,50,0,60)
    target:addStatusEffect(tpz.effect.MEDICINE,0,0,900)
end
