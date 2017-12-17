/******************************************************************************************
 * This project is licensed under the GNU Affero GPL v3. Copyright © 2017 MrAnkso         *
 ******************************************************************************************
 * @file Name: server\pve\UnitsTables.sqf
 * @file Author: MrAnkso
 *
 * Stores all unit and vehicle types for random spawning in the world.
 */


/* --- Soldiers --- */
InsurgencyUnitTypes = [
	// Difficulty level 1
	[
		"rhsgref_ins_g_specialist_aa", "rhsgref_ins_g_grenadier_rpg", "rhsgref_ins_g_machinegunner", "rhsgref_ins_g_militiaman_mosin",
		"rhsgref_ins_g_medic", "rhsgref_ins_g_rifleman_akm", "rhsgref_ins_g_rifleman_aks74", "rhsgref_ins_g_rifleman_aksu",
		"rhsgref_ins_g_grenadier", "rhsgref_ins_g_rifleman_RPG26", "rhsgref_ins_g_engineer"
	],
	// Difficulty level 2
	[
		"rhsgref_ins_g_specialist_aa", "rhsgref_ins_g_grenadier_rpg", "rhsgref_ins_g_machinegunner", "rhsgref_ins_g_militiaman_mosin",
		"rhsgref_ins_g_rifleman", "rhsgref_ins_g_saboteur", "rhsgref_ins_g_sniper", "rhsgref_ins_g_spotter"
	],
	// Difficulty level 3
	[
		"rhsgref_ins_g_specialist_aa", "rhsgref_ins_g_grenadier_rpg", "rhsgref_ins_g_machinegunner", "rhsgref_ins_g_militiaman_mosin",
		"rhsgref_ins_g_medic", "rhsgref_ins_g_rifleman_akm", "rhsgref_ins_g_rifleman_aks74", "rhsgref_ins_g_rifleman_aksu",
		"rhsgref_ins_g_grenadier", "rhsgref_ins_g_rifleman_RPG26", "rhsgref_ins_g_engineer",
		"rhsgref_ins_g_rifleman", "rhsgref_ins_g_saboteur", "rhsgref_ins_g_sniper", "rhsgref_ins_g_spotter"
	]
];

OpforUnitTypes = [
	// Difficulty level 1
	[
		"rhs_msv_emr_rifleman", "rhs_msv_emr_grenadier", "rhs_msv_emr_LAT", "rhs_msv_emr_RShG2",
		"rhs_msv_emr_aa", "rhs_msv_emr_at", "rhs_msv_emr_arifleman", "rhs_msv_emr_efreitor",
		"rhs_msv_emr_grenadier", "rhs_msv_emr_machinegunner"
	],
	// Difficulty level 2
	[
		"rhs_msv_emr_rifleman", "rhs_msv_emr_grenadier", "rhs_msv_emr_LAT", "rhs_msv_emr_RShG2",
		"rhs_msv_emr_aa", "rhs_msv_emr_at", "rhs_msv_emr_arifleman", "rhs_msv_emr_efreitor",
		"rhs_msv_emr_grenadier", "rhs_msv_emr_engineer_rpg", "rhs_msv_emr_machinegunner", "rhs_msv_emr_marksman",
		"rhs_msv_emr_medic"
	],
	// Difficulty level 3
	[
		"rhs_vdv_des_aa", "rhs_vdv_des_at", "rhs_vdv_des_arifleman", "rhs_vdv_des_efreitor",
		"rhs_vdv_des_engineer", "rhs_vdv_des_grenadier_rpg", "rhs_vdv_des_junior_sergeant", "rhs_vdv_des_machinegunner",
		"rhs_vdv_des_marksman", "rhs_vdv_des_marksman_asval", "rhs_vdv_des_medic", "rhs_vdv_des_grenadier",
		"rhs_vdv_des_LAT", "rhs_vdv_des_RShG2"
	]
];

BluforUnitTypes = [
	// Difficulty level 1
	[
		"rhsusf_usmc_marpat_d_rifleman", "rhsusf_usmc_marpat_d_rifleman_law", "rhsusf_usmc_marpat_d_rifleman_m4",
		"rhsusf_usmc_marpat_d_rifleman_light", "rhsusf_usmc_marpat_d_stinger", "rhsusf_usmc_marpat_d_grenadier"
	],
	// Difficulty level 2
	[
		"rhsusf_usmc_marpat_d_rifleman", "rhsusf_usmc_marpat_d_rifleman_law", "rhsusf_usmc_marpat_d_riflemanat", "rhsusf_usmc_marpat_d_rifleman_m4",
		"rhsusf_usmc_marpat_d_rifleman_light", "rhsusf_usmc_marpat_d_smaw", "rhsusf_usmc_marpat_d_stinger", "rhsusf_usmc_marpat_d_machinegunner",
		"rhsusf_usmc_marpat_d_grenadier", "rhsusf_usmc_marpat_d_marksman", "rhsusf_usmc_marpat_d_engineer"
	],
	// Difficulty level 3
	[
		"rhsusf_army_ocp_aa", "rhsusf_army_ocp_rifleman_1stcav", "rhsusf_army_ocp_rifleman_10th", "rhsusf_army_ocp_marksman",
		"rhsusf_army_ocp_machinegunner", "rhsusf_army_ocp_grenadier", "rhsusf_army_ocp_fso", "rhsusf_army_ocp_medic",
		"rhsusf_army_ocp_maaws", "rhsusf_army_ocp_riflemanat", "rhsusf_army_ocp_rifleman_m590", "rhsusf_army_ocp_autorifleman",
		"rhsusf_army_ocp_engineer", "rhsusf_army_ocp_explosives", "rhsusf_army_ocp_sniper"
	]
];

/* --- Officers --- */

InsurgencyOfficerTypes = ["rhsgref_ins_g_squadleader"];
OpforOfficerTypes = ["rhs_vdv_des_sergeant", "rhs_msv_emr_officer_armored"];
BluforOfficerTypes = ["rhsusf_army_ocp_teamleader", "rhsusf_army_ocp_officer", "rhsusf_army_ocp_squadleader"];

/* --- Vehicles --- */

InsurgencyVehicleTypes = [
	// Difficulty level 1
	["rhsgref_ins_g_uaz", "rhsgref_ins_g_uaz_dshkm_chdkz"],
	// Difficulty level 2
	["rhsgref_ins_g_uaz", "rhsgref_ins_g_uaz_dshkm_chdkz"],
	// Difficulty level 3
	["rhsgref_ins_g_uaz", "rhsgref_ins_g_uaz_dshkm_chdkz"]
];

OpforVehicleTypes = [
	// Difficulty level 1
	["rhs_tigr_msv", "rhs_tigr_m_msv"],
	// Difficulty level 2
	["rhs_tigr_m_msv", "rhs_tigr_sts_msv"],
	// Difficulty level 3
	["rhs_tigr_sts_msv", "rhs_tigr_m_msv"]
];

BluforVehicleTypes = [
	// Difficulty level 1
	["rhsusf_m998_d_2dr_fulltop", "rhsusf_m1025_d"],
	// Difficulty level 2
	["rhsusf_m1025_d", "rhsusf_m1025_d_m2"],
	// Difficulty level 3
	["rhsusf_M1232_usarmy_wd", "rhsusf_M1220_M2_usarmy_wd"]
];
