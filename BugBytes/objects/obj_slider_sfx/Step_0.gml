/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

global.sfx_volume = value;
audio_group_set_gain(SFX, value, 1);
