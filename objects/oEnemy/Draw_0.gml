/// @description 

if hit_stop shader_set(vHitFlash)
var _s = hit_stop? 3 : 0
var _x = x +random_range(-_s, _s)
, _y = y +random_range(-_s, _s)

var dd = (!grabber_id || grabber_id.hold_id != id)

if do_draw || dd
	draw_sprite_ext(sprite_index, image_index, _x, _y, 
	side_dir *image_xscale, image_yscale, 0, -1, 1)
else{
	switch(state_current){
		case enemyState.grabbed:
		var px = grabber_id.hold_xpos, py = grabber_id.hold_ypos;
		draw_sprite_ext(sprite_index, image_index, _x +px, _y +py, 
		side_dir *image_xscale, image_yscale, 0, -1, 1)
		
		depth = grabber_id.y +1
		break;
	}
}

shader_reset()
#region debug

if !keyboard_check(vk_shift) exit

draw_set_halign(fa_center)
if on_ground() draw_set_color(c_orange)
draw_point(x, y)
draw_point(x -1, y)
draw_set_color(-1)
draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 1)
draw_text(x, y -32, $"[{grabber_id} !{state_current}! {state_timer} {do_draw}]")
draw_set_halign(fa_left)

#endregion