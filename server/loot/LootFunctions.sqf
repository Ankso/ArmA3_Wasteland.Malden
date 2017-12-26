/******************************************************************************************
 * This project is licensed under the GNU Affero GPL v3. Copyright © 2017 MrAnkso         *
 ******************************************************************************************
 * @file Name: server\loot\LootFunctions.sqf
 * @file Author: MrAnkso
 *
 * Stores functions related with the loot system.
 */

WI_fnc_ProcessLootForUnit = {
	private ["_unit", "_rank", "_faction", "_lootTable", "_lootTableIndex", "_currentLoot", "_hasDrop", "_lootBox"];

	_unit = _this select 0;
	_rank = rank _unit;
	_faction = _unit getVariable ["ficticiousFaction", "noFaction"];
	_lootTable = [];
	_lootTableIndex = 0;
	_currentLoot = [];

	if (_faction != "noFaction") then {
		// Remove everything but clothes/vest/backpack
		removeAllWeapons _unit;
		removeAllAssignedItems _unit;
		// Start rolling the dice, we must have into account unit rank and faction
		switch (_faction) do {
			case "BLUFOR": { _lootTable = BluforLootTable; };
			case "OPFOR": { _lootTable = OpforLootTable; };
			case "INSURGENCY": { _lootTable = InsurgencyLootTable; };
			default {};
		};
		switch (_rank) do {
			case "PRIVATE": { _lootTableIndex = 0; };
			case "CORPORAL": { _lootTableIndex = 1; };
			case "SERGEANT": { _lootTableIndex = 2; };
			case "LIEUTENANT": { _lootTableIndex = 3; };
			case "CAPTAIN": { _lootTableIndex = 4; };
			case "MAJOR": { _lootTableIndex = 5; };
			case "COLONEL": { _lootTableIndex = 6; };
			default {};
		};
		// Spawn a small box to put the items inside - spawning them in the corpses gives a lot of problems
		_lootBox = "rhs_3Ya40_1_single" createVehicle (position _unit);
		clearItemCargoGlobal _lootBox;
		clearWeaponCargoGlobal _lootBox;
		clearMagazineCargoGlobal _lootBox;
		clearBackpackCargoGlobal _lootBox;
		// First, main weapon. There's a 100% of a main weapon drop.
		_currentLoot = (_lootTable select _lootTableIndex) select 0;
		_weapon = selectRandomWeighted _currentLoot;
		_lootBox addWeaponCargoGlobal [_weapon, 1];
		// Add at least some ammo for the dropped weapon
		_mag = ((getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines")) select 0) call getBallMagazine;
		_lootBox addMagazineCargoGlobal [_mag, ceil (random 2)];
		// Weapon accessories. 100% chance to drop 1-2.
		_currentLoot = (_lootTable select _lootTableIndex) select 5;
		_lootBox addItemCargoGlobal [(selectRandomWeighted _currentLoot), 1];
		if ((random 1) < 0.25) then {
			_lootBox addItemCargoGlobal [(selectRandomWeighted _currentLoot), 1];
		};
		// Explosives loot. Roll here. If we must drop something, drop 1-2.
		_currentLoot = (_lootTable select _lootTableIndex) select 6;
		_hasDrop = _currentLoot call WI_fnc_RollDropChances;
		if (_hasDrop) then {
			_lootBox addItemCargoGlobal [(selectRandomWeighted _currentLoot), 1];
			if ((random 1) >= 0.50) then {
				_lootBox addItemCargoGlobal [(selectRandomWeighted _currentLoot), 1];
			};
		};
		// Secondary weapons. Roll our chances.
		_currentLoot = (_lootTable select _lootTableIndex) select 1;
		_hasDrop = _currentLoot call WI_fnc_RollDropChances;
		if (_hasDrop) then {
			_weapon = selectRandomWeighted _currentLoot;
			_lootBox addWeaponCargoGlobal [(_weapon), 1];
			// Add at least some ammo for the dropped weapon
			_mag = ((getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines")) select 0) call getBallMagazine;
			_lootBox addMagazineCargoGlobal [_mag, ceil (random 2)];
		};
		// Ammo loot. A unit can drop 1-2 mag types (+1 from weapn drop), 1-2 of each one.
		_currentLoot = (_lootTable select _lootTableIndex) select 2;
		_magsDrop = ceil (random 2);
		for "_i" from 0 to _magsDrop do {
			_lootBox addMagazineCargoGlobal [selectRandomWeighted _currentLoot, ceil (random 2)];
		};
		// Launcher drop. We must roll.
		_currentLoot = (_lootTable select _lootTableIndex) select 3;
		_hasDrop = _currentLoot call WI_fnc_RollDropChances;
		if (_hasDrop) then {
			_lootBox addWeaponCargoGlobal [(selectRandomWeighted _currentLoot), 1];
		};
		// Launcher ammo drop, also roll first.
		_currentLoot = (_lootTable select _lootTableIndex) select 4;
		_hasDrop = _currentLoot call WI_fnc_RollDropChances;
		if (_hasDrop) then {
			_lootBox addMagazineCargoGlobal [(selectRandomWeighted _currentLoot), ceil (random 2)]; // 1-2 rockets
		};
		// Finally, items (NVG, binoculars...). Last bit of RNG :)
		_currentLoot = (_lootTable select _lootTableIndex) select 7;
		_hasDrop = _currentLoot call WI_fnc_RollDropChances;
		if (_hasDrop) then {
			_lootBox addItemCargoGlobal [(selectRandomWeighted _currentLoot), 1];
		};
		// Loot drop has been completed.
		// Set box for despawn after 30 minutes
		_lootBox spawn { uiSleep 1800; deleteVehicle _this; };
	} else {
		diag_log format["SERVER ERROR: Unit %1 has triggered loot drop system but has no faction assigned!"];
	};
};

WI_fnc_ProcessLootForPlayer = {
	
};

WI_fnc_RollDropChances = {
	private ["_lootArray", "_chancesArray", "_i", "_hasDrop"];

	_lootArray = _this;
	_chancesArray = [];
	_hasDrop = false;
	// Get items "drop chance"
	_i = 1;
	while {_i < (count _lootArray)} do {
		_chancesArray pushBack (_lootArray select _i);
		_i = _i + 2;
	};
	// Roll the dice
	_i = 0;
	while {_i < (count _chancesArray)} do {
		if (random 1 <= (_chancesArray select _i)) then {
			_hasDrop = true;
			_i = count _chancesArray;
		};
		_i = _i + 1;
	};
	_hasDrop;
};

/*
 * Spawn money from a dead NPC.
 * 
 * @param _unit Unit killed.
 */
WI_fnc_DropMoneyFromNPC = {
	private ["_unit", "_money", "_m"];

	_unit = _this select 0;
	_money = 1;

	switch (rank _unit) do {
		case "PRIVATE":    { _money = (ceil (random 51)) + 25; };     // Minimum 25 + random 50
		case "CORPORAL":   { _money = (ceil (random 51)) + 50; };     // Minimum 50 + random 50
		case "SERGEANT":   { _money = (ceil (random 51)) + 75; };     // Minimum 75 + random 50
		case "LIEUTENANT": { _money = (ceil (random 51)) + 150; };    // Minimum 150 + random 50
		case "CAPTAIN":    { _money = (ceil (random 501)) + 1000; };  // Minimum 1000 + random 500
		case "MAJOR":      { _money = (ceil (random 1001)) + 2000; }; // Minimum 2000 + random 1000
		case "COLONEL":    { _money = (ceil (random 2001)) + 4000; }; // Minimum 4000 + random 2000
		default {};
	};

	_m = createVehicle ["Land_Money_F", getPos _unit, [], 1, "CAN_COLLIDE"];
	_m setDir random 360;
	_m setVariable ["cmoney", _money, true];
	_m setVariable ["owner", "world", true];
	_m call A3W_fnc_setItemCleanup;
};

/*
 * Simulates a loot drop multple times, compiles the results and prints them in the server console.
 * WARNING: This function can run up to 100000 and can be resource intensive, use only for debug purposes.
 * 
 * @param _faction string Faction of the ficticious NPC for loot simulation.
 * @param _rank string Rank of the ficticious NPC.
 * @param _tries int Number of simulations or rolls.
 */
WI_fnc_SimulateLoot = {
	private ["_faction", "_rank", "_tries", "_lootTable", "_lootTableIndex", "_currentLoot", "_stats", "_drop"];

	_faction = _this select 0;
	_rank = _this select 1;
	_tries = (_this select 2) - 1; // 0-999 for example (1000 tries)
	_lootTable = [];
	_lootTableIndex = 0;
	_currentLoot = [];
	_stats = [];

	// Start rolling the dice, we must have into account unit rank and faction
	switch (_faction) do {
		case "BLUFOR": { _lootTable = BluforLootTable; };
		case "OPFOR": { _lootTable = OpforLootTable; };
		case "INSURGENCY": { _lootTable = InsurgencyLootTable; };
		default {};
	};
	switch (_rank) do {
		case "PRIVATE": { _lootTableIndex = 0; };
		case "CORPORAL": { _lootTableIndex = 1; };
		case "SERGEANT": { _lootTableIndex = 2; };
		case "LIEUTENANT": { _lootTableIndex = 3; };
		case "CAPTAIN": { _lootTableIndex = 4; };
		case "MAJOR": { _lootTableIndex = 5; };
		case "COLONEL": { _lootTableIndex = 6; };
		default {};
	};

	// First, main weapon. There's a 100% of a main weapon drop.
	_currentLoot = (_lootTable select _lootTableIndex) select 0;
	// Prepare stats array
	_i = 0;
	while {_i < count _currentLoot} do {
		_stats pushBack [_currentLoot select _i, 0];
		_i = _i + 2;
	};
	for "_i" from 0 to _tries do {
		_drop = selectRandomWeighted _currentLoot;
		// Add drop stat
		_j = 0;
		while {_j < count _stats} do {
			if ((_stats select _j) select 0 == _drop) then {
				_count = (_stats select _j) select 1;
				_stats set [_j, [_drop, _count + 1]];
				_j = count _stats;
			} else {
				_j = _j + 1;
			};
		};
	};
	// Display weapon stats
	diag_log format ["DEBUG - Loot system: Simulated %1 weapon rolls for [%2, %3]", _tries, _faction, _rank];
	_i = 0;
	_count = 0;
	while {_i < count _stats} do {
		diag_log format ["ItemClass: %1, rolls: %2, percentage: %3%4", (_stats select _i) select 0, (_stats select _i) select 1, (((_stats select _i) select 1) / _tries) * 100, "%"];
		_count = _count + ((_stats select _i) select 1);
		_i = _i + 1;
	};
	diag_log format ["DEBUG - Loot system: Total rolls %1, total drops: %2, drop possibility percentage: %3%4", _tries, _count, (_count / _tries) * 100, "%"];

	// Secondary weapons. Roll our chances.
	_currentLoot = (_lootTable select _lootTableIndex) select 1;
	// Prepare stats array
	_stats = [];
	_i = 0;
	while {_i < count _currentLoot} do {
		_stats pushBack [_currentLoot select _i, 0];
		_i = _i + 2;
	};
	for "_i" from 0 to _tries do {
		_hasDrop = _currentLoot call WI_fnc_RollDropChances;
		if (_hasDrop) then {
			_drop = selectRandomWeighted _currentLoot;
			// Add drop stat
			_j = 0;
			while {_j < count _stats} do {
				if ((_stats select _j) select 0 == _drop) then {
					_count = (_stats select _j) select 1;
					_stats set [_j, [_drop, _count + 1]];
					_j = count _stats;
				} else {
					_j = _j + 1;
				};
			};
		};
	};
	diag_log "---------------------------------------------------------------------";
	diag_log format ["DEBUG - Loot system: Simulated %1 secondary weapon rolls for [%2, %3]", _tries, _faction, _rank];
	_i = 0;
	_count = 0;
	while {_i < count _stats} do {
		diag_log format ["ItemClass: %1, rolls: %2, percentage: %3%4", (_stats select _i) select 0, (_stats select _i) select 1, (((_stats select _i) select 1) / _tries) * 100, "%"];
		_count = _count + ((_stats select _i) select 1);
		_i = _i + 1;
	};
	diag_log format ["DEBUG - Loot system: Total rolls %1, total drops: %2, drop possibility percentage: %3%4", _tries, _count, (_count / _tries) * 100, "%"];

	// Launcher drop. We must roll.
	_currentLoot = (_lootTable select _lootTableIndex) select 3;
	// Prepare stats array
	_stats = [];
	_i = 0;
	while {_i < count _currentLoot} do {
		_stats pushBack [_currentLoot select _i, 0];
		_i = _i + 2;
	};
	for "_i" from 0 to _tries do {
		_hasDrop = _currentLoot call WI_fnc_RollDropChances;
		if (_hasDrop) then {
			_drop = selectRandomWeighted _currentLoot;
			// Add drop stat
			_j = 0;
			while {_j < count _stats} do {
				if ((_stats select _j) select 0 == _drop) then {
					_count = (_stats select _j) select 1;
					_stats set [_j, [_drop, _count + 1]];
					_j = count _stats;
				} else {
					_j = _j + 1;
				};
			};
		};
	};
	diag_log "---------------------------------------------------------------------";
	diag_log format ["DEBUG - Loot system: Simulated %1 launcher rolls for [%2, %3]", _tries, _faction, _rank];
	_i = 0;
	_count = 0;
	while {_i < count _stats} do {
		diag_log format ["ItemClass: %1, rolls: %2, percentage: %3%4", (_stats select _i) select 0, (_stats select _i) select 1, (((_stats select _i) select 1) / _tries) * 100, "%"];
		_count = _count + ((_stats select _i) select 1);
		_i = _i + 1;
	};
	diag_log format ["DEBUG - Loot system: Total rolls %1, total drops: %2, drop possibility percentage: %3%4", _tries, _count, (_count / _tries) * 100, "%"];

	// Accessories. Roll our chances.
	_currentLoot = (_lootTable select _lootTableIndex) select 5;
	// Prepare stats array
	_stats = [];
	_i = 0;
	while {_i < count _currentLoot} do {
		_stats pushBack [_currentLoot select _i, 0];
		_i = _i + 2;
	};
	for "_i" from 0 to _tries do {
		_hasDrop = _currentLoot call WI_fnc_RollDropChances;
		if (_hasDrop) then {
			_drop = selectRandomWeighted _currentLoot;
			// Add drop stat
			_j = 0;
			while {_j < count _stats} do {
				if ((_stats select _j) select 0 == _drop) then {
					_count = (_stats select _j) select 1;
					_stats set [_j, [_drop, _count + 1]];
					_j = count _stats;
				} else {
					_j = _j + 1;
				};
			};
		};
	};
	diag_log "---------------------------------------------------------------------";
	diag_log format ["DEBUG - Loot system: Simulated %1 accessory rolls for [%2, %3]", _tries, _faction, _rank];
	_i = 0;
	_count = 0;
	while {_i < count _stats} do {
		diag_log format ["ItemClass: %1, rolls: %2, percentage: %3%4", (_stats select _i) select 0, (_stats select _i) select 1, (((_stats select _i) select 1) / _tries) * 100, "%"];
		_count = _count + ((_stats select _i) select 1);
		_i = _i + 1;
	};
	diag_log format ["DEBUG - Loot system: Total rolls %1, total drops: %2, drop possibility percentage: %3%4", _tries, _count, (_count / _tries) * 100, "%"];
	// Loot drop simulation has been completed.
};
