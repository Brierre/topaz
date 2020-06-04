-----------------------------------------
--  ID: 5388
--  Item: bottle_of_assassins_drink
--  Item Effect: Increases magic accuracy
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
    target:addMod(tpz.mod.MACC,25,0,90) -- need value for MACC
    target:addStatusEffect(tpz.effect.MEDICINE,0,0,900)
end
