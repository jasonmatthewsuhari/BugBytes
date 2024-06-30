// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function LobbyTesting(){
	// SECTION 2: LOBBY TESTING
	global.file = file_text_open_write(working_directory + "multiplayer_test.txt");
	
	/// Test 1 - Test that there is no existing server object
	file_text_write_string(global.file, "Test 1 - No Existing Server Object: " + boolstr(!instance_exists(obj_server))); 
	
	/// Test 2 - Test that there is no existing client object
	file_text_write_string(global.file, "Test 2 - No Existing Client Object: " + boolstr(!instance_exists(obj_client))); 
}