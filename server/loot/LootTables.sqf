/******************************************************************************************
 * This project is licensed under the GNU Affero GPL v3. Copyright © 2017 MrAnkso         *
 ******************************************************************************************
 * @file Name: server\loot\LootTables.sqf
 * @file Author: MrAnkso
 *
 * Stores all loot probabilities for each faction/class.
 * Loot is divided in multiple categories using the unit's rank system:
 *   - Private: Low difficulty soldiers loot, no drop of rare weapons.
 *   - Corporal: Medium/high difficulty soldiers loot, low drop of rare weapons.
 *   - Sergeant: Low difficulty officers loot, low drop of rare weapons.
 *   - Liutenant: Medium/high difficulty officers loot, normal drop of rare weapons.
 *   - Captain: Low difficulty complex leader, high drop of rare weapons, low drop of very rare weapons.
 *   - Major: Medium difficulty complex leader, high drop of rare weapons, normal drop of very rare weapons.
 *   - Colonel: High difficulty complex leader, high drop of rare weapons, high drop of very rare weapons.
 *
 * Loot chances are relative to 1, so 1 = 100% chance, 0.57 = 57% chance, and so on.
 */

// Insurgency loot tables:
// [WeaponClass, ChanceOfDrop]
InsurgencyLootTable = [
	// ------------ Private ------------
	[
		[
			// Main weapons
			["rhs_weap_akm", 0.50],
			["rhs_weap_akms", 0.40],
			["rhs_weap_ak74", 0.50],
			["rhs_weap_aks74", 0.40],
			["rhs_weap_aks74n", 0.18],
			["rhs_weap_aks74u", 0.35],
			["rhs_weap_ak74n", 0.20],
			["rhs_weap_ak74_gp25", 0.18],
			["rhs_weap_ak74n_gp25", 0.14],
			["rhs_weap_akm_gp25", 0.18],
			["rhs_weap_aks74n_gp25", 0.13],
			["rhs_weap_kar98k", 0.25],
			["rhs_weap_m38", 0.25],
			["rhs_weap_pkm", 0.05],
			["rhs_weap_m76", 0.04]
		], [
			// Secondary weapons
			["rhs_weap_makarov_pm", 0.25]
		], [
			// Ammo
			["rhs_30Rnd_545x39_AK", 0.50],
			["rhs_30Rnd_545x39_AK_no_tracers", 0.33],
			["rhs_30Rnd_545x39_7N10_AK", 0.20],
			["rhs_30Rnd_545x39_7N22_AK", 0.15],
			["rhs_30Rnd_545x39_AK_green", 0.33],
			["rhs_30Rnd_545x39_7U1_AK", 0.14],
			["rhs_30Rnd_762x39mm", 0.50],
			["rhs_30Rnd_762x39mm_tracer", 0.33],
			["rhs_30Rnd_762x39mm_89", 0.20],
			["rhs_30Rnd_762x39mm_U", 0.18],
			["rhs_10Rnd_762x54mmR_7N1", 0.14],
			["rhs_100Rnd_762x54mmR", 0.10],
			["rhs_100Rnd_762x54mmR_green", 0.08],
			["rhs_100Rnd_762x54mmR_7N13", 0.05],
			["rhs_100Rnd_762x54mmR_7N26", 0.04],
			["rhs_100Rnd_762x54mmR_7BZ3", 0.03],
			["rhsgref_5Rnd_792x57_kar98k", 0.33],
			["rhsgref_5Rnd_762x54_m38", 0.33],
			["rhsgref_10Rnd_792x57_m76", 0.15],
			["rhs_VOG25", 0.12],
			["rhs_VOG25p", 0.1],
			["rhs_vg40tb", 0.05],
			["rhs_vg40sz", 0.05],
			["rhs_vg40op_white", 0.05],
			["rhs_vg40op_green", 0.05],
			["rhs_vg40op_red", 0.05],
			["rhs_GRD40_white", 0.05],
			["rhs_GRD40_green", 0.05],
			["rhs_GRD40_red", 0.05],
			["rhs_VG40MD_White", 0.05],
			["rhs_VG40MD_Green", 0.05],
			["rhs_VG40MD_Red", 0.05],
			["rhs_GDM40", 0.05],
			["rhs_mag_9x18_8_57N181S", 0.20],
			["rhs_mag_9x18_12_57N181S", 0.15]
		], [
			// Launchers
			["rhs_weap_rpg26", 0.08]
		], [
			// Launcher ammo
			[]
		],[
			// Weapon accessories
			["rhs_acc_2dpZenit", ],
			["rhs_acc_1p63", ],
			["rhs_acc_ekp1", ],
			["rhs_acc_ekp8_02", ],
			["rhs_acc_ekp8_02_pkas", ],
			["rhs_acc_pso1m2", ],
			["rhs_acc_dtkakm", ],
			["rhs_acc_ukk", ],
			["rhs_acc_ak5", ],
			["rhs_acc_dtk", ],
			["rhs_acc_dtk1", ],
			["rhs_acc_dtk2", ],
			["rhs_acc_dtk3", ],
			//["rhs_acc_dtk4short", ],
			["rhs_acc_dtk1983", ]
		], [
			["rhs_mag_rgd5", 0.21],        // RGD-5
			["rhs_mag_rdg2_white", 0.15],  // RGD-2 (white smoke)
			["rhs_mag_rdg2_black", 0.15],  // RGD-2 (black smoke)
			["rhs_mag_nspn_yellow", 0.20], // NSP-N (yellow flare)
			["rhs_mag_nspn_red", 0.20],    // NSP-N (red flare)
			["rhs_mag_nspn_green", 0.20],  // NSP-N (green flare)
			["rhs_mag_nspd", 0.20],        // NSP-D (red flare)
			["rhs_mag_fakel", 0.02],       // Fakel
			["rhs_mag_fakels", 0.02],      // Fakel-S
			["rhs_mag_zarya2", 0.03],      // Zarya-2
			["rhs_mag_plamyam", 0.02],     // Plamya-M
			["rhs_mine_pmn2", 0.01],       // PMN-2 AP
			["rhs_mine_tm62m", 0.01]       // TM-62M AT
		], [
			// Items
			["Binocular", 0.24],
			["FirstAidKit", 0.33],
			["Medikit", 0.11],
			["ToolKit", 0.09]
		]
	],
	// ------------ Corporal ------------
	[
		[
			// Main weapons
			["rhs_weap_ak103", 0.50],
			["rhs_weap_ak74m_fullplum", 0.40],
			["rhs_weap_m21s", 0.51],
			["rhs_weap_m21a", 0.44],
			["rhs_weap_aks74n", 0.18],
			["rhs_weap_m21a_pr", 0.22],
			["rhs_weap_ak74n", 0.20],
			["rhs_weap_ak74_gp25", 0.18],
			["rhs_weap_ak74n_gp25", 0.14],
			["rhs_weap_akm_gp25", 0.18],
			["rhs_weap_aks74n_gp25", 0.13],
			["rhs_weap_m240G", 0.05],
			["rhs_weap_m70ab2", 0.49],
			["rhs_weap_m70b1", 0.50],
			["rhs_weap_m92", 0.43],
			["rhs_weap_svds", 0.05],
			["rhs_weap_kar98k", 0.25],
			["rhs_weap_m38", 0.25],
			["rhs_weap_pkm", 0.09],
			["rhs_weap_m76", 0.08]
		], [
			// Secondary weapons
			["rhs_weap_makarov_pm", 0.33]
		], [
			// Ammo
			["rhs_30Rnd_545x39_AK", 0.50],
			["rhs_30Rnd_545x39_AK_no_tracers", 0.33],
			["rhs_30Rnd_545x39_7N10_AK", 0.20],
			["rhs_30Rnd_545x39_7N22_AK", 0.15],
			["rhs_30Rnd_545x39_AK_green", 0.33],
			["rhs_30Rnd_545x39_7U1_AK", 0.14],
			["rhs_30Rnd_762x39mm", 0.50],
			["rhs_30Rnd_762x39mm_tracer", 0.33],
			["rhs_30Rnd_762x39mm_89", 0.20],
			["rhs_30Rnd_762x39mm_U", 0.18],
			["rhs_10Rnd_762x54mmR_7N1", 0.14],
			["rhs_100Rnd_762x54mmR", 0.10],
			["rhs_100Rnd_762x54mmR_green", 0.08],
			["rhs_100Rnd_762x54mmR_7N13", 0.05],
			["rhs_100Rnd_762x54mmR_7N26", 0.04],
			["rhs_100Rnd_762x54mmR_7BZ3", 0.03],
			["rhsgref_5Rnd_792x57_kar98k", 0.33],
			["rhsgref_5Rnd_762x54_m38", 0.33],
			["rhsgref_10Rnd_792x57_m76", 0.15],
			["rhs_VOG25", 0.18],
			["rhs_VOG25p", 0.14],
			["rhs_vg40tb", 0.05],
			["rhs_vg40sz", 0.05],
			["rhs_vg40op_white", 0.05],
			["rhs_vg40op_green", 0.05],
			["rhs_vg40op_red", 0.05],
			["rhs_GRD40_white", 0.05],
			["rhs_GRD40_green", 0.05],
			["rhs_GRD40_red", 0.05],
			["rhs_VG40MD_White", 0.05],
			["rhs_VG40MD_Green", 0.05],
			["rhs_VG40MD_Red", 0.05],
			["rhs_GDM40", 0.05],
			["rhs_mag_9x18_8_57N181S", 0.20],
			["rhs_mag_9x18_12_57N181S", 0.15]
		], [
			// Launchers
			["rhs_weap_rpg26", 0.12],
			["rhs_weap_rpg7", 0.03],
			["rhs_weap_igla", 0.02]
		], [
			// Launcher ammo
			["rhs_rpg7_PG7VL_mag", 0.07],
			["rhs_mag_9k32_rocket", 0.06]
		],[
			// Weapon accessories
			["rhs_acc_2dpZenit", 0.15],
			["rhs_acc_1p63", 0.08],
			["rhs_acc_ekp1", 0.16],
			["rhs_acc_ekp8_02", 0.16],
			["rhs_acc_ekp8_02_pkas", 0.05],
			["rhs_acc_pso1m2", 0.03],
			["rhs_acc_pso1m2", 0.02],
			["rhs_acc_dtkakm", 0.33],
			["rhs_acc_ukk", 0.33],
			["rhs_acc_ak5", 0.33],
			["rhs_acc_dtk", 0.33],
			["rhs_acc_dtk1", 0.33],
			["rhs_acc_dtk2", 0.33],
			["rhs_acc_dtk3", 0.33],
			["rhs_acc_dtk4short", 0.03],
			["rhs_acc_dtk1983", 0.33]
		], [
			["rhs_mag_rgd5", 0.25],        // RGD-5     
			["rhs_mag_rdg2_white", 0.15],  // RGD-2 (white smoke)     
			["rhs_mag_rdg2_black", 0.15],  // RGD-2 (black smoke)     
			["rhs_mag_nspn_yellow", 0.20], // NSP-N (yellow flare)     
			["rhs_mag_nspn_red", 0.20],    // NSP-N (red flare)     
			["rhs_mag_nspn_green", 0.20],  // NSP-N (green flare)     
			["rhs_mag_nspd", 0.20],        // NSP-D (red flare)     
			["rhs_mag_fakel", 0.03],       // Fakel
			["rhs_mag_fakels", 0.03],      // Fakel-S
			["rhs_mag_zarya2", 0.03],      // Zarya-2
			["rhs_mag_plamyam", 0.02],     // Plamya-M
			["rhs_mine_pmn2", 0.01],       // PMN-2 AP
			["rhs_mine_tm62m", 0.01]       // TM-62M AT
		], [
			// Items
			["Binocular", 0.34],
			["FirstAidKit", 0.33],
			["Medikit", 0.21],
			["ToolKit", 0.19]
		]
	],
	// ------------ Sergeant ------------
	[
		[
			// Main weapons
			["rhs_weap_ak103", 0.55],
			["rhs_weap_ak74m_fullplum", 0.60],
			["rhs_weap_m21s", 0.50],
			["rhs_weap_m21a", 0.50],
			["rhs_weap_aks74n", 0.66],
			["rhs_weap_m21a_pr", 0.33],
			["rhs_weap_ak74n", 0.66],
			["rhs_weap_ak74n_gp25", 0.33],
			["rhs_weap_aks74n_gp25", 0.33],
			["rhs_weap_m240G", 0.10],
			["rhs_weap_m70ab2", 0.49],
			["rhs_weap_m70b1", 0.50],
			["rhs_weap_m92", 0.43],
			["rhs_weap_svds", 0.10],
			["rhs_weap_kar98k", 0.25],
			["rhs_weap_m38", 0.25],
			["rhs_weap_pkm", 0.18],
			["rhs_weap_m76", 0.16]
		], [
			// Secondary weapons
			["rhs_weap_makarov_pm", 0.80]
		], [
			// Ammo
			["rhs_30Rnd_545x39_AK", 0.80],
			["rhs_30Rnd_545x39_AK_no_tracers", 0.66],
			["rhs_30Rnd_545x39_7N10_AK", 0.40],
			["rhs_30Rnd_545x39_7N22_AK", 0.30],
			["rhs_30Rnd_545x39_AK_green", 0.66],
			["rhs_30Rnd_545x39_7U1_AK", 0.28],
			["rhs_30Rnd_762x39mm", 0.80],
			["rhs_30Rnd_762x39mm_tracer", 0.66],
			["rhs_30Rnd_762x39mm_89", 0.40],
			["rhs_30Rnd_762x39mm_U", 0.36],
			["rhs_10Rnd_762x54mmR_7N1", 0.28],
			["rhs_100Rnd_762x54mmR", 0.20],
			["rhs_100Rnd_762x54mmR_green", 0.16],
			["rhs_100Rnd_762x54mmR_7N13", 0.10],
			["rhs_100Rnd_762x54mmR_7N26", 0.08],
			["rhs_100Rnd_762x54mmR_7BZ3", 0.06],
			["rhsgref_5Rnd_792x57_kar98k", 0.66],
			["rhsgref_5Rnd_762x54_m38", 0.66],
			["rhsgref_10Rnd_792x57_m76", 0.30],
			["rhs_VOG25", 0.33],
			["rhs_VOG25p", 0.25],
			["rhs_vg40tb", 0.05],
			["rhs_vg40sz", 0.05],
			["rhs_vg40op_white", 0.05],
			["rhs_vg40op_green", 0.05],
			["rhs_vg40op_red", 0.05],
			["rhs_GRD40_white", 0.05],
			["rhs_GRD40_green", 0.05],
			["rhs_GRD40_red", 0.05],
			["rhs_VG40MD_White", 0.05],
			["rhs_VG40MD_Green", 0.05],
			["rhs_VG40MD_Red", 0.05],
			["rhs_GDM40", 0.05],
			["rhs_mag_9x18_8_57N181S", 0.40],
			["rhs_mag_9x18_12_57N181S", 0.30]
		], [
			// Launchers
			["rhs_weap_rpg26", 0.16],
			["rhs_weap_rpg7", 0.06],
			["rhs_weap_igla", 0.04]
		], [
			// Launcher ammo
			["rhs_rpg7_PG7VL_mag", 0.09],
			["rhs_mag_9k32_rocket", 0.08]
		],[
			// Weapon accessories
			["rhs_acc_2dpZenit", 0.21],
			["rhs_acc_1p63", 0.20],
			["rhs_acc_ekp1", 0.18],
			["rhs_acc_ekp8_02", 0.18],
			["rhs_acc_ekp8_02_pkas", 0.17],
			["rhs_acc_pso1m2", 0.15],
			["rhs_acc_pso1m2", 0.16],
			["rhs_acc_dtkakm", 0.33],
			["rhs_acc_ukk", 0.33],
			["rhs_acc_ak5", 0.33],
			["rhs_acc_dtk", 0.33],
			["rhs_acc_dtk1", 0.33],
			["rhs_acc_dtk2", 0.33],
			["rhs_acc_dtk3", 0.33],
			["rhs_acc_dtk4short", 0.11],
			["rhs_acc_dtk1983", 0.33]
		], [
			["rhs_mag_rgd5", 0.43],        // RGD-5
			["rhs_mag_rdg2_white", 0.15],  // RGD-2 (white smoke)
			["rhs_mag_rdg2_black", 0.15],  // RGD-2 (black smoke)
			["rhs_mag_nspn_yellow", 0.20], // NSP-N (yellow flare)
			["rhs_mag_nspn_red", 0.20],    // NSP-N (red flare)
			["rhs_mag_nspn_green", 0.20],  // NSP-N (green flare)
			["rhs_mag_nspd", 0.20],        // NSP-D (red flare)
			["rhs_mag_fakel", 0.03],       // Fakel
			["rhs_mag_fakels", 0.03],      // Fakel-S
			["rhs_mag_zarya2", 0.03],      // Zarya-2
			["rhs_mag_plamyam", 0.02],     // Plamya-M
			["rhs_mine_pmn2", 0.01],       // PMN-2 AP
			["rhs_mine_tm62m", 0.01]       // TM-62M AT
		], [
			// Items
			["Binocular", 0.80],
			["FirstAidKit", 0.63],
			["Medikit", 0.41],
			["ToolKit", 0.39]
		]
	],
	// ------------ Liutenant ------------
	[
		[
			// Main weapons
			["rhs_weap_ak103", 0.55],
			["rhs_weap_m21a_pr", 0.33],
			["rhs_weap_m240G", 0.20],
			["rhs_weap_svds", 0.20],
			["rhs_weap_pkm", 0.38],
			["rhs_weap_m76", 0.36]
		], [
			// Secondary weapons
			["rhs_weap_makarov_pm", 1.00]
		], [
			// Ammo
			["rhs_30Rnd_545x39_7N10_AK", 0.40],
			["rhs_30Rnd_545x39_7N22_AK", 0.30],
			["rhs_30Rnd_545x39_7U1_AK", 0.28],
			["rhs_30Rnd_762x39mm_89", 0.40],
			["rhs_30Rnd_762x39mm_U", 0.36],
			["rhs_10Rnd_762x54mmR_7N1", 0.28],
			["rhs_100Rnd_762x54mmR_7N13", 0.10],
			["rhs_100Rnd_762x54mmR_7N26", 0.08],
			["rhs_100Rnd_762x54mmR_7BZ3", 0.06],
			["rhsgref_5Rnd_792x57_kar98k", 0.66],
			["rhsgref_5Rnd_762x54_m38", 0.66],
			["rhsgref_10Rnd_792x57_m76", 0.30],
			["rhs_VOG25", 0.63],
			["rhs_VOG25p", 0.55],
			["rhs_mag_9x18_8_57N181S", 0.40],
			["rhs_mag_9x18_12_57N181S", 0.30]
		], [
			// Launchers
			["rhs_weap_rpg26", 0.56],
			["rhs_weap_rpg7", 0.26],
			["rhs_weap_igla", 0.24]
		], [
			// Launcher ammo
			["rhs_rpg7_PG7VL_mag", 0.59],
			["rhs_mag_9k32_rocket", 0.58]
		],[
			// Weapon accessories
			["rhs_acc_2dpZenit", 0.31],
			["rhs_acc_1p63", 0.30],
			["rhs_acc_ekp1", 0.28],
			["rhs_acc_ekp8_02", 0.28],
			["rhs_acc_ekp8_02_pkas", 0.27],
			["rhs_acc_pso1m2", 0.19],
			["rhs_acc_pso1m2", 0.18]
		], [
			["rhs_mag_rgd5", 0.83],        // RGD-5
			["rhs_mag_fakel", 0.23],       // Fakel
			["rhs_mag_fakels", 0.23],      // Fakel-S
			["rhs_mag_zarya2", 0.06],      // Zarya-2
			["rhs_mag_plamyam", 0.04],     // Plamya-M
			["rhs_mine_pmn2", 0.02],       // PMN-2 AP
			["rhs_mine_tm62m", 0.02]       // TM-62M AT
		], [
			// Items
			["Binocular", 0.80],
			["FirstAidKit", 0.63],
			["Medikit", 0.41],
			["ToolKit", 0.39]
		]
	],
	// ------------ Captain ------------
	[
		[
			// Main weapons
			["rhs_weap_m240G", 0.40],
			["rhs_weap_svds", 0.40],
			["rhs_weap_pkm", 0.58],
			["rhs_weap_m76", 0.56]
		], [
			// Secondary weapons
			["rhs_weap_makarov_pm", 1.00]
		], [
			// Ammo
			["rhs_30Rnd_545x39_7N10_AK", 0.40],
			["rhs_30Rnd_545x39_7N22_AK", 0.30],
			["rhs_30Rnd_545x39_7U1_AK", 0.28],
			["rhs_30Rnd_762x39mm_89", 0.40],
			["rhs_30Rnd_762x39mm_U", 0.36],
			["rhs_10Rnd_762x54mmR_7N1", 0.28],
			["rhs_100Rnd_762x54mmR_7N13", 0.10],
			["rhs_100Rnd_762x54mmR_7N26", 0.08],
			["rhs_100Rnd_762x54mmR_7BZ3", 0.06],
			["rhsgref_5Rnd_792x57_kar98k", 0.66],
			["rhsgref_5Rnd_762x54_m38", 0.66],
			["rhsgref_10Rnd_792x57_m76", 0.30],
			["rhs_VOG25", 0.63],
			["rhs_VOG25p", 0.55],
			["rhs_mag_9x18_8_57N181S", 0.40],
			["rhs_mag_9x18_12_57N181S", 0.30]
		], [
			// Launchers
			["rhs_weap_rpg26", 0.66],
			["rhs_weap_rpg7", 0.36],
			["rhs_weap_igla", 0.34]
		], [
			// Launcher ammo
			["rhs_rpg7_PG7VL_mag", 0.69],
			["rhs_mag_9k32_rocket", 0.68],
			["rhs_rpg7_PG7VR_mag", 0.33],
			["rhs_rpg7_OG7V_mag", 0.25],
			["rhs_rpg7_TBG7V_mag", 0.22],
			["rhs_mag_9k38_rocket", 0.20]
		],[
			// Weapon accessories
			["rhs_acc_2dpZenit", 0.41],
			["rhs_acc_1p63", 0.50],
			["rhs_acc_ekp1", 0.38],
			["rhs_acc_ekp8_02", 0.38],
			["rhs_acc_ekp8_02_pkas", 0.37],
			["rhs_acc_pso1m2", 0.25],
			["rhs_acc_pso1m2", 0.26]
		], [
			["rhs_mag_rgd5", 0.83],        // RGD-5
			["rhs_mag_fakel", 0.23],       // Fakel
			["rhs_mag_fakels", 0.23],      // Fakel-S
			["rhs_mag_zarya2", 0.06],      // Zarya-2
			["rhs_mag_plamyam", 0.04],     // Plamya-M
			["rhs_mine_pmn2", 0.02],       // PMN-2 AP
			["rhs_mine_tm62m", 0.02]       // TM-62M AT
		], [
			// Items
			["Binocular", 0.80],
			["FirstAidKit", 0.63],
			["Medikit", 0.41],
			["ToolKit", 0.39]
		]
	],
	// ------------ Major ------------
	[
		[
			// Main weapons
			["rhs_weap_m240G", 0.50],
			["rhs_weap_svds", 0.50],
			["rhs_weap_pkm", 0.68],
			["rhs_weap_m76", 0.66]
		], [
			// Secondary weapons
			["rhs_weap_makarov_pm", 1.00]
		], [
			// Ammo
			["rhs_30Rnd_545x39_7N10_AK", 0.40],
			["rhs_30Rnd_545x39_7N22_AK", 0.30],
			["rhs_30Rnd_545x39_7U1_AK", 0.28],
			["rhs_30Rnd_762x39mm_89", 0.40],
			["rhs_30Rnd_762x39mm_U", 0.36],
			["rhs_10Rnd_762x54mmR_7N1", 0.28],
			["rhs_100Rnd_762x54mmR_7N13", 0.10],
			["rhs_100Rnd_762x54mmR_7N26", 0.08],
			["rhs_100Rnd_762x54mmR_7BZ3", 0.06],
			["rhsgref_5Rnd_792x57_kar98k", 0.66],
			["rhsgref_5Rnd_762x54_m38", 0.66],
			["rhsgref_10Rnd_792x57_m76", 0.30],
			["rhs_VOG25", 0.73],
			["rhs_VOG25p", 0.65],
			["rhs_mag_9x18_8_57N181S", 0.40],
			["rhs_mag_9x18_12_57N181S", 0.30]
		], [
			// Launchers
			["rhs_weap_rpg26", 0.96],
			["rhs_weap_rpg7", 0.76],
			["rhs_weap_igla", 0.64]
		], [
			// Launcher ammo
			["rhs_rpg7_PG7VL_mag", 0.79],
			["rhs_mag_9k32_rocket", 0.78],
			["rhs_rpg7_PG7VR_mag", 0.43],
			["rhs_rpg7_OG7V_mag", 0.35],
			["rhs_rpg7_TBG7V_mag", 0.32],
			["rhs_mag_9k38_rocket", 0.30]
		],[
			// Weapon accessories
			["rhs_acc_2dpZenit", 0.51],
			["rhs_acc_1p63", 0.60],
			["rhs_acc_ekp1", 0.48],
			["rhs_acc_ekp8_02", 0.48],
			["rhs_acc_ekp8_02_pkas", 0.47],
			["rhs_acc_pso1m2", 0.35],
			["rhs_acc_pso1m2", 0.36]
		], [
			["rhs_mag_rgd5", 0.83],        // RGD-5
			["rhs_mag_fakel", 0.23],       // Fakel
			["rhs_mag_fakels", 0.23],      // Fakel-S
			["rhs_mag_zarya2", 0.06],      // Zarya-2
			["rhs_mag_plamyam", 0.04],     // Plamya-M
			["rhs_mine_pmn2", 0.02],       // PMN-2 AP
			["rhs_mine_tm62m", 0.02]       // TM-62M AT
		], [
			// Items
			["Binocular", 0.80],
			["FirstAidKit", 0.63],
			["Medikit", 0.41],
			["ToolKit", 0.39]
		]
	],
	// ------------ Colonel (No Insurgency colonels) ------------
	[
	]
];

OpforLootTable = [
	// ------------ Private ------------
	[
		[
			// Main weapons
			["rhs_weap_ak103", 0.50],
			["rhs_weap_ak103_1", 0.50],
			["rhs_weap_ak103_2", 0.50],
			["rhs_weap_ak104", 0.50],
			["rhs_weap_ak105", 0.50],
			["rhs_weap_ak74_3", 0.50],
			["rhs_weap_ak74m", 0.50],
			["rhs_weap_ak74m_2mag_camo", 0.50],
			["rhs_weap_ak74m_desert", 0.50],
			["rhs_weap_aks74n_npz", 0.45],
			["rhs_weap_aks74un", 0.45],
			["rhs_weap_pm63", 0.45],
			["rhs_weap_akm_zenitco01_b33", 0.40],
			["rhs_weap_ak103_zenitco01_b33", 0.40],
			["rhs_weap_ak104_zenitco01_b33", 0.40],
			["rhs_weap_ak105_zenitco01_b33", 0.40],
			["rhs_weap_ak74m_2mag_npz", 0.40],
			["rhs_weap_ak74m_zenitco01_b33", 0.40],
			["rhs_weap_akmn_gp25", 0.35],
			["rhs_weap_ak74m_fullplum_gp25_npz", 0.35],
			["rhs_weap_ak103_gp25_npz", 0.35],
			["rhs_weap_ak103_gp25", 0.35],
			["rhs_weap_pkm", 0.10],
			["rhs_weap_svds", 0.08],
			["rhs_weap_asval", 0.05]
		], [
			// Secondary weapons
			["rhs_weap_pya", 0.23],
			["rhs_weap_pp2000", 0.09]
		], [
			// Ammo
			["rhs_30Rnd_545x39_AK", 0.50],
			["rhs_30Rnd_545x39_AK_no_tracers", 0.33],
			["rhs_30Rnd_545x39_7N10_AK", 0.20],
			["rhs_30Rnd_545x39_7N22_AK", 0.15],
			["rhs_30Rnd_545x39_AK_green", 0.33],
			["rhs_30Rnd_545x39_7U1_AK", 0.14],
			["rhs_30Rnd_762x39mm", 0.50],
			["rhs_30Rnd_762x39mm_tracer", 0.33],
			["rhs_30Rnd_762x39mm_89", 0.20],
			["rhs_30Rnd_762x39mm_U", 0.18],
			["rhs_10Rnd_762x54mmR_7N1", 0.14],
			["rhs_100Rnd_762x54mmR", 0.14],
			["rhs_100Rnd_762x54mmR_green", 0.10],
			["rhs_100Rnd_762x54mmR_7N13", 0.06],
			["rhs_100Rnd_762x54mmR_7N26", 0.05],
			["rhs_100Rnd_762x54mmR_7BZ3", 0.04],
			["rhs_10Rnd_762x54mmR_7N1", 0.15],
			["rhs_20rnd_9x39mm_SP5", 0.13],
            ["rhs_20rnd_9x39mm_SP6", 0.11],
			["rhs_VOG25", 0.22],
			["rhs_VOG25p", 0.15],
			["rhs_vg40tb", 0.05],
			["rhs_vg40sz", 0.05],
			["rhs_vg40op_white", 0.05],
			["rhs_vg40op_green", 0.05],
			["rhs_vg40op_red", 0.05],
			["rhs_GRD40_white", 0.05],
			["rhs_GRD40_green", 0.05],
			["rhs_GRD40_red", 0.05],
			["rhs_VG40MD_White", 0.05],
			["rhs_VG40MD_Green", 0.05],
			["rhs_VG40MD_Red", 0.05],
			["rhs_GDM40", 0.05],
			["rhs_mag_9x19mm_7n21_20", 0.20],
			["rhs_mag_9x19mm_7n31_20", 0.10],
			["rhs_mag_9x19mm_7n21_44", 0.10],
			["rhs_mag_9x19mm_7n31_44", 0.10],
			["rhs_mag_9x18_12_57N181S", 0.15]
			["rhs_mag_9x19_17", 0.25]
		], [
			// Launchers
			["rhs_weap_rpg26", 0.20],
			["rhs_weap_rpg7", 0.15],
			["rhs_weap_igla", 0.13]
		], [
			// Launcher ammo
			["rhs_rpg7_PG7VL_mag", 0.17],
			["rhs_mag_9k32_rocket", 0.16],
			["rhs_rpg7_PG7VR_mag", 0.13],
			["rhs_rpg7_OG7V_mag", 0.05],
			["rhs_rpg7_TBG7V_mag", 0.02],
			["rhs_mag_9k38_rocket", 0.01]
		],[
			// Weapon accessories
			["rhs_acc_2dpZenit", 0.13],
			["rhs_acc_1p63", 0.14],
			["rhs_acc_ekp1", 0.13],
			["rhs_acc_ekp8_02", 0.13],
			["rhs_acc_ekp8_02_pkas", 0.10],
			["rhs_acc_pso1m2", 0.09],
			["rhs_acc_rakursPM", 0.11],
			["rhs_acc_1p87", 0.13],
			["rhs_acc_ekp8_18", 0.14],
			["rhsusf_acc_compm4", 0.14],
			["rhs_acc_dtkakm", 0.22],
			["rhs_acc_ukk", 0.22],
			["rhs_acc_ak5", 0.22],
			["rhs_acc_dtk", 0.22],
			["rhs_acc_dtk1", 0.22],
			["rhs_acc_dtk2", 0.22],
			["rhs_acc_dtk3", 0.22],
			["rhs_acc_dtk4short", 0.03],
			["rhs_acc_dtk1983", 0.22]
		], [
			["rhs_mag_rgd5", 0.31],        // RGD-5
			["rhs_mag_rdg2_white", 0.15],  // RGD-2 (white smoke)
			["rhs_mag_rdg2_black", 0.15],  // RGD-2 (black smoke)
			["rhs_mag_nspn_yellow", 0.20], // NSP-N (yellow flare)
			["rhs_mag_nspn_red", 0.20],    // NSP-N (red flare)
			["rhs_mag_nspn_green", 0.20],  // NSP-N (green flare)
			["rhs_mag_nspd", 0.20],        // NSP-D (red flare)
			["rhs_mag_fakel", 0.02],       // Fakel
			["rhs_mag_fakels", 0.02],      // Fakel-S
			["rhs_mag_zarya2", 0.03],      // Zarya-2
			["rhs_mag_plamyam", 0.02],     // Plamya-M
			["rhs_mine_pmn2", 0.01],       // PMN-2 AP
			["rhs_mine_tm62m", 0.01]       // TM-62M AT
		], [
			// Items
			["Binocular", 0.54],
			["FirstAidKit", 0.43],
			["Medikit", 0.21],
			["ToolKit", 0.19]
		]
	],
	// ------------ Corporal ------------
	[
		[
			// Main weapons
			["rhs_weap_ak103", 0.50],
			["rhs_weap_ak103_1", 0.50],
			["rhs_weap_ak103_2", 0.50],
			["rhs_weap_ak104", 0.50],
			["rhs_weap_ak105", 0.50],
			["rhs_weap_ak74_3", 0.50],
			["rhs_weap_ak74m", 0.50],
			["rhs_weap_ak74m_2mag_camo", 0.50],
			["rhs_weap_ak74m_desert", 0.50],
			["rhs_weap_aks74n_npz", 0.45],
			["rhs_weap_aks74un", 0.45],
			["rhs_weap_pm63", 0.45],
			["rhs_weap_akm_zenitco01_b33", 0.40],
			["rhs_weap_ak103_zenitco01_b33", 0.40],
			["rhs_weap_ak104_zenitco01_b33", 0.40],
			["rhs_weap_ak105_zenitco01_b33", 0.40],
			["rhs_weap_ak74m_2mag_npz", 0.40],
			["rhs_weap_ak74m_zenitco01_b33", 0.40],
			["rhs_weap_akmn_gp25", 0.35],
			["rhs_weap_ak74m_fullplum_gp25_npz", 0.35],
			["rhs_weap_ak103_gp25_npz", 0.35],
			["rhs_weap_ak103_gp25", 0.35],
			["rhs_weap_pkm", 0.10],
			["rhs_weap_svds", 0.08],
			["rhs_weap_asval", 0.05]
		], [
			// Secondary weapons
			["rhs_weap_pya", 0.30],
			["rhs_weap_pp2000", 0.15]
		], [
			// Ammo
			["rhs_30Rnd_545x39_AK", 0.50],
			["rhs_30Rnd_545x39_AK_no_tracers", 0.33],
			["rhs_30Rnd_545x39_7N10_AK", 0.20],
			["rhs_30Rnd_545x39_7N22_AK", 0.15],
			["rhs_30Rnd_545x39_AK_green", 0.33],
			["rhs_30Rnd_545x39_7U1_AK", 0.14],
			["rhs_30Rnd_762x39mm", 0.50],
			["rhs_30Rnd_762x39mm_tracer", 0.33],
			["rhs_30Rnd_762x39mm_89", 0.20],
			["rhs_30Rnd_762x39mm_U", 0.18],
			["rhs_10Rnd_762x54mmR_7N1", 0.14],
			["rhs_100Rnd_762x54mmR", 0.14],
			["rhs_100Rnd_762x54mmR_green", 0.10],
			["rhs_100Rnd_762x54mmR_7N13", 0.06],
			["rhs_100Rnd_762x54mmR_7N26", 0.05],
			["rhs_100Rnd_762x54mmR_7BZ3", 0.04],
			["rhs_10Rnd_762x54mmR_7N1", 0.15],
			["rhs_20rnd_9x39mm_SP5", 0.13],
            ["rhs_20rnd_9x39mm_SP6", 0.11],
			["rhs_VOG25", 0.22],
			["rhs_VOG25p", 0.15],
			["rhs_vg40tb", 0.05],
			["rhs_vg40sz", 0.05],
			["rhs_vg40op_white", 0.05],
			["rhs_vg40op_green", 0.05],
			["rhs_vg40op_red", 0.05],
			["rhs_GRD40_white", 0.05],
			["rhs_GRD40_green", 0.05],
			["rhs_GRD40_red", 0.05],
			["rhs_VG40MD_White", 0.05],
			["rhs_VG40MD_Green", 0.05],
			["rhs_VG40MD_Red", 0.05],
			["rhs_GDM40", 0.05],
			["rhs_mag_9x18_8_57N181S", 0.20],
			["rhs_mag_9x18_12_57N181S", 0.15]
			["rhs_mag_9x19_17", 0.25]
		], [
			// Launchers
			["rhs_weap_rpg26", 0.20],
			["rhs_weap_rpg7", 0.15],
			["rhs_weap_igla", 0.13]
		], [
			// Launcher ammo
			["rhs_rpg7_PG7VL_mag", 0.27],
			["rhs_mag_9k32_rocket", 0.26],
			["rhs_rpg7_PG7VR_mag", 0.20],
			["rhs_rpg7_OG7V_mag", 0.08],
			["rhs_rpg7_TBG7V_mag", 0.05],
			["rhs_mag_9k38_rocket", 0.03]
		],[
			// Weapon accessories
			["rhs_acc_2dpZenit", 0.16],
			["rhs_acc_1p63", 0.17],
			["rhs_acc_ekp1", 0.16],
			["rhs_acc_ekp8_02", 0.16],
			["rhs_acc_ekp8_02_pkas", 0.13],
			["rhs_acc_pso1m2", 0.12],
			["rhs_acc_rakursPM", 0.14],
			["rhs_acc_1p87", 0.16],
			["rhs_acc_ekp8_18", 0.17],
			["rhsusf_acc_compm4", 0.17],
			["rhs_acc_dtkakm", 0.22],
			["rhs_acc_ukk", 0.22],
			["rhs_acc_ak5", 0.22],
			["rhs_acc_dtk", 0.22],
			["rhs_acc_dtk1", 0.22],
			["rhs_acc_dtk2", 0.22],
			["rhs_acc_dtk3", 0.22],
			["rhs_acc_dtk4short", 0.03],
			["rhs_acc_dtk1983", 0.22]
		], [
			["rhs_mag_rgd5", 0.31],        // RGD-5
			["rhs_mag_rdg2_white", 0.15],  // RGD-2 (white smoke)
			["rhs_mag_rdg2_black", 0.15],  // RGD-2 (black smoke)
			["rhs_mag_nspn_yellow", 0.20], // NSP-N (yellow flare)
			["rhs_mag_nspn_red", 0.20],    // NSP-N (red flare)
			["rhs_mag_nspn_green", 0.20],  // NSP-N (green flare)
			["rhs_mag_nspd", 0.20],        // NSP-D (red flare)
			["rhs_mag_fakel", 0.02],       // Fakel
			["rhs_mag_fakels", 0.02],      // Fakel-S
			["rhs_mag_zarya2", 0.03],      // Zarya-2
			["rhs_mag_plamyam", 0.02],     // Plamya-M
			["rhs_mine_pmn2", 0.01],       // PMN-2 AP
			["rhs_mine_tm62m", 0.01]       // TM-62M AT
		], [
			// Items
			["Binocular", 0.74],
			["FirstAidKit", 0.43],
			["Medikit", 0.21],
			["ToolKit", 0.19]
		]
	],
	// ------------ Sergeant ------------
	[
		[
			// Main weapons
			["rhs_weap_ak103", 0.50],
			["rhs_weap_ak103_1", 0.50],
			["rhs_weap_ak103_2", 0.50],
			["rhs_weap_ak104", 0.50],
			["rhs_weap_ak105", 0.50],
			["rhs_weap_ak74_3", 0.50],
			["rhs_weap_ak74m", 0.50],
			["rhs_weap_ak74m_2mag_camo", 0.50],
			["rhs_weap_ak74m_desert", 0.50],
			["rhs_weap_aks74n_npz", 0.45],
			["rhs_weap_aks74un", 0.45],
			["rhs_weap_pm63", 0.45],
			["rhs_weap_akm_zenitco01_b33", 0.40],
			["rhs_weap_ak103_zenitco01_b33", 0.40],
			["rhs_weap_ak104_zenitco01_b33", 0.40],
			["rhs_weap_ak105_zenitco01_b33", 0.40],
			["rhs_weap_ak74m_2mag_npz", 0.40],
			["rhs_weap_ak74m_zenitco01_b33", 0.40],
			["rhs_weap_akmn_gp25", 0.35],
			["rhs_weap_ak74m_fullplum_gp25_npz", 0.35],
			["rhs_weap_ak103_gp25_npz", 0.35],
			["rhs_weap_ak103_gp25", 0.35],
			["rhs_weap_pkm", 0.15],
			["rhs_weap_svds", 0.13],
			["rhs_weap_asval", 0.10]
		], [
			// Secondary weapons
			["rhs_weap_pya", 0.33],
			["rhs_weap_pp2000", 0.17]
		], [
			// Ammo
			["rhs_30Rnd_545x39_AK", 0.50],
			["rhs_30Rnd_545x39_AK_no_tracers", 0.33],
			["rhs_30Rnd_545x39_7N10_AK", 0.20],
			["rhs_30Rnd_545x39_7N22_AK", 0.15],
			["rhs_30Rnd_545x39_AK_green", 0.33],
			["rhs_30Rnd_545x39_7U1_AK", 0.14],
			["rhs_30Rnd_762x39mm", 0.50],
			["rhs_30Rnd_762x39mm_tracer", 0.33],
			["rhs_30Rnd_762x39mm_89", 0.20],
			["rhs_30Rnd_762x39mm_U", 0.18],
			["rhs_10Rnd_762x54mmR_7N1", 0.14],
			["rhs_100Rnd_762x54mmR", 0.14],
			["rhs_100Rnd_762x54mmR_green", 0.10],
			["rhs_100Rnd_762x54mmR_7N13", 0.06],
			["rhs_100Rnd_762x54mmR_7N26", 0.05],
			["rhs_100Rnd_762x54mmR_7BZ3", 0.04],
			["rhs_10Rnd_762x54mmR_7N1", 0.15],
			["rhs_20rnd_9x39mm_SP5", 0.13],
            ["rhs_20rnd_9x39mm_SP6", 0.11],
			["rhs_VOG25", 0.22],
			["rhs_VOG25p", 0.15],
			["rhs_vg40tb", 0.05],
			["rhs_vg40sz", 0.05],
			["rhs_vg40op_white", 0.05],
			["rhs_vg40op_green", 0.05],
			["rhs_vg40op_red", 0.05],
			["rhs_GRD40_white", 0.05],
			["rhs_GRD40_green", 0.05],
			["rhs_GRD40_red", 0.05],
			["rhs_VG40MD_White", 0.05],
			["rhs_VG40MD_Green", 0.05],
			["rhs_VG40MD_Red", 0.05],
			["rhs_GDM40", 0.05],
			["rhs_mag_9x18_8_57N181S", 0.20],
			["rhs_mag_9x18_12_57N181S", 0.15]
			["rhs_mag_9x19_17", 0.25]
		], [
			// Launchers
			["rhs_weap_rpg26", 0.20],
			["rhs_weap_rpg7", 0.15],
			["rhs_weap_igla", 0.13]
		], [
			// Launcher ammo
			["rhs_rpg7_PG7VL_mag", 0.47],
			["rhs_mag_9k32_rocket", 0.46],
			["rhs_rpg7_PG7VR_mag", 0.40],
			["rhs_rpg7_OG7V_mag", 0.16],
			["rhs_rpg7_TBG7V_mag", 0.10],
			["rhs_mag_9k38_rocket", 0.06]
		],[
			// Weapon accessories
			["rhs_acc_2dpZenit", 0.18],
			["rhs_acc_1p63", 0.19],
			["rhs_acc_ekp1", 0.18],
			["rhs_acc_ekp8_02", 0.18],
			["rhs_acc_ekp8_02_pkas", 0.15],
			["rhs_acc_pso1m2", 0.14],
			["rhs_acc_rakursPM", 0.16],
			["rhs_acc_1p87", 0.18],
			["rhs_acc_ekp8_18", 0.19],
			["rhsusf_acc_compm4", 0.19],
			["rhs_acc_dtkakm", 0.27],
			["rhs_acc_ukk", 0.22],
			["rhs_acc_ak5", 0.22],
			["rhs_acc_dtk", 0.22],
			["rhs_acc_dtk1", 0.22],
			["rhs_acc_dtk2", 0.22],
			["rhs_acc_dtk3", 0.22],
			["rhs_acc_dtk4short", 0.05],
			["rhs_acc_dtk1983", 0.22]
		], [
			["rhs_mag_rgd5", 0.31],        // RGD-5
			["rhs_mag_rdg2_white", 0.15],  // RGD-2 (white smoke)
			["rhs_mag_rdg2_black", 0.15],  // RGD-2 (black smoke)
			["rhs_mag_nspn_yellow", 0.20], // NSP-N (yellow flare)
			["rhs_mag_nspn_red", 0.20],    // NSP-N (red flare)
			["rhs_mag_nspn_green", 0.20],  // NSP-N (green flare)
			["rhs_mag_nspd", 0.20],        // NSP-D (red flare)
			["rhs_mag_fakel", 0.02],       // Fakel
			["rhs_mag_fakels", 0.02],      // Fakel-S
			["rhs_mag_zarya2", 0.03],      // Zarya-2
			["rhs_mag_plamyam", 0.02],     // Plamya-M
			["rhs_mine_pmn2", 0.01],       // PMN-2 AP
			["rhs_mine_tm62m", 0.01]       // TM-62M AT
		], [
			// Items
			["Binocular", 0.84],
			["FirstAidKit", 0.43],
			["Medikit", 0.21],
			["ToolKit", 0.19]
		]
	],
	// ------------ Liutenant ------------
	[
		[
			// Main weapons
			["rhs_weap_ak103_1", 0.50],
			["rhs_weap_ak103_2", 0.50],
			["rhs_weap_ak105", 0.50],
			["rhs_weap_ak74_3", 0.50],
			["rhs_weap_ak74m_2mag_camo", 0.50],
			["rhs_weap_ak74m_desert", 0.50],
			["rhs_weap_aks74n_npz", 0.45],
			["rhs_weap_aks74un", 0.45],
			["rhs_weap_pm63", 0.45],
			["rhs_weap_pkp", 0.18],
			["rhs_weap_akm_zenitco01_b33", 0.40],
			["rhs_weap_ak103_zenitco01_b33", 0.40],
			["rhs_weap_ak104_zenitco01_b33", 0.40],
			["rhs_weap_ak105_zenitco01_b33", 0.40],
			["rhs_weap_ak74m_2mag_npz", 0.40],
			["rhs_weap_ak74m_zenitco01_b33", 0.40],
			["rhs_weap_akmn_gp25", 0.35],
			["rhs_weap_ak74m_fullplum_gp25_npz", 0.35],
			["rhs_weap_ak103_gp25_npz", 0.35],
			["rhs_weap_ak103_gp25", 0.35],
			["rhs_weap_pkm", 0.15],
			["rhs_weap_svds", 0.13],
			["rhs_weap_asval", 0.12]
		], [
			// Secondary weapons
			["rhs_weap_pya", 0.63],
			["rhs_weap_pp2000", 0.20]
		], [
			// Ammo
			["rhs_30Rnd_545x39_AK", 0.50],
			["rhs_30Rnd_545x39_AK_no_tracers", 0.33],
			["rhs_30Rnd_545x39_7N10_AK", 0.20],
			["rhs_30Rnd_545x39_7N22_AK", 0.15],
			["rhs_30Rnd_545x39_AK_green", 0.33],
			["rhs_30Rnd_545x39_7U1_AK", 0.14],
			["rhs_30Rnd_762x39mm", 0.50],
			["rhs_30Rnd_762x39mm_tracer", 0.33],
			["rhs_30Rnd_762x39mm_89", 0.20],
			["rhs_30Rnd_762x39mm_U", 0.18],
			["rhs_10Rnd_762x54mmR_7N1", 0.14],
			["rhs_100Rnd_762x54mmR", 0.14],
			["rhs_100Rnd_762x54mmR_green", 0.10],
			["rhs_100Rnd_762x54mmR_7N13", 0.06],
			["rhs_100Rnd_762x54mmR_7N26", 0.05],
			["rhs_100Rnd_762x54mmR_7BZ3", 0.04],
			["rhs_10Rnd_762x54mmR_7N1", 0.15],
			["rhs_20rnd_9x39mm_SP5", 0.13],
            ["rhs_20rnd_9x39mm_SP6", 0.11],
			["rhs_VOG25", 0.22],
			["rhs_VOG25p", 0.15],
			["rhs_vg40tb", 0.05],
			["rhs_vg40sz", 0.05],
			["rhs_vg40op_white", 0.05],
			["rhs_vg40op_green", 0.05],
			["rhs_vg40op_red", 0.05],
			["rhs_GRD40_white", 0.05],
			["rhs_GRD40_green", 0.05],
			["rhs_GRD40_red", 0.05],
			["rhs_VG40MD_White", 0.05],
			["rhs_VG40MD_Green", 0.05],
			["rhs_VG40MD_Red", 0.05],
			["rhs_GDM40", 0.05],
			["rhs_mag_9x18_8_57N181S", 0.20],
			["rhs_mag_9x18_12_57N181S", 0.15],
			["rhs_mag_9x19_17", 0.15]
		], [
			// Launchers
			["rhs_weap_rpg26", 0.20],
			["rhs_weap_rpg7", 0.15],
			["rhs_weap_igla", 0.13]
		], [
			// Launcher ammo
			["rhs_rpg7_PG7VL_mag", 0.57],
			["rhs_mag_9k32_rocket", 0.56],
			["rhs_rpg7_PG7VR_mag", 0.40],
			["rhs_rpg7_OG7V_mag", 0.26],
			["rhs_rpg7_TBG7V_mag", 0.20],
			["rhs_mag_9k38_rocket", 0.16]
		],[
			// Weapon accessories
			["rhs_acc_2dpZenit", 0.23],
			["rhs_acc_1p63", 0.24],
			["rhs_acc_ekp1", 0.23],
			["rhs_acc_ekp8_02", 0.23],
			["rhs_acc_ekp8_02_pkas", 0.20],
			["rhs_acc_pso1m2", 0.19],
			["rhs_acc_rakursPM", 0.21],
			["rhs_acc_1p87", 0.23],
			["rhs_acc_ekp8_18", 0.24],
			["rhsusf_acc_compm4", 0.24],
			["rhs_acc_dtkakm", 0.22],
			["rhs_acc_ukk", 0.22],
			["rhs_acc_ak5", 0.22],
			["rhs_acc_dtk", 0.22],
			["rhs_acc_dtk1", 0.22],
			["rhs_acc_dtk2", 0.22],
			["rhs_acc_dtk3", 0.22],
			["rhs_acc_dtk4short", 0.06],
			["rhs_acc_dtk1983", 0.22],
			["rhs_acc_dh520x56", 0.02]
		], [
			["rhs_mag_rgd5", 0.61],        // RGD-5
			["rhs_mag_rdg2_white", 0.15],  // RGD-2 (white smoke)
			["rhs_mag_rdg2_black", 0.15],  // RGD-2 (black smoke)
			["rhs_mag_nspn_yellow", 0.20], // NSP-N (yellow flare)
			["rhs_mag_nspn_red", 0.20],    // NSP-N (red flare)
			["rhs_mag_nspn_green", 0.20],  // NSP-N (green flare)
			["rhs_mag_nspd", 0.20],        // NSP-D (red flare)
			["rhs_mag_fakel", 0.02],       // Fakel
			["rhs_mag_fakels", 0.02],      // Fakel-S
			["rhs_mag_zarya2", 0.03],      // Zarya-2
			["rhs_mag_plamyam", 0.02],     // Plamya-M
			["rhs_mine_pmn2", 0.01],       // PMN-2 AP
			["rhs_mine_tm62m", 0.01]       // TM-62M AT
		], [
			// Items
			["Binocular", 0.94],
			["FirstAidKit", 0.43],
			["Medikit", 0.21],
			["ToolKit", 0.19]
		]
	],
	// ------------ Captain ------------
	[
		[
			// Main weapons
			["rhs_weap_akmn_gp25", 0.75],
			["rhs_weap_ak74m_fullplum_gp25_npz", 0.75],
			["rhs_weap_ak103_gp25_npz", 0.75],
			["rhs_weap_ak103_gp25", 0.75],
			["rhs_weap_pkm", 0.45],
			["rhs_weap_pkp", 0.35],
			["rhs_weap_svds", 0.43],
			["rhs_weap_asval", 0.30],
			["rhs_weap_asval_grip_npz", 0.22],
			["rhs_weap_svdp_wd", 0.20],
			["rhs_weap_svdp_wd_npz", 0.18],
			["rhs_weap_vss_grip", 0.10],
			["rhs_weap_vss_grip_npz", 0.10]
		], [
			// Secondary weapons
			["rhs_weap_pya", 0.73],
			["rhs_weap_pp2000", 0.50]
		], [
			// Ammo
			["rhs_30Rnd_545x39_AK", 0.50],
			["rhs_30Rnd_545x39_AK_no_tracers", 0.33],
			["rhs_30Rnd_545x39_7N10_AK", 0.20],
			["rhs_30Rnd_545x39_7N22_AK", 0.15],
			["rhs_30Rnd_545x39_AK_green", 0.33],
			["rhs_30Rnd_545x39_7U1_AK", 0.14],
			["rhs_30Rnd_762x39mm", 0.50],
			["rhs_30Rnd_762x39mm_tracer", 0.33],
			["rhs_30Rnd_762x39mm_89", 0.20],
			["rhs_30Rnd_762x39mm_U", 0.18],
			["rhs_10Rnd_762x54mmR_7N1", 0.14],
			["rhs_100Rnd_762x54mmR", 0.14],
			["rhs_100Rnd_762x54mmR_green", 0.10],
			["rhs_100Rnd_762x54mmR_7N13", 0.06],
			["rhs_100Rnd_762x54mmR_7N26", 0.05],
			["rhs_100Rnd_762x54mmR_7BZ3", 0.04],
			["rhs_10Rnd_762x54mmR_7N1", 0.15],
			["rhs_20rnd_9x39mm_SP5", 0.13],
            ["rhs_20rnd_9x39mm_SP6", 0.11],
			["rhs_VOG25", 0.22],
			["rhs_VOG25p", 0.15],
			["rhs_vg40tb", 0.05],
			["rhs_vg40sz", 0.05],
			["rhs_vg40op_white", 0.05],
			["rhs_vg40op_green", 0.05],
			["rhs_vg40op_red", 0.05],
			["rhs_GRD40_white", 0.05],
			["rhs_GRD40_green", 0.05],
			["rhs_GRD40_red", 0.05],
			["rhs_VG40MD_White", 0.05],
			["rhs_VG40MD_Green", 0.05],
			["rhs_VG40MD_Red", 0.05],
			["rhs_GDM40", 0.05],
			["rhs_mag_9x18_8_57N181S", 0.20],
			["rhs_mag_9x18_12_57N181S", 0.15],
			["rhs_mag_9x19_17", 0.15]
		], [
			// Launchers
			["rhs_weap_rpg26", 0.20],
			["rhs_weap_rpg7", 0.15],
			["rhs_weap_igla", 0.13]
		], [
			// Launcher ammo
			["rhs_rpg7_PG7VL_mag", 0.57],
			["rhs_mag_9k32_rocket", 0.56],
			["rhs_rpg7_PG7VR_mag", 0.40],
			["rhs_rpg7_OG7V_mag", 0.26],
			["rhs_rpg7_TBG7V_mag", 0.20],
			["rhs_mag_9k38_rocket", 0.16]
		],[
			// Weapon accessories
			["rhs_acc_2dpZenit", 0.33],
			["rhs_acc_1p63", 0.34],
			["rhs_acc_ekp1", 0.33],
			["rhs_acc_ekp8_02", 0.33],
			["rhs_acc_ekp8_02_pkas", 0.30],
			["rhs_acc_pso1m2", 0.29],
			["rhs_acc_rakursPM", 0.31],
			["rhs_acc_1p87", 0.33],
			["rhs_acc_ekp8_18", 0.34],
			["rhsusf_acc_compm4", 0.34],
			["rhs_acc_dtk4short", 0.16],
			["rhs_acc_dh520x56", 0.15]
		], [
			["rhs_mag_rgd5", 0.61],        // RGD-5
			["rhs_mag_rdg2_white", 0.15],  // RGD-2 (white smoke)
			["rhs_mag_rdg2_black", 0.15],  // RGD-2 (black smoke)
			["rhs_mag_nspn_yellow", 0.20], // NSP-N (yellow flare)
			["rhs_mag_nspn_red", 0.20],    // NSP-N (red flare)
			["rhs_mag_nspn_green", 0.20],  // NSP-N (green flare)
			["rhs_mag_nspd", 0.20],        // NSP-D (red flare)
			["rhs_mag_fakel", 0.02],       // Fakel
			["rhs_mag_fakels", 0.02],      // Fakel-S
			["rhs_mag_zarya2", 0.03],      // Zarya-2
			["rhs_mag_plamyam", 0.02],     // Plamya-M
			["rhs_mine_pmn2", 0.01],       // PMN-2 AP
			["rhs_mine_tm62m", 0.01]       // TM-62M AT
		], [
			// Items
			["Binocular", 0.94],
			["FirstAidKit", 0.43],
			["Medikit", 0.21],
			["ToolKit", 0.19]
		]
	],
	// ------------ Major ------------
	[
		[
			// Main weapons
			["rhs_weap_akmn_gp25", 0.75],
			["rhs_weap_ak74m_fullplum_gp25_npz", 0.75],
			["rhs_weap_ak103_gp25_npz", 0.75],
			["rhs_weap_ak103_gp25", 0.75],
			["rhs_weap_pkm", 0.45],
			["rhs_weap_pkp", 0.35],
			["rhs_weap_svds", 0.43],
			["rhs_weap_asval", 0.30],
			["rhs_weap_asval_grip_npz", 0.22],
			["rhs_weap_svdp_wd", 0.20],
			["rhs_weap_svdp_wd_npz", 0.18],
			["rhs_weap_vss_grip", 0.10],
			["rhs_weap_vss_grip_npz", 0.10]
		], [
			// Secondary weapons
			["rhs_weap_pya", 0.73],
			["rhs_weap_pp2000", 0.50]
		], [
			// Ammo
			["rhs_30Rnd_545x39_7N22_AK", 0.35],
			["rhs_30Rnd_762x39mm_89", 0.50],
			["rhs_30Rnd_762x39mm_U", 0.48],
			["rhs_10Rnd_762x54mmR_7N1", 0.44],
			["rhs_100Rnd_762x54mmR", 0.34],
			["rhs_100Rnd_762x54mmR_green", 0.20],
			["rhs_100Rnd_762x54mmR_7N13", 0.16],
			["rhs_100Rnd_762x54mmR_7N26", 0.15],
			["rhs_100Rnd_762x54mmR_7BZ3", 0.14],
			["rhs_10Rnd_762x54mmR_7N1", 0.25],
			["rhs_20rnd_9x39mm_SP5", 0.23],
            ["rhs_20rnd_9x39mm_SP6", 0.21],
			["rhs_VOG25", 0.62],
			["rhs_VOG25p", 0.55],
			["rhs_mag_9x18_8_57N181S", 0.20],
			["rhs_mag_9x18_12_57N181S", 0.15],
			["rhs_mag_9x19_17", 0.55]
		], [
			// Launchers
			["rhs_weap_rpg26", 0.60],
			["rhs_weap_rpg7", 0.35],
			["rhs_weap_igla", 0.33]
		], [
			// Launcher ammo
			["rhs_rpg7_PG7VL_mag", 0.67],
			["rhs_mag_9k32_rocket", 0.66],
			["rhs_rpg7_PG7VR_mag", 0.50],
			["rhs_rpg7_OG7V_mag", 0.36],
			["rhs_rpg7_TBG7V_mag", 0.30],
			["rhs_mag_9k38_rocket", 0.26]
		],[
			// Weapon accessories
			["rhs_acc_2dpZenit", 0.43],
			["rhs_acc_1p63", 0.44],
			["rhs_acc_ekp1", 0.43],
			["rhs_acc_ekp8_02", 0.43],
			["rhs_acc_ekp8_02_pkas", 0.40],
			["rhs_acc_pso1m2", 0.39],
			["rhs_acc_rakursPM", 0.41],
			["rhs_acc_1p87", 0.43],
			["rhs_acc_ekp8_18", 0.44],
			["rhsusf_acc_compm4", 0.44],
			["rhs_acc_dtk4short", 0.26],
			["rhs_acc_tgpa", 0.14],
			["rhs_acc_dh520x56", 0.25]
		], [
			["rhs_mag_rgd5", 0.61],        // RGD-5
			["rhs_mag_rdg2_white", 0.15],  // RGD-2 (white smoke)
			["rhs_mag_rdg2_black", 0.15],  // RGD-2 (black smoke)
			["rhs_mag_nspn_yellow", 0.20], // NSP-N (yellow flare)
			["rhs_mag_nspn_red", 0.20],    // NSP-N (red flare)
			["rhs_mag_nspn_green", 0.20],  // NSP-N (green flare)
			["rhs_mag_nspd", 0.20],        // NSP-D (red flare)
			["rhs_mag_fakel", 0.02],       // Fakel
			["rhs_mag_fakels", 0.02],      // Fakel-S
			["rhs_mag_zarya2", 0.03],      // Zarya-2
			["rhs_mag_plamyam", 0.02],     // Plamya-M
			["rhs_mine_pmn2", 0.01],       // PMN-2 AP
			["rhs_mine_tm62m", 0.01]       // TM-62M AT
		], [
			// Items
			["Binocular", 0.94],
			["Rangefinder", 0.17],
			["FirstAidKit", 0.43],
			["Medikit", 0.21],
			["ToolKit", 0.19]
		]
	],
	// ------------ Colonel ------------
	[
		[
			// Main weapons
			["rhs_weap_pkp", 0.65],
			["rhs_weap_svds", 0.53],
			["rhs_weap_asval", 0.50],
			["rhs_weap_asval_grip_npz", 0.42],
			["rhs_weap_svdp_wd", 0.40],
			["rhs_weap_svdp_wd_npz", 0.38],
			["rhs_weap_vss_grip", 0.10],
			["rhs_weap_vss_grip_npz", 0.10]
		], [
			// Secondary weapons
			["rhs_weap_pya", 0.73],
			["rhs_weap_pp2000", 0.50]
		], [
			// Ammo
			["rhs_30Rnd_545x39_7N22_AK", 0.45],
			["rhs_30Rnd_762x39mm_89", 0.60],
			["rhs_30Rnd_762x39mm_U", 0.58],
			["rhs_10Rnd_762x54mmR_7N1", 0.54],
			["rhs_100Rnd_762x54mmR", 0.44],
			["rhs_100Rnd_762x54mmR_green", 0.30],
			["rhs_100Rnd_762x54mmR_7N13", 0.26],
			["rhs_100Rnd_762x54mmR_7N26", 0.25],
			["rhs_100Rnd_762x54mmR_7BZ3", 0.24],
			["rhs_10Rnd_762x54mmR_7N1", 0.35],
			["rhs_20rnd_9x39mm_SP5", 0.33],
            ["rhs_20rnd_9x39mm_SP6", 0.31],
			["rhs_VOG25", 0.72],
			["rhs_VOG25p", 0.65],
			["rhs_mag_9x18_8_57N181S", 0.20],
			["rhs_mag_9x18_12_57N181S", 0.15],
			["rhs_mag_9x19_17", 0.55]
		], [
			// Launchers
			["rhs_weap_rpg26", 0.70],
			["rhs_weap_rpg7", 0.75],
			["rhs_weap_igla", 0.73]
		], [
			// Launcher ammo
			["rhs_rpg7_PG7VL_mag", 0.77],
			["rhs_mag_9k32_rocket", 0.76],
			["rhs_rpg7_PG7VR_mag", 0.50],
			["rhs_rpg7_OG7V_mag", 0.36],
			["rhs_rpg7_TBG7V_mag", 0.30],
			["rhs_mag_9k38_rocket", 0.26]
		],[
			// Weapon accessories
			["rhs_acc_2dpZenit", 0.53],
			["rhs_acc_1p63", 0.54],
			["rhs_acc_ekp1", 0.53],
			["rhs_acc_ekp8_02", 0.53],
			["rhs_acc_ekp8_02_pkas", 0.50],
			["rhs_acc_pso1m2", 0.49],
			["rhs_acc_rakursPM", 0.51],
			["rhs_acc_1p87", 0.53],
			["rhs_acc_ekp8_18", 0.54],
			["rhsusf_acc_compm4", 0.54],
			["rhs_acc_dtk4short", 0.46],
			["rhs_acc_tgpa", 0.24],
			["rhs_acc_dh520x56", 0.45]
		], [
			["rhs_mag_rgd5", 0.61],        // RGD-5
			["rhs_mag_rdg2_white", 0.15],  // RGD-2 (white smoke)
			["rhs_mag_rdg2_black", 0.15],  // RGD-2 (black smoke)
			["rhs_mag_nspn_yellow", 0.20], // NSP-N (yellow flare)
			["rhs_mag_nspn_red", 0.20],    // NSP-N (red flare)
			["rhs_mag_nspn_green", 0.20],  // NSP-N (green flare)
			["rhs_mag_nspd", 0.20],        // NSP-D (red flare)
			["rhs_mag_fakel", 0.02],       // Fakel
			["rhs_mag_fakels", 0.02],      // Fakel-S
			["rhs_mag_zarya2", 0.03],      // Zarya-2
			["rhs_mag_plamyam", 0.02],     // Plamya-M
			["rhs_mine_pmn2", 0.01],       // PMN-2 AP
			["rhs_mine_tm62m", 0.01]       // TM-62M AT
		], [
			// Items
			["Binocular", 0.94],
			["Rangefinder", 0.27],
			["FirstAidKit", 0.43],
			["Medikit", 0.21],
			["ToolKit", 0.19]
		]
	]
];