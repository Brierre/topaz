-----------------------------------
-- Area: Silver Sea Remnants
--  MOB: Ashu Talif Crew, F1 last room, 16 ATC with different aggro mechanics 
-- ToDo: Need to follow when target is sneaked. Currently only follow w/o sneak until damaged
      -- Not respawning by mob_groups entry
-----------------------------------
local ID = require("scripts/zones/Silver_Sea_Remnants/IDs")
require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/salvage")

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.SUPERLINK,1)
end

local function atcFollow(mob, target)
    mob:SetAutoAttackEnabled(false)
    mob:SetMobAbilityEnabled(false)
end

function onMobEngaged(mob,target)
    if target:hasStatusEffect(tpz.effect.SNEAK) == true then
        atcFollow(mob, target)
    end
end

function onMobFight(mob,target)
    if target:hasStatusEffect(tpz.effect.SNEAK) == false then
        mob:SetAutoAttackEnabled(true)
        mob:SetMobAbilityEnabled(true)
    end
end

function onMobDeath(mob, player, isKiller)
    if isKiller then
        local instance = mob:getInstance()
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