/// obj_Manager : Init

depth = -1000;

#macro room_center_x room_width/2
#macro room_center_y room_height/2

keyboard_set_map(ord("A"), vk_left);
keyboard_set_map(ord("D"), vk_right);
keyboard_set_map(ord("W"), vk_up);
keyboard_set_map(ord("S"), vk_down);


noteBeatTime = 3;	// Number of beats that a note takes to travel to its input diamond from creation

points = 0;
pointMultiplier = 1;
combo = 0;
pointValues = {
	perfect:	25,
	good:		10,
	miss:		0,
}

board = instance_create_depth(0, 0, 0, obj_Board);
board.parent = id;

camera = instance_create_depth(0, 0, 0, obj_Camera);


// Track data
track = noone;		// Currently playing audio file
trackLength = 0;	// in seconds

bpm = 100;
seconds = 0;
secondsMax = 0;
beat = 0;

trackData = ds_list_create();	// Note format: [direction (0-3), beat (can have decimal values)]

running = false;	// if there is a track running or not


// Highscores and stuff
trackSelected = 0;
trackList = [
	{
		name:		"g",
		index:		"track1",
		highscore:	0,
	},
	{
		name:		"Sick Beat",
		index:		"track2",
		highscore:	0,
	},
];


// Functions
set_point_multiplier = function()
{
	var mult = 1;
	var color = noone;
	
	if (combo >= 40) { mult = 4; color = c_yellow; }
	else if (combo >= 20) { mult = 3; color = c_aqua; }
	else if (combo >= 10) { mult = 2; color = c_fuchsia; }
	
	if (pointMultiplier != mult)
	{
		pointMultiplier = mult;
		if (color != noone) board.background_flash(color);
	}
}

load_track = function(trackIndex)
{
	ds_list_clear(trackData);
	
	var file = file_text_open_read(trackIndex + ".txt");
	
	bpm = file_text_read_real(file);
	file_text_readln(file);
	
	while (!file_text_eof(file))
	{	
		// Read data on current line
		var line = file_text_readln(file);
		line = string_split(line, " ");
		
		var dir = line[0];
		var _beat = line[1];
		
		// Direction string to number (0-3)
		var dirNum = 0;
		switch (dir)
		{
			case "u":
			case "up":
				dirNum = 1;
				break;
				
			case "l":
			case "left":
				dirNum = 2;
				break;
				
			case "d":
			case "down":
				dirNum = 3;
				break;
		}
		
		// Add note data to list
	    ds_list_add(trackData, [dirNum, _beat]);
	}
	
	file_text_close(file);
	
	// Reset variables and play track
	seconds = 0;
	beat = 0;
	points = 0;
	pointMultiplier = 1;
	combo = 0;
	
	instance_destroy(obj_Note);
	audio_stop_all();
	
	var asset = asset_get_index(trackIndex);
	audio_play_sound(asset, 0, false);
	secondsMax = audio_sound_length(asset);
	running = true;
}

//debug_file = noone;

//load_track_dev = function(path)
//{
//	ds_list_clear(trackData);
	
//	var file = file_text_open_read(path);
		
//	bpm = file_text_read_real(file);
//	file_text_readln(file);
	
//	while (!file_text_eof(file))
//	{	
//		// Read data on current line
//		var line = file_text_readln(file);
//		line = string_split(line, " ");
		
//		var dir = line[0];
//		var _beat = line[1];
		
//		// Direction string to number (0-3)
//		var dirNum = 0;
//		switch (dir)
//		{
//			case "u":
//			case "up":
//				dirNum = 1;
//				break;
				
//			case "l":
//			case "left":
//				dirNum = 2;
//				break;
				
//			case "d":
//			case "down":
//				dirNum = 3;
//				break;
//		}
		
//		// Add note data to list
//		ds_list_add(trackData, [dirNum, _beat]);
//	}
	
//	file_text_close(file);
	
//	// Reset variables and play track
//	seconds = 0;
//	beat = 0;
//	points = 0;
//	pointMultiplier = 1;
//	combo = 0;
//	instance_destroy(obj_Note);
//	audio_stop_all();
	
//	var asset = track1;
//	audio_play_sound(asset, 0, false);
//	secondsMax = audio_sound_length(asset);
//	running = true;
//}