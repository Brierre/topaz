-----------------------------------
-- Area: Silver Sea Remnants
-- Door: Gilded Doors Floor 4 east
-- @pos -320 -2 20
-----------------------------------
local ID = require("scripts/zones/Silver_Sea_Remnants/IDs")
require("scripts/globals/status")

function onTrigger(entity, npc)
    if (npc:getInstance():getStage() == 4) and (npc:getInstance():getProgress() == 1) then
        entity:startEvent(300)
    else
        entity:messageSpecial(ID.text.DOOR_IS_SEALED)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(entity, eventid, result, door)
    if (eventid == 300 and result == 1 and (door:getInstance():getProgress() == 1)) then
        door:setAnimation(8)
        door:untargetable(true)
        local instance = door:getInstance()
        instance:setStage(5)
        instance:setProgress(0)
    end
end