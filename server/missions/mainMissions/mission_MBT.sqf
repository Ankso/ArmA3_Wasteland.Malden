// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: mission_MBT.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AgentRev
//	@file Created: 08/12/2012 15:19

if (!isServer) exitwith {};
#include "mainMissionDefines.sqf";

private ["_vehicleClass", "_nbUnits"];

_setupVars =
{
	_vehicleClass =
	[
		"rhsusf_m1a1aimd_usarmy",
		"rhsusf_m1a1aim_tuski_d",
		"rhsusf_m1a2sep1d_usarmy",
		"rhsusf_m1a2sep1tuskid_usarmy",
		"rhsusf_m1a2sep1tuskiid_usarmy",
		"rhs_sprut_vdv",
		"rhs_t72bd_tv",
		"rhs_t72ba_tv",
		"rhsgref_ins_g_t72bb",
		"rhsgref_ins_g_t72bc",
		"rhs_t80",
		"rhs_t80a",
		"rhs_t80b",
		"rhs_t80u",
		"rhs_t80bvk",
		"rhs_t80uk",
		"rhs_t90_tv",
		"rhs_t90a_tv"
	] call BIS_fnc_selectRandom;

	_missionType = "Main Battle Tank";
	_locationsArray = MissionSpawnMarkers;

	_nbUnits = if (missionDifficultyHard) then { AI_GROUP_LARGE } else { AI_GROUP_MEDIUM };
};

_this call mission_VehicleCapture;
