-----------------------------------
-- Area: Silver Sea Remnants
-- Door: Gilded Gateway
-- @pos -340 -6 600
-----------------------------------
local ID = require("scripts/zones/Silver_Sea_Remnants/IDs")
require("scripts/globals/status")

function onTrigger(entity, npc)
    if (npc:getInstance():getStage() == 5) and (npc:getInstance():getProgress() == 0) then
        entity:startEvent(300)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(entity, eventid, result, door)
    if (eventid == 300 and result == 1) then
        door:setStatus(tpz.status.STATUS_NORMAL)
    end
end