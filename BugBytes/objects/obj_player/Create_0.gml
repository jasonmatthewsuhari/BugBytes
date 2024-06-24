movement_array = array_create(4, 1);
moveSpeed = 4;
is_local = true;
playerID = -1;
name = "";

max_hp = 10;
hp = max_hp;

depth = -2
image_speed	 = 0;

instance_create_layer(0,0,"Instances",obj_mcamera);
obj_mcamera.target = self;