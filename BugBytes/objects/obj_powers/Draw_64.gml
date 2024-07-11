for (var i = 0; i < array_length(powers); i++) {
	draw_sprite_ext(powers[i].sprite, 0, x_pos + x_pos_offset * i, y_pos, 0.5, 0.5, 0, c_white, 1);
	draw_text( x_pos + x_pos_offset * i, y_pos + 20, powers[i].name + " " + string(powers[i].amount));
}