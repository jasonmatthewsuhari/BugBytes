/// @description Receives damage from weapons

if (other.owner != self) {

	other.timer--;
	if (other.timer <= 0) {
		other.timer = other.cooldown;
		health_bar.curr_hp -= other.damage;
	}
}