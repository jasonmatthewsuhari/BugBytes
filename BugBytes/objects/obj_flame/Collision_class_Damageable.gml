/// @description Insert description here
// You can write your code in this editor


timer--;
if (timer <= 0) {
	timer = cooldown;
	other.curr_hp -= damage;
	other.flash_alpha = 1;
	other.heal = false;
}