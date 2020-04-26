extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var rigidGenericus : PackedScene = preload("res://genericus.tscn")
var ragdollGenericus : PackedScene = preload("res://genericus_rag.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		var newGenericus : Character = rigidGenericus.instance()
		add_child(newGenericus)
		newGenericus.connect("became_ragdoll", self,"add_ragdoll_for_char")


func add_ragdoll_for_char(character: Character, hitForce: Vector3, 
hitBoneName: String) -> void:
	var newRagdoll : CharacterRagdoll = ragdollGenericus.instance()
	add_child(newRagdoll)
	newRagdoll.global_transform = character.global_transform
	newRagdoll.go_soft()
	newRagdoll.push_physbone(hitBoneName, hitForce)
	character.queue_free()
