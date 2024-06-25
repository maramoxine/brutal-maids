/// @description

if (!active)
{
	active = true
	xvel += lengthdir_x(move_spd, move_dir)
	yvel += lengthdir_y(move_spd, move_dir)
	xvel_fract = 0.0
	yvel_fract = 0.0
}

mask_index = sEntitySmall
var en_ = instance_place(x +xvel, y +yvel, oEnemy)
if (en_){
	var x_ = en_.xvel
	var y_ = en_.yvel
	en_.hp -= 1
	ent_enemyDamage(en_,
	x_ , en_.grounded? 0 : y_ 
	, 5, 4)
	
	audio_stop_sound(aSfxWeakBullet1) 
	audio_stop_sound(aSfxShootSmg)
	audio_play_sound(aSfxWeakBullet1, 0, 0)
	die
}
mask_index = sEntityBullet

timer --;
if !timer
{
	die;
	part_particles_create(global.fx, x, y, global.fxWalk, 1)
	exit
}

entity_loop()

var dest = function(){
	if argument[0] && abs(xvel) <= 1.5 exit
	if !argument[0] && abs(yvel) <= 1.5 exit
	die;
	audio_play_sfx(aSfxBulletRicochet, aSfxBulletRicochet, 0.05)
	
	var fx = instance_create_depth(x, y, -1, oFxPart)
	if wall_on_side() fx.draw_dir = 0
	if !wall_on_side() fx.draw_dir = 180
	if wall_above() fx.draw_dir = 90
	if on_ground() fx.draw_dir = 270
	with fx{
		xvel = 0.;
		yvel = 0.;
		grav = 0.;
		image_speed = 1
		sprite_index = sFxBulletDestroy
		timer = 6
		fade = 0
	}
}

ent_postState(0, 0, dest)