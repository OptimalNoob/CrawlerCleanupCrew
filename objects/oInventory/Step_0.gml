if(!self.items_created && alarm[0] == -1) {
	var item_count = array_length(self.item_list);
	var j = 0;
	var _xx = 0;
	for(i = 0; i < item_count; i++) {
		var _item = self.item_list[i];
		if(i % 10 == 0) {
			if(i != 0) {
				j++;
				_xx = 0;
			}
		} else {
			_xx += 16;
		}
		var _yy = 16 * j;
		var _item_obj = instance_create_depth(x + (slot_anchor[0] + _xx), y + (slot_anchor[1] + _yy), depth - 1, oInventoryItem);
		_item_obj.x = self.x + (slot_anchor[0] + _xx);
		_item_obj.y = self.y + (slot_anchor[1] + _yy);
		_item_obj.item_data = _item;
		_item_obj.callback_id = i;
	}
	self.items_created = true;
}