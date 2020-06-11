-----------------------------------
-- Area: Zhayolm_Remnants
-----------------------------------
require("scripts/globals/zone")
require("scripts/globals/salvage")
-----------------------------------

zones = zones or {}

zones[tpz.zone.ZHAYOLM_REMNANTS] =
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
                MOBS_START       = 17076225,
                MOBS_END         = 17076240,
                MAMOOL_JA_ZENIST = 17076241,
                POROGGO_GENT     = 17076242,
            },
            [2] = {
                MOBS_START    = 17076243,
                MOBS_END      = 17076258,
                MAMOOL_JA_ZENIST = 17076259,
                POROGGO_GENT     = 17076260,
            },
            [3] = {
                MOBS_START    = 17076261,
                MOBS_END      = 17076276,
                MAMOOL_JA_ZENIST = 17076277,
                POROGGO_GENT     = 17076278,
            },
            [4] = {
                MOBS_START    = 17076279,
                MOBS_END      = 17076294,
                MAMOOL_JA_ZENIST = 17076295,
                POROGGO_GENT     = 17076296,
            },
        },
    },
    npc =
    {
        [1] = {
            [1] = {
                DOOR1         = 17076949,
            },
            [2] = {
                ARMOURY_CRATE = 17076579,
            },
        },
    },
}

return zones[tpz.zone.ZHAYOLM_REMNANTS]
