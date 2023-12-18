target = oPlayer;
camera = camera_create();
camera_speed = 0.1;
var proj_mat = matrix_build_projection_ortho(320, 180, -1000, 1000);
var view_mat = matrix_build_lookat(x, y, depth, target.x, target.y, target.depth, 0, 1, 0);
camera_set_proj_mat(camera, proj_mat);
camera_set_view_mat(camera, view_mat);

view_enabled = true;
view_visible[0] = true;
view_set_camera(0, camera);