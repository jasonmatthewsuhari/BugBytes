/// @description use equipped item

if is_instanceof(weapon, Weapon) {
	fire_weapon(class_Damageable_Enemy);
} else {
	weapon.use();
}