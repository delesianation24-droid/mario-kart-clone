extends KinematicBody2D

# Declare member variables here. Examples:
var speed = 200
var jump_force = -400
var gravity = 1000
var velocity = Vector2()

func _physics_process(delta):
    # Apply gravity
    velocity.y += gravity * delta
    
    # Handle movement
    var direction = Vector2()
    if Input.is_action_pressed("ui_right"):
        direction.x += 1
    if Input.is_action_pressed("ui_left"):
        direction.x -= 1
    
    if direction != Vector2():
        direction = direction.normalized()
        velocity.x = direction.x * speed
    else:
        velocity.x = 0
    
    # Move the player
    velocity = move_and_slide(velocity)

    # Handle jump
    if Input.is_action_just_pressed("ui_up") and is_on_floor():
        velocity.y = jump_force
