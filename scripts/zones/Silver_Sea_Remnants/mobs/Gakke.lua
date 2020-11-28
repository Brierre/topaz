-----------------------------------
-- Area: Silver Sea Remnants
--  Mob: Gakke
-- ToDo: Cells returned are not working correctly
-----------------------------------
mixins = {require("scripts/mixins/families/imp")}
local ID = require("scripts/zones/Silver_Sea_Remnants/IDs")
require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/salvage")

function onMobSpawn(mob)
    local instance = mob:getInstance();
    instance:getEntity(bit.band(ID.npc[2][4].SOCKET, 0xFFF), tpz.objType.NPC):setStatus(tpz.status.DISAPPEAR)
end

function onMobDeath(mob, player, isKiller)
    local CELL = mob:getLocalVar("Cell")
    local AMOUNT = mob:getLocalVar("Qnt") *2

    while AMOUNT > 0 do
        player:addTreasure(CELL)
        AMOUNT = AMOUNT -1
    end
end