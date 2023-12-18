if(!global.pause && !opened && collision_circle(x, y - sprite_height / 2, sprite_width / 2, oPlayer, false, true)) {
	self.can_interact = true;
} else {
	self.can_interact = false;
}

if(self.can_interact && keyboard_check_pressed(ord("E"))) {
	self.opened = true;
	self.generated_loot = generate_chest_loot(self.rarity);
	
	oPlayer.set_state(PlayerState.IN_LOOT);
	
	var _menu = instance_create_layer(oCamera.x + (view_wport / 2), oCamera.y, "system", oLootMenu);
	_menu.loot_list = self.generated_loot;
	
	//alarm[0] = 240;
	//self.debug_drawing = true;
}

if(instance_exists(oLootMenu)) {
	oLootMenu.x = oCamera.x + (view_wport / 2);
	oLootMenu.y = oCamera.y;
}