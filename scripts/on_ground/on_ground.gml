/// ----------------------
//return instance_id of the colliding ground object or noone if not colliding
function on_ground(){
/// @arg [platforms]

var do_pl = true
if argument_count do_pl = argument[0];

return on_wall() || on_slope() || (on_platform() && do_pl)
// first checks for a wall, then for a slope and at the end for a platform
}