var _guiw = display_get_gui_width();
var _guih = display_get_gui_height();

draw_set_alpha(1.0);
draw_surface_part(application_surface, 0, 18, 320, 144, 0, 0);

draw_sprite(spr_inventory_ui, 0, _guiw, (_guih / 2) - 18);