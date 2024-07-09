/// @description Insert description here
// You can write your code in this editor

event_inherited();

if (curr_hp <= 0)	state = STATES.DEAD;
check_facing();
	
switch(state) {
	case STATES.IDLE:
		path_find();
		if path_index != -1		state = STATES.MOVE;
		enemy_anim();
	break;
	case STATES.MOVE:
		enemy_anim();
		path_find();
		if path_index == -1		state = STATES.IDLE;
	break;
	case STATES.ATTACK:
		perform_attack();
		enemy_anim();
		
	break;
	case STATES.HURT:
		path_speed = 0.5;
		enemy_anim();
	break;
	case STATES.DEAD:
		path_end();
		enemy_anim();
	break;
}

weapon_x = x;
weapon_y = y;