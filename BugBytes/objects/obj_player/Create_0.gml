movement_array = array_create(4, 1);
moveSpeed = 4;
is_local = true;
playerID = -1;
name = global.username;

max_hp = 10;
hp = max_hp;

depth = -2
image_speed	 = 0;

weapon_x_offset = 28;					// offset x pos from player origin for weapons
weapon_y_offset = 17;					// offset y pos from player origin for weapons
weapon_x = x - weapon_x_offset;			// x pos for where weapon should be drawn 
weapon_y = y + weapon_y_offset;	

weapon = f_create_weapon(self, obj_revolver);

// DEBUG
if(global.camera_on) {
	instance_create_layer(0,0,"Instances",obj_mcamera);
	obj_mcamera.target = self;
}