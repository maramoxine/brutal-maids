/// @description 

part_fr = layer_create(-10, "part_fr");
global.fx = part_system_create_layer("part_fr", false)

part_bck = layer_create(10, "part_bck")
global.fx2 = part_system_create_layer("part_bck", false)

global.fxRocketSmoke = part_type_create()
part_type_life(global.fxRocketSmoke, 25, 25)
part_type_sprite(global.fxRocketSmoke, sFxRocketSmoke, 1, 1, 0)
part_type_direction(global.fxRocketSmoke, 0, 360, 0, 15)
part_type_speed(global.fxRocketSmoke, 0.1, 2, -0.1, 0)

global.fxLand = part_type_create()
part_type_life(global.fxLand, 25, 25)
part_type_sprite(global.fxLand, sFxLand, 1, 1, 0)

global.fxWalk = part_type_create()
part_type_life(global.fxWalk, 24, 24)
part_type_sprite(global.fxWalk, sFxWalkPart, 1, 1, 0)

global.fxWood1 = part_type_create()
part_type_life(global.fxWood1, 60 *3, 60 *3)
part_type_sprite(global.fxWood1, sFxWoodSmall, 1, 0, 0)
part_type_direction(global.fxWood1, 45, 135, 0, 0)
part_type_speed(global.fxWood1, 1, 3, 0, 0) 
part_type_gravity(global.fxWood1, 0.1, 270) 

global.fxExplosionSm = part_type_create()
part_type_life(global.fxExplosionSm, 32, 32)
part_type_sprite(global.fxExplosionSm, sFxExplosionSmall, 1, 1, 0)

global.fxEnemyDie = part_type_create()
part_type_life(global.fxEnemyDie, 24, 24)
part_type_sprite(global.fxEnemyDie, sFxEnemyDie, 1, 1, 0)

global.fxFirePart = part_type_create()
part_type_life(global.fxFirePart, 24, 24)
part_type_sprite(global.fxFirePart, sFxFirePart, 1, 1, 0)