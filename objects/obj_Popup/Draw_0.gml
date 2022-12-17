/// obj_Popup : Draw

// Move and decrease alpha
y += vsp;
image_alpha -= delta_time/(1000000 * lifetime);
if (image_alpha <= 0) instance_destroy();


// Draw text
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_CenturyGothic24);

var c = color;
draw_text_color(x, y, text, c, c, c, c, image_alpha);

draw_set_halign(fa_left);
draw_set_valign(fa_top);