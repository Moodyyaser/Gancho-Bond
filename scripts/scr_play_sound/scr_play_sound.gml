function scr_play_sound() {
	switch room
	{
		case rm_desert1: case rm_desert2:
			audio_play_sound(snd_sand, 1, false); break;
		case rm_desert3:
			if x>352
				audio_play_sound(snd_sand, 1, false);
			else
				audio_play_sound(snd_step, 1, false); break;
		default:
			audio_play_sound(snd_step, 1, false);
	}
}