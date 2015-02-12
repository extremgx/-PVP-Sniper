// Init Array for UAV Menu 
if (isNil "aUAV") then { aUAV = []; publicVariable "aUAV"; };
// Init Bool for Alarm when convoy should start.
if (isNil "alarm") then { alarm = false; publicVariable "alarm"; };
// Init for Random IEDs
[] spawn {call compile preprocessFileLineNumbers "EPD\Ied_Init.sqf";};

if (isNil "O_Task_TargetInSafeHouse") then { O_Task_TargetInSafeHouse = false; publicVariable "O_Task_TargetInSafeHouse"; };

if (isServer) then
{
	cargo1 addItemCargoGlobal ["ACRE_PRC148", 100];
	cargo2 addItemCargoGlobal ["ACRE_PRC148", 100];
};

serverInitialized = true;
publicVariable "serverInitialized";

sleep 10;

if (isNil "HeadlessVariable") then
{
	execVM "script.sqf";
};

nul= [] execVM "startTimerTaskProtectTarget.sqf";