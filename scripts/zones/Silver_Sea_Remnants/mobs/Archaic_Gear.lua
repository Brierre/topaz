-----------------------------------
-- Area: Silver Sea Remnants
--  Mob: Archaic Gear
-- ToDo: Set up a patrol for 8 gears on FL3
-----------------------------------
local ID = require("scripts/zones/Silver_Sea_Remnants/IDs")
require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/salvage")
mixins = {require("scripts/mixins/families/gears")}

function onMobDeath(mob, player, isKiller)
    local instance = mob:getInstance()
    if (isKiller) then
        if (player:getInstance():getStage() == 3) and (player:getInstance():getProgress() == 1 or player:getInstance():getProgress() == 2) 
            and not (player:getInstance():getStage() == 4) then
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

function onMobDespawn(mob)
end