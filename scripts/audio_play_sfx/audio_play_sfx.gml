/// @func audio_play_sfx(sound, [stop_sound],[pitch_var])
function audio_play_sfx(){

// Apply default arguments
var _sfx = argument[0]
var _stop = -1
var _pvar = 0

// Override variable number default arguments
switch (argument_count)
{
	case 3: _pvar = argument[2];
	case 2: _stop = argument[1];
}

var p = random_range(-_pvar, _pvar)

if _stop != -1 audio_stop_sound(_stop)
var _s = audio_play_sound(_sfx, 0, 0)
audio_sound_pitch(_s, 1 +p)

return _s

}