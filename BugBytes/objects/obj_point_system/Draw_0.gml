/// @description draw point system data

if instance_exists(obj_camera) {
	x_pos = obj_camera.x + x_offset;
	y_pos = obj_camera.y - y_offset;
} else {
	x_pos = x;
	y_pos = y;
}

draw_set_halign(fa_center);
draw_text_color(x_pos, y_pos, string_concat("Points:", global.point), c_green, c_green, c_green, c_green, 1);