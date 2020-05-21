-----------------------------------
-- Area: Silver Sea Remnants
-- Door: Gilded Doors Floor 2 nw hallway
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
    if (eventid == 300 and result == 1) then
        door:setAnimation(8)
        door:untargetable(true)
        local instance = door:getInstance()
        instance:setStage(2)
        instance:setProgress(1)
        SpawnMob(ID.mob[2][1].DEADPAN_DEVILET, instance)
        for i,v in pairs(ID.npc[2][4]) do
            local npc = instance:getEntity(bit.band(v, 0xFFF), tpz.objType.NPC)
            npc:setStatus(tpz.status.NORMAL)
        end
    end
end