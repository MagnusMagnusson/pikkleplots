if(array_length(console_schedule) == 0){
	countdown = 10
} else {
	var next = array_shift(console_schedule);
	var msg = next[0];
	var time = next[1];
	alarm[0] = time;
	array_push(console_log, msg);
}