/// obj_Manager : Step

var quarterBeat = 60/other.bpm / 4;			// The duration of one-quarter of a beat (in seconds)


// Increment beat counter
if (running)
{
	seconds += delta_time/1000000;
	beat = seconds/60 * bpm;
}


#region Note detection
// Check for inputs
for (var i = 0; i < array_length(board.diamonds); i++)
{
	var input = board.diamonds[i];
	
	if (keyboard_check_pressed(input.button))
	{
		input.scaling = 1.5;
			
		// Get nearest non-expiring note
		var note = noone;
		for (var j = 1; j <= instance_number(obj_Note); j++)
		{
			var near = instance_nth_nearest(input.x, input.y, obj_Note, j);
			if (near.color == input.color and !near.expire)
			{
				note = near;
				break;
			}
		}
			
		// Check note deviation
		if (note != noone)
		{
			var deviation = abs(note.seconds - note.secondsMax);
			
			if (deviation <= quarterBeat)
			{
				note.expire = true;
				note.hit = true;
				combo += 1;
				set_point_multiplier();
				points += pointValues.perfect * pointMultiplier;
				
				camera.scaling = 1.07;
				create_popup(note.x, note.y - 16, "Perfect", c_yellow);
			}
			else if (deviation <= quarterBeat * 2)
			{
				note.expire = true;
				note.hit = true;
				combo += 1;
				set_point_multiplier();
				points += pointValues.good * pointMultiplier;
				
				camera.scaling = 1.07;
				create_popup(note.x, note.y - 16, "Good", c_aqua);
			}
			else
			{
				combo = 0;
				set_point_multiplier();
				points += pointValues.miss;
				
				create_popup(note.x, note.y - 16, "Miss", c_gray);
			}
		}
	}
}

// Check for Misses
// This is also messy but
with (obj_Note)
{
	if (!expire)
	{
		var deviation = seconds - secondsMax;
		if (deviation > quarterBeat * 2)
		{
			other.combo = 0;
			other.set_point_multiplier();
			other.points += other.pointValues.miss;
			expire = true;
			
			create_popup(x, y - 16, "Miss", c_gray);
		}
	}
}
#endregion

#region Spawn notes
while (true)
{
	// Check if any notes are remaining
	if (ds_list_size(trackData) <= 0) break;
	
	// Process next note
	var nextNote = trackData[| 0];
	if (beat >= nextNote[1] - noteBeatTime)
	{
		board.create_note(nextNote[0]);
		ds_list_delete(trackData, 0);
	}
	else break;
}
#endregion




// debug
if (keyboard_check_pressed(vk_space))
{
	if (debug_file == noone)
	{
		debug_file = get_open_filename(".txt", "track1.txt");
	}
	else
	{
		load_track_dev(debug_file);
		debug_file = noone;
	}
}