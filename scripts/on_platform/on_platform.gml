/// ----------------------
function on_platform(){

if yvel <0
	return noone

var pl_ds = ds_list_create(),
pl_ds_size = collision_rectangle_list(
bbox_left, bbox_bottom, bbox_right, bbox_bottom+1
, oPlatform, false, true, pl_ds, false)

for (var i=0; i <pl_ds_size; i++){
	
	var pl = collision_rectangle(
	bbox_left, bbox_bottom + 1, bbox_right, bbox_bottom + 1, pl_ds[| i], false, true)

	if !pl
		continue

	var inside_platform = collision_rectangle(
	bbox_left, bbox_bottom, bbox_right, bbox_bottom, pl_ds[| i], false, true)

	if !inside_platform{
		return pl
		exit;
	}
}

ds_list_clear(pl_ds);
ds_list_destroy(pl_ds);
return noone;

}