-----------------------------------
-- Area: Silver Sea Remnants
-- Door: Gilded Doors (west path)
-- @pos 320 15 -220 (17089386)
-----------------------------------
local ID = require("scripts/zones/Silver_Sea_Remnants/IDs")
require("scripts/globals/status")
require("scripts/globals/salvage")

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
        instance:setProgress(1)
        for id = ID.mob[1][3].MOBS_START, ID.mob[1][4].MOBS_END do -- spawn mobs on west side
            SpawnMob(id, instance)
        end
        for k,v in pairs(ID.crate[1].westStatic) do -- spawn floor 1 crates
            local npc = instance:getEntity(bit.band(k, 0xFFF), tpz.objType.NPC)
            npc:setPos(unpack(v))
            npc:setStatus(tpz.status.NORMAL)
            salvageUtil.getDropsFloorOne(npc, instance)
        end
    end
end