-----------------------------------
-- Area: Silver Sea Remnants
--  Mob: Archaic Chariot
-----------------------------------
local ID = require("scripts/zones/Silver_Sea_Remnants/IDs")
require("scripts/globals/status")

function onMobDeath(mob, player, isKiller)
    local instance = mob:getInstance()
    if (isKiller) then
        if (player:getInstance():getStage() == 4) and (player:getInstance():getProgress() == 0) then
            if GetMobByID(ID.mob[4][5].ARCHAIC_CHARIOT, instance):isDead() then
                instance:setStage(4)
                instance:setProgress(1)
            end
        end
    end
end