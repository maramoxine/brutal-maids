function approach(){
// Moves "a" towards "b" by "amount" and returns the result
 
	if (argument[0] < argument[1])
	{
	    argument[0] += argument[2];
	    if (argument[0] > argument[1])
	        return argument[1];
	}
	else
	{
	    argument[0] -= argument[2];
	    if (argument[0] < argument[1])
	        return argument[1];
	}
return argument[0];
}