extends Spatial

class_name CharacterRagdoll

var ragdoll_skel : Skeleton

func _ready() -> void:
	ragdoll_skel = get_child(0).get_node("Skeleton")
	

func go_soft() -> void:
	ragdoll_skel.physical_bones_start_simulation()

#returns true if a physbone was found and successfully pushed
func push_physbone(boneName: String, appliedImpulse: Vector3) -> bool:
	var pushedBone : PhysicalBone = ragdoll_skel.get_node(boneName)
	
	if(pushedBone != null):
		pushedBone.apply_central_impulse(appliedImpulse)
		return true
	
	return false
