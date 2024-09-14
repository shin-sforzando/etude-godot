extends Node2D

var enemy: Enemy = null
var enemy_entered_count := 0


func _on_area_2d_area_entered(area: Area2D) -> void:
	enemy_entered_count += 1
	$StateChart.set_expression_property("enemy_entered_count", enemy_entered_count)
	$StateChart.send_event("enemy_entered")
	enemy = area.get_parent()


func _on_area_2d_area_exited(area: Area2D) -> void:
	$StateChart.send_event("enemy_exited")


func _on_observing_state_processing(_delta: float) -> void:
	look_at(enemy.global_position)


func _on_idle_state_entered() -> void:
	rotation_degrees = -90
	enemy = null


func _on_berserk_state_entered() -> void:
	$Icon.modulate = Color.RED


func _on_normal_state_entered() -> void:
	$Icon.modulate = Color.WHITE
	enemy_entered_count = 0
	$StateChart.set_expression_property("enemy_entered_count", enemy_entered_count)
