/// debug

if (keyboard_check_pressed(ord("R"))) game_restart();

for (var i = 1; i <= 4; i++)
{
	if (keyboard_check_pressed(ord(string(i)))) board.create_note(i - 1);
}

// unused
// if (keyboard_check_pressed(ord("Y"))) room_goto(rm_Charting);