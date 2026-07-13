-- * Add each level's dir here. ORDER MATTERS WTF
local dirs = {'global/settings', 'global', 'zm_zod'}

-- Load ap helper
ScriptHost:LoadScript('global/ap.lua')

-- Load all items jsons first
for i, dir in ipairs(dirs) do 
    if not Tracker:AddItems(dir..'/items.jsonc') then Tracker:AddItems(dir..'/items.json') end
end

--Load scripts next
for i, dir in ipairs(dirs) do 
    ScriptHost:LoadScript(dir..'/script.lua')
    ScriptHost:LoadScript(dir..'/logic.lua')
end

-- Load the rest
for i, dir in ipairs(dirs) do
    if not Tracker:AddMaps(dir..'/maps.jsonc') then Tracker:AddMaps(dir..'/maps.json') end
    if not Tracker:AddLocations(dir..'/locations.jsonc') then Tracker:AddLocations(dir..'/locations.json') end
    if not Tracker:AddLocations(dir..'/logic.jsonc') then Tracker:AddLocations(dir..'/logic.json') end
    if not Tracker:AddLayouts(dir..'/layouts.jsonc') then Tracker:AddLayouts(dir..'/layouts.json') end
end

-- Load root layouts
if not Tracker:AddLayouts('layouts/tracker_default.jsonc') then Tracker:AddLayouts('layouts/tracker_default.json') end

