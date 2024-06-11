// HOST AND JOIN TO BE COMBINED INTO JUST "MULTIPLAYER" LATER
global.MENU_INDEX = 0;
global.MENU_OPTIONS = ["SINGLEPLAYER", "MULTIPLAYER HOST", "MULTIPLAYER JOIN", "SETTINGS", "CREDITS", "EXIT"];

global.IS_MULTIPLAYER = false;

enum PACKETS {
	INIT,
	EVENT,
	CONTINUOUS,
	SPAWN,
	TIME,
}

enum EVENTS {
	PLAYER_DAMAGED,
	
}

enum SPRITE			// handle sprite direction (should change)
{
	LEFT = 0,
	RIGHT = 1,
	UP = 2,
	DOWN = 3
}

global.weapons = [obj_revolver, obj_shotgun];