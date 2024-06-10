/// ----------------------
//return instance_id of the colliding ground object or noone if not colliding
function on_ground(){

return on_wall() || on_slope() || on_platform()
// first checks for a wall, then for a slope and at the end for a platform
}