draw_self();
if(self.can_interact) {
	draw_sprite(spr_interact_button_e, 0, x, y - sprite_height);
}

image_index = self.opened;