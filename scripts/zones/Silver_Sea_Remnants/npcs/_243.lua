-----------------------------------
-- Area: Silver Sea Remnants
-- Door: Gilded Doors Floor 1 west1
-- @pos 220 10 -360
-----------------------------------
local ID = require("scripts/zones/Silver_Sea_Remnants/IDs")
require("scripts/globals/status")

function onTrigger(entity, npc)
    if (npc:getInstance():getStage() == 1) and (npc:getInstance():getProgress() == 1) then
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
    end
end
