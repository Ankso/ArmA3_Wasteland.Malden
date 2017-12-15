// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.1
//	@file Name: spawnRandom.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, [GoT] JoSchaap, AgentRev

private ["_preload", "_randomLoc", "_pos", "_rad", "_townName", "_playerPos"];
_preload = param [1, false, [false]];

_pos = getMarkerPos "safe_zone_marker";
_rad = 400;
_townName = "Safe zone";

_playerPos = [_pos,5,_rad,1,0,0,0] call findSafePos;
if (_preload) then { waitUntil {sleep 0.1; preloadCamera _playerPos} };

waitUntil {!isNil "bis_fnc_init" && {bis_fnc_init}};

player setPos _playerPos;

respawnDialogActive = false;
closeDialog 0;

_townName spawn
{
	_townName = _this;
	sleep 1;

	_hour = date select 3;
	_mins = date select 4;
	["Wasted island", _townName, format ["%1:%3%2", _hour, _mins, if (_mins < 10) then {"0"} else {""}]] spawn BIS_fnc_infoText;
};
