/// obj_Button : Step

// Check if pressed this frame
if (isPressed) isPressed = false;

var inBox = point_in_rectangle(mouse_x, mouse_y, x, y, x + width, y + height);
var clicked = mouse_check_button_pressed(mb_left);
if (inBox and clicked) isPressed = true;