/// obj_Camera : Step

scaling = max(scaling * 0.99, 1);
camera_set_view_size(view_camera[0], room_width / scaling, room_height / scaling);
var offsetX = (room_width - camera_get_view_width(view_camera[0])) / 2;
var offsetY = (room_height - camera_get_view_height(view_camera[0])) / 2;
camera_set_view_pos(view_camera[0], offsetX, offsetY);