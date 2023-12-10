var view_mat = matrix_build_lookat(x, y, depth, x, y, 1, 0, 1, 0);
camera_set_view_mat(camera, view_mat);