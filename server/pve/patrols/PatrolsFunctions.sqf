/******************************************************************************************
 * This project is licensed under the GNU Affero GPL v3. Copyright © 2017 MrAnkso         *
 ******************************************************************************************
 * @file Name: server\pve\patrols\PatrolsFunctions.sqf
 * @file Author: MrAnkso
 *
 * Stores functions used only for managing/generating random patrols accross de map.
 */

/*
 * Creates a random patrol and returns the AI group.
 * @param _zone int Patrol zone ID
 * @param _difficulty int The difficulty level for this patrol (1, 2 or 3)
 */
WI_fnc_CreateRandomPatrol = {
	if (!isServer) exitWith {};

	private ["_group", "_zone", "_difficulty", "_unitsCount", "_possibleWaypoints", "_waypoints", "_unitTypes", "_officerTypes", "_markersName", "_breakLoop", "_markersCount"];

	// All AI is OpFor
	_group = createGroup [east, true];
	_zone = _this select 0;
	_difficulty = _this select 1;
	_unitsCount = 5;
	_possibleWaypoints = [];
	_waypoints = [];
	_markersName = "";

	_unitTypes = [
		// BLUFOR units
		[
			// Difficulty level 1
			[
				"rhsusf_usmc_marpat_d_rifleman", "rhsusf_usmc_marpat_d_rifleman_law", "rhsusf_usmc_marpat_d_rifleman_m4",
				"rhsusf_usmc_marpat_d_rifleman_light", "rhsusf_usmc_marpat_d_stinger", "rhsusf_usmc_marpat_d_grenadier"
			],
			// Difficulty level 2
			[
				"rhsusf_usmc_marpat_d_rifleman", "rhsusf_usmc_marpat_d_rifleman_law", "rhsusf_usmc_marpat_d_riflemanat", "rhsusf_usmc_marpat_d_rifleman_m4",
				"rhsusf_usmc_marpat_d_rifleman_light", "rhsusf_usmc_marpat_d_smaw", "rhsusf_usmc_marpat_d_stinger", "rhsusf_usmc_marpat_d_machinegunner",
				"rhsusf_usmc_marpat_d_grenadier", "rhsusf_usmc_marpat_d_marksman", "rhsusf_usmc_marpat_d_engineer"
			],
			// Difficulty level 3
			[
				"rhsusf_army_ocp_aa", "rhsusf_army_ocp_rifleman_1stcav", "rhsusf_army_ocp_rifleman_10th", "rhsusf_army_ocp_marksman",
				"rhsusf_army_ocp_machinegunner", "rhsusf_army_ocp_grenadier", "rhsusf_army_ocp_fso", "rhsusf_army_ocp_medic",
				"rhsusf_army_ocp_maaws", "rhsusf_army_ocp_riflemanat", "rhsusf_army_ocp_rifleman_m590", "rhsusf_army_ocp_autorifleman",
				"rhsusf_army_ocp_engineer", "rhsusf_army_ocp_explosives", "rhsusf_army_ocp_sniper"
			]
		],
		// OPFOR units
		[
			// Difficulty level 1
			[
				"rhs_msv_emr_rifleman", "rhs_msv_emr_grenadier", "rhs_msv_emr_LAT", "rhs_msv_emr_RShG2",
				"rhs_msv_emr_aa", "rhs_msv_emr_at", "rhs_msv_emr_arifleman", "rhs_msv_emr_efreitor",
				"rhs_msv_emr_grenadier", "rhs_msv_emr_machinegunner"
			],
			// Difficulty level 2
			[
				"rhs_msv_emr_rifleman", "rhs_msv_emr_grenadier", "rhs_msv_emr_LAT", "rhs_msv_emr_RShG2",
				"rhs_msv_emr_aa", "rhs_msv_emr_at", "rhs_msv_emr_arifleman", "rhs_msv_emr_efreitor",
				"rhs_msv_emr_grenadier", "rhs_msv_emr_engineer_rpg", "rhs_msv_emr_machinegunner", "rhs_msv_emr_marksman",
				"rhs_msv_emr_medic"
			],
			// Difficulty level 3
			[
				"rhs_vdv_des_aa", "rhs_vdv_des_at", "rhs_vdv_des_arifleman", "rhs_vdv_des_efreitor",
				"rhs_vdv_des_engineer", "rhs_vdv_des_grenadier_rpg", "rhs_vdv_des_junior_sergeant", "rhs_vdv_des_machinegunner",
				"rhs_vdv_des_marksman", "rhs_vdv_des_marksman_asval", "rhs_vdv_des_medic", "rhs_vdv_des_grenadier",
				"rhs_vdv_des_LAT", "rhs_vdv_des_RShG2"
			]
		],
		// Insurgency units
		[
			// Difficulty level 1
			[
				"rhsgref_ins_g_specialist_aa", "rhsgref_ins_g_grenadier_rpg", "rhsgref_ins_g_machinegunner", "rhsgref_ins_g_militiaman_mosin",
				"rhsgref_ins_g_medic", "rhsgref_ins_g_rifleman_akm", "rhsgref_ins_g_rifleman_aks74", "rhsgref_ins_g_rifleman_aksu",
				"rhsgref_ins_g_grenadier", "rhsgref_ins_g_rifleman_RPG26", "rhsgref_ins_g_engineer"
			],
			// Difficulty level 2
			[
				"rhsgref_ins_g_specialist_aa", "rhsgref_ins_g_grenadier_rpg", "rhsgref_ins_g_machinegunner", "rhsgref_ins_g_militiaman_mosin",
				"rhsgref_ins_g_rifleman", "rhsgref_ins_g_saboteur", "rhsgref_ins_g_sniper", "rhsgref_ins_g_spotter"
			],
			// Difficulty level 3
			[
				"rhsgref_ins_g_specialist_aa", "rhsgref_ins_g_grenadier_rpg", "rhsgref_ins_g_machinegunner", "rhsgref_ins_g_militiaman_mosin",
				"rhsgref_ins_g_medic", "rhsgref_ins_g_rifleman_akm", "rhsgref_ins_g_rifleman_aks74", "rhsgref_ins_g_rifleman_aksu",
				"rhsgref_ins_g_grenadier", "rhsgref_ins_g_rifleman_RPG26", "rhsgref_ins_g_engineer",
				"rhsgref_ins_g_rifleman", "rhsgref_ins_g_saboteur", "rhsgref_ins_g_sniper", "rhsgref_ins_g_spotter"
			]
		]
	];

	_officerTypes = [
		// BLUFOR officers
		["rhsusf_army_ocp_teamleader", "rhsusf_army_ocp_officer", "rhsusf_army_ocp_squadleader"],
		// OPFOR officers
		["rhs_vdv_des_sergeant", "rhs_msv_emr_officer_armored"],
		// Insurgency officers
		["rhsgref_ins_g_squadleader"]
	];

	// Each zone has its possible waypoints
	switch (_zone) do {
		case BLUFOR_ZONE_SOUTH_WEST: {
			_markersName = "blufor_patrol_south";
			_unitTypes = (_unitTypes select 0) select (_difficulty - 1);
			_officerTypes = _officerTypes select 0;
			_unitsCount = 4;
		};
		case INSURGENTS_ZONE_SOUTH_WEST: {
			_markersName = "insurgent_patrol";
			_unitTypes = (_unitTypes select 2) select (_difficulty - 1);
			_officerTypes = _officerTypes select 2;
			_unitsCount = 4;
		};
		case INSURGENTS_ZONE_SOUTH_EAST: {
			_markersName = "insurgent_patrol_east";
			_unitTypes = (_unitTypes select 2) select (_difficulty - 1);
			_officerTypes = _officerTypes select 2;
			_unitsCount = 4;
		};
		case INSURGENTS_ZONE_MOUNTAIN: {
			_markersName = "insurgent_patrol_mountain";
			_unitTypes = (_unitTypes select 2) select (_difficulty - 1);
			_officerTypes = _officerTypes select 2;
			// Mountain patrols are small
			_unitsCount = 3;
		};
		case OPFOR_ZONE_SOUTH_EAST: {
			_markersName = "opfor_patrol_south_island";
			_unitTypes = (_unitTypes select 1) select (_difficulty - 1);
			_officerTypes = _officerTypes select 1;
			_unitsCount = 4;
		};
		case OPFOR_ZONE_NORTH_EAST: {
			_markersName = "opfor_patrol";
			_unitTypes = (_unitTypes select 1) select (_difficulty - 1);
			_officerTypes = _officerTypes select 1;
			_unitsCount = 6;
		};
		case BLUFOR_ZONE_NORTH_WEST: {
			_markersName = "blufor_patrol";
			_unitTypes = (_unitTypes select 0) select (_difficulty - 1);
			_officerTypes = _officerTypes select 0;
			_unitsCount = 6;
		};
		default {};
	};

	_breakLoop = false;
	_markersCount = 0;
	while {!_breakLoop} do {
		_pos = getMarkerPos format["%1_%2", _markersName, _markersCount];
		if ((_pos select 0) != 0 || (_pos select 1) != 0) then {
			_possibleWaypoints pushBack _pos;
		} else {
			_breakLoop = true;
		};
		_markersCount = _markersCount + 1;
	};

	// Get 4 random waypoints for the patrol route
	for "_i" from 0 to 3 do {
		_randomIndex = round (random ((count _possibleWaypoints) - 1));
		_waypoint = _possibleWaypoints select _randomIndex;
		_possibleWaypoints set [_randomIndex, -1];
		_possibleWaypoints = _possibleWaypoints - [-1];
		_waypoints pushBack _waypoint;
	};
	
	for "_i" from 1 to _unitsCount do
	{
		// First waypoint is also the spawn point
		_uPos = (_waypoints select 0) vectorAdd ([[random 10, 0, 0], random 360] call BIS_fnc_rotateVector2D);
		_unit = nil;
		// Spawn first the group leader/officer
		if (_i == 1) then {
			_unit = _group createUnit [_officerTypes call BIS_fnc_selectRandom, _uPos, [], 0, "Form"];
			_group selectLeader _unit;
			// Extra difficulty for Officers
			_difficulty = _difficulty + 1;
		} else {
			_unit = _group createUnit [_unitTypes call BIS_fnc_selectRandom, _uPos, [], 0, "Form"];
		};
		[_unit] joinSilent _group;
		_unit setPosATL _uPos;

		_skill = 0.33;
		_accuracy = 0.75;
		switch (_difficulty) do {
			case 0: { _skill = 0.33; _accuracy = 0.75; };
			case 1: { _skill = 0.41; _accuracy = 0.87; };
			case 2: { _skill = 0.50; _accuracy = 1;    };
			case 3: { _skill = 0.65; _accuracy = 1.15; };
		};

		_unit allowFleeing 0;
		_unit setSkill _skill;
		_unit setSkill ["aimingAccuracy", (_unit skill "aimingAccuracy") * _accuracy];
		_unit setSkill ["courage", 1];
		_unit addEventHandler ["Killed", server_playerDied];
	};

	// Add group waypoints
	for "_i" from 0 to 3 do {
		_wp = _group addWaypoint [_waypoints select _i, 5, _i];
		[_group, _i] setWaypointBehaviour "SAFE";
	    [_group, _i] setWaypointCombatMode "YELLOW";
	    [_group, _i] setWaypointFormation "STAG COLUMN";
	    [_group, _i] setWaypointSpeed "LIMITED";
	    if (_i == 3)  then {
	    	[_group, _i] setWaypointType "CYCLE";
	    };
	};

	// Setup group for initial spawn
	_group setSpeedMode "LIMITED";
	_group setBehaviour "SAFE";
	_group setCombatMode "YELLOW";
	_group setFormation "STAG COLUMN";

	// Return the group
	_group;
};

/*
 * Creates a random motorized patrol and returns the AI group.
 * @param _zone int Patrol zone ID
 * @param _difficulty int The difficulty level for this patrol (1, 2 or 3)
 */
WI_fnc_CreateRandomMotorizedPatrol = {
	if (!isServer) exitWith {};

	private ["_group", "_zone", "_difficulty", "_unitsCount", "_possibleWaypoints", "_waypoints", "_unitTypes", "_officerTypes", "_vehicleTypes", "_vehicle1", "_vehicle2", "_markersName", "_breakLoop", "_markersCount"];

	// All AI is OpFor
	_group = createGroup [east, true];
	_zone = _this select 0;
	_difficulty = _this select 1;
	_unitsCount = 5;
	_possibleWaypoints = [];
	_waypoints = [];
	_markersName = "";

	_unitTypes = [
		// BLUFOR units
		[
			// Difficulty level 1
			[
				"rhsusf_usmc_marpat_d_rifleman", "rhsusf_usmc_marpat_d_rifleman_law", "rhsusf_usmc_marpat_d_rifleman_m4",
				"rhsusf_usmc_marpat_d_rifleman_light", "rhsusf_usmc_marpat_d_stinger", "rhsusf_usmc_marpat_d_grenadier"
			],
			// Difficulty level 2
			[
				"rhsusf_usmc_marpat_d_rifleman", "rhsusf_usmc_marpat_d_rifleman_law", "rhsusf_usmc_marpat_d_riflemanat", "rhsusf_usmc_marpat_d_rifleman_m4",
				"rhsusf_usmc_marpat_d_rifleman_light", "rhsusf_usmc_marpat_d_smaw", "rhsusf_usmc_marpat_d_stinger", "rhsusf_usmc_marpat_d_machinegunner",
				"rhsusf_usmc_marpat_d_grenadier", "rhsusf_usmc_marpat_d_marksman", "rhsusf_usmc_marpat_d_engineer"
			],
			// Difficulty level 3
			[
				"rhsusf_army_ocp_aa", "rhsusf_army_ocp_rifleman_1stcav", "rhsusf_army_ocp_rifleman_10th", "rhsusf_army_ocp_marksman",
				"rhsusf_army_ocp_machinegunner", "rhsusf_army_ocp_grenadier", "rhsusf_army_ocp_fso", "rhsusf_army_ocp_medic",
				"rhsusf_army_ocp_maaws", "rhsusf_army_ocp_riflemanat", "rhsusf_army_ocp_rifleman_m590", "rhsusf_army_ocp_autorifleman",
				"rhsusf_army_ocp_engineer", "rhsusf_army_ocp_explosives", "rhsusf_army_ocp_sniper"
			]
		],
		// OPFOR units
		[
			// Difficulty level 1
			[
				"rhs_msv_emr_rifleman", "rhs_msv_emr_grenadier", "rhs_msv_emr_LAT", "rhs_msv_emr_RShG2",
				"rhs_msv_emr_aa", "rhs_msv_emr_at", "rhs_msv_emr_arifleman", "rhs_msv_emr_efreitor",
				"rhs_msv_emr_grenadier", "rhs_msv_emr_machinegunner"
			],
			// Difficulty level 2
			[
				"rhs_msv_emr_rifleman", "rhs_msv_emr_grenadier", "rhs_msv_emr_LAT", "rhs_msv_emr_RShG2",
				"rhs_msv_emr_aa", "rhs_msv_emr_at", "rhs_msv_emr_arifleman", "rhs_msv_emr_efreitor",
				"rhs_msv_emr_grenadier", "rhs_msv_emr_engineer_rpg", "rhs_msv_emr_machinegunner", "rhs_msv_emr_marksman",
				"rhs_msv_emr_medic"
			],
			// Difficulty level 3
			[
				"rhs_vdv_des_aa", "rhs_vdv_des_at", "rhs_vdv_des_arifleman", "rhs_vdv_des_efreitor",
				"rhs_vdv_des_engineer", "rhs_vdv_des_grenadier_rpg", "rhs_vdv_des_junior_sergeant", "rhs_vdv_des_machinegunner",
				"rhs_vdv_des_marksman", "rhs_vdv_des_marksman_asval", "rhs_vdv_des_medic", "rhs_vdv_des_grenadier",
				"rhs_vdv_des_LAT", "rhs_vdv_des_RShG2"
			]
		],
		// Insurgency units
		[
			// Difficulty level 1
			[
				"rhsgref_ins_g_specialist_aa", "rhsgref_ins_g_grenadier_rpg", "rhsgref_ins_g_machinegunner", "rhsgref_ins_g_militiaman_mosin",
				"rhsgref_ins_g_medic", "rhsgref_ins_g_rifleman_akm", "rhsgref_ins_g_rifleman_aks74", "rhsgref_ins_g_rifleman_aksu",
				"rhsgref_ins_g_grenadier", "rhsgref_ins_g_rifleman_RPG26", "rhsgref_ins_g_engineer"
			],
			// Difficulty level 2
			[
				"rhsgref_ins_g_specialist_aa", "rhsgref_ins_g_grenadier_rpg", "rhsgref_ins_g_machinegunner", "rhsgref_ins_g_militiaman_mosin",
				"rhsgref_ins_g_rifleman", "rhsgref_ins_g_saboteur", "rhsgref_ins_g_sniper", "rhsgref_ins_g_spotter"
			],
			// Difficulty level 3
			[
				"rhsgref_ins_g_specialist_aa", "rhsgref_ins_g_grenadier_rpg", "rhsgref_ins_g_machinegunner", "rhsgref_ins_g_militiaman_mosin",
				"rhsgref_ins_g_medic", "rhsgref_ins_g_rifleman_akm", "rhsgref_ins_g_rifleman_aks74", "rhsgref_ins_g_rifleman_aksu",
				"rhsgref_ins_g_grenadier", "rhsgref_ins_g_rifleman_RPG26", "rhsgref_ins_g_engineer",
				"rhsgref_ins_g_rifleman", "rhsgref_ins_g_saboteur", "rhsgref_ins_g_sniper", "rhsgref_ins_g_spotter"
			]
		]
	];

	_officerTypes = [
		// BLUFOR officers
		["rhsusf_army_ocp_teamleader", "rhsusf_army_ocp_officer", "rhsusf_army_ocp_squadleader"],
		// OPFOR officers
		["rhs_vdv_des_sergeant", "rhs_msv_emr_officer_armored"],
		// Insurgency officers
		["rhsgref_ins_g_squadleader"]
	];

	_vehicleTypes = [
		// BLUFOR possible vehicles for the convoy
		[
			// Difficulty level 1
			["rhsusf_m998_d_2dr_fulltop", "rhsusf_m1025_d"],
			// Difficulty level 2
			["rhsusf_m1025_d", "rhsusf_m1025_d_m2"],
			// Difficulty level 3
			["rhsusf_M1232_usarmy_wd", "rhsusf_M1220_M2_usarmy_wd"]
		],
		// OPFOR
		[
			// Difficulty level 1
			["rhs_tigr_msv", "rhs_tigr_m_msv"],
			// Difficulty level 2
			["rhs_tigr_m_msv", "rhs_tigr_sts_msv"],
			// Difficulty level 3
			["rhs_tigr_sts_msv", "rhs_tigr_m_msv"]
		],
		// Insurgency
		[
			// Difficulty level 1
			["rhsgref_ins_g_uaz", "rhsgref_ins_g_uaz_dshkm_chdkz"],
			// Difficulty level 2
			["rhsgref_ins_g_uaz", "rhsgref_ins_g_uaz_dshkm_chdkz"],
			// Difficulty level 3
			["rhsgref_ins_g_uaz", "rhsgref_ins_g_uaz_dshkm_chdkz"]
		]
	];

	// Each zone has its possible waypoints
	switch (_zone) do {
		case BLUFOR_ZONE_SOUTH_WEST: {
			_markersName = "blufor_patrol_south";
			_unitTypes = (_unitTypes select 0) select (_difficulty - 1);
			_officerTypes = _officerTypes select 0;
			_vehicleTypes = (_vehicleTypes select 0) select (_difficulty - 1);
			_unitsCount = 4;
		};
		case INSURGENTS_ZONE_SOUTH_WEST: {
			_markersName = "insurgent_patrol";
			_unitTypes = (_unitTypes select 2) select (_difficulty - 1);
			_officerTypes = _officerTypes select 2;
			_vehicleTypes = (_vehicleTypes select 2) select (_difficulty - 1);
			_unitsCount = 4;
		};
		case INSURGENTS_ZONE_SOUTH_EAST: {
			_markersName = "insurgent_patrol_east";
			_unitTypes = (_unitTypes select 2) select (_difficulty - 1);
			_officerTypes = _officerTypes select 2;
			_vehicleTypes = (_vehicleTypes select 2) select (_difficulty - 1);
			_unitsCount = 4;
		};
		case INSURGENTS_ZONE_MOUNTAIN: {
			_markersName = "insurgent_patrol_mountain";
			_unitTypes = (_unitTypes select 2) select (_difficulty - 1);
			_officerTypes = _officerTypes select 2;
			_vehicleTypes = (_vehicleTypes select 2) select (_difficulty - 1);
			// Mountain patrols are small
			_unitsCount = 3;
		};
		case OPFOR_ZONE_SOUTH_EAST: {
			_markersName = "opfor_patrol_south_island";
			_unitTypes = (_unitTypes select 1) select (_difficulty - 1);
			_officerTypes = _officerTypes select 1;
			_vehicleTypes = (_vehicleTypes select 1) select (_difficulty - 1);
			_unitsCount = 4;
		};
		case OPFOR_ZONE_NORTH_EAST: {
			_markersName = "opfor_patrol";
			_unitTypes = (_unitTypes select 1) select (_difficulty - 1);
			_officerTypes = _officerTypes select 1;
			_vehicleTypes = (_vehicleTypes select 1) select (_difficulty - 1);
			_unitsCount = 6;
		};
		case BLUFOR_ZONE_NORTH_WEST: {
			_markersName = "blufor_patrol";
			_unitTypes = (_unitTypes select 0) select (_difficulty - 1);
			_officerTypes = _officerTypes select 0;
			_vehicleTypes = (_vehicleTypes select 0) select (_difficulty - 1);
			_unitsCount = 6;
		};
		default {};
	};

	_breakLoop = false;
	_markersCount = 0;
	while {!_breakLoop} do {
		_pos = getMarkerPos format["%1_%2", _markersName, _markersCount];
		if ((_pos select 0) != 0 || (_pos select 1) != 0) then {
			_possibleWaypoints pushBack _pos;
		} else {
			_breakLoop = true;
		};
		_markersCount = _markersCount + 1;
	};

	// Get 4 random waypoints for the patrol route
	for "_i" from 0 to 3 do {
		_randomIndex = round (random ((count _possibleWaypoints) - 1));
		_waypoint = _possibleWaypoints select _randomIndex;
		_possibleWaypoints set [_randomIndex, -1];
		_possibleWaypoints = _possibleWaypoints - [-1];
		_waypoints pushBack _waypoint;
	};

	// Spawn vehicles
	_vehicle1 = (_vehicleTypes select 0) createVehicle (_waypoints select 1);
	_vehicle1 allowDamage false;
	_group addVehicle _vehicle1;
	_vehicle1 setVariable ["R3F_LOG_disabled", true, true];
	_vehicle1 setVariable ["A3W_skipAutoSave", true, true];
	[_vehicle1] spawn {sleep 10; (_this select 0) allowDamage true;};
	_vehicle2 = (_vehicleTypes select 1) createVehicle (_waypoints select 1);
	_vehicle2 allowDamage false;
	_group addVehicle _vehicle2;
	_vehicle2 setVariable ["R3F_LOG_disabled", true, true];
	_vehicle2 setVariable ["A3W_skipAutoSave", true, true];
	[_vehicle2] spawn {sleep 10; (_this select 0) allowDamage true;};

	for "_i" from 1 to _unitsCount do
	{
		// First waypoint is also the spawn point
		_uPos = (_waypoints select 1);
		_unit = nil;
		// Spawn first the group leader/officer
		if (_i == 1) then {
			_unit = _group createUnit [_officerTypes call BIS_fnc_selectRandom, [_uPos, 1, 30] call BIS_fnc_findSafePos, [], 0, "Form"];
			_group selectLeader _unit;
			// Extra difficulty for Officers
			_difficulty = _difficulty + 1;
		} else {
			_unit = _group createUnit [_unitTypes call BIS_fnc_selectRandom, [_uPos, 1, 30] call BIS_fnc_findSafePos, [], 0, "Form"];
		};
		_unit setPosATL _uPos;
		[_unit] joinSilent _group;

		_skill = 0.33;
		_accuracy = 0.75;
		switch (_difficulty) do {
			case 0: { _skill = 0.33; _accuracy = 0.75; };
			case 1: { _skill = 0.41; _accuracy = 0.87; };
			case 2: { _skill = 0.50; _accuracy = 1;    };
			case 3: { _skill = 0.65; _accuracy = 1.15; };
		};

		_unit allowFleeing 0;
		_unit setSkill _skill;
		_unit setSkill ["aimingAccuracy", (_unit skill "aimingAccuracy") * _accuracy];
		_unit setSkill ["courage", 1];
		_unit addEventHandler ["Killed", server_playerDied];
	};

	// Add group waypoints
	for "_i" from 0 to 3 do {
		_wp = _group addWaypoint [_waypoints select _i, 5, _i];
		[_group, _i] setWaypointBehaviour "SAFE";
	    [_group, _i] setWaypointCombatMode "YELLOW";
	    [_group, _i] setWaypointFormation "STAG COLUMN";
	    [_group, _i] setWaypointSpeed "LIMITED";
	    if (_i == 3)  then {
	    	[_group, _i] setWaypointType "CYCLE";
	    };
	};

	// Setup group for initial spawn
	_group setSpeedMode "LIMITED";
	_group setBehaviour "SAFE";
	_group setCombatMode "YELLOW";
	_group setFormation "STAG COLUMN";

	// Return the group
	_group;
};
