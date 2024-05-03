extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0
@onready var player_animtion = $PlayerAnimtion


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# 添加重力
	if not is_on_floor():
		velocity.y += gravity * delta

	#按一下用这个
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	
#默认是0 1 或 -1
	var direction = Input.get_axis("move_left","move_right")
	if direction > 0:
		player_animtion.flip_h = false
	elif direction < 0:
		player_animtion.flip_h = true
	
	#播放动画 is_on_floor检测地面
	if is_on_floor():
		if direction == 0:
			player_animtion.play("idel")
		else:
			player_animtion.play("run")
	else:
		player_animtion.play("jump")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		

	move_and_slide()
