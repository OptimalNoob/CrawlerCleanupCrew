if(!self.items_created && alarm[0] == -1) {
	var loot_count = array_length(self.loot_list);
	var j = 0;
	var _xx = 0;
	for(i = 0; i < loot_count; i++) {
		var _item = self.loot_list[i];
		if(i % 5 == 0) {
			if(i != 0) {
				j++;
				_xx = 0;
			}
		} else {
			_xx += 16;
		}
		var _yy = 16 * j;
		var _item_obj = instance_create_depth(x + (slot_anchor[0] + _xx), y + (slot_anchor[1] + _yy), depth - 1, oLootMenuObject);
		_item_obj.x = self.x + (slot_anchor[0] + _xx);
		_item_obj.y = self.y + (slot_anchor[1] + _yy);
		_item_obj.item_data = _item;
		_item_obj.callback_id = i;
	}
	
	// -240, -40
	buttons[0] = instance_create_depth(x + (self.button_anchor[0]), y + (self.button_anchor[1]), depth - 1, oButton);
	buttons[0].label = "Loot Selected";
	buttons[0].sprite_index = spr_button_a;
	buttons[0].onclick = handle_loot_selected;
	
	buttons[1] = instance_create_depth(x + (self.button_anchor[0]), y + (self.button_anchor[1]) + 20, depth - 1, oButton);
	buttons[1].label = "Loot All";
	buttons[1].sprite_index = spr_button_a;
	buttons[1].onclick = handle_loot_all;
	
	buttons[2] = instance_create_depth(x + (self.button_anchor[0]), y + (self.button_anchor[1]) + 40, depth - 1, oButton);
	buttons[2].label = "Discard Loot";
	buttons[2].sprite_index = spr_button_a;
	buttons[2].onclick = handle_loot_none;
	
	self.items_created = true;
}