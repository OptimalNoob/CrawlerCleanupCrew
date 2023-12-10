self.image_speed = 0;
self.image_index = 0;

self.state = PlayerState.IDLE;

self.xspeed = 0;
self.yspeed = 0;
self.walkspeed = 1;

self.health_max = global.player_health_max;
self.health = global.player_health;

self.look_dir = 0; // 0-right | 1-down | 2-left | 3-up, for attacks
self.attacking = false;

instance_create_layer(x, y, "system", oCamera);

enum PlayerState {
	IDLE,
	WALK,
	ATTACK,
	IN_INV
}

function set_sprite(spr_index) {
	if(sprite_index != spr_index) {
		sprite_index = spr_index;
		image_index = 0;
	}
}

function set_state(_state) {
	if(self.state != _state) {
		self.state = _state;
	}
}

function spawn_attackbox() {
	if(!attacking){
		var attack_boxes = [
			[x + sprite_width, y - sprite_height / 3], // right
			[x, y + sprite_height / 2], // down
			[x + sprite_width, y - sprite_height / 3], // left
			[x, y - sprite_height] // up
		];
		if(!instance_exists(oPlayerAttackBox)) {
			attacking = true;
			var _box_coords = attack_boxes[look_dir];
			var _box = instance_create_depth(_box_coords[0], _box_coords[1], depth, oPlayerAttackBox);
			_box.image_xscale = self.image_xscale;
		}
	}
}