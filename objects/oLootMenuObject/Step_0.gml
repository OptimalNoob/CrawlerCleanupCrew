if(position_meeting(mouse_x, mouse_y + 18, self)) {
	self.hovered = true;
	window_set_cursor(cr_handpoint);
}

if(!position_meeting(mouse_x, mouse_y + 18, self) && self.hovered) {
	self.hovered = false;
	window_set_cursor(cr_default);
}

if(self.hovered && mouse_check_button_pressed(mb_left)) {
	self.selected = !self.selected;
}