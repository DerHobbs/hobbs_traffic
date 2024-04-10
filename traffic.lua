local SET_AMBIENT_PED_DENSITY_MULTIPLIER_THIS_FRAME = 0xAB0D553FE20A6E25
local SET_SCENARIO_PED_DENSITY_MULTIPLIER_THIS_FRAME = 0x7A556143A1C03898
local SET_AMBIENT_HUMAN_DENSITY_MULTIPLIER_THIS_FRAME = 0xBA0980B5C0A11924
local SET_SCENARIO_HUMAN_DENSITY_MULTIPLIER_THIS_FRAME = 0x28CB6391ACEDD9DB
local SET_AMBIENT_ANIMAL_DENSITY_MULTIPLIER_THIS_FRAME = 0xC0258742B034DFAF
local SET_SCENARIO_ANIMAL_DENSITY_MULTIPLIER_THIS_FRAME = 0xDB48E99F8E064E56
local SET_PARKED_VEHICLE_DENSITY_MULTIPLIER_THIS_FRAME = 0xFEDFA97638D61D4A
local SET_RANDOM_VEHICLE_DENSITY_MULTIPLIER_THIS_FRAME = 0x1F91D44490E1EA0C
local SET_VEHICLE_DENSITY_MULTIPLIER_THIS_FRAME = 0x606374EBFC27B133

local config = {
    pedFrequency = 0.1,
    trafficFrequency = 0.0,
    animalFrequency = 0.1,
}

-- Validates and corrects the frequency values
local function validateFrequency(value)
    return math.max(0.0, math.min(value, 1.0)) -- Ensures that the value is between 0.0 and 1.0    
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        -- Validate corrected frequency values
        local pedFrequency = validateFrequency(config.pedFrequency)
        local trafficFrequency = validateFrequency(config.trafficFrequency)
        local animalFrequency = validateFrequency(config.animalFrequency)

        Citizen.InvokeNative(SET_AMBIENT_PED_DENSITY_MULTIPLIER_THIS_FRAME, pedFrequency)
        Citizen.InvokeNative(SET_SCENARIO_PED_DENSITY_MULTIPLIER_THIS_FRAME, pedFrequency)

        Citizen.InvokeNative(SET_AMBIENT_HUMAN_DENSITY_MULTIPLIER_THIS_FRAME, pedFrequency)
        Citizen.InvokeNative(SET_SCENARIO_HUMAN_DENSITY_MULTIPLIER_THIS_FRAME, pedFrequency)

        Citizen.InvokeNative(SET_AMBIENT_ANIMAL_DENSITY_MULTIPLIER_THIS_FRAME, animalFrequency)
        Citizen.InvokeNative(SET_SCENARIO_ANIMAL_DENSITY_MULTIPLIER_THIS_FRAME, animalFrequency)

        Citizen.InvokeNative(SET_PARKED_VEHICLE_DENSITY_MULTIPLIER_THIS_FRAME, trafficFrequency)
        Citizen.InvokeNative(SET_RANDOM_VEHICLE_DENSITY_MULTIPLIER_THIS_FRAME, trafficFrequency)
        Citizen.InvokeNative(SET_VEHICLE_DENSITY_MULTIPLIER_THIS_FRAME, trafficFrequency)
    end
end)