/// Button Instantiator

function create_button(x, y, text, width, height)
{
	var button = instance_create_depth(x, y, 0, obj_oldButton);
	button.text = text;
	button.width = width;
	button.height = height;
	return button;
}