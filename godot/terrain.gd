# Gets the height at the given floating-point cell position.
# This height is raw and doesn't account for scaling of the terrain node.
# This function is relatively slow due to locking, so don't use it to fetch large areas
func get_interpolated_height_at(pos: Vector3) -> float:
	# Height data must be loaded in RAM
	var im := get_image(CHANNEL_HEIGHT)
	assert(im != null)

	# The function takes a Vector3 for convenience so it's easier to use in 3D scripting
	var x0 := int(floor(pos.x))
	var y0 := int(floor(pos.z))

	var xf := pos.x - x0
	var yf := pos.z - y0

	im.lock()
	var h00 = HT_Util.get_pixel_clamped(im, x0, y0).r
	var h10 = HT_Util.get_pixel_clamped(im, x0 + 1, y0).r
	var h01 = HT_Util.get_pixel_clamped(im, x0, y0 + 1).r
	var h11 = HT_Util.get_pixel_clamped(im, x0 + 1, y0 + 1).r
	im.unlock()

	# Bilinear filter
	var h = lerp(lerp(h00, h10, xf), lerp(h01, h11, xf), yf)

	return h;
