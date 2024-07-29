for (var i = 0; i < array_length(powers); i++) {
	draw_sprite_ext(powers[i].sprite, 0, x_pos + x_pos_offset * i, y_pos, 1, 1, 0, c_white, 1);
	draw_text_color(x_pos + x_pos_offset * i, y_pos + 20, string(powers[i].amount),c_green, c_green, c_green, c_green, 1);
}

