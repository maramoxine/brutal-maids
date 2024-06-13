if !instance_exists(oSetup) instance_create_depth(0, 0, 0, oSetup)

if !STAGEST room_goto(arenatest)
instance_create_depth(0, 0, 0, oMenuSelectStage)