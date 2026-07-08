--TODO: This

-- function zm_zod_doubletap_on_headshot()
--     if headshots_enabled then
--         if map_specific_perks then
--             return zm_zod_has_perk("doubletap")
--         else
--             return has_perk("doubletap")
--         end
--     end
--     return true
-- end

--- Check if round number is in logic
--- @param round integer round number
--- @return boolean return is round in logic?
function zm_zod_round_logic(round)
    return round_logic(round, 69)
end