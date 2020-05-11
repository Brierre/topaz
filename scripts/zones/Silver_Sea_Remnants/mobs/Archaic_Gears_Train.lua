-----------------------------------
-- Archaic Gears (train)
-- Zone: Silver Sea Remnants
-----------------------------------

require("scripts/globals/pathfind");

local path =
{
    -286,-4,79,
    -275,-4,72,
    -264,-4,69,
    -260,-4,79,
    -255,-4,90,
    -244,-4,87,
    -233,-4,79,
    -244,-4,71,
    -255,-4,69,
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
    if (mob:isFollowingPath() == false) then
        mob:pathThrough(pathfind.random(path), PATHFLAG_RUN);
    end
end;