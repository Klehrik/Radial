/// obj_Manager : Draw

// Display stats
draw_set_font(fnt_CenturyGothic24);
var _points = string(points);
while (string_length(_points) < 6) _points = "0" + _points;
draw_text(40, 40, "Score:\n" + _points);

draw_set_font(fnt_CenturyGothic48);
draw_text(180, 40, "x" + string(pointMultiplier));

draw_set_font(fnt_CenturyGothic24);
draw_text(40, 140, "Combo  x" + string(combo));  