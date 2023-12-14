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
		[2, 4],
		[1, 5],
		[2, 6],
		[2, 7],
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
			var __item_sprite_and_index = _pick_item_sprite(_item_subtype);
			var _item_sprite = spr_items_junk;
			var _item_sprite_index = 0;
			var _item_name = _pick_item_name(_item_type, _item_rarity);
			item_drops[i] = {
				name: item_name,
				type: _item_type,
				subtype: _item_subtype,
				rarity: _item_rarity,
				sprite: _item_sprite,
				sprite_frame: _item_sprite_index
			}
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
		[  5,  5, 10, 20, 30, 10 ]		// Legendary Chest
	];
	var rand = random(1) * 100;
	var cumulative_probability = 0;
	for (var i = 0; i < array_length(probabilities); i++) {
		cumulative_probability += probabilities[i];
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

function _pick_item_sprite(_subtype) {
	var _index;
	
	
}

function _pick_item_name(_subtype, _rarity) {
	var _name_out = "";
}