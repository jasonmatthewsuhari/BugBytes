/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

global.music_volume = value;
audio_group_set_gain(Music, value, 1);
