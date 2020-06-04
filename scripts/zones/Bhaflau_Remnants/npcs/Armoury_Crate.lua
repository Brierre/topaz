-----------------------------------
-- Area: Bhaflau Remnants
-- NPC: Armoury Crate (Bhaflau)
-----------------------------------
local ID = require("scripts/zones/Bhaflau_Remnants/IDs")
require("scripts/globals/status")
require("scripts/globals/salvage")
-----------------------------------

function onTrigger(player, npc)
    local instance = npc:getInstance()
    local npcid = npc:getID()
    if npcid == (ID.npc[1][2].ARMOURY_CRATE) then -- if this is first crate only in IDs, give cells
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
        instance:getEntity(bit.band(npcid, 0xFFF), tpz.objType.NPC):setStatus(tpz.status.DISAPPEAR)

    else 

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
--[[    local npc       = player:getEventTarget()
    local instance  = npc:getInstance()
    local tempItem1 = npc:getLocalVar("[crate]item1")
    local tempItem2 = npc:getLocalVar("[crate]item2")
    local tempItem3 = npc:getLocalVar("[crate]item3")
    local temp1     = npc:getLocalVar("[crate]temp1") -- these are the values that determine the items in the chest, 65536 + item number
    local temp2     = npc:getLocalVar("[crate]temp2")
    local temp3     = npc:getLocalVar("[crate]temp3")
    
    if csid == 2 and option == 1 then
        if player:hasItem(tempItem1) then
            return player:messageSpecial(ID.text.ALREADY_POSSESS_TEMP)
        else
            player:addTempItem(tempItem1)
            player:messageSpecial(ID.text.OBTAINED_TEMPORARY_ITEM,tempItem1)
            npc:setLocalVar("[crate]temp1", temp1 - 65536)
            if  npc:getLocalVar("[crate]temp1") < 65536 and 
                npc:getLocalVar("[crate]temp2") < 65536 and 
                npc:getLocalVar("[crate]temp3") < 65536 then
                for id = ID.crate[5].RC1, ID.crate[5].RC20 do
                    if id == npc:getID() then
                    GetNPCByID(id, instance):setStatus(tpz.status.DISAPPEAR)
                    end
                end
                if not (npc:getStatus() == tpz.status.DISAPPEAR) then
                    npc:hideNPC(4)
                    salvageUtil.getDropsFloorFour(npc, instance)
                end
            end
        end
    elseif csid == 2 and option == 2 then
        if player:hasItem(tempItem2) then
            return player:messageSpecial(ID.text.ALREADY_POSSESS_TEMP)
        else
            player:addTempItem(tempItem2)
            player:messageSpecial(ID.text.OBTAINED_TEMPORARY_ITEM,tempItem2)
            npc:setLocalVar("[crate]temp2", temp2 - 65536)
            if  npc:getLocalVar("[crate]temp1") < 65536 and 
                npc:getLocalVar("[crate]temp2") < 65536 and 
                npc:getLocalVar("[crate]temp3") < 65536 then
                for id = ID.crate[5].RC1, ID.crate[5].RC20 do
                    if id == npc:getID() then
                    GetNPCByID(id, instance):setStatus(tpz.status.DISAPPEAR)
                    end
                end
                if not (npc:getStatus() == tpz.status.DISAPPEAR) then
                    npc:hideNPC(4)
                    salvageUtil.getDropsFloorFour(npc, instance)
                end
            end
        end
    elseif csid == 2 and option == 3 then
        if player:hasItem(tempItem3) then
            return player:messageSpecial(ID.text.ALREADY_POSSESS_TEMP)
        else
            player:addTempItem(tempItem3)
            player:messageSpecial(ID.text.OBTAINED_TEMPORARY_ITEM,tempItem3)
            npc:setLocalVar("[crate]temp3", temp3 - 65536)
            if  npc:getLocalVar("[crate]temp1") < 65536 and 
                npc:getLocalVar("[crate]temp2") < 65536 and 
                npc:getLocalVar("[crate]temp3") < 65536 then
                for id = ID.crate[5].RC1, ID.crate[5].RC20 do
                    if id == npc:getID() then
                    GetNPCByID(id, instance):setStatus(tpz.status.DISAPPEAR)
                    end
                end
                if not (npc:getStatus() == tpz.status.DISAPPEAR) then
                    npc:hideNPC(4)
                    salvageUtil.getDropsFloorFour(npc, instance)
                end
            end
        end
    end]]
end
