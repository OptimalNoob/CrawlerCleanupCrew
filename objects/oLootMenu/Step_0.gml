if(!self.items_created) {
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
	}
	self.items_created = true;
}