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
        instance:setProgress(0)
        for k,v in pairs(ID.crate[4].eastStatic) do -- spawn floor 4 crates
            local npc = instance:getEntity(bit.band(k, 0xFFF), tpz.objType.NPC)
            npc:setPos(unpack(v))
            npc:setStatus(tpz.status.NORMAL)
            salvageUtil.getDropsFloorFour(npc, instance)
        end
    end
end