-----------------------------------
-- Area: Silver Sea Remnants
-- Door: Gilded Doors Floor 2 east hallway
-- @pos 400 -6 420
-----------------------------------
local ID = require("scripts/zones/Silver_Sea_Remnants/IDs")
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
    if (eventid == 300 and result == 1) then
        door:setAnimation(8)
        door:untargetable(true)
        local instance = door:getInstance()
        instance:setStage(2)
        instance:setProgress(4)
        for id = ID.mob[2][5].MOBS_START, ID.mob[2][6].MOBS_END do -- spawn mobs in SE room
            SpawnMob(id, instance)
        end
    end
end