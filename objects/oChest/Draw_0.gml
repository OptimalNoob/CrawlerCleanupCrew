draw_self();
if(self.can_interact) {
	draw_sprite(spr_interact_button_e, 0, x, y - sprite_height);
}

image_index = self.opened;

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_set_alpha(1.0);

if(self.debug_drawing) {
	draw_set_color(c_black);
	draw_rectangle(0, 0, view_wport, view_hport / 2, false);
	draw_set_color(c_white);
	for(i = 0; i < array_length(self.generated_loot); i++) {
		draw_text(4, (8 * i) + 4, string(self.generated_loot[i]));
	}
}