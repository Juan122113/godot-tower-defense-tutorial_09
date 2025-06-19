extends Node3D

#const base_settings = preload("res://resources/base_settings.tres")
@export var base_settings:BaseSettings
#@onready var enemy_area_3d: Area3D = $Path3D/PathFollow3D/Area3D
#@onready var enemy_01: Enemy = $"."
@onready var progress_bar:ProgressBar = $towerSquare_bottomA/SubViewport/ProgressBar
#@onready var enemy_01: Enemy = $"."
#@onready var area_3d: EnemyArea3d = $Path3D/PathFollow3D/Area3D

var base_health:float
#func _on_area_3d_area_entered(area: Area3D) -> void:
	#if area is Enemy:
		#base_settings.health -= area.damage
		
func _ready():
#	print("Ready")
	base_health = base_settings.health
	progress_bar.max_value = base_health
	progress_bar.value = base_health


func _process(delta: float) -> void:
	_on_base_destruction()

#func _on_area_3d_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	#if body is Enemy:
		#print("Colisionó")
		#base_health -= body.damage
		#progress_bar.value = base_health
#
#
#func _on_area_3d_body_entered(body: Node3D) -> void:
	#if body is Node3D:
		#print("Colisionó")
		#base_health -= body.damage
		#progress_bar.value = base_health


#func _on_area_3d_area_entered(area: Area3D) -> void:
	#if area is Area3D:
	#print(area, "Colisionó")
	#base_health -= area.enemy_01.damage
	#progress_bar.value = base_health


func _on_base_area_area_entered(area: Area3D) -> void:
	print(area, "Colisionó")
	base_health -= area.enemy_settings.damage
	progress_bar.value = base_health
	

func _on_base_destruction():
	if base_health <= 0:
		$towerSquare_bottomA.visible = false
