is_window_centered = false;

global.resolution_width = 320;
global.resolution_height = 180;
global.pause = false;

_init_items();
///
/// General Preferences .ini
///
var _ini = ini_open("pref.ini");
global.window_width = ini_read_real("display", "window_width", 1280);
global.window_height = ini_read_real("display", "window_height", 720);
global.window_fullscreen = ini_read_real("display", "window_fullscreen", 0);

ini_write_real("display", "window_width", global.window_width);
ini_write_real("display", "window_height", global.window_height);
ini_write_real("display", "window_fullscreen", global.window_fullscreen);
ini_close(); // closing "pref.ini"

///
/// Game Save Data .ini
///
_ini = ini_open("savegame.ini")
global.existing_save = ini_read_real("session", "old_file", 0);
global.player_health_max = ini_read_real("player", "max_health", 3);
global.player_health = ini_read_real("player", "health", global.player_health_max);
global.player_money = ini_read_real("player", "money", 0);

ini_write_real("player", "max_health", global.player_health_max);
ini_write_real("player", "health", global.player_health);
ini_write_real("player", "money", global.player_money);
ini_close(); // closing "savegame.ini"

// Apply Display Settings
display_set_gui_size(global.resolution_width, global.resolution_height);
surface_resize(application_surface, global.resolution_width, global.resolution_height);

if(global.window_fullscreen) {
	window_set_fullscreen(true);
} else {
	window_set_size(global.window_width, global.window_height);
	alarm[0] = 1;
}

global.fntHeading = font_add_sprite_ext(
	spr_heading_font,
	"0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$%-+*/=.:?",
	false,
	0
);

randomize();