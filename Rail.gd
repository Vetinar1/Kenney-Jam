extends StaticBody2D

export var is_rail : bool = false
export var blue : bool = false

var points
onready var outline = Color(255, 255, 255)

func _ready():
	points = $Path2D.curve.tessellate()
	var polygon = Polygon2D.new()
	var collpol = CollisionPolygon2D.new()
	
	polygon.position += $Path2D.position
	collpol.position += $Path2D.position
	polygon.polygon = points
	collpol.polygon = points
	
	if is_rail:
		add_to_group("rails")
		
		if blue:
			outline = Color(0, 0, 200)
		else:
			outline = Color(200, 200, 0)

	#add_child(polygon)
	add_child(collpol)
	

func _draw():
	for i in range(1, len(points)):
		draw_line(points[i-1] + $Path2D.position, points[i] + $Path2D.position, outline, 0.1, true)


