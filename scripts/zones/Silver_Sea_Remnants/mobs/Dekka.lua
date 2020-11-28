-----------------------------------
-- Area: Silver Sea Remnants
--  MOB: Dekka
-- ToDo: INSERT INTO mob_pool_mods VALUES (963,242,90,0); -- give Dekka -10% para resist (looking for para 2, actually, so IDK if we want to even put this in. Get retail capture) 
--       Check retail cap of attack delay in onMobSpawn()
-----------------------------------
mixins = {require("scripts/mixins/families/imp")}
local ID = require("scripts/zones/Silver_Sea_Remnants/IDs")
require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/salvage")

function onMobSpawn(mob)
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 75) -- check retail value
end

function onMobDeath(mob, player, isKiller)
    if isKiller then
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