-- Simple SAM redeployment script. Creat a mission with the name, set the variables below to your liking. Names are self-explanatory
------------------------- Settings -------------------------
-- Mission containing the units you want to be controlled. This must an AAW patrol mission, so we dont have to worry about unit pathfinding
local mission = ScenEdit_GetMission('OPFOR', 'Mobile SAMs')
ScenEdit_SetDoctrine({ side = "OPFOR", mission = "Mobile SAMs" },
    { engage_opportunity_targets = true, ignore_plotted_course = true })


-- Setting this to 0 causes units to all move at the same time, otherwise this is the highest delay possible between the "order" to move / deploy and the unit actually moving / deploying
local maxDesync = 5 * 60

-- Spend this ammount of seconds "deployed", wich means stationary, emitting and engaging enemies
local defaultTimeToSpendDeployed = 60 * 30

-- Spend this ammount of seconds "redeploying", wich means on the move, silent and holding fire
local defaultTimeToSpendRedeploying = 60 * 20

local samTable = {sa10a={}, sa10b={}}
------------------------- Settings -------------------------

local now = ScenEdit_CurrentTime()
local unitsGuids = mission.unitlist

if timeTable == nil then
    timeTable = {}
    for _, guid in pairs(unitsGuids) do
        local myUnit = ScenEdit_GetUnit( { guid= unitsGuids} )
        local timeToSpendDeployed = defaultTimeToSpendDeployed - math.random() * maxDesync
        local timeToSpendRedeploying = defaultTimeToSpendRedeploying - math.random() * maxDesync
        local nextTick = now + timeToSpendDeployed
        timeTable[guid] = { timeToSpendDeployed = timeToSpendDeployed, timeToSpendRedeploying = timeToSpendRedeploying,
            nextTick = nextTick }
    end
    print(timeTable)
end

for unitGuid, unitTimes in pairs(timeTable) do
    if now > unitTimes.nextTick then
        local unit = ScenEdit_GetUnit({ guid = unitGuid })

        -- Unit is deployed, meaning if the check occurs, its time to redeploy
        if unit.holdposition == true then
            unit.holdposition = false
            ScenEdit_SetEMCON('Unit', unitGuid, 'Radar=Passive')
            ScenEdit_SetDoctrine({ side = 'OPFOR', unit = unitGuid }, { weapon_control_status_air = 2 })
            timeTable[unitGuid].nextTick = now + unitTimes.timeToSpendRedeploying
            -- Units is on the move, meaning if the check occurs, its time to deploy
        else
            unit.holdposition = true
            ScenEdit_SetEMCON('Unit', unitGuid, 'Radar=Active')
            ScenEdit_SetDoctrine({ side = 'OPFOR', unit = unitGuid }, { weapon_control_status_air = 1 })
            timeTable[unitGuid].nextTick = now + unitTimes.timeToSpendDeployed
        end

    end
end

-- local elapsed = now - timeFromLastTiggered

-- if areAirDefensesRedeploying == nil then
--     areAirDefensesRedeploying = false
-- end

-- -- spend 30 minutes active
-- if elapsed > 60 * 30 * 1 and areAirDefensesRedeploying == false then
--     areAirDefensesRedeploying = true
--     timeFromLastTiggered = now
--     -- then spend 20 minutes on the move
-- elseif elapsed > 60 * 20 and areAirDefensesRedeploying == true then
--     areAirDefensesRedeploying = false
--     timeFromLastTiggered = now
-- end

-- if areAirDefensesRedeploying == false then
--     ScenEdit_SetEMCON('Mission', 'OPFOR Mobile SAMs', 'Radar=Active')
--     ScenEdit_SetDoctrine({ side = 'OPFOR', mission = 'OPFOR Mobile SAMs' }, { weapon_control_status_air = 1 })

--     for _, guid in pairs(unitsGuids) do
--         local unit = ScenEdit_GetUnit({ guid = guid })
--         unit.holdposition = true
--     end
-- else
--     ScenEdit_SetEMCON('Mission', 'OPFOR Mobile SAMs', 'Radar=Passive')
--     ScenEdit_SetDoctrine({ side = 'OPFOR', mission = 'OPFOR Mobile SAMs' }, { weapon_control_status_air = 2 })

--     for _, guid in pairs(unitsGuids) do
--         local unit = ScenEdit_GetUnit({ guid = guid })
--         unit.holdposition = false
--     end
-- end
