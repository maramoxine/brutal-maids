/// @description

target = oPlayer

if !view_enabled{
	view_set_wport(0, global.gameWidth)
	view_set_hport(0, global.gameHeight)
	view_set_visible(0, true)
	camera_set_view_size(cam ,global.gameWidth, global.gameHeight)
	view_camera[0] = cam
	view_enabled = true
}