/******************************************************************************************
 * This project is licensed under the GNU Affero GPL v3. Copyright © 2017 MrAnkso         *
 ******************************************************************************************
 * @file Name: server\pve\dungeons\DungeonsFunctions.sqf
 * @file Author: MrAnkso
 *
 * Stores functions used only for managing/generating dungeons AKA complexes.
 */

/*
 * Initializes a dungeon.
 * @param _dungeonInfo array Information about the dungeon parameters as saved in server/pve/dungeons/DungeonInfo.sqf
 * @return array Returns all the AI groups created for the dungeon.
 */

WI_fnc_InitDungeon = {
	if (!isServer) exitWith {};

	private ["_dungeonInfo", "_groups", "_j"];

	_dungeonInfo = _this;
	_groups = [];
	// Initialize dungeon patrols
	_j = 0;
	// No more than 10 patrols per dungeon...
	while {_j < 10} do {
		// Get waypoints
		_waypoints = [];
		_lastMarker = false;
		_k = 0;
		while {!_lastMarker} do {
			_waypoint = getMarkerPos format ["%1_patrol_%2_%3", (_dungeonInfo select 1), _j, _k];
			if ((_waypoint select 0) == 0 && (_waypoint select 1) == 0) then {
				_lastMarker = true;
			} else {
				_waypoints pushBack _waypoint;
			};
			_k = _k + 1;
		};

		// Check if we are out of patrol routes
		if (count _waypoints > 0) then {
			_unitsCount = _dungeonInfo select 4;
			_unitsCountMin = _unitsCount select 0;
			_unitsCountMax = _unitsCount select 1;
			// Select random number between min and max
			_unitsCount = (round (random (_unitsCountMax - _unitsCountMin))) + _unitsCountMin;
			_difficulty = _dungeonInfo select 2;
			_faction = _dungeonInfo select 9;
			_group = [_waypoints, _unitsCount, _difficulty, _faction] call WI_fnc_CreateDungeonPatrol;
			_groups pushBack _group;
			_j = _j + 1;
		} else {
			_j = 10;
		};
	};
	// Intialize dungeon static groups
	_j = 0;
	// No more than 10 static groups per dungeon...
	while {_j < 10} do {
		// Get position
		_markerName = format ["%1_static_%2", _dungeonInfo select 1, _j];
		_position = getMarkerPos _markerName;
		// Check if we are out of patrol routes
		if ((_position select 0) != 0 && (_position select 1) != 0) then {
			_unitsCount = _dungeonInfo select 5;
			_inBuilding = false;
			if (markerText _markerName == "inBuilding") then {
				_inBuilding = true;
				_unitsCount = _dungeonInfo select 6;
			};
			// Select random number between min and max
			_unitsCountMin = _unitsCount select 0;
			_unitsCountMax = _unitsCount select 1;
			_unitsCount = (round (random (_unitsCountMax - _unitsCountMin))) + _unitsCountMin;
			_difficulty = _dungeonInfo select 2;
			_faction = _dungeonInfo select 9;
			_group = [_position, _unitsCount, _difficulty, _faction, _inBuilding] call WI_fnc_CreateDungeonStaticGroup;
			_groups pushBack _group;
			_j = _j + 1;
		} else {
			_j = 10;
		};
	};
	// Spawn dungeon boss
	// Get position
	_markerName = format ["%1_boss_spawn", _dungeonInfo select 1];
	_position = getMarkerPos _markerName;
	if ((_position select 0) != 0 && (_position select 1) != 0) then {
		_inBuilding = false;
		if (markerText _markerName == "inBuilding") then {
			_inBuilding = true;
		};
		_difficulty = _dungeonInfo select 3;
		_faction = _dungeonInfo select 9;
		_group = [_position, _difficulty, _faction, _inBuilding] call WI_fnc_CreateDungeonBoss;
		_groups pushBack _group;
	};

	_groups;
};

/*
 * Creates a dungeon patrol and returns the AI group with the given waypoints.
 * @param _waypoints [position] Array with patrol waypoints.
 * @param _unitsCount int Number of NPCs in the patrol.
 * @param _difficulty int The difficulty level for this patrol (1, 2 or 3).
 * @param _faction string Faction of the patrol (INSURGENCY, BLUFOR or OPFOR).
 * @return group Returns the created group.
 */
 WI_fnc_CreateDungeonPatrol = {
	if (!isServer) exitWith {};

	private ["_group", "_difficulty", "_unitsCount", "_waypoints", "_unitTypes", "_officerTypes", "_faction"];

	// All AI is OpFor
	_group = createGroup [east, true];
	_waypoints = _this select 0;
	_difficulty = _this select 2;
	_unitsCount = _this select 1;
	_faction = _this select 3;

	switch (_faction) do {
		case "INSURGENCY": {
			_unitTypes = InsurgencyUnitTypes select (_difficulty - 1);
			_officerTypes = InsurgencyOfficerTypes;
		};
		case "OPFOR": {
			_unitTypes = OpforUnitTypes select (_difficulty - 1);
			_officerTypes = OpforOfficerTypes;
		};
		case "BLUFOR": {
			_unitTypes = BluforUnitTypes select (_difficulty - 1);
			_officerTypes = BluforOfficerTypes;
		};
		default {};
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
		switch (_difficulty) do {
			case 1: { _skill = 0.33; _accuracy = 0.75; };
			case 2: { _skill = 0.41; _accuracy = 0.87; };
			case 3: { _skill = 0.50; _accuracy = 1;    };
			case 4: { _skill = 0.65; _accuracy = 1.15; };
		};

		_unit allowFleeing 0;
		_unit setSkill _skill;
		_unit setSkill ["aimingAccuracy", (_unit skill "aimingAccuracy") * _accuracy];
		_unit setSkill ["courage", 1];
		_unit addEventHandler ["Killed", server_playerDied];
		_unit setVariable ["ficticiousFaction", _faction, true];
	};

	// Add group waypoints
	for "_i" from 0 to ((count _waypoints) - 1) do {
		_wp = _group addWaypoint [_waypoints select _i, 5, _i];
		[_group, _i] setWaypointBehaviour "SAFE";
	    [_group, _i] setWaypointCombatMode "YELLOW";
	    [_group, _i] setWaypointFormation "STAG COLUMN";
	    [_group, _i] setWaypointSpeed "LIMITED";
	    if (_i == (count _waypoints) - 1)  then {
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
 * Creates a dungeon static group and returns the AI group.
 * @param _position position Position to spawn the group.
 * @param _unitsCount int Number of NPCs in the group.
 * @param _difficulty int The difficulty level for this group (1, 2 or 3).
 * @param _faction string Faction of the group (INSURGENCY, BLUFOR or OPFOR).
 * @param _inBuilding bool Specifies if the units must be spawned randomly inside the nearest building to the given position.
 * @return group Returns the created group.
 */
 WI_fnc_CreateDungeonStaticGroup = {
	if (!isServer) exitWith {};

	private ["_group", "_difficulty", "_unitsCount", "_position", "_unitTypes", "_officerTypes", "_faction", "_inBuilding", "_buildingPositions"];

	// All AI is OpFor
	_group = createGroup [east, true];
	_position = _this select 0;
	_difficulty = _this select 2;
	_unitsCount = _this select 1;
	_faction = _this select 3;
	_inBuilding = _this select 4;

	switch (_faction) do {
		case "INSURGENCY": {
			_unitTypes = InsurgencyUnitTypes select (_difficulty - 1);
			_officerTypes = InsurgencyOfficerTypes;
		};
		case "OPFOR": {
			_unitTypes = OpforUnitTypes select (_difficulty - 1);
			_officerTypes = OpforOfficerTypes;
		};
		case "BLUFOR": {
			_unitTypes = BluforUnitTypes select (_difficulty - 1);
			_officerTypes = BluforOfficerTypes;
		};
		default {};
	};

	// Find nearest building
	if (_inBuilding) then {
		_buildingPositions = [nearestBuilding _position] call BIS_fnc_buildingPositions;
	};

	for "_i" from 1 to _unitsCount do
	{
		_uPos = _position;
		if (_inBuilding) then {
			_index = floor (random (count _buildingPositions));
			_uPos = _buildingPositions select _index;
			// Remove already taken position
			// Do not spawn more units than the number of positions in the building!!
			_buildingPositions set [_index, -1];
			_buildingPositions = _buildingPositions - [-1];
		};
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
			case 1: { _skill = 0.33; _accuracy = 0.75; };
			case 2: { _skill = 0.41; _accuracy = 0.87; };
			case 3: { _skill = 0.50; _accuracy = 1;    };
			case 4: { _skill = 0.65; _accuracy = 1.15; };
		};

		_unit allowFleeing 0;
		_unit setSkill _skill;
		_unit setSkill ["aimingAccuracy", (_unit skill "aimingAccuracy") * _accuracy];
		_unit setSkill ["courage", 1];
		_unit addEventHandler ["Killed", server_playerDied];
		_unit setVariable ["ficticiousFaction", _faction, true];
	};

	// Setup group for initial spawn
	_group setBehaviour "SAFE";
	_group setCombatMode "YELLOW";
	_wp = _group addWaypoint [_position, 5, 0];
	[_group, 0] setWaypointBehaviour "SAFE";
    [_group, 0] setWaypointCombatMode "YELLOW";
    [_group, 0] setWaypointFormation "STAG COLUMN";
    [_group, 0] setWaypointSpeed "LIMITED";
    if (_inBuilding) then {
    	[_group, 0] setWaypointType "HOLD";
    };
    [_group, 0] setWaypointType "LOITER";

	// Return the group
	_group;
};

/*
 * Creates a dungeon boss (a group of one high priority target unit).
 * @param _position position Position to spawn the boss.
 * @param _difficulty int The difficulty level for this boss (4, 5 or 6).
 * @param _faction string Faction of the boss (INSURGENCY, BLUFOR or OPFOR).
 * @param _inBuilding bool Specifies if the units must be spawned randomly inside the nearest building to the given position.
 * @return group Returns the group of the boss.
 */
 WI_fnc_CreateDungeonBoss = {
	if (!isServer) exitWith {};

	private ["_group", "_difficulty", "_position", "_bossType", "_faction", "_inBuilding", "_buildingPositions"];

	// All AI is OpFor
	_group = createGroup [east, true];
	_position = _this select 0;
	_difficulty = _this select 1;
	_faction = _this select 2;
	_inBuilding = _this select 3;

	switch (_faction) do {
		case "INSURGENCY": { _bossType = "rhsgref_ins_g_commander"; };
		case "OPFOR": { _bossType = "rhs_vmf_recon_officer_armored"; };
		case "BLUFOR": { _bossType = "rhsusf_usmc_marpat_d_officer"; };
		default {};
	};

	// Find nearest building
	if (_inBuilding) then {
		_buildingPositions = [nearestBuilding _position] call BIS_fnc_buildingPositions;
	};

	if (_inBuilding) then {
		_index = floor (random (count _buildingPositions));
		_position = _buildingPositions select _index;
	};
	_unit = _group createUnit [_bossType, _position, [], 0, "Form"];
	_group selectLeader _unit;
	[_unit] joinSilent _group;
	_unit setPosATL _position;

	_skill = 0.65;
	_accuracy = 1.15;
	switch (_difficulty) do {
		case 4: { _skill = 0.65; _accuracy = 1.15; };
		case 5: { _skill = 0.85; _accuracy = 1.30; };
		case 6: { _skill = 1.00; _accuracy = 1.45; };
		default {};
	};

	_unit allowFleeing 0;
	_unit setSkill _skill;
	_unit setSkill ["aimingAccuracy", (_unit skill "aimingAccuracy") * _accuracy];
	_unit setSkill ["courage", 1];
	_unit addEventHandler ["Killed", server_playerDied];
	_unit setVariable ["ficticiousFaction", _faction, true];

	// Setup group for initial spawn
	_group setBehaviour "SAFE";
	_group setCombatMode "YELLOW";
	_wp = _group addWaypoint [_position, 5, 0];
	[_group, 0] setWaypointBehaviour "SAFE";
    [_group, 0] setWaypointCombatMode "YELLOW";
    [_group, 0] setWaypointSpeed "LIMITED";
    if (_inBuilding) then {
    	[_group, 0] setWaypointType "HOLD";
    };
    [_group, 0] setWaypointType "LOITER";

	// Return the group
	_group;
};
