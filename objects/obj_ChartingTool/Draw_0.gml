/// obj_ChartingTool : Draw

draw_text(10, 60, "Seconds: " + string(seconds) + " / " + string(secondsMax));
draw_text(10, 80, "Beat #:  " + string(floor(beat*beatDivision)/beatDivision + 1) + " / " + string(beatsMax));
draw_text(10, 110, "PAUSED: " + string(paused));

// Display beats
var current = floor(beat*beatDivision)/beatDivision;
for (var i = max(current - 5, 0); min(current + 10, beatsMax); i++)
{
	//draw_text()
}