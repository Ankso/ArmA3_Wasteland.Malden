// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: playerSetupGear.sqf
//	@file Author: [GoT] JoSchaap, AgentRev

private ["_player", "_uniform", "_vest", "_headgear", "_goggles"];
_player = _this;

sleep 0.1;

// Remove GPS
_player unlinkItem "ItemGPS";

// Remove radio
//_player unlinkItem "ItemRadio";

// Remove NVG
if (hmd _player != "") then { _player unlinkItem hmd _player };

switch (true) do
{
	case (["_medic_", typeOf _player] call fn_findString != -1):
	{
		_player forceAddUniform selectRandom ["U_BG_Guerrilla_6_1", "U_BG_Guerilla2_1", "U_BG_Guerilla2_2", "U_BG_Guerilla2_3", "U_BG_Guerilla3_1", "U_Marshal"];
		_player addBackpack "rhs_sidor";
		_player addMagazine "rhs_30Rnd_762x39mm";
		_player addWeapon "rhs_weap_akm";
		_player addMagazine "rhs_30Rnd_762x39mm";
		_player addMagazine "rhs_30Rnd_762x39mm";
		_player addMagazine "rhs_30Rnd_762x39mm";
		for "_i" from 1 to 10 do {
			_player addItem "FirstAidKit";
		};
		_player selectWeapon "rhs_weap_akm";
	};
	case (["_engineer_", typeOf _player] call fn_findString != -1):
	{
		_player forceAddUniform selectRandom ["U_BG_Guerrilla_6_1", "U_BG_Guerilla2_1", "U_BG_Guerilla2_2", "U_BG_Guerilla2_3", "U_BG_Guerilla3_1", "U_Marshal"];
		_player addBackpack "rhs_assault_umbts_engineer_empty";
		_player addMagazine "rhs_30Rnd_545x39_AK";
		_player addWeapon "rhs_weap_aks74u";
		_player addMagazine "rhs_30Rnd_545x39_AK";
		_player addMagazine "rhs_30Rnd_545x39_AK";
		_player addMagazine "rhs_30Rnd_545x39_AK";
		for "_i" from 1 to 2 do {
			_player addItem "FirstAidKit";
		};
		_player selectWeapon "rhs_weap_aks74u";
		for "_i" from 1 to 3 do {
			_player addItem "rhs_mag_rgd5";
		};
	};
	case (["_sniper_", typeOf _player] call fn_findString != -1):
	{
		_player forceAddUniform "U_BG_Leader"; // Cammo clothes for sniper...
		_player addWeapon "Binocular";
		_player addBackpack "rhs_sidor";
		_player addMagazine "rhsgref_5Rnd_792x57_kar98k";
		_player addWeapon "rhs_weap_kar98k";
		_player addMagazine "rhsgref_5Rnd_792x57_kar98k";
		_player addMagazine "rhsgref_5Rnd_792x57_kar98k";
		_player addMagazine "rhsgref_5Rnd_792x57_kar98k";
		for "_i" from 1 to 2 do {
			_player addItem "FirstAidKit";
		};
		_player selectWeapon "rhs_weap_kar98k";
	};
};

if (_player == player) then
{
	thirstLevel = 100;
	hungerLevel = 100;
};
