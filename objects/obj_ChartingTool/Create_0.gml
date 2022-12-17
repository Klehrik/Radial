/// obj_ChartingTool : Init

// This is unused because I don't have enough time to finish it



track = noone;

bpm = 100;
seconds = 0;
secondsMax = 0;
beat = 0;
beatsMax = 0;
beatDivision = 2;	// using half-beats
paused = true;

chart = noone;

buttonLoad = create_button(10, 10, "Load Chart", 120, 40);
buttonTrack = create_button(140, 10, "Load Track", 120, 40);
buttonBPM = create_button(270, 10, "BPM: " + string(bpm), 120, 40);
buttonSave = create_button(400, 10, "Save Chart", 120, 40);


load_chart = function(file)
{
	//var trackName = "mus_Track1";
	//bpm = 140;
	
	//track = asset_get_index("mus_Track1");		// Currently playing audio file
	//trackLength = audio_sound_length(track);	// in seconds
	
	
	//seconds = 0;
	//beat = 0;
	//audio_play_sound(track, 0, false);
}