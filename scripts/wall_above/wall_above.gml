/// ----------------------
function wall_above(){

return collision_rectangle(
bbox_left, bbox_top - 1, bbox_right, bbox_top - 1, oWall, false, true)

}