// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2016 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: fn_createDungeonMarker.sqf
//	@file Author: MrAnkso

private ["_pos", "_duration", "_index", "_marker"];

_pos = _this select 0;
_duration = _this select 1;
_index = _this select 2;

// Create marker in position
_marker = createMarkerLocal [format ["dungeon_marker_%1", _index], _pos];
_marker setMarkerBrushLocal "Solid";
_marker setMarkerColorLocal "ColorRed";
_marker setMarkerShapeLocal "ELLIPSE";
_marker setMarkerAlphaLocal 0.5;
_marker setMarkerSizeLocal [15, 15];

uiSleep _duration;

deleteMarkerLocal _marker;
