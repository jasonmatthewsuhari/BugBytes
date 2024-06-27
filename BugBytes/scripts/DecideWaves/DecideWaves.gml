function DecideWaves(count, enemy_list){
	// wave_info = [count, enemy_list]
	number_of_enemies = array_length(enemy_list);
	
	if(number_of_enemies <= 0) {
		return [];
	}
	else if(number_of_enemies == 1) {
		return [count];	
	}
	
	breakpoints = array_create(number_of_enemies - 1);
	for(var i = 0; i < number_of_enemies - 1; i++) {
		breakpoints[i] = irandom_range(round(count*0.15), round(count*0.7));
	}
	
	array_sort(breakpoints, true);
	result = array_create(number_of_enemies);
	
	for(var i = 1; i < number_of_enemies - 1; i++) {
		result[i] = breakpoints[i] - breakpoints[i-1];	
	}
	
	result[0] = breakpoints[0]
	result[number_of_enemies - 1] = count - breakpoints[number_of_enemies	-2];
	return result;
	
}