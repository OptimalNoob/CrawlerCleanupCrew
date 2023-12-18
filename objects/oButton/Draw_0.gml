var label_width = string_width(self.label);
var label_length = string_length(self.label)

if(!self.scale_set && label_length != 0) {
	image_xscale = ((label_width + 8) / sprite_width);
	self.scale_set = true;
}

draw_self();
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(self.label_color);
draw_text(x + (sprite_width / 2), y + (sprite_height / 2), self.label);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);