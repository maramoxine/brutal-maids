/// @description Insert description here

event_inherited()
hp = 6.;
move_dir = irandom(359.)
move_spd = 4.;

timer = 60* 1.5;
tick_mode = 0;

target = noone
active = 0;
mask_index = sEntitySmall
image_speed = 0.5;

vox = 0
damage_hit = function(){
	xvel *= 0.9;
	yvel *= 0.9;
	//audio_play_sfx(aSfxEnemySquelch, aSfxEnemySquelch, 0.1)
}