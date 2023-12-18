switch(state) {
	case PlayerState.IDLE:
		image_speed = 0;
		image_index = 0;
		break;
	case PlayerState.WALK:
		image_speed = 1;
		if(move_x != 0) {
			image_xscale = move_x;
		}
		if(move_y > 0) {
			set_sprite(s_player_move_front);
			look_dir = 1;
		} else if(move_y < 0) {
			set_sprite(s_player_move_back);
			look_dir = 3;
		} else {
			if(move_x != 0) {
				set_sprite(s_player_move_front);
				if(move_x < 0) {
					look_dir = 2;
				} else {
					look_dir = 0;
				}
			}
		}
		break;
	case PlayerState.ATTACK:
		var _attack_frame = 3;
		image_speed = 1;
		if(sprite_index == s_player_move_back) {
			set_sprite(s_player_attack_back);
		} else if(sprite_index == s_player_move_front) {
			set_sprite(s_player_attack_front);
		}
		if(image_index >= _attack_frame) {
			spawn_attackbox();
		}
		if(image_index >= image_number - 1) {
			attacking = false;
			self.can_attack = true;
			set_state(PlayerState.IDLE);
		}
		break;
	case PlayerState.IN_INV: case PlayerState.IN_LOOT:
		set_sprite(s_player_move_front);
		image_speed = 0;
		image_index = 0;
		break;
	default:
		break;
}
draw_self();