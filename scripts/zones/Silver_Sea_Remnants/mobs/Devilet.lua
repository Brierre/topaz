-----------------------------------
-- Area: Silver Sea Remnants
--  MOB: Devilet
-- ToDo: Link with fomor family
-----------------------------------
mixins = {require("scripts/mixins/families/imp")}
local ID = require("scripts/zones/Silver_Sea_Remnants/IDs")
require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/salvage")

function onMobSpawn(mob)
    mob:setMod(tpz.mod.MOVE, 100)
end

function onMobFight(mob,target)
    local instance = mob:getInstance()
    for i = ID.mob[2][6].MOBS_START, ID.mob[2][6].MOBS_END do -- for each fomor, check range
        local assist = GetMobByID(i, instance)
        if (assist:checkDistance(mob) <= 15) then -- if within range
            assist:updateEnmity(target) -- fomor assist engaged imp
        end
    end
end

function onMobDeath(mob, player, isKiller)
    if isKiller then
        local instance = mob:getInstance()
        local allDead = true        
        if (player:getInstance():getStage() == 2) and (player:getInstance():getProgress() == 4) then
            for i = ID.mob[2][5].MOBS_START, ID.mob[2][5].MOBS_END do
                if GetMobByID(i, instance):isAlive() then
                    -- we found a living mob, so there's no need to check any more
                    allDead = false
                    break
                end
            end
        
            if allDead then
                instance:setProgress(6) -- set progress when all 4 are dead
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