/// @description

if (!active){
	xvel = lengthdir_x(move_spd, move_dir)
	yvel = lengthdir_y(move_spd, move_dir)
	
	active = 1
}

var _pl = instance_place(x, y, oPlayer)
if (_pl && _pl.can_hurt){
	
	_pl.state_prev = -1
	_pl.state_current = playerStateHurt;
	_pl.xvel = sign(round(xvel /3)) *2
	_pl.yvel = -2

	die;
}

if (timer) timer--;
else die;

var dest = function(){
	die;
	audio_play_sfx(aSfxBulletRicochet, aSfxBulletRicochet, 0.1)
}

ent_postState(0, 0, dest, 0)