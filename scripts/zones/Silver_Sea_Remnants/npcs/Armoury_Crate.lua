-----------------------------------
-- Area: Silver Sea Remnants
-- NPC: Armoury Crate (SSR)
-----------------------------------
local ID = require("scripts/zones/Silver_Sea_Remnants/IDs")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/salvage")
-----------------------------------
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

-- Desc: Sets the temp items id in a local variable for the crate.
function setTempItems(npc, temp1, temp2, temp3)
    npc:setLocalVar("[crate]temp1", temp1)
    npc:setLocalVar("[crate]temp2", temp2)
    npc:setLocalVar("[crate]temp3", temp3)
    npc:setLocalVar("[crate]ITEMS_SET", 1)
end

-- Grab random drops from zone item or temp tables depending on type of crate
local function getDrops(npc, instance)
        local instance     = npc:getInstance()
        local randomTable  = {1,3,1,2,1,2,1,1,3,1,2,1}
        local tempItems =  {4116, 4146, 4147, 4200, 4254, 4255, 5242, 5253, 5322, 5385, 5386, -- regular pot is 4112, used later. 4116 is hi-pot and can be changed for retail acc
                            5387, 5388, 5389, 5390, 5391, 5392, 5393, 5394, 5395, 5396, 5431,
                            5432, 5433, 5434, 5435, 5436, 5437, 5438, 5439} 
        local tempSlots  = randomTable[math.random(#randomTable)]
        local tempItem1  = tempItems[math.random(#tempItems)]
        local tempItem2  = tempItems[math.random(#tempItems)]
        local tempItem3  = tempItems[math.random(#tempItems)]
        local tempCount1 = randomTable[math.random(#randomTable)] -- orig (tempItems[math.random(#tempItems)], npc) 
        local tempCount2 = randomTable[math.random(#randomTable)]
        local tempCount3 = randomTable[math.random(#randomTable)]
        local temp1     = tempCount1*65536 + tempItem1
        local temp2     = tempCount2*65536 + tempItem2
        local temp3     = tempCount3*65536 + tempItem3
        if tempSlots == 1 then
            temp2 = 0
            temp3 = 0
        elseif tempSlots == 2 then
            temp3 = 0
        end

        setTempItems(npc, temp1, temp2, temp3)
end

function onTrigger(player, npc)
    local instance = npc:getInstance()
    local npc = npc:getID()
    if npc == (ID.npc[1][2].ARMOURY_CRATE) then -- if this is first crate only in IDs, give cells
        --npc:AnimationSub(1)
        local FIRST = {5367, 5371, 5383,5384}
        local SECOND = {5366, 5368, 5369, 5370, 5372, 5376, 5377, 5378, 5379, 5380, 5381, 5382}
        player:addTreasure(5365, npc)
        player:addTreasure(5365, npc)
        player:addTreasure(5373, npc)
        player:addTreasure(5375, npc)
        player:addTreasure(5374, npc)
        player:addTreasure(FIRST[math.random(#FIRST)], npc)
        player:addTreasure(FIRST[math.random(#FIRST)], npc)
        player:addTreasure(SECOND[math.random(#SECOND)], npc)
        player:addTreasure(SECOND[math.random(#SECOND)], npc)
        if math.random(1,2) == 1 then
            player:addTreasure(5375, npc)
        else
            player:addTreasure(5374, npc)
        end
        instance:getEntity(bit.band(npc, 0xFFF), tpz.objType.NPC):setStatus(tpz.status.DISAPPEAR)
   -- elseif npc is in the list of crates dropped by ATC (needs added to IDs) drop a crate with xyz in it from temp items. More research needed
    
    else -- otherwise, the crates contain a random temp item; will need another array for the crates dropped by ATC
        local npc       = player:getEventTarget()
        local instance  = npc:getInstance()

        --getDrops(npc, instance)

        local temp1     = npc:getLocalVar("[crate]temp1")
        local temp2     = npc:getLocalVar("[crate]temp2")
        local temp3     = npc:getLocalVar("[crate]temp3")
        
        player:startEvent(2,
            temp1, temp2, temp3,0,0,0,0,0)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
