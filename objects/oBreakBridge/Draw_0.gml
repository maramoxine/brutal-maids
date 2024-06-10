/// @description 

var _xl = floor(image_xscale)

var i = 0, ig = 0
repeat(_xl){
	
	var p = collision_rectangle(
	x +(i) *16, y, x +(i +1) *16, y -1, oEntity, 0, 1)
	, fr = 0
	if p fr = 1
	
	
	draw_sprite_part(sprite_index, fr,
	0 +16*ig, 0, 16, 24, x +i *16, y -8)
	
	i++;
	ig = ig==3? 0 : ig +1;
}

if !(keyboard_check(vk_shift))
exit

draw_text(x, y -16, string(i) +" " +string(ig))