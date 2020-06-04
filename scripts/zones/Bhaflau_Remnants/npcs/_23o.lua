-----------------------------------
-- Area: Bhaflau Remnants
-- Door: Gilded Doors Floor 3 from ne
-- @pos -280 -2 -260
-----------------------------------
local ID = require("scripts/zones/Bhaflau_Remnants/IDs")
require("scripts/globals/status")
require("scripts/globals/salvage")

function onTrigger(entity, npc)
    if (npc:getInstance():getStage() == 3) and (npc:getInstance():getProgress() == 0) then
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
        instance:setStage(3)
        instance:setProgress(2)
        for id = ID.mob[3][1].DEVILET, ID.mob[3][2].MOBS_END do -- spawn mobs in center slot room
            SpawnMob(id, instance)
        end
        for k, v in pairs(ID.crate[3].northStatic) do
            local npc = instance:getEntity(bit.band(k, 0xFFF), tpz.objType.NPC)
            npc:setPos(unpack(v))
            npc:setStatus(tpz.status.NORMAL)
            salvageUtil.getDrops(npc, instance)
        end
--        GetNPCByID(ID.npc[3][2].SLOT, instance):setStatus(tpz.status.NORMAL)
    end
end