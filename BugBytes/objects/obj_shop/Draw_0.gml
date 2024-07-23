/// @description Insert description here
// You can write your code in this editor
draw_self();
if (!shopOpen && place_meeting(x, y, obj_singleplayer)) {
	draw_sprite(Sprite84, 0, x + 40, y - 40);
}