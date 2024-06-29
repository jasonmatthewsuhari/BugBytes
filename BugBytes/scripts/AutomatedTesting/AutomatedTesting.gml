function AutomatedTesting(){
	file_name = string(current_day) + "-" + string (current_month) + "-" + string(current_year) + " " + string(current_hour) + "-" + string(current_minute) + "-" + string(current_second);
	global.file = file_text_open_write(working_directory + file_name + ".txt");
}