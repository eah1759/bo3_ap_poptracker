-- Docs: https://github.com/black-sliver/PopTracker/blob/master/doc/AUTOTRACKING.md

--- Setup AP Callback functions
function apSetup(name)
    Archipelago:AddClearHandler(name, apClearHandler)
    Archipelago:AddItemHandler(name, apItemHandler)
    Archipelago:AddLocationHandler(name, apLocationHandler)
    Archipelago:AddScoutHandler(name, apScoutHandler)
    Archipelago:AddBouncedHandler(name, apBouncedHandler)
    Archipelago:AddSetReplyHandler(name, apSetReplyHandler)
    Archipelago:AddRetrievedHandler(name, apRetrievedHandler)
end


--- When connection to a server is established, Clear handlers are called 
--- so the Lua script can clear all locations and items.
function apClearHandler(slot_data)
    -- 1. Clear locations and items
    -- 2. ???
    -- 3. Set slot's sent locations and received items according to server
end

--- When an item is received, Item handlers are called
function apItemHandler(index, item_id, item_name, player_number)
end

--- When a location is checked, Location handlers are called
function apLocationHandler(location_id, location_name)
end

--- When a location is scouted, Scout handlers are called
function apScoutHandler(location_id, location_name, item_id, item_name, item_player)
end

--- When a bounce is received, Bounced handlers are called
function apBouncedHandler(bounce_message_json)
end

--- When a watched data storage value is changed, 
--- SetReply handlers are called
function apSetReplyHandler(key, value)
end

--- When a data storage value is polled (Get), Retrieved handlers are called
function apRetrievedHandler(key, value, old_value)
end