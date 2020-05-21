-----------------------------------
-- Area: Silver Sea Remnants
--  MOB: Devilet
-----------------------------------
local ID = require("scripts/zones/Silver_Sea_Remnants/IDs")
require("scripts/globals/status")
require("scripts/globals/settings")

function onMobSpawn(mob)

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
        
        elseif (player:getInstance():getStage() == 3) and (player:getInstance():getProgress() == 1) then
            if GetMobByID(ID.mob[3][1].DEVILET, instance):isDead() then
                instance:setStage(3)
                instance:setProgress(2)
            end
        end
    end
end
