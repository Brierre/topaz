-----------------------------------
-- Area: Silver Sea Remnants
-- Door: Gilded Doors Floor 2 NW hallway
-- @pos 260 -2 480
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
        instance:setProgress(1)
        SpawnMob(ID.mob[2][1].DEADPAN_DEVILET, instance)
--        GetNPCByID(ID.npc[2][4].SOCKET, instance):setStatus(tpz.status.NORMAL)
    end
end