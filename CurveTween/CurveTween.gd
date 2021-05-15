extends Tween
class_name CurveTween

signal curve_tween(sat)

export var curve : Curve

var start := 0.0
var end := 1.0

#takes three parameters:
#	how long to interpolate for
#	the starting value
#	the ending value
#interpolation begins immediately
#interpolation follows the curve provided
func play(duration := 1.0, start_in := 0.0, end_in := 1.0) -> void:
	assert(curve, "this CurveTween needs a curve added in the inspector")
	start = start_in
	end = end_in
	interpolate_method(self, "interp", 0.0, 1.0, duration)
	start()
	
func interp(sat: float) -> void:
	emit_signal("curve_tween", start + ((end - start) * curve.interpolate(sat)))
