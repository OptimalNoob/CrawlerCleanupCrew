self.loot_list = [];
self.slot_anchor = [-112, -40];
self.button_anchor = [-240, -16];
self.items_created = false;
self.buttons = [];
self.displaying_error = false;
self.displayed_error = "";
alarm[0] = 1;
//self.loot_slot_coords = [
//	[208, 48]
//]

function handle_loot_selected() {
	if(!self.displaying_error) {
		var r = 0;
		var selected_count = 0;
		repeat(array_length(loot_list)) {
			if(loot_list[r].selected) {
				if(!self.displaying_error) {
					array_push(global.player_inventory, loot_list[r]);
				}
				selected_count++;
			}
			r++;
		}
		if(selected_count == 0) {
			self.displaying_error = true;
			self.displayed_error = "No Items Selected!";
			alarm[1] = 120;
		}
	
		r = 0;
		repeat(array_length(global.player_inventory)) {
			show_debug_message(global.player_inventory[r].item_name);
			r++;
		}
		if(!self.displaying_error) {
			instance_destroy();
		}
	}
}

function handle_loot_all() {
	if(!self.displaying_error) {
		var r = 0;
		repeat(array_length(loot_list)) {
			array_push(global.player_inventory, loot_list[r]);
			r++;
		}
	
		r = 0;
		repeat(array_length(global.player_inventory)) {
			show_debug_message(global.player_inventory[r].item_name);
			r++;
		}
		instance_destroy();
	}
}

function handle_loot_none() {
	instance_destroy();
}