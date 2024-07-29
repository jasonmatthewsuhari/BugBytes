/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

// Draw Event
if (darker) {
    // Make the sprite darker
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, merge_color(c_black, c_white, 0.5), image_alpha);
} else {
    // Draw the sprite normally
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
}
