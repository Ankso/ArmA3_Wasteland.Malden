// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: mission_APC.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AgentRev
//	@file Created: 08/12/2012 15:19

if (!isServer) exitwith {};
#include "mainMissionDefines.sqf";

private ["_vehicleClass", "_nbUnits"];

_setupVars =
{
	_vehicleClass =
	[
		"rhs_bmp2_tv",
		"rhs_prp3_tv",
		"rhsusf_M1117_D",
		"rhs_bmp1k_tv",
		"rhs_btr80a_msv",
		"rhs_btr80_msv",
		"rhsgref_ins_g_btr70",
		"rhsgref_ins_g_btr60",
		"rhs_zsu234_aa",
		"rhsgref_ins_g_zsu234",
		"RHS_M2A2",
		"RHS_M2A3_BUSKIII",
		"RHS_M6"
	] call BIS_fnc_selectRandom;

	_missionType = switch (true) do
	{
		case ({_vehicleClass isKindOf _x} count ["rhs_bmp2_tv", "rhs_prp3_tv", "rhs_bmp1k_tv", "RHS_M2A2", "RHS_M2A3_BUSKIII", "RHS_M6"] > 0): { "Infantry Fighting Vehicle" };
		case ({_vehicleClass isKindOf _x} count ["rhs_zsu234_aa", "rhsgref_ins_g_zsu234"] > 0):                                                { "Anti Aircraft Vehicle" };
		default                                                                                                                                { "Armored Personnel Carrier" };
	};

	_locationsArray = MissionSpawnMarkers;

	_nbUnits = if (missionDifficultyHard) then { AI_GROUP_LARGE } else { AI_GROUP_MEDIUM };
};

_this call mission_VehicleCapture;
