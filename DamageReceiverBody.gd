extends KinematicBody

class_name DamageReceiverBody



signal hit(damage, forceVector, hitBoneName)

func emit_hit(damage : float, forceVector : Vector3, hitBoneName : String) -> void:
	emit_signal("hit", damage, forceVector, hitBoneName)

