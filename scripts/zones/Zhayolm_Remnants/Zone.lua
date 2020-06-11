-----------------------------------
--
-- Zone: Zhayolm_Remnants
--
-----------------------------------
local ID = require("scripts/zones/Zhayolm_Remnants/IDs")
-----------------------------------

function onInitialize(zone)
    zone:registerRegion(1,  416.679,  -21,  -343.569,  423.459,  -21,  -336.554)  -- F1 se porter to F2 (420 -0.5 20.461)
    zone:registerRegion(2,  416.516, -20.9, -503.437,  423.486, -20.9, -496.481)  -- F1 ne porter to F2 (420 -0.5 20.461)
    zone:registerRegion(3,  256.508, -21,  -503.454,  263.514, -21,  -496.444)  -- F1 sw porter to F2 (420 -0.5 20.461)
    zone:registerRegion(4,  256.561,  -21,  -343.429,  263.531,  -21,  -336.425)  -- F1 nw porter to F2 (420 -0.5 20.461)
    zone:registerRegion(5,  336.585, -5,  -63.474,  343.525, -5,  -56.428)  -- F2 porter to F3 ()
    zone:registerRegion(6, -463, -5, -303, -456, -5, -296)  -- map 3 w porter to F4 (-460 -0.5 180) pad #1 w 
    zone:registerRegion(7, -223, -5, -303, -216, -5, -296)  -- map 3 e porter to F4 (-220 -0.5 180) pad #2 e
    zone:registerRegion(8, -342, -5,   97, -336, -5,  103)  -- map 4 porter to F5 (-340 -0.5 660)
    zone:registerRegion(9, -317, -5,  556, -309, -5,  550)  -- map 5 e porter (to whitegate?)
    zone:registerRegion(10, 345, -0.001, -343, 333, -0.001, -343) -- fomor aggro region floor 1 begin
    zone:registerRegion(11, 333, -0.001, -416, 346, -0.001, -416) -- fomor aggro region floor 1 end]]
end

function onInstanceZoneIn(player,instance)
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
