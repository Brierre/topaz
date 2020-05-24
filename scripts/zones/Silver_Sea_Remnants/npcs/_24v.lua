-----------------------------------
-- Area: Silver Sea Remnants
-- Door: Gilded Gateway at floor 5 Boss
-- @pos -340 -2 640
-----------------------------------
local ID = require("scripts/zones/Silver_Sea_Remnants/IDs")
require("scripts/globals/status")

function onTrigger(entity, npc)
    if (npc:getInstance():getStage() == 5) and (npc:getInstance():getProgress() == 0) then
        entity:startEvent(300)
    else
        entity:messageSpecial(ID.text.DOOR_IS_SEALED)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(entity, eventid, result, door)
    if (eventid == 300 and result == 1) then
        local instance = door:getInstance()
        door:setAnimation(8)
        door:untargetable(true)
        SpawnMob(ID.mob[5].LONG_ARMED_CHARIOT, instance)
    end
end