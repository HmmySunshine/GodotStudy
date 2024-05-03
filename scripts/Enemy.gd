extends Node2D
@onready var ray_cast_left = $RayCastLeft
@onready var ray_cast_right = $RayCastRight
@onready var enemy_animation = $EnemyAnimation

const SPEED = 60
var dirction = 1
func _process(delta):
	if ray_cast_right.is_colliding():
		dirction = -1
		enemy_animation.flip_h = true
	if ray_cast_left.is_colliding():
		dirction = 1
		enemy_animation.flip_h = false
	
	position.x += delta * SPEED * dirction
	
