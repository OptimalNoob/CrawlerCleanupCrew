if(!instance_exists(oInventory)) {
	x = lerp(x, target.x, camera_speed);
	y = lerp(y, target.y, camera_speed);
} else {
	x = lerp(x, target.x + (view_wport / 3), camera_speed * 2);
	y = lerp(y, target.y - (target.sprite_height / 2), camera_speed * 2);
}