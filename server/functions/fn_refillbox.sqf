// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: fn_refillbox.sqf  "fn_refillbox"
//	@file Author: [404] Pulse , [404] Costlyy , [404] Deadbeat, AgentRev
//	@file Created: 22/1/2012 00:00
//	@file Args: [OBJECT (Weapons box that needs filling), STRING (Name of the fill to give to object)]

if (!isServer) exitWith {};

#define RANDOM_BETWEEN(START,END) ((START) + floor random ((END) - (START) + 1))
#define RANDOM_ODDS(ODDS) ([0,1] select (random 1 < (ODDS))) // between 0.0 and 1.0

private ["_box", "_boxType", "_boxItems", "_item", "_qty", "_mag"];
_box = _this select 0;
_boxType = _this select 1;

_box setVariable [call vChecksum, true];

_box allowDamage false; // No more fucking busted crates
_box setVariable ["allowDamage", false, true];
_box setVariable ["A3W_inventoryLockR3F", true, true];

// Clear pre-existing cargo first
//clearBackpackCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearWeaponCargoGlobal _box;
clearItemCargoGlobal _box;

if (_boxType == "mission_USSpecial2") then { _boxType = "mission_USSpecial" };

switch (_boxType) do
{
	case "mission_USLaunchers":
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			// ["wep", ["Laserdesignator", "Laserdesignator_02", "Laserdesignator_03"], 1, 1],
			["wep", ["rhs_weap_maaws", "weap_rhs_smaw_green", "rhs_weap_fim92"], RANDOM_BETWEEN(2,5), RANDOM_BETWEEN(1,2)],
			["wep", ["rhs_weap_rpg7", "rhs_weap_rpg7", "rhs_weap_igla"], RANDOM_BETWEEN(2,5), RANDOM_BETWEEN(1,2)],
			["wep", "rhs_weap_fgm148", RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(1,2)],
			["mag", ["APERSTripMine_Wire_Mag", "APERSBoundingMine_Range_Mag", "APERSMine_Range_Mag", "ClaymoreDirectionalMine_Remote_Mag"], RANDOM_BETWEEN(2,5)],
			["mag", ["SLAMDirectionalMine_Wire_Mag", "ATMine_Range_Mag", "DemoCharge_Remote_Mag", "SatchelCharge_Remote_Mag"], RANDOM_BETWEEN(2,5)],
			["mag", "HandGrenade", RANDOM_BETWEEN(5,10)],
			["mag", "rhs_VOG25", RANDOM_BETWEEN(5,10)],
			["itm", [["H_HelmetB", "H_HelmetIA"], ["H_HelmetSpecB", "H_HelmetSpecO_ocamo"], "H_HelmetLeaderO_ocamo"], RANDOM_BETWEEN(1,4)],
			["itm", [["V_PlateCarrier1_rgr", "V_PlateCarrier1_blk", "V_PlateCarrierIA1_dgtl"], // Lite
			         ["V_PlateCarrier2_rgr", "V_PlateCarrier2_blk", "V_PlateCarrierIA2_dgtl"], // Rig
			         ["V_PlateCarrierSpec_rgr", "V_PlateCarrierSpec_blk", "V_PlateCarrierSpec_mtp"], // Special
			         ["V_PlateCarrierGL_rgr", "V_PlateCarrierGL_blk", "V_PlateCarrierGL_mtp", "V_PlateCarrierIAGL_dgtl", "V_PlateCarrierIAGL_oli"]] /* GL */, RANDOM_BETWEEN(1,4)]
		];
	};
	case "mission_USSpecial":
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			["itm", "NVGoggles", 3],
			["wep", ["Binocular", "Rangefinder"], RANDOM_BETWEEN(0,3)],
			["itm", "Medikit", RANDOM_BETWEEN(1,3)],
			["itm", "Toolkit", RANDOM_BETWEEN(1,3)],
			["itm", ["rhs_acc_ACOG", "rhs_acc_g33_t1", "rhs_acc_g33_xps3", "rhsusf_acc_compm4", "rhsusf_acc_ACOG2_USMC"], RANDOM_BETWEEN(2,4)],
			["wep", ["rhs_weap_hk416d145_m320", "rhs_weap_hk416d145_d", "rhs_weap_g36kv_ag36", "rhs_weap_g36kv"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(2,4)],
			["wep", ["rhs_weap_m4_m320", "rhs_weap_m4a1_d_mstock", "rhs_weap_m4a1_m203s_wd", "rhs_weap_mk18_KAC_d", "rhs_weap_mk18_m320"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(2,4)],
			["wep", ["rhs_weap_minimi_para_railed", "rhs_weap_m240b", "rhs_weap_m249_pip_L", "rhs_weap_m249_pip_S", "rhs_weap_m27iar"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(2,4)],
			["wep", ["rhs_weap_MP7A2_desert", "rhs_weap_m14ebrri", "rhs_weap_M590_8RD"], RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(4,8)],
			["wep", "arifle_SDAR_F", RANDOM_BETWEEN(0,2), RANDOM_BETWEEN(3,5)],
			["wep", ["rhs_weap_glock17g4", "rhs_weap_m1911a1", "rhs_weap_pb_6p9", "rhs_weap_pya", "rhs_weap_pp200_folded"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(4,8)],
			["mag", "rhs_mag_30Rnd_556x45_Mk318_Stanag", RANDOM_BETWEEN(20,25)],
			["mag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Green", RANDOM_BETWEEN(5,10)],
			["mag", "rhs_200rnd_556x45_M_SAW", RANDOM_BETWEEN(2,4)],
			["mag", "rhsusf_50Rnd_762x51", RANDOM_BETWEEN(2,4)],
			["mag", "rhsusf_40mm_HEDP", RANDOM_BETWEEN(10,10)]
		];
	};
	case "mission_RUSpecial":
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			["itm", "NVGoggles", 3],
			["wep", ["Binocular", "Rangefinder"], RANDOM_BETWEEN(0,3)],
			["itm", "Medikit", RANDOM_BETWEEN(1,3)],
			["itm", "Toolkit", RANDOM_BETWEEN(1,3)],
			["itm", ["rhs_acc_rakursPM", "rhs_acc_pso1m2", "rhs_acc_pso1m21", "rhs_acc_pkas", "rhs_acc_ekp8_02"], RANDOM_BETWEEN(2,4)],
			["wep", ["rhs_weap_ak103_zenitco01_b33", "rhs_weap_ak104_zenitco01", "rhs_weap_ak105_zenitco01_b33", "rhs_weap_ak74m_fullplum_gp25"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(2,4)],
			["wep", ["rhs_weap_asval_grip", "rhs_weap_asval_npz", "rhs_weap_ak74m_desert_npz"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(2,4)],
			["wep", ["rhs_weap_pkm", "rhs_weap_pkp"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(2,4)],
			["wep", ["rhs_weap_svdp_wd", "rhs_weap_svdp_wd_npz"], RANDOM_BETWEEN(0,2), RANDOM_BETWEEN(4,8)],
			["wep", "arifle_SDAR_F", RANDOM_BETWEEN(0,2), RANDOM_BETWEEN(3,5)],
			["wep", ["rhs_weap_glock17g4", "rhs_weap_m1911a1", "rhs_weap_pb_6p9", "rhs_weap_pya", "rhs_weap_pp200_folded"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(4,8)],
			["mag", "rhs_30Rnd_545x39_7N10_AK", RANDOM_BETWEEN(20,25)],
			["mag", "rhs_30Rnd_545x39_AK_green", RANDOM_BETWEEN(5,10)],
			["mag", "rhs_100Rnd_762x54mmR_green", RANDOM_BETWEEN(2,4)],
			["mag", "rhs_100Rnd_762x54mmR_green", RANDOM_BETWEEN(2,4)],
			["mag", "rhs_VOG25", RANDOM_BETWEEN(10,10)]
		];
	};
	case "mission_Main_A3snipers":
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			["wep", "Rangefinder", RANDOM_BETWEEN(1,4)],
			["wep", ["rhs_weap_m14ebrri", "rhs_weap_m24sws_blk", "rhs_weap_svdp", "rhs_weap_svdp_npz"], RANDOM_BETWEEN(1,4), RANDOM_BETWEEN(5,10)],
			["wep", [["rhs_weap_t5000"],
			         ["rhs_weap_m40a5", "rhs_weap_m40a5_d", "rhs_weap_m40a5_wd"],
			         ["rhs_weap_XM2010", "rhs_weap_XM2010_d", "rhs_weap_XM2010_wd"]], RANDOM_BETWEEN(0,3), RANDOM_BETWEEN(5,10)],
			["wep", ["rhs_weap_m82a1", "rhs_weap_M107_d"], RANDOM_BETWEEN(0,1), RANDOM_BETWEEN(5,10)],
			["itm", ["rhs_acc_ACOG_d", "rhs_acc_ACOG_MDO", "rhs_acc_pso1m21"], RANDOM_BETWEEN(2,4)],
			["itm", ["rhsusf_acc_M8541", "rhsusf_acc_premier_low", "rhsusf_acc_premier_low", "rhsusf_acc_M8541", "rhs_acc_dh520x56", "rhs_acc_dh520x56"], RANDOM_BETWEEN(1,3)],
			["itm", "optic_NVS", RANDOM_BETWEEN(0,2)],
			["itm", ["bipod_01_F_blk", "bipod_01_F_mtp", "bipod_01_F_snd", "bipod_02_F_blk", "bipod_02_F_hex", "bipod_02_F_tan", "bipod_03_F_blk", "bipod_03_F_oli"], RANDOM_BETWEEN(1,4)]
		];
	};
};

[_box, _boxItems] call processItems;
