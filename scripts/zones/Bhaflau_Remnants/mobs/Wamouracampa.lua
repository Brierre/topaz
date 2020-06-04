-----------------------------------
-- Area: Bhaflau Remnants
--  MOB: Wamouracampa
-----------------------------------
local ID = require("scripts/zones/Bhaflau_Remnants/IDs")
require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/salvage")

function onMobSpawn(mob)

end

function onMobDeath(mob, player, isKiller)
--[[    if isKiller then
        local instance = mob:getInstance()

        local allDeadOne = true        
        local allDeadTwo = true
        if (player:getInstance():getStage() == 1) and (player:getInstance():getProgress() == 1) then
            for i = ID.mob[1][4].MOBS_START, ID.mob[1][4].MOBS_END do
                if GetMobByID(i, instance):isAlive() then
                -- we found a living mob, so there's no need to check any more
                    allDeadOne = false
                    break
                end
            end
        
            if allDeadOne then
                SpawnMob(ID.mob[1][5].HAMMERBLOW_MAJANUN, instance)
                instance:setProgress(3) -- may use door behind NM after these mobs die
            end
        elseif (player:getInstance():getStage() == 2) and (player:getInstance():getProgress() >= 4) then
            for i = ID.mob[2][6].MOBS_START, ID.mob[2][6].MOBS_END do
                if GetMobByID(i, instance):isAlive() then
                -- we found a living mob, so there's no need to check any more
                    allDeadTwo = false
                    break
                end
            end
        
            if allDeadTwo then
                SpawnMob(ID.mob[2][7].POWDERKEG_YANADAHN, instance)
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
    end]]
end