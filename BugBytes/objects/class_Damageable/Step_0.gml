/// @description check healthbar

if (curr_hp <= 0)	instance_destroy(self);
if (curr_hp >= max_hp)	curr_hp = max_hp;

if(flash_alpha > 0) {
	flash_alpha -= 0.1;	
}