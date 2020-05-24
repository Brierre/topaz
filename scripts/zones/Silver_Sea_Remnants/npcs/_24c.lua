-----------------------------------
-- Area: Silver Sea Remnants (was misnamed _24a in npc list)
-- Door: Gilded Doors Floor 2 SW hallway
-- @pos 180 -2 360
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
    if (eventid == 300 and result == 1 and (door:getInstance():getProgress() == 0)) then
        door:setAnimation(8)
        door:untargetable(true)
        local instance = door:getInstance()
        instance:setStage(2)
        instance:setProgress(3)
        for id = ID.mob[2][4].MOBS_START, ID.mob[2][4].MOBS_END do -- spawn mobs in SW room
            SpawnMob(id, instance)
        end
    end
end