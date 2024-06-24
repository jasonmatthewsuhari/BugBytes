// HOST AND JOIN TO BE COMBINED INTO JUST "MULTIPLAYER" LATER
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
	PLAYER_DAMAGED,
	PLAYER_DESTROYED,
}

enum SPRITE			// handle sprite direction (should change)
{
	LEFT = 0,
	RIGHT = 1,
	UP = 2,
	DOWN = 3
}

global.weapons = [obj_revolver, obj_shotgun];