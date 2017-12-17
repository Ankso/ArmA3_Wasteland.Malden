/******************************************************************************************
 * This project is licensed under the GNU Affero GPL v3. Copyright © 2017 MrAnkso         *
 ******************************************************************************************
 * @file Name: server\loot\LootFunctions.sqf
 * @file Author: MrAnkso
 *
 * Stores functions related with the loot system.
 */

WI_fnc_ProcessLootForUnit = {
	private ["_unit", "_rank", "_faction", "_lootTable", "_lootTableIndex", "_currentLoot", "_hasDrop"];

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
		// First, main weapon. There's a 100% of a main weapon drop.
		_currentLoot = (_lootTable select _lootTableIndex) select 0;
		_unit addWeapon (selectRandomWeighted _currentLoot);
		// Secondary weapons. Roll our chances.
		_currentLoot = (_lootTable select _lootTableIndex) select 1;
		_hasDrop = _currentLoot call WI_fnc_RollDropChances;
		if (_hasDrop) then {
			_unit addWeapon (selectRandomWeighted _currentLoot);
		};
		// Ammo loot. A unit can drop 1-3 mag types, 1-2 of each one.
		_currentLoot = (_lootTable select _lootTableIndex) select 2;
		_magsDrop = ceil (random 3);
		for "_i" from 0 to _magsDrop do {
			_unit addMagazines [selectRandomWeighted _currentLoot, ceil (random 2)];
		};
		// Launcher drop. We must roll.
		_currentLoot = (_lootTable select _lootTableIndex) select 3;
		_hasDrop = _currentLoot call WI_fnc_RollDropChances;
		if (_hasDrop) then {
			_unit addWeapon (selectRandomWeighted _currentLoot);
		};
		// Launcher ammo drop, also roll first.
		_currentLoot = (_lootTable select _lootTableIndex) select 4;
		_hasDrop = _currentLoot call WI_fnc_RollDropChances;
		if (_hasDrop) then {
			_unit addMagazines [(selectRandomWeighted _currentLoot), ceil (random 2)]; // 1-2 rockets
		};
		// Weapon accessories. 100% chance to drop 1-2.
		_currentLoot = (_lootTable select _lootTableIndex) select 5;
		_unit addItem (selectRandomWeighted _currentLoot);
		if (random 1 >= 0.50) then {
			_unit addItem (selectRandomWeighted _currentLoot);
		};
		// Explosives loot. Roll here. If we must drop something, drop 1-2.
		_currentLoot = (_lootTable select _lootTableIndex) select 6;
		_hasDrop = _currentLoot call WI_fnc_RollDropChances;
		if (_hasDrop) then {
			_unit addItem (selectRandomWeighted _currentLoot);
			if (random 1 >= 0.50) then {
				_unit addItem (selectRandomWeighted _currentLoot);
			};
		};
		// Finally, items (NVG, binoculars...). Last bit of RNG :)
		_currentLoot = (_lootTable select _lootTableIndex) select 7;
		_hasDrop = _currentLoot call WI_fnc_RollDropChances;
		if (_hasDrop) then {
			_unit addItem (selectRandomWeighted _currentLoot);
		};
		// Loot drop has been completed.
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
	diag_log format ["DEBUG: Loot array: %1, Drop chances: %2", _lootArray, _chancesArray];
	// Roll the dice
	_i = 0;
	while {_i < (count _chancesArray)} do {
		if (random 1 <= (_chancesArray select _i)) then {
			_hasDrop = true;
			_i = count _chancesArray;
		};
		_i = _i + 1;
	};
	diag_log format ["DEBUG: _hasDrop: %1", _hasDrop];
	_hasDrop;
}