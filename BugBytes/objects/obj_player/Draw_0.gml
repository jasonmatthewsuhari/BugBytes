/// @description 
draw_self();

if(global.IS_MULTIPLAYER) {
	draw_set_color(c_black);
	draw_text(x, y-33, "Player " + string(playerID + 1));
	draw_set_color(c_white);	
}

draw_healthbar(x, y-10, x + sprite_width, y - 5, (hp/max_hp)*100, c_black, c_red, c_lime, 0, true, true);