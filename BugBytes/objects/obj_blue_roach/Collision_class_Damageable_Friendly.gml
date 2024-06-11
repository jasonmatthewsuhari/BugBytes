/// @description Deal damage

if (other != owner) {
	timer--;
	if (timer <= 0) {
		timer = cooldown;
		other.curr_hp -= damage;
	}
}