/// ----------------------
function move_platform_x(){

var _xvel	 = argument[0]
var _xdir	 = sign(_xvel)
var _oway	 = one_way

repeat(abs(_xvel))
{
    // Colliding with solid
    if coll_x(_xdir)
        return false
    
	
	var instances_ds = ds_list_create()// create ds list
	
	// empujar monos
	if !_oway
	var num_found = coll_x_list(_xdir, instances_ds, oEntity)// look for entities
	
	if !_oway
	for( var i = 0; i < num_found; i++){
		var instance_to_move = instances_ds[| i]
			if false == move_x(_xdir, true, instance_to_move){
				//ds_list_destroy(instances_ds)
				with instance_to_move instance_destroy()
			}		
	}
	
	ds_list_clear(instances_ds)
	
	// mover monos arriba
	num_found = coll_y_list(-1, instances_ds, oEntity)
	
	for( var i=0; i < num_found; i++){
		var instance_to_move = instances_ds[| i]
		if !_oway or (be_on_top(instance_to_move, true))
			move_x(_xdir, true, instance_to_move)
	}
	
	ds_list_clear(instances_ds)
	ds_list_destroy(instances_ds)

    // Finally move
    x += _xdir
}

return true
}