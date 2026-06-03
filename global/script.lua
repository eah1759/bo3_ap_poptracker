-- TODO: Split consts, tools, and top level stuff into different files
-- Consts
CONSTANTS = {
    MAPS = {
        ZOD = {
            NAME = 'Shadows of Evil',
            CODE = 'zm_zod'
        },
        FACTORY = {
            NAME = 'The Giant',
            CODE = 'zm_factory'
        },
        CASTLE = {
            NAME = 'Der Eisendrache',
            CODE = 'zm_castle'
        },
        ISLAND = {
            NAME = 'Zetsubou No Shima',
            CODE = 'zm_island'
        },
        STALINGRAD = {
            NAME = 'Gorod Krovi',
            CODE = 'zm_stalingrad'
        },
        GENESIS = {
            NAME = 'Revelations',
            CODE = 'zm_genesis'
        },
        THEATER = {
            NAME = 'Kino der Toten',
            CODE = 'zm_theater'
        },
        MOON = {
            NAME = 'Moon',
            CODE = 'zm_moon'
        },
        TOMB = {
            NAME = 'Origins',
            CODE = 'zm_tomb'
        },
        WESTERNZ = {
            NAME = 'Wanted',
            CODE = 'zm_westernz'
        }
    },
    PERKS = {
        JUGGERNOG = {
            NAME = 'Juggernog',
            CODE = 'perk_juggernog'
        },
        QUICKREVIVE = {
            NAME = 'Quick Revive',
            CODE = 'perk_quick_revive'
        },
        SPEEDCOLA = {
            NAME = 'Speed Cola',
            CODE = 'perk_speed_cola'
        },
        DOUBLETAP = {
            NAME = 'Double Tap',
            CODE = 'perk_double_tap'
        },
        DEADSHOT = {
            NAME = 'Dead Shot',
            CODE = 'perk_dead_shot'
        },
        STAMINUP = {
            NAME = 'Stamin-up',
            CODE = 'perk_stamin-up'
        },
        MULEKICK = {
            NAME = 'Mule Kick',
            CODE = 'perk_mule_kick'
        },
        WIDOWSWINE = {
            NAME = "Widow's Wine",
            CODE = 'perk_widows_wine'
        },
        ELECTRICCHERRY = {
            NAME = 'Electric Cherry',
            CODE = 'perk_electric_cherry'
        },
        PHDFLOPPER = {
            NAME = 'PhD Flopper',
            CODE = 'perk_phd_flopper'
        }
    }
}

-- General Tools

--- @param name string Item name
--- @param iconPath string Icon file path
--- @param code string Item code
--- @return LuaItem
function generateStandardItem(name, iconPath, code)
    local item = ScriptHost:CreateLuaItem()
    item.Name = name
    item.Icon = 'images/test.png' -- ! iconPath
    item.CanProvideCodeFunc = function(luaItem, itemCode)
        if itemCode == code then return true end
        return false
    end
    return item
end

-- Perks

--- @param level string The level's code string
--- @param perks table Array of perk names to generate
function generatePerkItems(level, perks)
    print(perks[1])
    for i, perk in ipairs(perks) do
        print('a'..perk)
        local code = 'item_'..level..'_'..perk
        local iconPath = 'images/perks/'..perk..'.png'
        local name = getPerkNameFromCode(perk) or perk
        print(code..' - '..name)
        generateStandardItem(name, iconPath, code)
    end
end

--- @param perkCode string Perk Code
--- @return string | nil
function getPerkNameFromCode(perkCode)
    for i, perk in pairs(CONSTANTS.PERKS) do
        if perk.CODE == perkCode then 
            return perk.NAME
        end
    end
end

-- Other Logic

local perks = {}
for i, perk in pairs(CONSTANTS.PERKS) do
    print(perk.CODE)
    table.insert(perks, perk.CODE)
end
print('---')
print(CONSTANTS.PERKS[1])
generatePerkItems('global', perks)
