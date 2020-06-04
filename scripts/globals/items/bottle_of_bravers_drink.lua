-----------------------------------------
--  ID: 5390
--  Item: bottle_of_bravers_drink
--  Item Effect: Increases all attributes
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
    target:addStatusEffect(tpz.effect.AGI_BOOST,15,0,180)
    target:addStatusEffect(tpz.effect.STR_BOOST,15,0,180)
    target:addStatusEffect(tpz.effect.DEX_BOOST,15,0,180)
    target:addStatusEffect(tpz.effect.VIT_BOOST,15,0,180)
    target:addStatusEffect(tpz.effect.INT_BOOST,15,0,180)
    target:addStatusEffect(tpz.effect.MND_BOOST,15,0,180)
    target:addStatusEffect(tpz.effect.CHR_BOOST,15,0,180)
    target:addStatusEffect(tpz.effect.MEDICINE,0,0,900)
end
