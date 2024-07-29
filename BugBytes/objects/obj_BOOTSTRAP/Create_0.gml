randomize();
AutomatedTesting();


//debug
// window_set_fullscreen(true);

audio_group_load(Music);
audio_group_load(SFX);



enum PACKETS {
	JOIN,
	READY,
	INIT,
	EVENT,
	CONTINUOUS,
	SPAWN,
	TIME,
}

enum EVENTS {
	PLAYER_SHOOTS,
	PLAYER_DAMAGED,
	PLAYER_DESTROYED,
	ENEMY_SPAWNED,
}

enum STATES
{
	IDLE,
	MOVE,
	ATTACK,
	DEAD,
	HURT,
}

global.weapons = [obj_revolver, obj_shotgun];
global.username = "";

global.master_volume = 0.95;
global.music_volume = 0.95;
global.sfx_volume = 0.95;



global.camera_on = true;

// lowkey this is ugly but currently too lazy to make a whole new struct
global.waves = [
	[2, [obj_ant]], // at minute 0
	[4, [obj_ant, obj_phyllUIdae]], // at minute 1
	[5, [obj_ant, obj_phyllUIdae]], // at minute 2
	[1, [obj_big_zombie]], // at minute 3
	[2, [obj_ant, obj_fleaswarm]], // at minute 4
	[2, [obj_phyllUIdae, obj_big_zombie]], // boss number 1
	[5, [obj_ant, obj_fleaswarm]], // at minute 5
	[1, [obj_centurypede_head]], // at minute 6
	[50, [obj_centurypede_head], // at minute 7
	[10, [obj_ant, obj_big_zombie]], // at minute 8
	[25, [obj_ant, obj_big_zombie]], // at minute 9
	[1, [obj_ant, obj_big_zombie]], // boss number 2
	[25, []], // at minute 10
	[5, []], // at minute 11
	[40, []], // at minute 12
	[33, []], // at minute 13
	[15, []], // at minute 14
	[1, []], // boss number 3
	[15, []], // at minute 15
	[20, []], // at minute 16
	[50, []], // at minute 17
	[30, []], // at minute 18
	[25, []], // at minute 19
	[1, []], // final boss
	
];
