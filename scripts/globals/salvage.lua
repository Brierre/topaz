-----------------------------------
-- Salvage Global Functions
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/zone")
-----------------------------------
salvageUtil = {}
-----------------------------------

function salvageUtil.onCellItemCheck(target, effect, value)
    local statusEffect = target:getStatusEffect(effect)
    if statusEffect then
        local power = statusEffect:getPower()
        if bit.band(power, value) > 0 then
            return 0
        end
    end
    return 55
end

function salvageUtil.onCellItemUse(target, effect, value, offset)
    local statusEffect = target:getStatusEffect(effect)
    local power = statusEffect:getPower()
    local newpower = bit.band(power, bit.bnot(value))
    local pet = target:getPet()

    target:delStatusEffectSilent(effect)
    if newpower > 0 then
        local duration = math.floor(statusEffect:getTimeRemaining()/1000)
        target:addStatusEffectEx(effect, effect, newpower, 0, duration)
    end
    if pet ~= nil and effect == tpz.effect.DEBILITATION then
        pet:delStatusEffectSilent(effect)
        if newpower > 0 then
            local duration = math.floor(statusEffect:getTimeRemaining()/1000)
            pet:addStatusEffectEx(effect, effect, newpower, 0, duration)
        end
    end
    target:messageText(target, zones[target:getZoneID()].text.CELL_OFFSET + offset)
end

-------------------------------------------------------
-- Armoury Crates
-------------------------------------------------------

tpz = tpz or {}
tpz.crate = tpz.crate or {}

local crateInfo =
{
    spawnStatus =
    {
        DESPAWNED      = 0,
        SPAWNED_CLOSED = 1,
        SPAWNED_OPEN   = 2,
    },
}

function setTempItems(npc, temp1, temp2, temp3)
    npc:setLocalVar("[crate]temp1", temp1)
    npc:setLocalVar("[crate]temp2", temp2)
    npc:setLocalVar("[crate]temp3", temp3)
    npc:setLocalVar("[crate]ITEMS_SET", 1)
end

function getDrops(npc, instance)
        local instance     = npc:getInstance()
        local randomTable  = {1,3,1,2,1,2,1,1,3,1,2,1}
        local tempItems    = {4116, 4146, 4147, 4200, 4254, 4255, 5242, 5253, 5322, 5385, 5386, -- regular pot is 4112, used later. 4116 is hi-pot and can be changed for retail acc
                              5387, 5388, 5389, 5390, 5391, 5392, 5393, 5394, 5395, 5396, 5431,
                              5432, 5433, 5434, 5435, 5436, 5437, 5438, 5439} 
        local tempSlots    = randomTable[math.random(#randomTable)]
        local tempItem1    = tempItems[math.random(#tempItems)]
        local tempItem2    = tempItems[math.random(#tempItems)]
        local tempItem3    = tempItems[math.random(#tempItems)]
        local tempCount1   = randomTable[math.random(#randomTable)]
        local tempCount2   = randomTable[math.random(#randomTable)]
        local tempCount3   = randomTable[math.random(#randomTable)]
        local temp1        = tempCount1*65536 + tempItem1
        local temp2        = tempCount2*65536 + tempItem2
        local temp3        = tempCount3*65536 + tempItem3
        if tempSlots == 1 then
            temp2 = 0
            temp3 = 0
        elseif tempSlots == 2 then
            temp3 = 0
        end

        setTempItems(npc, temp1, temp2, temp3)
end