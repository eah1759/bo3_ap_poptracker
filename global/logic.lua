-- Similar to CONSTANTS, as the code should never change these.
-- However, the user can in the poptracker settings, so they
-- need to be callable functions that get current values.
SETTINGS = {
    STARTING_PERK_SLOTS = function() return Tracker:FindObjectForCode("settings_starting_perk_slots").AcquiredCount end
}

--- Check if round number is in logic
--- @param round integer round number
--- @param num_logical_perks integer number of perks in map that can affect logic
--- @return boolean return is round in logic?
function round_logic(round, num_logical_perks)
    local round_can_reach = CONSTANTS.ROUND_LOGIC.ROUND_CAN_REACH
    local round_max_threshold = CONSTANTS.ROUND_LOGIC.ROUND_MAX_THRESHOLD

    -- do round calcs here

    -- adjust max round per perks in logic
    if num_logical_perks < 5 then
        local times_to_adjust = (5 - num_logical_perks)
        round_max_threshold = round_max_threshold - (times_to_adjust * 5)
    end

    local starting_perk_count = SETTINGS.STARTING_PERK_SLOTS()
    current_perk_limit = starting_perk_count + state.count(Items.Progressive_PerkLimitIncrease.name, player)

    if round <= round_can_reach then
        return true
    end
    return false
end

print('fuck')