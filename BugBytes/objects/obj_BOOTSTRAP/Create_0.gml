randomize();
AutomatedTesting();

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



global.camera_on = true;

// lowkey this is ugly but currently too lazy to make a whole new struct
global.waves = [
	[20, [obj_enemy_1, obj_enemy_2]], // at minute 0
	[60, [obj_enemy_1, obj_enemy_2]], // at minute 1
	[20, []], // at minute 2
	[20, []], // at minute 3
	[15, []], // at minute 4
	[1, []], // boss number 1
	[25, []], // at minute 5
	[25, []], // at minute 6
	[35, []], // at minute 7
	[10, []], // at minute 8
	[25, []], // at minute 9
	[1, []], // boss number 2
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
