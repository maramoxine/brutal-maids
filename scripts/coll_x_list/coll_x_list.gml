/// ----------------------
function coll_x_list(){
var xdir            = argument[0]
var instances_ds    = argument[1]
var obj             = argument[2]

var side_to_check = xdir ? bbox_right + 1 : bbox_left - 1

// returns a list of objects
return collision_rectangle_list(
side_to_check, bbox_top, side_to_check, bbox_bottom
, obj, false, true, instances_ds, false)

}