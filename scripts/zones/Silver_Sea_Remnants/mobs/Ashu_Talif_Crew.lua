-----------------------------------
-- Area: Silver Sea Remnants
--  MOB: Ashu Talif Crew
-- ToDo: Link with imps, group [1][4] all link
      -- Buff stats for groups [1][4] and [1][2]
-----------------------------------
local ID = require("scripts/zones/Silver_Sea_Remnants/IDs")
require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/salvage")

function onMobSpawn(mob)
    local instance = mob:getInstance()
    for i = ID.mob[2][6].MOBS_START, ID.mob[2][6].MOBS_END do
        mob:setMobMod(tpz.mobMod.NO_LINK, 1)
        mob:setMobMod(tpz.mobMod.TP_USE_CHANCE, 0)
    end
end

function onMobFight(mob,target)
    local WS_LINK_DISTANCE = 15
    local instance = mob:getInstance()
--    mob:setLocalVar("NO_WS",0)
    for imp = ID.mob[2][5].MOBS_START, ID.mob[2][5].MOBS_END do

        if GetMobByID(imp, instance):getCurrentAction() == tpz.act.MOBABILITY_FINISH then -- using? start?
            if mob:getLocalVar("NO_WS") == 0 then
                if GetMobByID(imp, instance):checkDistance(mob) < WS_LINK_DISTANCE then
                    mob:useMobAbility()
--                    mob:setLocalVar("NO_WS",1) -- somehow need to STOP ATC from spamming WS now. This isn't working
                end
            end
        end

    end
end

function onMobDeath(mob, player, isKiller)
    if isKiller then
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
    end
end