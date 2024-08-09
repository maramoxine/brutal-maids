/// @description

if (floor(timer /2) mod 2)shader_set(vLightFlash);
draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, -1, 1)
shader_reset();