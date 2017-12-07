// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: mission_ArmedHeli.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AgentRev
//	@file Created: 08/12/2012 15:19

if (!isServer) exitwith {};
#include "mainMissionDefines.sqf";

private ["_vehicleClass", "_nbUnits"];

_setupVars =
{
	_vehicleClass = selectRandom
	[
		["RHS_MI24V_vdv", "RHS_MI24P_vdv"],
		"RHS_Ka52_vvsc",
		"RHS_MELB_AH6M",
		["RHS_UH60M_d", "RHS_UH1Y_d"],
		["RHS_AH64D_noradar", "RHS_AH1Z"],
		"RHS_Mi8MTV3_heavy_vdv"
	];

	_missionType = "Armed Helicopter";
	_locationsArray = MissionSpawnMarkers;

	_nbUnits = if (missionDifficultyHard) then { AI_GROUP_LARGE } else { AI_GROUP_LARGE };
};

_this call mission_VehicleCapture;
