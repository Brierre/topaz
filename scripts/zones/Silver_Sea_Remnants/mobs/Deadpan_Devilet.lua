-----------------------------------
-- Area: Silver Sea Remnants
--  MOB: Deadpan Devilet
-----------------------------------
local ID = require("scripts/zones/Silver_Sea_Remnants/IDs")
require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/salvage")

function onMobSpawn(mob)

end

function onMobDeath(mob, player, isKiller)
    local instance = mob:getInstance()
    instance:setProgress(5) -- set progress when mob dies
    SpawnMob(ID.mob[2][2].DEKKA, instance)
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