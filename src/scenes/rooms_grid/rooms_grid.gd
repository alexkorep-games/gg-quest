tool
extends Node2D

# Grid step sizes
export var x_step: int = 512
export var y_step: int = 760

# Grid color
export var grid_color: Color = Color(1, 0, 0, 1)

# The size of the grid to draw
export var grid_width: int = 30
export var grid_height: int = 30
export var line_width = 40

func _draw():

	var start_x = -grid_width*x_step
	var start_y = -grid_height*y_step
	var end_x = grid_width*x_step
	var end_y = grid_height*y_step
	
	# Draw vertical lines within the visible viewport
	for i in range(start_x, end_x, x_step):
		draw_line(Vector2(i, start_y), Vector2(i, end_y), grid_color, line_width)
	
	# Draw horizontal lines within the visible viewport
	for j in range(start_y, end_y, y_step):
		draw_line(Vector2(start_x, j), Vector2(end_x, j), grid_color, line_width)

func _ready():
	# Ensure the grid is drawn in the editor
	update()

func _process(_delta):
	# Redraw if properties change in the editor
	update()
