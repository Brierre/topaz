-----------------------------------
-- Area: Silver Sea Remnants
--  MOB: Ashu Talif Crew
-----------------------------------
local ID = require("scripts/zones/Silver_Sea_Remnants/IDs")
require("scripts/globals/status")
require("scripts/globals/settings")

function onMobSpawn(mob)

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
    end
end