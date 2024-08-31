extends Area2D

@export var move_speed: int =  500
var normal := Vector2(0,-1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var input = Input.get_action_strength("right") - Input.get_action_strength("left")
	position.x = clamp(position.x + input * move_speed * delta, 16, get_viewport_rect().size.x - 16)

func _on_area_entered(area):
	if area.name == "Ball":
		var off_set = (area.position - position).normalized()
		print(off_set)
		
		# TODO: improve 
		area.direction = Vector2(off_set.x * 2, -area.direction.y).normalized()
