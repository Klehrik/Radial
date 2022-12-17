/// obj_Note : Step

if (!hit)
{
	// Increment lifetime (in seconds)
	seconds += delta_time/1000000;

	// Change radius and position
	radius = lerp(0, radiusMax, min(seconds/secondsMax, 1));
	x = lerp(lerpX[0], lerpX[1], seconds/secondsMax);
	y = lerp(lerpY[0], lerpY[1], seconds/secondsMax);
}
else
{
	// When hit on beat, stay stationary and grow until destroyed
	radius = lerp(0, radiusMax, min(seconds/secondsMax, 1)) * radiusScale;
	radiusScale *= 1.03;
}


// Expire
if (expire)
{
	alpha -= delta_time/500000;
	if (alpha <= 0) instance_destroy();
}