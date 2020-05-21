-----------------------------------
-- Area: Silver Sea Remnants
-- Door: Gilded Gateway
-- @pos -340 -4 600
-----------------------------------
local ID = require("scripts/zones/Silver_Sea_Remnants/IDs")
require("scripts/globals/status")

function onTrigger(entity, npc)
    entity:startEvent(300)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(entity, eventid, result, door)
    if (eventid == 300 and result == 1) then
        door:setAnimation(8)
        door:untargetable(true)
    end
end