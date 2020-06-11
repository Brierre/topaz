-----------------------------------
-- Area: Bhaflau Remnants
-- Door: Gilded Doors Floor 1 porter to fl2
-- @pos 340 -2 -400
-----------------------------------
local ID = require("scripts/zones/Bhaflau_Remnants/IDs")
require("scripts/globals/status")
require("scripts/globals/salvage")

function onTrigger(entity, npc)
    if (npc:getInstance():getStage() == 3) and (npc:getInstance():getProgress() == 3) then
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
        instance:setStage(4)
        instance:setProgress(2)
        for id = ID.mob[4][1].MOBS_START, ID.mob[4][1].MOBS_END do -- spawn mobs on east path
            SpawnMob(id, instance)
        end
    end
end