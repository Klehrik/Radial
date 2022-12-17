/// Instantiator

function create_popup(x, y, text, color = c_white, lifetime = 1, vsp = -1.5)
{
	var popup = instance_create_depth(x, y, 0, obj_Popup);
	popup.text = text;
	popup.color = color;
	popup.lifetime = lifetime;
	popup.vsp = vsp;
}