-----------------------------------
-- Area: Bhaflau Remnants
-- Door: Gilded Doors Floor 3 w porter
-- @pos -460 -6 -480
-----------------------------------
local ID = require("scripts/zones/Bhaflau_Remnants/IDs")
require("scripts/globals/status")

function onTrigger(entity, npc)
    if (npc:getInstance():getStage() == 3) and (npc:getInstance():getProgress() == 3) then
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
        instance:setStage(4)
        instance:setProgress(1)
        for id = ID.mob[4][2].MOBS_START, ID.mob[4][2].MOBS_END do -- spawn mobs on west path
            SpawnMob(id, instance)
        end
    end
end