// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2016 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: vehicleSpawnClasses.sqf
//	@file Author: AgentRev

A3W_smallVehicles =
[
	"C_Quadbike_01_F",
	["B_Quadbike_01_F", "O_Quadbike_01_F", "I_Quadbike_01_F", "I_G_Quadbike_01_F"]
];

//Civilian Vehicle List - Random Spawns
civilianVehicles =
[
	"C_Hatchback_01_F",
	"C_Hatchback_01_sport_F",
	"C_SUV_01_F",
	"C_Offroad_01_F",
	["C_Van_01_box_F", "C_Van_01_transport_F"]
];

//Light Military Vehicle List - Random Spawns
lightMilitaryVehicles =
[
	["rhsgref_ins_uaz_dshkm", "rhsgref_ins_uaz_open", "rhsgref_ins_uaz", "rhsgref_uaz_MSV_01", "rhsgref_uaz_open_MSV_01"]
];

//Medium Military Vehicle List - Random Spawns
mediumMilitaryVehicles =
[
	"rhsusf_m998_d",
	"rhsusf_m998_d_2dr",
	"rhsusf_m998_d_2dr_halftop",
	"rhsusf_m998_d_2dr_fulltop",
	"rhsusf_m998_d_4dr",
	"rhsusf_m998_d_4dr_halftop",
	"rhsusf_m998_d_4dr_fulltop",
	"rhsusf_m998_w_s",
	"rhsusf_m998_w_s_2dr",
	"rhsusf_m998_w_s_2dr_halftop",
	"rhsusf_m998_w_s_2dr_fulltop",
	"rhsusf_m998_w_s_4dr",
	"rhsusf_m998_w_s_4dr_halftop",
	"rhsusf_m998_w_s_4dr_fulltop",
	"rhsusf_mrzr4_d",
	"rhsusf_m1025_d",
	"rhsusf_m1025_w_s",
	"rhs_tigr_msv",
	"rhs_tigr_3camo_msv",
	"rhs_tigr_3camo_vv",
	"rhs_tigr_msv",
	"rhs_tigr_3camo_msv",
	"rhs_tigr_3camo_vv"
];

//Water Vehicles - Random Spawns
waterVehicles =
[
	"C_Boat_Civil_01_F",
	"C_Boat_Civil_01_F",
	["C_Boat_Civil_01_police_F", "C_Boat_Civil_01_rescue_F"],
	["B_Boat_Armed_01_minigun_F", "O_Boat_Armed_01_hmg_F", "I_Boat_Armed_01_minigun_F"]
];

//Object List - Random Spawns.
staticWeaponsList =
[
	"B_Mortar_01_F",
	"O_Mortar_01_F",
	"I_Mortar_01_F",
	"I_G_Mortar_01_F"
];

//Object List - Random Helis.
staticHeliList =
[
	"rhsgref_ins_Mi8amt",
	"rhs_Mi8mt_vv",
	"rhs_ka60_c",
	"RHS_UH60M2_d",
	"RHS_MELB_MH6M"
	// don't put cargo helicopters here, it doesn't make sense to find them in towns; they spawn in the CivHeli mission
];

//Object List - Random Planes.
staticPlaneList =
[
	"rhs_mig29s_vmf",
	"rhssaf_airforce_L_18_101"
];

A3W_planeSpawnOdds = 0.25; // 0.0 to 1.0

//Random Weapon List - Change this to what you want to spawn in cars.
vehicleWeapons =
[
	["SMG_01_F" /*Vermin*/, "SMG_02_F" /*Sting*/, "hgun_PDW2000_F"],
	["rhs_weap_ak103", "rhs_weap_ak74", "rhs_weap_ak74_gp25"],
	["rhs_weap_ak74_3", "rhs_weap_ak74_2", "rhs_weap_ak74m"],
	["rhs_weap_ak74m_2mag_camo", "rhs_weap_ak74n", "rhs_weap_akm_zenitco01_b33"],
	["rhs_weap_akm", "rhs_weap_akm_gp25", "rhs_weap_aks74u", "rhs_weap_aks74"],
	["rhs_weap_akmn", "rhs_weap_akms", "rhs_weap_aks74n"],
	["rhs_weap_aks74un", "rhs_weap_g36c", "rhs_weap_hk416d10"],
	["rhs_weap_m16a4", "rhs_weap_m16a4_carryhandle", "rhs_weap_m16a4_carryhandle_M203"],
	["rhs_weap_m4", "rhs_weap_m4_carryhandle", "rhs_weap_m4_m203"],
	["rhs_weap_m4a1", "rhs_weap_m4a1_carryhandle", "rhs_weap_m4a1_m203s_d"],
	["rhs_weap_mk18", "rhs_weap_m21a", "rhs_weap_hk416d145"],
	["rhs_weap_m38", "rhs_weap_kar98k", "rhs_weap_m38", "rhs_weap_kar98k"],
	["rhs_weap_svds", "rhs_weap_pkm", "rhs_weap_m240G", "rhs_weap_M590_5RD"]
];

vehicleAddition =
[
	"rhsusf_acc_T1_high",
	"rhsusf_acc_ACOG2_USMC",
	"rhs_acc_ACOG",
	"rhsusf_acc_EOTECH",
	"rhsusf_acc_eotech_552",
	"rhsusf_acc_compm4",
	"rhsusf_acc_SpecterDR_d",
	"rhsusf_acc_eotech_xps3",
	"rhs_acc_1p63",
	"rhs_acc_1p78",
	"rhs_acc_ekp1",
	"rhs_acc_ekp8_02",
	"rhs_acc_nita",
	"rhs_acc_pkas",
	"rhs_acc_pso1m2",
	"rhs_acc_pso1m21",
	"rhs_acc_rakursPM",
	"rhs_acc_1p87",
	"rhs_acc_dh520x56",
	"rhs_acc_g33_t1",
	"rhs_acc_g33_xps3",
	/* High power optics
	"rhsusf_acc_M8541",
	"rhsusf_acc_premier_low",
	*/
	"acc_pointer_IR",
	"acc_flashlight",
	"Medikit",
	"Medikit",
	"FirstAidKit",
	"ToolKit",
	"rhs_weap_rpg26"
];

vehicleAddition2 =
[
	"Chemlight_blue",
	"Chemlight_green",
	"Chemlight_yellow",
	"Chemlight_red"
];
