-----------------------------------
-- Area: Silver_Sea_Remnants
-----------------------------------
require("scripts/globals/zone")
require("scripts/globals/salvage")
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
        OBTAINED_TEMPORARY_ITEM    = 7233, -- Obtained temporary item:
        ALREADY_POSSESS_TEMP       = 7234, -- Already possess temporary item:
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
                MOBS_START = 17088654, -- archaic gear x2 South side
                MOBS_END   = 17088657, -- archaic gears x2
                RAMPART1   = 17088638, -- archaic ramparts x4, reinforcements scripted
                RAMPART2   = 17088642,
                RAMPART3   = 17088646,
                RAMPART4   = 17088650,
            },
            [6] = {
                MOBS_START = 17088685, -- archaic gear x4 West side
                MOBS_END   = 17088692, -- archaic gears x4
                RAMPART1   = 17088669, -- archaic ramparts x4, East side, reinforcements scripted
                RAMPART2   = 17088673,
                RAMPART3   = 17088677,
                RAMPART4   = 17088681,
            },
            [7] = {

                MOBS_START = 17088709, -- archaic gear x4 East side
                MOBS_END   = 17088716, -- archaic gears x4
                RAMPART1   = 17088693, -- archaic rampart x3 East side
                RAMPART2   = 17088697,
                RAMPART3   = 17088701,
                RAMPART4   = 17088705, -- rampart that opens door to porter
            },
            [8] = {
                GYROSCOPIC_GEARS = 17088717, -- gyroscopic gears nm
            },
        },
        [4] = {
            [1] = {
                MOBS_START = 17088718, -- door always open on west side
                MOBS_END   = 17088726,
                RAMPART1   = 17088727,
                RAMPART2   = 17088731,
                RAMPART3   = 17088735,
                RAMPART4   = 17088739,
            },
            [2] = {
                MOBS_START = 17088743, -- archaic gear/gears west side
                MOBS_END   = 17088750,
            },
            [3] = {
                MOBS_START = 17088751, -- archaic gear train, east side
                MOBS_END   = 17088756,
            },
            [4] = {
                MOBS_START = 17088757, -- archaic gears
                MOBS_END   = 17088766,
                RAMPART1   = 17088768, -- archaic ramparts x4, kill all for NM rampart
                RAMPART2   = 17088772,
                RAMPART3   = 17088776,
                RAMPART4   = 17088780,
            },
            [5] = {
                ARCHAIC_CHARIOT = 17088767, --stationary until aggroed, center of room
            },
            [6] = {
                ARCHAIC_RAMPART_NM = 17088784, -- pops after other 4 ramparts are defeated, must be left unaggroed > 1 minute to pop boss
            },
            [7] = {
                CITADEL_CHELONIAN = 17088785, --Citadel Chelonian will need to be added to DB, is spawned by single archaic rampart upon being left and unaggroed
            },
        },
        [5] = {
            LONG_ARMED_CHARIOT = 17088786,
        },
    },
    
        npc =
    {
		[1] = {
            [1] = {
                DOOR1 = 17089385, -- _240 at start, click to open, event 300? try AR _220 for example
            },
            [2] = {
                ARMOURY_CRATE = 17088823, --starting chest
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
            },
            [2] = {
                DOOR = 17089400,  -- _24f NW porter
            },
            [3] = {
                DOOR = 17089405,  -- _24k SE porter
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
    },
        crate =
    {
        [1] = {
            westStatic = {
                [17088787] = {189.000,12.000,-349.000,255},
                [17088788] = {171.000,12.000,-349.000,255},
                [17088789] = {171.000,12.000,-331.000,255},
                [17088790] = {189.000,12.000,-331.000,255},
                [17088791] = {211.000,15.500,-251.000,128},
                [17088792] = {229.000,15.500,-251.000,128},
                [17088793] = {211.000,15.500,-269.000,128},
                [17088794] = {229.000,15.500,-269.000,128},
                [17088795] = {251.000,12.000,-331.000,128},
                [17088796] = {269.000,12.000,-331.000,128},
                [17088797] = {251.000,12.000,-349.000,128},
                [17088798] = {269.000,12.000,-349.000,128},
                [17088799] = {269.000,15.500,-411.000,194},
                [17088800] = {251.000,15.500,-411.000,194},
                [17088801] = {269.000,15.500,-429.000,194},
                [17088802] = {251.000,15.500,-429.000,194},
            },
        },
        [2] = {
            nwStatic = {
                [17088787] = {248.000,-0.500,528.000,222},
                [17088788] = {248.000,-0.500,552.000,32},
                [17088789] = {272.000,-0.500,528.000,159},
                [17088790] = {272.000,-0.500,552.000,94},
            },
            seStatic = {
                [17088791] = {432.000,4.000,288.000,163},
                [17088792] = {408.000,4.000,288.000,222},
                [17088793] = {408.000,4.000,312.000,32},
                [17088794] = {432.000,4.000,312.000,95},
            },
        },
        [3] = {
            northStatic = {
                [17088787] = {-352.000,-0.500,-288.000,32},
                [17088788] = {-352.000,-0.500,-312.000,224},
                [17088789] = {-328.000,-0.500,-288.000,95},
                [17088790] = {-328.000,-0.500,-312.000,158},
            },
        },
        [4] = {
            eastStatic = {
                [17088787] = {-291.000,0.000,-29.000,160},
                [17088788] = {-309.000,0.000,-29.000,223},
                [17088789] = {-291.000,0.000,-11.000,95},
                [17088790] = {-309.000,0.000,-11.000,32},
                [17088791] = {-291.000,0.000,229.000,95},
                [17088792] = {-309.000,0.000,229.000,32},
                [17088793] = {-291.000,0.000,211.000,160},
                [17088794] = {-309.000,0.000,211.000,223},
                [17088795] = {-291.000,-4.000,149.000,95},
                [17088796] = {-309.000,-4.000,149.000,32},
                [17088797] = {-291.000,-4.000,131.000,160},
                [17088798] = {-309.000,-4.000,131.000,223},
                [17088799] = {-211.000,-4.000,29.000,95},
                [17088800] = {-229.000,-4.000,29.000,32},
                [17088801] = {-211.000,-4.000,11.000,160},
                [17088802] = {-229.000,-4.000,11.000,223},
            },
        },
        [5] = { -- drop randomly from mobs on all floors
            RC1     = 17088803,
            RC2     = 17088804,
            RC3     = 17088805,
            RC4     = 17088806,
            RC5     = 17088807,
            RC6     = 17088808,
            RC7     = 17088809,
            RC8     = 17088810,
            RC9     = 17088811,
            RC10    = 17088812,
            RC11    = 17088813,
            RC12    = 17088814,
            RC13    = 17088815,
            RC14    = 17088816,
            RC15    = 17088817,
            RC16    = 17088818,
            RC17    = 17088819,
            RC18    = 17088820,
            RC19    = 17088821,
            RC20    = 17088822,
        },
    },
    --[[points =
    {
        [3] =
        {
            [1] = -- devilet NM path
            {
                point1 =
                {
                    -313,0,-327, -- SE corner
                },
                point2 =
                {
                    -366,0,-327, -- SW corner
                },
                point3 =
                {
                    -366,0,-273, -- NW corner
                },
                point4 =
                {
                    -313,0,-273, -- NE corner
                },
            },
        },
    },]]
}
return zones[tpz.zone.SILVER_SEA_REMNANTS]