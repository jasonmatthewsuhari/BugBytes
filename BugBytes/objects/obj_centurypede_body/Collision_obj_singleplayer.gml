
if(other.hp - 5 <= 0) {
	instance_destroy(other);
}
else{
	other.hp -= 5;
}