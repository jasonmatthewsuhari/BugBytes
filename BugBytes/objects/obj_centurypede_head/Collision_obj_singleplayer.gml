
if(other.curr_hp - 5 <= 0) {
	instance_destroy(other);
}
else{
	other.curr_hp -= 5;
}