/// @description Initialise HealthDisplay

// The following variables must be declared when creating an instance of this class
/*
	owner = noone;
	max_hp = 0;
	curr_hp = max_hp;
	
	// Additionally, owners should have the following code in:
	
	Create Event: (Note: Replace obj_owner with the object name of the owner)
		health_bar = instance_create_depth(x, y - obj_owner.sprite_height / 2 - 10, depth, class_HealthDisplay,
			{
				owner: obj_player,
				max_hp: 100,
				curr_hp: 100		
			});
		
	Draw Event:
		draw_set_halign(fa_center);
		draw_text(x, y - sprite_height + 30, string_concat("HP:", health_bar.curr_hp));
		
	Step Event:
		if (health_bar.curr_hp <= 0)	instance_destroy(self);
*/