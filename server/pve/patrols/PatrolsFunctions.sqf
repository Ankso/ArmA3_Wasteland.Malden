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

	private ["_group", "_zone", "_difficulty", "_unitsCount", "_possibleWaypoints", "_waypoints", "_unitTypes", "_officerTypes", "_markersName", "_faction", "_breakLoop", "_markersCount"];

	// All AI is OpFor
	_group = createGroup [east, true];
	_zone = _this select 0;
	_difficulty = _this select 1;
	_unitsCount = 5;
	_possibleWaypoints = [];
	_waypoints = [];
	_markersName = "";
	_faction = "";

	// Each zone has its possible waypoints
	switch (_zone) do {
		case BLUFOR_ZONE_SOUTH_WEST: {
			_markersName = "blufor_patrol_south";
			_unitTypes = BluforUnitTypes select (_difficulty - 1);
			_officerTypes = BluforOfficerTypes;
			_unitsCount = 4;
			_faction = "BLUFOR";
		};
		case INSURGENTS_ZONE_SOUTH_WEST: {
			_markersName = "insurgent_patrol";
			_unitTypes = InsurgencyUnitTypes select (_difficulty - 1);
			_officerTypes = InsurgencyOfficerTypes;
			_unitsCount = 4;
			_faction = "INSURGENCY";
		};
		case INSURGENTS_ZONE_SOUTH_EAST: {
			_markersName = "insurgent_patrol_east";
			_unitTypes = InsurgencyUnitTypes select (_difficulty - 1);
			_officerTypes = InsurgencyOfficerTypes;
			_unitsCount = 4;
			_faction = "INSURGENCY";
		};
		case INSURGENTS_ZONE_MOUNTAIN: {
			_markersName = "insurgent_patrol_mountain";
			_unitTypes = InsurgencyUnitTypes select (_difficulty - 1);
			_officerTypes = InsurgencyOfficerTypes;
			// Mountain patrols are small
			_unitsCount = 3;
			_faction = "INSURGENCY";
		};
		case OPFOR_ZONE_SOUTH_EAST: {
			_markersName = "opfor_patrol_south_island";
			_unitTypes = OpforUnitTypes select (_difficulty - 1);
			_officerTypes = OpforOfficerTypes;
			_unitsCount = 4;
			_faction = "OPFOR";
		};
		case OPFOR_ZONE_NORTH_EAST: {
			_markersName = "opfor_patrol";
			_unitTypes = OpforUnitTypes select (_difficulty - 1);
			_officerTypes = OpforOfficerTypes;
			_unitsCount = 6;
			_faction = "OPFOR";
		};
		case BLUFOR_ZONE_NORTH_WEST: {
			_markersName = "blufor_patrol";
			_unitTypes = BluforUnitTypes select (_difficulty - 1);
			_officerTypes = BluforOfficerTypes;
			_unitsCount = 6;
			_faction = "BLUFOR";
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
		_uPos = (_waypoints select 0);
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
		_rank = "PRIVATE";
		switch (_difficulty) do {
			case 1: { _skill = 0.33; _accuracy = 0.75; _rank = "PRIVATE";    };
			case 2: { _skill = 0.41; _accuracy = 0.87; _rank = "CORPORAL";   };
			case 3: { _skill = 0.50; _accuracy = 1;    _rank = "SERGEANT";   };
			case 4: { _skill = 0.65; _accuracy = 1.15; _rank = "LIEUTENANT"; };
		};

		_unit allowFleeing 0;
		_unit setSkill _skill;
		_unit setSkill ["aimingAccuracy", (_unit skill "aimingAccuracy") * _accuracy];
		_unit setSkill ["courage", 1];
		_unit setRank _rank;
		_unit addEventHandler ["Killed", server_playerDied];
		_unit setVariable ["ficticiousFaction", _faction, true];
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

	private ["_group", "_zone", "_difficulty", "_unitsCount", "_possibleWaypoints", "_waypoints", "_unitTypes", "_officerTypes", "_vehicleTypes", "_vehicle1", "_vehicle2", "_markersName", "_faction", "_breakLoop", "_markersCount"];

	// All AI is OpFor
	_group = createGroup [east, true];
	_zone = _this select 0;
	_difficulty = _this select 1;
	_unitsCount = 5;
	_possibleWaypoints = [];
	_waypoints = [];
	_markersName = "";
	_faction = "";

	// Each zone has its possible waypoints
	switch (_zone) do {
		case BLUFOR_ZONE_SOUTH_WEST: {
			_markersName = "blufor_patrol_south";
			_unitTypes = BluforUnitTypes select (_difficulty - 1);
			_officerTypes = BluforOfficerTypes;
			_vehicleTypes = BluforVehicleTypes select (_difficulty - 1);
			_unitsCount = 4;
			_faction = "BLUFOR";
		};
		case INSURGENTS_ZONE_SOUTH_WEST: {
			_markersName = "insurgent_patrol";
			_unitTypes = InsurgencyUnitTypes select (_difficulty - 1);
			_officerTypes = InsurgencyOfficerTypes;
			_vehicleTypes = InsurgencyVehicleTypes select (_difficulty - 1);
			_unitsCount = 4;
			_faction = "INSURGENCY";
		};
		case INSURGENTS_ZONE_SOUTH_EAST: {
			_markersName = "insurgent_patrol_east";
			_unitTypes = InsurgencyUnitTypes select (_difficulty - 1);
			_officerTypes = InsurgencyOfficerTypes;
			_vehicleTypes = InsurgencyVehicleTypes select (_difficulty - 1);
			_unitsCount = 4;
			_faction = "INSURGENCY";
		};
		case INSURGENTS_ZONE_MOUNTAIN: {
			_markersName = "insurgent_patrol_mountain";
			_unitTypes = InsurgencyUnitTypes select (_difficulty - 1);
			_officerTypes = InsurgencyOfficerTypes;
			_vehicleTypes = InsurgencyVehicleTypes select (_difficulty - 1);
			// Mountain patrols are small
			_unitsCount = 3;
			_faction = "INSURGENCY";
		};
		case OPFOR_ZONE_SOUTH_EAST: {
			_markersName = "opfor_patrol_south_island";
			_unitTypes = OpforUnitTypes select (_difficulty - 1);
			_officerTypes = OpforOfficerTypes;
			_vehicleTypes = OpforVehicleTypes select (_difficulty - 1);
			_unitsCount = 4;
			_faction = "OPFOR";
		};
		case OPFOR_ZONE_NORTH_EAST: {
			_markersName = "opfor_patrol";
			_unitTypes = OpforUnitTypes select (_difficulty - 1);
			_officerTypes = OpforOfficerTypes;
			_vehicleTypes = OpforVehicleTypes select (_difficulty - 1);
			_unitsCount = 6;
			_faction = "OPFOR";
		};
		case BLUFOR_ZONE_NORTH_WEST: {
			_markersName = "blufor_patrol";
			_unitTypes = BluforUnitTypes select (_difficulty - 1);
			_officerTypes = BluforOfficerTypes;
			_vehicleTypes = BluforVehicleTypes select (_difficulty - 1);
			_unitsCount = 6;
			_faction = "BLUFOR";
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
	clearMagazineCargoGlobal _vehicle1;
	clearWeaponCargoGlobal _vehicle1;
	_vehicle1 setVariable ["R3F_LOG_disabled", true, true];
	_vehicle1 setVariable ["A3W_skipAutoSave", true, true];
	[_vehicle1] spawn {sleep 10; (_this select 0) allowDamage true;};
	_vehicle2 = (_vehicleTypes select 1) createVehicle (_waypoints select 1);
	_vehicle2 allowDamage false;
	_group addVehicle _vehicle2;
	clearMagazineCargoGlobal _vehicle2;
	clearWeaponCargoGlobal _vehicle2;
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
		_rank = "PRIVATE";
		switch (_difficulty) do {
			case 1: { _skill = 0.33; _accuracy = 0.75; _rank = "PRIVATE";    };
			case 2: { _skill = 0.41; _accuracy = 0.87; _rank = "CORPORAL";   };
			case 3: { _skill = 0.50; _accuracy = 1;    _rank = "SERGEANT";   };
			case 4: { _skill = 0.65; _accuracy = 1.15; _rank = "LIEUTENANT"; };
		};

		_unit allowFleeing 0;
		_unit setSkill _skill;
		_unit setSkill ["aimingAccuracy", (_unit skill "aimingAccuracy") * _accuracy];
		_unit setSkill ["courage", 1];
		_unit setRank _rank;
		_unit addEventHandler ["Killed", server_playerDied];
		_unit setVariable ["ficticiousFaction", _faction, true];
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
