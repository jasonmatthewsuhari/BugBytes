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
		curr_hp += damage;
		if curr_hp > max_hp curr_hp = max_hp;
		heal = true;
		flash_alpha = 0.1;
		
	break;
	case STATES.HURT:
		path_speed = 0.75 * max_speed;
		enemy_anim();
		heal = false;
	break;
	case STATES.DEAD:
		path_end();
		enemy_anim();
	break;
}

weapon_x = x;
weapon_y = y;