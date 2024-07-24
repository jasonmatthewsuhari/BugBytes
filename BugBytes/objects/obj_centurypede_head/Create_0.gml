event_inherited();

state = STATES.IDLE;

n_body_parts = 15;
left_neighbor = noone;
right_neighbor = noone;


going_direction = point_direction(x,y,obj_singleplayer.x, obj_singleplayer.y);


SpawnBody(n_body_parts, self);