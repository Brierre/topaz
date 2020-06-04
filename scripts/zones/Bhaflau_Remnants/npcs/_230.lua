-----------------------------------
-- Area: Bhaflau Remnants
-- Door: Gilded Doors Floor 1 start of instance
-- @pos 340 14 -520
-----------------------------------
local ID = require("scripts/zones/Bhaflau_Remnants/IDs")
require("scripts/globals/status")

function onTrigger(entity, npc)
    entity:startEvent(300)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(entity, eventid, result, door)
    if (eventid == 300 and result == 1) then
        door:setAnimation(8) -- open door and leave open/untargetable
        door:untargetable(true)
        local instance = door:getInstance()
        for i,v in pairs(ID.npc[1][2]) do -- spawn first chest 
            local npc = instance:getEntity(bit.band(v, 0xFFF), tpz.objType.NPC)
            npc:setStatus(tpz.status.NORMAL)
        end
    end
end