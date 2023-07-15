# LUA CMO scripts by Cass

## Simple SAM redeployment script by Cass

This script will cause affected units to switch between deployed and redeployment modes

In deployed mode the unit will actively emit on radar (optional), remain stationary and engage enemy targets
In redeployment mode the unit will go passive, hold-fire and move around
Setup is very simple, you need 1 events (or 2 events) and 1 mission on the scenario

The script was split into 2 parts, one for the settings and one for the script itself.

### Usage
> Settings
You can either use the LUA Console and paste the content from the settings files there and run
OR
Create an event, set it to repeatable and have a single "Scenario is Loaded" trigger attached to it
Create a Lua Action, attach it to the event and insert the code inside the "Settings" file
Configure it to your liking

> Main
Create an event, set it to repeatable. Attach a 1 minute "Regular time" trigger to it.
Create a Lua Action, attach it to the event and insert the code inside the "Script" file