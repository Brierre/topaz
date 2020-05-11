-----------------------------------
-- Area: Silver Sea Remnants
-- NPC: Slot
-- trade Zhayolm Card to pop NM Don Poroggo
-----------------------------------
local ID = require("scripts/zones/Silver_Sea_Remnants/IDs")
require("scripts/globals/npc_util")

function onTrade(player,npc,trade)
    if npcUtil.tradeHas(trade, 2375) then
        local instance = npc:getInstance()
        SpawnMob(ID.mob[3][4].DON_POROGGO, instance):updateClaim(player)
        player:confirmTrade()
    end
end

function onTrigger(entity, npc)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(entity, eventid, result)
end