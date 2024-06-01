/// @description Attack with weapon

if (instance_exists(weapon))
{

	switch (object_get_parent(weapon.object_index)) 
		{
		case class_Melee:
			instance_destroy(self);
			break;
	
		case class_Gun:
			f_fire(weapon);
			break;
		}

}