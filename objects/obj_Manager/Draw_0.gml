/// obj_Manager : Draw

// god send help please

// Track info
if (!running)
{
	var current = trackList[trackSelected];
	
	draw_set_halign(fa_center);
	
	draw_set_font(fnt_CenturyGothic24);
	draw_text(room_center_x, room_height - 120, current.name);
	draw_set_font(fnt_CenturyGothic18);
	var _points = string(current.highscore);
	while (string_length(_points) < 6) _points = "0" + _points;
	draw_text(room_center_x, room_height - 70, "Highscore: " + _points);
	
	
	// arrows that tell you that you can change tracks
	var dist = 150;
	if (trackSelected > 0)
	{
		draw_triangle(room_center_x - (dist + 30), room_height - 80,
		room_center_x - dist, room_height - 100,
		room_center_x - dist, room_height - 60, false);
	}
	if (trackSelected < array_length(trackList) - 1)
	{
		draw_triangle(room_center_x + (dist + 30), room_height - 80,
		room_center_x + dist, room_height - 100,
		room_center_x + dist, room_height - 60, false);
	}
	
	
	// Credits
	draw_set_halign(fa_right);
	draw_text(room_width - 20, room_height - 70, "Klehrik");
	draw_text(room_width - 20, room_height - 40, "aideo88");
	draw_set_halign(fa_left);
}

// Display stats
else
{
	draw_set_font(fnt_CenturyGothic24);
	var _points = string(points);
	while (string_length(_points) < 6) _points = "0" + _points;
	draw_text(40, 40, "Score:\n" + _points);

	draw_set_font(fnt_CenturyGothic48);
	draw_text(180, 40, "x" + string(pointMultiplier));

	draw_set_font(fnt_CenturyGothic24);
	draw_text(40, 140, "Combo  x" + string(combo));
}