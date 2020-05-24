-----------------------------------
-- Area: Arrapago Remnants
--  Mob: Archaic Gear
-----------------------------------
local ID = require("scripts/zones/Silver_Sea_Remnants/IDs")
require("scripts/globals/status")
require("scripts/globals/settings")
mixins = {require("scripts/mixins/families/gears")}

function onMobDeath(mob, player, isKiller)
    local instance = mob:getInstance()
    if (isKiller) then
        if (player:getInstance():getStage() == 3) and (player:getInstance():getProgress() == 1 or player:getInstance():getProgress() == 2) then
            local allDeadGearsOne = true        
            local allDeadGearsTwo = true
            
            for i = ID.mob[3][2].MOBS_START, ID.mob[3][2].MOBS_END do
                if GetMobByID(i, instance):isAlive() then
                -- we found a living mob, so there's no need to check any more
                    allDeadGearsOne = false
                    break
                end
            end
        
            if allDeadGearsOne then
                SpawnMob(ID.mob[3][3].GYROSCOPIC_GEAR, instance)
            end
            
        elseif (player:getInstance():getStage() == 3) and (player:getInstance():getProgress() == 3) then
            for i = ID.mob[3][7].MOBS_START, ID.mob[3][7].MOBS_END do
                if GetMobByID(i, instance):isAlive() then
                -- we found a living mob, so there's no need to check any more
                    allDeadGearsTwo = false
                    break
                end
            end
        
            if allDeadGearsTwo then
                SpawnMob(ID.mob[3][8].GYROSCOPIC_GEARS, instance)
            end
        end
    end
end

function onMobDespawn(mob)
end