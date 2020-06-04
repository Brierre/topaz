-----------------------------------
--
-- Zone: Zhayolm_Remnants
--
-----------------------------------
local ID = require("scripts/zones/Zhayolm_Remnants/IDs")
-----------------------------------

function onInitialize(zone)
    --[[zone:registerRegion(1,  336, -1, -303,  343, -1, -296)  -- map 1 porter to F2 (340 -0.5 540)
    zone:registerRegion(2,  256,  3,  377,  262,  3,  383)  -- map 2 sw porter to F3 (-260 -0.5 -460) pad #4 se
    zone:registerRegion(3,  296, -1,  617,  302, -1,  623)  -- map 2 nw porter to F3 (-420 -0.5 -460) pad #3 sw
    zone:registerRegion(4,  417,  3,  377,  423,  3,  383)  -- map 2 se porter to F3 (-300 -0.5 -220) pad #2 ne
    zone:registerRegion(5,  376, -1,  616,  383, -1,  623)  -- map 2 ne porter to F3 (-380 -0.5 -220) pad #1 nw
    zone:registerRegion(6, -463, -5, -303, -456, -5, -296)  -- map 3 w porter to F4 (-460 -0.5 180) pad #1 w 
    zone:registerRegion(7, -223, -5, -303, -216, -5, -296)  -- map 3 e porter to F4 (-220 -0.5 180) pad #2 e
    zone:registerRegion(8, -342, -5,   97, -336, -5,  103)  -- map 4 porter to F5 (-340 -0.5 660)
    zone:registerRegion(9, -317, -5,  556, -309, -5,  550)  -- map 5 e porter (to whitegate?)
    zone:registerRegion(10, 345, -0.001, -343, 333, -0.001, -343) -- fomor aggro region floor 1 begin
    zone:registerRegion(11, 333, -0.001, -416, 346, -0.001, -416) -- fomor aggro region floor 1 end]]
end

function onZoneIn(player,prevZone)
    local cs = -1
    
    local pos = player:getPos()
    if (pos.x == 0 and pos.y == 0 and pos.z == 0) then
        local entrypos = instance:getEntryPos()
        player:setPos(entrypos.x, entrypos.y, entrypos.z, entrypos.rot)
    end
    
    player:addTempItem(5398)
        
    return cs
end

function onRegionEnter(player,region)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player, csid, option)
    local instance = player:getInstance()
    local chars = instance:getChars()

    if csid == 1 then
        for i,v in pairs(chars) do
            v:setPos(0,0,0,0,72)
        end
        
-- if you leave the following code in, the !cs command will also warp pt members
--[[    elseif csid >= 200 and csid <= 210 and option == 1 then 
        for i,v in ipairs(chars) do
            local playerX = player:getXPos();
            local playerY = player:getYPos();
            local playerZ = player:getZPos();
            if v:getID() ~= player:getID() then
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
        end]]
    end
end

function onInstanceLoadFailed()
    return 72
end
