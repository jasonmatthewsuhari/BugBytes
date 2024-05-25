// WASD = 0123
hspd = walking_speed * (movement_array[3] - movement_array[1]);
vspd = walking_speed * (movement_array[2] - movement_array[0]);

x += hspd;
y += vspd;