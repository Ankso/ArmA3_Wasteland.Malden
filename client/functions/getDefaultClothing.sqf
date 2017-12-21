// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: getDefaultClothing.sqf
//	@file Author: AgentRev
//	@file Created: 22/12/2013 22:04

private ["_unit", "_item", "_side", "_isSniper", "_isDiver", "_defaultVest", "_result"];

_unit = _this select 0;
_item = _this select 1;

if (typeName _unit == "OBJECT") then
{
	_side = if (_unit == player) then { playerSide } else { side _unit };
	_unit = typeOf _unit;
}
else
{
	_side = _this select 2;
};

_isSniper = (["_sniper_", _unit] call fn_findString != -1);
_isDiver = (["_diver_", _unit] call fn_findString != -1);

_defaultVest = "";

_result = "";

switch (true) do
{
	case (_isSniper):
	{
		if (_item == "uniform") then { _result = "U_BG_Leader" };
		if (_item == "vest") then { _result = _defaultVest };
	};
	case (_isDiver):
	{
		if (_item == "uniform") then { _result = "U_I_Wetsuit" };
		if (_item == "vest") then { _result = "V_RebreatherIA" };
		if (_item == "goggles") then { _result = "G_Diving" };
	};
	default
	{
		if (_item == "uniform") then { _result = selectRandom ["U_BG_Guerilla2_1", "U_BG_Guerilla2_2", "U_BG_Guerilla2_3", "U_BG_Guerilla3_1", "U_Marshal"]; hint _result; };
		if (_item == "vest") then { _result = _defaultVest };
	};
};

if (_item == "headgear") then { _result = "H_MilCap_dgtl" };

_result;
