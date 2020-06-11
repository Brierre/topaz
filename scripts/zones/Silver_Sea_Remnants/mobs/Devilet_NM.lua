-----------------------------------
-- Area: Silver Sea Remnants
--  MOB: Devilet
-----------------------------------
local ID = require("scripts/zones/Silver_Sea_Remnants/IDs")
require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/pathfind")
require("scripts/globals/salvage")

local path =
{
    [1]  = {-313,0,-327},
    [2]  = {-366,0,-327},
    [3]  = {-366,0,-273},
    [4]  = {-313,0,-273},
    [5]  = {-313,0,-327},
}

function onMobSpawn(mob)
        mob:addStatusEffectEx(tpz.effect.FLEE)
        mob:setLocalVar("pathPoint", 1)
        onMobRoam(mob) -- start roam right away
end

function onPath(mob)
    local pathPoint = mob:getLocalVar("pathPoint")

    if mob:atPoint(path[pathPoint]) then
        print("at pathpoint: "..pathPoint)
        if pathPoint == 5 then
            mob:setLocalVar("pathPoint", 1)
        else
            mob:setLocalVar("pathPoint", pathPoint + 1)
        end
    end

    if not mob:isFollowingPath() then
        mob:pathThrough(path[pathPoint])
    end

end

function onMobRoam(mob)
    onPath(mob)
end

function onMobEngaged(mob, target)
    local runTime = mob:getLocalVar("runTime")

    if runTime > os.time() then
        mob:disengage() -- ignore player until time is up
    end
end

function onMobDisengage(mob)
    onPath(mob) -- continue pathing where left off upon disengage
end

function onMobFight(mob, target)
    local hpp = mob:getLocalVar("hpp")
    local runTime = mob:getLocalVar("runTime")

    if mob:actionQueueEmpty() then -- if not busy
        if mob:getHPP() > 88 then -- if mob hp is above first trigger
            mob:setLocalVar("hpp", 88) -- set var to 88 so next time it hits the else
        elseif mob:getHPP() > 0 and mob:getHPP() < hpp then -- if he's not dead, but he's <= 88
            mob:setLocalVar("hpp", hpp - 12) -- reduce var by 12
            mob:setLocalVar("runTime", os.time() + 12)
            mob:disengage() -- disengage (and he will start back to his path)
        end
    end
end

function onMobDeath(mob, player, isKiller)
    if isKiller then
        local instance = mob:getInstance()
        if (player:getInstance():getStage() == 3) and (player:getInstance():getProgress() == 1) then
                instance:setStage(3)
                instance:setProgress(2)
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
