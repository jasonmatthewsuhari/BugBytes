global.weapon_list = {
	
	revolver: new Weapon(
	"Revolver",
	spr_revolver,
	25,
	500,
	snd_blaster	
	),
	
	shotgun: new Weapon(
	"Shotgun",
	spr_shotgun,
	60,
	250,
	snd_vine_boom,
	obj_shotgun_bullet,
	3,
	15
	),
	
	heal_gun: new Weapon(
	"Heal Gun",
	spr_heal_gun,
	30,
	800,
	snd_blaster,
	obj_heal_gun_bullet
	)
}
