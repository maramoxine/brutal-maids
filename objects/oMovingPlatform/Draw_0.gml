 /// @description 

draw_sprite_ext(sprite_index, image_index, x, y, 
image_xscale, image_yscale, 0, -1, 1)

if !keyboard_check(vk_shift) exit
draw_text(x, y -8, xvel)
draw_text(x, y -16, yvel)
draw_text(x, y, "platform? " +string(one_way))