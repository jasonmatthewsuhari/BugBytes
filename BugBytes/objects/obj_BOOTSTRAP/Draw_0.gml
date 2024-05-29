if(room == rm_game) {
	draw_set_color(c_black);
	draw_text(20,20,"Players: " + string(ds_list_size(clients)));
}