draw_set_color(c_black);

var formatted_minutes = format_time(minutes);
var formatted_seconds = format_time(seconds);
var time_string = formatted_minutes + ":" + formatted_seconds;

draw_text(room_width / 2,0, "Time Elapsed: " + time_string);	