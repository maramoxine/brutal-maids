 /// @description 

if !keyboard_check(vk_shift) exit

var _wb = bx_w/2 , _hb = bx_h /2
draw_set_color(c_red)
draw_rectangle(x -_wb, y -_hb, x +_wb, y +_hb, 1)
draw_rectangle(x -_wb +1, y -_hb +1, x +_wb -1, y +_hb -1, 1)
draw_arrow(x, y, x +_h.xspd *16, y +_h.yspd *16, 6)
draw_set_color(-1)
draw_arrow(x, y, x +_h.xair *16, y +_h.yair *16, 6)


draw_set_halign(fa_middle)
draw_set_valign(fa_center)
draw_text(x, y, "*") 
draw_set_halign(fa_left)
draw_set_valign(fa_top)