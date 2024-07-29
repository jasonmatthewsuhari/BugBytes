// Step event
if (!fading) {
    fade_timer += 1;
    if (fade_timer >= fade_start_time) {
        fading = true;
        fade_timer = 0;
    }
} else {
    fade_timer += 1;
    // Calculate the new alpha value
    image_alpha = 1 - (fade_timer / fade_duration);

    // Destroy the object after the fade is complete
    if (fade_timer >= fade_duration) {
        instance_destroy();
    }
}

var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);

// Update the object's position to follow the camera
x = cam_x;
y = cam_y;