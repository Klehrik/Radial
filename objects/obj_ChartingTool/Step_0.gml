/// obj_ChartingTool : Step

// Get track data
if (track != noone) secondsMax = audio_sound_length(track);

// Increment beat counter
if (!paused)
{
	seconds += delta_time/1000000;
	beat = seconds/60 * bpm;
}

// Toggle pause
if (keyboard_check_pressed(vk_space))
{
	if (!paused)
	{
		paused = true;
		beat = floor(beat*beatDivision)/beatDivision;	// Round to beginning of current half-beat
		seconds = beat*60 / bpm;
		audio_stop_all();
	}
	else
	{
		paused = false;
		if (track != noone)
		{
			var mus = audio_play_sound(track, 0, 0);
			audio_sound_set_track_position(mus, seconds);
		}
	}
}

// Scroll through beats
if (keyboard_check_pressed(ord("1")) or keyboard_check_pressed(ord("2")))
{
	if (keyboard_check_pressed(ord("1"))) beat -= 1/beatDivision;
	else if (keyboard_check_pressed(ord("2"))) beat += 1/beatDivision;
	paused = true;
	beat = clamp(floor(beat*beatDivision)/beatDivision, 0, beatsMax);
	seconds = beat*60 / bpm;
	audio_stop_all();
}

// Input beat on current beat position beatDivision
if (chart != noone)
{
	var current = floor(beat*beatDivision)/beatDivision;
	if (keyboard_check_pressed(vk_right)) chart[current][0] = 1;
	if (keyboard_check_pressed(vk_up)) chart[current][1] = 1;
	if (keyboard_check_pressed(vk_left)) chart[current][2] = 1;
	if (keyboard_check_pressed(vk_down)) chart[current][3] = 1;
}



#region Buttons
if (buttonLoad.isPressed)
{
	
}

if (buttonSave.isPressed)
{
	
}
	
if (buttonTrack.isPressed)
{
	// oh god help
	
	var val = get_string("Which track?", "mus_Track1");
	var _bpm = get_integer("What BPM?", 140);
	track = asset_get_index(val);
	secondsMax = audio_sound_length(track);
	bpm = _bpm;
	buttonBPM.text = "BPM: " + string(bpm);
	beatsMax = floor(secondsMax/60 * bpm);
	
	seconds = 0;
	beat = 0;
	paused = true;
	
	// Create array for chart
	chart = [];
	for (var i = 0; i < beatsMax * beatDivision; i++)
	{
		chart[i] = [0, 0, 0, 0];
	}
}

if (buttonBPM.isPressed)
{
	var val = get_integer("New BPM:", bpm);
	if (is_real(val))
	{
		bpm = val;
		buttonBPM.text = "BPM: " + string(bpm);
	}
}
#endregion