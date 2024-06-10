/// ----------------------
function coll_y(){

var ydir = argument[0]
var obj = argument_count == 2 ? argument[1] : oWall

var side_to_check = (ydir ? bbox_bottom + 1 : bbox_top - 1) 
if (ydir >0) side_to_check += (abs(ydir -1) * sign(ydir))

return collision_rectangle(
bbox_left, side_to_check, bbox_right, side_to_check, obj, false, true)

}