/// @description Set up collision

#macro TS			32		// tileset pixel size 

// get tiles in room

var _w = ceil(room_width / TS);
var _h = ceil(room_height / TS);

// create motion planning grid
global.mp_grid = mp_grid_create(0, 0, _w, _h, TS, TS);

#region initialise mp_grid

#region add solid instances when there is tile_set wall

var _map = layer_tilemap_get_id("Tiles_Wall");
for (var yy = 0; yy < _h; ++yy) {
	for (var xx = 0; xx < _w; ++xx) {
		var _t1 = tilemap_get(_map, xx, yy);
		if _t1 >= 1 and _t1 <= 47 {
			instance_create_layer(xx * TS, yy * TS, "Collisions", obj_solid);
		}
	}
}

#endregion

#region merge obj_solids to reduce instance count

for (var yy = 0; yy < _h; ++yy) {
	for (var xx = 0; xx < _w; ++xx) {
		var _t1 = tilemap_get(_map, xx, yy);
		if _t1 >= 1 and _t1 <= 47 {		// wall tileset id must be between 1 and 47
			var _inst = collision_point(xx * TS, yy * TS, obj_solid, 0, 1);
			if _inst == noone continue;
			
			// merge solids to the right
			with (_inst) {
				do {
					var _change = false;
					var _inst_next = instance_place(x + 1, y, obj_solid);
					if _inst_next != noone {
						image_xscale++;
						// col = make_color_rgb(irandom(255), irandom(255), irandom(255));
						instance_destroy(_inst_next);
						_change = true;
					}
				} until _change == false;
				
				// merge with any solids above that are the same shape
				var _inst_above = instance_place(x, y - 1, obj_solid);
				if _inst_above != noone and _inst_above.bbox_left == bbox_left and _inst_above.bbox_right == bbox_right {
					y = _inst_above.y;
					image_yscale += _inst_above.image_yscale;
					instance_destroy(_inst_above);
				}
			}
		}
	}
}

#endregion

#endregion

// add solid instances to grid
mp_grid_add_instances(global.mp_grid, obj_solid, true);