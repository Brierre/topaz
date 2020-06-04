-----------------------------------------
--  ID: 5396
--  Item: bottle_of_shepherds_drink
--  Item Effect: Instantly restores 20%-35% of pet HP
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")

function onItemCheck(target)
    if (not target:hasPet()) then
        return tpz.msg.basic.REQUIRES_A_PET
    end

    if (target:hasStatusEffect(tpz.effect.MEDICINE)) then
        return tpz.msg.basic.ITEM_NO_USE_MEDICATED
    end
    return 0
end

function onItemUse(target)
    local percent = math.random(20, 35) * ITEM_POWER
    local pet = target:getPet()
    local totalHP = (pet:getMaxHP()/100)*percent
    pet:addHP(totalHP)
    pet:messageBasic(tpz.msg.basic.RECOVERS_HP, 0, totalHP)
    target:addStatusEffect(tpz.effect.MEDICINE,0,0,900)
end