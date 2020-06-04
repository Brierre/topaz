-----------------------------------
-- Area: Bhaflau Remnants
-- Door: Gilded Doors Floor 3 from sw
-- @pos -400 -2 -500
-----------------------------------
local ID = require("scripts/zones/Bhaflau_Remnants/IDs")
require("scripts/globals/status")

function onTrigger(entity, npc)
    if (npc:getInstance():getStage() == 3) and (npc:getInstance():getProgress() == 0) then
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
        instance:setProgress(1)
        for id = ID.mob[3][5].MOBS_START, ID.mob[3][5].MOBS_END do -- spawn mobs in southcentral room
            SpawnMob(id, instance)
        end
        SpawnMob(ID.mob[3][5].RAMPART1, instance)
        SpawnMob(ID.mob[3][5].RAMPART2, instance)
        SpawnMob(ID.mob[3][5].RAMPART3, instance)
        SpawnMob(ID.mob[3][5].RAMPART4, instance)
    end
end