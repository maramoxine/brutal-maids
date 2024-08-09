/// @description 

atk_fx = lerp(atk_fx, 0, 0.2)
gun_rfx = angle_lerp(gun_rfx, atk_dir, 0.6, 360)

var wp_walk = 0
if sprite_index = sPlayerWalk
	switch(floor(image_index)){
		case 0: case 3: wp_walk = 1  break;
		case 1: case 4: wp_walk = -3  break;
		case 2: case 5: wp_walk = -2;
	}	

var gx = lengthdir_x(10, gun_rfx) +side_dir *3
var gy = lengthdir_y(12, gun_rfx)

gun_xfx = lerp(gun_xfx, gx, 0.5)
gun_yfx = lerp(gun_yfx, gy, 0.5)

draw_sprite_ext(sWpPistol, 0,
x+ gun_xfx *(1 -0.7*atk_fx) -xvel *1.3, y+ gun_yfx*(1 -0.7*atk_fx) +wp_walk -2 -yvel *1.3, 
(1 -0.3 *atk_fx) , side_dir *(1 +0.3 *atk_fx)
, round(gun_rfx/45)*45 //+ round(side_dir*atk_fx*15)
, -1, 1)

var dr_ = 1
if (!can_hurt && invin_frames) dr_ = (floor(invin_frames /2) mod 2);

if dr_
draw_sprite_ext(sprite_index, image_index, x, y, 
side_dir , 1, 0, -1, 1)

if !keyboard_check(vk_shift) exit

if on_ground() draw_set_color(c_orange)
draw_point(x, y)
draw_point(x -1, y)
draw_set_color(-1)
draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 1)