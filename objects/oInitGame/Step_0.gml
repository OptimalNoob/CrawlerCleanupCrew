if(!global.window_fullscreen) {
	// Checking due to 1 frame delay requirement for 'window_center()', thanks GameMaker...
	if(is_window_centered) {
		room_goto(rmTitle);
	}
} else {
	room_goto(rmTitle);
}