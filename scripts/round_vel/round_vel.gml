/// ----------------------
/// Round the xvel/yvel while keeping track of fractions
function round_vel(){

xvel_fract += xvel;					// add xvel to the fract
xvel_int    = round(xvel_fract);	// set int as the rounded num of fract
xvel_fract -= xvel_int;				// substract int from the fract

yvel_fract += yvel;
yvel_int    = round(yvel_fract);	// Use yvel_int here
yvel_fract -= yvel_int;				// and here

}