/// @desc get hurt
if iframe<=20
{
	iframe = 30;
	hp -= 1;
	with other instance_destroy();
	audio_play_sound(snd_hurt_ghost, 1, false);
}
if hp mod 2 == 0 event_user(0);