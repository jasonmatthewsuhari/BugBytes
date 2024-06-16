/// @description Insert description here
// You can write your code in this editor
switch(state) {
	case STATES.DEAD:
		instance_destroy(self);
	break;
	case STATES.HURT:
		path_speed = max_speed;
		state = STATES.MOVE;
	break;
	case STATES.ATTACK:
		image_index = image_number - 1;
		if place_meeting(x, y, class_Damageable_Friendly) {
			if object_is_ancestor(other.object_index, class_Damageable_Friendly) {
				other.curr_hp -= damage;
			}
		}
		state = STATES.MOVE;
	break;
}
