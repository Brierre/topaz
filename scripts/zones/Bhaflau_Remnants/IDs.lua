-----------------------------------
-- Area: Bhaflau_Remnants
-----------------------------------
require("scripts/globals/zone")
require("scripts/globals/salvage")
-----------------------------------

zones = zones or {}

zones[tpz.zone.BHAFLAU_REMNANTS] =
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
                MOBS_START = 17084427, -- east, eruca, gemologist, bifrons
                MOBS_END   = 17084449,
            },
            [2] = {
                MAD_BOMBER = 17084481,
            },
            [3] = {
                MOBS_START = 17084450, -- west, wamouracampa, lapidarist, bifrons
                MOBS_END   = 17084472,
            },
            [4] = {
                MOBS_START = 17084478, -- east, scorps
                MOBS_END   = 17084480,
            },
            [5] = {
                MOBS_START = 17084473, -- trolls
                MOBS_END   = 17084474,
            },
            [6] = {
                MOBS_START = 17084475, -- west, wamoura
                MOBS_END   = 17084477,
            },
        },
        [2] = {
            [1] = {
                MOBS_START = 17084482, -- empathetic flan
                MOBS_END   = 17084485,
            },
            [2] = {
                MOBS_START = 17084501, -- trolls and scorps
                MOBS_END   = 17084520,
            },
            [3] = {
                MOBS_START = 17084489, -- east, trolls and scorps
                MOBS_END   = 17084500,
            },
            [4] = {
                MOBS_START = 17084486, -- scorps 1
                MOBS_END   = 17084488,
            },
            [5] = {
                MOBS_START = 17084493, -- scorps 2
                MOBS_END   = 17084498,
            },
            [6] = {
                MOBS_START = 17084505, -- scorps 3
                MOBS_END   = 17084508,
            },
            [7] = {
                MOBS_START = 17084511, -- scorps 4
                MOBS_END   = 17084514,
            },
            [8] = {
                MOBS_START = 17084518, -- scorps 5
                MOBS_END   = 17084520,
            },
            [9] = {
                MOBS_START = 17084521, -- west, trolls and wamoura
                MOBS_END   = 17084561,
            },
            [10] = {
                MOBS_START = 17084562, -- central rooms, trolls 
                MOBS_END   = 17084602,
            },
            {
            DORMANT_RAMPART = 17084689, -- spawns reactionary
            REACTIONARY_RAMPART = 17084692, -- spawns hunting wasps 4700-4704
            FLUX_FLAN = 17084720,
            SKIRMISH_PEPHEDRO = 17084705, -- check this number, not in list
            },
        },
        [3] = {
            [1] = {
                MOBS_START = 17084486, -- trolls and scorps
                MOBS_END   = 17084520,
            },
        },
    },
    npc =
    {
        [1] = {
            [1] = {
                DOOR0  = 17084889, --  at start, click to open, event 300
            },
            [2] = {
                ARMOURY_CRATE = 17084722, --starting chest
            },
            [3] = {
                DOOR1  = 17084890, -- east path
            },
            [4] = {
                DOOR3  = 17084892, -- west side doors, lock if east path is chosen
                DOOR4  = 17084893,
                DOOR5  = 17084894,
            },
            [5] = {
                DOOR2  = 17084891, --  west path
            },
            [6] = {
                DOOR6  = 17084895, -- east side doors, lock if west path is chosen
                DOOR7  = 17084896,
                DOOR8  = 17084897,
            },
            [7] = {
                DOOR9  = 17084898, --  north central door
            },
            [8] = {
                DOOR_A = 17084891, --  south central door to floor 1 porter
            },
        },
    },
    crate = 
    {--[[ first 17084417, last 1708xxxx
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
        },]]
    },
}



return zones[tpz.zone.BHAFLAU_REMNANTS]
