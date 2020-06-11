-----------------------------------
-- Area: Bhaflau Remnants
-- Door: Gilded Doors Floor 2 currently no file/npcid for this?
-- @pos 340 -2 -400
-----------------------------------
local ID = require("scripts/zones/Bhaflau_Remnants/IDs")
require("scripts/globals/status")

function onTrigger(entity, npc)
    if (npc:getInstance():getStage() == 2) and (npc:getInstance():getProgress() == 1) then
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
        instance:setStage(2)
        instance:setProgress(3)
        for id = ID.mob[2][3].MOBS_START, ID.mob[2][3].MOBS_END do
            SpawnMob(id, instance)
        end
    end
end