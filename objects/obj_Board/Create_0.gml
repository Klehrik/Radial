/// obj_Board : Init

// This object manages the drawing of the diamonds, as well as the creation of notes

depth = 1000;

parent = noone;

centerRadius = 160;
centerThickness = 10;
centerColor = c_white;
centerAlpha = 0.5;

arrowDistance = 160;
arrowThickness = 16;

flash = 0;
flashColor = c_white;

backgroundDiamonds = [];
var columns = 10;
for (var i = 0; i <= columns; i++)
{
	backgroundDiamonds[array_length(backgroundDiamonds)] = { x: room_width/columns * i, y: 10, size: irandom_range(25, 100) }
	backgroundDiamonds[array_length(backgroundDiamonds)] = { x: room_width/columns * i, y: room_height - 10, size: irandom_range(25, 100) }
}

#region Create "input" diamonds
var offset = centerRadius - (centerThickness/2);

left = instance_create_depth(room_center_x - offset, room_center_y, 0, obj_Input);
left.positionX = -1;
left.color = c_blue;
left.button = vk_left;

right = instance_create_depth(room_center_x + offset, room_center_y, 0, obj_Input);
right.positionX = 1;
right.color = c_red;
right.button = vk_right;

up = instance_create_depth(room_center_x, room_center_y - offset, 0, obj_Input);
up.positionY = -1;
up.color = c_yellow;
up.button = vk_up;

down = instance_create_depth(room_center_x, room_center_y + offset, 0, obj_Input);
down.positionY = 1;
down.color = c_fuchsia;
down.button = vk_down;

diamonds = [left, right, up, down];
#endregion



// Functions
create_note = function(dir)
{
	var note = instance_create_depth(room_center_x, room_center_y, 0, obj_Note);
	
	var offset = centerRadius - arrowDistance;
	switch (dir)
	{	
		case 0:	// Right
			note.x = room_center_x + offset;
			note.lerpX = [note.x, room_center_x + centerRadius];
			note.secondsMax = parent.noteBeatTime*60 / parent.bpm;
			note.color = right.color;
			break;
			
		case 1:	// Up
			note.y = room_center_y - offset;
			note.lerpY = [note.y, room_center_y - centerRadius];
			note.secondsMax = parent.noteBeatTime*60 / parent.bpm;
			note.color = up.color;
			break;
			
		case 2: // Left
			note.x = room_center_x - offset;
			note.lerpX = [note.x, room_center_x - centerRadius];
			note.secondsMax = parent.noteBeatTime*60 / parent.bpm;
			note.color = left.color;
			break;
			
		case 3: // Down
			note.y = room_center_y + offset;
			note.lerpY = [note.y, room_center_y + centerRadius];
			note.secondsMax = parent.noteBeatTime*60 / parent.bpm;
			note.color = down.color;
			break;
	}
}

background_flash = function(color, lifetime = 1)
{
	flashColor = color;
	flash = lifetime;
}