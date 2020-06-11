-----------------------------------
-- Area: Bhaflau Remnants
-- Door: Gilded Doors Floor 1 porter to fl2
-- @pos 340 -2 -400
-----------------------------------
local ID = require("scripts/zones/Bhaflau_Remnants/IDs")
require("scripts/globals/status")

function onTrigger(entity, npc)
    if (npc:getInstance():getStage() == 3) and (npc:getInstance():getProgress() == 2) then
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
        instance:setStage(3)
        instance:setProgress(3)
        for id = ID.mob[3][7].MOBS_START, ID.mob[3][7].MOBS_END do -- spawn mobs in east/west rooms
            SpawnMob(id, instance)
        end
        for id = ID.mob[3][8].MOBS_START, ID.mob[3][8].MOBS_END do -- spawn mobs in east/west rooms
            SpawnMob(id, instance)
        end
    end
end