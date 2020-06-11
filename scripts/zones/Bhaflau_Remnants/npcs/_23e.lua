-----------------------------------
-- Area: Bhaflau Remnants
-- Door: Gilded Doors Floor 2 sw
-- @pos 260 -2 200
-----------------------------------
local ID = require("scripts/zones/Bhaflau_Remnants/IDs")
require("scripts/globals/status")
require("scripts/globals/salvage")

function onTrigger(entity, npc)
    if (npc:getInstance():getStage() == 2) and (npc:getInstance():getProgress() == 4) then
        entity:startEvent(300)
    else
        entity:messageSpecial(ID.text.DOOR_IS_SEALED)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(entity, eventid, result, door)
    if (eventid == 300 and result == 1 and (door:getInstance():getProgress() == 0)) then
        door:setAnimation(8)
        door:untargetable(true)
        local instance = door:getInstance()
        for id = ID.mob[2][7].MOBS_START, ID.mob[2][7].MOBS_END do
            SpawnMob(id, instance)
        end
        instance:setStage(2)
        instance:setProgress(6)
    end
end