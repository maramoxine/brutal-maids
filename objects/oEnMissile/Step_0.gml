/// @description Insert description here
// You can write your code in this editor

if !active{
	active = true;
	if instance_exists(oPlayer)
		target = oPlayer
	else{
		die;
		exit;
	}
	vox = audio_play_sound(aSfxRocketLp, 0, 1)
	audio_sound_gain(vox, 0.5, 0)
}
var sfxvel = point_distance(x, y, x+xvel, y+yvel) /4
audio_sound_pitch(vox, 0.5 +(sfxvel *2))

var _mdir = point_direction(x, y, oPlayer.x ,oPlayer.y);
move_dir = angle_lerp(move_dir, _mdir, 0.3, 360)

var max_x = lengthdir_x(4, move_dir)
var max_y = lengthdir_y(4, move_dir)

var am = 0.1
xvel = approach(xvel, max_x, abs(lengthdir_x(am, move_dir)))
yvel = approach(yvel, max_y, abs(lengthdir_y(am, move_dir)))

var _pl = instance_place(x, y, oPlayer)
if (_pl && _pl.can_hurt){
	
	_pl.state_prev = -1
	_pl.state_current = playerStateHurt;
	
	if _pl.grounded{
		_pl.xvel = sign(round(xvel /3)) *2
		_pl.yvel = -2
	}
	else{
		_pl.xvel = xvel
		_pl.yvel = yvel
	}
	die;
}

if (!hp) die;


var px = -lengthdir_x(12, move_dir)
var py = -lengthdir_y(12, move_dir)
part_particles_create(global.fx2, x +px +xvel, y +py +yvel, global.fxRocketSmoke, 1)

ent_postState(0, 0, 0, 0)