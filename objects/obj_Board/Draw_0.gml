/// obj_Board : Draw

// Background
draw_set_color(#111d35);
draw_rectangle(0, 0, room_width, room_height, false);

// Flash
flash -= delta_time/1000000;
draw_set_alpha(min(flash, 0.5));
draw_set_color(flashColor);
draw_rectangle(0, 0, room_width, room_height, false);

// Black background diamonds
for (var i = 0; i < array_length(backgroundDiamonds); i++)
{
	draw_set_circle_precision(4);
	draw_set_alpha(0.5);
	draw_set_color(#1d2b53);
	var d = backgroundDiamonds[i];
	draw_circle(d.x, d.y, d.size, false);
	
}

#region Draw board
draw_set_circle_precision(4);

// Create surface
var surface = surface_create(room_width, room_height);
surface_set_target(surface);

#region Large white center diamond
draw_set_color(centerColor);
draw_set_alpha(centerAlpha);
draw_circle(room_center_x, room_center_y, centerRadius, false);

gpu_set_blendmode(bm_subtract);
draw_set_color(c_white);
draw_set_alpha(1);
draw_circle(room_center_x, room_center_y, centerRadius - centerThickness, false);
gpu_set_blendmode(bm_normal);
#endregion

#region Middle-pointing arrows
draw_set_color(centerColor);
draw_set_alpha(centerAlpha);

var offset = centerRadius - arrowDistance;

draw_triangle(room_center_x - centerRadius, room_center_y - arrowThickness,	// Left
room_center_x - centerRadius, room_center_y + arrowThickness,
room_center_x - offset, room_center_y, false);

draw_triangle(room_center_x + centerRadius, room_center_y - arrowThickness,	// Right
room_center_x + centerRadius, room_center_y + arrowThickness,
room_center_x + offset, room_center_y, false);

draw_triangle(room_center_x - arrowThickness, room_center_y - centerRadius,	// Up
room_center_x + arrowThickness, room_center_y - centerRadius,
room_center_x, room_center_y - offset, false);

draw_triangle(room_center_x - arrowThickness, room_center_y + centerRadius,	// Down
room_center_x + arrowThickness, room_center_y + centerRadius,
room_center_x, room_center_y + offset, false);
#endregion

#region Smaller "input" diamonds
var offset = centerRadius - (centerThickness/2);

for (var i = 0; i < array_length(diamonds); i++)
{
	var input = diamonds[i];
	var radius = input.radius * input.scaling;
	
	gpu_set_blendmode(bm_subtract);
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_circle(room_center_x + offset * input.positionX, room_center_y + offset * input.positionY, radius, false);
	gpu_set_blendmode(bm_normal);
	
	draw_set_color(input.color);
	draw_set_alpha(input.alpha);
	draw_circle(room_center_x + offset * input.positionX, room_center_y + offset * input.positionY, radius, false);
	
	gpu_set_blendmode(bm_subtract);
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_circle(room_center_x + offset * input.positionX, room_center_y + offset * input.positionY, radius - input.thickness, false);
	gpu_set_blendmode(bm_normal);
}
#endregion

// Draw and delete surface
surface_reset_target();
draw_surface(surface, 0, 0);
surface_free(surface);

draw_set_circle_precision(64);
#endregion