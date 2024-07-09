/// @description check healthbar

if (curr_hp <= 0)	instance_destroy(self);

if(flash_alpha > 0) {
	flash_alpha -= 0.1;	
}