draw_self();
if(self.displaying_error) {
	draw_set_color(c_yellow);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(x - (sprite_width / 2), y + (sprite_height / 2) - 16, self.displayed_error);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_white);
}