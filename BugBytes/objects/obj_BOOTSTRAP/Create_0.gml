// resolve server ip by host later

PORT = 64000;
SERVER_IP = "127.0.0.1";
MAX_PLAYERS = 2;

enum DATA {
	INIT,
	UPDATE,
}

clients = ds_list_create();
server_identity = false;
global.MENU_INDEX = 0;