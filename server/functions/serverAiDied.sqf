// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2017 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: serverAiDied.sqf
//	@file Author: AgentRev

if (!isServer) exitWith {};

params ["_unit", "_killer", "_instigator"];

private _presumedKiller = effectiveCommander _killer;
private _killerVehicle = vehicle _killer;

if (!isNull _instigator) then
{
	_killer = _instigator;
};

if (isUavConnected _killerVehicle) then
{
	private _uavOwner = (uavControl _killerVehicle) select 0;

	if (!isNull _uavOwner) then
	{
		_killer = _uavOwner;
	};
};

// Trigger loot system here
if (!isPlayer _unit) then {
	[_unit] call WI_fnc_ProcessLootForUnit; // Will be better to use spawn here?
};

[_unit, _killer, _presumedKiller] call A3W_fnc_serverPlayerDied;
