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
 * Loot chances uses selectRandomWeighted, the higher the number, the higher the chance of drop (0 = no drop)
 */

// Insurgency loot tables:
// [WeaponClass, ChanceOfDrop]
InsurgencyLootTable = [
    // ------------ Private ------------
    [
        [
            // Main weapons
            "rhs_weap_akm", 0.50,
            "rhs_weap_akms", 0.40,
            "rhs_weap_ak74", 0.50,
            "rhs_weap_aks74", 0.40,
            "rhs_weap_aks74n", 0.18,
            "rhs_weap_aks74u", 0.35,
            "rhs_weap_ak74n", 0.20,
            "rhs_weap_ak74_gp25", 0.18,
            "rhs_weap_ak74n_gp25", 0.14,
            "rhs_weap_akm_gp25", 0.18,
            "rhs_weap_aks74n_gp25", 0.13,
            "rhs_weap_kar98k", 0.25,
            "rhs_weap_m38", 0.25,
            "rhs_weap_pkm", 0.05,
            "rhs_weap_m76", 0.04
        ], [
            // Secondary weapons
            "rhs_weap_makarov_pm", 0.25
        ], [
            // Ammo
            "rhs_30Rnd_545x39_AK", 0.50,
            "rhs_30Rnd_545x39_AK_no_tracers", 0.33,
            "rhs_30Rnd_545x39_7N10_AK", 0.20,
            "rhs_30Rnd_545x39_7N22_AK", 0.15,
            "rhs_30Rnd_545x39_AK_green", 0.33,
            "rhs_30Rnd_545x39_7U1_AK", 0.14,
            "rhs_30Rnd_762x39mm", 0.50,
            "rhs_30Rnd_762x39mm_tracer", 0.33,
            "rhs_30Rnd_762x39mm_89", 0.20,
            "rhs_30Rnd_762x39mm_U", 0.18,
            "rhs_10Rnd_762x54mmR_7N1", 0.14,
            "rhs_100Rnd_762x54mmR", 0.10,
            "rhs_100Rnd_762x54mmR_green", 0.08,
            "rhs_100Rnd_762x54mmR_7N13", 0.05,
            "rhs_100Rnd_762x54mmR_7N26", 0.04,
            "rhs_100Rnd_762x54mmR_7BZ3", 0.03,
            "rhsgref_5Rnd_792x57_kar98k", 0.33,
            "rhsgref_5Rnd_762x54_m38", 0.33,
            "rhsgref_10Rnd_792x57_m76", 0.15,
            "rhs_VOG25", 0.12,
            "rhs_VOG25p", 0.1,
            "rhs_vg40tb", 0.05,
            "rhs_vg40sz", 0.05,
            "rhs_vg40op_white", 0.05,
            "rhs_vg40op_green", 0.05,
            "rhs_vg40op_red", 0.05,
            "rhs_GRD40_white", 0.05,
            "rhs_GRD40_green", 0.05,
            "rhs_GRD40_red", 0.05,
            "rhs_VG40MD_White", 0.05,
            "rhs_VG40MD_Green", 0.05,
            "rhs_VG40MD_Red", 0.05,
            "rhs_GDM40", 0.05,
            "rhs_mag_9x18_8_57N181S", 0.20,
            "rhs_mag_9x18_12_57N181S", 0.15
        ], [
            // Launchers
            "rhs_weap_rpg26", 0.08
        ], [
            // Launcher ammo
            []
        ],[
            // Weapon accessories
            "rhs_acc_2dpZenit", 0.13,
            "rhs_acc_1p63", 0.08,
            "rhs_acc_ekp1", 0.13,
            "rhs_acc_ekp8_02", 0.13,
            "rhs_acc_ekp8_02_pkas", 0.05,
            "rhs_acc_pso1m2", 0.03,
            "rhs_acc_pso1m2", 0.02,
            "rhs_acc_dtkakm", 0.33,
            "rhs_acc_ukk", 0.33,
            "rhs_acc_ak5", 0.33,
            "rhs_acc_dtk", 0.33,
            "rhs_acc_dtk1", 0.33,
            "rhs_acc_dtk2", 0.33,
            "rhs_acc_dtk3", 0.33,
            "rhs_acc_dtk4short", 0.03,
            "rhs_acc_dtk1983", 0.33
        ], [
            // Explosives
            "rhs_mag_rgd5", 0.21,        // RGD-5
            "rhs_mag_rdg2_white", 0.15,  // RGD-2 (white smoke)
            "rhs_mag_rdg2_black", 0.15,  // RGD-2 (black smoke)
            "rhs_mag_nspn_yellow", 0.20, // NSP-N (yellow flare)
            "rhs_mag_nspn_red", 0.20,    // NSP-N (red flare)
            "rhs_mag_nspn_green", 0.20,  // NSP-N (green flare)
            "rhs_mag_nspd", 0.20,        // NSP-D (red flare)
            "rhs_mag_fakel", 0.02,       // Fakel
            "rhs_mag_fakels", 0.02,      // Fakel-S
            "rhs_mag_zarya2", 0.03,      // Zarya-2
            "rhs_mag_plamyam", 0.02,     // Plamya-M
            "rhs_mine_pmn2", 0.01,       // PMN-2 AP
            "rhs_mine_tm62m", 0.01       // TM-62M AT
        ], [
            // Items
            "Binocular", 0.24,
            "FirstAidKit", 0.33,
            "Medikit", 0.11,
            "ToolKit", 0.09
        ]
    ],
    // ------------ Corporal ------------
    [
        [
            // Main weapons
            "rhs_weap_ak103", 0.50,
            "rhs_weap_ak74m_fullplum", 0.40,
            "rhs_weap_m21s", 0.51,
            "rhs_weap_m21a", 0.44,
            "rhs_weap_aks74n", 0.18,
            "rhs_weap_m21a_pr", 0.22,
            "rhs_weap_ak74n", 0.20,
            "rhs_weap_ak74_gp25", 0.18,
            "rhs_weap_ak74n_gp25", 0.14,
            "rhs_weap_akm_gp25", 0.18,
            "rhs_weap_aks74n_gp25", 0.13,
            "rhs_weap_m240G", 0.05,
            "rhs_weap_m70ab2", 0.49,
            "rhs_weap_m70b1", 0.50,
            "rhs_weap_m92", 0.43,
            "rhs_weap_svds", 0.05,
            "rhs_weap_kar98k", 0.25,
            "rhs_weap_m38", 0.25,
            "rhs_weap_pkm", 0.09,
            "rhs_weap_m76", 0.08
        ], [
            // Secondary weapons
            "rhs_weap_makarov_pm", 0.33
        ], [
            // Ammo
            "rhs_30Rnd_545x39_AK", 0.50,
            "rhs_30Rnd_545x39_AK_no_tracers", 0.33,
            "rhs_30Rnd_545x39_7N10_AK", 0.20,
            "rhs_30Rnd_545x39_7N22_AK", 0.15,
            "rhs_30Rnd_545x39_AK_green", 0.33,
            "rhs_30Rnd_545x39_7U1_AK", 0.14,
            "rhs_30Rnd_762x39mm", 0.50,
            "rhs_30Rnd_762x39mm_tracer", 0.33,
            "rhs_30Rnd_762x39mm_89", 0.20,
            "rhs_30Rnd_762x39mm_U", 0.18,
            "rhs_10Rnd_762x54mmR_7N1", 0.14,
            "rhs_100Rnd_762x54mmR", 0.10,
            "rhs_100Rnd_762x54mmR_green", 0.08,
            "rhs_100Rnd_762x54mmR_7N13", 0.05,
            "rhs_100Rnd_762x54mmR_7N26", 0.04,
            "rhs_100Rnd_762x54mmR_7BZ3", 0.03,
            "rhsgref_5Rnd_792x57_kar98k", 0.33,
            "rhsgref_5Rnd_762x54_m38", 0.33,
            "rhsgref_10Rnd_792x57_m76", 0.15,
            "rhs_VOG25", 0.18,
            "rhs_VOG25p", 0.14,
            "rhs_vg40tb", 0.05,
            "rhs_vg40sz", 0.05,
            "rhs_vg40op_white", 0.05,
            "rhs_vg40op_green", 0.05,
            "rhs_vg40op_red", 0.05,
            "rhs_GRD40_white", 0.05,
            "rhs_GRD40_green", 0.05,
            "rhs_GRD40_red", 0.05,
            "rhs_VG40MD_White", 0.05,
            "rhs_VG40MD_Green", 0.05,
            "rhs_VG40MD_Red", 0.05,
            "rhs_GDM40", 0.05,
            "rhs_mag_9x18_8_57N181S", 0.20,
            "rhs_mag_9x18_12_57N181S", 0.15
        ], [
            // Launchers
            "rhs_weap_rpg26", 0.12,
            "rhs_weap_rpg7", 0.03,
            "rhs_weap_igla", 0.02
        ], [
            // Launcher ammo
            "rhs_rpg7_PG7VL_mag", 0.07,
            "rhs_mag_9k32_rocket", 0.06
        ],[
            // Weapon accessories
            "rhs_acc_2dpZenit", 0.15,
            "rhs_acc_1p63", 0.08,
            "rhs_acc_ekp1", 0.16,
            "rhs_acc_ekp8_02", 0.16,
            "rhs_acc_ekp8_02_pkas", 0.05,
            "rhs_acc_pso1m2", 0.03,
            "rhs_acc_pso1m2", 0.02,
            "rhs_acc_dtkakm", 0.33,
            "rhs_acc_ukk", 0.33,
            "rhs_acc_ak5", 0.33,
            "rhs_acc_dtk", 0.33,
            "rhs_acc_dtk1", 0.33,
            "rhs_acc_dtk2", 0.33,
            "rhs_acc_dtk3", 0.33,
            "rhs_acc_dtk4short", 0.03,
            "rhs_acc_dtk1983", 0.33
        ], [
            // Explosives
            "rhs_mag_rgd5", 0.25,        // RGD-5     
            "rhs_mag_rdg2_white", 0.15,  // RGD-2 (white smoke)     
            "rhs_mag_rdg2_black", 0.15,  // RGD-2 (black smoke)     
            "rhs_mag_nspn_yellow", 0.20, // NSP-N (yellow flare)     
            "rhs_mag_nspn_red", 0.20,    // NSP-N (red flare)     
            "rhs_mag_nspn_green", 0.20,  // NSP-N (green flare)     
            "rhs_mag_nspd", 0.20,        // NSP-D (red flare)     
            "rhs_mag_fakel", 0.03,       // Fakel
            "rhs_mag_fakels", 0.03,      // Fakel-S
            "rhs_mag_zarya2", 0.03,      // Zarya-2
            "rhs_mag_plamyam", 0.02,     // Plamya-M
            "rhs_mine_pmn2", 0.01,       // PMN-2 AP
            "rhs_mine_tm62m", 0.01       // TM-62M AT
        ], [
            // Items
            "Binocular", 0.34,
            "FirstAidKit", 0.33,
            "Medikit", 0.21,
            "ToolKit", 0.19
        ]
    ],
    // ------------ Sergeant ------------
    [
        [
            // Main weapons
            "rhs_weap_ak103", 0.55,
            "rhs_weap_ak74m_fullplum", 0.60,
            "rhs_weap_m21s", 0.50,
            "rhs_weap_m21a", 0.50,
            "rhs_weap_aks74n", 0.66,
            "rhs_weap_m21a_pr", 0.33,
            "rhs_weap_ak74n", 0.66,
            "rhs_weap_ak74n_gp25", 0.33,
            "rhs_weap_aks74n_gp25", 0.33,
            "rhs_weap_m240G", 0.10,
            "rhs_weap_m70ab2", 0.49,
            "rhs_weap_m70b1", 0.50,
            "rhs_weap_m92", 0.43,
            "rhs_weap_svds", 0.10,
            "rhs_weap_kar98k", 0.25,
            "rhs_weap_m38", 0.25,
            "rhs_weap_pkm", 0.18,
            "rhs_weap_m76", 0.16
        ], [
            // Secondary weapons
            "rhs_weap_makarov_pm", 0.80
        ], [
            // Ammo
            "rhs_30Rnd_545x39_AK", 0.80,
            "rhs_30Rnd_545x39_AK_no_tracers", 0.66,
            "rhs_30Rnd_545x39_7N10_AK", 0.40,
            "rhs_30Rnd_545x39_7N22_AK", 0.30,
            "rhs_30Rnd_545x39_AK_green", 0.66,
            "rhs_30Rnd_545x39_7U1_AK", 0.28,
            "rhs_30Rnd_762x39mm", 0.80,
            "rhs_30Rnd_762x39mm_tracer", 0.66,
            "rhs_30Rnd_762x39mm_89", 0.40,
            "rhs_30Rnd_762x39mm_U", 0.36,
            "rhs_10Rnd_762x54mmR_7N1", 0.28,
            "rhs_100Rnd_762x54mmR", 0.20,
            "rhs_100Rnd_762x54mmR_green", 0.16,
            "rhs_100Rnd_762x54mmR_7N13", 0.10,
            "rhs_100Rnd_762x54mmR_7N26", 0.08,
            "rhs_100Rnd_762x54mmR_7BZ3", 0.06,
            "rhsgref_5Rnd_792x57_kar98k", 0.66,
            "rhsgref_5Rnd_762x54_m38", 0.66,
            "rhsgref_10Rnd_792x57_m76", 0.30,
            "rhs_VOG25", 0.33,
            "rhs_VOG25p", 0.25,
            "rhs_vg40tb", 0.05,
            "rhs_vg40sz", 0.05,
            "rhs_vg40op_white", 0.05,
            "rhs_vg40op_green", 0.05,
            "rhs_vg40op_red", 0.05,
            "rhs_GRD40_white", 0.05,
            "rhs_GRD40_green", 0.05,
            "rhs_GRD40_red", 0.05,
            "rhs_VG40MD_White", 0.05,
            "rhs_VG40MD_Green", 0.05,
            "rhs_VG40MD_Red", 0.05,
            "rhs_GDM40", 0.05,
            "rhs_mag_9x18_8_57N181S", 0.40,
            "rhs_mag_9x18_12_57N181S", 0.30
        ], [
            // Launchers
            "rhs_weap_rpg26", 0.16,
            "rhs_weap_rpg7", 0.06,
            "rhs_weap_igla", 0.04
        ], [
            // Launcher ammo
            "rhs_rpg7_PG7VL_mag", 0.09,
            "rhs_mag_9k32_rocket", 0.08
        ], [
            // Weapon accessories
            "rhs_acc_2dpZenit", 0.21,
            "rhs_acc_1p63", 0.20,
            "rhs_acc_ekp1", 0.18,
            "rhs_acc_ekp8_02", 0.18,
            "rhs_acc_ekp8_02_pkas", 0.17,
            "rhs_acc_pso1m2", 0.15,
            "rhs_acc_pso1m2", 0.16,
            "rhs_acc_dtkakm", 0.33,
            "rhs_acc_ukk", 0.33,
            "rhs_acc_ak5", 0.33,
            "rhs_acc_dtk", 0.33,
            "rhs_acc_dtk1", 0.33,
            "rhs_acc_dtk2", 0.33,
            "rhs_acc_dtk3", 0.33,
            "rhs_acc_dtk4short", 0.11,
            "rhs_acc_dtk1983", 0.33
        ], [
            // Explosives
            "rhs_mag_rgd5", 0.43,        // RGD-5
            "rhs_mag_rdg2_white", 0.15,  // RGD-2 (white smoke)
            "rhs_mag_rdg2_black", 0.15,  // RGD-2 (black smoke)
            "rhs_mag_nspn_yellow", 0.20, // NSP-N (yellow flare)
            "rhs_mag_nspn_red", 0.20,    // NSP-N (red flare)
            "rhs_mag_nspn_green", 0.20,  // NSP-N (green flare)
            "rhs_mag_nspd", 0.20,        // NSP-D (red flare)
            "rhs_mag_fakel", 0.03,       // Fakel
            "rhs_mag_fakels", 0.03,      // Fakel-S
            "rhs_mag_zarya2", 0.03,      // Zarya-2
            "rhs_mag_plamyam", 0.02,     // Plamya-M
            "rhs_mine_pmn2", 0.01,       // PMN-2 AP
            "rhs_mine_tm62m", 0.01       // TM-62M AT
        ], [
            // Items
            "Binocular", 0.80,
            "FirstAidKit", 0.63,
            "Medikit", 0.41,
            "ToolKit", 0.39
        ]
    ],
    // ------------ Liutenant ------------
    [
        [
            // Main weapons
            "rhs_weap_ak103", 0.55,
            "rhs_weap_m21a_pr", 0.33,
            "rhs_weap_m240G", 0.20,
            "rhs_weap_svds", 0.20,
            "rhs_weap_pkm", 0.38,
            "rhs_weap_m76", 0.36
        ], [
            // Secondary weapons
            "rhs_weap_makarov_pm", 1.00
        ], [
            // Ammo
            "rhs_30Rnd_545x39_7N10_AK", 0.40,
            "rhs_30Rnd_545x39_7N22_AK", 0.30,
            "rhs_30Rnd_545x39_7U1_AK", 0.28,
            "rhs_30Rnd_762x39mm_89", 0.40,
            "rhs_30Rnd_762x39mm_U", 0.36,
            "rhs_10Rnd_762x54mmR_7N1", 0.28,
            "rhs_100Rnd_762x54mmR_7N13", 0.10,
            "rhs_100Rnd_762x54mmR_7N26", 0.08,
            "rhs_100Rnd_762x54mmR_7BZ3", 0.06,
            "rhsgref_5Rnd_792x57_kar98k", 0.66,
            "rhsgref_5Rnd_762x54_m38", 0.66,
            "rhsgref_10Rnd_792x57_m76", 0.30,
            "rhs_VOG25", 0.63,
            "rhs_VOG25p", 0.55,
            "rhs_mag_9x18_8_57N181S", 0.40,
            "rhs_mag_9x18_12_57N181S", 0.30
        ], [
            // Launchers
            "rhs_weap_rpg26", 0.56,
            "rhs_weap_rpg7", 0.26,
            "rhs_weap_igla", 0.24
        ], [
            // Launcher ammo
            "rhs_rpg7_PG7VL_mag", 0.59,
            "rhs_mag_9k32_rocket", 0.58
        ], [
            // Weapon accessories
            "rhs_acc_2dpZenit", 0.31,
            "rhs_acc_1p63", 0.30,
            "rhs_acc_ekp1", 0.28,
            "rhs_acc_ekp8_02", 0.28,
            "rhs_acc_ekp8_02_pkas", 0.27,
            "rhs_acc_pso1m2", 0.19,
            "rhs_acc_pso1m2", 0.18
        ], [
            // Explosives
            "rhs_mag_rgd5", 0.83,        // RGD-5
            "rhs_mag_fakel", 0.12,       // Fakel
            "rhs_mag_fakels", 0.12,      // Fakel-S
            "rhs_mag_zarya2", 0.13,      // Zarya-2
            "rhs_mag_plamyam", 0.12,     // Plamya-M
            "rhs_mine_pmn2", 0.02,       // PMN-2 AP
            "rhs_mine_tm62m", 0.02       // TM-62M AT
        ], [
            // Items
            "Binocular", 0.80,
            "FirstAidKit", 0.63,
            "Medikit", 0.41,
            "ToolKit", 0.39
        ]
    ],
    // ------------ Captain ------------
    [
        [
            // Main weapons
            "rhs_weap_m240G", 0.40,
            "rhs_weap_svds", 0.40,
            "rhs_weap_pkm", 0.58,
            "rhs_weap_m76", 0.56
        ], [
            // Secondary weapons
            "rhs_weap_makarov_pm", 1.00
        ], [
            // Ammo
            "rhs_30Rnd_545x39_7N10_AK", 0.40,
            "rhs_30Rnd_545x39_7N22_AK", 0.30,
            "rhs_30Rnd_545x39_7U1_AK", 0.28,
            "rhs_30Rnd_762x39mm_89", 0.40,
            "rhs_30Rnd_762x39mm_U", 0.36,
            "rhs_10Rnd_762x54mmR_7N1", 0.28,
            "rhs_100Rnd_762x54mmR_7N13", 0.10,
            "rhs_100Rnd_762x54mmR_7N26", 0.08,
            "rhs_100Rnd_762x54mmR_7BZ3", 0.06,
            "rhsgref_5Rnd_792x57_kar98k", 0.66,
            "rhsgref_5Rnd_762x54_m38", 0.66,
            "rhsgref_10Rnd_792x57_m76", 0.30,
            "rhs_VOG25", 0.63,
            "rhs_VOG25p", 0.55,
            "rhs_mag_9x18_8_57N181S", 0.40,
            "rhs_mag_9x18_12_57N181S", 0.30
        ], [
            // Launchers
            "rhs_weap_rpg26", 0.66,
            "rhs_weap_rpg7", 0.36,
            "rhs_weap_igla", 0.34
        ], [
            // Launcher ammo
            "rhs_rpg7_PG7VL_mag", 0.69,
            "rhs_mag_9k32_rocket", 0.68,
            "rhs_rpg7_PG7VR_mag", 0.33,
            "rhs_rpg7_OG7V_mag", 0.25,
            "rhs_rpg7_TBG7V_mag", 0.22,
            "rhs_mag_9k38_rocket", 0.20
        ],[
            // Weapon accessories
            "rhs_acc_2dpZenit", 0.41,
            "rhs_acc_1p63", 0.50,
            "rhs_acc_ekp1", 0.38,
            "rhs_acc_ekp8_02", 0.38,
            "rhs_acc_ekp8_02_pkas", 0.37,
            "rhs_acc_pso1m2", 0.25,
            "rhs_acc_pso1m2", 0.26
        ], [
            // Explosives
            "rhs_mag_rgd5", 0.83,        // RGD-5
            "rhs_mag_fakel", 0.12,       // Fakel
            "rhs_mag_fakels", 0.12,      // Fakel-S
            "rhs_mag_zarya2", 0.13,      // Zarya-2
            "rhs_mag_plamyam", 0.12,     // Plamya-M
            "rhs_mine_pmn2", 0.02,       // PMN-2 AP
            "rhs_mine_tm62m", 0.02       // TM-62M AT
        ], [
            // Items
            "Binocular", 0.80,
            "FirstAidKit", 0.63,
            "Medikit", 0.41,
            "ToolKit", 0.39
        ]
    ],
    // ------------ Major ------------
    [
        [
            // Main weapons
            "rhs_weap_m240G", 0.50,
            "rhs_weap_svds", 0.50,
            "rhs_weap_pkm", 0.68,
            "rhs_weap_m76", 0.66
        ], [
            // Secondary weapons
            "rhs_weap_makarov_pm", 1.00
        ], [
            // Ammo
            "rhs_30Rnd_545x39_7N10_AK", 0.40,
            "rhs_30Rnd_545x39_7N22_AK", 0.30,
            "rhs_30Rnd_545x39_7U1_AK", 0.28,
            "rhs_30Rnd_762x39mm_89", 0.40,
            "rhs_30Rnd_762x39mm_U", 0.36,
            "rhs_10Rnd_762x54mmR_7N1", 0.28,
            "rhs_100Rnd_762x54mmR_7N13", 0.10,
            "rhs_100Rnd_762x54mmR_7N26", 0.08,
            "rhs_100Rnd_762x54mmR_7BZ3", 0.06,
            "rhsgref_5Rnd_792x57_kar98k", 0.66,
            "rhsgref_5Rnd_762x54_m38", 0.66,
            "rhsgref_10Rnd_792x57_m76", 0.30,
            "rhs_VOG25", 0.73,
            "rhs_VOG25p", 0.65,
            "rhs_mag_9x18_8_57N181S", 0.40,
            "rhs_mag_9x18_12_57N181S", 0.30
        ], [
            // Launchers
            "rhs_weap_rpg26", 0.96,
            "rhs_weap_rpg7", 0.76,
            "rhs_weap_igla", 0.64
        ], [
            // Launcher ammo
            "rhs_rpg7_PG7VL_mag", 0.79,
            "rhs_mag_9k32_rocket", 0.78,
            "rhs_rpg7_PG7VR_mag", 0.43,
            "rhs_rpg7_OG7V_mag", 0.35,
            "rhs_rpg7_TBG7V_mag", 0.32,
            "rhs_mag_9k38_rocket", 0.30
        ], [
            // Weapon accessories
            "rhs_acc_2dpZenit", 0.51,
            "rhs_acc_1p63", 0.60,
            "rhs_acc_ekp1", 0.48,
            "rhs_acc_ekp8_02", 0.48,
            "rhs_acc_ekp8_02_pkas", 0.47,
            "rhs_acc_pso1m2", 0.35,
            "rhs_acc_pso1m2", 0.36
        ], [
            // Explosives
            "rhs_mag_rgd5", 0.83,        // RGD-5
            "rhs_mag_fakel", 0.12,       // Fakel
            "rhs_mag_fakels", 0.12,      // Fakel-S
            "rhs_mag_zarya2", 0.13,      // Zarya-2
            "rhs_mag_plamyam", 0.12,     // Plamya-M
            "rhs_mine_pmn2", 0.02,       // PMN-2 AP
            "rhs_mine_tm62m", 0.02       // TM-62M AT
        ], [
            // Items
            "Binocular", 0.80,
            "FirstAidKit", 0.63,
            "Medikit", 0.41,
            "ToolKit", 0.39
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
            "rhs_weap_ak103", 0.50,
            "rhs_weap_ak103_1", 0.50,
            "rhs_weap_ak103_2", 0.50,
            "rhs_weap_ak104", 0.50,
            "rhs_weap_ak105", 0.50,
            "rhs_weap_ak74_3", 0.50,
            "rhs_weap_ak74m", 0.50,
            "rhs_weap_ak74m_2mag_camo", 0.50,
            "rhs_weap_ak74m_desert", 0.50,
            "rhs_weap_aks74n_npz", 0.45,
            "rhs_weap_aks74un", 0.45,
            "rhs_weap_pm63", 0.45,
            "rhs_weap_akm_zenitco01_b33", 0.40,
            "rhs_weap_ak103_zenitco01_b33", 0.40,
            "rhs_weap_ak104_zenitco01_b33", 0.40,
            "rhs_weap_ak105_zenitco01_b33", 0.40,
            "rhs_weap_ak74m_2mag_npz", 0.40,
            "rhs_weap_ak74m_zenitco01_b33", 0.40,
            "rhs_weap_akmn_gp25", 0.35,
            "rhs_weap_ak74m_fullplum_gp25_npz", 0.35,
            "rhs_weap_ak103_gp25_npz", 0.35,
            "rhs_weap_ak103_gp25", 0.35,
            "rhs_weap_pkm", 0.10,
            "rhs_weap_svds", 0.08,
            "rhs_weap_asval", 0.05
        ], [
            // Secondary weapons
            "rhs_weap_pya", 0.23,
            "rhs_weap_pp2000", 0.09
        ], [
            // Ammo
            "rhs_30Rnd_545x39_AK", 0.50,
            "rhs_30Rnd_545x39_AK_no_tracers", 0.33,
            "rhs_30Rnd_545x39_7N10_AK", 0.20,
            "rhs_30Rnd_545x39_7N22_AK", 0.15,
            "rhs_30Rnd_545x39_AK_green", 0.33,
            "rhs_30Rnd_545x39_7U1_AK", 0.14,
            "rhs_30Rnd_762x39mm", 0.50,
            "rhs_30Rnd_762x39mm_tracer", 0.33,
            "rhs_30Rnd_762x39mm_89", 0.20,
            "rhs_30Rnd_762x39mm_U", 0.18,
            "rhs_10Rnd_762x54mmR_7N1", 0.14,
            "rhs_100Rnd_762x54mmR", 0.14,
            "rhs_100Rnd_762x54mmR_green", 0.10,
            "rhs_100Rnd_762x54mmR_7N13", 0.06,
            "rhs_100Rnd_762x54mmR_7N26", 0.05,
            "rhs_100Rnd_762x54mmR_7BZ3", 0.04,
            "rhs_10Rnd_762x54mmR_7N1", 0.15,
            "rhs_20rnd_9x39mm_SP5", 0.13,
            "rhs_20rnd_9x39mm_SP6", 0.11,
            "rhs_VOG25", 0.22,
            "rhs_VOG25p", 0.15,
            "rhs_vg40tb", 0.05,
            "rhs_vg40sz", 0.05,
            "rhs_vg40op_white", 0.05,
            "rhs_vg40op_green", 0.05,
            "rhs_vg40op_red", 0.05,
            "rhs_GRD40_white", 0.05,
            "rhs_GRD40_green", 0.05,
            "rhs_GRD40_red", 0.05,
            "rhs_VG40MD_White", 0.05,
            "rhs_VG40MD_Green", 0.05,
            "rhs_VG40MD_Red", 0.05,
            "rhs_GDM40", 0.05,
            "rhs_mag_9x19mm_7n21_20", 0.20,
            "rhs_mag_9x19mm_7n31_20", 0.10,
            "rhs_mag_9x19mm_7n21_44", 0.10,
            "rhs_mag_9x19mm_7n31_44", 0.10,
            "rhs_mag_9x18_12_57N181S", 0.15,
            "rhs_mag_9x19_17", 0.25
        ], [
            // Launchers
            "rhs_weap_rpg26", 0.20,
            "rhs_weap_rpg7", 0.15,
            "rhs_weap_igla", 0.13
        ], [
            // Launcher ammo
            "rhs_rpg7_PG7VL_mag", 0.17,
            "rhs_mag_9k32_rocket", 0.16,
            "rhs_rpg7_PG7VR_mag", 0.13,
            "rhs_rpg7_OG7V_mag", 0.05,
            "rhs_rpg7_TBG7V_mag", 0.02,
            "rhs_mag_9k38_rocket", 0.01
        ],[
            // Weapon accessories
            "rhs_acc_2dpZenit", 0.13,
            "rhs_acc_1p63", 0.14,
            "rhs_acc_ekp1", 0.13,
            "rhs_acc_ekp8_02", 0.13,
            "rhs_acc_ekp8_02_pkas", 0.10,
            "rhs_acc_pso1m2", 0.09,
            "rhs_acc_rakursPM", 0.11,
            "rhs_acc_1p87", 0.13,
            "rhs_acc_ekp8_18", 0.14,
            "rhsusf_acc_compm4", 0.14,
            "rhs_acc_dtkakm", 0.22,
            "rhs_acc_ukk", 0.22,
            "rhs_acc_ak5", 0.22,
            "rhs_acc_dtk", 0.22,
            "rhs_acc_dtk1", 0.22,
            "rhs_acc_dtk2", 0.22,
            "rhs_acc_dtk3", 0.22,
            "rhs_acc_dtk4short", 0.03,
            "rhs_acc_dtk1983", 0.22
        ], [
            // Explosives
            "rhs_mag_rgd5", 0.31,        // RGD-5
            "rhs_mag_rdg2_white", 0.15,  // RGD-2 (white smoke)
            "rhs_mag_rdg2_black", 0.15,  // RGD-2 (black smoke)
            "rhs_mag_nspn_yellow", 0.20, // NSP-N (yellow flare)
            "rhs_mag_nspn_red", 0.20,    // NSP-N (red flare)
            "rhs_mag_nspn_green", 0.20,  // NSP-N (green flare)
            "rhs_mag_nspd", 0.20,        // NSP-D (red flare)
            "rhs_mag_fakel", 0.02,       // Fakel
            "rhs_mag_fakels", 0.02,      // Fakel-S
            "rhs_mag_zarya2", 0.03,      // Zarya-2
            "rhs_mag_plamyam", 0.02,     // Plamya-M
            "rhs_mine_pmn2", 0.01,       // PMN-2 AP
            "rhs_mine_tm62m", 0.01       // TM-62M AT
        ], [
            // Items
            "Binocular", 0.54,
            "FirstAidKit", 0.43,
            "Medikit", 0.21,
            "ToolKit", 0.19
        ]
    ],
    // ------------ Corporal ------------
    [
        [
            // Main weapons
            "rhs_weap_ak103", 0.50,
            "rhs_weap_ak103_1", 0.50,
            "rhs_weap_ak103_2", 0.50,
            "rhs_weap_ak104", 0.50,
            "rhs_weap_ak105", 0.50,
            "rhs_weap_ak74_3", 0.50,
            "rhs_weap_ak74m", 0.50,
            "rhs_weap_ak74m_2mag_camo", 0.50,
            "rhs_weap_ak74m_desert", 0.50,
            "rhs_weap_aks74n_npz", 0.45,
            "rhs_weap_aks74un", 0.45,
            "rhs_weap_pm63", 0.45,
            "rhs_weap_akm_zenitco01_b33", 0.40,
            "rhs_weap_ak103_zenitco01_b33", 0.40,
            "rhs_weap_ak104_zenitco01_b33", 0.40,
            "rhs_weap_ak105_zenitco01_b33", 0.40,
            "rhs_weap_ak74m_2mag_npz", 0.40,
            "rhs_weap_ak74m_zenitco01_b33", 0.40,
            "rhs_weap_akmn_gp25", 0.35,
            "rhs_weap_ak74m_fullplum_gp25_npz", 0.35,
            "rhs_weap_ak103_gp25_npz", 0.35,
            "rhs_weap_ak103_gp25", 0.35,
            "rhs_weap_pkm", 0.10,
            "rhs_weap_svds", 0.08,
            "rhs_weap_asval", 0.05
        ], [
            // Secondary weapons
            "rhs_weap_pya", 0.30,
            "rhs_weap_pp2000", 0.15
        ], [
            // Ammo
            "rhs_30Rnd_545x39_AK", 0.50,
            "rhs_30Rnd_545x39_AK_no_tracers", 0.33,
            "rhs_30Rnd_545x39_7N10_AK", 0.20,
            "rhs_30Rnd_545x39_7N22_AK", 0.15,
            "rhs_30Rnd_545x39_AK_green", 0.33,
            "rhs_30Rnd_545x39_7U1_AK", 0.14,
            "rhs_30Rnd_762x39mm", 0.50,
            "rhs_30Rnd_762x39mm_tracer", 0.33,
            "rhs_30Rnd_762x39mm_89", 0.20,
            "rhs_30Rnd_762x39mm_U", 0.18,
            "rhs_10Rnd_762x54mmR_7N1", 0.14,
            "rhs_100Rnd_762x54mmR", 0.14,
            "rhs_100Rnd_762x54mmR_green", 0.10,
            "rhs_100Rnd_762x54mmR_7N13", 0.06,
            "rhs_100Rnd_762x54mmR_7N26", 0.05,
            "rhs_100Rnd_762x54mmR_7BZ3", 0.04,
            "rhs_10Rnd_762x54mmR_7N1", 0.15,
            "rhs_20rnd_9x39mm_SP5", 0.13,
            "rhs_20rnd_9x39mm_SP6", 0.11,
            "rhs_VOG25", 0.22,
            "rhs_VOG25p", 0.15,
            "rhs_vg40tb", 0.05,
            "rhs_vg40sz", 0.05,
            "rhs_vg40op_white", 0.05,
            "rhs_vg40op_green", 0.05,
            "rhs_vg40op_red", 0.05,
            "rhs_GRD40_white", 0.05,
            "rhs_GRD40_green", 0.05,
            "rhs_GRD40_red", 0.05,
            "rhs_VG40MD_White", 0.05,
            "rhs_VG40MD_Green", 0.05,
            "rhs_VG40MD_Red", 0.05,
            "rhs_GDM40", 0.05,
            "rhs_mag_9x18_8_57N181S", 0.20,
            "rhs_mag_9x18_12_57N181S", 0.15,
            "rhs_mag_9x19_17", 0.25
        ], [
            // Launchers
            "rhs_weap_rpg26", 0.20,
            "rhs_weap_rpg7", 0.15,
            "rhs_weap_igla", 0.13
        ], [
            // Launcher ammo
            "rhs_rpg7_PG7VL_mag", 0.27,
            "rhs_mag_9k32_rocket", 0.26,
            "rhs_rpg7_PG7VR_mag", 0.20,
            "rhs_rpg7_OG7V_mag", 0.08,
            "rhs_rpg7_TBG7V_mag", 0.05,
            "rhs_mag_9k38_rocket", 0.03
        ],[
            // Weapon accessories
            "rhs_acc_2dpZenit", 0.16,
            "rhs_acc_1p63", 0.17,
            "rhs_acc_ekp1", 0.16,
            "rhs_acc_ekp8_02", 0.16,
            "rhs_acc_ekp8_02_pkas", 0.13,
            "rhs_acc_pso1m2", 0.12,
            "rhs_acc_rakursPM", 0.14,
            "rhs_acc_1p87", 0.16,
            "rhs_acc_ekp8_18", 0.17,
            "rhsusf_acc_compm4", 0.17,
            "rhs_acc_dtkakm", 0.22,
            "rhs_acc_ukk", 0.22,
            "rhs_acc_ak5", 0.22,
            "rhs_acc_dtk", 0.22,
            "rhs_acc_dtk1", 0.22,
            "rhs_acc_dtk2", 0.22,
            "rhs_acc_dtk3", 0.22,
            "rhs_acc_dtk4short", 0.03,
            "rhs_acc_dtk1983", 0.22
        ], [
            // Explosives
            "rhs_mag_rgd5", 0.31,        // RGD-5
            "rhs_mag_rdg2_white", 0.15,  // RGD-2 (white smoke)
            "rhs_mag_rdg2_black", 0.15,  // RGD-2 (black smoke)
            "rhs_mag_nspn_yellow", 0.20, // NSP-N (yellow flare)
            "rhs_mag_nspn_red", 0.20,    // NSP-N (red flare)
            "rhs_mag_nspn_green", 0.20,  // NSP-N (green flare)
            "rhs_mag_nspd", 0.20,        // NSP-D (red flare)
            "rhs_mag_fakel", 0.12,       // Fakel
            "rhs_mag_fakels", 0.12,      // Fakel-S
            "rhs_mag_zarya2", 0.13,      // Zarya-2
            "rhs_mag_plamyam", 0.12,     // Plamya-M
            "rhs_mine_pmn2", 0.01,       // PMN-2 AP
            "rhs_mine_tm62m", 0.01       // TM-62M AT
        ], [
            // Items
            "Binocular", 0.74,
            "FirstAidKit", 0.43,
            "Medikit", 0.21,
            "ToolKit", 0.19,
            "rhs_1PN138", 0.02
        ]
    ],
    // ------------ Sergeant ------------
    [
        [
            // Main weapons
            "rhs_weap_ak103", 0.50,
            "rhs_weap_ak103_1", 0.50,
            "rhs_weap_ak103_2", 0.50,
            "rhs_weap_ak104", 0.50,
            "rhs_weap_ak105", 0.50,
            "rhs_weap_ak74_3", 0.50,
            "rhs_weap_ak74m", 0.50,
            "rhs_weap_ak74m_2mag_camo", 0.50,
            "rhs_weap_ak74m_desert", 0.50,
            "rhs_weap_aks74n_npz", 0.45,
            "rhs_weap_aks74un", 0.45,
            "rhs_weap_pm63", 0.45,
            "rhs_weap_akm_zenitco01_b33", 0.40,
            "rhs_weap_ak103_zenitco01_b33", 0.40,
            "rhs_weap_ak104_zenitco01_b33", 0.40,
            "rhs_weap_ak105_zenitco01_b33", 0.40,
            "rhs_weap_ak74m_2mag_npz", 0.40,
            "rhs_weap_ak74m_zenitco01_b33", 0.40,
            "rhs_weap_akmn_gp25", 0.35,
            "rhs_weap_ak74m_fullplum_gp25_npz", 0.35,
            "rhs_weap_ak103_gp25_npz", 0.35,
            "rhs_weap_ak103_gp25", 0.35,
            "rhs_weap_pkm", 0.15,
            "rhs_weap_svds", 0.13,
            "rhs_weap_asval", 0.10
        ], [
            // Secondary weapons
            "rhs_weap_pya", 0.33,
            "rhs_weap_pp2000", 0.17
        ], [
            // Ammo
            "rhs_30Rnd_545x39_AK", 0.50,
            "rhs_30Rnd_545x39_AK_no_tracers", 0.33,
            "rhs_30Rnd_545x39_7N10_AK", 0.20,
            "rhs_30Rnd_545x39_7N22_AK", 0.15,
            "rhs_30Rnd_545x39_AK_green", 0.33,
            "rhs_30Rnd_545x39_7U1_AK", 0.14,
            "rhs_30Rnd_762x39mm", 0.50,
            "rhs_30Rnd_762x39mm_tracer", 0.33,
            "rhs_30Rnd_762x39mm_89", 0.20,
            "rhs_30Rnd_762x39mm_U", 0.18,
            "rhs_10Rnd_762x54mmR_7N1", 0.14,
            "rhs_100Rnd_762x54mmR", 0.14,
            "rhs_100Rnd_762x54mmR_green", 0.10,
            "rhs_100Rnd_762x54mmR_7N13", 0.06,
            "rhs_100Rnd_762x54mmR_7N26", 0.05,
            "rhs_100Rnd_762x54mmR_7BZ3", 0.04,
            "rhs_10Rnd_762x54mmR_7N1", 0.15,
            "rhs_20rnd_9x39mm_SP5", 0.13,
            "rhs_20rnd_9x39mm_SP6", 0.11,
            "rhs_VOG25", 0.22,
            "rhs_VOG25p", 0.15,
            "rhs_vg40tb", 0.05,
            "rhs_vg40sz", 0.05,
            "rhs_vg40op_white", 0.05,
            "rhs_vg40op_green", 0.05,
            "rhs_vg40op_red", 0.05,
            "rhs_GRD40_white", 0.05,
            "rhs_GRD40_green", 0.05,
            "rhs_GRD40_red", 0.05,
            "rhs_VG40MD_White", 0.05,
            "rhs_VG40MD_Green", 0.05,
            "rhs_VG40MD_Red", 0.05,
            "rhs_GDM40", 0.05,
            "rhs_mag_9x18_8_57N181S", 0.20,
            "rhs_mag_9x18_12_57N181S", 0.15,
            "rhs_mag_9x19_17", 0.25
        ], [
            // Launchers
            "rhs_weap_rpg26", 0.20,
            "rhs_weap_rpg7", 0.15,
            "rhs_weap_igla", 0.13
        ], [
            // Launcher ammo
            "rhs_rpg7_PG7VL_mag", 0.47,
            "rhs_mag_9k32_rocket", 0.46,
            "rhs_rpg7_PG7VR_mag", 0.40,
            "rhs_rpg7_OG7V_mag", 0.16,
            "rhs_rpg7_TBG7V_mag", 0.10,
            "rhs_mag_9k38_rocket", 0.06
        ],[
            // Weapon accessories
            "rhs_acc_2dpZenit", 0.18,
            "rhs_acc_1p63", 0.19,
            "rhs_acc_ekp1", 0.18,
            "rhs_acc_ekp8_02", 0.18,
            "rhs_acc_ekp8_02_pkas", 0.15,
            "rhs_acc_pso1m2", 0.14,
            "rhs_acc_rakursPM", 0.16,
            "rhs_acc_1p87", 0.18,
            "rhs_acc_ekp8_18", 0.19,
            "rhsusf_acc_compm4", 0.19,
            "rhs_acc_dtkakm", 0.27,
            "rhs_acc_ukk", 0.22,
            "rhs_acc_ak5", 0.22,
            "rhs_acc_dtk", 0.22,
            "rhs_acc_dtk1", 0.22,
            "rhs_acc_dtk2", 0.22,
            "rhs_acc_dtk3", 0.22,
            "rhs_acc_dtk4short", 0.05,
            "rhs_acc_dtk1983", 0.22
        ], [
            // Explosives
            "rhs_mag_rgd5", 0.31,        // RGD-5
            "rhs_mag_rdg2_white", 0.15,  // RGD-2 (white smoke)
            "rhs_mag_rdg2_black", 0.15,  // RGD-2 (black smoke)
            "rhs_mag_nspn_yellow", 0.20, // NSP-N (yellow flare)
            "rhs_mag_nspn_red", 0.20,    // NSP-N (red flare)
            "rhs_mag_nspn_green", 0.20,  // NSP-N (green flare)
            "rhs_mag_nspd", 0.20,        // NSP-D (red flare)
            "rhs_mag_fakel", 0.12,       // Fakel
            "rhs_mag_fakels", 0.12,      // Fakel-S
            "rhs_mag_zarya2", 0.13,      // Zarya-2
            "rhs_mag_plamyam", 0.12,     // Plamya-M
            "rhs_mine_pmn2", 0.01,       // PMN-2 AP
            "rhs_mine_tm62m", 0.01       // TM-62M AT
        ], [
            // Items
            "Binocular", 0.84,
            "FirstAidKit", 0.43,
            "Medikit", 0.21,
            "ToolKit", 0.19,
            "rhs_1PN138", 0.05
        ]
    ],
    // ------------ Liutenant ------------
    [
        [
            // Main weapons
            "rhs_weap_ak103_1", 0.50,
            "rhs_weap_ak103_2", 0.50,
            "rhs_weap_ak105", 0.50,
            "rhs_weap_ak74_3", 0.50,
            "rhs_weap_ak74m_2mag_camo", 0.50,
            "rhs_weap_ak74m_desert", 0.50,
            "rhs_weap_aks74n_npz", 0.45,
            "rhs_weap_aks74un", 0.45,
            "rhs_weap_pm63", 0.45,
            "rhs_weap_pkp", 0.18,
            "rhs_weap_akm_zenitco01_b33", 0.40,
            "rhs_weap_ak103_zenitco01_b33", 0.40,
            "rhs_weap_ak104_zenitco01_b33", 0.40,
            "rhs_weap_ak105_zenitco01_b33", 0.40,
            "rhs_weap_ak74m_2mag_npz", 0.40,
            "rhs_weap_ak74m_zenitco01_b33", 0.40,
            "rhs_weap_akmn_gp25", 0.35,
            "rhs_weap_ak74m_fullplum_gp25_npz", 0.35,
            "rhs_weap_ak103_gp25_npz", 0.35,
            "rhs_weap_ak103_gp25", 0.35,
            "rhs_weap_pkm", 0.15,
            "rhs_weap_svds", 0.13,
            "rhs_weap_asval", 0.12
        ], [
            // Secondary weapons
            "rhs_weap_pya", 0.63,
            "rhs_weap_pp2000", 0.20
        ], [
            // Ammo
            "rhs_30Rnd_545x39_AK", 0.50,
            "rhs_30Rnd_545x39_AK_no_tracers", 0.33,
            "rhs_30Rnd_545x39_7N10_AK", 0.20,
            "rhs_30Rnd_545x39_7N22_AK", 0.15,
            "rhs_30Rnd_545x39_AK_green", 0.33,
            "rhs_30Rnd_545x39_7U1_AK", 0.14,
            "rhs_30Rnd_762x39mm", 0.50,
            "rhs_30Rnd_762x39mm_tracer", 0.33,
            "rhs_30Rnd_762x39mm_89", 0.20,
            "rhs_30Rnd_762x39mm_U", 0.18,
            "rhs_10Rnd_762x54mmR_7N1", 0.14,
            "rhs_100Rnd_762x54mmR", 0.14,
            "rhs_100Rnd_762x54mmR_green", 0.10,
            "rhs_100Rnd_762x54mmR_7N13", 0.06,
            "rhs_100Rnd_762x54mmR_7N26", 0.05,
            "rhs_100Rnd_762x54mmR_7BZ3", 0.04,
            "rhs_10Rnd_762x54mmR_7N1", 0.15,
            "rhs_20rnd_9x39mm_SP5", 0.13,
            "rhs_20rnd_9x39mm_SP6", 0.11,
            "rhs_VOG25", 0.22,
            "rhs_VOG25p", 0.15,
            "rhs_vg40tb", 0.05,
            "rhs_vg40sz", 0.05,
            "rhs_vg40op_white", 0.05,
            "rhs_vg40op_green", 0.05,
            "rhs_vg40op_red", 0.05,
            "rhs_GRD40_white", 0.05,
            "rhs_GRD40_green", 0.05,
            "rhs_GRD40_red", 0.05,
            "rhs_VG40MD_White", 0.05,
            "rhs_VG40MD_Green", 0.05,
            "rhs_VG40MD_Red", 0.05,
            "rhs_GDM40", 0.05,
            "rhs_mag_9x18_8_57N181S", 0.20,
            "rhs_mag_9x18_12_57N181S", 0.15,
            "rhs_mag_9x19_17", 0.15
        ], [
            // Launchers
            "rhs_weap_rpg26", 0.20,
            "rhs_weap_rpg7", 0.15,
            "rhs_weap_igla", 0.13
        ], [
            // Launcher ammo
            "rhs_rpg7_PG7VL_mag", 0.57,
            "rhs_mag_9k32_rocket", 0.56,
            "rhs_rpg7_PG7VR_mag", 0.40,
            "rhs_rpg7_OG7V_mag", 0.26,
            "rhs_rpg7_TBG7V_mag", 0.20,
            "rhs_mag_9k38_rocket", 0.16
        ],[
            // Weapon accessories
            "rhs_acc_2dpZenit", 0.23,
            "rhs_acc_1p63", 0.24,
            "rhs_acc_ekp1", 0.23,
            "rhs_acc_ekp8_02", 0.23,
            "rhs_acc_ekp8_02_pkas", 0.20,
            "rhs_acc_pso1m2", 0.19,
            "rhs_acc_rakursPM", 0.21,
            "rhs_acc_1p87", 0.23,
            "rhs_acc_ekp8_18", 0.24,
            "rhsusf_acc_compm4", 0.24,
            "rhs_acc_dtkakm", 0.22,
            "rhs_acc_ukk", 0.22,
            "rhs_acc_ak5", 0.22,
            "rhs_acc_dtk", 0.22,
            "rhs_acc_dtk1", 0.22,
            "rhs_acc_dtk2", 0.22,
            "rhs_acc_dtk3", 0.22,
            "rhs_acc_dtk4short", 0.06,
            "rhs_acc_dtk1983", 0.22,
            "rhs_acc_dh520x56", 0.02
        ], [
            // Explosives
            "rhs_mag_rgd5", 0.61,        // RGD-5
            "rhs_mag_rdg2_white", 0.15,  // RGD-2 (white smoke)
            "rhs_mag_rdg2_black", 0.15,  // RGD-2 (black smoke)
            "rhs_mag_nspn_yellow", 0.20, // NSP-N (yellow flare)
            "rhs_mag_nspn_red", 0.20,    // NSP-N (red flare)
            "rhs_mag_nspn_green", 0.20,  // NSP-N (green flare)
            "rhs_mag_nspd", 0.20,        // NSP-D (red flare)
            "rhs_mag_fakel", 0.12,       // Fakel
            "rhs_mag_fakels", 0.12,      // Fakel-S
            "rhs_mag_zarya2", 0.13,      // Zarya-2
            "rhs_mag_plamyam", 0.12,     // Plamya-M
            "rhs_mine_pmn2", 0.01,       // PMN-2 AP
            "rhs_mine_tm62m", 0.01       // TM-62M AT
        ], [
            // Items
            "Binocular", 0.94,
            "FirstAidKit", 0.43,
            "Medikit", 0.21,
            "ToolKit", 0.19,
            "rhs_1PN138", 0.10
        ]
    ],
    // ------------ Captain ------------
    [
        [
            // Main weapons
            "rhs_weap_ak103_gp25_npz", 0.45,
            "rhs_weap_ak103_gp25", 0.45,
            "rhs_weap_pkm", 0.45,
            "rhs_weap_pkp", 0.35,
            "rhs_weap_svds", 0.43,
            "rhs_weap_asval", 0.30,
            "rhs_weap_asval_grip_npz", 0.22,
            "rhs_weap_svdp_wd", 0.20,
            "rhs_weap_svdp_wd_npz", 0.18,
            "rhs_weap_vss_grip", 0.10,
            "rhs_weap_vss_grip_npz", 0.10
        ], [
            // Secondary weapons
            "rhs_weap_pya", 0.73,
            "rhs_weap_pp2000", 0.50
        ], [
            // Ammo
            "rhs_30Rnd_545x39_AK", 0.50,
            "rhs_30Rnd_545x39_AK_no_tracers", 0.33,
            "rhs_30Rnd_545x39_7N10_AK", 0.20,
            "rhs_30Rnd_545x39_7N22_AK", 0.15,
            "rhs_30Rnd_545x39_AK_green", 0.33,
            "rhs_30Rnd_545x39_7U1_AK", 0.14,
            "rhs_30Rnd_762x39mm", 0.50,
            "rhs_30Rnd_762x39mm_tracer", 0.33,
            "rhs_30Rnd_762x39mm_89", 0.20,
            "rhs_30Rnd_762x39mm_U", 0.18,
            "rhs_10Rnd_762x54mmR_7N1", 0.14,
            "rhs_100Rnd_762x54mmR", 0.14,
            "rhs_100Rnd_762x54mmR_green", 0.10,
            "rhs_100Rnd_762x54mmR_7N13", 0.06,
            "rhs_100Rnd_762x54mmR_7N26", 0.05,
            "rhs_100Rnd_762x54mmR_7BZ3", 0.04,
            "rhs_10Rnd_762x54mmR_7N1", 0.15,
            "rhs_20rnd_9x39mm_SP5", 0.13,
            "rhs_20rnd_9x39mm_SP6", 0.11,
            "rhs_VOG25", 0.22,
            "rhs_VOG25p", 0.15,
            "rhs_vg40tb", 0.05,
            "rhs_vg40sz", 0.05,
            "rhs_vg40op_white", 0.05,
            "rhs_vg40op_green", 0.05,
            "rhs_vg40op_red", 0.05,
            "rhs_GRD40_white", 0.05,
            "rhs_GRD40_green", 0.05,
            "rhs_GRD40_red", 0.05,
            "rhs_VG40MD_White", 0.05,
            "rhs_VG40MD_Green", 0.05,
            "rhs_VG40MD_Red", 0.05,
            "rhs_GDM40", 0.05,
            "rhs_mag_9x18_8_57N181S", 0.20,
            "rhs_mag_9x18_12_57N181S", 0.15,
            "rhs_mag_9x19_17", 0.15
        ], [
            // Launchers
            "rhs_weap_rpg26", 0.20,
            "rhs_weap_rpg7", 0.15,
            "rhs_weap_igla", 0.13
        ], [
            // Launcher ammo
            "rhs_rpg7_PG7VL_mag", 0.57,
            "rhs_mag_9k32_rocket", 0.56,
            "rhs_rpg7_PG7VR_mag", 0.40,
            "rhs_rpg7_OG7V_mag", 0.26,
            "rhs_rpg7_TBG7V_mag", 0.20,
            "rhs_mag_9k38_rocket", 0.16
        ],[
            // Weapon accessories
            "rhs_acc_2dpZenit", 0.33,
            "rhs_acc_1p63", 0.34,
            "rhs_acc_ekp1", 0.33,
            "rhs_acc_ekp8_02", 0.33,
            "rhs_acc_ekp8_02_pkas", 0.30,
            "rhs_acc_pso1m2", 0.29,
            "rhs_acc_rakursPM", 0.31,
            "rhs_acc_1p87", 0.33,
            "rhs_acc_ekp8_18", 0.34,
            "rhsusf_acc_compm4", 0.34,
            "rhs_acc_dtk4short", 0.16,
            "rhs_acc_dh520x56", 0.15
        ], [
            // Explosives
            "rhs_mag_rgd5", 0.61,        // RGD-5
            "rhs_mag_rdg2_white", 0.15,  // RGD-2 (white smoke)
            "rhs_mag_rdg2_black", 0.15,  // RGD-2 (black smoke)
            "rhs_mag_nspn_yellow", 0.20, // NSP-N (yellow flare)
            "rhs_mag_nspn_red", 0.20,    // NSP-N (red flare)
            "rhs_mag_nspn_green", 0.20,  // NSP-N (green flare)
            "rhs_mag_nspd", 0.20,        // NSP-D (red flare)
            "rhs_mag_fakel", 0.12,       // Fakel
            "rhs_mag_fakels", 0.12,      // Fakel-S
            "rhs_mag_zarya2", 0.13,      // Zarya-2
            "rhs_mag_plamyam", 0.12,     // Plamya-M
            "rhs_mine_pmn2", 0.01,       // PMN-2 AP
            "rhs_mine_tm62m", 0.01       // TM-62M AT
        ], [
            // Items
            "Binocular", 0.94,
            "rhs_1PN138", 0.5
        ]
    ],
    // ------------ Major ------------
    [
        [
            // Main weapons
            "rhs_weap_ak103_gp25_npz", 0.35,
            "rhs_weap_ak103_gp25", 0.35,
            "rhs_weap_pkm", 0.45,
            "rhs_weap_pkp", 0.35,
            "rhs_weap_svds", 0.43,
            "rhs_weap_asval", 0.30,
            "rhs_weap_asval_grip_npz", 0.22,
            "rhs_weap_svdp_wd", 0.20,
            "rhs_weap_svdp_wd_npz", 0.18,
            "rhs_weap_vss_grip", 0.10,
            "rhs_weap_vss_grip_npz", 0.10
        ], [
            // Secondary weapons
            "rhs_weap_pya", 0.73,
            "rhs_weap_pp2000", 0.50
        ], [
            // Ammo
            "rhs_30Rnd_545x39_7N22_AK", 0.35,
            "rhs_30Rnd_762x39mm_89", 0.50,
            "rhs_30Rnd_762x39mm_U", 0.48,
            "rhs_10Rnd_762x54mmR_7N1", 0.44,
            "rhs_100Rnd_762x54mmR", 0.34,
            "rhs_100Rnd_762x54mmR_green", 0.20,
            "rhs_100Rnd_762x54mmR_7N13", 0.16,
            "rhs_100Rnd_762x54mmR_7N26", 0.15,
            "rhs_100Rnd_762x54mmR_7BZ3", 0.14,
            "rhs_10Rnd_762x54mmR_7N1", 0.25,
            "rhs_20rnd_9x39mm_SP5", 0.23,
            "rhs_20rnd_9x39mm_SP6", 0.21,
            "rhs_VOG25", 0.62,
            "rhs_VOG25p", 0.55,
            "rhs_mag_9x18_8_57N181S", 0.20,
            "rhs_mag_9x18_12_57N181S", 0.15,
            "rhs_mag_9x19_17", 0.55
        ], [
            // Launchers
            "rhs_weap_rpg26", 0.60,
            "rhs_weap_rpg7", 0.35,
            "rhs_weap_igla", 0.33
        ], [
            // Launcher ammo
            "rhs_rpg7_PG7VL_mag", 0.67,
            "rhs_mag_9k32_rocket", 0.66,
            "rhs_rpg7_PG7VR_mag", 0.50,
            "rhs_rpg7_OG7V_mag", 0.36,
            "rhs_rpg7_TBG7V_mag", 0.30,
            "rhs_mag_9k38_rocket", 0.26
        ],[
            // Weapon accessories
            "rhs_acc_2dpZenit", 0.43,
            "rhs_acc_1p63", 0.44,
            "rhs_acc_ekp1", 0.43,
            "rhs_acc_ekp8_02", 0.43,
            "rhs_acc_ekp8_02_pkas", 0.40,
            "rhs_acc_pso1m2", 0.39,
            "rhs_acc_rakursPM", 0.41,
            "rhs_acc_1p87", 0.43,
            "rhs_acc_ekp8_18", 0.44,
            "rhsusf_acc_compm4", 0.44,
            "rhs_acc_dtk4short", 0.26,
            "rhs_acc_tgpa", 0.14,
            "rhs_acc_dh520x56", 0.25
        ], [
            // Explosives
            "rhs_mag_rgd5", 0.61,        // RGD-5
            "rhs_mag_rdg2_white", 0.15,  // RGD-2 (white smoke)
            "rhs_mag_rdg2_black", 0.15,  // RGD-2 (black smoke)
            "rhs_mag_nspn_yellow", 0.20, // NSP-N (yellow flare)
            "rhs_mag_nspn_red", 0.20,    // NSP-N (red flare)
            "rhs_mag_nspn_green", 0.20,  // NSP-N (green flare)
            "rhs_mag_nspd", 0.20,        // NSP-D (red flare)
            "rhs_mag_fakel", 0.12,       // Fakel
            "rhs_mag_fakels", 0.12,      // Fakel-S
            "rhs_mag_zarya2", 0.13,      // Zarya-2
            "rhs_mag_plamyam", 0.12,     // Plamya-M
            "rhs_mine_pmn2", 0.01,       // PMN-2 AP
            "rhs_mine_tm62m", 0.01       // TM-62M AT
        ], [
            // Items
            "rhs_pdu4", 0.17,
            "rhs_1PN138", 1
        ]
    ],
    // ------------ Colonel ------------
    [
        [
            // Main weapons
            "rhs_weap_pkp", 0.65,
            "rhs_weap_svds", 0.53,
            "rhs_weap_asval", 0.50,
            "rhs_weap_asval_grip_npz", 0.42,
            "rhs_weap_svdp_wd", 0.40,
            "rhs_weap_svdp_wd_npz", 0.38,
            "rhs_weap_vss_grip", 0.10,
            "rhs_weap_vss_grip_npz", 0.10
        ], [
            // Secondary weapons
            "rhs_weap_pya", 0.73,
            "rhs_weap_pp2000", 0.50
        ], [
            // Ammo
            "rhs_30Rnd_545x39_7N22_AK", 0.45,
            "rhs_30Rnd_762x39mm_89", 0.60,
            "rhs_30Rnd_762x39mm_U", 0.58,
            "rhs_10Rnd_762x54mmR_7N1", 0.54,
            "rhs_100Rnd_762x54mmR", 0.44,
            "rhs_100Rnd_762x54mmR_green", 0.30,
            "rhs_100Rnd_762x54mmR_7N13", 0.26,
            "rhs_100Rnd_762x54mmR_7N26", 0.25,
            "rhs_100Rnd_762x54mmR_7BZ3", 0.24,
            "rhs_10Rnd_762x54mmR_7N1", 0.35,
            "rhs_20rnd_9x39mm_SP5", 0.33,
            "rhs_20rnd_9x39mm_SP6", 0.31,
            "rhs_VOG25", 0.72,
            "rhs_VOG25p", 0.65,
            "rhs_mag_9x18_8_57N181S", 0.20,
            "rhs_mag_9x18_12_57N181S", 0.15,
            "rhs_mag_9x19_17", 0.55
        ], [
            // Launchers
            "rhs_weap_rpg26", 0.70,
            "rhs_weap_rpg7", 0.75,
            "rhs_weap_igla", 0.73
        ], [
            // Launcher ammo
            "rhs_rpg7_PG7VL_mag", 0.77,
            "rhs_mag_9k32_rocket", 0.76,
            "rhs_rpg7_PG7VR_mag", 0.50,
            "rhs_rpg7_OG7V_mag", 0.36,
            "rhs_rpg7_TBG7V_mag", 0.30,
            "rhs_mag_9k38_rocket", 0.26
        ],[
            // Weapon accessories
            "rhs_acc_2dpZenit", 0.53,
            "rhs_acc_1p63", 0.54,
            "rhs_acc_ekp1", 0.53,
            "rhs_acc_ekp8_02", 0.53,
            "rhs_acc_ekp8_02_pkas", 0.50,
            "rhs_acc_pso1m2", 0.49,
            "rhs_acc_rakursPM", 0.51,
            "rhs_acc_1p87", 0.53,
            "rhs_acc_ekp8_18", 0.54,
            "rhsusf_acc_compm4", 0.54,
            "rhs_acc_dtk4short", 0.46,
            "rhs_acc_tgpa", 0.24,
            "rhs_acc_dh520x56", 0.45
        ], [
            // Explosives
            "rhs_mag_rgd5", 0.61,        // RGD-5
            "rhs_mag_rdg2_white", 0.15,  // RGD-2 (white smoke)
            "rhs_mag_rdg2_black", 0.15,  // RGD-2 (black smoke)
            "rhs_mag_nspn_yellow", 0.20, // NSP-N (yellow flare)
            "rhs_mag_nspn_red", 0.20,    // NSP-N (red flare)
            "rhs_mag_nspn_green", 0.20,  // NSP-N (green flare)
            "rhs_mag_nspd", 0.20,        // NSP-D (red flare)
            "rhs_mag_fakel", 0.12,       // Fakel
            "rhs_mag_fakels", 0.12,      // Fakel-S
            "rhs_mag_zarya2", 0.13,      // Zarya-2
            "rhs_mag_plamyam", 0.12,     // Plamya-M
            "rhs_mine_pmn2", 0.01,       // PMN-2 AP
            "rhs_mine_tm62m", 0.01       // TM-62M AT
        ], [
            // Items
            "rhs_pdu4", 0.27,
            "rhs_1PN138", 1
        ]
    ]
];

BluforLootTable = [
    // ------------ Private ------------
    [
        [
            // Main weapons

            // Assault rifles
            "rhs_weap_m16a4", 0.60,
            "rhs_weap_m16a4_carryhandle", 0.65,
            "rhs_weap_m16a4_carryhandle_M203", 0.20,
            "rhs_weap_m16a4_carryhandle_pmag", 0.45,
            "rhs_weap_m16a4_pmag", 0.45,
            
            "rhs_weap_m4", 0.60,
            "rhs_weap_m4_carryhandle", 0.65,
            "rhs_weap_m4_carryhandle_pmag", 0.45,
            "rhs_weap_m4_carryhandle_mstock", 0.45,
            "rhs_weap_m4_m203", 0.20,
            "rhs_weap_m4_m203S", 0.18,
            "rhs_weap_m4_m320", 0.17,
            "rhs_weap_m4_pmag", 0.45,
            "rhs_weap_m4_mstock", 0.45,
            
            "rhs_weap_m4a1_carryhandle", 0.60,
            "rhs_weap_m4a1_carryhandle_m203", 0.17,
            "rhs_weap_m4a1_carryhandle_m203S", 0.16,
            "rhs_weap_m4a1_carryhandle_pmag", 0.45,
            "rhs_weap_m4a1_carryhandle_mstock", 0.45,
            "rhs_weap_m4a1_blockII", 0.45,
            "rhs_weap_m4a1_blockII_bk", 0.45,
            "rhs_weap_m4a1_blockII_M203_bk", 0.15,
            "rhs_weap_m4a1_blockII_KAC_bk", 0.45,
            "rhs_weap_m4a1_blockII_d", 0.45,
            "rhs_weap_m4a1_blockII_M203_d", 0.11,
            "rhs_weap_m4a1_blockII_KAC_d", 0.40,
            "rhs_weap_m4a1_blockII_M203", 0.14,
            "rhs_weap_m4a1_blockII_KAC", 0.40,
            "rhs_weap_m4a1_blockII_wd", 0.45,
            "rhs_weap_m4a1_blockII_M203_wd", 0.13,
            "rhs_weap_m4a1_blockII_KAC_wd", 0.40,
            "rhs_weap_m4a1", 0.60,
            "rhs_weap_m4a1_d", 0.60,
            "rhs_weap_m4a1_m203s_d", 0.18,
            "rhs_weap_m4a1_d_mstock", 0.45,
            "rhs_weap_m4a1_m203", 0.19,
            "rhs_weap_m4a1_m203s", 0.17,
            "rhs_weap_m4a1_m320", 0.16,
            "rhs_weap_m4a1_pmag", 0.45,
            "rhs_weap_m4a1_mstock", 0.45,
            
            "rhs_weap_mk18", 0.40,
            "rhs_weap_mk18_bk", 0.35,
            "rhs_weap_mk18_KAC_bk", 0.30,
            "rhs_weap_mk18_d", 0.38,
            "rhs_weap_mk18_KAC_d", 0.30,
            "rhs_weap_mk18_m320", 0.11,
            "rhs_weap_mk18_KAC", 0.30,
            "rhs_weap_mk18_wd", 0.39,
            "rhs_weap_mk18_KAC_wd", 0.30,

            "rhs_weap_hk416d10", 0.40,
            "rhs_weap_hk416d10_m320", 0.12,
            "rhs_weap_hk416d10_LMT", 0.30,
            "rhs_weap_hk416d145", 0.25,
            "rhs_weap_hk416d145_m320", 0.10,

            //Shotguns
            "rhs_weap_M590_8RD", 0.15,
            "rhs_weap_M590_5RD", 0.30,
            
            // Sniper rifles
            "rhs_weap_XM2010", 0,
            "rhs_weap_XM2010_wd", 0,
            "rhs_weap_XM2010_d", 0,
            "rhs_weap_XM2010_sa", 0,

            "rhs_weap_m24sws", 0,
            "rhs_weap_m24sws_blk", 0,
            "rhs_weap_m24sws_ghillie", 0,

            "rhs_weap_sr25", 0.05,
            "rhs_weap_sr25_d", 0.05,
            "rhs_weap_sr25_ec", 0,
            "rhs_weap_sr25_ec_d", 0,
            "rhs_weap_sr25_ec_wd", 0,
            "rhs_weap_sr25_wd", 0.05,

            "rhs_weap_m14ebrri", 0,

            "rhs_weap_M107", 0,
            "rhs_weap_M107_d", 0,
            "rhs_weap_M107_w", 0,

            // Machine guns
            "rhs_weap_m240B", 0.15,
            "rhs_weap_m240B_CAP", 0.12,
            "rhs_weap_m240G", 0.10,
            "rhs_weap_m249_pip_L", 0.12,
            "rhs_weap_m249_pip_L_para", 0,
            "rhs_weap_m249_pip_L_vfg", 0,
            "rhs_weap_m249_pip_S", 0.11,
            "rhs_weap_m249_pip_S_para", 0,
            "rhs_weap_m249_pip_S_vfg", 0,
             
            "rhs_weap_m27iar", 0.13,
            "rhs_weap_m27iar_grip", 0.12,
            // Grenade launcher
            "rhs_weap_m32", 0
        ], [
            // Secondary weapons
            "rhsusf_weap_m1911a1", 0.15,
            "rhs_weap_M320", 0,
            "rhsusf_weap_m9", 0.17
        ], [
            // Ammo

            // 5.56mm AR-15 ammo
            "rhs_mag_30Rnd_556x45_Mk318_Stanag", 0.60,
            "rhs_mag_30Rnd_556x45_Mk262_Stanag", 0.55,
            "rhs_mag_30Rnd_556x45_M855A1_Stanag", 0.50,
            "rhs_mag_30Rnd_556x45_M855A1_Stanag_No_Tracer", 0.45,
            "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", 0.40,
            "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Green", 0.40,
            "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Yellow", 0.40,
            "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Orange", 0.40,
            // M249
            "rhs_200rnd_556x45_M_SAW", 0.10,
            "rhs_200rnd_556x45_B_SAW", 0.10,
            "rhs_200rnd_556x45_T_SAW", 0.10,
            "rhsusf_100Rnd_556x45_soft_pouch", 0.17,
            "rhsusf_200Rnd_556x45_soft_pouch", 0.17,
            "rhsusf_100Rnd_556x45_M200_soft_pouch", 0.17,
            // M240G
            "rhsusf_50Rnd_762x51", 0.10,
            "rhsusf_50Rnd_762x51_m61_ap", 0.08,
            "rhsusf_50Rnd_762x51_m62_tracer", 0.12,
            "rhsusf_50Rnd_762x51_m80a1epr", 0.07,
            "rhsusf_100Rnd_762x51", 0.08,
            "rhsusf_100Rnd_762x51_m61_ap", 0.05,
            "rhsusf_100Rnd_762x51_m62_tracer", 0.07,
            "rhsusf_100Rnd_762x51_m80a1epr", 0.05,
            "rhsusf_50Rnd_762x51_m993", 0.12,
            "rhsusf_100Rnd_762x51_m993", 0.06,
            // EBR/SR-25
            "rhsusf_20Rnd_762x51_m118_special_Mag", 0.10,
            "rhsusf_20Rnd_762x51_m993_Mag", 0.11,
            "rhsusf_20Rnd_762x51_m62_Mag", 0.09,
            // M107
            "rhsusf_mag_10Rnd_STD_50BMG_M33", 0.03,
            "rhsusf_mag_10Rnd_STD_50BMG_mk211", 0.02,
            // Shotgun
            "rhsusf_5Rnd_00Buck", 0.15,
            "rhsusf_5rnd_doomsday_buck", 0,
            "rhsusf_5Rnd_Slug", 0.14,
            "rhsusf_5Rnd_HE", 0.02,
            "rhsusf_5Rnd_FRAG", 0.02,
            "rhsusf_8Rnd_00Buck", 0.13,
            "rhsusf_8rnd_doomsday_buck", 0,
            "rhsusf_8Rnd_Slug", 0.12,
            "rhsusf_8Rnd_HE", 0.01,
            "rhsusf_8Rnd_FRAG", 0.01,
            // M32
            "rhsusf_mag_6Rnd_M441_HE", 0.05,
            "rhsusf_mag_6Rnd_M433_HEDP", 0.04,
            "rhsusf_mag_6Rnd_M576_Buckshot", 0.08,
            "rhsusf_mag_6Rnd_M781_Practice", 0.07,
            "rhsusf_mag_6Rnd_m4009", 0.05,
            "rhsusf_mag_6Rnd_M585_white", 0.02,
            "rhsusf_mag_6Rnd_m661_green", 0.02,
            "rhsusf_mag_6Rnd_m662_red", 0.02,
            "rhsusf_mag_6Rnd_M713_red", 0.02,
            "rhsusf_mag_6Rnd_M714_white", 0.02,
            "rhsusf_mag_6Rnd_M715_green", 0.02,
            "rhsusf_mag_6Rnd_M716_yellow", 0.02,
            // MP7
            "rhsusf_mag_40Rnd_46x30_FMJ", 0.09,
            "rhsusf_mag_40Rnd_46x30_JHP", 0.09,
            "rhsusf_mag_40Rnd_46x30_AP", 0.09,
            // XM2010
            "rhsusf_5Rnd_300winmag_xm2010", 0.30,
            // Pistol
            "rhsusf_mag_15Rnd_9x19_JHP", 0.33,
            "rhsusf_mag_15Rnd_9x19_FMJ", 0.33,
            "rhsusf_mag_7x45acp_MHP", 0.33,
            // Grenade launcher ammo
            "rhs_mag_M441_HE", 0.40,
            "rhs_mag_M433_HEDP", 0.35,
            "rhs_mag_M4009", 0.35,
            "rhs_mag_m576", 0.35,
            "rhs_mag_M585_white", 0.20,
            "rhs_mag_M661_green", 0.20,
            "rhs_mag_M662_red", 0.20,
            "rhs_mag_M713_red", 0.20,
            "rhs_mag_M714_white", 0.20,
            "rhs_mag_M715_green", 0.20,
            "rhs_mag_M716_yellow", 0.20
        ], [
            // Launchers
            "rhs_weap_fgm148", 0,
            "rhs_weap_fim92", 0.07,
            "rhs_weap_M136", 0.15,
            "rhs_weap_M136_hedp", 0.12,
            "rhs_weap_M136_hp", 0.10,
            "rhs_weap_m72a7", 0,
            "rhs_weap_smaw", 0,
            "rhs_weap_smaw_green", 0
        ], [
            // Launcher ammo
            "rhs_mag_smaw_HEAA", 0,
            "rhs_mag_smaw_HEDP", 0,
            "rhs_mag_smaw_SR", 0,
            "rhs_m72a7_mag", 0,
            "rhs_fim92_mag", 0.18,
            "rhs_fgm148_magazine_AT", 0
        ],[
            // Weapon accessories
            "rhsusf_acc_ACOG2_USMC", 0.10,
            "rhsusf_acc_ACOG3_USMC", 0.10,
            "rhsusf_acc_ACOG_USMC", 0.10,
            "rhsusf_acc_anpvs27", 0,
            
            "rhsusf_acc_EOTECH", 0.50,
            "rhsusf_acc_ELCAN", 0.08,
            "rhsusf_acc_ELCAN_ard", 0.09,
            "rhsusf_acc_ACOG", 0.10,
            "rhsusf_acc_ACOG2", 0.10,
            "rhsusf_acc_ACOG3", 0.10,
            "rhsusf_acc_ACOG_anpvs27", 0,
            "rhsusf_acc_M2A1", 0.12,
            "rhsusf_acc_eotech_552", 0.40,
            "rhsusf_acc_eotech_552_d", 0.40,
            "rhsusf_acc_compm4", 0.40,
            "rhsusf_acc_SpecterDR", 0.33,
            "rhsusf_acc_SpecterDR_OD", 0.33,
            "rhsusf_acc_SpecterDR_D", 0.33,
            "rhsusf_acc_SpecterDR_A", 0.33,
            "rhsusf_acc_ACOG_d", 0.10,
            "rhsusf_acc_ACOG_wd", 0.10,
            "rhsusf_acc_eotech_xps3", 0.25,

            "rhsusf_acc_premier_low", 0,
            "rhsusf_acc_premier_anpvs27", 0,
            "rhsusf_acc_premier", 0,
            "rhsusf_acc_LEUPOLDMK4", 0,
            "rhsusf_acc_LEUPOLDMK4_2", 0,
            "rhsusf_acc_LEUPOLDMK4_2_d", 0,

            "rhsusf_acc_harris_bipod", 0.25,
            "rhsusf_acc_grip2", 0.25,
            "rhsusf_acc_grip2_tan", 0.25,
            "rhsusf_acc_grip1", 0.25,
            "rhsusf_acc_harris_bipod", 0.25,
            "rhsusf_acc_grip3", 0.25,
            "rhsusf_acc_grip3_tan", 0.25,

            "rhsusf_acc_nt4_black", 0,
            "rhsusf_acc_nt4_tan", 0,
            "rhsusf_acc_rotex5_grey", 0,
            "rhsusf_acc_rotex5_tan", 0,
            "rhsusf_acc_SF3P556", 0.25,
            "rhsusf_acc_SFMB556", 0.25,

            "rhsusf_acc_M2010S", 0.05,

            "rhsusf_acc_anpq15side", 0.25,
            "rhsusf_acc_anpq15_top", 0.25,
            "rhsusf_acc_anpq15_wnx", 0.25,
            "rhsusf_acc_anpq15_wnx_light", 0.25,
            "rhsusf_acc_anpq15", 0.25,
            "rhsusf_acc_anpq15_light", 0.25,
            "rhsusf_acc_anpq15A", 0.25,
            "rhsusf_acc_M952V", 0.25,
            "rhsusf_acc_wmx", 0.25,
            "rhsusf_acc_wmx_bk", 0.25
        ], [
            // Explosives
            "rhs_mag_an_m14_th3", 0.15,
            "rhs_mag_an_m8hc", 0.15,
            "rhs_mag_f1", 0.15,
            "B_IR_Grenade", 0.05,
            "rhs_mag_m18_green", 0.10,
            "rhs_mag_m18_purple", 0.10,
            "rhs_mag_m18_red", 0.10,
            "rhs_mag_m18_yellow", 0.10,
            "rhs_mag_m67", 0.25,
            "rhs_mag_m7a3_cs", 0.10,
            "rhs_mag_mk84", 0.10,
            "rhs_mag_mk3a2", 0.10,
            "rhsusf_m112_mag", 0.02,
            "rhsusf_m112x4_mag", 0
        ], [
            // Items
            "Binocular", 0.54,
            "FirstAidKit", 0.43,
            "Medikit", 0.21,
            "ToolKit", 0.19,
            "lerca_1200_tan", 0,
            "rhsusf_lrf_Vector21", 0,
            "Leupold_Mk4", 0.05
        ]
    ],
    // ------------ Corporal ------------
    [
        [
            // Main weapons

            // Assault rifles
            "rhs_weap_m16a4", 0.60,
            "rhs_weap_m16a4_carryhandle", 0.65,
            "rhs_weap_m16a4_carryhandle_M203", 0.20,
            "rhs_weap_m16a4_carryhandle_pmag", 0.45,
            "rhs_weap_m16a4_pmag", 0.45,
            
            "rhs_weap_m4", 0.60,
            "rhs_weap_m4_carryhandle", 0.65,
            "rhs_weap_m4_carryhandle_pmag", 0.45,
            "rhs_weap_m4_carryhandle_mstock", 0.45,
            "rhs_weap_m4_m203", 0.20,
            "rhs_weap_m4_m203S", 0.18,
            "rhs_weap_m4_m320", 0.17,
            "rhs_weap_m4_pmag", 0.45,
            "rhs_weap_m4_mstock", 0.45,
            
            "rhs_weap_m4a1_carryhandle", 0.60,
            "rhs_weap_m4a1_carryhandle_m203", 0.17,
            "rhs_weap_m4a1_carryhandle_m203S", 0.16,
            "rhs_weap_m4a1_carryhandle_pmag", 0.45,
            "rhs_weap_m4a1_carryhandle_mstock", 0.45,
            "rhs_weap_m4a1_blockII", 0.45,
            "rhs_weap_m4a1_blockII_bk", 0.45,
            "rhs_weap_m4a1_blockII_M203_bk", 0.15,
            "rhs_weap_m4a1_blockII_KAC_bk", 0.45,
            "rhs_weap_m4a1_blockII_d", 0.45,
            "rhs_weap_m4a1_blockII_M203_d", 0.11,
            "rhs_weap_m4a1_blockII_KAC_d", 0.40,
            "rhs_weap_m4a1_blockII_M203", 0.14,
            "rhs_weap_m4a1_blockII_KAC", 0.40,
            "rhs_weap_m4a1_blockII_wd", 0.45,
            "rhs_weap_m4a1_blockII_M203_wd", 0.13,
            "rhs_weap_m4a1_blockII_KAC_wd", 0.40,
            "rhs_weap_m4a1", 0.60,
            "rhs_weap_m4a1_d", 0.60,
            "rhs_weap_m4a1_m203s_d", 0.18,
            "rhs_weap_m4a1_d_mstock", 0.45,
            "rhs_weap_m4a1_m203", 0.19,
            "rhs_weap_m4a1_m203s", 0.17,
            "rhs_weap_m4a1_m320", 0.16,
            "rhs_weap_m4a1_pmag", 0.45,
            "rhs_weap_m4a1_mstock", 0.45,
            
            "rhs_weap_mk18", 0.40,
            "rhs_weap_mk18_bk", 0.35,
            "rhs_weap_mk18_KAC_bk", 0.30,
            "rhs_weap_mk18_d", 0.38,
            "rhs_weap_mk18_KAC_d", 0.30,
            "rhs_weap_mk18_m320", 0.11,
            "rhs_weap_mk18_KAC", 0.30,
            "rhs_weap_mk18_wd", 0.39,
            "rhs_weap_mk18_KAC_wd", 0.30,

            "rhs_weap_hk416d10", 0.40,
            "rhs_weap_hk416d10_m320", 0.12,
            "rhs_weap_hk416d10_LMT", 0.30,
            "rhs_weap_hk416d145", 0.25,
            "rhs_weap_hk416d145_m320", 0.10,

            //Shotguns
            "rhs_weap_M590_8RD", 0.15,
            "rhs_weap_M590_5RD", 0.30,
            
            // Sniper rifles
            "rhs_weap_XM2010", 0,
            "rhs_weap_XM2010_wd", 0,
            "rhs_weap_XM2010_d", 0,
            "rhs_weap_XM2010_sa", 0,

            "rhs_weap_m24sws", 0,
            "rhs_weap_m24sws_blk", 0,
            "rhs_weap_m24sws_ghillie", 0,

            "rhs_weap_sr25", 0.05,
            "rhs_weap_sr25_d", 0.05,
            "rhs_weap_sr25_ec", 0,
            "rhs_weap_sr25_ec_d", 0,
            "rhs_weap_sr25_ec_wd", 0,
            "rhs_weap_sr25_wd", 0.05,

            "rhs_weap_m14ebrri", 0,

            "rhs_weap_M107", 0,
            "rhs_weap_M107_d", 0,
            "rhs_weap_M107_w", 0,

            // Machine guns
            "rhs_weap_m240B", 0.15,
            "rhs_weap_m240B_CAP", 0.12,
            "rhs_weap_m240G", 0.10,
            "rhs_weap_m249_pip_L", 0.12,
            "rhs_weap_m249_pip_L_para", 0,
            "rhs_weap_m249_pip_L_vfg", 0,
            "rhs_weap_m249_pip_S", 0.11,
            "rhs_weap_m249_pip_S_para", 0,
            "rhs_weap_m249_pip_S_vfg", 0,
             
            "rhs_weap_m27iar", 0.13,
            "rhs_weap_m27iar_grip", 0.12,
            // Grenade launcher
            "rhs_weap_m32", 0
        ], [
            // Secondary weapons
            "rhsusf_weap_m1911a1", 0.15,
            "rhs_weap_M320", 0,
            "rhsusf_weap_m9", 0.17
        ], [
            // Ammo

            // 5.56mm AR-15 ammo
            "rhs_mag_30Rnd_556x45_Mk318_Stanag", 0.60,
            "rhs_mag_30Rnd_556x45_Mk262_Stanag", 0.55,
            "rhs_mag_30Rnd_556x45_M855A1_Stanag", 0.50,
            "rhs_mag_30Rnd_556x45_M855A1_Stanag_No_Tracer", 0.45,
            "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", 0.40,
            "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Green", 0.40,
            "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Yellow", 0.40,
            "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Orange", 0.40,
            // M249
            "rhs_200rnd_556x45_M_SAW", 0.10,
            "rhs_200rnd_556x45_B_SAW", 0.10,
            "rhs_200rnd_556x45_T_SAW", 0.10,
            "rhsusf_100Rnd_556x45_soft_pouch", 0.17,
            "rhsusf_200Rnd_556x45_soft_pouch", 0.17,
            "rhsusf_100Rnd_556x45_M200_soft_pouch", 0.17,
            // M240G
            "rhsusf_50Rnd_762x51", 0.10,
            "rhsusf_50Rnd_762x51_m61_ap", 0.08,
            "rhsusf_50Rnd_762x51_m62_tracer", 0.12,
            "rhsusf_50Rnd_762x51_m80a1epr", 0.07,
            "rhsusf_100Rnd_762x51", 0.08,
            "rhsusf_100Rnd_762x51_m61_ap", 0.05,
            "rhsusf_100Rnd_762x51_m62_tracer", 0.07,
            "rhsusf_100Rnd_762x51_m80a1epr", 0.05,
            "rhsusf_50Rnd_762x51_m993", 0.12,
            "rhsusf_100Rnd_762x51_m993", 0.06,
            // EBR/SR-25
            "rhsusf_20Rnd_762x51_m118_special_Mag", 0.10,
            "rhsusf_20Rnd_762x51_m993_Mag", 0.11,
            "rhsusf_20Rnd_762x51_m62_Mag", 0.09,
            // M107
            "rhsusf_mag_10Rnd_STD_50BMG_M33", 0.03,
            "rhsusf_mag_10Rnd_STD_50BMG_mk211", 0.02,
            // Shotgun
            "rhsusf_5Rnd_00Buck", 0.15,
            "rhsusf_5rnd_doomsday_buck", 0,
            "rhsusf_5Rnd_Slug", 0.14,
            "rhsusf_5Rnd_HE", 0.02,
            "rhsusf_5Rnd_FRAG", 0.02,
            "rhsusf_8Rnd_00Buck", 0.13,
            "rhsusf_8rnd_doomsday_buck", 0,
            "rhsusf_8Rnd_Slug", 0.12,
            "rhsusf_8Rnd_HE", 0.01,
            "rhsusf_8Rnd_FRAG", 0.01,
            // M32
            "rhsusf_mag_6Rnd_M441_HE", 0.05,
            "rhsusf_mag_6Rnd_M433_HEDP", 0.04,
            "rhsusf_mag_6Rnd_M576_Buckshot", 0.08,
            "rhsusf_mag_6Rnd_M781_Practice", 0.07,
            "rhsusf_mag_6Rnd_m4009", 0.05,
            "rhsusf_mag_6Rnd_M585_white", 0.02,
            "rhsusf_mag_6Rnd_m661_green", 0.02,
            "rhsusf_mag_6Rnd_m662_red", 0.02,
            "rhsusf_mag_6Rnd_M713_red", 0.02,
            "rhsusf_mag_6Rnd_M714_white", 0.02,
            "rhsusf_mag_6Rnd_M715_green", 0.02,
            "rhsusf_mag_6Rnd_M716_yellow", 0.02,
            // MP7
            "rhsusf_mag_40Rnd_46x30_FMJ", 0.09,
            "rhsusf_mag_40Rnd_46x30_JHP", 0.09,
            "rhsusf_mag_40Rnd_46x30_AP", 0.09,
            // XM2010
            "rhsusf_5Rnd_300winmag_xm2010", 0.30,
            // Pistol
            "rhsusf_mag_15Rnd_9x19_JHP", 0.33,
            "rhsusf_mag_15Rnd_9x19_FMJ", 0.33,
            "rhsusf_mag_7x45acp_MHP", 0.33,
            // Grenade launcher ammo
            "rhs_mag_M441_HE", 0.40,
            "rhs_mag_M433_HEDP", 0.35,
            "rhs_mag_M4009", 0.35,
            "rhs_mag_m576", 0.35,
            "rhs_mag_M585_white", 0.20,
            "rhs_mag_M661_green", 0.20,
            "rhs_mag_M662_red", 0.20,
            "rhs_mag_M713_red", 0.20,
            "rhs_mag_M714_white", 0.20,
            "rhs_mag_M715_green", 0.20,
            "rhs_mag_M716_yellow", 0.20
        ], [
            // Launchers
            "rhs_weap_fgm148", 0,
            "rhs_weap_fim92", 0.07,
            "rhs_weap_M136", 0.15,
            "rhs_weap_M136_hedp", 0.12,
            "rhs_weap_M136_hp", 0.10,
            "rhs_weap_m72a7", 0,
            "rhs_weap_smaw", 0,
            "rhs_weap_smaw_green", 0
        ], [
            // Launcher ammo
            "rhs_mag_smaw_HEAA", 0,
            "rhs_mag_smaw_HEDP", 0,
            "rhs_mag_smaw_SR", 0,
            "rhs_m72a7_mag", 0,
            "rhs_fim92_mag", 0.18,
            "rhs_fgm148_magazine_AT", 0
        ],[
            // Weapon accessories
            "rhsusf_acc_ACOG2_USMC", 0.10,
            "rhsusf_acc_ACOG3_USMC", 0.10,
            "rhsusf_acc_ACOG_USMC", 0.10,
            "rhsusf_acc_anpvs27", 0,
            
            "rhsusf_acc_EOTECH", 0.50,
            "rhsusf_acc_ELCAN", 0.08,
            "rhsusf_acc_ELCAN_ard", 0.09,
            "rhsusf_acc_ACOG", 0.10,
            "rhsusf_acc_ACOG2", 0.10,
            "rhsusf_acc_ACOG3", 0.10,
            "rhsusf_acc_ACOG_anpvs27", 0,
            "rhsusf_acc_M2A1", 0.12,
            "rhsusf_acc_eotech_552", 0.40,
            "rhsusf_acc_eotech_552_d", 0.40,
            "rhsusf_acc_compm4", 0.40,
            "rhsusf_acc_SpecterDR", 0.33,
            "rhsusf_acc_SpecterDR_OD", 0.33,
            "rhsusf_acc_SpecterDR_D", 0.33,
            "rhsusf_acc_SpecterDR_A", 0.33,
            "rhsusf_acc_ACOG_d", 0.10,
            "rhsusf_acc_ACOG_wd", 0.10,
            "rhsusf_acc_eotech_xps3", 0.25,

            "rhsusf_acc_premier_low", 0,
            "rhsusf_acc_premier_anpvs27", 0,
            "rhsusf_acc_premier", 0,
            "rhsusf_acc_LEUPOLDMK4", 0,
            "rhsusf_acc_LEUPOLDMK4_2", 0,
            "rhsusf_acc_LEUPOLDMK4_2_d", 0,

            "rhsusf_acc_harris_bipod", 0.25,
            "rhsusf_acc_grip2", 0.25,
            "rhsusf_acc_grip2_tan", 0.25,
            "rhsusf_acc_grip1", 0.25,
            "rhsusf_acc_harris_bipod", 0.25,
            "rhsusf_acc_grip3", 0.25,
            "rhsusf_acc_grip3_tan", 0.25,

            "rhsusf_acc_nt4_black", 0,
            "rhsusf_acc_nt4_tan", 0,
            "rhsusf_acc_rotex5_grey", 0,
            "rhsusf_acc_rotex5_tan", 0,
            "rhsusf_acc_SF3P556", 0.25,
            "rhsusf_acc_SFMB556", 0.25,

            "rhsusf_acc_M2010S", 0.05,

            "rhsusf_acc_anpq15side", 0.25,
            "rhsusf_acc_anpq15_top", 0.25,
            "rhsusf_acc_anpq15_wnx", 0.25,
            "rhsusf_acc_anpq15_wnx_light", 0.25,
            "rhsusf_acc_anpq15", 0.25,
            "rhsusf_acc_anpq15_light", 0.25,
            "rhsusf_acc_anpq15A", 0.25,
            "rhsusf_acc_M952V", 0.25,
            "rhsusf_acc_wmx", 0.25,
            "rhsusf_acc_wmx_bk", 0.25
        ], [
            // Explosives
            "rhs_mag_an_m14_th3", 0.15,
            "rhs_mag_an_m8hc", 0.15,
            "rhs_mag_f1", 0.15,
            "B_IR_Grenade", 0.05,
            "rhs_mag_m18_green", 0.10,
            "rhs_mag_m18_purple", 0.10,
            "rhs_mag_m18_red", 0.10,
            "rhs_mag_m18_yellow", 0.10,
            "rhs_mag_m67", 0.25,
            "rhs_mag_m7a3_cs", 0.10,
            "rhs_mag_mk84", 0.10,
            "rhs_mag_mk3a2", 0.10,
            "rhsusf_m112_mag", 0.02,
            "rhsusf_m112x4_mag", 0
        ], [
            // Items
            "Binocular", 0.54,
            "FirstAidKit", 0.43,
            "Medikit", 0.21,
            "ToolKit", 0.19,
            "lerca_1200_tan", 0,
            "rhsusf_lrf_Vector21", 0,
            "Leupold_Mk4", 0.05
        ]
    ],
    // ------------ Sergeant ------------
    [
        [
            // Main weapons

            // Assault rifles
            "rhs_weap_m16a4", 0.60,
            "rhs_weap_m16a4_carryhandle", 0.65,
            "rhs_weap_m16a4_carryhandle_M203", 0.20,
            "rhs_weap_m16a4_carryhandle_pmag", 0.45,
            "rhs_weap_m16a4_pmag", 0.45,
            
            "rhs_weap_m4", 0.60,
            "rhs_weap_m4_carryhandle", 0.65,
            "rhs_weap_m4_carryhandle_pmag", 0.45,
            "rhs_weap_m4_carryhandle_mstock", 0.45,
            "rhs_weap_m4_m203", 0.20,
            "rhs_weap_m4_m203S", 0.18,
            "rhs_weap_m4_m320", 0.17,
            "rhs_weap_m4_pmag", 0.45,
            "rhs_weap_m4_mstock", 0.45,
            
            "rhs_weap_m4a1_carryhandle", 0.60,
            "rhs_weap_m4a1_carryhandle_m203", 0.17,
            "rhs_weap_m4a1_carryhandle_m203S", 0.16,
            "rhs_weap_m4a1_carryhandle_pmag", 0.45,
            "rhs_weap_m4a1_carryhandle_mstock", 0.45,
            "rhs_weap_m4a1_blockII", 0.45,
            "rhs_weap_m4a1_blockII_bk", 0.45,
            "rhs_weap_m4a1_blockII_M203_bk", 0.15,
            "rhs_weap_m4a1_blockII_KAC_bk", 0.45,
            "rhs_weap_m4a1_blockII_d", 0.45,
            "rhs_weap_m4a1_blockII_M203_d", 0.11,
            "rhs_weap_m4a1_blockII_KAC_d", 0.40,
            "rhs_weap_m4a1_blockII_M203", 0.14,
            "rhs_weap_m4a1_blockII_KAC", 0.40,
            "rhs_weap_m4a1_blockII_wd", 0.45,
            "rhs_weap_m4a1_blockII_M203_wd", 0.13,
            "rhs_weap_m4a1_blockII_KAC_wd", 0.40,
            "rhs_weap_m4a1", 0.60,
            "rhs_weap_m4a1_d", 0.60,
            "rhs_weap_m4a1_m203s_d", 0.18,
            "rhs_weap_m4a1_d_mstock", 0.45,
            "rhs_weap_m4a1_m203", 0.19,
            "rhs_weap_m4a1_m203s", 0.17,
            "rhs_weap_m4a1_m320", 0.16,
            "rhs_weap_m4a1_pmag", 0.45,
            "rhs_weap_m4a1_mstock", 0.45,
            
            "rhs_weap_mk18", 0.40,
            "rhs_weap_mk18_bk", 0.35,
            "rhs_weap_mk18_KAC_bk", 0.30,
            "rhs_weap_mk18_d", 0.38,
            "rhs_weap_mk18_KAC_d", 0.30,
            "rhs_weap_mk18_m320", 0.11,
            "rhs_weap_mk18_KAC", 0.30,
            "rhs_weap_mk18_wd", 0.39,
            "rhs_weap_mk18_KAC_wd", 0.30,

            "rhs_weap_hk416d10", 0.40,
            "rhs_weap_hk416d10_m320", 0.12,
            "rhs_weap_hk416d10_LMT", 0.30,
            "rhs_weap_hk416d145", 0.25,
            "rhs_weap_hk416d145_m320", 0.10,

            //Shotguns
            "rhs_weap_M590_8RD", 0.25,
            "rhs_weap_M590_5RD", 0.40,
            
            // Sniper rifles
            "rhs_weap_XM2010", 0.01,
            "rhs_weap_XM2010_wd", 0.01,
            "rhs_weap_XM2010_d", 0.01,
            "rhs_weap_XM2010_sa", 0.01,

            "rhs_weap_m24sws", 0.05,
            "rhs_weap_m24sws_blk", 0.05,
            "rhs_weap_m24sws_ghillie", 0.05,

            "rhs_weap_sr25", 0.05,
            "rhs_weap_sr25_d", 0.05,
            "rhs_weap_sr25_ec", 0.06,
            "rhs_weap_sr25_ec_d", 0.06,
            "rhs_weap_sr25_ec_wd", 0.06,
            "rhs_weap_sr25_wd", 0.05,

            "rhs_weap_m14ebrri", 0.09,

            "rhs_weap_M107", 0,
            "rhs_weap_M107_d", 0,
            "rhs_weap_M107_w", 0,

            // Machine guns
            "rhs_weap_m240B", 0.25,
            "rhs_weap_m240B_CAP", 0.22,
            "rhs_weap_m240G", 0.20,
            "rhs_weap_m249_pip_L", 0.22,
            "rhs_weap_m249_pip_L_para", 0.08,
            "rhs_weap_m249_pip_L_vfg", 0.08,
            "rhs_weap_m249_pip_S", 0.21,
            "rhs_weap_m249_pip_S_para", 0.07,
            "rhs_weap_m249_pip_S_vfg", 0.05,
             
            "rhs_weap_m27iar", 0.23,
            "rhs_weap_m27iar_grip", 0.22,
            // Grenade launcher
            "rhs_weap_m32", 0.02
        ], [
            // Secondary weapons
            "rhsusf_weap_m1911a1", 0.55,
            "rhs_weap_M320", 0.10,
            "rhsusf_weap_m9", 0.47
        ], [
            // Ammo

            // 5.56mm AR-15 ammo
            "rhs_mag_30Rnd_556x45_Mk318_Stanag", 0.60,
            "rhs_mag_30Rnd_556x45_Mk262_Stanag", 0.55,
            "rhs_mag_30Rnd_556x45_M855A1_Stanag", 0.50,
            "rhs_mag_30Rnd_556x45_M855A1_Stanag_No_Tracer", 0.45,
            "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", 0.40,
            "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Green", 0.40,
            "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Yellow", 0.40,
            "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Orange", 0.40,
            // M249
            "rhs_200rnd_556x45_M_SAW", 0.10,
            "rhs_200rnd_556x45_B_SAW", 0.10,
            "rhs_200rnd_556x45_T_SAW", 0.10,
            "rhsusf_100Rnd_556x45_soft_pouch", 0.17,
            "rhsusf_200Rnd_556x45_soft_pouch", 0.17,
            "rhsusf_100Rnd_556x45_M200_soft_pouch", 0.17,
            // M240G
            "rhsusf_50Rnd_762x51", 0.20,
            "rhsusf_50Rnd_762x51_m61_ap", 0.18,
            "rhsusf_50Rnd_762x51_m62_tracer", 0.22,
            "rhsusf_50Rnd_762x51_m80a1epr", 0.17,
            "rhsusf_100Rnd_762x51", 0.18,
            "rhsusf_100Rnd_762x51_m61_ap", 0.15,
            "rhsusf_100Rnd_762x51_m62_tracer", 0.17,
            "rhsusf_100Rnd_762x51_m80a1epr", 0.15,
            "rhsusf_50Rnd_762x51_m993", 0.22,
            "rhsusf_100Rnd_762x51_m993", 0.16,
            // EBR/SR-25
            "rhsusf_20Rnd_762x51_m118_special_Mag", 0.20,
            "rhsusf_20Rnd_762x51_m993_Mag", 0.21,
            "rhsusf_20Rnd_762x51_m62_Mag", 0.19,
            // M107
            "rhsusf_mag_10Rnd_STD_50BMG_M33", 0.06,
            "rhsusf_mag_10Rnd_STD_50BMG_mk211", 0.04,
            // Shotgun
            "rhsusf_5Rnd_00Buck", 0.15,
            "rhsusf_5rnd_doomsday_buck", 0,
            "rhsusf_5Rnd_Slug", 0.14,
            "rhsusf_5Rnd_HE", 0.02,
            "rhsusf_5Rnd_FRAG", 0.02,
            "rhsusf_8Rnd_00Buck", 0.13,
            "rhsusf_8rnd_doomsday_buck", 0,
            "rhsusf_8Rnd_Slug", 0.12,
            "rhsusf_8Rnd_HE", 0.01,
            "rhsusf_8Rnd_FRAG", 0.01,
            // M32
            "rhsusf_mag_6Rnd_M441_HE", 0.05,
            "rhsusf_mag_6Rnd_M433_HEDP", 0.04,
            "rhsusf_mag_6Rnd_M576_Buckshot", 0.08,
            "rhsusf_mag_6Rnd_M781_Practice", 0.07,
            "rhsusf_mag_6Rnd_m4009", 0.05,
            "rhsusf_mag_6Rnd_M585_white", 0.02,
            "rhsusf_mag_6Rnd_m661_green", 0.02,
            "rhsusf_mag_6Rnd_m662_red", 0.02,
            "rhsusf_mag_6Rnd_M713_red", 0.02,
            "rhsusf_mag_6Rnd_M714_white", 0.02,
            "rhsusf_mag_6Rnd_M715_green", 0.02,
            "rhsusf_mag_6Rnd_M716_yellow", 0.02,
            // MP7
            "rhsusf_mag_40Rnd_46x30_FMJ", 0.09,
            "rhsusf_mag_40Rnd_46x30_JHP", 0.09,
            "rhsusf_mag_40Rnd_46x30_AP", 0.09,
            // XM2010
            "rhsusf_5Rnd_300winmag_xm2010", 0.50,
            // Pistol
            "rhsusf_mag_15Rnd_9x19_JHP", 0.33,
            "rhsusf_mag_15Rnd_9x19_FMJ", 0.33,
            "rhsusf_mag_7x45acp_MHP", 0.33,
            // Grenade launcher ammo
            "rhs_mag_M441_HE", 0.55,
            "rhs_mag_M433_HEDP", 0.45,
            "rhs_mag_M4009", 0.35,
            "rhs_mag_m576", 0.35,
            "rhs_mag_M585_white", 0.20,
            "rhs_mag_M661_green", 0.20,
            "rhs_mag_M662_red", 0.20,
            "rhs_mag_M713_red", 0.20,
            "rhs_mag_M714_white", 0.20,
            "rhs_mag_M715_green", 0.20,
            "rhs_mag_M716_yellow", 0.20
        ], [
            // Launchers
            "rhs_weap_fgm148", 0.01,
            "rhs_weap_fim92", 0.07,
            "rhs_weap_M136", 0.15,
            "rhs_weap_M136_hedp", 0.12,
            "rhs_weap_M136_hp", 0.10,
            "rhs_weap_m72a7", 0.05,
            "rhs_weap_smaw", 0.07,
            "rhs_weap_smaw_green", 0.07
        ], [
            // Launcher ammo
            "rhs_mag_smaw_HEAA", 0.05,
            "rhs_mag_smaw_HEDP", 0.05,
            "rhs_mag_smaw_SR", 0.05,
            "rhs_m72a7_mag", 0.04,
            "rhs_fim92_mag", 0.28,
            "rhs_fgm148_magazine_AT", 0.05
        ],[
            // Weapon accessories
            "rhsusf_acc_ACOG2_USMC", 0.10,
            "rhsusf_acc_ACOG3_USMC", 0.10,
            "rhsusf_acc_ACOG_USMC", 0.10,
            "rhsusf_acc_anpvs27", 0.02,
            
            "rhsusf_acc_EOTECH", 0.50,
            "rhsusf_acc_ELCAN", 0.08,
            "rhsusf_acc_ELCAN_ard", 0.09,
            "rhsusf_acc_ACOG", 0.10,
            "rhsusf_acc_ACOG2", 0.10,
            "rhsusf_acc_ACOG3", 0.10,
            "rhsusf_acc_ACOG_anpvs27", 0.02,
            "rhsusf_acc_M2A1", 0.12,
            "rhsusf_acc_eotech_552", 0.40,
            "rhsusf_acc_eotech_552_d", 0.40,
            "rhsusf_acc_compm4", 0.40,
            "rhsusf_acc_SpecterDR", 0.33,
            "rhsusf_acc_SpecterDR_OD", 0.33,
            "rhsusf_acc_SpecterDR_D", 0.33,
            "rhsusf_acc_SpecterDR_A", 0.33,
            "rhsusf_acc_ACOG_d", 0.10,
            "rhsusf_acc_ACOG_wd", 0.10,
            "rhsusf_acc_eotech_xps3", 0.25,

            "rhsusf_acc_premier_low", 0.02,
            "rhsusf_acc_premier_anpvs27", 0.02,
            "rhsusf_acc_premier", 0.02,
            "rhsusf_acc_LEUPOLDMK4", 0.02,
            "rhsusf_acc_LEUPOLDMK4_2", 0.02,
            "rhsusf_acc_LEUPOLDMK4_2_d", 0.02,

            "rhsusf_acc_harris_bipod", 0.25,
            "rhsusf_acc_grip2", 0.25,
            "rhsusf_acc_grip2_tan", 0.25,
            "rhsusf_acc_grip1", 0.25,
            "rhsusf_acc_harris_bipod", 0.25,
            "rhsusf_acc_grip3", 0.25,
            "rhsusf_acc_grip3_tan", 0.25,

            "rhsusf_acc_nt4_black", 0.01,
            "rhsusf_acc_nt4_tan", 0.01,
            "rhsusf_acc_rotex5_grey", 0.01,
            "rhsusf_acc_rotex5_tan", 0.01,
            "rhsusf_acc_SF3P556", 0.25,
            "rhsusf_acc_SFMB556", 0.25,

            "rhsusf_acc_M2010S", 0.05,

            "rhsusf_acc_anpq15side", 0.25,
            "rhsusf_acc_anpq15_top", 0.25,
            "rhsusf_acc_anpq15_wnx", 0.25,
            "rhsusf_acc_anpq15_wnx_light", 0.25,
            "rhsusf_acc_anpq15", 0.25,
            "rhsusf_acc_anpq15_light", 0.25,
            "rhsusf_acc_anpq15A", 0.25,
            "rhsusf_acc_M952V", 0.25,
            "rhsusf_acc_wmx", 0.25,
            "rhsusf_acc_wmx_bk", 0.25
        ], [
            // Explosives
            "rhs_mag_an_m14_th3", 0.25,
            "rhs_mag_an_m8hc", 0.25,
            "rhs_mag_f1", 0.25,
            "B_IR_Grenade", 0.15,
            "rhs_mag_m18_green", 0.10,
            "rhs_mag_m18_purple", 0.10,
            "rhs_mag_m18_red", 0.10,
            "rhs_mag_m18_yellow", 0.10,
            "rhs_mag_m67", 0.35,
            "rhs_mag_m7a3_cs", 0.10,
            "rhs_mag_mk84", 0.10,
            "rhs_mag_mk3a2", 0.10,
            "rhsusf_m112_mag", 0.02,
            "rhsusf_m112x4_mag", 0.01
        ], [
            // Items
            "Binocular", 0.54,
            "FirstAidKit", 0.43,
            "Medikit", 0.21,
            "ToolKit", 0.19,
            "lerca_1200_tan", 0.01,
            "rhsusf_lrf_Vector21", 0.01,
            "Leupold_Mk4", 0.15
        ]
    ],
    // ------------ Liutenant ------------
    [
        [
            // Main weapons

            // Assault rifles
            "rhs_weap_m4_m203", 0.30,
            "rhs_weap_m4_m203S", 0.28,
            "rhs_weap_m4_m320", 0.27,
            
            "rhs_weap_m4a1_carryhandle_m203", 0.27,
            "rhs_weap_m4a1_carryhandle_m203S", 0.26,
            "rhs_weap_m4a1_blockII_M203_bk", 0.25,
            "rhs_weap_m4a1_blockII_M203_d", 0.21,
            "rhs_weap_m4a1_blockII_M203", 0.24,
            "rhs_weap_m4a1_blockII_M203_wd", 0.23,
            "rhs_weap_m4a1_m203", 0.29,
            "rhs_weap_m4a1_m203s", 0.27,
            "rhs_weap_m4a1_m320", 0.26,
            "rhs_weap_mk18_m320", 0.21,
            "rhs_weap_hk416d10_m320", 0.22,
            "rhs_weap_hk416d145_m320", 0.20,

            //Shotguns
            "rhs_weap_M590_8RD", 0.25,
            "rhs_weap_M590_5RD", 0.40,
            
            // Sniper rifles
            "rhs_weap_XM2010", 0.11,
            "rhs_weap_XM2010_wd", 0.11,
            "rhs_weap_XM2010_d", 0.11,
            "rhs_weap_XM2010_sa", 0.11,

            "rhs_weap_m24sws", 0.20,
            "rhs_weap_m24sws_blk", 0.20,
            "rhs_weap_m24sws_ghillie", 0.20,

            "rhs_weap_sr25", 0.15,
            "rhs_weap_sr25_d", 0.15,
            "rhs_weap_sr25_ec", 0.16,
            "rhs_weap_sr25_ec_d", 0.16,
            "rhs_weap_sr25_ec_wd", 0.16,
            "rhs_weap_sr25_wd", 0.15,

            "rhs_weap_m14ebrri", 0.19,

            "rhs_weap_M107", 0.02,
            "rhs_weap_M107_d", 0.02,
            "rhs_weap_M107_w", 0.02,

            // Machine guns
            "rhs_weap_m240B", 0.15,
            "rhs_weap_m240B_CAP", 0.12,
            "rhs_weap_m240G", 0.10,
            "rhs_weap_m249_pip_L", 0.12,
            "rhs_weap_m249_pip_L_para", 0.18,
            "rhs_weap_m249_pip_L_vfg", 0.18,
            "rhs_weap_m249_pip_S", 0.11,
            "rhs_weap_m249_pip_S_para", 0.17,
            "rhs_weap_m249_pip_S_vfg", 0.15,
             
            "rhs_weap_m27iar", 0.23,
            "rhs_weap_m27iar_grip", 0.22,
            // Grenade launcher
            "rhs_weap_m32", 0.02
        ], [
            // Secondary weapons
            "rhsusf_weap_m1911a1", 0.75,
            "rhs_weap_M320", 0.15,
            "rhsusf_weap_m9", 0.67
        ], [
            // Ammo

            // M249
            "rhs_200rnd_556x45_M_SAW", 0.10,
            "rhs_200rnd_556x45_B_SAW", 0.10,
            "rhs_200rnd_556x45_T_SAW", 0.10,
            "rhsusf_100Rnd_556x45_soft_pouch", 0.17,
            "rhsusf_200Rnd_556x45_soft_pouch", 0.17,
            "rhsusf_100Rnd_556x45_M200_soft_pouch", 0.17,
            // M240G
            "rhsusf_50Rnd_762x51_m61_ap", 0.18,
            "rhsusf_50Rnd_762x51_m62_tracer", 0.22,
            "rhsusf_50Rnd_762x51_m80a1epr", 0.17,
            "rhsusf_100Rnd_762x51_m61_ap", 0.15,
            "rhsusf_100Rnd_762x51_m62_tracer", 0.17,
            "rhsusf_100Rnd_762x51_m80a1epr", 0.15,
            "rhsusf_50Rnd_762x51_m993", 0.22,
            "rhsusf_100Rnd_762x51_m993", 0.16,
            // EBR/SR-25
            "rhsusf_20Rnd_762x51_m118_special_Mag", 0.40,
            "rhsusf_20Rnd_762x51_m993_Mag", 0.41,
            "rhsusf_20Rnd_762x51_m62_Mag", 0.39,
            // M107
            "rhsusf_mag_10Rnd_STD_50BMG_M33", 0.08,
            "rhsusf_mag_10Rnd_STD_50BMG_mk211", 0.08,
            // Shotgun
            "rhsusf_5Rnd_00Buck", 0.15,
            "rhsusf_5rnd_doomsday_buck", 0,
            "rhsusf_5Rnd_Slug", 0.14,
            "rhsusf_5Rnd_HE", 0.02,
            "rhsusf_5Rnd_FRAG", 0.02,
            "rhsusf_8Rnd_00Buck", 0.13,
            "rhsusf_8rnd_doomsday_buck", 0,
            "rhsusf_8Rnd_Slug", 0.12,
            "rhsusf_8Rnd_HE", 0.01,
            "rhsusf_8Rnd_FRAG", 0.01,
            // M32
            "rhsusf_mag_6Rnd_M441_HE", 0.05,
            "rhsusf_mag_6Rnd_M433_HEDP", 0.04,
            "rhsusf_mag_6Rnd_M576_Buckshot", 0.08,
            "rhsusf_mag_6Rnd_M781_Practice", 0.07,
            "rhsusf_mag_6Rnd_m4009", 0.05,
            "rhsusf_mag_6Rnd_M585_white", 0.02,
            "rhsusf_mag_6Rnd_m661_green", 0.02,
            "rhsusf_mag_6Rnd_m662_red", 0.02,
            "rhsusf_mag_6Rnd_M713_red", 0.02,
            "rhsusf_mag_6Rnd_M714_white", 0.02,
            "rhsusf_mag_6Rnd_M715_green", 0.02,
            "rhsusf_mag_6Rnd_M716_yellow", 0.02,
            // MP7
            "rhsusf_mag_40Rnd_46x30_FMJ", 0.09,
            "rhsusf_mag_40Rnd_46x30_JHP", 0.09,
            "rhsusf_mag_40Rnd_46x30_AP", 0.09,
            // XM2010
            "rhsusf_5Rnd_300winmag_xm2010", 0.50,
            // Grenade launcher ammo
            "rhs_mag_M441_HE", 0.55,
            "rhs_mag_M433_HEDP", 0.45,
            "rhs_mag_M4009", 0.35,
            "rhs_mag_m576", 0.35
        ], [
            // Launchers
            "rhs_weap_fgm148", 0.05,
            "rhs_weap_fim92", 0.27,
            "rhs_weap_M136", 0.25,
            "rhs_weap_M136_hedp", 0.22,
            "rhs_weap_M136_hp", 0.20,
            "rhs_weap_m72a7", 0.15,
            "rhs_weap_smaw", 0.17,
            "rhs_weap_smaw_green", 0.17
        ], [
            // Launcher ammo
            "rhs_mag_smaw_HEAA", 0.15,
            "rhs_mag_smaw_HEDP", 0.15,
            "rhs_mag_smaw_SR", 0.15,
            "rhs_m72a7_mag", 0.14,
            "rhs_fim92_mag", 0.28,
            "rhs_fgm148_magazine_AT", 0.15
        ],[
            // Weapon accessories
            "rhsusf_acc_ACOG2_USMC", 0.20,
            "rhsusf_acc_ACOG3_USMC", 0.20,
            "rhsusf_acc_ACOG_USMC", 0.20,
            "rhsusf_acc_anpvs27", 0.02,
            
            "rhsusf_acc_EOTECH", 0.50,
            "rhsusf_acc_ELCAN", 0.08,
            "rhsusf_acc_ELCAN_ard", 0.09,
            "rhsusf_acc_ACOG", 0.20,
            "rhsusf_acc_ACOG2", 0.20,
            "rhsusf_acc_ACOG3", 0.20,
            "rhsusf_acc_ACOG_anpvs27", 0.12,
            "rhsusf_acc_M2A1", 0.12,
            "rhsusf_acc_eotech_552", 0.40,
            "rhsusf_acc_eotech_552_d", 0.40,
            "rhsusf_acc_compm4", 0.40,
            "rhsusf_acc_SpecterDR", 0.33,
            "rhsusf_acc_SpecterDR_OD", 0.33,
            "rhsusf_acc_SpecterDR_D", 0.33,
            "rhsusf_acc_SpecterDR_A", 0.33,
            "rhsusf_acc_ACOG_d", 0.20,
            "rhsusf_acc_ACOG_wd", 0.20,
            "rhsusf_acc_eotech_xps3", 0.25,

            "rhsusf_acc_premier_low", 0.04,
            "rhsusf_acc_premier_anpvs27", 0.04,
            "rhsusf_acc_premier", 0.04,
            "rhsusf_acc_LEUPOLDMK4", 0.04,
            "rhsusf_acc_LEUPOLDMK4_2", 0.04,
            "rhsusf_acc_LEUPOLDMK4_2_d", 0.04,

            "rhsusf_acc_harris_bipod", 0.25,
            "rhsusf_acc_grip2", 0.25,
            "rhsusf_acc_grip2_tan", 0.25,
            "rhsusf_acc_grip1", 0.25,
            "rhsusf_acc_harris_bipod", 0.25,
            "rhsusf_acc_grip3", 0.25,
            "rhsusf_acc_grip3_tan", 0.25,

            "rhsusf_acc_nt4_black", 0.01,
            "rhsusf_acc_nt4_tan", 0.01,
            "rhsusf_acc_rotex5_grey", 0.01,
            "rhsusf_acc_rotex5_tan", 0.01,
            "rhsusf_acc_SF3P556", 0.25,
            "rhsusf_acc_SFMB556", 0.25,

            "rhsusf_acc_M2010S", 0.05,

            "rhsusf_acc_anpq15side", 0.25,
            "rhsusf_acc_anpq15_top", 0.25,
            "rhsusf_acc_anpq15_wnx", 0.25,
            "rhsusf_acc_anpq15_wnx_light", 0.25,
            "rhsusf_acc_anpq15", 0.25,
            "rhsusf_acc_anpq15_light", 0.25,
            "rhsusf_acc_anpq15A", 0.25,
            "rhsusf_acc_M952V", 0.25,
            "rhsusf_acc_wmx", 0.25,
            "rhsusf_acc_wmx_bk", 0.25
        ], [
            // Explosives
            "rhs_mag_an_m14_th3", 0.25,
            "rhs_mag_an_m8hc", 0.25,
            "rhs_mag_f1", 0.25,
            "B_IR_Grenade", 0.15,
            "rhs_mag_m18_green", 0.10,
            "rhs_mag_m18_purple", 0.10,
            "rhs_mag_m18_red", 0.10,
            "rhs_mag_m18_yellow", 0.10,
            "rhs_mag_m67", 0.35,
            "rhs_mag_m7a3_cs", 0.10,
            "rhs_mag_mk84", 0.10,
            "rhs_mag_mk3a2", 0.10,
            "rhsusf_m112_mag", 0.10,
            "rhsusf_m112x4_mag", 0.06
        ], [
            // Items
            "Binocular", 0.54,
            "FirstAidKit", 0.43,
            "Medikit", 0.21,
            "ToolKit", 0.19,
            "lerca_1200_tan", 0.05,
            "rhsusf_lrf_Vector21", 0.05,
            "Leupold_Mk4", 0.15
        ]
    ],
    // ------------ Captain ------------
    [
        [
            // Main weapons

            // Assault rifles
            "rhs_weap_m4_m203", 0.20,
            "rhs_weap_m4_m203S", 0.18,
            "rhs_weap_m4_m320", 0.17,
            
            "rhs_weap_m4a1_carryhandle_m203", 0.17,
            "rhs_weap_m4a1_carryhandle_m203S", 0.16,
            "rhs_weap_m4a1_blockII_M203_bk", 0.15,
            "rhs_weap_m4a1_blockII_M203_d", 0.11,
            "rhs_weap_m4a1_blockII_M203", 0.14,
            "rhs_weap_m4a1_blockII_M203_wd", 0.13,
            "rhs_weap_m4a1_m203", 0.19,
            "rhs_weap_m4a1_m203s", 0.17,
            "rhs_weap_m4a1_m320", 0.16,
            "rhs_weap_mk18_m320", 0.11,
            "rhs_weap_hk416d10_m320", 0.12,
            "rhs_weap_hk416d145_m320", 0.10,

            //Shotguns
            "rhs_weap_M590_8RD", 0.25,
            "rhs_weap_M590_5RD", 0.40,
            
            // Sniper rifles
            "rhs_weap_XM2010", 0.21,
            "rhs_weap_XM2010_wd", 0.21,
            "rhs_weap_XM2010_d", 0.21,
            "rhs_weap_XM2010_sa", 0.21,

            "rhs_weap_m24sws", 0.30,
            "rhs_weap_m24sws_blk", 0.30,
            "rhs_weap_m24sws_ghillie", 0.30,

            "rhs_weap_sr25", 0.25,
            "rhs_weap_sr25_d", 0.25,
            "rhs_weap_sr25_ec", 0.26,
            "rhs_weap_sr25_ec_d", 0.26,
            "rhs_weap_sr25_ec_wd", 0.26,
            "rhs_weap_sr25_wd", 0.25,

            "rhs_weap_m14ebrri", 0.39,

            "rhs_weap_M107", 0.15,
            "rhs_weap_M107_d", 0.15,
            "rhs_weap_M107_w", 0.15,

            // Machine guns
            "rhs_weap_m240B", 0.15,
            "rhs_weap_m240B_CAP", 0.12,
            "rhs_weap_m240G", 0.10,
            "rhs_weap_m249_pip_L", 0.12,
            "rhs_weap_m249_pip_L_para", 0.18,
            "rhs_weap_m249_pip_L_vfg", 0.18,
            "rhs_weap_m249_pip_S", 0.11,
            "rhs_weap_m249_pip_S_para", 0.17,
            "rhs_weap_m249_pip_S_vfg", 0.15,
             
            "rhs_weap_m27iar", 0.23,
            "rhs_weap_m27iar_grip", 0.22,
            // Grenade launcher
            "rhs_weap_m32", 0.32
        ], [
            // Secondary weapons
            "rhsusf_weap_m1911a1", 0.25,
            "rhs_weap_M320", 0.35,
            "rhsusf_weap_m9", 0.80
        ], [
            // Ammo

            // M249
            "rhs_200rnd_556x45_M_SAW", 0.10,
            "rhs_200rnd_556x45_B_SAW", 0.10,
            "rhs_200rnd_556x45_T_SAW", 0.10,
            "rhsusf_100Rnd_556x45_soft_pouch", 0.17,
            "rhsusf_200Rnd_556x45_soft_pouch", 0.17,
            "rhsusf_100Rnd_556x45_M200_soft_pouch", 0.17,
            // M240G
            "rhsusf_50Rnd_762x51_m61_ap", 0.18,
            "rhsusf_50Rnd_762x51_m62_tracer", 0.22,
            "rhsusf_50Rnd_762x51_m80a1epr", 0.17,
            "rhsusf_100Rnd_762x51_m61_ap", 0.15,
            "rhsusf_100Rnd_762x51_m62_tracer", 0.17,
            "rhsusf_100Rnd_762x51_m80a1epr", 0.15,
            "rhsusf_50Rnd_762x51_m993", 0.22,
            "rhsusf_100Rnd_762x51_m993", 0.16,
            // EBR/SR-25
            "rhsusf_20Rnd_762x51_m118_special_Mag", 0.40,
            "rhsusf_20Rnd_762x51_m993_Mag", 0.41,
            "rhsusf_20Rnd_762x51_m62_Mag", 0.39,
            // M107
            "rhsusf_mag_10Rnd_STD_50BMG_M33", 0.28,
            "rhsusf_mag_10Rnd_STD_50BMG_mk211", 0.28,
            // Shotgun
            "rhsusf_5Rnd_00Buck", 0.15,
            "rhsusf_5rnd_doomsday_buck", 0,
            "rhsusf_5Rnd_Slug", 0.14,
            "rhsusf_5Rnd_HE", 0.02,
            "rhsusf_5Rnd_FRAG", 0.02,
            "rhsusf_8Rnd_00Buck", 0.13,
            "rhsusf_8rnd_doomsday_buck", 0,
            "rhsusf_8Rnd_Slug", 0.12,
            "rhsusf_8Rnd_HE", 0.01,
            "rhsusf_8Rnd_FRAG", 0.01,
            // M32
            "rhsusf_mag_6Rnd_M441_HE", 0.05,
            "rhsusf_mag_6Rnd_M433_HEDP", 0.04,
            "rhsusf_mag_6Rnd_M576_Buckshot", 0.08,
            "rhsusf_mag_6Rnd_M781_Practice", 0.07,
            "rhsusf_mag_6Rnd_m4009", 0.05,
            "rhsusf_mag_6Rnd_M585_white", 0.02,
            "rhsusf_mag_6Rnd_m661_green", 0.02,
            "rhsusf_mag_6Rnd_m662_red", 0.02,
            "rhsusf_mag_6Rnd_M713_red", 0.02,
            "rhsusf_mag_6Rnd_M714_white", 0.02,
            "rhsusf_mag_6Rnd_M715_green", 0.02,
            "rhsusf_mag_6Rnd_M716_yellow", 0.02,
            // MP7
            "rhsusf_mag_40Rnd_46x30_FMJ", 0.09,
            "rhsusf_mag_40Rnd_46x30_JHP", 0.09,
            "rhsusf_mag_40Rnd_46x30_AP", 0.09,
            // XM2010
            "rhsusf_5Rnd_300winmag_xm2010", 0.60,
            // Grenade launcher ammo
            "rhs_mag_M441_HE", 0.55,
            "rhs_mag_M433_HEDP", 0.45,
            "rhs_mag_M4009", 0.35,
            "rhs_mag_m576", 0.35
        ], [
            // Launchers
            "rhs_weap_fgm148", 0.25,
            "rhs_weap_fim92", 0.27,
            "rhs_weap_M136", 0.25,
            "rhs_weap_M136_hedp", 0.22,
            "rhs_weap_M136_hp", 0.20,
            "rhs_weap_m72a7", 0.15,
            "rhs_weap_smaw", 0.17,
            "rhs_weap_smaw_green", 0.17
        ], [
            // Launcher ammo
            "rhs_mag_smaw_HEAA", 0.25,
            "rhs_mag_smaw_HEDP", 0.25,
            "rhs_mag_smaw_SR", 0.25,
            "rhs_m72a7_mag", 0.24,
            "rhs_fim92_mag", 0.38,
            "rhs_fgm148_magazine_AT", 0.25
        ],[
            // Weapon accessories
            "rhsusf_acc_ACOG2_USMC", 0.40,
            "rhsusf_acc_ACOG3_USMC", 0.40,
            "rhsusf_acc_ACOG_USMC", 0.40,
            "rhsusf_acc_anpvs27", 0.22,
            
            "rhsusf_acc_EOTECH", 0.50,
            "rhsusf_acc_ELCAN", 0.08,
            "rhsusf_acc_ELCAN_ard", 0.09,
            "rhsusf_acc_ACOG", 0.40,
            "rhsusf_acc_ACOG2", 0.40,
            "rhsusf_acc_ACOG3", 0.40,
            "rhsusf_acc_ACOG_anpvs27", 0.22,
            "rhsusf_acc_M2A1", 0.12,
            "rhsusf_acc_eotech_552", 0.40,
            "rhsusf_acc_eotech_552_d", 0.40,
            "rhsusf_acc_compm4", 0.40,
            "rhsusf_acc_SpecterDR", 0.33,
            "rhsusf_acc_SpecterDR_OD", 0.33,
            "rhsusf_acc_SpecterDR_D", 0.33,
            "rhsusf_acc_SpecterDR_A", 0.33,
            "rhsusf_acc_ACOG_d", 0.20,
            "rhsusf_acc_ACOG_wd", 0.20,
            "rhsusf_acc_eotech_xps3", 0.25,

            "rhsusf_acc_premier_low", 0.34,
            "rhsusf_acc_premier_anpvs27", 0.34,
            "rhsusf_acc_premier", 0.34,
            "rhsusf_acc_LEUPOLDMK4", 0.34,
            "rhsusf_acc_LEUPOLDMK4_2", 0.34,
            "rhsusf_acc_LEUPOLDMK4_2_d", 0.34,

            "rhsusf_acc_nt4_black", 0.11,
            "rhsusf_acc_nt4_tan", 0.11,
            "rhsusf_acc_rotex5_grey", 0.11,
            "rhsusf_acc_rotex5_tan", 0.11,

            "rhsusf_acc_M2010S", 0.05
        ], [
            // Explosives
            "rhs_mag_an_m14_th3", 0.25,
            "rhs_mag_an_m8hc", 0.25,
            "rhs_mag_f1", 0.25,
            "B_IR_Grenade", 0.15,
            "rhs_mag_m18_green", 0.10,
            "rhs_mag_m18_purple", 0.10,
            "rhs_mag_m18_red", 0.10,
            "rhs_mag_m18_yellow", 0.10,
            "rhs_mag_m67", 0.35,
            "rhs_mag_m7a3_cs", 0.10,
            "rhs_mag_mk84", 0.10,
            "rhs_mag_mk3a2", 0.10,
            "rhsusf_m112_mag", 0.20,
            "rhsusf_m112x4_mag", 0.12
        ], [
            // Items
            "lerca_1200_tan", 0.25,
            "rhsusf_lrf_Vector21", 0.25,
            "Leupold_Mk4", 0.35
        ]
    ],
    // ------------ Major ------------
    [
        [
            // Main weapons

            // Assault rifles
            "rhs_weap_m4_m203", 0.20,
            "rhs_weap_m4_m203S", 0.18,
            "rhs_weap_m4_m320", 0.17,
            
            "rhs_weap_m4a1_carryhandle_m203", 0.17,
            "rhs_weap_m4a1_carryhandle_m203S", 0.16,
            "rhs_weap_m4a1_blockII_M203_bk", 0.15,
            "rhs_weap_m4a1_blockII_M203_d", 0.11,
            "rhs_weap_m4a1_blockII_M203", 0.14,
            "rhs_weap_m4a1_blockII_M203_wd", 0.13,
            "rhs_weap_m4a1_m203", 0.19,
            "rhs_weap_m4a1_m203s", 0.17,
            "rhs_weap_m4a1_m320", 0.16,
            "rhs_weap_mk18_m320", 0.11,
            "rhs_weap_hk416d10_m320", 0.12,
            "rhs_weap_hk416d145_m320", 0.10,

            //Shotguns
            "rhs_weap_M590_8RD", 0.25,
            "rhs_weap_M590_5RD", 0.40,
            
            // Sniper rifles
            "rhs_weap_XM2010", 0.31,
            "rhs_weap_XM2010_wd", 0.31,
            "rhs_weap_XM2010_d", 0.31,
            "rhs_weap_XM2010_sa", 0.31,

            "rhs_weap_m24sws", 0.40,
            "rhs_weap_m24sws_blk", 0.40,
            "rhs_weap_m24sws_ghillie", 0.40,

            "rhs_weap_sr25", 0.25,
            "rhs_weap_sr25_d", 0.25,
            "rhs_weap_sr25_ec", 0.26,
            "rhs_weap_sr25_ec_d", 0.26,
            "rhs_weap_sr25_ec_wd", 0.26,
            "rhs_weap_sr25_wd", 0.25,

            "rhs_weap_m14ebrri", 0.39,

            "rhs_weap_M107", 0.15,
            "rhs_weap_M107_d", 0.15,
            "rhs_weap_M107_w", 0.15,

            // Machine guns
            "rhs_weap_m240B", 0.15,
            "rhs_weap_m240B_CAP", 0.12,
            "rhs_weap_m240G", 0.10,
            "rhs_weap_m249_pip_L", 0.12,
            "rhs_weap_m249_pip_L_para", 0.18,
            "rhs_weap_m249_pip_L_vfg", 0.18,
            "rhs_weap_m249_pip_S", 0.11,
            "rhs_weap_m249_pip_S_para", 0.17,
            "rhs_weap_m249_pip_S_vfg", 0.15,
             
            "rhs_weap_m27iar", 0.23,
            "rhs_weap_m27iar_grip", 0.22,
            // Grenade launcher
            "rhs_weap_m32", 0.32
        ], [
            // Secondary weapons
            "rhsusf_weap_m1911a1", 0.25,
            "rhs_weap_M320", 0.35,
            "rhsusf_weap_m9", 0.80
        ], [
            // Ammo

            // M249
            "rhs_200rnd_556x45_M_SAW", 0.10,
            "rhs_200rnd_556x45_B_SAW", 0.10,
            "rhs_200rnd_556x45_T_SAW", 0.10,
            "rhsusf_100Rnd_556x45_soft_pouch", 0.17,
            "rhsusf_200Rnd_556x45_soft_pouch", 0.17,
            "rhsusf_100Rnd_556x45_M200_soft_pouch", 0.17,
            // M240G
            "rhsusf_50Rnd_762x51_m61_ap", 0.18,
            "rhsusf_50Rnd_762x51_m62_tracer", 0.22,
            "rhsusf_50Rnd_762x51_m80a1epr", 0.17,
            "rhsusf_100Rnd_762x51_m61_ap", 0.15,
            "rhsusf_100Rnd_762x51_m62_tracer", 0.17,
            "rhsusf_100Rnd_762x51_m80a1epr", 0.15,
            "rhsusf_50Rnd_762x51_m993", 0.22,
            "rhsusf_100Rnd_762x51_m993", 0.16,
            // EBR/SR-25
            "rhsusf_20Rnd_762x51_m118_special_Mag", 0.40,
            "rhsusf_20Rnd_762x51_m993_Mag", 0.41,
            "rhsusf_20Rnd_762x51_m62_Mag", 0.39,
            // M107
            "rhsusf_mag_10Rnd_STD_50BMG_M33", 0.28,
            "rhsusf_mag_10Rnd_STD_50BMG_mk211", 0.28,
            // Shotgun
            "rhsusf_5Rnd_00Buck", 0.15,
            "rhsusf_5rnd_doomsday_buck", 0,
            "rhsusf_5Rnd_Slug", 0.14,
            "rhsusf_5Rnd_HE", 0.02,
            "rhsusf_5Rnd_FRAG", 0.02,
            "rhsusf_8Rnd_00Buck", 0.13,
            "rhsusf_8rnd_doomsday_buck", 0,
            "rhsusf_8Rnd_Slug", 0.12,
            "rhsusf_8Rnd_HE", 0.01,
            "rhsusf_8Rnd_FRAG", 0.01,
            // M32
            "rhsusf_mag_6Rnd_M441_HE", 0.05,
            "rhsusf_mag_6Rnd_M433_HEDP", 0.04,
            "rhsusf_mag_6Rnd_M576_Buckshot", 0.08,
            "rhsusf_mag_6Rnd_M781_Practice", 0.07,
            "rhsusf_mag_6Rnd_m4009", 0.05,
            "rhsusf_mag_6Rnd_M585_white", 0.02,
            "rhsusf_mag_6Rnd_m661_green", 0.02,
            "rhsusf_mag_6Rnd_m662_red", 0.02,
            "rhsusf_mag_6Rnd_M713_red", 0.02,
            "rhsusf_mag_6Rnd_M714_white", 0.02,
            "rhsusf_mag_6Rnd_M715_green", 0.02,
            "rhsusf_mag_6Rnd_M716_yellow", 0.02,
            // MP7
            "rhsusf_mag_40Rnd_46x30_FMJ", 0.09,
            "rhsusf_mag_40Rnd_46x30_JHP", 0.09,
            "rhsusf_mag_40Rnd_46x30_AP", 0.09,
            // XM2010
            "rhsusf_5Rnd_300winmag_xm2010", 0.60,
            // Grenade launcher ammo
            "rhs_mag_M441_HE", 0.55,
            "rhs_mag_M433_HEDP", 0.45,
            "rhs_mag_M4009", 0.35,
            "rhs_mag_m576", 0.35
        ], [
            // Launchers
            "rhs_weap_fgm148", 0.35,
            "rhs_weap_fim92", 0.27,
            "rhs_weap_M136", 0.25,
            "rhs_weap_M136_hedp", 0.22,
            "rhs_weap_M136_hp", 0.20,
            "rhs_weap_m72a7", 0.25,
            "rhs_weap_smaw", 0.27,
            "rhs_weap_smaw_green", 0.27
        ], [
            // Launcher ammo
            "rhs_mag_smaw_HEAA", 0.25,
            "rhs_mag_smaw_HEDP", 0.25,
            "rhs_mag_smaw_SR", 0.25,
            "rhs_m72a7_mag", 0.24,
            "rhs_fim92_mag", 0.38,
            "rhs_fgm148_magazine_AT", 0.25
        ], [
            // Weapon accessories
            "rhsusf_acc_ACOG2_USMC", 0.40,
            "rhsusf_acc_ACOG3_USMC", 0.40,
            "rhsusf_acc_ACOG_USMC", 0.40,
            "rhsusf_acc_anpvs27", 0.22,
            
            "rhsusf_acc_EOTECH", 0.50,
            "rhsusf_acc_ELCAN", 0.08,
            "rhsusf_acc_ELCAN_ard", 0.09,
            "rhsusf_acc_ACOG", 0.40,
            "rhsusf_acc_ACOG2", 0.40,
            "rhsusf_acc_ACOG3", 0.40,
            "rhsusf_acc_ACOG_anpvs27", 0.22,
            "rhsusf_acc_M2A1", 0.12,
            "rhsusf_acc_eotech_552", 0.40,
            "rhsusf_acc_eotech_552_d", 0.40,
            "rhsusf_acc_compm4", 0.40,
            "rhsusf_acc_SpecterDR", 0.33,
            "rhsusf_acc_SpecterDR_OD", 0.33,
            "rhsusf_acc_SpecterDR_D", 0.33,
            "rhsusf_acc_SpecterDR_A", 0.33,
            "rhsusf_acc_ACOG_d", 0.20,
            "rhsusf_acc_ACOG_wd", 0.20,
            "rhsusf_acc_eotech_xps3", 0.25,

            "rhsusf_acc_premier_low", 0.44,
            "rhsusf_acc_premier_anpvs27", 0.44,
            "rhsusf_acc_premier", 0.44,
            "rhsusf_acc_LEUPOLDMK4", 0.44,
            "rhsusf_acc_LEUPOLDMK4_2", 0.44,
            "rhsusf_acc_LEUPOLDMK4_2_d", 0.44,

            "rhsusf_acc_nt4_black", 0.21,
            "rhsusf_acc_nt4_tan", 0.21,
            "rhsusf_acc_rotex5_grey", 0.21,
            "rhsusf_acc_rotex5_tan", 0.21,

            "rhsusf_acc_M2010S", 0.05
        ], [
            // Explosives
            "rhs_mag_an_m14_th3", 0.25,
            "rhs_mag_an_m8hc", 0.25,
            "rhs_mag_f1", 0.25,
            "B_IR_Grenade", 0.15,
            "rhs_mag_m18_green", 0.10,
            "rhs_mag_m18_purple", 0.10,
            "rhs_mag_m18_red", 0.10,
            "rhs_mag_m18_yellow", 0.10,
            "rhs_mag_m67", 0.35,
            "rhs_mag_m7a3_cs", 0.10,
            "rhs_mag_mk84", 0.10,
            "rhs_mag_mk3a2", 0.10,
            "rhsusf_m112_mag", 0.20,
            "rhsusf_m112x4_mag", 0.12
        ], [
            // Items
            "lerca_1200_tan", 0.35,
            "rhsusf_lrf_Vector21", 0.35,
            "Leupold_Mk4", 0.45
        ]
    ],
    // ------------ Colonel ------------
    [
        [
            // Main weapons

            // Sniper rifles
            "rhs_weap_XM2010", 0.31,
            "rhs_weap_XM2010_wd", 0.31,
            "rhs_weap_XM2010_d", 0.31,
            "rhs_weap_XM2010_sa", 0.31,

            "rhs_weap_m24sws", 0.40,
            "rhs_weap_m24sws_blk", 0.40,
            "rhs_weap_m24sws_ghillie", 0.40,

            "rhs_weap_sr25", 0.25,
            "rhs_weap_sr25_d", 0.25,
            "rhs_weap_sr25_ec", 0.26,
            "rhs_weap_sr25_ec_d", 0.26,
            "rhs_weap_sr25_ec_wd", 0.26,
            "rhs_weap_sr25_wd", 0.25,

            "rhs_weap_m14ebrri", 0.39,

            "rhs_weap_M107", 0.15,
            "rhs_weap_M107_d", 0.15,
            "rhs_weap_M107_w", 0.15,

            // Grenade launcher
            "rhs_weap_m32", 0.52
        ], [
            // Secondary weapons
            "rhsusf_weap_m1911a1", 0.25,
            "rhs_weap_M320", 0.45,
            "rhsusf_weap_m9", 0.90
        ], [
            // Ammo

            // EBR/SR-25
            "rhsusf_20Rnd_762x51_m118_special_Mag", 0.40,
            "rhsusf_20Rnd_762x51_m993_Mag", 0.41,
            "rhsusf_20Rnd_762x51_m62_Mag", 0.39,
            // M107
            "rhsusf_mag_10Rnd_STD_50BMG_M33", 0.48,
            "rhsusf_mag_10Rnd_STD_50BMG_mk211", 0.48,
            // M32
            "rhsusf_mag_6Rnd_M441_HE", 0.25,
            "rhsusf_mag_6Rnd_M433_HEDP", 0.24,
            // XM2010
            "rhsusf_5Rnd_300winmag_xm2010", 0.40
        ], [
            // Launchers
            "rhs_weap_fgm148", 0.45,
            "rhs_weap_fim92", 0.27,
            "rhs_weap_m72a7", 0.25,
            "rhs_weap_smaw", 0.27,
            "rhs_weap_smaw_green", 0.27
        ], [
            // Launcher ammo
            "rhs_mag_smaw_HEAA", 0.25,
            "rhs_mag_smaw_HEDP", 0.25,
            "rhs_mag_smaw_SR", 0.25,
            "rhs_m72a7_mag", 0.24,
            "rhs_fim92_mag", 0.38,
            "rhs_fgm148_magazine_AT", 0.45
        ], [
            // Weapon accessories
            "rhsusf_acc_premier_low", 0.44,
            "rhsusf_acc_premier_anpvs27", 0.44,
            "rhsusf_acc_premier", 0.44,
            "rhsusf_acc_LEUPOLDMK4", 0.44,
            "rhsusf_acc_LEUPOLDMK4_2", 0.44,
            "rhsusf_acc_LEUPOLDMK4_2_d", 0.44,

            "rhsusf_acc_nt4_black", 0.31,
            "rhsusf_acc_nt4_tan", 0.31,
            "rhsusf_acc_rotex5_grey", 0.31,
            "rhsusf_acc_rotex5_tan", 0.31,

            "rhsusf_acc_M2010S", 0.05
        ], [
            // Explosives
            "rhs_mag_an_m14_th3", 0.25,
            "rhs_mag_an_m8hc", 0.25,
            "rhs_mag_f1", 0.25,
            "B_IR_Grenade", 0.15,
            "rhs_mag_m18_green", 0.10,
            "rhs_mag_m18_purple", 0.10,
            "rhs_mag_m18_red", 0.10,
            "rhs_mag_m18_yellow", 0.10,
            "rhs_mag_m67", 0.35,
            "rhs_mag_m7a3_cs", 0.10,
            "rhs_mag_mk84", 0.10,
            "rhs_mag_mk3a2", 0.10,
            "rhsusf_m112_mag", 0.40,
            "rhsusf_m112x4_mag", 0.22
        ], [
            // Items
            "lerca_1200_tan", 0.55,
            "rhsusf_lrf_Vector21", 0.55,
            "Leupold_Mk4", 0.45
        ]
    ]
];

InsurgencyVehiclesLootTable = [
    // Light vehicles
    [
        "rhsgref_ins_g_uaz_dshkm_chdkz", 1,
        "rhsgref_ins_g_gaz66_ammo", 1,
        "rhsgref_ins_g_uaz_spg9", 0.75,
        "rhsgref_ins_g_gaz66_zu23", 0.30,
        "rhsgref_ins_g_ural_zu23", 0.25
    ],
    // Light armored vehicles
    [
        "rhsgref_BRDM2_HQ_ins_g", 1,
        "rhsgref_BRDM2_ins_g", 0.85,
        "rhsgref_ins_g_btr60", 0.60,
        "rhsgref_ins_g_btr70", 0.40
    ],
    // Medium armored vehicles
    [
        "rhsgref_ins_g_bmp1", 1,
        "rhsgref_ins_g_bmp1d", 0.8,
        "rhsgref_ins_g_bmp1k", 0.7,
        "rhsgref_ins_g_bmp1p", 0.6,
        "rhsgref_ins_g_bmp2e", 1,
        "rhsgref_ins_g_bmp2", 1,
        "rhsgref_ins_g_bmp2d", 0.7,
        "rhsgref_ins_g_bmp2k", 0.6
    ],
    // Heavy armored vehicles (tanks)
    [
        "rhsgref_ins_g_t72ba", 1,
        "rhsgref_ins_g_t72bb", 0.8,
        "rhsgref_ins_g_t72bc", 0.5
    ],
    // Transport helicopters
    [
        "rhsgref_ins_g_Mi8amt", 1
    ],
    // Armed helicopters
    [
        // No armed helis for insurgents
    ],
    // Planes
    [
        // No planes for insurgents
    ]
];

OpforVehiclesLootTable = [
    // Light vehicles
    [
        "rhsusf_m1025_d_m2", 1,
        "rhsusf_m1025_d_Mk19", 0.4
    ],
    // Light armored vehicles
    [
        "rhsusf_M1220_M2_usarmy_d", 0.8,
        "rhsusf_M1230_M2_usarmy_d", 0.7,
        "rhsusf_M1232_M2_usarmy_d", 0.6,
        "rhsusf_M1237_M2_usarmy_d", 0.5,
        "rhsusf_M1220_MK19_usarmy_d", 0.3,
        "rhsusf_M1237_MK19_usarmy_d", 0.2,
        "rhsusf_m113d_usarmy_supply", 0.8,
        "rhsusf_m113d_usarmy", 0.95
    ],
    // Medium armored vehicles
    [
        "rhsusf_M1117_O", 1,
        "rhsusf_M1117_D", 1,
        "RHS_M2A2", 0.3,
        "RHS_M2A2_BUSKI", 0.2,
        "RHS_M2A3", 0.15,
        "RHS_M2A3_BUSKI", 0.1,
        "RHS_M2A3_BUSKIII", 0.08,
        "RHS_M6", 0.05
    ],
    // Heavy armored vehicles (tanks)
    [
        "rhsusf_m1a1aimd_usarmy", 1,
        "rhsusf_m1a1aim_tuski_d", 0.8,
        "rhsusf_m1a2sep1d_usarmy", 0.6,
        "rhsusf_m1a2sep1tuskid_usarmy", 0.5,
        "rhsusf_m1a2sep1tuskiid_usarmy", 0.3,
        "rhsusf_m1a1fep_d", 0.9
    ],
    // Transport helicopters
    [
        "RHS_UH60M2_d", 1,
        "RHS_MELB_MH6M", 1,
        "RHS_UH1Y_UNARMED_d", 1,
        "RHS_UH60M_ESSS2_d", 1,
        "RHS_UH60M_d", 0.8,
        "RHS_CH_47F_10", 0.9,
        "rhsusf_CH53E_USMC_D", 0.9,
        "RHS_UH1Y_FFAR_d", 0.7,
        "RHS_UH1Y_d", 0.5
    ],
    // Armed helicopters
    [
        "RHS_MELB_AH6M", 1,
        "RHS_AH64D_noradar", 0.3,
        "RHS_AH1Z", 0.3,
        "RHS_AH64D", 0.1
    ],
    // Planes
    [
        "rhs_mig29s_vvsc", 1,
        "RHS_Su25SM_vvsc", 0.2
    ]
];

BluforVehiclesLootTable = [
    // Light vehicles
    [
        "rhs_tigr_sts_msv", 1
    ],
    // Light armored vehicles
    [
        "rhsgref_BRDM2_vdv", 1,
        "rhsgref_BRDM2_ATGM_vdv", 0.4,
        "rhs_btr60_msv", 1,
        "rhs_btr70_msv", 0.9,
        "rhs_btr80_msv", 0.7,
        "rhs_btr80a_msv", 0.5
    ],
    // Medium armored vehicles
    [
        "rhs_bmp1_msv", 1,
        "rhs_bmp1d_msv", 0.9,
        "rhs_bmp1k_msv", 0.8,
        "rhs_bpm1p_msv", 0.7,
        "rhs_bmp2_msv", 0.7,
        "rhs_bmp2e_msv", 0.7,
        "rhs_bmp2d_msv", 0.6,
        "rhs_bmp2k_msv", 0.6,
        "rhs_brm1k_msv", 0.6,
        "rhs_Ob_681_2", 0.6,
        "rhs_bmp3_msv", 0.5,
        "rhs_bmp3_late_msv", 0.45,
        "rhs_bmp3m_msv", 0.3,
        "rhs_bmp3era_msv", 0.2,
        "rhs_sprut_vdv", 0.15
    ],
    // Heavy armored vehicles (tanks)
    [
        "rhs_t72ba_tv", 1,
        "rhs_t72bb_tv", 0.95,
        "rhs_t72bc_tv", 0.9,
        "rhs_t72bd_tv", 0.2,
        "rhs_t80", 0.8,
        "rhs_t80a", 0.75,
        "rhs_t80b", 0.70,
        "rhs_t80bk", 0.70,
        "rhs_t80bv", 0.70,
        "rhs_t80bvk", 0.70,
        "rhs_t80u", 0.70,
        "rhs_t80u45m", 0.65,
        "rhs_t80ue1", 0.65,
        "rhs_t80uk", 0.65,
        "rhs_t80um", 0.2,
        "rhs_t90_tv", 0.7,
        "rhs_t90a_tv", 0.2,
        "rhs_zsu234_aa", 0.1
    ],
    // Transport helicopters
    [
        "RHS_Mi8AMT_vdv", 1,
        "RHS_Mi8mt_vdv", 1,
        "RHS_Mi8mt_Cargo_vdv", 1,
        "RHS_Mi8MTV3_vdv", 0.5,
        "RHS_Mi8mtv3_Cargo_vdv", 0.5,
        "RHS_Mi8MTV3_Heavy_vdv", 0.2
    ],
    // Armed helicopters
    [
        "RHS_Mi24P_vdv", 1,
        "RHS_Mi24V_vdv", 1,
        "RHS_Ka52_vvsc", 0.2,
        "rhs_mi28n_vvsc", 0.2
    ],
    // Planes
    [
        "rhsusf_f22a", 1,
        "RHS_A10", 0.2
    ]
];

InsurgencyAmmoBoxLootTable = [
    // Difficulty level 1
    [   // [Item, quantity] (100% drop)
        ["rhs_30Rnd_545x39_AK", 20],
        ["rhs_30Rnd_545x39_AK_no_tracers", 20],
        ["rhs_30Rnd_545x39_7N10_AK", 5],
        ["rhs_30Rnd_545x39_7N22_AK", 5],
        ["rhs_30Rnd_762x39mm", 20],
        ["rhs_30Rnd_762x39mm_89", 5],
        ["rhs_30Rnd_762x39mm_U", 5],
        ["rhs_100Rnd_762x54mmR", 5],
        ["rhsgref_5Rnd_792x57_kar98k", 20],
        ["rhsgref_5Rnd_762x54_m38", 20],
        ["rhsgref_10Rnd_792x57_m76", 10],
        ["rhs_mag_9x18_8_57N181S", 10],
        ["rhs_VOG25", 10],
        ["rhs_vg40op_white", 5],
        ["rhs_GRD40_white", 5],
        ["rhs_acc_ekp1", 2],
        ["rhs_acc_ekp8_02", 2],
        ["rhs_acc_ekp8_02_pkas", 1],
        ["rhs_acc_2dpZenit", 1],
        ["rhs_mag_rgd5", 5],
        ["rhs_mag_nspn_yellow", 5],
        ["FirstAidKit", 10],
        ["Binocular", 5]
    ],
    // Level 2
    [
        ["rhs_30Rnd_545x39_AK", 20],
        ["rhs_30Rnd_545x39_AK_no_tracers", 20],
        ["rhs_30Rnd_545x39_7N10_AK", 5],
        ["rhs_30Rnd_545x39_7N22_AK", 5],
        ["rhs_30Rnd_762x39mm", 20],
        ["rhs_30Rnd_762x39mm_89", 5],
        ["rhs_30Rnd_762x39mm_U", 5],
        ["rhs_100Rnd_762x54mmR", 3],
        ["rhs_100Rnd_762x54mmR_7N13", 2],
        ["rhsgref_5Rnd_792x57_kar98k", 20],
        ["rhsgref_5Rnd_762x54_m38", 20],
        ["rhsgref_10Rnd_792x57_m76", 10],
        ["rhs_mag_9x18_8_57N181S", 10],
        ["rhs_VOG25", 10],
        ["rhs_VOG25p", 5],
        ["rhs_vg40op_white", 5],
        ["rhs_GRD40_white", 5],
        ["rhs_acc_ekp1", 2],
        ["rhs_acc_ekp8_02", 2],
        ["rhs_acc_ekp8_02_pkas", 1],
        ["rhs_acc_2dpZenit", 1],
        ["rhs_acc_pso1m2", 1],
        ["rhs_mag_rgd5", 5],
        ["rhs_mag_fakel", 5],
        ["rhs_mag_nspn_yellow", 5],
        ["FirstAidKit", 10],
        ["Binocular", 5],
        ["rhs_rpg7_PG7VL_mag", 2]
    ],
    // Level 3
    [
        ["rhs_30Rnd_545x39_AK", 20],
        ["rhs_30Rnd_545x39_7N10_AK", 5],
        ["rhs_30Rnd_545x39_7N22_AK", 5],
        ["rhs_30Rnd_762x39mm_89", 10],
        ["rhs_30Rnd_762x39mm_U", 5],
        ["rhs_100Rnd_762x54mmR", 3],
        ["rhs_100Rnd_762x54mmR_7N13", 2],
        ["rhsgref_5Rnd_792x57_kar98k", 20],
        ["rhsgref_5Rnd_762x54_m38", 20],
        ["rhsgref_10Rnd_792x57_m76", 10],
        ["rhs_mag_9x18_8_57N181S", 10],
        ["rhs_VOG25", 10],
        ["rhs_VOG25p", 5],
        ["rhs_vg40op_white", 5],
        ["rhs_GRD40_white", 5],
        ["rhs_acc_ekp1", 2],
        ["rhs_acc_ekp8_02", 2],
        ["rhs_acc_ekp8_02_pkas", 1],
        ["rhs_acc_2dpZenit", 1],
        ["rhs_acc_pso1m2", 1],
        ["rhs_acc_pso1m21", 1],
        ["rhs_mag_rgd5", 10],
        ["rhs_mag_fakel", 10],
        ["rhs_mag_fakels", 5],
        ["rhs_mag_nspn_yellow", 5],
        ["FirstAidKit", 10],
        ["Binocular", 5],
        ["rhs_rpg7_PG7VL_mag", 5],
        ["rhs_mag_9k32_rocket", 2]
    ]
];

OpforAmmoBoxLootTable = [
    // Difficulty level 1
    [
        // [Item, quantity] (100% drop rate)
        ["rhs_30Rnd_545x39_AK", 15],
        ["rhs_30Rnd_545x39_AK_no_tracers", 15],
        ["rhs_30Rnd_545x39_7N10_AK", 10],
        ["rhs_30Rnd_545x39_7N22_AK", 10],
        ["rhs_30Rnd_545x39_7U1_AK", 5],
        ["rhs_30Rnd_762x39mm", 15],
        ["rhs_30Rnd_762x39mm_tracer", 15],
        ["rhs_30Rnd_762x39mm_89", 10],
        ["rhs_30Rnd_762x39mm_U", 10],
        ["rhs_10Rnd_762x54mmR_7N1", 5],
        ["rhs_100Rnd_762x54mmR", 5],
        ["rhs_VOG25", 10],
        ["rhs_VOG25p", 5],
        ["rhs_vg40op_green", 5],
        ["rhs_GRD40_green", 5],
        ["rhs_VG40MD_Green", 5],
        ["rhs_mag_9x19_17", 10],
        ["rhs_rpg7_PG7VL_mag", 2],
        ["rhs_acc_2dpZenit", 2],
        ["rhs_acc_ekp1", 2],
        ["rhs_acc_ekp8_02", 1],
        ["rhs_acc_ekp8_02_pkas", 1],
        ["rhs_acc_pso1m2", 1],
        ["rhs_acc_rakursPM", 1],
        ["rhsusf_acc_compm4", 2],
        ["rhs_mag_rgd5", 10],
        ["rhs_mag_nspn_green", 5],
        ["FirstAidKit", 10],
        ["Binocular", 5]
    ],
    // Level 2
    [
        ["rhs_30Rnd_545x39_AK", 10],
        ["rhs_30Rnd_545x39_AK_no_tracers", 10],
        ["rhs_30Rnd_545x39_7N10_AK", 15],
        ["rhs_30Rnd_545x39_7N22_AK", 15],
        ["rhs_30Rnd_545x39_7U1_AK", 10],
        ["rhs_30Rnd_762x39mm", 10],
        ["rhs_30Rnd_762x39mm_tracer", 10],
        ["rhs_30Rnd_762x39mm_89", 15],
        ["rhs_30Rnd_762x39mm_U", 15],
        ["rhs_10Rnd_762x54mmR_7N1", 10],
        ["rhs_100Rnd_762x54mmR", 5],
        ["rhs_VOG25", 10],
        ["rhs_VOG25p", 10],
        ["rhs_vg40op_green", 5],
        ["rhs_GRD40_green", 5],
        ["rhs_VG40MD_Green", 5],
        ["rhs_mag_9x19_17", 10],
        ["rhs_rpg7_PG7VL_mag", 4],
        ["rhs_mag_9k32_rocket", 2],
        ["rhs_acc_2dpZenit", 2],
        ["rhs_acc_ekp1", 2],
        ["rhs_acc_ekp8_02", 1],
        ["rhs_acc_ekp8_02_pkas", 1],
        ["rhs_acc_pso1m2", 2],
        ["rhs_acc_pso1m21", 1],
        ["rhs_acc_rakursPM", 1],
        ["rhsusf_acc_compm4", 2],
        ["rhs_mag_rgd5", 15],
        ["rhs_mag_nspn_green", 5],
        ["FirstAidKit", 10],
        ["Binocular", 5]
    ],
    // Level 3
    [
        ["rhs_30Rnd_545x39_AK", 10],
        ["rhs_30Rnd_545x39_AK_no_tracers", 10],
        ["rhs_30Rnd_545x39_7N10_AK", 15],
        ["rhs_30Rnd_545x39_7N22_AK", 15],
        ["rhs_30Rnd_545x39_7U1_AK", 10],
        ["rhs_30Rnd_762x39mm", 10],
        ["rhs_30Rnd_762x39mm_tracer", 10],
        ["rhs_30Rnd_762x39mm_89", 15],
        ["rhs_30Rnd_762x39mm_U", 15],
        ["rhs_10Rnd_762x54mmR_7N1", 10],
        ["rhs_100Rnd_762x54mmR_7N13", 2],
        ["rhs_100Rnd_762x54mmR_7N13", 2],
        ["rhs_100Rnd_762x54mmR_7N26", 1],
        ["rhs_100Rnd_762x54mmR_7BZ3", 1],
        ["rhs_VOG25", 10],
        ["rhs_VOG25p", 10],
        ["rhs_vg40op_green", 5],
        ["rhs_GRD40_green", 5],
        ["rhs_VG40MD_Green", 5],
        ["rhs_mag_9x19_17", 10],
        ["rhs_rpg7_PG7VL_mag", 4],
        ["rhs_mag_9k32_rocket", 2],
        ["rhs_acc_2dpZenit", 2],
        ["rhs_acc_ekp1", 2],
        ["rhs_acc_ekp8_02", 2],
        ["rhs_acc_ekp8_02_pkas", 2],
        ["rhs_acc_pso1m2", 2],
        ["rhs_acc_pso1m21", 2],
        ["rhs_acc_rakursPM", 2],
        ["rhsusf_acc_compm4", 2],
        ["rhs_acc_dtk4short", 1],
        ["rhs_mag_rgd5", 15],
        ["rhs_mag_nspn_green", 5],
        ["FirstAidKit", 10],
        ["Binocular", 5]
    ]
];

BluforAmmoBoxLootTable = [
    // Difficulty level 1
    [
        // [Item, quantity] (100% drop)
        ["rhs_mag_30Rnd_556x45_Mk318_Stanag", 15],
        ["rhs_mag_30Rnd_556x45_Mk262_Stanag", 15],
        ["rhs_mag_30Rnd_556x45_M855A1_Stanag", 5],
        ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", 5],
        ["rhs_200rnd_556x45_M_SAW", 3],
        ["rhsusf_100Rnd_556x45_soft_pouch", 5],
        ["rhsusf_50Rnd_762x51", 3],
        ["rhsusf_100Rnd_762x51", 3],
        ["rhsusf_20Rnd_762x51_m993_Mag", 10],
        ["rhsusf_mag_10Rnd_STD_50BMG_M33", 3],
        ["rhsusf_5Rnd_00Buck", 10],
        ["rhsusf_8Rnd_00Buck", 10],
        ["rhsusf_mag_40Rnd_46x30_FMJ", 10],
        ["rhsusf_5Rnd_300winmag_xm2010", 5],
        ["rhsusf_mag_15Rnd_9x19_JHP", 10],
        ["rhsusf_mag_7x45acp_MHP", 10],
        ["rhs_mag_M441_HE", 10],
        ["rhs_mag_M433_HEDP", 5],
        ["rhs_mag_M662_red", 5],
        ["rhs_mag_M713_red", 5],
        ["rhs_mag_smaw_HEAA", 2],
        ["rhsusf_acc_ACOG", 1],
        ["rhsusf_acc_eotech_552", 3],
        ["rhsusf_acc_compm4", 3],
        ["rhsusf_acc_eotech_xps3", 1],
        ["rhsusf_acc_harris_bipod", 2],
        ["rhs_mag_m67", 10],
        ["rhs_mag_m18_red", 5],
        ["rhs_mag_m7a3_cs", 5],
        ["Binocular", 5],
        ["FirstAidKit", 10]
    ],
    // Level 2
    [
        // [Item, quantity] (100% drop)
        ["rhs_mag_30Rnd_556x45_Mk318_Stanag", 12],
        ["rhs_mag_30Rnd_556x45_Mk262_Stanag", 12],
        ["rhs_mag_30Rnd_556x45_M855A1_Stanag", 10],
        ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", 10],
        ["rhs_200rnd_556x45_B_SAW", 3],
        ["rhsusf_100Rnd_556x45_soft_pouch", 5],
        ["rhsusf_50Rnd_762x51", 3],
        ["rhsusf_100Rnd_762x51", 2],
        ["rhsusf_100Rnd_762x51_m61_ap", 1],
        ["rhsusf_100Rnd_762x51_m80a1epr", 1],
        ["rhsusf_20Rnd_762x51_m993_Mag", 10],
        ["rhsusf_20Rnd_762x51_m118_special_Mag", 3],
        ["rhsusf_mag_10Rnd_STD_50BMG_M33", 3],
        ["rhsusf_5Rnd_00Buck", 10],
        ["rhsusf_8Rnd_00Buck", 10],
        ["rhsusf_mag_40Rnd_46x30_FMJ", 10],
        ["rhsusf_5Rnd_300winmag_xm2010", 5],
        ["rhsusf_mag_15Rnd_9x19_JHP", 10],
        ["rhsusf_mag_7x45acp_MHP", 10],
        ["rhs_mag_M441_HE", 10],
        ["rhs_mag_M433_HEDP", 10],
        ["rhs_mag_M662_red", 5],
        ["rhs_mag_M713_red", 5],
        ["rhs_mag_smaw_HEAA", 2],
        ["rhs_fim92_mag", 2],
        ["rhsusf_acc_ACOG", 2],
        ["rhsusf_acc_eotech_552", 3],
        ["rhsusf_acc_compm4", 3],
        ["rhsusf_acc_eotech_xps3", 1],
        ["rhsusf_acc_harris_bipod", 2],
        ["rhs_mag_m67", 10],
        ["rhs_mag_m18_red", 5],
        ["rhs_mag_m7a3_cs", 5],
        ["Binocular", 5],
        ["FirstAidKit", 10]
    ],
    // Level 3
    [
        // [Item, quantity] (100% drop)
        ["rhs_mag_30Rnd_556x45_Mk318_Stanag", 12],
        ["rhs_mag_30Rnd_556x45_Mk262_Stanag", 12],
        ["rhs_mag_30Rnd_556x45_M855A1_Stanag", 10],
        ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", 10],
        ["rhs_200rnd_556x45_B_SAW", 3],
        ["rhsusf_100Rnd_556x45_soft_pouch", 5],
        ["rhsusf_50Rnd_762x51", 3],
        ["rhsusf_100Rnd_762x51", 2],
        ["rhsusf_100Rnd_762x51_m61_ap", 2],
        ["rhsusf_100Rnd_762x51_m80a1epr", 2],
        ["rhsusf_20Rnd_762x51_m993_Mag", 10],
        ["rhsusf_20Rnd_762x51_m118_special_Mag", 5],
        ["rhsusf_mag_10Rnd_STD_50BMG_M33", 5],
        ["rhsusf_5Rnd_00Buck", 10],
        ["rhsusf_5Rnd_Slug", 5],
        ["rhsusf_8Rnd_00Buck", 10],
        ["rhsusf_8Rnd_Slug", 5],
        ["rhsusf_mag_40Rnd_46x30_FMJ", 10],
        ["rhsusf_5Rnd_300winmag_xm2010", 5],
        ["rhsusf_mag_15Rnd_9x19_JHP", 10],
        ["rhsusf_mag_7x45acp_MHP", 10],
        ["rhs_mag_M441_HE", 15],
        ["rhs_mag_M433_HEDP", 10],
        ["rhs_mag_M662_red", 5],
        ["rhs_mag_M713_red", 5],
        ["rhs_mag_smaw_HEAA", 2],
        ["rhs_mag_smaw_HEDP", 1],
        ["rhs_m72a7_mag", 2],
        ["rhs_fim92_mag", 2],
        ["rhs_fgm148_magazine_AT", 1],
        ["rhsusf_acc_ACOG", 2],
        ["rhsusf_acc_eotech_552", 3],
        ["rhsusf_acc_compm4", 3],
        ["rhsusf_acc_eotech_xps3", 1],
        ["rhsusf_acc_harris_bipod", 2],
        ["rhs_mag_m67", 10],
        ["rhs_mag_m18_red", 5],
        ["rhs_mag_m7a3_cs", 5],
        ["rhsusf_mag_6Rnd_M433_HEDP", 2],
        ["rhsusf_mag_6Rnd_M576_Buckshot", 2],
        ["Binocular", 5],
        ["FirstAidKit", 10]
    ]
]
