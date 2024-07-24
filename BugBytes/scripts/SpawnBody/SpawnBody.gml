// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SpawnBody(n_body_parts, previous_body){
	if(n_body_parts == 1) {
		current_body = instance_create_layer(previous_body.x+64, previous_body.y, "Enemies", obj_centurypede_body);
		current_body.left_neighbor = previous_body;
		previous_body.right_neighbor = current_body;
	}
	else {
		current_body = instance_create_layer(previous_body.x + 64, previous_body.y, "Enemies", obj_centurypede_body);
		current_body.left_neighbor = previous_body;	
		previous_body.right_neighbor = current_body;
		SpawnBody(n_body_parts - 1, current_body);
	}
	
}