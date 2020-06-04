-----------------------------------
--
-- Zone: Bhaflau_Remnants
--
-----------------------------------
local ID = require("scripts/zones/Bhaflau_Remnants/IDs")
-----------------------------------

function onInitialize(zone)
    zone:registerRegion(1,  336.5, -1, -423.5,  343, -1, -416.5)  -- map 1 porter to F2 (340 0 140 191)
    zone:registerRegion(2,  256,  3,  297,  262,  3,  303)  -- map 2 nw porter to F3 (xyz)
    zone:registerRegion(3,  296, -1,  63,  303, -1,  56)  -- map 2 sw porter to F3 (xyz) pad #3 sw
    zone:registerRegion(4,  417,  3,  297,  423,  3,  303)  -- map 2 ne porter to F3 (-300 -0.5 -220) pad #2 ne
    zone:registerRegion(5,  376, -1,  64,  383, -1,  57)  -- map 2 se porter to F3 ()
    zone:registerRegion(6, -463, -5, -503, -456, -5, -496)  -- map 3 w porter to F4 (xyz) pad #1 w 
    zone:registerRegion(7, -223, -5, -503, -216, -5, -496)  -- map 3 e porter to F4 (xyz) pad #2 e
    zone:registerRegion(8, -342, -5,   57, -336, -5,  63)  -- map 4 porter to F5 (xyz)
end

function onInstanceZoneIn(player, instance)
    local cs = -1
    
    local pos = player:getPos()
    if (pos.x == 0 and pos.y == 0 and pos.z == 0) then
        local entrypos = instance:getEntryPos()
        player:setPos(entrypos.x, entrypos.y, entrypos.z, entrypos.rot)
    end
    
    player:addTempItem(5400)

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