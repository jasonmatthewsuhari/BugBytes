/// @description Destroy bullet on collision

//check for friendly fire
if (instance_exists(other) && instance_exists(owner) && instance_exists(owner.owner)) {
	if (!object_is_ancestor(other.object_index, object_get_parent(owner.owner.object_index))) {
		other.health_bar.curr_hp -= damage;
		instance_destroy(self);
	} else { }
	
}