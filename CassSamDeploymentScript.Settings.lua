-- These 2 lines initialize the settings table and the SAM table, don't change them, their meant to be used by the script itself and to save the settings globally
CassSamDeploymentScript = {}
CassSamDeploymentScript.SamTable = {}
CassSamDeploymentScript.TimeTable = nil

------------------------- Settings Start -------------------------
-- You can change the parameters below as you want
-- Name of the side whose SAMs will be controlled by the script. It should work on both human and AI controlled sides.
CassSamDeploymentScript.SideName = "OPFOR"

-- Mission containing the units you want to be controlled. This must an AAW patrol mission, so we dont have to worry about unit pathfinding
-- Name of the side mission containing the SAMs to be controlled by the script. Must be an AAW Patrol mission.
CassSamDeploymentScript.MissionName = "Patrol"

-- The radar mode for deployed units, can be 'Active' or 'Passive'
CassSamDeploymentScript.DeployedRadarMode = "Active"

-- All times are in seconds (I used the pattern '60s * however many minutes * however many hours' and so on)
-- Setting this to 0 causes units to all move at the same time, otherwise this is the highest delay possible between the "order" to move / deploy and the unit actually moving / deploying
CassSamDeploymentScript.MaxDesync = 60 * 5

-- Spend at least this ammount of seconds "deployed"
CassSamDeploymentScript.DefaultTimeToSpendDeployed = 60 * 30

-- Spend at least this ammount of seconds "redeploying"
CassSamDeploymentScript.DefaultTimeToSpendRedeploying = 60 * 20

-- Set the timing mode, you can choose between "standard", "combat_system" and "custom"
CassSamDeploymentScript.SamTimingMode = "standard"

-- Add your custom times here, remember to use the EXACT name of the unit. If using this the "DefaultTimeto..." settings are ingored
-- You can follow these examples for SA-10a, SA-10b and SA-20a
CassSamDeploymentScript.SamTable["SAM Bn (SA-10a Grumble [S-300PT-1])"] = {
    defaultTimeToSpendDeployed = 60 * 60,
    defaultTimeToSpendRedeploying = 60 * 40,
    maxDesync = 60 * 30
}
CassSamDeploymentScript.SamTable["SAM Bn (SA-10b Grumble [S-300PS])"] = {
    defaultTimeToSpendDeployed = 60 * 30,
    defaultTimeToSpendRedeploying = 60 * 20,
    maxDesync = 60 * 10
}
CassSamDeploymentScript.SamTable["SAM Bn (SA-20a Gargoyle [S-300PM-1])"] = {
    defaultTimeToSpendDeployed = 60 * 20,
    defaultTimeToSpendRedeploying = 60 * 10,
    maxDesync = 60 * 10
}
------------------------- Settings End -------------------------
-- This is code use globally by the script, don't change it unless you know what you're doing

-- Grabbing the mission that we setup on the settings and storing it globally
CassSamDeploymentScript.Mission = ScenEdit_GetMission(CassSamDeploymentScript.SideName,
    CassSamDeploymentScript.MissionName)
-- These options are to make units behave more inteligently
ScenEdit_SetDoctrine({ side = CassSamDeploymentScript.SideName, mission = CassSamDeploymentScript.MissionName },
    { engage_opportunity_targets = true, ignore_plotted_course = true })
ScenEdit_SetEMCON('Mission', CassSamDeploymentScript.MissionName, 'Radar=Passive')
-- This global timetable object stores the units and their "schedule"
CassSamDeploymentScript.TimeTable = nil

-- Remove later after confirming everything is working
-- local now = ScenEdit_CurrentTime()
-- local unitsGuids = CassSamDeploymentScript.Mission.unitlist

-- -- Setting up the global schedule table with initial values
-- for _, guid in pairs(unitsGuids) do
--     -- If we are using the SAM table option, the times are set individually according to the table
--     if CassSamDeploymentScript.SamTimingMode == "custom" then
--         local unit = ScenEdit_GetUnit({ guid = unitsGuids })
--         local customUnitSchedule = CassSamDeploymentScript.SamTable[unit.name]

--         local timeToSpendDeployed = customUnitSchedule.defaultTimeToSpendDeployed -
--             math.random() * customUnitSchedule.maxDesync
--         local timeToSpendRedeploying = customUnitSchedule.defaultTimeToSpendRedeploying -
--             math.random() * customUnitSchedule.maxDesync
--         local nextTick = now + timeToSpendDeployed

--         CassSamDeploymentScript.TimeTable[guid] = {
--             timeToSpendDeployed = timeToSpendDeployed,
--             timeToSpendRedeploying = timeToSpendRedeploying,
--             nextTick = nextTick
--         }
--     else
--         local timeToSpendDeployed = CassSamDeploymentScript.DefaultTimeToSpendDeployed -
--             math.random() * CassSamDeploymentScript.MaxDesync
--         local timeToSpendRedeploying = CassSamDeploymentScript.DefaultTimeToSpendRedeploying -
--             math.random() * CassSamDeploymentScript.MaxDesync
--         local nextTick = now + timeToSpendDeployed
--         CassSamDeploymentScript.TimeTable[guid] = {
--             timeToSpendDeployed = timeToSpendDeployed,
--             timeToSpendRedeploying = timeToSpendRedeploying,
--             nextTick = nextTick
--         }
--     end
-- end

-- -- This is the main loop. Every time it runs we check wheter its time to move or deploy and do so accordingly
-- for unitGuid, unitTimes in pairs(CassSamDeploymentScript.TimeTable) do
--     -- It's time to choose
--     if now > unitTimes.nextTick then
--         local unit = ScenEdit_GetUnit({ guid = unitGuid })

--         -- To keep things simple, I'm keeping track of wether a units is deployed/relocating by checking it "Hold Position" setting.
--         -- Unit is deployed, so its time to redeploy.
--         if unit.holdposition == true then
--             -- We set holdposition to false so the mission manager will automagically give it waypoints
--             unit.holdposition = false
--             -- We set its radar to passive so it won't get tracked by ELINT while moving
--             ScenEdit_SetEMCON('Unit', unitGuid, 'Radar=Passive')
--             -- We force its WCS for air targets to "HOLD"
--             ScenEdit_SetDoctrine({ side = CassSamDeploymentScript.SideName, unit = unitGuid },
--                 { weapon_control_status_air = 2 })
--             -- We set its scheduled time to move again
--             CassSamDeploymentScript.TimeTable[unitGuid].nextTick = now + unitTimes.timeToSpendRedeploying

--             -- Units is on the move, so its time to deploy
--         else
--             unit.holdposition = true
--             -- We set its radar to whatever was set on the settings, by default its "Active"
--             ScenEdit_SetEMCON('Unit', unitGuid, 'Radar=' .. CassSamDeploymentScript.DeployedRadarMode)
--             ScenEdit_SetDoctrine({ side = CassSamDeploymentScript.SideName, unit = unitGuid },
--                 { weapon_control_status_air = 1 })
--             CassSamDeploymentScript.TimeTable[unitGuid].nextTick = now + unitTimes.timeToSpendDeployed
--         end
--     end
-- end
