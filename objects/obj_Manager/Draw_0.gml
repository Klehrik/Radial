/// obj_Manager : Draw

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