/// @function
/// @description Used to create and populate a DS Grid using a two-dimensional array.
/// @param {array} array_2d The array to create the DS Grid from.
function ds_grid_create_from_array(array_2d) {
	var array_row_count = array_length(array_2d);
	var array_row_width = array_length(array_2d[0]);
	var ds_grid = ds_grid_create(array_row_width, array_row_count);
	
	var yy = 0;
	repeat(array_row_count){
		var row = array_2d[yy];
		var xx = 0;
		repeat(array_row_width){
			ds_grid[# xx, yy] = row[xx];
			xx++;
		}
		yy++
	}
	return ds_grid;
};