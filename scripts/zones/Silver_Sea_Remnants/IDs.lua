-----------------------------------
-- Area: Silver_Sea_Remnants
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[tpz.zone.SILVER_SEA_REMNANTS] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED    = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
		FULL_INVENTORY_AFTER_TRADE = 6386, -- You cannot obtain the <item>. Try trading again after sorting your inventory.
        ITEM_OBTAINED              = 6388, -- Obtained: <item>.
        GIL_OBTAINED               = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED           = 6391, -- Obtained key item: <keyitem>.
		KEYITEM_LOST               = 6392, -- Lost key item: <keyitem>.
        NOT_HAVE_ENOUGH_GIL        = 6393, -- You do not have enough gil.
        ITEMS_OBTAINED             = 6397, -- You obtain <number> <item>!
        SALVAGE_START              = 7235, -- You feel an incredible pressure bearing down on you. This area appears to be blanketed in some sort of intense psionic field...
        TIME_TO_COMPLETE           = 7407, -- You have <number> [minute/minutes] (Earth time) to complete this mission.
        MISSION_FAILED             = 7408, -- The mission has failed. Leaving area.
        TIME_REMAINING_MINUTES     = 7412, -- Time remaining: <number> [minute/minutes] (Earth time).
        TIME_REMAINING_SECONDS     = 7413, -- Time remaining: <number> [second/seconds] (Earth time).
        DOOR_IS_SEALED             = 7426, -- The door is sealed.
		CELL_OFFSET                = 7212, -- Main Weapon/Sub-Weapon restriction removed.
    },
    mob =
    {
        [1] = {
            [1] = {
                MOBS_START = 17088513, -- east x13 fomor
                MOBS_END   = 17088525,
            },
            [2] = {
                MOBS_START = 17088526, -- east x8 fomor link like normal fomor
                MOBS_END   = 17088533,
            },
            [3] = {
                MOBS_START = 17088534, -- west x16 fomor
                MOBS_END   = 17088550,
            },
            [4] = {
                MOBS_START = 17088551, -- west x6 fomor always link, killing all makes door [1][4] open, spawns [1][5]
                MOBS_END   = 17088556,
            },
            [5] = {
                HAMMERBLOW_MAJANUN    = 17088557, --spawned by killing [1][4]
            },
            [6] = {
                MOBS_START = 17088558,
                MOBS_END   = 17088573,
            },
        },
        [2] = {
            [1] = {
                DEADPAN_DEVILET    = 17088594, --nw room, spawn by NPC [2][1] 9399, unlocks door [2][1] 9400, spawns [2][2] DEKKA on kill
            },
            [2] = {
                DEKKA      = 17088595,
            },
            [3] = {
                GAKKE      = 17088596, -- socket NM, spawn by [2][3] socket, may need added to db
            },
            [4] = {
                MOBS_START = 17088574, -- sw room,x4 imp, spawn by NPC [2][1] 9397
                MOBS_END   = 17088593, -- sw room, x16 fomor
            },
            [5] = {
                MOBS_START = 17088597, -- se room, x4 imp spawn by NPC [2][1] 9404
                MOBS_END   = 17088600, -- kill imps for door [2][1] 9405
            },
            [6] = {
                MOBS_START = 17088601, -- se room, x16 fomor 
                MOBS_END   = 17088616, -- kill fomors for [2][7] POWDERKEG_YANADAHN
            },
            [7] = {
                POWDERKEG_YANADAHN = 17088617,
            },
            [8] = {
                MOBS_START = 17088618, -- ne room, x4 imp spawn by NPC [2][1] 9402
                MOBS_END   = 17088637, -- ne room, x16 fomor
            },
        },
        [3] = {
            [1] = {
                DEVILET = 17088658, -- pops slot (for NM don poroggo)
            },
            [2] = {
                MOBS_START = 17088659, -- all 8 killed pops gyroscopic gear NM
                MOBS_END   = 17088666,
            },
            [3] = {
                GYROSCOPIC_GEAR = 17088667,
            },
            [4] = {
                DON_POROGGO = 17088668, -- slot NM, needs added to db
            },
            [5] = {
                MOBS_START = 17088654, -- archaic gear x2
                MOBS_END   = 17088655,
            },
            [6] = {
                MOBS_START = 17088656, -- archaic gears x2
                MOBS_END   = 17088657,
            },
            [7] = {
                MOBS_START = 17088638, -- archaic rampart x4
                MOBS_END   = 17088653, -- reinforcements, scripted spawn
            },
            [8] = {
                MOBS_START = 17088685, -- archaic gear x4
                MOBS_END   = 17088688,
            },
            [9] = {
                MOBS_START = 17088689, -- archaic gears x4
                MOBS_END   = 17088692,
            },
            [10] = {
                MOBS_START = 17088669, -- archaic rampart x4
                MOBS_END   = 17088684, -- reinforcements scripted spawn
            },
            [11] = {
                MOBS_START = 17088693, -- archaic rampart x3
                MOBS_END   = 17088704, -- reinforcements scripted spawn
            },
            [12] = {
                MOBS_START = 17088705, -- archaic rampart x1
                MOBS_END   = 17088708, -- reinforcements scripted spawn
            },
            [13] = {
                MOBS_START = 17088709, -- archaic gear x4
                MOBS_END   = 17088712,
            },
            [14] = {
                MOBS_START = 17088713, -- archaic gears x4
                MOBS_END   = 17088716,
            },
            [15] = {
                GYROSCOPIC_GEARS = 17088717, -- gyroscopic gears nm
            },
        },
        [4] = {
            [1] = {
                MOBS_START = 17088718, -- door always open on west side
                MOBS_END   = 17088750,
            },
            [2] = {
                MOBS_START = 17088751,
                MOBS_END   = 17088756,
            },
            [3] = {
                MOBS_START = 17088757,
                MOBS_END   = 17088766,
            },
            [4] = {
                MOBS_START = 17088768, -- archaic ramparts x4, plus reinforcements, will need to be added
                MOBS_END   = 17088783,
            },
            [5] = {
                ARCHAIC_CHARIOT = 17088767, --stationary until aggroed, center of room
            },
            [6] = {
                ARCHAIC_RAMPART = 17088784, -- pops after other 4 ramparts are defeated, must be left unaggroed > 1 minute to pop boss
            },
            [7] = {
                CITADEL_CHELONIAN = 17088785, --Citadel Chelonian will need to be added to DB, is spawned by single archaic rampart upon being left and unaggroed
            },
        },
        [5] = {
            LONG_ARMED_CHARIOT = 17088786,
        },
    },
    
        npc =    -- all doors start normal/unlocked/targetable except [1][4],[2][2],
    {
		[1] = {
            [1] = {
                DOOR1 = 17089385, -- _240 at start, click to open, event 300? try AR _220 for example
            },
            [2] = {
                ARMORY_CRATE = 17088809, --starting chest with temp items
            },
            [3] = {
                DOOR1 = 17089386, -- _241 west side door, targetable, lock [1][5] when chosen, spawns [1][3]
                DOOR2 = 17089388, -- _243 west unlocked, targetable
                DOOR3 = 17089389, -- _244 west unlocked, targetable, spawns [1][4]
            },
            [4] = {
                DOOR1 = 17089390, -- _245 west, locked, untargetable until 6 fomors in room are killed, spawns [1][6]
            },
            [5] = {
                DOOR1 = 17089387, -- _242 east side door, targetable, lock [1][3] when chosen, spawns [1][1]
                DOOR2 = 17089391, -- _246 east unlocked, targetable
                DOOR3 = 17089392, -- _247 east unlocked, targetable
                DOOR4 = 17089393, -- _248 east unlocked, targetable, spawns [1][2]
            },
            [6] = {
                DOOR1 = 17089394, -- _249 southern center, always unlocked, targetable
                DOOR2 = 17089395, -- _24a northern center, always unlocked, targetable
            },
        },
        [2] = {
            [1] = { -- these doors need to all lock when one of the following is chosen (DOOR1-DOOR4)
                DOOR1 = 17089397,  -- _24a (misnamed in file, should be _24c) SW spawns [2][4]
                DOOR2 = 17089399,  -- _24e NW spawns [2][1] and NPC [2][3]
                DOOR3 = 17089402,  -- _24h NE room spawns [2][8]
                DOOR4 = 17089404,  -- _24j SE spawns [2][5]
--                DOOR5 = 17089398,  -- _24d west
--                DOOR6 = 17089403,  -- _24i east
            },
            [2] = {
                DOOR = 17089400,  -- _24f NW porter
            },
            [3] = {
                DOOR = 17089405,  -- _24k SE porter
--                DOOR 17089396, _24b SW porter always unlocked
--                DOOR 17089401, _24g NE porter always unlocked
            },
            [4] = {
                SOCKET = 17089352, -- spawns [2][3]Gakke
            },
        },
        [3] = {
            [1] = {
                DOOR1 = 17089406, -- _24l SW
                DOOR2 = 17089407, -- _24m W porter
                DOOR3 = 17089408, -- _24n NW
                DOOR4 = 17089409, -- _24o NE
                DOOR5 = 17089410, -- _24p E porter
                DOOR6 = 17089411, -- _24q SE
                DOOR7 = 17089412, -- _24r S
                DOOR8 = 17089413, -- _24s N
            },
            [2] = {
                SLOT   = 17089353, -- spawns [3][4] Don Poroggo
            },
        },
        [4] = {
            [1] = {
                DOOR1 = 17089414, -- _24t west, always open
                DOOR2 = 17089415, -- _24u east, locked, pending chariot kill
            },
        },
        [5] = {
            [1] = {
                DOOR1 = 17089416, -- _24v 
            },
        },
    }
}
return zones[tpz.zone.SILVER_SEA_REMNANTS]