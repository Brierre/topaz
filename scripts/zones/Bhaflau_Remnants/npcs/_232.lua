-----------------------------------
-- Area: Bhaflau Remnants
-- Door: Gilded Doors Floor 1 west
-- @pos 320 14 -500
-----------------------------------
local ID = require("scripts/zones/Bhaflau_Remnants/IDs")
require("scripts/globals/status")

function onTrigger(entity, npc)
    if (npc:getInstance():getStage() == 1) and (npc:getInstance():getProgress() == 0) then
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
        instance:setStage(1)
        instance:setProgress(2)
        for id = ID.mob[1][5].MOBS_START, ID.mob[1][5].MOBS_END do -- spawn mobs on west side
            SpawnMob(id, instance)
        end
        if math.random(1,2) == 1 then
            SpawnMob(ID.mob[1][4].MAD_BOMBER, instance):setPos(259.48,15.498,-289.39,241)
        else
            SpawnMob(ID.mob[1][4].MAD_BOMBER, instance):setPos(229.52,16,-460.32,231)
        end
    end
end