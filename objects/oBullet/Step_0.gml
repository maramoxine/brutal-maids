/// @description

if (!active)
{
	active = true
	xvel = lengthdir_x(move_spd, move_dir)
	yvel = lengthdir_y(move_spd, move_dir)
	xvel_fract = 0.0
	yvel_fract = 0.0
}

timer --
if !timer die;

var en_ = instance_place(x +xvel, y +yvel, oEnemy)

if (en_){
	ent_enemyDamage(en_, sign(xvel)* (en_.grounded? 0.2: 0.4) , sign(yvel) *0.4, 1, 3, 6)
	audio_stop_sound(aSfxWeakHit1) 
	audio_play_sound(aSfxWeakHit1, 0, 0)
	die;
}

var dest = function()
{
	instance_destroy()
	audio_play_sfx(aSfxPlayerCrouch)
	part_particles_create(global.fx, x, y, global.fxWalk, 2)
}

ent_postState(false,0, 0, dest)