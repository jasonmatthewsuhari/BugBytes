function SpawnBullet(shooter_x, shooter_y, cursor_x, cursor_y){
	bullet = instance_create_layer(shooter_x, shooter_y, "Instances", obj_mbullet);
	bullet.direction = point_direction(shooter_x, shooter_y, cursor_x, cursor_y);
}