-----------------------------------
-- Area: Silver Sea Remnants
--  Mob: Archaic Chariot
-----------------------------------
local ID = require("scripts/zones/Silver_Sea_Remnants/IDs")
require("scripts/globals/status")
require("scripts/globals/salvage")

function onMobDeath(mob, player, isKiller)
    local instance = mob:getInstance()
    if (isKiller) then
        if (player:getInstance():getStage() == 4) and (player:getInstance():getProgress() == 0) then
            if GetMobByID(ID.mob[4][5].ARCHAIC_CHARIOT, instance):isDead() then
                instance:setStage(4)
                instance:setProgress(1)
            end
        end
        if math.random(1,10) <= 2 then
            for k,v in pairs(ID.crate[5]) do
                local npc = instance:getEntity(bit.band(v, 0xFFF), tpz.objType.NPC)
                if npc:getStatus() == (tpz.status.DISAPPEAR) then
                    local pos = mob:getPos()
                    npc:setPos(pos.x,pos.y,pos.z,pos.rot)
                    npc:setStatus(tpz.status.NORMAL)
                    salvageUtil.getDrops(npc, instance)
                    break
                end
            end
        end
    end
end