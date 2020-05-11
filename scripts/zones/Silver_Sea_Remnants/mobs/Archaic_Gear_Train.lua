-----------------------------------
-- Archaic Gear (train)
-- Zone: Silver Sea Remnants
-----------------------------------

require("scripts/globals/pathfind");

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
    -254,-4,78,
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
};

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    onMobRoam(mob);
end;


-----------------------------------
-- onPath Action
-----------------------------------

function onPath(mob)
    pathfind.patrol(mob, path, PATHFLAG_RUN);
end;

-----------------------------------
-- onMobRoam Action
-----------------------------------

function onMobRoam(mob)
    -- move to most recent position if not on the path
    if (mob:isFollowingPath() == false) then
        mob:pathThrough(pathfind.first(path), PATHFLAG_RUN);
    end
end;