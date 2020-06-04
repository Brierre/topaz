-----------------------------------------
--  ID: 5439
--  Item: bottle_of_vicars_drink
--  Item Effect: Cures most status ailments
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
    target:delStatusEffect(tpz.effect.PARALYSIS)
    target:delStatusEffect(tpz.effect.BIND)
    target:delStatusEffect(tpz.effect.WEIGHT)
    target:delStatusEffect(tpz.effect.ADDLE)
    target:delStatusEffect(tpz.effect.BURN)
    target:delStatusEffect(tpz.effect.FROST)
    target:delStatusEffect(tpz.effect.CHOKE)
    target:delStatusEffect(tpz.effect.RASP)
    target:delStatusEffect(tpz.effect.SHOCK)
    target:delStatusEffect(tpz.effect.DROWN)
    target:delStatusEffect(tpz.effect.DIA)
    target:delStatusEffect(tpz.effect.BIO)
    target:delStatusEffect(tpz.effect.STR_DOWN)
    target:delStatusEffect(tpz.effect.DEX_DOWN)
    target:delStatusEffect(tpz.effect.VIT_DOWN)
    target:delStatusEffect(tpz.effect.AGI_DOWN)
    target:delStatusEffect(tpz.effect.INT_DOWN)
    target:delStatusEffect(tpz.effect.MND_DOWN)
    target:delStatusEffect(tpz.effect.CHR_DOWN)
    target:delStatusEffect(tpz.effect.MAX_HP_DOWN)
    target:delStatusEffect(tpz.effect.MAX_MP_DOWN)
    target:delStatusEffect(tpz.effect.ATTACK_DOWN)
    target:delStatusEffect(tpz.effect.EVASION_DOWN)
    target:delStatusEffect(tpz.effect.DEFENSE_DOWN)
    target:delStatusEffect(tpz.effect.MAGIC_DEF_DOWN)
    target:delStatusEffect(tpz.effect.INHIBIT_TP)
    target:delStatusEffect(tpz.effect.MAGIC_ACC_DOWN)
    target:delStatusEffect(tpz.effect.MAGIC_ATK_DOWN)
    target:addStatusEffect(tpz.effect.MEDICINE,0,0,900) -- how many effects does it remove?
end
