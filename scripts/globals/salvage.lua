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

local function setTempItems(npc, temp1, temp2, temp3)
    npc:setLocalVar("[crate]temp1", temp1)
    npc:setLocalVar("[crate]temp2", temp2)
    npc:setLocalVar("[crate]temp3", temp3)
    npc:setLocalVar("[crate]ITEMS_SET", 1)
end

local function setItems(npc, tempItem1, tempItem2, tempItem3)
    npc:setLocalVar("[crate]item1", tempItem1)
    npc:setLocalVar("[crate]item2", tempItem2)
    npc:setLocalVar("[crate]item3", tempItem3)
end

salvageUtil.getDrops = function(npc, instance)
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
        print(string.format("npcId = %u temp1 = %d temp2 = %d temp3 = %d", npc:getID(), temp1, temp2, temp3))
        setItems(npc, tempItem1, tempItem2, tempItem3)
        print(string.format("npcId = %u tempItem1 = %d tempItem2 = %d tempItem3 = %d", npc:getID(), tempItem1, tempItem2, tempItem3))
end

salvageUtil.getDropsFloorOne = function(npc, instance)
        local randomTable  = {1,3,1,2,1,2,1,1,3,1,2,1}
        local tempItems    = {4112, 4116, 4254, 5431, 5432, 5433, 5436, 5437, 5438} 
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
        print(string.format("npcId = %u temp1 = %d temp2 = %d temp3 = %d", npc:getID(), temp1, temp2, temp3))
        setItems(npc, tempItem1, tempItem2, tempItem3)
        print(string.format("npcId = %u tempItem1 = %d tempItem2 = %d tempItem3 = %d", npc:getID(), tempItem1, tempItem2, tempItem3))
end

salvageUtil.getDropsFloorFour = function(npc, instance)
        local tempItems    = {4112, 4116, 4146, 4147, 4200, 4254, 4255, 5242, 5253, 5322, 5385, 5386, -- regular pot is 4112, used later. 4116 is hi-pot and can be changed for retail acc
                              5387, 5388, 5389, 5390, 5391, 5392, 5393, 5394, 5395, 5396, 5431,
                              5432, 5433, 5434, 5435, 5436, 5437, 5438, 5439} 
        local tempItem1    = tempItems[math.random(#tempItems)]
        local tempItem2    = 0
        local tempItem3    = 0
        local temp1        = 65536 + tempItem1
        local temp2        = 0
        local temp3        = 0
        
        setTempItems(npc, temp1,temp2,temp3)
        print(string.format("npcId = %u temp1 = %d", npc:getID(), temp1))
        setItems(npc, tempItem1,tempItem2,tempItem3)
        print(string.format("npcId = %u tempItem1 = %d", npc:getID(), tempItem1))
end

salvageUtil.randomCrateDrop = function(mob)

end