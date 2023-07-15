local now = ScenEdit_CurrentTime()
local unitsGuids = CassSamDeploymentScript.Mission.unitlist

if CassSamDeploymentScript.TimeTable == nil then
    print("No schedule table found, creating a new one")
    CassSamDeploymentScript.TimeTable = {}
    -- Setting up the global schedule table with initial values
    for _, guid in pairs(unitsGuids) do
        -- If we are using the SAM table option, the times are set individually according to the table
        if CassSamDeploymentScript.UseSamTable then
            local unit = ScenEdit_GetUnit({ guid = unitsGuids })
            local customUnitSchedule = CassSamDeploymentScript.SamTable[unit.name]

            local timeToSpendDeployed = customUnitSchedule.defaultTimeToSpendDeployed -
                math.random() * customUnitSchedule.maxDesync
            local timeToSpendRedeploying = customUnitSchedule.defaultTimeToSpendRedeploying -
                math.random() * customUnitSchedule.maxDesync
            local nextTick = now + timeToSpendDeployed
            CassSamDeploymentScript.TimeTable[guid] = {
                timeToSpendDeployed = timeToSpendDeployed,
                timeToSpendRedeploying = timeToSpendRedeploying,
                nextTick = nextTick
            }
        else
            local timeToSpendDeployed = CassSamDeploymentScript.DefaultTimeToSpendDeployed -
                math.random() * CassSamDeploymentScript.MaxDesync
            local timeToSpendRedeploying = CassSamDeploymentScript.DefaultTimeToSpendRedeploying -
                math.random() * CassSamDeploymentScript.MaxDesync
            local nextTick = now + timeToSpendDeployed
            CassSamDeploymentScript.TimeTable[guid] = {
                timeToSpendDeployed = timeToSpendDeployed,
                timeToSpendRedeploying = timeToSpendRedeploying,
                nextTick = nextTick
            }
        end
    end
    print("Schedule table:")
    print(CassSamDeploymentScript.TimeTable)
else
    print("Schedule table found, skipping its creation")
end

-- This is the main loop. Every time it runs we check wheter its time to move or deploy and do so accordingly
for unitGuid, unitTimes in pairs(CassSamDeploymentScript.TimeTable) do
    -- It's time to choose
    if now > unitTimes.nextTick then
        local unit = ScenEdit_GetUnit({ guid = unitGuid })
        -- To keep things simple, I'm keeping track of wether a units is deployed/relocating by checking it "Hold Position" setting.
        -- Unit is deployed, so its time to redeploy.
        if unit.holdposition == true then
            -- We set holdposition to false so the mission manager will automagically give it waypoints
            unit.holdposition = false
            -- We set its radar to passive so it won't get tracked by ELINT while moving
            ScenEdit_SetEMCON('Unit', unitGuid, 'Radar=Passive')
            -- We force its WCS for air targets to "HOLD"
            ScenEdit_SetDoctrine({ side = CassSamDeploymentScript.SideName, unit = unitGuid },
                { weapon_control_status_air = 2 })
            -- We set its scheduled time to deploy
            CassSamDeploymentScript.TimeTable[unitGuid].nextTick = now + unitTimes.timeToSpendRedeploying
            -- Units is on the move, meaning if the check occurs, its time to deploy
        else
            -- Units is on the move, so its time to deploy
            -- We set holdposition to true so it becomes stationary
            unit.holdposition = true
            -- We set its radar to whatever was set on the settings, by default its "Active"
            ScenEdit_SetEMCON('Unit', unitGuid, 'Radar=Active')
            -- We force its WCS for air targets to "TIGHT"
            ScenEdit_SetDoctrine({ side = CassSamDeploymentScript.SideName, unit = unitGuid },
                { weapon_control_status_air = 1 })
            -- We set its scheduled time to move again
            CassSamDeploymentScript.TimeTable[unitGuid].nextTick = now + unitTimes.timeToSpendDeployed
        end
    end
end

-- Debug
for unitGuid, unitTimes in pairs(CassSamDeploymentScript.TimeTable) do
    print('now:')
    print(now)
    print('unitTimes')
    print(unitTimes)
    print('unitGuid')
    print(unitGuid)
end
