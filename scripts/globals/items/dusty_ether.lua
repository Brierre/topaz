-----------------------------------------
--  ID: 5432
--  Item: dusty_ether
--  Item Effect: Instantly restores a few MP 
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")

-- Item Effect: Restores 20 MP
-----------------------------------------
require("scripts/globals/settings")
require("scripts/globals/msg")

function onItemCheck(target)
    if (target:getMP() == target:getMaxMP()) then
        return tpz.msg.basic.ITEM_UNABLE_TO_USE
    end
    return 0
end

function onItemUse(target)
    target:messageBasic(tpz.msg.basic.RECOVERS_MP,0,target:addMP(20*ITEM_POWER))
end
