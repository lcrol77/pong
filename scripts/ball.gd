extends Node2D

@export var start_speed = 500
var _speed = start_speed
@onready var _initial_pos = position
var direction = Vector2.DOWN

# Called every frame. 'delta' is the elapsed time  since the previous frame.
func _process(delta):
	_speed += delta * 2
	position += _speed * direction * delta

func _on_body_entered(body):
	if body.name == "Walls" || body.name == "Ceiling":
		var normal: Vector2
		if body.name == "Walls":
			var midpoint:= Vector2(get_viewport_rect().size.x/2, get_viewport_rect().size.y/2)
			var pos_to_midpoint = position.direction_to(midpoint)
			if abs(pos_to_midpoint.x) > abs(pos_to_midpoint.y):
				if pos_to_midpoint.x < 0: normal = Vector2(-1,0)
				else: normal = Vector2(1,0)
		else:
			normal = Vector2(0,1)
	
		self.direction = self.direction.bounce(normal)
		
