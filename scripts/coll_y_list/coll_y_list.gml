/// @func coll_y_list(ydir, instances_ds, obj)
function coll_y_list(){
	
var ydir            = argument[0]
var instances_ds    = argument[1]
var obj             = argument[2]

var side_to_check = ydir ? bbox_bottom + 1 : bbox_top - 1

return collision_rectangle_list(bbox_left, side_to_check,
bbox_right, side_to_check, obj, false, true, instances_ds, false)

}