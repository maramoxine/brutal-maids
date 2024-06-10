/// ----------------------
function coll_x(){

var xdir = argument[0]
var obj = argument_count == 2 ? argument[1] : oWall

var side_to_check = xdir ? bbox_right + 1 : bbox_left - 1

return collision_rectangle(
side_to_check, bbox_top, side_to_check, bbox_bottom, obj, false, true)

}