-----------------------------------
-- Area: Silver Sea Remnants
--  MOB: Deadpan Devilet
-----------------------------------
local ID = require("scripts/zones/Silver_Sea_Remnants/IDs")
require("scripts/globals/status")
require("scripts/globals/settings")

function onMobSpawn(mob)

end

function onMobDeath(mob, player, isKiller)
    local instance = mob:getInstance()
    instance:setProgress(5) -- set progress when mob dies
    SpawnMob(ID.mob[2][2].DEKKA, instance)
end