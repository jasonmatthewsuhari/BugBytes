/// @description Insert description here
// You can write your code in this editor

if (curr_hp <= 0)	state = STATES.DEAD;
f_track_weapon(weapon);
check_facing();
var _face = sign(x - xprevious);
if _face != 0	face = _face;

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
		f_fire(weapon);
		enemy_anim();
		
	break;
	case STATES.HURT:
		path_speed = 0;
		enemy_anim();
	break;
	case STATES.DEAD:
		path_end();
		enemy_anim();
	break;
}

// update previous position
xp = x;
xp = y;

weapon_x = x + face * weapon_x_offset;
weapon_y = y + weapon_y_offset;