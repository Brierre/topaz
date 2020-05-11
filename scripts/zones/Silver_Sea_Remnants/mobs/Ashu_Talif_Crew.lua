-----------------------------------
-- Area: Silver Sea Remnants
--  MOB: Ashu Talif Crew
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");


-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if GetMobByID(17088551):isDead() and GetMobByID(17088552):isDead() and
        GetMobByID(17088553):isDead() and GetMobByID(17088554):isDead() and
        GetMobByID(17088555):isDead() and GetMobByID(17088556):isDead() then
        SpawnMob(17088557);
        GetNPCByID(17089390):setAnimation(8);
    end
end;