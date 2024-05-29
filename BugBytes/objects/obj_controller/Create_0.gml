SERVER_IP = "127.0.0.1";
PORT = 64000;
MAX_CLIENTS = 2;
is_server = false;

// Data types
enum DATA {
	INIT,
	UPDATE
}

// Connected clients
clients = ds_list_create();
global.MENU_INDEX = 0;