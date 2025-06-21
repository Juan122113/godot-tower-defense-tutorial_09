extends Node3D

#const base_settings = preload("res://resources/base_settings.tres")
@export var base_settings:BaseSettings
#@onready var enemy_area_3d: Area3D = $Path3D/PathFollow3D/Area3D
#@onready var enemy_01: Enemy = $"."
@onready var progress_bar:ProgressBar = $towerSquare_bottomA/SubViewport/ProgressBar
#@onready var enemy_01: Enemy = $"."
#@onready var area_3d: EnemyArea3d = $Path3D/PathFollow3D/Area3D

var base_health:float

		
func _ready():
#	print("Ready")
	base_health = base_settings.health
	progress_bar.max_value = base_health
	progress_bar.value = base_health


func _process(delta: float) -> void:
	_on_base_destruction()


func _on_base_area_area_entered(area: Area3D) -> void:
	#print(area, "Colisionó")
	base_health -= area.enemy_settings.damage
	progress_bar.value = base_health
	

func _on_base_destruction():
	if base_health <= 0:
		#$towerSquare_bottomA.visible = false
		$Explosion.emitting = true
		$Smoke.emitting = true
		$ExplosionAudio.play()
