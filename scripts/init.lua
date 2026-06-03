-- Add each level's dir here
dirs = {'global', 'zm_zod'}


-- Load each level's stuff
for i, dir in ipairs(dirs) do
    ScriptHost:LoadScript(dir..'/script.lua')
    if not Tracker:AddItems(dir..'/items.jsonc') then Tracker:AddItems(dir..'/items.json') end
    if not Tracker:AddLayouts(dir..'/layouts.jsonc') then Tracker:AddLayouts(dir..'/layouts.json') end
end

-- Load root layouts
if not Tracker:AddLayouts('layouts/tracker_default.jsonc') then Tracker:AddLayouts('layouts/tracker_default.json') end

