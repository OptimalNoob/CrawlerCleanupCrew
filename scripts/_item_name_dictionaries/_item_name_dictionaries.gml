global.item_name_dictionary = [
	[ // ItemSubtype.HEAD
		"Visor", "Crown", "Helm", "Mask", "Casque", "Headguard", "Coif", "Cap",
	],
	[ // ItemSubtype.TORSO
		"Breastplate", "Cuirass", "Harness", "Platemail", "Hauberk", "Brigandine", "Carapace", "Vest", "Corselet", "Armor",
	],
	[ // ItemSubtype.HAND
		"Gauntlets", "Mitts", "Grips", "Handguards", "Bracers", "Gloves", "Clutches","Mittens", "Paws", "Fists",
	],
	[ // ItemSubtype.FEET
		"Greaves", "Sabatons", "Boots", "Shoes", "Footguards", "Treads", "Slippers", "Sandals", "Stompers",
	],
	[ // ItemSubtype.NECKLACE
		"Pendant", "Amulet", "Necklace", "Chain", "Torc", "Locket", "Collar", "Choker", "Beads", "Strand",
	],
	[ // ItemSubtype.RING
		"Band", "Ring", "Loop", "Circle", "Hoop", "Seal", "Gem", "Signet", "Spiral", "Loop",
	],
	[ // ItemSubtype.DAGGER
		"Stiletto", "Dagger", "Dirk", "Blade", "Knife", "Shank", "Spike", "Tanto",
	],
	[ // ItemSubtype.SWORD
		"Blade", "Sword", "Rapier", "Katana", "Cutlass", "Sabre", "Scimitar", "Broadsword", "Claymore", "Longsword",
	],
	[ // ItemSubtype.CLUB
		"Mace", "Club", "Cudgel", "Flail", "Bat", "Morningstar", "Warhammer", "Cosh", "Truncheon", "Knobkerrie",
	],
	[ // ItemSubtype.STAFF
		"Staff", "Rod", "Scepter", "Wand", "Pole", "Branch", "Cane", "Twig", "Macestaff", "Oakenstaff",
	],
	[ // ItemSubtype.SYTHE
		"Scythe", "Harvester", "Reaper", "Cleaver", "Sickle", "Grimblade", "Doomscythe", "Soulreaper", "Deathblade",
	],
	[ // ItemSubtype.AXE
		"Axe", "Hatchet", "Cleaver", "Battleaxe", "Tomahawk", "Greataxe", "Warblade", "Executioner", "Beardaxe", "Broadaxe",
	],
	[ // ItemSubtype.BOW
		"Bow", "Longbow", "Shortbow", "Recurve", "Crossbow", "Composite Bow", "Yewbow", "Hornbow", "Reflex Bow", "Flatbow",
	],
	[ // ItemSubtype.CROSSBOW
		"Crossbow", "Arbalest", "Repeating Crossbow", "Ballista", "Siege Crossbow", "Windlass", "Pistol Crossbow", "Hand Crossbow", "Rifle Crossbow", "Cranequin",
	],
	[ // ItemSubtype.GUN
		"Pistol", "Revolver", "Rifle", "Shotgun", "Blunderbuss", "Musket", "Sniper", "Hand Cannon", "Firearm", "Peacemaker",
	],
	[ // ItemSubtype.SHIELD
		"Shield", "Buckler", "Kite Shield", "Tower Shield", "Round Shield", "Heater Shield", "Targe", "Barrier", "Aegis", "Guard",
	],
	[ // ItemSubtype.AMMO
		"Arrows", "Bolts", "Bullets", "Quarrels", "Darts", "Blasts", "Shells", "Rounds", "Slugs",
	],
	[ // ItemSubtype.THROWABLE
		"Grenade", "Bomb", "Explosive", "Molotov", "Incendiary", "Smoke Bomb", "Flashbang", "Dagger",
	],
	[ // ItemSubtype.BAG
		"Pouch", "Satchel","Backpack", "Knapsack", "Haversack", "Rucksack", "Tote", "Quiver", "Bundle", "Purse",
	],
	[ // ItemSubtype.FOOD
		"Nourishment", "Sustenance", "Provisions", "Rations", "Sustenance", "Grub", "Sustainer", "Morsel", "Fare", "Meal",
	],
	[ // ItemSubtype.VALUABLE
		"Coin", "Gold", "Silver", "Copper", "Platinum", "Ruby", "Sapphire", "Emerald", "Diamond", "Opal",
	],
	[ // ItemSubtype.RELIC
		"Artifact", "Relic", "Talisman", "Idol", "Icon", "Statuette", "Trinket", "Sacrament",
	],
	[ // ItemSubtype.JUNK
		"Broken Gear", "Rusty Nail", "Torn Cloth", "Chipped Mug", "Cracked Glass", "Twisted Wire", "Bent Spoon", "Fractured Stone", "Dull Blade", "Worn-out Boot",
	],
];

global.item_prefix_dictionary = [
	"Enchanted", "Mystic", "Arcane", "Ethereal", "Sorcerer's", "Divine", "Magnetic", "Eternal", "Astral", "Celestial", "Epic", "Radiant", "Infernal", "Luminous",
	"Phantom", "Shadow", "Cursed", "Blessed", "Epic", "Vortex", "Ethereal", "Illusionary", "Spectral", "Epic", "Prismatic", "Nebula", "Fabled", "Otherworldly",
	"Hallowed", "Mythical",
];

global.item_suffix_dictionary = [
	"of Power", "of the Ancients", "of the Cosmos", "of the Void", "of Arcana", "of the Stars", "of Destiny", "of Illumination","of the Eclipse", "of the Serpent",
	"of the Phoenix", "of the Dragon", "of the Griffin", "of the Basilisk", "of the Unicorn", "of the Phoenix", "of the Eagle", "of the Gryphon", "of the Leviathan",
	"of the Chimera", "of the Hydra", "of the Specter", "of the Banshee", "of the Wraith", "of the Spirit", "of the Spectral", "of the Nether", "of the Abyss",
	"of the Inferno",
];

function choose_from_array(_arr) {
	var _arr_len = array_length(_arr);
	var _choice = irandom_range(0, _arr_len);
	return _arr[_choice];
}