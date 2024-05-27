/// @description Draw all info related to player

draw_self();

draw_set_halign(fa_center);
draw_text(x, y - sprite_height + 30, string_concat("HP:", health_bar.curr_hp));