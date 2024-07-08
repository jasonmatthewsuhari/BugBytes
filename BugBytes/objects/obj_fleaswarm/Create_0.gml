swarm_number = 60;
swarm_spread = 100;
for(var i = 0; i < swarm_number; i++) {
	instance_create_layer(x + irandom(10), y + irandom(10), "Enemies", obj_flea);
}
instance_destroy();