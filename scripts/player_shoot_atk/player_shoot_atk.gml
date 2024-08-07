/// ----------------------
function pl_shoot(){
	var yax = grounded? min(yaxis, 0): yaxis
	var xax = (abs(xaxis))? xaxis : side_dir
	if (atk_buffer) atk_buffer --;
	if !atk_buffer && !kalt
		atk_dir = (kdown && !grounded)? 270 : (kup? 90: (side_dir? 0 : 180));
	
	var gx = lengthdir_x(16, atk_dir);	
	var gy = lengthdir_y(16, atk_dir);
	var aim_spread = 19. /2.;
	
	if (kattackdw && !atk_buffer && ammo)
	{
		var bul = instance_create_depth(x ,y , -1, oBullet)
		move_x(gx, 1, bul)
		move_y(gy, bul)
		var f_sdir = atk_dir +random_range(-aim_spread, aim_spread)
		bul.move_dir = f_sdir
		bul.xvel = xvel /(move_spd)
		
		ammo -= 1;
		
		var fx = instance_create_depth(bul.x, bul.y, depth -1, oFxPart)
		fx.draw_dir = f_sdir
		with fx{
			xvel = 0.;
			yvel = 0.;
			grav = 0.;
			image_speed = 1.;
			sprite_index = sFxBulletShoot
			timer = 4.;
			fade = 0.
		}
		
		atk_fx = 1.6;
		atk_buffer = atk_buffer_max;
		audio_play_sfx(aSfxShootSmg, -1, 0.07)
		//switch(round(atk_dir /90))
		//{
		//	default:

		//	break;
		//	case 1: 
		//	break;
		//	case 3:
		//	break;
		//}
	}	
}