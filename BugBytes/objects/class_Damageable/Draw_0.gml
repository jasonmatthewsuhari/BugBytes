/// @description draw healthbar

if(flash_alpha > 0) {
	shader_set(sh_flash);
	if (heal) {
		flash_colour = heal_colour;
	} else {
		flash_colour = damage_colour;
	}
	
	draw_sprite_ext(sprite_index, image_index, x, y, face, 1, 0, flash_colour, flash_alpha);
	shader_reset();
}
else {
	draw_sprite_ext(sprite_index, image_index, x, y, face, 1, 0, c_white, 1);

}