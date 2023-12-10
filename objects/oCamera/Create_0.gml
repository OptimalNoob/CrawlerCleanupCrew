target = oPlayer;
camera = camera_create();
camera_speed = 10;
var proj_mat = matrix_build_projection_ortho(320, 144, 0, 1000);
var view_mat = matrix_build_lookat(x, y, depth, target.x, target.y, target.depth, 0, 1, 0);
camera_set_proj_mat(camera, proj_mat);
camera_set_view_mat(camera, view_mat);

view_enabled = true;
view_visible[0] = true;
view_set_camera(0, camera);
view_wport[0] = 320;
view_hport[0] = 144;
view_xport[0] = 0;
view_yport[0] = 0;