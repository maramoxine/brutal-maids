/// @description

draw_sprite_ext(sprite_index, image_index, x, y
, 1, 1, move_dir, -1, 1)

shader_reset();

//var i = 0;
//repeat(ds_list_size(hitnow)){
//	var h = hitnow[| i]
//	draw_text(x, y -i *8, $"{h} {h.can_hurt}")
	
//	i++;
//}

if !keyboard_check(vk_shift) exit

draw_point(x, y)
draw_point(x -1, y)
draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 1)