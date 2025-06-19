extends ProgressBar

var fill_stylebox: StyleBoxFlat
const health_bar_colors = preload(\
"res://resources/health_bar_colors.tres")

func _ready() -> void:
	fill_stylebox = get_theme_stylebox("fill")

func _on_value_changed(value: float) -> void:
	fill_stylebox.bg_color = \
	health_bar_colors.gradient.sample(value / max_value)
