-----------------------------------
-- Area: Bhaflau Remnants
-- Door: Gilded Doors Floor 1 west hallway n
-- @pos 220 2 -280
-----------------------------------
local ID = require("scripts/zones/Bhaflau_Remnants/IDs")
require("scripts/globals/status")

function onTrigger(entity, npc)
    if (npc:getInstance():getStage() == 1) and (npc:getInstance():getProgress() == 2) then
        entity:startEvent(300)
    else
        entity:messageSpecial(ID.text.DOOR_IS_SEALED)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(entity, eventid, result, door)
    if (eventid == 300 and result == 1) then
        door:setAnimation(8)
        door:untargetable(true)
        local instance = door:getInstance()
        instance:setStage(1)
        instance:setProgress(2)
        for id = ID.mob[1][6].MOBS_START, ID.mob[1][6].MOBS_END do -- spawn mobs on west side
            SpawnMob(id, instance)
        end
    end
end