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
	["La Rivierè",               "pve_area_insurgents_la_riviere",                    2,               4,                      [2, 4],                            [2, 3],                        [2, 2],             100,                 100, "INSURGENCY",               300],
	//["South East Harbor",        "pve_area_insurgents_harbor",                        2,               4,                      [4, 5],                            [2, 3],                        [2, 3],              50,                 100, "BLUFOR"    ,              7200],
	"null",
	"null",
	"null",
	"null",
	"null",
	"null",
	"null",
	"null",
	"null",
	"null"
];
