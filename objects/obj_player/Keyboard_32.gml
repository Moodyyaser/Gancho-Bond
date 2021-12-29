/// @desc jump
if can_jump && !hooked
{
	vsp = -10+global.difficulty*2.5;
	can_jump=0;
	audio_play_sound(snd_jump, 1, false);
	jumping = 12+global.difficulty*3;
}