/// @description 

event_inherited()
grav		= 0.;
move_dir	= 0
move_spd	= 1.2
move_acc	= 0.1

can_hurt	= false

mask_index = sEntityBigNRound
jump_an = 0
sprite_current = sprite_index

balloon_hit = function(){
	image_index	= 0.
	jump_an		= 1.
	audio_play_sfx(aSfxTrampoline, aSfxTrampoline, 0.1)
}