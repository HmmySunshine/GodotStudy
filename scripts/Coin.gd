extends Area2D
@onready var game_manager = %GameManager
#@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var animation_player = $AnimationPlayer

#@onready var pick_up_sound = $PickUpSound


func _on_body_entered(body):
	game_manager.add_point()
	animation_player.play("pick_up")
	#remove_child(animated_sprite_2d)
	#pick_up_sound.play()
	
	
#func _on_body_exited(body):
	#queue_free()
