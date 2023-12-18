inpLeft = keyboard_check(ord("A")) || keyboard_check(vk_left);
inpRight = keyboard_check(ord("D")) || keyboard_check(vk_right);
inpUp = keyboard_check(ord("W")) || keyboard_check(vk_up);
inpDown = keyboard_check(ord("S")) || keyboard_check(vk_down);

inpInventory = keyboard_check_pressed(ord("I")) || keyboard_check_pressed(vk_tab);

switch(state) {
	case PlayerState.IDLE:
		inpAttack = keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_left);
		move_x = inpRight - inpLeft;
		move_y = inpDown - inpUp;
		if(move_x != 0 || move_y != 0) set_state(PlayerState.WALK);
		if(inpAttack && self.can_attack) {
			self.can_attack = false;
			set_state(PlayerState.ATTACK);
		}
		if(inpInventory) {
			prev_sprite = sprite_index;
			inpInventory = false;
			set_state(PlayerState.IN_INV);
		}
		break;
	case PlayerState.WALK:
		inpAttack = keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_left);
		move_x = inpRight - inpLeft;
		move_y = inpDown - inpUp;
		if(move_x != 0) {
			image_xscale = move_x;
		}
		if(move_x == 0 && move_y == 0) set_state(PlayerState.IDLE);
		if(inpAttack) set_state(PlayerState.ATTACK);
		if(inpInventory) {
			prev_sprite = sprite_index;
			inpInventory = false;
			set_state(PlayerState.IN_INV);
		}
		break;
	case PlayerState.ATTACK:
		inpAttack = false;
		move_x = 0;
		move_y = 0;
		break;
	case PlayerState.IN_INV:
		global.pause = true;
		if(!instance_exists(oInventory)) {
			instance_create_layer(0, 0, "system", oInventory);
		} else if(inpInventory) {
			global.pause = false;
			instance_destroy(oInventory);
			inpInventory = false;
			set_sprite(prev_sprite);
			set_state(PlayerState.IDLE);
		}
		move_x = 0;
		move_y = 0;
		break;
	case PlayerState.IN_LOOT:
		global.pause = true;
		move_x = 0;
		move_y = 0;
		break;
	default:
		break;
}

// normalize diagonal movement
var move_length = point_distance(0, 0, move_x, move_y);
if(move_length > 1) {
	xspeed = move_x * (walkspeed / move_length);
	yspeed = move_y * (walkspeed / move_length);
} else {
	xspeed = move_x * walkspeed;
	yspeed = move_y * walkspeed;
}

// apply collision and movement
if(place_meeting(x + xspeed, y, oCollider)) {
	while(abs(xspeed) > 0.1) {
		xspeed *= 0.5;
		if(!place_meeting(x + xspeed, y, oCollider)) x += xspeed;
	}
	xspeed = 0;
}
x += xspeed;
if(place_meeting(x, y + yspeed, oCollider)) {
	while(abs(yspeed) > 0.1) {
		yspeed *= 0.5;
		if(!place_meeting(x, y + yspeed, oCollider)) y += yspeed;
	}
	yspeed = 0;
}
y += yspeed;