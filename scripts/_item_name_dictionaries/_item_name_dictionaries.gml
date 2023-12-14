#region MATERIAL NAMES
global.item_material_names_leather = [
	"Skinweave",
	"Toughskin",
	"Softskin",
	"Flextex",
];
global.item_material_names_iron = [
	"Slate",
	"Alloy",
	"Stonechrome",
	"Ferrumcore",
];
global.item_material_names_gold = [
	"Sunfire",
	"Aurelian",
	"Amber",
	"Solaris",
	"Lustrite",
];
global.item_material_names_diamond = [
	"Icefire",
	"Gleamstone"
];
#endregion MATERIAL NAMES
#region ARMOR NAMES
global.item_names_helms = [
  "Stellarvisor",
  "Tempestcrown",
  "Luminarhood",
  "Voidwhisper Casque",
  "Cosmic Veil",
  "Earthguard Helm",
  "Frostvisor",
  "Moltenmask",
  "Thunderhelm",
  "Chronocrown"
];
global.item_names_torsos = [
  "Astralplate",
  "Stormguard Chestguard",
  "Luminarrobe",
  "Voidwhisper Breastplate",
  "Cosmic Shroud",
  "Earthguard Chestguard",
  "Frostplate",
  "Moltencuirass",
  "Thundermail",
  "Chronoarmor"
];
global.item_names_gloves = [
  "Starfingers",
  "Tempestgrip",
  "Luminarwraps",
  "Voidwhisper Gauntlets",
  "Cosmic Grasp",
  "Earthtouch Gloves",
  "Frostgrip",
  "Moltenfingers",
  "Thundersheath",
  "Chronohands"
];
global.item_names_boots = [
  "Stellarstriders",
  "Tempestwalkers",
  "Luminarstep",
  "Voidwhisper Sabatons",
  "Cosmic Soles",
  "Earthbound Boots",
  "Frostwalkers",
  "Moltenhooves",
  "Thunderstriders",
  "Chronoboots"
];
#endregion ARMOR NAMES
#region WEAPON NAMES
global.item_names_daggers = [
	"Shadowthorn",
	"Swiftslicer",
	"Ghostpoint",
	"Emberpoker",
	"Starstrike",
	"Stormcutter",
	"Radiantcleave",
	"Darkslash",
	"Cosmicutter",
	"Earthbreaker",
	"Frostchipper",
	"Moltenmaw",
	"Thunderbash",
	"Timehewer",
];
global.item_names_swords = [
  "Starshard",
  "Stormscythe",
  "Radiantlash",
  "Darkrend",
  "Cosmoglaive",
  "Earthglaive",
  "Frostcarver",
  "Moltenbrand",
  "Thunderlash",
  "Timecleaver"
];
global.item_names_axes = [
  "Earthshatter",
  "Frostchipper",
  "Moltenmaw",
  "Thunderbash",
  "Timehewer",
  "Starcrusher",
  "Stormcleaver",
  "Radiantrend",
  "Darksmash",
  "Cosmicrusher"
];
global.item_names_clubs = [
  "Stellarbasher",
  "Quakecrusher",
  "Icecruncher",
  "Magmaclub",
  "Thunderthud",
  "Nebulonudger",
  "Aurorapounder",
  "Shadowsmasher",
  "Chronocudgel",
  "Galaxywhacker"
];
global.item_names_staves = [
  "Aetherweaver",
  "Stormcaller",
  "Luminarafter",
  "Darkwhisper",
  "Cosmiccrafter",
  "Earthbinder",
  "Frostweaver",
  "Moltenorbiter",
  "Thunderchanneler",
  "Timebender"
];
global.item_names_sythes = [
  "Soulreaper",
  "Voidharvester",
  "Eclipsescythe",
  "Abyssalcleaver",
  "Nebulascythe",
  "Quasarharvest",
  "Shadowreaper",
  "Stellarscythe",
  "Galaxyedge",
  "Timeharvester"
];
global.item_names_bows = [
  "Starbender",
  "Tempestcaster",
  "Luminarshot",
  "Voidwhisper String",
  "Cosmic Holster",
  "Earthshooter",
  "Frostflinger",
  "Molten Surge",
  "Thunderdraw",
  "Chronostring"
];
global.item_names_crossbows = [
  "Starcrank",
  "Tempestlauncher",
  "Luminarquill",
  "Voidwhisper Bolter",
  "Cosmic Retainer",
  "Earthpulser",
  "Frostcaster",
  "Moltenshooter",
  "Thunderbolt",
  "Chronoquill"
];
global.item_names_shields = [
  "Astralward",
  "Stormguard",
  "Luminarbarricade",
  "Voidwhisper Aegis",
  "Cosmic Bulwark",
  "Earthshield",
  "Frostward",
  "Moltenshell",
  "Thunderguard",
  "Chronoward"
];
#endregion WEAPON NAMES
#region USABLE NAMES
global.item_names_foodstuff = [
	"Sustenblend",
	"Gastronova",
	"Neurofuel",
	"Energesta"
];
global.item_names_bags = [
  "Pouch",
  "Satchel",
  "Pack",
  "Carryall",
  "Tote",
  "Gatherer",
  "Hauler",
  "Sack"
];
#endregion USABLE NAMES
#region VALUABLE NAMES
global.item_names_fossils = [
	"Chronostone",
];
global.item_names_scriptures = [
	"Inscriptorb",
	"Archivium"
];
#endregion VALUABLE NAMES

function choose_from_array(_arr) {
	var _arr_len = array_length(_arr);
	var _choice = irandom_range(0, _arr_len);
	return _arr[_choice];
}