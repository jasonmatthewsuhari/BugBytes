global.timer = 0;
global.minutes = 0;
global.seconds = 0;

var min_zoom = 0.5; // Minimum zoom level (e.g., 50%)
var max_zoom = 2.0; // Maximum zoom level (e.g., 200%)
var zoom_speed = 0.01; // Speed of zooming

function format_time(value) {
    if (value < 10) {
        return "0" + string(value);
    } else {
        return string(value);
    }
}