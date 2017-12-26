// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2015 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: atmPositions.sqf
//	@file Author: AgentRev

// ATM positions for Malden map
[
	[5389.84,2788.19,1.45766],
	[5763.68,2396.22,1.28615],
	[5898.79,3604.01,1.28059]
]

// The above array was built using the following code snippet called from the mission editor debug console:
/*
_atms = [];
{
	if ((str _x) find ": atm_" != -1) then
	{
		_pos = _x modelToWorld [0,0,0];
		if (surfaceIsWater _pos) then
		{
			_pos = _pos vectorAdd ((getPosASL _x) vectorDiff (getPosASLW _x));
		};
		_atms pushBack _pos;
	};
} forEach nearestObjects [player, [], 999999];

copyToClipboard str _atms;
*/
