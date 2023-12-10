var gui_w = global.resolution_width;
var gui_h = global.resolution_height;

draw_set_color(c_white);
draw_set_alpha(1.0);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_font(global.fntHeading);
draw_text_transformed(gui_w / 2, gui_h / 3, "Crawler\nCleanup\nCrew", 1.0, 1.0, 0);

draw_set_font(fntMain);
if(global.existing_save) {
	draw_text(gui_w / 2, gui_h - 48, "Space to continue...");
} else {
	draw_text(gui_w / 2, gui_h - 48, "Space to begin...");
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);