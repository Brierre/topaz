-----------------------------------
-- Area: Windurst Walls
--  NPC: Zokima-Rokima
-- Starts Windurst Missions
-- !pos 0 -16 124 239
-- Note: Includes Topaz modifications which may be subject to Topaz license
-----------------------------------
local ID = require("scripts/zones/Windurst_Walls/IDs")
require("scripts/globals/settings")
require("scripts/globals/titles")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
-----------------------------------

function onTrigger(player, npc)

    if (player:getNation() ~= tpz.nation.WINDURST) then
        player:startEvent(87) -- for other nation
    else
        local CurrentMission = player:getCurrentMission(WINDURST)
        local MissionStatus = player:getCharVar("MissionStatus")
        local pRank = player:getRank()
        local cs, p, offset = getMissionOffset(player, 4, CurrentMission, MissionStatus)

        if (CurrentMission <= tpz.mission.id.windurst.THE_SHADOW_AWAITS and (cs ~= 0 or offset ~= 0 or (CurrentMission == tpz.mission.id.windurst.THE_HORUTOTO_RUINS_EXPERIMENT and offset == 0))) then
            if (cs == 0) then
                player:showText(npc, ORIGINAL_MISSION_OFFSET + offset) -- dialog after accepting mission
            else
                player:startEvent(cs, p[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8])
            end
        elseif (CurrentMission ~= tpz.mission.id.windurst.NONE) then
            player:startEvent(91)
        elseif (player:hasCompletedMission(WINDURST, tpz.mission.id.windurst.THE_HORUTOTO_RUINS_EXPERIMENT) == false) then
            player:startEvent(96)
        elseif (player:hasCompletedMission(WINDURST, tpz.mission.id.windurst.THE_HEART_OF_THE_MATTER) == false) then
            player:startEvent(106)
        elseif (player:hasCompletedMission(WINDURST, tpz.mission.id.windurst.THE_PRICE_OF_PEACE) == false) then
            player:startEvent(111)
        elseif (player:hasKeyItem(tpz.ki.MESSAGE_TO_JEUNO_WINDURST)) then
            player:startEvent(150)
        else
            local param3
            local flagMission, repeatMission = getMissionMask(player)
            -- NPC dialog changes when starting 3-2 according to whether it's the first time or being repeated
            if (player:hasCompletedMission(WINDURST, tpz.mission.id.windurst.WRITTEN_IN_THE_STARS)) then
                param3 = 1
            else
                param3 = 0
            end
            player:startEvent(93, flagMission, 0, param3, 0, tpz.ki.STAR_CRESTED_SUMMONS, repeatMission)
        end
    end

end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)

    finishMissionTimeline(player, 4, csid, option)

    if (csid == 96 and option == 1) then
        player:addTitle(tpz.title.HEAVENS_TOWER_GATEHOUSE_RECRUIT)
    elseif (csid == 93 and (option == 12 or option == 15)) then
        player:addKeyItem(tpz.ki.STAR_CRESTED_SUMMONS)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.STAR_CRESTED_SUMMONS)
    end

end
