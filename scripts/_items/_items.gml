function _init_items() {
	// TODO:	Split item types into seprate spritesheets
	//			Randomly generate table of items with item types, associate those types
	//			to the corresponding spritesheet, and populate each item with a random
	//			image_index within that spritesheet.
	//			Upon loot generation, create a convention for item names based on rarity
	//			eg.:
	//			Common - Generic Name (eg. Rusty, Iron, Copper, etc.) Original Color
	//			Uncommon - Improved Nmes (eg. Polished, Engraved, Gilded, etc.) Green Color
	//			Magic - Magical Names (eg. Mystic, Elemental, Arcane, Ethereal, etc.) Blue Color
	//			Rare - Edgy af names (eg. Thunderstrike, Shadowhunter, Frostbite, etc.) Purple Color
	//			Legendary - Mythical/Legend names (eg. Dragonbane, Voidshaper, Pheonix, etc.) Orange Color, shiny?
	//			Ancient - Ancient Names (eg. Eldritch, Astral, Ancestral, etc.) Dark Red Color, shiny?
	var _item_dictionary = [
		[]
	];
	
}

enum ItemType {
	WEAPON,
	ARMOR,
	USABLE,
	VALUABLE,
	JUNK
}

enum ItemSubType {
	// ItemType.ARMOR
	HEAD,		// 0
	TORSO,
	HAND,
	FEET,
	NECKLACE,
	RING,		// 5
	// ItemType.WEAPON
	DAGGER,		// 6
	SWORD,
	CLUB,
	STAFF,
	SYTHE,
	AXE,
	BOW,
	CROSSBOW,
	GUN,
	SHIELD,		// 15
	// ItemType.USABLE
	AMMO,		// 16
	THROWABLE,
	BAG,
	FOOD,		// 19
	// ItemType.VALUABLE
	VALUABLE,	// 20
	RELIC,		// 21
	// ItemType.JUNK
	JUNK		// 22
}

enum ItemRarity {
	COMMON,		// Grey
	UNCOMMON,	// Green
	MAGIC,		// Blue
	RARE,		// Purple
	LEGENDARY,	// Orange
	JUNK		// Dark Grey
}

function generate_chest_loot(_rarity) {
	var chest_rolls = [
		[1, 4],
		[2, 5],
		[2, 6],
		[3, 7],
		[4, 9]
	];
	var item_count_range = chest_rolls[_rarity];
	var item_drop_count = irandom_range(item_count_range[0], item_count_range[1]);
	var item_drops = [];
	for(var i = 0; i < item_drop_count; i++) {
		var _item_rarity = _pick_item_rarity(_rarity);
		if(_item_rarity != ItemRarity.JUNK) {
			var _item_type = irandom_range(ItemType.WEAPON, ItemType.VALUABLE);
			var _item_subtype = _pick_item_subtype(_item_type);
			var _sprite_data = _pick_item_sprite_and_index(_item_type, _item_subtype);
			var _item_sprite = _sprite_data[0];
			var _item_sprite_index = _sprite_data[1];
			var _item_name = _pick_item_name(_item_type, _item_rarity);
			var _item_out = {
				name: _item_name,
				type: _item_type,
				subtype: _item_subtype,
				rarity: _item_rarity,
				sprite: _item_sprite,
				sprite_frame: _item_sprite_index
			}
			item_drops[i] = _item_out;
		} else {
			item_drops[i] = {
				name: "Junk",
				type: ItemType.JUNK,
				subtype: ItemSubType.JUNK,
				rarity: ItemRarity.JUNK,
				sprite: spr_items_junk,
				sprite_frame: 0
			}
		}
	}
	return item_drops;
}

function _pick_item_rarity(_rarity) {
	var probabilities = [
		// [ common, ...legendary, junk ]
		[ 60, 20, 10,  5,  3,  2 ],		// Common Chest
		[ 40, 30, 15, 10,  4,  1 ],
		[ 20, 15, 35, 20,  5,  5 ],
		[ 10,  8, 15, 30, 20, 17 ],
		[  5,  5, 10, 20, 50, 10 ]		// Legendary Chest
	];
	var rand = random(1) * 100;
	var cumulative_probability = 0;
	var _roll_arr = probabilities[_rarity];
	for (var i = 0; i < array_length(_roll_arr); i++) {
		cumulative_probability += _roll_arr[i];
		if (rand <= cumulative_probability) {
		    return i;
		}
	}
}

function _pick_item_subtype(_type) {
	var _subtype_choice;
	switch(_type) {
		case ItemType.ARMOR:
			_subtype_choice = irandom_range(ItemSubType.HEAD, ItemSubType.RING);
			break;
		case ItemType.WEAPON:
			_subtype_choice = irandom_range(ItemSubType.DAGGER, ItemSubType.SHIELD);
			break;
		case ItemType.USABLE:
			_subtype_choice = irandom_range(ItemSubType.AMMO, ItemSubType.FOOD);
			break;
		case ItemType.VALUABLE:
			_subtype_choice = irandom_range(ItemSubType.VALUABLE, ItemSubType.RELIC);
			break;
		default:
			_subtype_choice = ItemSubType.JUNK;
			break;
	}
	return _subtype_choice;
}

function _pick_item_sprite_and_index(_type, _subtype) {
	var _sprite, _index;
	var _arr_out = array_create(2);
	var _sprite_type_array = global.item_type_sprite_map[_type];
	_sprite = (_subtype * 2) + 1;
	_index = irandom_range(0, sprite_get_number(_sprite) - 1);
	_arr_out = [_sprite, _index];
	return _arr_out;
}

function _pick_item_name(_subtype, _rarity) {
	var _name_out = "";
	var _prefix = "";
	var _suffix = "";
	var _item_name_list = global.item_name_dictionary[_subtype];
	var _rand = irandom_range(0, array_length(_item_name_list) - 1);
	var _base_name = _item_name_list[_rand];
	switch(_rarity) {
		case ItemRarity.COMMON: case ItemRarity.UNCOMMON:
			_name_out = _base_name;
			break;
		case ItemRarity.MAGIC:
			_rand = irandom_range(0, array_length(global.item_prefix_dictionary) - 1);
			_prefix = global.item_prefix_dictionary[_rand];
			
			_name_out = string_join(" ", _prefix, _base_name);
			break;
		case ItemRarity.RARE:
			_rand = irandom_range(0, array_length(global.item_suffix_dictionary) - 1);
			_suffix = global.item_suffix_dictionary[_rand];
			
			_name_out = string_join(" ", _base_name, _suffix);
			break;
		case ItemRarity.LEGENDARY:
			_rand = irandom_range(0, array_length(global.item_prefix_dictionary) - 1);
			_prefix = global.item_prefix_dictionary[_rand];
			_rand = irandom_range(0, array_length(global.item_suffix_dictionary) - 1);
			_suffix = global.item_suffix_dictionary[_rand];
			
			_name_out = string_join(" ", _prefix, _base_name, _suffix);
			break;
		default:
			break;
	}
	return _name_out;
}