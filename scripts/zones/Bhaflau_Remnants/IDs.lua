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
                MOBS_START = 17084434, -- east, eruca, gemologist, bifrons
                MOBS_END   = 17084446,
            },
            [2] = {
                MOBS_START = 17084427, -- east, eruca, gemologist
                MOBS_END   = 17084433,
            },
            [3] = {
                MOBS_START = 17084447, -- bifrons
                MOBS_END   = 17084449,
            },
            [4] = {
                MAD_BOMBER = 17084481,
            },
            [5] = {
                MOBS_START = 17084450, -- west, wamouracampa, bifrons
                MOBS_END   = 17084456,
            },
            [6] = {
                MOBS_START = 17084457, -- west, wamouracampa, lapidarist, bifrons
                MOBS_END   = 17084472,
            },
            [7] = {
                MOBS_START = 17084478, -- east, scorps
                MOBS_END   = 17084480,
            },
            [8] = {
                MOBS_START = 17084473, -- trolls
                MOBS_END   = 17084474,
            },
            [9] = {
                MOBS_START = 17084475, -- west, wamoura
                MOBS_END   = 17084477,
            },
        },
        [2] = {
            [1] = {
                MOBS_START          = 17084482, -- empathic flan
                MOBS_END            = 17084485,
                --DORMANT_RAMPART     = 17084689, -- spawns reactionary
                REACTIONARY_RAMPART = 17084692, -- spawns hunting wasps 4700-4704
                FLUX_FLAN           = 17084720,
                SKIRMISH_PEPHEDRO   = 17084705, -- check this number, not in list
            },
            [2] = {
                MOBS_START = 17084486, -- east, northern and southern small room
                MOBS_END   = 17084500,
            },
            [3] = {
                MOBS_START = 17084501, -- east, northeast large room
                MOBS_END   = 17084510,
            },
            [4] = {
                MOBS_START = 17084511, -- east, southeast large room
                MOBS_END   = 17084520,
            },
            [5] = {
                MOBS_START = 17084521, -- west, northern and southern small room
                MOBS_END   = 17084538,
            },
            [6] = {
                MOBS_START = 17084539, -- west, northwest large room
                MOBS_END   = 17084550,
            },
            [7] = {
                MOBS_START = 17084551, -- west, southwest large room
                MOBS_END   = 17084561,
            },
        },
        [3] = {
            [1] = {
                MOBS_START = 17084603, -- black pudding SE
                MOBS_END   = 17084609,
            },
            [2] = {
                MOBS_START = 17084610, -- black pudding SW
                MOBS_END   = 17084616,
            },
            [3] = {
                MOBS_START = 17084617, -- black pudding southcentral
                MOBS_END   = 17084636,
            },
            [4] = {
                MOBS_START = 17084562, -- trolls NW
                MOBS_END   = 17084568,
            },
            [5] = {
                MOBS_START = 17084569, -- trolls NE
                MOBS_END   = 17084578,
            },
            [6] = {
                MOBS_START = 17084579, -- trolls north central
                MOBS_END   = 17084602,
            },
            [7] = {
                MOBS_START = 17084637, -- gears/gear x8 east side
                MOBS_END   = 17084645,
            },
            [8] = {
                MOBS_START = 17084646, -- gears/gear x8 west side
                MOBS_END   = 17084654,
            },
        },
        [4] = {
            [1] = {
                MOBS_START = 17084655, -- gears, gear, chariot east path
                MOBS_END   = 17084670,
            },
            [2] = {
                MOBS_START = 17084671, -- gears, gear, chariot west path
                MOBS_END   = 17084686,
            },
        },
        [5] = {
                LONG_BOWED_CHARIOT = 17084687,
        },
    },
    npc =
    {
        [1] = {
            [1] = {
                DOOR1  = 17084889, --  at start, click to open, event 300
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
        [2] = {
            [1] = {
                SOCKET = 17084856,
                SLOT   = 17084857,
            },
        },
    },
    crate = 
    {
        [1] = { -- drop randomly from mobs on all floors
            RC1     = 17084417,
            RC2     = 17084418,
            RC3     = 17084419,
            RC4     = 17084420,
            RC5     = 17084421,
            RC6     = 17084422,
            RC7     = 17084423,
            RC8     = 17084424,
            RC9     = 17084425,
            RC10    = 17084426,
        },
    },
}

return zones[tpz.zone.BHAFLAU_REMNANTS]
