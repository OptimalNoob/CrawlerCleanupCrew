enum ItemType {
	ARMOR,
	WEAPON,
	USABLE,
	VALUABLE,
	JUNK,
}

enum ItemSubType {
	// ItemType.ARMOR
	HEAD = 0,			// 0
	TORSO = 1,
	HAND = 2,
	FEET = 3,
	NECKLACE = 4,
	RING = 5,			// 5
	// ItemType.WEAPON
	DAGGER = 6,			// 6
	SWORD = 7,
	CLUB = 8,
	STAFF = 9,
	SYTHE = 10,
	AXE = 11,
	BOW = 12,
	CROSSBOW = 13,
	GUN = 14,
	SHIELD = 15,		// 15
	// ItemType.USABLE
	AMMO = 16,			// 16
	THROWABLE = 17,
	BAG = 18,
	FOOD = 19,			// 19
	// ItemType.VALUABLE
	VALUABLE = 20,		// 20
	RELIC = 21,			// 21
	// ItemType.JUNK
	JUNK = 22			// 22
}

enum ItemRarity {
	COMMON = 0,		// Grey
	UNCOMMON = 1,	// Green
	MAGIC = 2,		// Blue
	RARE = 3,		// Purple
	LEGENDARY = 4,	// Orange
	JUNK = 5		// Dark Grey
}

function generate_chest_loot(_rarity) {
	var chest_rolls = [
		[3, 9],	// Common Chest
		[3, 5],
		[2, 6],
		[2, 4],
		[1, 3]	// Legendary Chest
	];
	var item_count_range = chest_rolls[_rarity];
	var item_drop_count = irandom_range(item_count_range[0], item_count_range[1]);
	var item_drops = [];
	for(var i = 0; i < item_drop_count; i++) {
		var _item_rarity = _pick_item_rarity(_rarity);
		if(_item_rarity != ItemRarity.JUNK) {
			if(_item_rarity == 5) show_debug_message("THIS SHOULDN'T BE APPEARING");
			var _item_type = irandom_range(ItemType.ARMOR, ItemType.VALUABLE);
			var _item_subtype = _pick_item_subtype(_item_type);
			var _sprite_data = _pick_item_sprite_and_index(_item_type, _item_subtype);
			var _item_sprite = _sprite_data[0];
			var _item_sprite_index = _sprite_data[1];
			var _item_name = _pick_item_name(_item_subtype, _item_rarity);
			var _item_out = {
				item_name: _item_name,
				item_type: _item_type,
				item_subtype: _item_subtype,
				item_rarity: _item_rarity,
				item_sprite: _item_sprite,
				item_sprite_frame: _item_sprite_index
			}
		} else {
			var _item_out = {
				item_name: "Junk",
				item_type: ItemType.JUNK,
				item_subtype: ItemSubType.JUNK,
				item_rarity: ItemRarity.JUNK,
				item_sprite: spr_items_junk,
				item_sprite_frame: 0
			}
		}
		item_drops[i] = _item_out;
		show_debug_message("Rarity: " + string(global.debug_item_rarity[_item_out.item_rarity]) + "(" + string(_item_out.item_rarity) + ")");
		show_debug_message("Type: " + string(global.debug_item_type[_item_out.item_type]) + "(" + string(_item_out.item_type) + ")");
		show_debug_message("SubType: " + string(global.debug_item_subtype[_item_out.item_subtype]) + "(" + string(_item_out.item_subtype) + ")");
		show_debug_message("Name: " + string(_item_out.item_name));
		show_debug_message("---");
	}
	return item_drops;
}

function _pick_item_rarity(_rarity) {
	var probabilities = [
		// [ common, ...legendary, junk ]
		[ 49,  4,  3,  1,  1, 42 ],		// Common Chest
		[  4, 89,  3,  1,  1,  2 ],
		[  3,  4, 89,  1,  1,  2 ],
		[  1,  1,  1, 89,  1,  7 ],
		[  1,  1,  1,  1, 90,  6 ]		// Legendary Chest
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
	var _sprite = global.item_type_sprite_map[_subtype];
	_index = irandom_range(0, sprite_get_number(_sprite) - 1);
	_arr_out = [_sprite, _index];
	return _arr_out;
}

function _pick_item_name(_subtype, _rarity) {
	var _name_out = "";
	var _prefix = "";
	var _suffix = "";
	var _item_name_list = global.item_name_dictionary[_subtype];
	show_debug_message("Name Pool: " + string(_item_name_list));
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
			_suffix = "\n" + string(global.item_suffix_dictionary[_rand]);
			
			_name_out = string_join(" ", _prefix, _base_name, _suffix);
			break;
		default:
			break;
	}
	return _name_out;
}