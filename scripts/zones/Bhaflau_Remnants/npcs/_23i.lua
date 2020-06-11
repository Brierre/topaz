-----------------------------------
-- Area: Bhaflau Remnants
-- Door: Gilded Doors Floor 2 sw porter
-- @pos 260 -2 80
-----------------------------------
local ID = require("scripts/zones/Bhaflau_Remnants/IDs")
require("scripts/globals/status")

function onTrigger(entity, npc)
    if (npc:getInstance():getStage() == 2) and (npc:getInstance():getProgress() == 6) then
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
        instance:setStage(3)
        instance:setProgress(0)
        for id = ID.mob[3][2].MOBS_START, ID.mob[3][2].MOBS_END do
            SpawnMob(id, instance)
        end
    end
end