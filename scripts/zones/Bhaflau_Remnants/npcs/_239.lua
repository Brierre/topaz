-----------------------------------
-- Area: Bhaflau Remnants
-- Door: Gilded Doors Floor 1 last room
-- @pos 340 -2 -280
-----------------------------------
local ID = require("scripts/zones/Bhaflau_Remnants/IDs")
require("scripts/globals/status")

function onTrigger(entity, npc)
    if (npc:getInstance():getStage() == 1) then
        entity:startEvent(300)
    else
        entity:messageSpecial(ID.text.DOOR_IS_SEALED)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(entity, eventid, result, door)
    local instance = door:getInstance()
    if (eventid == 300 and result == 1) then
        if (door:getInstance():getProgress() == 3) then
            for id = ID.mob[1][5].MOBS_START, ID.mob[1][6].MOBS_END do
                SpawnMob(id, instance)
            end
        elseif (door:getInstance():getProgress() == 4) then
            for id = ID.mob[1][4].MOBS_START, ID.mob[1][5].MOBS_END do
                SpawnMob(id, instance)
            end
        end 
        door:setAnimation(8)
        door:untargetable(true)
        instance:setStage(1)
        instance:setProgress(5)
    end
end