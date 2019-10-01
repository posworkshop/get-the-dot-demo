extends KinematicBody2D

const FLOOR_NORMAL = Vector2(0, -1)
const SPEED = 350
const JUMP_HEIGHT = -500
const GRAVITY = 15

var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity.x = 0
	velocity.y += GRAVITY

	if is_on_floor():
		velocity.y = 0
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
	if Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
	if Input.is_action_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_HEIGHT
		
	move_and_slide(velocity, FLOOR_NORMAL)
	
func reset_velocity():
	velocity = Vector2(0, 0)