/// @description use equipped item
if global.shop exit;			// if shop open, exit step
if !is_instanceof(weapon, Weapon)		weapon.use();