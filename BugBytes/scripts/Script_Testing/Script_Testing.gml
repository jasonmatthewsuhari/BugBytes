// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function __check_gma_equal(_in) {
	if _in == 1		return "Passed\n";
	return "Failed\n";
}


global.file = file_text_open_write(working_directory + "inventory_testing.txt");

function inventory_test() 
{
	var file = global.file;
	#region Inventory Test Case (.item_add)

	// Adding Test case 1 (empty item struct)
	var _i1 = new Inventory();
	_i1.item_add("example", 40, {});
	var _i1_expected = [{name: "example", quantity: 40, item: {} }];

	file_text_write_string(file, "Inventory Test 1 (Adding empty item struct): " + 
		__check_gma_equal(__gma_equal__(_i1._inventory_items, _i1_expected)));
	
	// Adding Test case 2 (name and description for item struct)
	var _i2 = new Inventory();
	_i2.item_add("example", 40, {name: "example", description: "this is an example"});
	var _i2_expected = [{name: "example", quantity: 40, item: {name: "example", description: "this is an example"} }];

	file_text_write_string(file, "Inventory Test 2 (Adding filled item struct): " + 
		__check_gma_equal(__gma_equal__(_i2._inventory_items, _i2_expected)));

	// Adding Test case 3 (wrong name and description for item struct)
	var _i3 = new Inventory();
	_i3.item_add("example", 40, {name: "example", description: "this is an example"});
	var _i3_expected = [{name: "example", quantity: 40, item: {name: "", description: ""} }];

	file_text_write_string(file, "Inventory Test 3 (Add with wrong name and description for item struct): " + 
		__check_gma_equal(!__gma_equal__(_i3._inventory_items, _i3_expected)));
	
	// Adding Test case 4 (add items into current inventory)
	_i2.item_add("second item", 30,{name: "second item", description: "this is the next item"});
	_i2_expected = [{name: "example", quantity: 40, item: {name: "example", description: "this is an example"}}, {name: "second item", quantity: 30, item: {name: "second item", description: "this is the next item"}}];
	file_text_write_string(file, "Inventory Test 4 (Adding more items into inventory): " + 
		__check_gma_equal(__gma_equal__(_i2._inventory_items, _i2_expected)));
	
	// Adding Test case 5 (add same item into current inventory)
	_i2.item_add("second item", 70,{name: "second item", description: "this is the next item"});
	_i2_expected = [{name: "example", quantity: 40, item: {name: "example", description: "this is an example"}}, {name: "second item", quantity: 100, item: {name: "second item", description: "this is the next item"}}];
	file_text_write_string(file, "Inventory Test 5 (Add same item into current inventory): " + 
		__check_gma_equal(__gma_equal__(_i2._inventory_items, _i2_expected)));

	#endregion
	#region Inventory Test Case (.item_subtract) 

	// Subtract Test case 1 (subtract non existing item from inventory)
	_i1.item_subtract("NOT A CORRECT ITEM NAME", 100);
	file_text_write_string(file, "Inventory Test 6 (Subtract non existing item from inventory): " + 
		__check_gma_equal(__gma_equal__(_i1._inventory_items, _i1_expected)));
	
	// Subtract Test case 2 (subtract quantity from inventory)
	_i2.item_subtract("second item", 20);
	_i2_expected = [{name: "example", quantity: 40, item: {name: "example", description: "this is an example"}}, {name: "second item", quantity: 80, item: {name: "second item", description: "this is the next item"}}];
	file_text_write_string(file, "Inventory Test 7 (Subtract quantity from inventory): " + 
		__check_gma_equal(__gma_equal__(_i2._inventory_items, _i2_expected)));
	
	// Subtract Test case 3 (subtract overlimit quantity from inventory, expected to remove the item from inventory)
	_i2.item_subtract("second item", 200);
	_i2_expected = [{name: "example", quantity: 40, item: {name: "example", description: "this is an example"}}];
	file_text_write_string(file, "Inventory Test 8 (Subtract overlimit quantity from inventory): " + 
		__check_gma_equal(__gma_equal__(_i2._inventory_items, _i2_expected)));
	
	// Subtract Test case 4 (subtract negative quantity should not work)
	_i2.item_subtract("example", -200);
	_i2_expected = [{name: "example", quantity: 40, item: {name: "example", description: "this is an example"}}];
	file_text_write_string(file, "Inventory Test 9 (Subtract negative quantity should not work): " + 
		__check_gma_equal(__gma_equal__(_i2._inventory_items, _i2_expected)));
	
	// Subtract Test Case 5 (subtract from an already removed item)
	_i2.item_subtract("second item", 20);
	_i2_expected = [{name: "example", quantity: 40, item: {name: "example", description: "this is an example"}}];
	file_text_write_string(file, "Inventory Test 10 (Subtract from an already removed item): " + 
		__check_gma_equal(__gma_equal__(_i2._inventory_items, _i2_expected)));

	#endregion


}

inventory_test();

function player_movement_test() 
{
	
	var file = global.file;
	
	#region Player Movement
	
		with obj_singleplayer {
			var _curr_x = x;
			var _curr_y = y;
		}

	#endregion	
}

file_text_close(global.file);
