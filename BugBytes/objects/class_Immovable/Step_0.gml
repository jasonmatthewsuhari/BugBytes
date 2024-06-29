// keys = WASD / up left down right / 0 1 2 3

if(keyboard_check_pressed(ord("W"))) {
	SendPacket(0, true);
}

if(keyboard_check_released(ord("W"))) {
	SendPacket(0, false);
}

if(keyboard_check_pressed(ord("A"))) {
	SendPacket(1, true);
}

if(keyboard_check_released(ord("A"))) {
	SendPacket(1, false);
}

if(keyboard_check_pressed(ord("S"))) {
	SendPacket(2, true);
}

if(keyboard_check_released(ord("S"))) {
	SendPacket(2, false);
}

if(keyboard_check_pressed(ord("D"))) {
	SendPacket(3, true);
}

if(keyboard_check_released(ord("D"))) {
	SendPacket(3, false);
}