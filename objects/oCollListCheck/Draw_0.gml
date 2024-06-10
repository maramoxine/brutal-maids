/// @description 

draw_sprite(sprite_index, image_index, x, y)

x += (keyboard_check(vk_right) - keyboard_check(vk_left)) *2
y += (keyboard_check(vk_down) - keyboard_check(vk_up)) *2

var vx = camera_get_view_x(view_camera[0])
,	vy = camera_get_view_y(view_camera[0])
var pl_ds = ds_list_create()

var pl_ds_size = collision_rectangle_list(
bbox_left, bbox_top, bbox_right, bbox_bottom
, oPlatform, false, true, pl_ds, false)

var first = true;
for(i =0; i< pl_ds_size; i++){
	var dx = pl_ds[| i].x,
	dy = pl_ds[| i].y
	
	draw_text(dx, dy, i)
	if (first){
		draw_set_color(c_red)
		first = false
	}
	with pl_ds[| i]{
		draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 1)}
	draw_set_color(-1)
	//draw_text(vx +8, vy +8 +i *16, i)	
	//draw_text(vx +24, vy +8 +i *16, pl_ds[| i])
	//draw_text(vx +32, vy +16 +i *16,
	//object_get_name(pl_ds[| i].object_index))
}

ds_list_destroy(pl_ds);