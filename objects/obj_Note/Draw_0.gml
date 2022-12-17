/// obj_Note : Draw

draw_set_alpha(alpha);

// Glow
var glowSize = radius / 96;
draw_sprite_ext(spr_Glow, 0, x, y, glowSize, glowSize, 0, color, alpha);

// Body
draw_set_circle_precision(4);
draw_set_color(color);
draw_circle(x, y, radius, false);
draw_set_color(c_white);
draw_circle(x, y, radius * 0.8, false);
draw_set_circle_precision(64);

draw_set_alpha(1);