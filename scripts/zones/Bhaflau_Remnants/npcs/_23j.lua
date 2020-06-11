-----------------------------------
-- Area: Bhaflau Remnants
-- Door: Gilded Doors Floor 2 ne porter
-- @pos 420 2 320
-----------------------------------
local ID = require("scripts/zones/Bhaflau_Remnants/IDs")
require("scripts/globals/status")
require("scripts/globals/salvage")

function onTrigger(entity, npc)
    if (npc:getInstance():getStage() == 2) and (npc:getInstance():getProgress() == 3) then
        entity:startEvent(300)
    else
        entity:messageSpecial(ID.text.DOOR_IS_SEALED)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(entity, eventid, result, door)
    if (eventid == 300 and result == 1 and (door:getInstance():getProgress() == 3)) then
        door:setAnimation(8)
        door:untargetable(true)
        local instance = door:getInstance()
        instance:setStage(3)
        instance:setProgress(0)
        for id = ID.mob[3][4].MOBS_START, ID.mob[3][4].MOBS_END do
            SpawnMob(id, instance)
        end
    end
end