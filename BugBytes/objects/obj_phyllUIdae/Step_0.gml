/// @description Insert description here
// You can write your code in this editor
event_inherited();

if (curr_hp <= 0)	state = STATES.DEAD;
check_facing();
	
switch(state) {
	case STATES.IDLE:
		path_find();
		enemy_anim();
	break;
	case STATES.MOVE:
		spr_idle = spr_demon_idle;
		spr_attack = spr_demon_attack;
		spr_dead = spr_demon_dead;
		spr_hurt = spr_demon_hurt;
		spr_move = spr_demon_walk;
		enemy_anim();
		path_find();
		if path_index == -1		state = STATES.IDLE;
	break;
	case STATES.ATTACK:
		if instance_exists(target_id) && target_id != obj_singleplayer && target_id != obj_player {
			spr_idle = target_id.sprite_index;
			spr_attack = target_id.sprite_index;
			spr_dead = target_id.sprite_index;
			spr_hurt = target_id.sprite_index;
			spr_move = target_id.sprite_index;
		}
		perform_attack();
		enemy_anim();
		
	break;
	case STATES.HURT:
		path_speed = 0.75 * max_speed;
		enemy_anim();
	break;
	case STATES.DEAD:
		path_end();
		enemy_anim();
	break;
}

weapon_x = x;
weapon_y = y;