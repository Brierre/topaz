-----------------------------------------
--  ID: 5391
--  Item: bottle_of_soldiers_drink
--  Item Effect: Increases the amount of damage dealt to target
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
    target:addMod(tpz.mod.DMG,50,0,60) -- need to make wear off upon one-time use; find another item
    target:addStatusEffect(tpz.effect.MEDICINE,0,0,900)
end
