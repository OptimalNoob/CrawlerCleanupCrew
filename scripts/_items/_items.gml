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
	
	global.item_dictionary = ds_grid_create_from_array(_item_dictionary);
	
}

enum ItemGrid {
	NAME,
	SPRITE,
	TYPE,
	RARITY
}

enum ItemType {
	HEAD,
	TORSO,
	HAND,
	FEET,
	DAGGER,
	SWORD,
	CLUB,
	STAFF,
	SYTHE,
	AXE,
	BOW,
	CROSSBOW,
	GUN,
	AMMO,
	THROWABLE,
	SHIELD,
	ACCESSORY,
	NECKLACE,
	RING,
	BAG,
	VALUABLE,
	FOOD,
	RELIC,
	JUNK
}

enum ItemRarity {
	COMMON,
	UNCOMMON,
	MAGIC,
	RARE,
	LEGENDARY,
	UNIQUE,
	JUNK
}