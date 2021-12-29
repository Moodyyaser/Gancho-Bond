/// @desc bounce
if speed > other.speed && other.speed < 4
{
	other.speed = speed;
	other.direction = random(360);
}