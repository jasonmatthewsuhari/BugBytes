/// @func		Inventory()
/// @desc		creates an inventory system
function Inventory() constructor 
{
	
	_inventory_items = [];
	
	///	@func								item_set(_name, _item, _quantity)
	///	@desc								sets the item into the inventory
	/// @param {String}	_name				name of the item
	/// @param {Struct}	_item				the item
	/// @param {String}	_quantity			quantity of the item
	/// @return								Nothing
	item_set = function(_name, _item, _quantity) {
		array_push(_inventory_items, {
			name: _name,
			quantity: _quantity,
			item: _item,
		});
	}
	
	///	@func								item_find(_name)
	///	@desc								finds the index of the item inside the inventory
	/// @param {String}	_name				name of the item
	/// @return	{Integer}					the index of the item inside the inventory array, -1 if not found
	item_find = function(_name) {
		for (var i = 0; i < array_length(_inventory_items); i++) {
			if (_name == _inventory_items[i].name) {
				return i;
			}
		}
		
		return -1;
	}
	
	///	@func								item_add(_name, _quantity, _item)
	///	@desc								adds the item variables into the inventory
	/// @param {String}	_name				name of the item
	/// @param {String}	_quantity			quantity of the item
	/// @param {Struct}	_item				the item
	/// @return								Nothing
	item_add = function(_name, _quantity, _item) {
		var _index = item_find(_name);
		
		if (_index >= 0) {
			_inventory_items[_index].quantity += _quantity;
		} else {
			item_set(_name, _item, _quantity);
		}
	}
	
	
	///	@func								item_has(_name, _quantity)
	///	@desc								check if there is enough item inside the inventory
	/// @param {String}	_name				name of the item
	/// @param {String}	_quantity			quantity of the 
	/// @return {Boolean}					
	item_has = function(_name, _quantity) {
		var _index = item_find(_name);
		
		if (_index >= 0) {
			return _inventory_items[_index].quantity >= _quantity;
		}
		return false;
	}
	
	///	@func								item_subtract_name, _quantity)
	///	@desc								subtracts specified quantity item from inventory and removes it if the quantity is less
	/// @param {String}	_name				name of the item
	/// @param {String}	_quantity			quantity of the item
	/// @return								Nothing
	item_subtract = function(_name, _quantity) {
		var _index = item_find(_name);
		
		if (_index >= 0 and _quantity >= 0 ) {
			_inventory_items[_index].quantity -= _quantity;
				
			if (_inventory_items[_index].quantity <= 0) {
				item_remove(_index);
			}
		}
	}
	
	///	@func								item_remove(_index)
	///	@desc								removes item at specified index from inventory (inner function)
	/// @param {String}	_index				index of the item
	/// @return								Nothing
	item_remove = function(_index) {
		array_delete(_inventory_items, _index, 1);
	}
	
	///	@func								item_get(_name)
	///	@desc								gets the item from the inventory
	/// @param {String}	_name				name of the item
	/// @return	{Struct}					the item struct if found, noone if not found
	item_get = function(_name) {
		var _index = item_find(_name);
		
		if (_index >= 0) {
			return _inventory_items[_index];
		} 
		return {};
	}
	
	/// @func								curr_capacity()
	/// @desc								gets the current length of inventory array
	/// @return {Real}						the current length of inventory array
	curr_capacity = function() {
		return array_length(_inventory_items);
	}
	
	toString = function() {
		return json_stringify(_inventory_items);
	}
	
	
}

function Power(_name, _sprite, _amount) constructor 
{
	name = _name;								// name of power
	sprite = _sprite;							// sprite of power
	amount = _amount;							// modifier amount
}
