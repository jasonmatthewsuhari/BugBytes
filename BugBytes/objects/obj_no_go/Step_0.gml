/// @description Insert description here
// You can write your code in this editor

#region handle HP tracking

f_check_healthbar(self);

#endregion

if !global.time_stop {
#region enemy spawning
spawn_timer--;
if (spawn_timer <= 0 && spawn_count < max_spawn) {
	instance_create_layer(x + irandom_range(-200, 200), y + irandom_range(-200, 200), "Instances", obj_cool_roach);
	spawn_timer = cooldown;
}

#endregion
}