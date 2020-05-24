-----------------------------------
--
-- Salvage: Silver Sea Remnants
--
-----------------------------------
local ID = require("scripts/zones/Silver_Sea_Remnants/IDs")
require("scripts/globals/instance")
require("scripts/globals/status")
-----------------------------------

function afterInstanceRegister(player)
    local instance = player:getInstance()
    player:messageSpecial(ID.text.TIME_TO_COMPLETE, instance:getTimeLimit())
    player:messageSpecial(ID.text.SALVAGE_START, 1)
    player:addStatusEffectEx(tpz.effect.ENCUMBRANCE_I, tpz.effect.ENCUMBRANCE_I, 0xFFFF, 0, 0)
    player:addStatusEffectEx(tpz.effect.OBLIVISCENCE, tpz.effect.OBLIVISCENCE, 0, 0, 0)
    player:addStatusEffectEx(tpz.effect.OMERTA, tpz.effect.OMERTA, 0, 0, 0)
    player:addStatusEffectEx(tpz.effect.IMPAIRMENT, tpz.effect.IMPAIRMENT, 0, 0, 0)
    player:addStatusEffectEx(tpz.effect.DEBILITATION, tpz.effect.DEBILITATION, 0x1FF, 0, 0)
    for i = 0,15 do
        player:unequipItem(i)
    end
end

function onInstanceCreated(instance)

    for i,v in pairs(ID.npc[1][1]) do
        local npc = instance:getEntity(bit.band(v, 0xFFF), tpz.objType.NPC)
        npc:setStatus(tpz.status.NORMAL)
    end
    instance:setStage(1)
    instance:setProgress(0)
end

function onInstanceTimeUpdate(instance, elapsed)
    updateInstanceTime(instance, elapsed, ID.text)
end

function onInstanceFailure(instance)

    local chars = instance:getChars()

    for i,v in pairs(chars) do
        v:messageSpecial(ID.text.MISSION_FAILED,10,10)
        v:startEvent(1)
    end
end

function onInstanceComplete(instance)
end

function onRegionEnter(player, region, instance)
    if region:GetRegionID() <= 11 then
        player:startEvent(199 + region:GetRegionID())
    end
end

function onInstanceProgressUpdate(instance, progress, elapsed)
    if instance:getStage() == 2 and progress == 1 then -- attempt to spawn socket
        instance:getEntity(bit.band(ID.npc[2][4].SOCKET, 0xFFF), tpz.objType.NPC):setStatus(tpz.status.NORMAL)
    elseif instance:getStage() == 3 and progress == 1 then -- attempt to spawn slot
        instance:getEntity(bit.band(ID.npc[3][2].SLOT, 0xFFF), tpz.objType.NPC):setStatus(tpz.status.NORMAL)
    end
end

function onEventFinish(player, csid, option)
    local instance = player:getInstance()
    local chars = instance:getChars()
    if csid >= 200 and csid <= 210 and option == 1 then
        for i,v in ipairs(chars) do
            local playerX = player:getXPos();
            local playerY = player:getYPos();
            local playerZ = player:getZPos();
            if  v:getID() ~= player:getID() then
                v:startEvent(3)
                v:timer(4000, function(player)
                v:setPos(playerX, playerY, playerZ)
                    end)
            end

            v:setHP(v:getMaxHP())
            v:setMP(v:getMaxMP())
            if v:getPet() then
                local pet = v:getPet()
                pet:setHP(pet:getMaxHP())
                pet:setMP(pet:getMaxMP())
            end
        end
    end
    
    if csid == 200 and option == 1 then
        for id = ID.mob[1][1].MOBS_START, ID.mob[1][6].MOBS_END do
            DespawnMob(id, instance)
        end
        
    elseif csid >= 201 and csid <= 204 and option == 1 then
        for id = ID.mob[2][1].DEADPAN_DEVILET, ID.mob[2][8].MOBS_END do
            DespawnMob(id, instance)
        end
        
    elseif csid == 205 and option == 1 then
        for id = ID.mob[4][1].MOBS_START, ID.mob[4][1].MOBS_END do -- spawn mobs in east/west rooms
            SpawnMob(id, instance)
        end
        for id = ID.mob[4][2].MOBS_START, ID.mob[4][2].MOBS_END do -- spawn mobs in east/west rooms
            SpawnMob(id, instance)
        end
        SpawnMob(ID.mob[4][1].RAMPART1, instance)
        SpawnMob(ID.mob[4][1].RAMPART2, instance)
        SpawnMob(ID.mob[4][1].RAMPART3, instance)
        SpawnMob(ID.mob[4][1].RAMPART4, instance)
        
        for id = ID.mob[3][1].DEVILET, ID.mob[3][8].GYROSCOPIC_GEARS do
            DespawnMob(id, instance)
        end
        
    elseif csid == 206 and option == 1 then
        for id = ID.mob[4][3].MOBS_START, ID.mob[4][4].MOBS_END do -- spawn mobs on east side
            SpawnMob(id, instance)
        end
        SpawnMob(ID.mob[4][4].RAMPART1, instance)
        SpawnMob(ID.mob[4][4].RAMPART2, instance)
        SpawnMob(ID.mob[4][4].RAMPART3, instance)
        SpawnMob(ID.mob[4][4].RAMPART4, instance)
        SpawnMob(ID.mob[4][5].ARCHAIC_CHARIOT, instance)
        
        for id = ID.mob[3][1].DEVILET, ID.mob[3][8].GYROSCOPIC_GEARS do
            DespawnMob(id, instance)
        end
    
    elseif csid == 207 and option == 1 then
        for id = ID.mob[4][i].MOBS_START, ID.mob[4][i].CITADEL_CHELONIAN do
            DespawnMob(id, instance)
        end
    end


end
