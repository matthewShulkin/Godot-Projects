extends KinematicBody2D

var direction = Vector2.RIGHT
var velocity = Vector2.ZERO

onready var ledgeCheckRight = $LedgeCheckRight
onready var ledgeCheckLeft = $LedgeCheckLeft
onready var sprite = $AnimatedSprite

func _physics_process(delta):	
	var found_wall = is_on_wall() # this checks if were touching a wall and uses Vector2.UP to determine whether or not somehthing is a wall
	var found_ledge = not ledgeCheckRight.is_colliding() or not ledgeCheckLeft.is_colliding()
	
	if found_wall or found_ledge:
		direction *= -1 # if touches wall you flip direction
		
	sprite.flip_h = direction.x > 0
		
	velocity = direction * 25
	move_and_slide(velocity, Vector2.UP)
