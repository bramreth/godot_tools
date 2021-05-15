extends Camera2D
class_name JuicyCamera

export var noise: OpenSimplexNoise
export var trauma = 0.0 setget set_trauma

export var max_x := 33
export var max_y := 33
export var max_r := 5

export var time_scale = 20

export(float, 0, 1) var decay = 0.6

var time := 0.0

func set_trauma(trauma_in: float) -> void:
	trauma = clamp(trauma + trauma_in, 0, 1)
	set_process(not is_zero_approx(trauma))

func _process(delta: float) -> void:
	time += delta * time_scale
	var shake = pow(trauma, 2)
	offset.x = noise.get_noise_3d(time, 0, 0) * max_x * shake
	offset.y = noise.get_noise_3d(0, time, 0) * max_y * shake
	rotation_degrees = noise.get_noise_3d(0, 0, time) * max_r * shake
	trauma = clamp(trauma - (delta * decay), 0, 1)
