/******************************************************************************************
 * This project is licensed under the GNU Affero GPL v3. Copyright © 2017 MrAnkso         *
 ******************************************************************************************
 * @file Name: server\pve\patrols\PatrolsManager.sqf
 * 
 * Patrols manager. Generates patrols randomly for each faction in each one of the map zones.
 * Malden has 7 patrol zones:
 *     - South-South West (Blufor)
 *     - South West (Insurgents)
 *     - South East (Insurgents)
 *     - Central mountain area (Insurgents)
 *     - South East island (Opfor)
 *     - North West (Blufor)
 *     - North East (Opfor)
 *
 * Each zone has different difficulty settings. Patrols are equipped with better gear and
 * drop better loot the closer you are to the north of the island.
 */

if (!isServer) exitWith {};

private ["_numberOfPatrols", "_patrolsDifficulty", "_count", "_i", "_groups"];

_numberOfPatrols = [2, 4, 3, 3, 1, 4, 5];
_patrolsDifficulty = [2, 1, 1, 2, 2, 3, 3];
_groups = [];

diag_log "SERVER - Patrols manager: Initializing...";

_count = 0;
_i = 0;
while {_i < MAX_PATROL_ZONES} do {
    _numPatrols = _numberOfPatrols select _i;
    _j = 0;
    while {_j < _numPatrols} do {
        // 25% chance of generating a motorized patrol
        _group = nil;
        if (random 1 < 0.25 && _i > OPFOR_ZONE_SOUTH_EAST) then {
            _group = [_i, _patrolsDifficulty select _i] call WI_fnc_CreateRandomMotorizedPatrol;
        } else {
            _group = [_i, _patrolsDifficulty select _i] call WI_fnc_CreateRandomPatrol;
        };
        // We have to store both the group and the difficulty and zone settings for later respawn.
        _groups pushBack [_group, _i, _patrolsDifficulty select _i];
        _count = _count + 1;
        _j = _j + 1;
    };
    _i = _i + 1;
};

diag_log format ["SERVER - Patrols manager: %1 patrols spawned and monitored", _count];

while {true} do {
    _totalGroups = (count _groups);
    _i = 0;
    while {_i < _totalGroups} do {
        _group = (_groups select _i) select 0;
        _zone = (_groups select _i) select 1;
        _difficulty = (_groups select _i) select 2;
        // Check if all the group members are dead
        if ({alive _x} count units _group <= 0) then {
            diag_log format ["SERVER - Patrols manager: A group in ZoneID %1 has been killed, respawning...", _zone];
            // Remove group from the array:
            _groups = _groups - [_group];
            // Create new patrol
            if (random 1 < 0.25 && _i > OPFOR_ZONE_SOUTH_EAST) then {
                _group = [_zone, _difficulty] call WI_fnc_CreateRandomMotorizedPatrol;
            } else {
                _group = [_zone, _difficulty] call WI_fnc_CreateRandomPatrol;
            };
            // Add the new group to the array again
            _groups pushBack [_group, _zone, _difficulty];
            diag_log format ["SERVER - Patrols manager: Group in ZoneID %1 respawned successfully!", _zone];
        };
        _i = _i + 1;
    };
    // One minute between checks is more than enought
    sleep 60;
};
