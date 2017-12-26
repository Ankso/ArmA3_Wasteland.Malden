/******************************************************************************************
 * This project is licensed under the GNU Affero GPL v3. Copyright © 2017 MrAnkso         *
 ******************************************************************************************
 * @file Name: server\pve\dungeons\DungeonInfo.sqf
 * @file Author: MrAnkso
 *
 * Stores data for each one of the map dungeons/complexes.
 */

DungeonsInfo = [
//  [             0                                   1                           2             3                     4                                5                            6                            7                8               9                10         ]
//  [       Dungeon name        ,               Markers name               , Difficulty, Boss difficulty, Units per patrol [min, max], Units per static group [min, max], Units per building [min, max], Box loot chance, Vehicle loot chance, Faction     , Respawn timer (s)]
	["La Rivierè",               "pve_area_insurgents_la_riviere",                    1,               4,                      [2, 4],                            [2, 3],                        [2, 2],              50,                 100, "INSURGENCY",              3600],
	["South East Harbor",        "pve_area_insurgents_harbor",                        2,               5,                      [3, 5],                            [2, 3],                        [2, 3],             100,                  50, "INSURGENCY",              7200],
	["Houdan",                   "pve_area_insurgents_houdan",                        3,               4,                      [5, 6],                            [2, 2],                        [2, 2],              60,                  25, "INSURGENCY",              7200],
	["La Pessagne-Vigny",        "pve_area_insurgents_la_pessagne",                   3,               5,                      [6, 7],                            [2, 3],                        [2, 3],              75,                  25, "INSURGENCY",              9000],
	["Military Harbor",          "pve_area_opfor_military_harbor",                    1,               4,                      [3, 4],                            [2, 3],                        [4, 5],              75,                  25,      "OPFOR",              7200],
	["Military Fuel Depor",      "pve_area_opfor_military_fuel_depot",                1,               4,                      [2, 3],                            [2, 3],                        [3, 5],              82,                  20,      "OPFOR",              3600],
	["La Trinité",               "pve_area_opfor_la_trinite",                         2,               5,                      [2, 4],                            [2, 3],                        [2, 3],             100,                  25,      "OPFOR",              9000],
	["Military Airfield Complex","pve_area_opfor_military_airfield",                  3,               6,                      [5, 6],                            [2, 3],                        [2, 4],              85,                  30,      "OPFOR",             10800],
	["USS Freedom",              "pve_area_blufor_aircraft_carrier",                  1,               4,                      [3, 4],                            [2, 2],                        [1, 2],              50,                  20,     "BLUFOR",              3600],
	["Goisse",                   "pve_area_blufor_goisse",                            1,               4,                      [3, 4],                            [2, 2],                        [2, 3],              50,                  90,     "BLUFOR",              7200],
	["Old Military Base",        "pve_area_blufor_military_base",                     2,               5,                      [3, 5],                            [2, 2],                        [2, 3],              75,                  25,     "BLUFOR",              9000],
	["Captured Airfield",        "pve_area_blufor_captured_airfield",                 3,               6,                      [5, 7],                            [2, 2],                        [2, 4],              85,                  20,     "BLUFOR",             10800]
];
