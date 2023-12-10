if(!opened && collision_circle(x, y - sprite_height / 2, sprite_width / 2, oPlayer, false, true)) {
	self.can_interact = true;
} else {
	self.can_interact = false;
}

if(self.can_interact && keyboard_check_pressed(ord("E"))) {
	self.opened = true;
}