-----------------------------------
-- Area: Silver Sea Remnants
--  Mob: Archaic Rampart
-----------------------------------
mixins = {require("scripts/mixins/families/rampart")}
local ID = require("scripts/zones/Silver_Sea_Remnants/IDs")
require("scripts/globals/instance")
require("scripts/globals/status")
require("scripts/globals/salvage")
-----------------------------------
function onMobSpawn(mob)
end

function onMobFight(mob,target)
    local instance = mob:getInstance()
    local popTime = mob:getLocalVar("lastPetPop")
    local POS = mob:getPos()
    local PET1 = instance:getEntity(bit.band((mob:getID() +1), 0xFFF), tpz.objType.MOB)
    local PET2 = instance:getEntity(bit.band((mob:getID() +2), 0xFFF), tpz.objType.MOB)
    local PET3 = instance:getEntity(bit.band((mob:getID() +3), 0xFFF), tpz.objType.MOB)


    if os.time() - popTime > 15 then
        if (not PET1:isSpawned()) then
            PET1:setSpawn(POS.x, POS.y, POS.z, POS.rot)
            mob:useMobAbility(2034)
            mob:setLocalVar("lastPetPop", os.time())
            mob:timer(2500, function(mob)
            SpawnMob((mob:getID() +1), instance)
            end)
        elseif (not PET2:isSpawned()) then
            PET2:setSpawn(POS.x, POS.y, POS.z, POS.rot)
            mob:useMobAbility(2034)
            mob:setLocalVar("lastPetPop", os.time())
            mob:timer(2500, function(mob)
            SpawnMob((mob:getID() +2), instance)
            end)
        elseif (not PET3:isSpawned()) then
            PET3:setSpawn(POS.x, POS.y, POS.z, POS.rot)
            mob:useMobAbility(2034)
            mob:setLocalVar("lastPetPop", os.time())
            mob:timer(2500, function(mob)
            SpawnMob((mob:getID() +3), instance)
            end)
        end
    end
    if PET1:isSpawned() then
        PET1:updateEnmity(target)
    end
    if PET2: isSpawned() then
        PET2:updateEnmity(target)
    end
    if PET3: isSpawned() then
        PET3:updateEnmity(target)
    end
end

function onMobDeath(mob, player, isKiller)
    if (isKiller) then
        local instance = mob:getInstance()
        if (player:getInstance():getStage() == 3) and (player:getInstance():getProgress() == 3) then

            if GetMobByID(ID.mob[3][7].RAMPART4, instance):isDead() then
                instance:setProgress(4) -- may use door after one particular rampart is killed
            end
            
        elseif (player:getInstance():getStage() == 4) then
            local allDeadRamps = false
            if (GetMobByID(ID.mob[4][4].RAMPART1, instance):isDead() and
                GetMobByID(ID.mob[4][4].RAMPART2, instance):isDead() and
                GetMobByID(ID.mob[4][4].RAMPART3, instance):isDead() and
                GetMobByID(ID.mob[4][4].RAMPART4, instance):isDead()) then
                allDeadRamps = true
            end
            if allDeadRamps then
            SpawnMob(ID.mob[4][6].ARCHAIC_RAMPART_NM, instance)
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