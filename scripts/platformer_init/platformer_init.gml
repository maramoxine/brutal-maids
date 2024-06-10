/// ----------------------
function platformer_init(){
	
xvel		= 0
yvel		= 0
xvel_int	= 0 // Integer x speed
yvel_int	= 0 // Integer y speed
xvel_fract  = 0
yvel_fract  = 0
//bounce_vel	= 0
grounded = false
one_way = false

switch(argument_count){
	case 1: one_way = argument[0];
	}

}