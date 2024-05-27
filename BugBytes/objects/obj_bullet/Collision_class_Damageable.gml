/// @description Destroy bullet on collision

//check for friendly fire
if (object_is_ancestor(other.object_index, object_get_parent(owner.owner.object_index))) {
	other.health_bar.curr_hp -= damage;
	instance_destroy(self);
} else {

}