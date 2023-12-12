var _vw = 320;
var _vh = 144;

if(!instance_exists(oInventory)) {
	x = clamp(x, 0 + _vw / 2, room_width - _vw / 2);
	y = clamp(y, 0 + _vh / 2, room_height - _vh / 2);
}

var view_mat = matrix_build_lookat(x, y, depth, x, y, 1, 0, 1, 0);
camera_set_view_mat(camera, view_mat);