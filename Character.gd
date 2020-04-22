extends Spatial

class_name Character

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal became_ragdoll(character, forceVector, hitBoneName)


# Called when the node enters the scene tree for the first time.
func _ready():
	var foundHittables : int = 0
	#find our damage receivers
	#the object with the skeleton must always be the first one
	#(and the skeleton its first child)
	var skeleton : Skeleton = get_child(0).get_node("Skeleton")
	for node in skeleton.get_children():
		if node as BoneAttachment != null:
			for boneChild in node.get_children():
				if boneChild as DamageReceiverBody != null:
					(boneChild as DamageReceiverBody).connect("hit", self, "_on_hit")
					foundHittables += 1
			
	print("got " + (foundHittables as String) + " hittables")
	
func _on_hit(damage: float, forceVector: Vector3, hitBoneName: String) -> void:
	print("HIT ON " + hitBoneName + " FOR " + (damage as String) + " DAMAGE")
	emit_signal("became_ragdoll", self, forceVector, hitBoneName)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
