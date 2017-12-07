// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 2.1
//	@file Name: mission_MoneyShipment.sqf
//	@file Author: JoSchaap / routes by Del1te - (original idea by Sanjo), AgentRev
//	@file Created: 31/08/2013 18:19

if (!isServer) exitwith {};
#include "moneyMissionDefines.sqf";

private ["_MoneyShipment", "_moneyAmount", "_convoys", "_vehChoices", "_moneyText", "_vehClasses", "_createVehicle", "_vehicles", "_veh2", "_leader", "_speedMode", "_waypoint", "_vehicleName", "_numWaypoints", "_cash"];

_setupVars =
{
	_locationsArray = LandConvoyPaths;

	// Money Shipments settings
	// Difficulties : Min = 1, Max = infinite
	// Convoys per difficulty : Min = 1, Max = infinite
	// Vehicles per convoy : Min = 1, Max = infinite
	// Choices per vehicle : Min = 1, Max = infinite
	_MoneyShipment =
	[
		// Easy
		[
			"Small Money Shipment", // Marker text
			12500, // Money
			[
				[ // NATO convoy
					["rhsusf_m1025_d_m2", "rhsusf_m1025_d_s_m2"], // Veh 1
					["rhsusf_m998_d_4dr_fulltop", "rhsusf_m998_w_s_2dr_fulltop"] // Veh 2
				],
				[ // CSAT convoy
					["rhs_tigr_sts_3camo_msv", "rhs_tigr_sts_3camo_msv"], // Veh 1
					["rhs_tigr_m_msv", "rhs_tigr_m_3camo_msv"] // Veh 2
				],
				[ // AAF convoy
					["rhssaf_m1025_olive_m2", "rhssaf_m1025_olive_m2"], // Veh 1
					["rhssaf_m1025_olive", "rhssaf_m1025_olive"] // Veh 2
				]
			]
		],
		// Medium
		[
			"Medium Money Shipment", // Marker text
			25000, // Money
			[
				[ // NATO convoy
					["rhsusf_m1025_d_m2", "rhsusf_m1025_d_s_m2"], // Veh 1
					["rhsusf_m1220_m2_usarmy_d", "rhsusf_m1220_mk19_usarmy_d", "rhsusf_m1230_m2_usarmy_d"], // Veh 2
					["rhsusf_M1078A1P2_B_M2_D_fmtv_usarmy", "rhsusf_M1078A1P2_B_M2_D_flatbed_fmtv_usarmy"] // Veh 3
				],
				[ // CSAT convoy
					["rhs_tigr_sts_3camo_msv", "rhs_tigr_sts_3camo_msv"], // Veh 1
					["rhsgref_BRDM2_HQ_vmf", "rhsgref_BRDM2_HQ_vmf", "rhsgref_BRDM2_vmf"], // Veh 2
					["rhs_kamaz5350_vmf", "RHS_Ural_VMF_01"] // Veh 3
				],
				[ // AAF convoy
					["rhssaf_m1025_olive_m2", "rhssaf_m1025_olive_m2"], // Veh 1
					["rhsgref_ins_g_ural_Zu23", "rhsgref_ins_g_ural_Zu23"], // Veh 2
					["rhsgref_ins_g_ural", "rhsgref_ins_g_ural_open"] // Veh 3
				]
			]
		],
		// Hard
		[
			"Large Money Shipment", // Marker text
			37500, // Money
			[
				[ // NATO convoy
					["rhsusf_m1025_d_m2", "rhsusf_m1025_d_s_m2"], // Veh 1
					["rhsusf_M1117_D", "rhsusf_M1117_O"], // Veh 2
					["rhsusf_m1220_m2_usarmy_d", "rhsusf_m1220_mk19_usarmy_d", "rhsusf_m1230_m2_usarmy_d"] // Veh 3
				],
				[ // CSAT convoy
					["rhs_tigr_sts_3camo_msv", "rhs_tigr_sts_3camo_msv"], // Veh 1
					["rhs_btr80_msv"], // Veh 2
					["rhsgref_BRDM2_HQ_vmf", "rhsgref_BRDM2_HQ_vmf", "rhsgref_BRDM2_vmf"] // Veh 3
				],
				[ // AAF convoy
					["rhssaf_m1025_olive_m2", "rhssaf_m1025_olive_m2"], // Veh 1
					["rhsgref_ins_g_btr70"], // Veh 2
					["rhsgref_ins_g_ural_Zu23", "rhsgref_ins_g_ural_Zu23"] // Veh 3
				]
			]
		],
		// Extreme
		[
			"Heavy Money Shipment", // Marker text
			50000, // Money
			[
				[ // NATO convoy
					["rhsusf_m1025_d_m2", "rhsusf_m1025_d_s_m2"], // Veh 1
					["rhsusf_M1117_D", "rhsusf_M1117_O"], // Veh 2
					["rhsusf_m1a1aimd_usarmy"], // Veh 4
					["rhsusf_m1220_m2_usarmy_d", "rhsusf_m1220_mk19_usarmy_d", "rhsusf_m1230_m2_usarmy_d"] // Veh 3
				],
				[ // CSAT convoy
					["rhs_tigr_sts_3camo_msv", "rhs_tigr_sts_3camo_msv"], // Veh 1
					["rhs_btr80_msv"], // Veh 2
					["rhs_t80a"], // Veh 4
					["rhsgref_BRDM2_HQ_vmf", "rhsgref_BRDM2_HQ_vmf", "rhsgref_BRDM2_vmf"] // Veh 3
				],
				[ // AAF convoy
					["rhssaf_m1025_olive_m2", "rhssaf_m1025_olive_m2"], // Veh 1
					["rhsgref_ins_g_btr70"], // Veh 2
					["rhsgref_ins_g_t72bb"], // Veh 4
					["rhsgref_ins_g_ural_Zu23", "rhsgref_ins_g_ural_Zu23"] // Veh 3
				]
			]
		]
	]
	call BIS_fnc_selectRandom;

	_missionType = _MoneyShipment select 0;
	_moneyAmount = _MoneyShipment select 1;
	_convoys = _MoneyShipment select 2;
	_vehChoices = _convoys call BIS_fnc_selectRandom;

	_moneyText = format ["$%1", [_moneyAmount] call fn_numbersText];

	_vehClasses = [];
	{ _vehClasses pushBack (_x call BIS_fnc_selectRandom) } forEach _vehChoices;
};

_setupObjects =
{
	private ["_starts", "_startDirs", "_waypoints"];
	call compile preprocessFileLineNumbers format ["mapConfig\convoys\%1.sqf", _missionLocation];

	_createVehicle =
	{
		private ["_type", "_position", "_direction", "_vehicle", "_soldier"];

		_type = _this select 0;
		_position = _this select 1;
		_direction = _this select 2;

		_vehicle = createVehicle [_type, _position, [], 0, "None"];
		_vehicle setVariable ["R3F_LOG_disabled", true, true];
		[_vehicle] call vehicleSetup;

		_vehicle setDir _direction;
		_aiGroup addVehicle _vehicle;

		_soldier = [_aiGroup, _position] call createRandomSoldier;
		_soldier moveInDriver _vehicle;

		_soldier = [_aiGroup, _position] call createRandomSoldier;
		_soldier moveInCargo [_vehicle, 0];

		if !(_type isKindOf "Truck_F") then
		{
			_soldier = [_aiGroup, _position] call createRandomSoldier;
			_soldier moveInGunner _vehicle;

			_soldier = [_aiGroup, _position] call createRandomSoldier;

			if (_vehicle emptyPositions "commander" > 0) then
			{
				_soldier moveInCommander _vehicle;
			}
			else
			{
				_soldier moveInCargo [_vehicle, 1];
			};
		};

		[_vehicle, _aiGroup] spawn checkMissionVehicleLock;

		_vehicle
	};

	_aiGroup = createGroup CIVILIAN;

	_vehicles = [];
	{
		_vehicles pushBack ([_x, _starts select 0, _startdirs select 0, _aiGroup] call _createVehicle);
	} forEach _vehClasses;

	_veh2 = _vehClasses select (1 min (count _vehClasses - 1));

	_leader = effectiveCommander (_vehicles select 0);
	_aiGroup selectLeader _leader;

	_aiGroup setCombatMode "YELLOW"; // units will defend themselves
	_aiGroup setBehaviour "SAFE"; // units feel safe until they spot an enemy or get into contact
	_aiGroup setFormation "STAG COLUMN";

	_speedMode = if (missionDifficultyHard) then { "NORMAL" } else { "LIMITED" };

	_aiGroup setSpeedMode _speedMode;

	{
		_waypoint = _aiGroup addWaypoint [_x, 0];
		_waypoint setWaypointType "MOVE";
		_waypoint setWaypointCompletionRadius 25;
		_waypoint setWaypointCombatMode "YELLOW";
		_waypoint setWaypointBehaviour "SAFE"; // safe is the best behaviour to make AI follow roads, as soon as they spot an enemy or go into combat they WILL leave the road for cover though!
		_waypoint setWaypointFormation "STAG COLUMN";
		_waypoint setWaypointSpeed _speedMode;
	} forEach _waypoints;

	_missionPos = getPosATL leader _aiGroup;

	_missionPicture = getText (configFile >> "CfgVehicles" >> _veh2 >> "picture");
	_vehicleName = getText (configFile >> "cfgVehicles" >> _veh2 >> "displayName");

	_missionHintText = format ["A convoy transporting <t color='%1'>%2</t> escorted by a <t color='%1'>%3</t> is en route to an unknown location.<br/>Stop them!", moneyMissionColor, _moneyText, _vehicleName];

	_numWaypoints = count waypoints _aiGroup;
};

_waitUntilMarkerPos = {getPosATL _leader};
_waitUntilExec = nil;
_waitUntilCondition = {currentWaypoint _aiGroup >= _numWaypoints};

_failedExec = nil;

// _vehicles are automatically deleted or unlocked in missionProcessor depending on the outcome

_successExec =
{
	// Mission completed

	for "_i" from 1 to 10 do
	{
		_cash = createVehicle ["Land_Money_F", _lastPos, [], 5, "None"];
		_cash setPos ([_lastPos, [[2 + random 3,0,0], random 360] call BIS_fnc_rotateVector2D] call BIS_fnc_vectorAdd);
		_cash setDir random 360;
		_cash setVariable ["cmoney", _moneyAmount / 10, true];
		_cash setVariable ["owner", "world", true];
	};

	_successHintMessage = "The convoy has been stopped, the money and vehicles are now yours to take.";
};

_this call moneyMissionProcessor;
