if(audio_sound_get_track_position(hum) > 55){
	audio_sound_set_track_position(hum, 13);
}

if(instance_exists(o_world_manager)){
	var perc = o_world_manager.loadPercent();
	if((1 - perc) != audio_sound_get_gain(hum)){
		audio_sound_gain(hum, 1 - perc, 100);
	}
} else if(audio_sound_get_gain(hum) < 1){
	audio_sound_gain(hum, 1, 100);
}