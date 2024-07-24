/// @description Insert description here
// You can write your code in this editor
// Toggle pause state with the esc key
		
if (keyboard_check_pressed(vk_escape)) {
    paused = !paused;

    if (paused) {
        // Create the pause surface
        if (pause_surface != -1) {
            surface_free(pause_surface);
        }
        pause_surface = surface_create(display_get_width(), display_get_height());

        // Set the target surface to the pause surface
        surface_set_target(pause_surface);

        // Clear the surface with a black color
        draw_clear(c_black);

        // Draw pause menu elements (e.g., text)
        draw_set_color(c_white);
        // draw_set_font(fnt_default); // Assuming you have a font named fnt_default
		
		// Calculate button position based on the center of the view
        var view_x = camera_get_view_x(view_camera[0]);
        var view_y = camera_get_view_y(view_camera[0]);
        var view_w = camera_get_view_width(view_camera[0]);
        var view_h = camera_get_view_height(view_camera[0]);
		
        draw_text(view_x + (view_w / 2), view_y + (view_h / 2) - 200, "Paused");

        var btn_x = view_x + (view_w / 2);
        var btn_y = view_y + (view_h / 2) + 50;
        var btn_w = 100;
        var btn_h = 30;

        // Draw the button
        draw_rectangle(btn_x, btn_y, btn_x + btn_w, btn_y + btn_h, false);
        draw_text(btn_x + 10, btn_y + 5, "Resume");

        // Reset the target surface
        surface_reset_target();

        // Deactivate all instances except obj_pause_control and obj_cursor
        instance_deactivate_all(true);
		instance_create_depth(mouse_x, mouse_y, depth, obj_cursor);
    } else {
        // Reactivate all instances
        instance_activate_all();
		instance_destroy(obj_cursor);
    }
}

// Handle pausing by reactivating the button if clicked
if (paused) {
    var view_x = camera_get_view_x(view_camera[0]);
    var view_y = camera_get_view_y(view_camera[0]);
    var view_w = camera_get_view_width(view_camera[0]);
    var view_h = camera_get_view_height(view_camera[0]);

    var btn_x = view_x + (view_w / 2);
    var btn_y = view_y + (view_h / 2) + 50;
    var btn_w = 100;
    var btn_h = 30;

    if (mouse_check_button_pressed(mb_left) && point_in_rectangle(mouse_x, mouse_y, btn_x, btn_y, btn_x + btn_w, btn_y + btn_h)) {
        paused = false;
        instance_activate_all();
		instance_destroy(obj_cursor);
    }
}