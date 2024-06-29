/// @description 
draw_self();

draw_set_color(c_black);
draw_text(x-35, y-73, name);
draw_set_color(c_white);	

draw_healthbar(x-35, y-50, x + sprite_width - 60, y - 47, (hp/max_hp)*100, c_black, c_red, c_lime, 0, true, true);