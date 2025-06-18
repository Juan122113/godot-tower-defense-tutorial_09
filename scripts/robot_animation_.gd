extends AnimationPlayer

func _ready() -> void:
	play("walk")
	
func _process(delta):
		play("walk")
		
func _on_dying_state_entered():
	$AnimationPlayer2.play("die")
