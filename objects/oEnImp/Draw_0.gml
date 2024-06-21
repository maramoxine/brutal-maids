/// @description Insert description here

if hit_stop shader_set(vHitFlash)

draw_sprite_ext(sprite_index, image_index, x, y, 
side_dir *image_xscale, image_yscale, 0, -1, 1)

shader_reset()
#region debug

if !keyboard_check(vk_shift) exit

draw_set_halign(fa_center)
draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 1)
draw_circle(x, y, 72, 1)
//draw_circle(x, y -80, 1, 0)
draw_line(x, y, x +lengthdir_x(64, jump_dir), y+lengthdir_y(64, jump_dir))
draw_text(x, y -32, $"{attack_timer} {attack_is}")
draw_set_halign(fa_left) 

#endregion