/// ----------------------
//return instance_id of the colliding instance or noone if none found
function on_wall(){

return collision_rectangle(
bbox_left, bbox_bottom + 1, bbox_right, bbox_bottom + 1, oWall, false, true)

}