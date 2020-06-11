-----------------------------------
-- Area: Bhaflau Remnants
-- Door: Gilded Doors Floor 2 east
-- @pos 400 -6 260
-----------------------------------
local ID = require("scripts/zones/Bhaflau_Remnants/IDs")
require("scripts/globals/status")

function onTrigger(entity, npc)
    if (npc:getInstance():getStage() == 2) and (npc:getInstance():getProgress() == 0) then
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
        instance:setStage(2)
        instance:setProgress(1)
        for id = ID.mob[2][2].MOBS_START, ID.mob[2][2].MOBS_END do
            SpawnMob(id, instance)
        end
        --SpawnMob(ID.mob[2][1].DORMANT_RAMPART):setPos(468,0,260,128) -- spawn on east side
    end
end