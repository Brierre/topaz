-----------------------------------
-- Archaic Gear (patrol)
-- Zone: Silver Sea Remnants
-----------------------------------
local ID = require("scripts/zones/Silver_Sea_Remnants/IDs")
require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/pathfind")
mixins = {require("scripts/mixins/families/gears")}

local path =
{
    -250,0,171, -- room 1
    -262,0,189,
    -259,0,219,
    -288,0,219,
    -300,0,209,
    -300,0,187,
    -300,-4,154,
    -286,-4,139,
    -260,-4,140,
    -259,-4,92,
    -262,-4,78,
    -259,-4,63,
    -262,-4,20,
    -234,-4,20,
    -220,-4,8,
    -219,-4,-20,
    -252,-4,-20,
    -275,0,-20,
    -291,0,-19,
    -308,0,-29, -- turning point
    -291,0,-19,
    -275,0,-20,
    -252,-4,-20,
    -219,-4,-20,
    -220,-4,8,
    -234,-4,20,
    -262,-4,20,
    -259,-4,63,
    -266,-4,78,
    -261,-4,92,
    -260,-4,140,
    -286,-4,139,
    -300,-4,154,
    -300,0,187,
    -300,0,209,
    -288,0,219,
    -259,0,219,
    -260,0,197,
    -262,0,189,
    -250,0,171,
}

function onMobSpawn(mob)
    onMobRoam(mob)
--    onPath(mob)
end

function onPath(mob)
    tpz.path.patrol(mob, path, tpz.path.flag.RUN);
end

function onMobRoam(mob)
    if not mob:isFollowingPath() then
        mob:pathThrough(tpz.path.first(path), tpz.path.flag.RUN)
    end
end