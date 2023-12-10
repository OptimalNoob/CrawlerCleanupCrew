if(keyboard_check_pressed(vk_space)) {
	if(!global.existing_save) {
		var _ini = ini_open("savegame.ini")
		global.existing_save = true;
		ini_write_real("session", "old_file", global.existing_save);
		ini_close(); // closing "savegame.ini"
		
		// TODO: Add menu for selecting new game difficulty
		// TODO: Generate random dungeon order from difficulty group and load
		//		 the first dungeon and level in order.
		// TODO: Add tutorial level if there's enough time.
		if(!instance_exists(oGame)) {
			instance_create_layer(0, 0, "system", oGame);
		}
		room_goto(rmDev);
	} else {
		// TODO: Resume level from save file.
		room_goto(rmDev);
	}
}