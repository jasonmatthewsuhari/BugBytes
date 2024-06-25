draw_set_color(c_black);

var formatted_minutes = format_time(global.minutes);
var formatted_seconds = format_time(global.seconds);
var time_string = formatted_minutes + ":" + formatted_seconds;



if(instance_exists(obj_mcamera)) {
	draw_text(obj_mcamera.x - 30, obj_mcamera.y - 170, "Time Elapsed: " + time_string);		
}