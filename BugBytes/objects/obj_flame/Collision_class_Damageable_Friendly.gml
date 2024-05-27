/// @description Deal damage

if (other != owner) {
	timer--;
	if (timer <= 0) {
		timer = cooldown;
		other.health_bar.curr_hp -= damage;
	}
}