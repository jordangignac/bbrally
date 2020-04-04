extends VehicleBody

export var STEER_SPEED = 1.5
export var MAX_STEER_ANGLE = 0.5
export var MAX_BRAKE_FORCE = 3.0
export var MAX_ENGINE_FORCE = 100.0

func _physics_process(delta):
	var brake_val = 0.0
	var throttle_val = 0.0
	var steer_target = 0.0
	var steer_val = 0.0
	
	if Input.is_action_pressed("ui_down"): brake_val = 1.0
	if Input.is_action_pressed("ui_up"): throttle_val = 1.0
	if Input.is_action_pressed("ui_right"): steer_val = -1.0
	if Input.is_action_pressed("ui_left"): steer_val = 1.0
	
	brake = brake_val * MAX_BRAKE_FORCE
	steer_target = steer_val * MAX_STEER_ANGLE
	engine_force = throttle_val * MAX_ENGINE_FORCE
	steering = move_toward(steering, steer_target, STEER_SPEED * delta)
