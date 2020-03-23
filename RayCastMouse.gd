extends Camera


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var space : PhysicsDirectSpaceState

var mousePos : Vector2

var viewport : Viewport

const RAY_LENGTH : float = 100000.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	viewport = get_viewport()

func _physics_process(_delta : float) -> void:
	if(Input.is_action_just_pressed("ray_test")):
		mousePos = viewport.get_mouse_position()
		print("mousePos: " + mousePos as String)
		
		space = get_world().direct_space_state
		var origin : Vector3 = project_ray_origin(mousePos)
		print("ray origin: " + origin as String)
		var dest : Vector3 = project_ray_normal(mousePos) * RAY_LENGTH
		print("ray dest: " + dest as String)
		var raycast : Dictionary = space.intersect_ray(origin, dest)
		if(!raycast.empty()):
			print("hit! name: " + raycast["collider"].name)
		else:
			print("no hit!")

