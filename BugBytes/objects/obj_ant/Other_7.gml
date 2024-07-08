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
		state = STATES.MOVE;
	break;
}
