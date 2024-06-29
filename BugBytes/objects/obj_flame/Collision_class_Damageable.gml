/// @description Insert description here
// You can write your code in this editor


timer--;
if (timer <= 0) {
	timer = cooldown;
	other.curr_hp -= damage;
}
