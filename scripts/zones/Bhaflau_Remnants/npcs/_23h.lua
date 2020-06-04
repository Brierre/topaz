-----------------------------------
-- Area: Bhaflau Remnants
-- Door: Gilded Doors Floor 2 nw porter
-- @pos 260 2 320
-----------------------------------
local ID = require("scripts/zones/Bhaflau_Remnants/IDs")
require("scripts/globals/status")

function onTrigger(entity, npc)
    if (npc:getInstance():getStage() == 2) and (npc:getInstance():getProgress() == 5) then
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
        instance:setStage(3)
        instance:setProgress(0)
        for id = ID.mob[2][8].MOBS_START, ID.mob[2][8].MOBS_END do -- spawn mobs in NE room
            SpawnMob(id, instance)
        end
    end
end