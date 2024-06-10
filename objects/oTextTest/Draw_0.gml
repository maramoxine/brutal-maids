/// @description 

draw_set_halign(fa_center)
draw_set_valign(fa_middle)

//draw_text_ext(x, y, text_string, 10, 192)

var sl = string_length(text_string)

for(var i =1; i<= sl ; i++){
	draw_text(
	x -(sl /2)*6  +6*i
	+cos(current_time /480 -(i/4)) *2,
	y +sin(current_time /240 +(i/2)) *2,
	string_char_at(text_string, i))
}

draw_text(-16, -16, current_time)

draw_set_halign(fa_left)
draw_set_valign(fa_top)