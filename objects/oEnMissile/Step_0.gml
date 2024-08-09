/// @description Insert description here
// You can write your code in this editor

if !active{
	active = true;
	target = oPlayer
	vox = audio_play_sound(aSfxRocketLp, 0, 1)
	audio_sound_gain(vox, 0.5, 0)
}

grounded = on_ground(0)

if (!instance_exists(target)) state_current = enemyState.idle
ent_state_machine();

switch(state_current){
	case enemyState.free:
		if state_is_new{
			state_is_new = !state_is_new	
		}
		var sfxvel = point_distance(x, y, x+xvel, y+yvel) /4
		audio_sound_pitch(vox, 0.5 +(sfxvel *2))

		var _mdir = point_direction(x, y, oPlayer.x ,oPlayer.y);
		move_dir = angle_lerp(move_dir, _mdir, 1, 8.5)

		var max_spd = move_spd
		var max_x = lengthdir_x(max_spd, move_dir)
		var max_y = lengthdir_y(max_spd, move_dir)

		var am = 0.1
		xvel = approach(xvel, max_x, abs(lengthdir_x(am, move_dir)))
		yvel = approach(yvel, max_y, abs(lengthdir_y(am, move_dir)))
		
		if (tick_mode){
			if (timer) timer--;
			else instance_destroy();
		}
		else if (point_distance(x, y, oPlayer.x, oPlayer.y) <=32)
			tick_mode = 1;
		
		var _ins = instance_place(x, y, object_index)
		if (_ins){
			var dr = point_direction(x, y, _ins.x, _ins.y)
			_ins.xvel += lengthdir_x(0.25, dr)
			_ins.yvel += lengthdir_y(0.25, dr)
		}
		
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
			instance_destroy();
		}
	break;
	case enemyState.idle:
		if state_is_new{
			audio_stop_sound(vox);
			state_is_new = !state_is_new	
			xvel *= 0.3
			yvel *= 0.3
		}
		
		instance_destroy();
	break;
}

if (!hp) instance_destroy();

//var mvd_ =move_dir
//var px = -lengthdir_x(8, mvd_)
//var py = -lengthdir_y(8, mvd_)
//part_particles_create(global.fx2, x +px +xvel +(random_range(-2, 2))
//, y +py +yvel +(random_range(-2, 2)), global.fxFirePart, 1)

ent_postState(0, 0, 0, 0)