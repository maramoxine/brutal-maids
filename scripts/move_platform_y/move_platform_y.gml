 /// ----------------------
function move_platform_y(){

var _yvel	= argument[0]
var _ydir	= sign(_yvel)
var _ow		= one_way

repeat(abs(_yvel))
{
    if coll_y(_ydir)
        return false
	
	var instances_ds = ds_list_create()
	
	
    if _ydir // go down
    {
		if !_ow
			var num_found = coll_y_list( _ydir, instances_ds, oEntity) // below
		
		if !_ow
		for (var i = 0; i <num_found; i++){
			var instance_to_move = instances_ds[| i]
			if false == move_y( _ydir, instance_to_move){
				//ds_list_destroy(instances_ds)
				with (instance_to_move) instance_destroy()
			}
		}
		
		ds_list_clear(instances_ds)
		num_found = coll_y_list( -1, instances_ds, oEntity) // on top
		
		instance_deactivate_object(self)
		for (var i = 0; i <num_found; i++){
			var instance_to_move = instances_ds[| i]
			if !_ow or (be_on_top(instance_to_move))
				move_y( _ydir, instance_to_move){
			}
		}
		instance_activate_object(self) 
		
	}
	if !_ydir{ // go up (on top)
		
		var num_found = coll_y_list( _ydir, instances_ds, oEntity) //
		
		for (var i = 0; i <num_found; i++){
			var instance_to_move = instances_ds[| i]
			if !_ow or (be_on_top(instance_to_move))
				if false == move_y( _ydir, instance_to_move){
					//ds_list_destroy(instances_ds)
					if !_ow with (instance_to_move) instance_destroy();
					//else move_y(1, instance_to_move)
				}
		}
		
	}
	
	ds_list_clear(instances_ds)
	ds_list_destroy(instances_ds)

    y += _ydir
}

return true
}