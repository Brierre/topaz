-----------------------------------
-- Area: Bhaflau Remnants
-- Door: Gilded Doors Floor 1 east hallway n
-- @pos 460 2 -280
-----------------------------------
local ID = require("scripts/zones/Bhaflau_Remnants/IDs")
require("scripts/globals/status")

function onTrigger(entity, npc)
    if (npc:getInstance():getStage() == 1) and (npc:getInstance():getProgress() == 1) then
        entity:startEvent(300)
    else
        entity:messageSpecial(ID.text.DOOR_IS_SEALED)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(entity, eventid, result, door)
    if (eventid == 300 and result == 1 and (door:getInstance():getProgress() == 1)) then
        door:setAnimation(8)
        door:untargetable(true)
        local instance = door:getInstance()
        for id = ID.mob[1][1].MOBS_START, ID.mob[1][1].MOBS_END do -- spawn mobs on east side
            SpawnMob(id, instance)
        end
    end
end