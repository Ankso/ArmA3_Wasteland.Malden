/******************************************************************************************
 * This project is licensed under the GNU Affero GPL v3. Copyright © 2017 MrAnkso         *
 ******************************************************************************************
 * @file Name: server\pve\dungeons\DungeonsManager.sqf
 * 
 * Dungeons manager. Generates the dungeons and respawns them when needed.
 * Malden has 11 dungeons or complexes:
 *     - Insurgency:
 *       * La Riviere
 * 		 * South East Harbor
 *       * Houdan
 *       * La Pessagne - Vigny
 *     - Opfor:
 *       * Military Harbor
 *       * La Trinite
 *       * Military airfield complex
 *     - Blufor:
 *       * USS Freedom
 *       * Goisse
 *       * Old military base
 *       * Captured airfield
 *
 * Each dungeon has its own difficulty settings, specified in server\pve\dungeons\DungeonInfo.sqf
 */

if (!isServer) exitWith {};

private ["_count", "_i", "_groups"];

diag_log "SERVER - Dungeons manager: Initializing...";

dungeons = []; // dungeons is global, so it can be accessed from async spawn calls.
_count = 0;
_i = 0;
while {_i < MAX_DUNGEONS} do {
	_dungeonInfo = DungeonsInfo select _i;
	if (typeName _dungeonInfo == "ARRAY") then {
		_groups = _dungeonInfo call WI_fnc_InitDungeon;
		// Add dungeon to initialized dungeons array
		dungeons pushBack [_dungeonInfo, _groups];
	};
    _i = _i + 1;
};

diag_log format ["SERVER - Dungeons manager: %1 dungeons spawned and monitored", _count];

while {true} do {
    _totalDungeons = (count dungeons);
    _i = 0;
    while {_i < _totalDungeons} do {
		_dungeonInfo = (dungeons select _i) select 0;
        _groups = (dungeons select _i) select 1;
        // Check if all groups are dead
        _aliveGroups = count _groups;
        _j = 0;
        while {_j < count _groups} do {
        	// Check if all the group members are dead
        	_group = _groups select _j;
	        if ({alive _x} count units _group <= 0) then {
	            _aliveGroups = _aliveGroups - 1;
	        } else {
	        	_j = count _groups;
	    	};
	    	_j = _j + 1;
        };
        // All groups are dead, dungeon has been completed
        if (_aliveGroups <= 0) then {
        	diag_log format ["SERVER - Dungeons manager: Dungeon %1 has been completed, respawning in %2 seconds.", _dungeonInfo select 0, _dungeonInfo select 10];
        	// Inform all players that the dungeon has been completed.
        	format ["Enemy positions in %1 are now clear, and will be for at least %2 hours.", _dungeonInfo select 0, (_dungeonInfo select 10) / 3600] remoteExec ["systemChat"];
        	// Remove dungeon from the array while the dungeon in respawn timer.
        	dungeons set [_i, -1];
        	dungeons = dungeons - [-1];
        	// Trigger delayed respawn
        	[_dungeonInfo] spawn {
        		private ["_dungeonInfo", "_groups"];

        		_dungeonInfo = _this select 0;
        		uiSleep _dungeonInfo select 10; // Dungeon respawn timer in seconds specified in DungeonsInfo.

        		_groups = _dungeonInfo call WI_fnc_InitDungeon;
				// Add dungeon to initialized dungeons array
				dungeons pushBack [_dungeonInfo, _groups];
				diag_log format ["SERVER - Dungeons Manager: Dungeon %1 has been respawned.", _dungeonInfo select 0];
        	};
        };
        _i = _i + 1;
        sleep 1;
    };
    // Five minutes between checks is more than enought
    uiSleep 60;
};
