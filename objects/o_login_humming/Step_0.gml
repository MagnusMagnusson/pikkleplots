if(audio_sound_get_track_position(hum) > 55){
	audio_sound_set_track_position(hum, 13);
}

show_debug_message(audio_sound_get_track_position(hum))