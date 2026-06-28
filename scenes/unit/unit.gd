@tool
class_name Unit
extends Area2D

@export var stats: UnitStats: set = set_stats

@onready var skin: Sprite2D = $Skin
@onready var health_bar: ProgressBar = $HealthProgressBar
@onready var mana_bar: ProgressBar = $ManaProgressBar

func set_stats(value: UnitStats) -> void:
	stats = value

	if value == null:
		return
	
	if not is_node_ready():
		await ready

	# select the skin using coordinates from the spreadsheet
	skin.region_rect.position = Vector2(stats.skin_coordinates) * Arena.CELL_SIZE
